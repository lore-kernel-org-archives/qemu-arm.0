Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp323795ocg;
        Fri, 7 Oct 2022 02:36:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KS8OrS8mhgwtpaYpiKhxv0Q83SWXdm2TqqV9exWbJBojb+RuEJPXQFHT1oZGj3YhitQ5D
X-Received: by 2002:a05:620a:40cd:b0:6da:7a25:5920 with SMTP id g13-20020a05620a40cd00b006da7a255920mr2914778qko.721.1665135417969;
        Fri, 07 Oct 2022 02:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665135417; cv=none;
        d=google.com; s=arc-20160816;
        b=vIVDi6qcwGIALikyVTjS2i1W3kBZW1zMD7htWHeOReKsRxkoXPYRoenySfqyejW2j8
         5Z/0zhbU796Box/7H6i4BJwDgEoNmaCo08QoM9KxP/J2nvQdhwfz2x9SCeYGr+f9MIiO
         2yTEgxg7Z8Isp+4jYp2EasW+HtG7ebyDEHDpSv2Lz4PufZTrTeuEuyabU7aJVgonRjIV
         Hyy7dMRDlAa1FwpTdoLBkOhzFYZ4MNechXOKBXrTBfcPUSMsMYvkjVFAL8b6IxlgFeyU
         3Cg6t7ZbwOsH7/MH802JGLsJ9BB/aiHC98nXN5k72olSziAR00nb9RfyKedlKKhftIPo
         BKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nFfMQRVrkkZCR1IRInfVRaFJ4kwCPqGUOajdlJilwDc=;
        b=LwEUyRGZwpx6YOt/ARNsmEdfvrIbPnO/JFoTpqAc1hJNi8yDw3/FnxPBBIa1/Oz0Rg
         8L2EmTddOkrmomDPeW9jXZsnsocNEUsQFGruY5SL50zGoy/OFKLXToqMIZNndhOfS+tB
         AIbpWN43cqpe1KeL0+iOt1Bekpjvat3pA3+iAZQvJ5fC+NXTOxtSG4HoXyEIV19r5pTJ
         iJvEvTacKPbNTsgngmB14xdZ+3hu/7+4KfN6PRjPeVUDU+gm5S/N9mV+/HSDgWLypO9y
         C+jOEZUK5iEO9hHhKBj169zr2wMirWrZVK0u/44xWAKHw9+IdPcAJHOLTdM7wNyFoVQ6
         lgWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=duEc54iD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv10-20020ad45cea000000b0049935e615d1si665725qvb.65.2022.10.07.02.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 02:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=duEc54iD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogjmr-0005Pa-Hh
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 05:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjeJ-00014c-TP
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:28:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjeH-0008IA-RG
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:28:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso4272986pjk.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFfMQRVrkkZCR1IRInfVRaFJ4kwCPqGUOajdlJilwDc=;
 b=duEc54iDzMOgqAQbPpZttPa2W0edfy1RTGM2VGnoPYAM2Y+llVCLZRohTwR3Qj4Guw
 Ev8tkUdOQ1yD/BdVfS7MEeib/0OdHHQRL/LbyG/d7RGlefW29AName/tbXr2GTGrd7JL
 LINxQe7B4KZHUAA88PVGcPxzO5uzL7VJWGq6LjM64rwPlxLj7b4of7j46FL44uYs/dQ9
 YzMrWfZcilL0vAe+W5dpBIMGg7qGiuvnmTEidxGQhWF/fN9kJXBSpYL9BXodbNzd3riQ
 yXRQ2HTqn38igeeBIWLbBkjAC2Lm9WbEpeBvU7K/iDRuOlwanUqzXGJNZZ0A3c6nKrED
 czZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFfMQRVrkkZCR1IRInfVRaFJ4kwCPqGUOajdlJilwDc=;
 b=onPVy7ix2QVAcALrpDSxT6BwiGytTTUCK/yggahDeX3114+s6comEt9IPua452UjON
 10Wx2L2GZFzWygYahCibHcGo13F2dIXTdYUmve5OA6trqCS0NGYFB2Z51zt4pmckQaqK
 YvwRSjpoF6Gi0uhlUOE5N3EoR4VBzLhfQcUXdPZLN5NRUrCFW/fmWHg421a/rRIXd+qu
 snxY9hoNQel16wuF3Gt1HDgXl2ZePog08KLUdWsgymNf8sqVROhOiixn0/lHzd2yfntr
 cW28eT+pridG/emEN5sm6XULsi+P+th98a5kwUVvaZELYmAk1xLZ8CsBc7c52bqeZc9o
 /gsQ==
X-Gm-Message-State: ACrzQf3epIdF4jEQ3CWjRG7v8BbqX2Elm7Ce5CTOGQetMJA/sZXBbj/q
 ex8VDRt+kVomwRB81TOmWFH0b3mwEYvsxHys1OJYng==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr3871708plb.60.1665134883950; Fri, 07
 Oct 2022 02:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-34-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:27:52 +0100
Message-ID: <CAFEAcA9cz5MjnH5h_BbtesK+JBeOkUxoMVDNG5jmRaXQmQBfTw@mail.gmail.com>
Subject: Re: [PATCH v3 33/42] target/arm: Split out S1TranslateResult type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TSgS+4oTc9fk

On Sat, 1 Oct 2022 at 17:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Consolidate the results of S1_ptw_translate in one struct.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 70 +++++++++++++++++++++++++-----------------------
>  1 file changed, 36 insertions(+), 34 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 7a77bea2c7..99ad894180 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -220,13 +220,18 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
>      }
>  }
>
> +typedef struct {
> +    bool is_secure;
> +    void *hphys;
> +    hwaddr gphys;
> +} S1TranslateResult;

Ah, I was wondering whether to suggest this for the previous patch
that added the hphys and gphys arguments :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
