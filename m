Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp248038ejv;
        Tue, 7 Nov 2023 03:36:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBJKMRDwTHAXg7cwKNFPhwYKJlUSlNMwg8YI0VjQ96hykIoWO2n90/HcoND/RV4gmOQeBm
X-Received: by 2002:a05:622a:100e:b0:411:fa33:f0da with SMTP id d14-20020a05622a100e00b00411fa33f0damr33837064qte.9.1699357013551;
        Tue, 07 Nov 2023 03:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699357013; cv=none;
        d=google.com; s=arc-20160816;
        b=T/BNkXUvKJlkgdZuGlg1EV7Qmu5/33Yi/DWchseadV1+IBYdBUXwz7YQH6yT1QHz35
         DsaZRAJbgKrcRfZGcOFZ0Oeh45jPuQRXEiN0mAuKf7FAiuUnEjgia/Aj0BRsOMqOncr6
         zlG/8pYNn5RFfq/4APrwGloGn0bbTRhyl0dzdiDxBG53TNoTs1nzeVXSgCepL5EDSZlf
         Y0nrTPVP1+xmRMZpfEcjGX1rf8OZ3+GLfKXaYvPN8KV3AsqXg+23IKQVPJyA6EuGTQPY
         EqT1crR24izzym3unt/3iCfyoCGIM+JFyGVR8g3mh7WcuRAJ/6REjL3afQQckSIX4GwP
         pqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W6fGdRUXJHae65cvuRpJSvVvFBdDYdzN3MrAqSHGVIw=;
        fh=SZBFICEHwO7zZd0XsvB+lOVBShrfeens9qoW4uybm6Q=;
        b=SHsmiHzQV9Q95oL0+DaXnYppH1UuNhavFdQZKgiQ3EMubuYtakovzXbr1bqnb17EG/
         ocLR/5OfvAKEZJzbmtXE1QyzakxWv/fuhqTPi/ycDPuRPqq2KDEz90fXmZf0Q98DRjgn
         iid7A2wHryHJp55PnYj7s2ze/4MYoCVlyG5073J2ckJB4HeBhVm2tp+9C4kB0b8kyE2v
         /q2HiEiAmxkXY1LsdwLRce9ubAr2Y6xqDhGiaLlLV1sCXeLycNsX5C4tVtiP5SXAz2Mr
         IjyxE82dTB6bwpmRBeSHDJNiaRiupyJGKf1UMCYNToM5Ng2HWLxdZ4Rp75gA8Ide/OVQ
         90Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQT+RfIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16-20020a05622a035000b00417b6229cd7si6784771qtw.315.2023.11.07.03.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 03:36:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQT+RfIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0KNm-0000Yt-Kk; Tue, 07 Nov 2023 06:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r0KNl-0000Yb-2d
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 06:36:33 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r0KNW-00024v-1e
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 06:36:32 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5435336ab0bso9557451a12.1
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 03:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699356975; x=1699961775; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W6fGdRUXJHae65cvuRpJSvVvFBdDYdzN3MrAqSHGVIw=;
 b=TQT+RfIe9YobF+A+ALO1uORyIqdyfUec7Xnb1LXLiJ9hgYnEXrm5RJO1eSP7NDWYZF
 dN0MeXhJjDhoRxoX9Ve8FAXz25aG15TYTAJQrW/ILLpCcVHE1ehLnMF8YkRBgyYHFZ5B
 WW1KPJjo7BnHVP7lsHEIi4qm6pfGpyEUMQpuGxdnJ9GCBh6k4TYl4pkW9CbQeh+msKJ/
 7Z5y2xNXnNOWGlWUyhMUra/HUKi24ns7+/vEZky5rbgUEeI0KcmFFgjI4KJ7iD5i7mML
 QiqJCMy2emA3sUyogjuTg3QJ9ti3rf+NtUkQXnXGIS/ukN9nwlbgGG7zC9pJ4GD3ud8v
 bD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699356975; x=1699961775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W6fGdRUXJHae65cvuRpJSvVvFBdDYdzN3MrAqSHGVIw=;
 b=t12W7CC66hfy07MTYoYhnVgApCTK3xVpoAHJFxp3yFY7Ji3IYQhIRsVLKB9A32kVX2
 BVghma1c52NZ0sWJupEcoVa4ef6sqOcZpdoPeB9vtrgMh60xAOdWXXjlcWdSJXsIgvJl
 v/RppZKswdzuQ7/miqnMLkW7Y5XuoV5SJxleOQFCo91nb2ElmVPxPClszIK2qgpdYG/U
 gCnMNCPAknRFXl4S1t4CNmp5rzv6c3X7zmjDD3eY/bKBFKZHlxcwMYsFX68sYbhXYh1r
 ADtnO/X3JieCTI66Tt0MAw4+2YzFFckNA6uW5txOpZZJ26EfWGz69ICCxAv0v24uUfFv
 kLew==
X-Gm-Message-State: AOJu0YyI8MN6bsjikeCGM0ECUlJBuD1K2aSRExgP2gkRAUFkCpX3g3WD
 6i5uyLOz+Gv65tYu1XGbc8xXO4+pLl2QleAIhXzj4Q==
X-Received: by 2002:a05:6402:520d:b0:53b:3225:93c2 with SMTP id
 s13-20020a056402520d00b0053b322593c2mr32965622edd.8.1699356975584; Tue, 07
 Nov 2023 03:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20231020060936.524988-1-thuth@redhat.com>
 <20231020060936.524988-3-thuth@redhat.com>
In-Reply-To: <20231020060936.524988-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Nov 2023 11:36:04 +0000
Message-ID: <CAFEAcA_E06frVv5Q3DoKKf15R-Q4em_gubmXMFfMkOs-U2fmJw@mail.gmail.com>
Subject: Re: [PATCH 2/4] MAINTAINERS: Add hw/input/ads7846.c to the PXA2XX
 section
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VDfoMogFOeew

On Fri, 20 Oct 2023 at 07:09, Thomas Huth <thuth@redhat.com> wrote:
>
> The code from hw/input/ads7846.c is only used by hw/arm/spitz.c,
> so add this file to the same section where hw/arm/spitz.c is
> listed.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 14e8f7702d..34f9036df8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -938,6 +938,7 @@ F: hw/*/pxa2xx*
>  F: hw/display/tc6393xb.c
>  F: hw/gpio/max7310.c
>  F: hw/gpio/zaurus.c
> +F: hw/input/ads7846.c
>  F: hw/misc/mst_fpga.c
>  F: hw/adc/max111x.c
>  F: include/hw/adc/max111x.h
> --
> 2.41.0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
