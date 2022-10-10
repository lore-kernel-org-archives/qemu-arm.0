Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2424373ocg;
        Mon, 10 Oct 2022 06:17:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5iMF/8VlXgGLf4H/5+viu3W/NbiBIzWMRfjDPc7122dnte2V2U3HE6xYLC6U/7k2zN8qV8
X-Received: by 2002:a0c:8ccc:0:b0:4b2:382e:ddaa with SMTP id q12-20020a0c8ccc000000b004b2382eddaamr14569287qvb.33.1665407847131;
        Mon, 10 Oct 2022 06:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665407847; cv=none;
        d=google.com; s=arc-20160816;
        b=BQaEn5/qNnU6RtPpTNoRdjDvU0exdsWmQYpkAzma3DsHe5Ccyu46hY+9xMaRv8P3Vx
         xPM1LDrH3kxXQ7XabAZO4pxKj3GPmSOOX8029l5iZ4VmS98h1LHnojeCReDiXs+DO8cK
         CdX8SezXQkZQkfS3u3Z9sfNu2gFy7MssEuLT3kF7Pn8i3rV1Z613p4LWve76T8me9Hjy
         YVU+ewphwZBSZAqVEHBQwZISKWOhuDHV/7i4ZUMUOfz1P8mhXOI6iqQGBeIh4LODhazw
         vbdqRlxzhcqvI3FLtO+ZMdRH3X+LYiot/PVoLT5Xw3G5qLfBzVkcj/ht754m17sp+SOs
         vKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lED7wXCFx4Hui3pum8s0vhphelI0KogCeA3QcupwxUY=;
        b=q66MeKKpu7S9WHMQryjSREFXAc8pctZoK1JJQ/b0Ll+Iz0I4cL49tvYY8k8JQhlc5B
         X6rw+mtCxAuOFL9EeAwObklIw0tR0tHWtjUZcDle6/ttYzbHtkny9b5QhD89e+F91FEK
         myaKhnYG7Ud448qvpr1WMfmbjRlvJ6szhMSNjy4j2Up+SUTCzLPB4tqeNuTnlSCwNBmY
         s1aNoxKg7fOMQxRodC6433L9L9vbGnieNETsYP7nano4HxJmX9fo5/LcR070k3uFohMH
         mF3TUjlq4FPBhal86jct5KutIVydQMbd666Io+LCi/hShWpW82XskUZNFA5DG0xLTeC5
         2uhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pNm8ON3C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cn3-20020ad44a63000000b004992c5f80besi4247901qvb.12.2022.10.10.06.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 06:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pNm8ON3C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohses-0001D7-OK
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 09:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohseJ-0001C0-6W
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 09:16:52 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohseH-0002Zh-AT
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 09:16:50 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x6so10337004pll.11
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lED7wXCFx4Hui3pum8s0vhphelI0KogCeA3QcupwxUY=;
 b=pNm8ON3CLlSIyaSqqVqMqAbNFUNsg98TH9l2WJdLvXNLwdave7VbXTjf8BibZJlMmz
 EUBjw8m7+J6EjnaXWsxq/i09UXnLxYqKH5ZbxVLEgrsfOeiAKE81TOSMlQvYjrmhJpNn
 CkR+I8ScPTv50WMX/5zQK7Oz8jQ1z4v1Q4VV/O++9GpzeJVvozgDf/JkDw0NJfuVFcDA
 SgpjAQc3vPhtqZJ3YXi9YcqZnfk3Y1j5/meh63YnF72b3jS3QouRY4jbmaqtQKcV3xLn
 2l6gvzmY7x/X5W8NTMkROTUJCP5PHAhtyin40QBO75EJxyHZ87lCScmpTa0cw2QWfpUK
 9O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lED7wXCFx4Hui3pum8s0vhphelI0KogCeA3QcupwxUY=;
 b=WlcwlBHLT+0GNhB7b6zJnQ32KAsZD/SZB0TTwyli/iyAZscbBPEOLH+vBmQtCbRIpH
 2/cPrjpcXYa0O51QBsY7G8E6oQEg7KIQheJS3W6ltSHjLTcfZaa8pFed9eKZB4l4ONiX
 GZTeb6RuFKZP2OnsiYNDYBOyhSXvzCT3Gz9zP6OTG1Jc9/YBW0VNQcEdrLdEkEnraUME
 52CwHMVfuzhV+y+56z8szU8CLSpb+xKycAtbKrqagVLHFCyIAc/3pKRsEuIqnee8BUHF
 LcdcYNpDCxgjj0L3Sht1tPpW/Lr+Ajxzef4AvPu2UQD8D3WPOIb6/Tbggxa5S6A+51qM
 qxFg==
X-Gm-Message-State: ACrzQf0dhQ3k/j2xvL0Q/CFFNWfO2KB40g84RO4OpX84H8Pikd3+6ovK
 3G1tOoxMju1+WJWuPzh4zcLqjyfKWlzbtUiOCmaO/Q==
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr30721926pjb.221.1665407807585; Mon, 10
 Oct 2022 06:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221003145641.1921467-1-jerome.forissier@linaro.org>
In-Reply-To: <20221003145641.1921467-1-jerome.forissier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 14:16:36 +0100
Message-ID: <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when
 booting Linux with EL3
To: Jerome Forissier <jerome.forissier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EDQZu7lwUFfV

On Mon, 3 Oct 2022 at 15:57, Jerome Forissier
<jerome.forissier@linaro.org> wrote:
>
> According to the Linux kernel booting.rst [1], CPTR_EL3.ESM and
> SCR_EL3.EnTP2 must be initialized to 1 when EL3 is present and FEAT_SME
> is advertised. This has to be taken care of when QEMU boots directly
> into the kernel (i.e., "-M virt,secure=on -cpu max -kernel Image").
>
> Cc: qemu-stable@nongnu.org
> Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
> Link: [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst?h=v6.0#n321

Ooh, that detailed set of control bit requirements is new
since I last read that doc -- we should probably go through
and cross-check that we're setting them all correctly.

> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> ---
>  hw/arm/boot.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..ee3858b673 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -763,6 +763,10 @@ static void do_cpu_reset(void *opaque)
>                      if (cpu_isar_feature(aa64_sve, cpu)) {
>                          env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
>                      }
> +                    if (cpu_isar_feature(aa64_sme, cpu)) {
> +                        env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
> +                        env->cp15.scr_el3 |= SCR_ENTP2;
> +                    }

The doc also says that we (as fake EL3) should be setting
SMCR_EL3.LEN to the same value for all CPUs. Currently we do
do that, but it's always the reset value of 0. Richard: does
that have any odd effects (I have a feeling it clamps the
VL to the minimum supported value)? Should we be setting
SMCR_EL3.LEN to the max supported value here ?

thanks
-- PMM
