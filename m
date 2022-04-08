Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp166383lfq;
        Fri, 8 Apr 2022 16:56:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF5cdg9/R7i76WhVXRYr55UFQGN705JprxBW9+5VBb15mHmBb1vR0jYd7XuooNgXCDIMM3
X-Received: by 2002:a05:622a:208:b0:2e1:b3ec:b7ce with SMTP id b8-20020a05622a020800b002e1b3ecb7cemr18355483qtx.345.1649462191649;
        Fri, 08 Apr 2022 16:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649462191; cv=none;
        d=google.com; s=arc-20160816;
        b=bSufoMNxh6OFTK2d2mAgaQL8WPGc7cBcNr2IpjJvRG9e6IDAw/pXgDV1KF9Hd1E2Rw
         iyqEEjBW8yeK5YPbM0hjqkFysbIK4C8qnNpSMKjjOvLdkVP+gsE8Tc90RAypHGkQH+d4
         DOYj13341e7ienCJKzUOKnopz32+6RilaOJhxGDBIqIwg5GsDXmKdzw6B8xfUR7krrP5
         ia+LZN3VjzyMLvTsWtfmesTHm/ePukPTn1W/9AaD90NRupljUcWB0k1n8HQ35iUfgBVU
         /tZ1eUTUHk0W+MZFwLJZfaLns13jejURvmNkhNpCv6Q0wpQmhFpXOYsqGe+LnOWgTnb+
         b8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rvj7yn3E+3Z4gN1K9DYCOb3LutSsLjcM92NczOTDcdw=;
        b=Zj4FXISMfxnsxg7E0D+dj1Oqkba29Sq62YIosdwGhR5fjovbgkSms1Xmbn+526syN7
         +a5H4eAxk9TAwzmjX0dSQR02hLtpX45xaY4UuIWPg6Ek5ttejlWLhRlrT0aLzC5PQ3XR
         1hYPe+rz8GsKsCZqWGJyI5NipOFE5hs5eTdBkODZk+Vsz8SeofHCIH7m9HuQEcH5Hun8
         p0kIAHGuiKMhkiQTHEVfJskGNZEs/s2Ui6azaIFnhya2K7ZPWv4gtnML6X5ljcT11e1/
         YPzBT7lweu81xjl1bkKB3gPn3mAVrgM0pvVEOdlRiZyhJRpqr+cSVFoSLmmMnAWc7AD3
         Q5Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dKOG6y07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a0562140da100b00440ec52a99esi1253061qvh.215.2022.04.08.16.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 16:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dKOG6y07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncySt-0002AZ-5q
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 19:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncySV-000298-6O
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:56:08 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncySP-0001nV-NF
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:56:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id j8so9217338pll.11
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 16:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rvj7yn3E+3Z4gN1K9DYCOb3LutSsLjcM92NczOTDcdw=;
 b=dKOG6y07a7QFSU7JLyuf6sSyMlghRo4fP7JKW9XzzP6GzAsL1GQU1/TLXWCs0zbVtN
 /d7hnnuAIu+wZcL3BgEKeWbsf4FMv1gQ2fBCoZaSznoGqYG7C7YQ51cRVmcLITxC3ms+
 xW40Acyp1qUwrB6sBqnEsERqi+FhntBkgorwha1WyBh0L98hl/yQIGxF2J/kg5ekpNhq
 KqEVpI1u3fm2jSu077XgQhejEYKJjsoiN+xOmqSNTu6fnYx6E9E0N15I3j4g1rnsG6X+
 gx6IXDt48Ls4tUsECqxWqxaBzVXJJaTU2dPCFRnr0IdalomHXVyxzjziVcdOrQTqdfYb
 US1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rvj7yn3E+3Z4gN1K9DYCOb3LutSsLjcM92NczOTDcdw=;
 b=suhX/xl0CxhXDrR0gCgqlICGrR/o16h1Jq3AWtJyjKg4F+ozra63+INl4A/dE0Tmb8
 xfPDagU6MI6iT3AnjomqK/L4CJ3T9heVdO5NQu4Bc+uXC261i1ZDo3ou6ZB/xtOPES05
 lWmV7vJvAzKPaRvSV5Ud3Okc+lTIvV5e0fA9UhXoqYaUcRAoKGx5MHGOchBWdRXCp23+
 aTC7x+jXNQe55yULhn4yWTY6m0b3xqU54r0pdtcNBAhgqC9gh8Ei3yHiPGZdKK+DGD0K
 TAaosMgYspEuWLLMBGImHEUnw42Cqq7caU7ikTTrIsX1pHsL2r30kcssJhmk4Y+QPz26
 mGzg==
X-Gm-Message-State: AOAM530N0uLJE8dOjcCUxif8Yedw/00UmqYZ8CJj+6i/oTz6FdWzxh+n
 t1OXWSAbc37oFNg0xyJLWky5VA==
X-Received: by 2002:a17:903:32c9:b0:154:3a2d:fa89 with SMTP id
 i9-20020a17090332c900b001543a2dfa89mr21493910plr.3.1649462160160; 
 Fri, 08 Apr 2022 16:56:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 me5-20020a17090b17c500b001c63699ff60sm14480641pjb.57.2022.04.08.16.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:55:59 -0700 (PDT)
Message-ID: <a218c739-e6da-ba5f-07f0-5f0a9af4dfad@linaro.org>
Date: Fri, 8 Apr 2022 16:55:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 07/41] hw/intc/arm_gicv3_its: Implement GITS_BASER2 for
 GICv4
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6LENTKIaa/Ba

On 4/8/22 07:15, Peter Maydell wrote:
> The GICv4 defines a new in-guest-memory table for the ITS: this is
> the vPE table.  Implement the new GITS_BASER2 register which the
> guest uses to tell the ITS where the vPE table is located, including
> the decode of the register fields into the TableDesc structure which
> we do for the GITS_BASER<n> when the guest enables the ITS.
> 
> We guard provision of the new register with the its_feature_virtual()
> function, which does a check of the GITS_TYPER.Virtual bit which
> indicates presence of ITS support for virtual LPIs.  Since this bit
> is currently always zero, GICv4-specific features will not be
> accessible to the guest yet.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h               | 16 ++++++++++++++++
>   include/hw/intc/arm_gicv3_its_common.h |  1 +
>   hw/intc/arm_gicv3_its.c                | 25 +++++++++++++++++++++++++
>   3 files changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
