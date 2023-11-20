Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2249332ejb;
        Mon, 20 Nov 2023 07:12:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFglx9YuvbBYWjeDN6pB0CWzzGKOiHU6/uMU1xqpiL0IVLn1PxKXDAy4R9IHpzAbehSn0uX
X-Received: by 2002:ac2:5a4e:0:b0:509:55df:61e0 with SMTP id r14-20020ac25a4e000000b0050955df61e0mr5628583lfn.18.1700493138142;
        Mon, 20 Nov 2023 07:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700493138; cv=none;
        d=google.com; s=arc-20160816;
        b=xZsaFUm0zMc7ZQuUtSjijgI34VKbke1GTrUHAH4FTJoSMxZUOS4A5qXye7GGAIINQR
         4ZsehcSo6evuFwVc1bMow+3UFlRxLMoqrM5i6R5hLd6L/LAxrLebiS9ZKWydzZ9HKqoN
         MSGUYDgqjb+d44MHHZB8KqB1B3q6SDUpNC4h7Ufl117DTqbnJiEF+zqpefksudIxvHcY
         tX1kS/jx8vPpkR8J+jJ42+/8AxNlSdHw0J8fgLuvyWxQq1pJDFaURx9nTdRa91/mkeoU
         axxaUsyhCQ/1run1JKW2F7oGTSpK2c+TxkIgwpnDZli0Jgzq7EM7KeC+NrrzjGGyUH98
         a4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BJkZtwx9gdYhkGl+klhmyKqVkxegZSBtdMc5DAI2KV8=;
        fh=N2m04sop7F2/wWbXcp8rGL31piRAC0FgAo9yDOjXW30=;
        b=iGDDWLr7OLfgVsjR4f7neo/RwwcYQMpl/JS7rDnJspiE5JomivDmfB/N+Vuft0Zxyy
         zr1cdOqH75YW1xNp6x0DSaYC9aA/IXzS18+h2Litao19LagKO6cj2ZmrlBYLZRzmbYIW
         8f4iu/2jsF/F33LlfU7WNS73D+iCKT1pX2bBYIrh0fVg44Qoc6V192Bm74IB/bhFNTme
         g1OJOvgjHJu8ct3p+UJGbCJrZvg+YwlOeYMQ4Gv1+JV6nhXiHxQTKDR+oxkeldrsXHWt
         jzzmsY7bDAZktxZ5S9rOK3EVCfWHEQvnLl8IXEilS1Cy+F7kuK4CNJm+zQRTO1KbeTuC
         6DoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWDrAKc4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm12-20020a0560000bcc00b0032d9a172a74si4946065wrb.926.2023.11.20.07.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 07:12:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWDrAKc4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r55ul-00083F-OG; Mon, 20 Nov 2023 10:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r55uf-0007sl-Qm
 for qemu-devel@nongnu.org; Mon, 20 Nov 2023 10:10:14 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r55ud-0001qQ-9V
 for qemu-devel@nongnu.org; Mon, 20 Nov 2023 10:10:12 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-548f0b7ab9eso64533a12.3
 for <qemu-devel@nongnu.org>; Mon, 20 Nov 2023 07:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700493008; x=1701097808; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BJkZtwx9gdYhkGl+klhmyKqVkxegZSBtdMc5DAI2KV8=;
 b=PWDrAKc4zROdVrGR+d3j3mKNKOLW4o0woOo9HiCMeA+ILuNX42cry1lZuiauVw3eX0
 DWDIu1ROoUbTwuRuq8+VkSYen82xi95MEXFp1D7v+XieqP1kuR9ZcVI5in768Pq8gyjn
 2KXwS4jbtGq3sDnv0gyAagtYL4QpfyY7tUlgkziV129ZZwCEbLu7wieA/a7c46v83HOy
 z1rgDRe6IonGJ6YIrUFcMaT+SxnhJHjitYwvoTcpnoAiTRxkB2dLHHbiujAafnBnr5Ut
 eSHuMz2X5VlD/EtyJs5sGwVhHRAAzSfnJtRHjdpbenlj/ViKraUMPqWMmEi0yh28vdpe
 wm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700493008; x=1701097808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BJkZtwx9gdYhkGl+klhmyKqVkxegZSBtdMc5DAI2KV8=;
 b=VOnXcRe+kK29LubumX1ShmpOxzO8xe2FkIm/S++PkRxK6yQx1cL4wxOMkrWApkZW6X
 LYvWV+bvpowgQ0MAn3/fPAb+4TmErohJbibOlyUp9tyk2jhR68FCTVvZb7w7lwO/+Oa3
 pLg8dmso1GrrTUX0qdSReP0GDCbPMGXGbPI5EIsWUHdKjkESE0orCfRO+wMuID3TE+I4
 lUAF8tNP1fOJ5w+cyMFwb3cwuPr6YN0jmsyjSvNELVWFT6LoVGpLvRKQ+ZZ34VAmzoZl
 u1PFq5gRvkZmPyu1OnGkcpnoGVs9K+MEtZU8/0UzXutEGeffIoR6EOyQCxYy3YHWda2r
 8pCQ==
X-Gm-Message-State: AOJu0YwIJDGac4RVOJyuYEeplRMAtMncFsXgXjbw8TELzn5D2nXobB1Y
 bayB45davzyAu/aQjPM4WvGPLSWDWizX6AGlldG9YA==
X-Received: by 2002:a05:6402:183:b0:548:e994:be with SMTP id
 r3-20020a056402018300b00548e99400bemr263173edv.35.1700493008096; Mon, 20 Nov
 2023 07:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20231114103443.1652308-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20231114103443.1652308-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 15:09:56 +0000
Message-ID: <CAFEAcA81x-Ettc35oju0D2R0TAhkX5mtzA1BeTM4UYySbASG_g@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: enable FEAT_RNG on Neoverse-N2
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2v9Sd0o+zmPT

On Tue, 14 Nov 2023 at 10:34, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> I noticed that Neoverse-V1 has FEAT_RNG enabled so let enable it also on
> Neoverse-N2.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  target/arm/tcg/cpu64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 08db1dbcc7..fcda99e158 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1018,7 +1018,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>      cpu->isar.id_aa64dfr1  = 0;
>      cpu->id_aa64afr0       = 0;
>      cpu->id_aa64afr1       = 0;
> -    cpu->isar.id_aa64isar0 = 0x0221111110212120ull; /* with Crypto */
> +    cpu->isar.id_aa64isar0 = 0x1221111110212120ull; /* with Crypto and FEAT_RNG */
>      cpu->isar.id_aa64isar1 = 0x0011111101211052ull;
>      cpu->isar.id_aa64mmfr0 = 0x0000022200101125ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
> --
> 2.41.0



Applied to target-arm.next, thanks.

-- PMM
