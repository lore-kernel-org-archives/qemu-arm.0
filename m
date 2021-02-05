Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2249072lfo;
        Fri, 5 Feb 2021 10:32:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxualbHj+SHOEBElEr0hzgFMos52cPKoQXixIAMprM1274sFTqrsGryJ2q+BqdIir4z1YW1
X-Received: by 2002:a25:af13:: with SMTP id a19mr4514285ybh.496.1612549954731;
        Fri, 05 Feb 2021 10:32:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612549954; cv=none;
        d=google.com; s=arc-20160816;
        b=b+hEN0c/SOGCGDgBCD9IFC7drf6NQQOTn380Ng96Kzh9Uq5/5atTV5QEBSORfzL0ug
         WdJOj4CT1qDX4qACVDHKTK5GbSH0XbJpQ5XJq/uNwLotZPe9TqLFAFGplVWWo0RNyP1g
         rcOF1KyXAAqytoUHbE/bBOY6b2FfiN3Rvf/QejSL90nAVCSg/KqGuNC0Oh4h0KTHaH33
         UM959q/T3NWq3DkVaJODk8DYhJw7ArCpXsCCtZlcxed716ZMDO1LhwtMGrinJ0CS6eSG
         vqiFzq6y0Um5I1K2//QSQRhmRiX+skCaR/5S1JO3ojgVC8Xu1aIQn4SJ+CdkyyPk+58i
         RPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0uAL/k14b/WZWPBqirQ/ABYbQDQ0+uaME3FgePiiukI=;
        b=ZuSZe03cFKODVKTzOoA7LsdrdC1N+iY3AY45vQwkq01M47y6rIuN3U2UmzapG26UMG
         X/upHKFstPKHmC/GY0NU8C5W/F/CgwwV7910/n5BmBb87grfLSKZCIxaUJ0iqRwGzYMZ
         RfHYNLsb0uhrGCWspVOwmfQ6kgVqF+jxM2gW+ksHpX5LjA8aQ7rxLt2BLD9fhHdOX9t1
         3VDJW0bOpywSJTa59sXNrjmI5iZ8Hs6Q1aRREaIh6YsyzlKAcl94zI0fuqC+BeUKR2Ne
         uVdQkQkm/NCuJ9TxuYys7MvZZJ+ewCv0Z9EFutwcGZ0+qK5ThPiabuP9q3hQXJd9O4s9
         ADDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gEMZb+Kz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r141si10696558ybc.469.2021.02.05.10.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 10:32:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gEMZb+Kz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l85uE-00074C-1y
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 13:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l85bT-0004cM-W4; Fri, 05 Feb 2021 13:13:12 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l85bN-0000ZJ-9J; Fri, 05 Feb 2021 13:13:11 -0500
Received: by mail-ej1-x62b.google.com with SMTP id sa23so13378469ejb.0;
 Fri, 05 Feb 2021 10:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0uAL/k14b/WZWPBqirQ/ABYbQDQ0+uaME3FgePiiukI=;
 b=gEMZb+KzrfBaxmZYiNfnc6jKSz/TWQaCPqEBPg2pCeArWA143sTMVG8OLyudMJ41iq
 f4msaRfTDA0CVro9BmLB/yQkCLWlrPZ5vycllFX78oy7RoL6FdWP8ldXFc4gHIC+5gjj
 XAgWm9xJxB44ivIkIn4KQoAvCDSv6UUoi9Drzvy/rnl5Ox2yw5J53vJQi59hQ/GkgxOn
 2alWnieiXyi2oYxgrHtgbKviEx9+mx6gpYISmL6Ywfqytb4kQCrA/MsqquqwhjTCHytj
 AuPzRXrwo2g9N5pz92DB8FS++3dBhN83q8iIBpeeB+jvVSRNHZywrYCofoHFhvS8phpN
 M5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0uAL/k14b/WZWPBqirQ/ABYbQDQ0+uaME3FgePiiukI=;
 b=W6ts5nzwFIaQzeJZKysBYFRChWmTMfkS6UEJthCjxzDcXh+6Nm3eCkgDS2IfDLZb6z
 ZNHVk5HFdPD5h1WwbypVzWftKxIH4Pr9FLvmWF2Qhz8kBPpfkKdIDjHwXa9kdPJbgmy+
 aNLMl5n7y2yxcqKWtO10FIa0TxaCQLHyuEaQ3RL3j5U/9MwaOpAhADQRzkoycg6I4yZi
 yvGfU/z552zP02CryI///yG0mDrDhX887+SASkCQSQvisZbbl5t//zl1Wz/1vH65s21C
 pL+2l20HLR/WeeJtPORjtKDm0IUr5X6ePbbICTCj15YrzguXwtYH3rBo5MPrkGLXdpqO
 Aesw==
X-Gm-Message-State: AOAM530yM5QvaH1xLulWMM8UBbVuI9KlwxsiL7P5BmQwHPDw1YZ58Sk6
 UMPd+MPtcCqFcInxlSi8DUov9OPvOYo=
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr5125242eji.376.1612548782790; 
 Fri, 05 Feb 2021 10:13:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y8sm4179265eje.37.2021.02.05.10.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 10:13:02 -0800 (PST)
Subject: Re: [PATCH 01/24] hw/arm/mps2-tz: Make SYSCLK frequency board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fcf487c0-8c2d-2e69-2d98-0ec41589bf96@amsat.org>
Date: Fri, 5 Feb 2021 19:13:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: 1ojWUGoixm4p

On 2/5/21 5:59 PM, Peter Maydell wrote:
> The AN524 has a different SYSCLK frequency from the AN505 and AN521;
> make the SYSCLK frequency a field in the MPS2TZMachineClass rather
> than a compile-time constant so we can support the AN524.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 90caa914934..82ce6262817 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -76,6 +76,7 @@ struct MPS2TZMachineClass {
>      MachineClass parent;
>      MPS2TZFPGAType fpga_type;
>      uint32_t scc_id;
> +    uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */

This is what I meant in my Stellaris read-only dc[] registers
comment here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg776770.html

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
