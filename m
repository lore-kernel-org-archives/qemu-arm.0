Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3371460njb;
        Tue, 9 Jul 2024 08:43:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfVUZxEtcn3l3mmluLqHYjzlk+Segft8kfZ7ilapTuE32zcDFHSDopqm2tpvO7d5Fo5m18sjI/nvDcDwh8P7snjnLW3yvr
X-Google-Smtp-Source: AGHT+IF/Bqs9T5WlfvyTzR+OOSZ14NtVEMG9Ff1Blp6NrsTcwI5okhVTO629JTptkq6mgFhgC2X4
X-Received: by 2002:a05:6808:238a:b0:3d6:2fe3:35ff with SMTP id 5614622812f47-3d93c055fc5mr3152015b6e.14.1720539813298;
        Tue, 09 Jul 2024 08:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720539813; cv=none;
        d=google.com; s=arc-20160816;
        b=KoA27g9Juxtv6PD5LPceuyEWU8cXlHrMQSesVq4X+BGffyZ2er0DAotWouEaF/fXHw
         oOAutVmTWVxjzbgdKL4uO48k3EFaOTtV4l4uOPavzLwMjQnGvcQ4VD/dxNpLuGXfh4P1
         rkrK9dmU7LtolP55hXP9nC5jGzqbHnA6cyVp2rG4Vo5M0clHbx6NeBuxKmd5aPiV8m5c
         yq7o9/fmvFjgWqY8yM3CxgBrdqgNwsNNfEk9D/TWg4BHb9U8bnbNc106lYHFTOtYVvq3
         3A1KUrWjigihnQlK72yqVFktjKLTK1bqnyfJwprnPdy+7NFhhKXqC3OxbYJcd7rN3A0K
         VSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=tkw+YDqmb38aN1jjEmMSOZWpG00GS/lMg8StfVG4bfQ=;
        fh=pXQCCfdofZB5e4ZqzVRXiVuRGYeJnl2WhJnhDCL9qiQ=;
        b=J3wWURy1I3JOi69SMeIg6mCzQjNS9wR/t3cNyov3UqHLHODLX2qhSgPXGrg3HsL4gZ
         eAcFy7MTRH3/c+d8/+JtxDAkdLUW1v0uIC9aigqApmY4FqFnSHKWbaitl5Okb1BL3r71
         9qZ8AUj192wjori8cgEMxog/+L1XWEAnc9HxTutgFg/z2w/1qCTUa1ymWDj13K1IIMv+
         29Awk2xsUSNCWp41h6TXAGt66Uf5FdIXreTTIKExhO8Bvc7CFhpMm8lnOVmC3ajJKPsP
         uSrYZWW6tel88wKGLizJeZIbhgOswNg6RiKF57R+8FbxuVVJ+d2vhPIoCpImao7rcwJ8
         GUmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f1900f5fcsi268441785a.126.2024.07.09.08.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCzZ-0003VH-6F; Tue, 09 Jul 2024 11:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sRCzX-0003NR-Ds; Tue, 09 Jul 2024 11:42:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sRCzV-0001cu-Nb; Tue, 09 Jul 2024 11:42:55 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WJQHD2SChz4x0w;
 Wed, 10 Jul 2024 01:42:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJQGl6PMKz4wxx;
 Wed, 10 Jul 2024 01:42:23 +1000 (AEST)
Message-ID: <63b81250-82e5-4abb-84af-c0a02d68d40a@kaod.org>
Date: Tue, 9 Jul 2024 17:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v47 19/19] hw/sd/sdcard: Enable TYPE_EMMC card model
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
References: <20240709152556.52896-1-philmd@linaro.org>
 <20240709152556.52896-20-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240709152556.52896-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KMuKKrl23koU

On 7/9/24 5:25 PM, Philippe Mathieu-Daudé wrote:
> Now than the implementation is functional, allow
> to instantiate it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I don't think this is necessary. emmc should be functional once patch 1-15
are merged. The boot part is an extension.

Thanks,

C.



> ---
>   hw/sd/sd.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 6aa83251f7..4a6e9cc035 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2941,7 +2941,6 @@ static const TypeInfo sd_types[] = {
>           .name           = TYPE_EMMC,
>           .parent         = TYPE_SDMMC_COMMON,
>           .class_init     = emmc_class_init,
> -        .abstract       = true, /* FIXME: Remove once model fully functional */
>       },
>   };
>   

