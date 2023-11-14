Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2236282ejc;
        Tue, 14 Nov 2023 10:23:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPqxY8lx/iJD+Cmqs2+1XFcjnlGlTUYjrv8SgIEiNY6CSVrJoxNCy1P/vjblk9aSaUsLhZ
X-Received: by 2002:a05:6102:1494:b0:45e:fe82:1d14 with SMTP id d20-20020a056102149400b0045efe821d14mr13151172vsv.7.1699986235714;
        Tue, 14 Nov 2023 10:23:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699986235; cv=none;
        d=google.com; s=arc-20160816;
        b=g0U7yEyTkMV+XmBhxOL7JxjJL3IsojJi1GPnSFog7MOxLSCXtb+HQFTkxp5nWiSZNx
         ltaMIWQH4tJ2hjmVE34H6QYa4NRPcSyUxSgZyEzqoilVqte2hNal62tJwqqLa2YUYMRA
         CfO4K3cakyi4VnYRemL9vtkeiEexJD/GDOC8WWpmMr+CJSijWSyoA/00+x6+m0PbziDN
         fW2acQQ8z5m2t5ecs2VEPv5liPHOcwqgPFjZipJSbXsJaCjpBHbbrkCtO7NgRyudu5PB
         SKtVH2YL2Btom+daWrHkiUmhDNsSwiaqzBL7yoS9vinh8ngYs95UHKi406OxKVUnbJBf
         ce7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J2aUEChBwPTrdVgaxT76vdc0JWm1I1fUDdabRABMEv8=;
        fh=/cXzrHg26M7SoUk71T8l/XoTaZXk9aSUbSwlwIuslyw=;
        b=ZdWC86P7CZW4TDbXixcKGZzGdGFgAsTkWLrPFaUw6c7E9SyhbDLUL/QdhFMLyK1gp0
         XsoQl6AZva4CdZBYgnLIqmijH9xdA7ZyRVNkiqjTVMNjlAgAM/WSjI3AW6Mbf5sRNksY
         Mong617Xo26oUi5ddX5aUXiU272o2Ov5bHFVNE0Oafh7qWUIx2fCrUCGCrJACTVaCFnP
         Q9bsYHeRDjwAYPVjPiESolKNSJjS277tU3Ksfnkmyzn2tvnAB1Sa8pwH+ix4xzZoWGg4
         rbjV03/PxLjxPbITjCV2TR00SQK2mRwDy/DBzT5pra+xhgYQ65L2ulXBSRiExtye4hT5
         JYjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MIUcN5/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020a0cc601000000b00670b3a8241bsi7052984qvi.350.2023.11.14.10.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 10:23:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MIUcN5/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2y4I-0006VS-6f; Tue, 14 Nov 2023 13:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r2y4H-0006UE-8c
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 13:23:21 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r2y4C-0004MI-G0
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 13:23:21 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ce28faa92dso20213565ad.2
 for <qemu-arm@nongnu.org>; Tue, 14 Nov 2023 10:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699986194; x=1700590994; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J2aUEChBwPTrdVgaxT76vdc0JWm1I1fUDdabRABMEv8=;
 b=MIUcN5/vDQWr0NL3zK8MGRUjb7qeF8YGlAB7mm1jt+2fUFniX8P6OG27Wv1EVaUihW
 QdFaV4ZnIwxjj4QNZMajLqepfABtgum4MCr2GyRL8emjDPBL33/mCxd8aAWNOm/JmXad
 QDxmNfzBLx/q/A+gaRSUestfzC2v57DCSqOG54O4OUdVj1FAlr941aG6aLjGquvEYZo8
 2nGOIph9wfLOpmnqYrVMvrts65vXbSV80tKQMuF67XEFpNKLrpQRICWaAMyb44EVzO+v
 sJymhOtcf2Ir6GIb8wHDSSuxhzWmnjWENHGAAa3eVEpT4Yw+Jk94s2UeU5DbNo5HH7/D
 2TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699986194; x=1700590994;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J2aUEChBwPTrdVgaxT76vdc0JWm1I1fUDdabRABMEv8=;
 b=HHBZ+/SsYbDG0uH9v89O+dad9C0Tv6+xBU8zFYgqN5S6MtiOW/vjZt11Nsa7waGzf9
 rhu2zBz+TO3ufU9tO9ZtA+RW8TXXm/iktEHhuOhLdXmk7/u0k9+pw9PISyD/iVMismzM
 JdSmA27ls+jjzo80ANQoQupUxDAbBftBFNgs1JMDJY01/0h8IVSv8XzvI816f1p4nQOt
 Hx++tugcwvNh43qCF5QidGFWNHxRCIUFH5NXLRtihzhRKv05CTsZ9DubEk70oJXr+SEM
 VHVGtQ05hTX2XIiu40SYpUB3nXKtaoe12baLyHL3YGLfa9J+MYn3xSycK6QivkciexHr
 CwKA==
X-Gm-Message-State: AOJu0YzIohEHas5bBZ7AHAnw1uN2tzYxq8Kiq8wrou4ReEF3Gmipa+2G
 fkmhmd1j0WoRlDVe+F+LVeURPQ==
X-Received: by 2002:a17:902:da8e:b0:1cc:47a6:12bf with SMTP id
 j14-20020a170902da8e00b001cc47a612bfmr3597100plx.47.1699986193681; 
 Tue, 14 Nov 2023 10:23:13 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a1709027d8800b001c74df14e6esm5941297plm.51.2023.11.14.10.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 10:23:13 -0800 (PST)
Message-ID: <f9f9291c-afcb-409c-bf96-ce840f9f36e6@linaro.org>
Date: Tue, 14 Nov 2023 10:23:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/arm: enable FEAT_RNG on Neoverse-N2
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231114103443.1652308-1-marcin.juszkiewicz@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231114103443.1652308-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +WsDdS74sQQI

On 11/14/23 02:34, Marcin Juszkiewicz wrote:
> I noticed that Neoverse-V1 has FEAT_RNG enabled so let enable it also on
> Neoverse-N2.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   target/arm/tcg/cpu64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 08db1dbcc7..fcda99e158 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1018,7 +1018,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>       cpu->isar.id_aa64dfr1  = 0;
>       cpu->id_aa64afr0       = 0;
>       cpu->id_aa64afr1       = 0;
> -    cpu->isar.id_aa64isar0 = 0x0221111110212120ull; /* with Crypto */
> +    cpu->isar.id_aa64isar0 = 0x1221111110212120ull; /* with Crypto and FEAT_RNG */
>       cpu->isar.id_aa64isar1 = 0x0011111101211052ull;
>       cpu->isar.id_aa64mmfr0 = 0x0000022200101125ull;
>       cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
