Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCD7CAC587
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 14:06:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwhwE-0003FX-7b; Thu, 11 Sep 2025 10:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwhw4-0003EQ-Kt
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:06:04 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwhw0-00072A-BE
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:06:02 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-723bc91d7bbso6250287b3.3
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757599557; x=1758204357; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=41Z92WFyPlZhI2EG4GlyxHkOERUdusbOiRG5vUiKhuA=;
 b=KFLKJKCOGZi+W8I1Q6C77B1osNsZ59ZoAwNyQ78h80Bteu1aefO1SBHUnDKpianVxf
 aU9PleYywwCyFfPXPBE9VE8tjA/gtKL5RtomyEY6g0HDFA5qU/UIVYcQHw9S24B8wqCR
 b4gWxJVNu/smh4IybCYWvsDgXB0Y7CVyLXHWX1VXjed+DtNYnIcLWJaTAFWn4oVaWP9b
 7N/SmCU45Xp/ZQ6QjQ1fbB3YqgWxeNZRpHtPxvgzn3JotIhigacx1bljfTc2k9TnC5Pq
 d1JpIhqg9XYTsoJB1TR+B+ufzRcgDfBoVrwLbVSSg2c+YobF11Lyyrk1orWkcIuMkIlz
 I2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757599557; x=1758204357;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=41Z92WFyPlZhI2EG4GlyxHkOERUdusbOiRG5vUiKhuA=;
 b=Z77Y+oQSlr7Fos94QcVV8BZZS2irXxokX6qkc10vJFXbUxe6/RwcTiuefJ8kIrrErD
 AYFKBExYdlMdUJ+XE7y7wOX9xkZscuBZE6uwisDQ7EQEg6lQJ2rU7CjR7soSS3cgchGj
 jBSPScHegEx3UqOF5pWpMdCRBWUrKrkwdhDUdJd0H97ocxk0b7EwDzTx/0KJJ7x2MMKf
 QbzmpXtRW+Bxfan5D9WPyi0sqBF+Rn2iJ2BDzr0ULPRckrywxh+g7EYsyB2upYWxG3dj
 HhifQSwZVRJ1m4tpa7rb/OYFQZ0QyFkmff6XP4bSDcU2sMCb+LAnVGVx1XX15VIq4o14
 lHow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQat9s+FOhS1x2ZCta+g08YIM6i5nomZ4hFi47GPcF86rCk40AfIVePL8jY6sL+fT7NN71FU1+uA==@nongnu.org
X-Gm-Message-State: AOJu0YxECiWufCUa17/CXIlOywROOvnhQitDmApkfrPlqUhuRePxJYp7
 ye1gY9XGD76CBw38PsQXEtd+W6qvUC7EyIx0i87Ro7Q78LJnmCVMD2U8hmEBIe83azoeYK5FWM8
 4WoEFjsOIaBHlLds+dR3uHwVSbAfrvUAQOk7Ux82q4g==
X-Gm-Gg: ASbGnct4MJ2J30QVs4jAhps/7UwZNdBLMtFnuVDgWZQZiIFQkdncyGy3YcBNRxs7giq
 6MwyyagAQL0E6SnhHRw+loApZyPnkEmLqzl++x+A6H2lOC7A9Z3g1fQvHDpPUMl2QnB5q9wmfTL
 1b8Hz5VjY6vfgrPxIb9Oq9B++01U3Atxl/jE+8uutmFy1zd8uWoahyLroTaKSitVIZaEyX/E0Bk
 qSOlViLHKZlUzMb9fE=
X-Google-Smtp-Source: AGHT+IGo/iszeQRkPp2aFgemO3loswviKHpNdQHX+lCbAw7hkl7oGYtn19656Wu+8wW72PYhhOjP4hfEBa76xAYgKCs=
X-Received: by 2002:a05:690c:734a:b0:723:97ed:b2d6 with SMTP id
 00721157ae682-727f3783d28mr179500237b3.24.1757599556822; Thu, 11 Sep 2025
 07:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250822151614.187856-1-luc.michel@amd.com>
 <aMJ1WpiNOuLR62t9@XFR-LUMICHEL-L2.amd.com>
In-Reply-To: <aMJ1WpiNOuLR62t9@XFR-LUMICHEL-L2.amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 15:05:45 +0100
X-Gm-Features: Ac12FXw8414FI4p3aDLZw8rC2aKjQSoLjyEYOJE4oCZHQNwk6qjQqCfo2auUOUY
Message-ID: <CAFEAcA-N-rFRm3zeAx51r-ivydmA3kp47o17X0NWET57ZRntcA@mail.gmail.com>
Subject: Re: [PATCH v4 00/47] AMD Versal Gen 2 support
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 11 Sept 2025 at 08:08, Luc Michel <luc.michel@amd.com> wrote:
>
> Gentle ping. Only patches 23 and 39 need review.

ASAN complains about a couple of new leaks; would you mind
taking a look?

Direct leak of 80 byte(s) in 2 object(s) allocated from:
    #0 0x5df4de8f7e23 in malloc
(/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-aarch64+0x2507e23)
(BuildId: 2cb010a0f1032af1fc9fe4c70583ed9f639b86fb)
    #1 0x77eec4c4cb09 in g_malloc
(/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x62b09) (BuildId:
1eb6131419edb83b2178b682829a6913cf682d75)
    #2 0x77eec4c0fbc2 in g_array_sized_new
(/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x25bc2) (BuildId:
1eb6131419edb83b2178b682829a6913cf682d75)
    #3 0x5df4e0b46004 in versal_base_init
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/arm/xlnx-versal.c:2081:15


Direct leak of 48 byte(s) in 2 object(s) allocated from:
    #0 0x5df4de8f800d in calloc
(/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-aarch64+0x250800d)
(BuildId: 2cb010a0f1032af1fc9fe4c70583ed9f639b86fb)
    #1 0x77eec4c4d7b1 in g_malloc0
(/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x637b1) (BuildId:
1eb6131419edb83b2178b682829a6913cf682d75)
    #2 0x5df4e0b4615a in versal_base_init
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/arm/xlnx-versal.c:2084:21

This is from a run of 'make check' for arm targets with clang's
ASAN. I use the following leak suppression file to skip various
leaks we already know about:

# This is a set of suppressions for LeakSanitizer; you can use it
# by setting
#   LSAN_OPTIONS="suppressions=/path/to/scripts/lsan-suppressions.txt"
# when running a QEMU built with the leak-sanitizer.

# This is a real leak but ignore it for now so we can see the others
leak:memory_region_init
# various leaks I think are due to memory region circular refs
# annoyingly you can't match on filename:lineno
leak:fsl_imx6_init
leak:fsl_imx7_init
leak:raspi_peripherals_base_init
leak:fsl_imx25_init
leak:fsl_imx6ul_init
leak:aw_a10_init
leak:allwinner_r40_init
leak:usb_dwc3_init
leak:xlnx_zynqmp_init
leak:xhci_sysbus_instance_init
leak:fsl_imx8mp_init
leak:versal_usb2_init


# register_init_block API is busted
leak:register_init_block
# so is this device's local hack variant of it
leak:canfd_create_regarray
# qtest-only leak, not very important
leak:qemu_irq_intercept_in
# this is maybe a leak caused by g_test_trap_subprocess():
# in the subprocess, the cleanup functions that are supposed to free
# memory don't get run for some reason.
leak:qos_traverse_graph

thanks
-- PMM

