Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3108738lfc;
        Fri, 12 Feb 2021 03:20:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrZtgDj974u3SGtS7/Kz2Nyg7PGE9YcxSU58Jy30KEekl7JderbChNJTMmGRFu9HVde9GX
X-Received: by 2002:a25:1842:: with SMTP id 63mr3179727yby.238.1613128829376;
        Fri, 12 Feb 2021 03:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613128829; cv=none;
        d=google.com; s=arc-20160816;
        b=hVajO6mDYMfgKe6hi5MwGfmhUlFMZCdg2YPLTURjo2lCTxD3YWmxt0d6J3n5soWFZN
         7XreaprT+vd184nY1FQQBS30IQyYRtRUHsnWWdye6GP5oXq3tjZQuCSpSrOpWXNaTwfQ
         cCOgn9e4hs/evOOwTQsRFwrgeUJ4sRk9RRkwJUZJ6B4XN/+UIDrlNXYiuK/mCZglL5kF
         GdfM1nfj3hzgMYOeewd4YUn7xxTzLV5QFOBqb0bppSMbzmLwro3E41RRRhp9gKpJq7Ei
         kDgAf6hv5lTxjtk/uK2njZKF0j7wZoIS1BLvKwS4FXqgxfTQbQSjQtIQ9OFYPpLX2Hcj
         a85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lve7dpICVmMuYk/dTxbhJ3NggBKtPwRUvp7xp/DvJMw=;
        b=FRLW2OPAiVvvKq5yZS3ZLK/eZT8VTlaAeA0ZW7zi69D5Bu5b1dt3k3yYOGwgKQOhVn
         ZxcU/jQBwGLZH5amEoruzn7pfAo0iJTZID2mVM4/16xbaaHn5SuRFhwNbPBIjxIxyatL
         nkpDVJBh4Bxq8InaOgAu3Bmcgv54X2vc0OHgUPObOIoU/VBerOmXd2tjAiR5c/y0q/di
         qnBTyZ6GUesLjSvOHceq6zFscWHaKw6sumJ0tl8kZbsqScwqlM9363ydxIYrMcprMwvB
         TFWpvLGfoNn56PwgDaLXTxtvzUhqc7l8UDZLIuqpsUtP4VVDp+p6YHBfdWgdXVzSPUGs
         eIqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRdz6LL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si7628179ybt.404.2021.02.12.03.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Feb 2021 03:20:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRdz6LL4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAWUu-00041h-Py
	for alex.bennee@linaro.org; Fri, 12 Feb 2021 06:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAWUV-0003yj-3K
 for qemu-arm@nongnu.org; Fri, 12 Feb 2021 06:20:03 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAWUT-0006EU-51
 for qemu-arm@nongnu.org; Fri, 12 Feb 2021 06:20:02 -0500
Received: by mail-ej1-x62b.google.com with SMTP id bl23so14898857ejb.5
 for <qemu-arm@nongnu.org>; Fri, 12 Feb 2021 03:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Lve7dpICVmMuYk/dTxbhJ3NggBKtPwRUvp7xp/DvJMw=;
 b=VRdz6LL4WoCEjSoLL0UMVKUhKqC0gP4U99SyO5JuUub0OPFrCyaM6HSHIep4tIbMfj
 vb/Opa3l0L/vm29Kt003/q29miFU/YvN798x8CGUqFgq8keFaEMoe4jt+qRjDjPwM2Jj
 YFtKGVpnYMFAsi+iDmxE5dl4G89WlAVLZ1GDGULVF5CEMdFQMplDc+cDqeGaeVEZxHzO
 yTHPaQrvlcZs6QKitd1ADs9ViTgrza4oDStXR5cGU5Kv1tpJCxm96zGzBxbi9R0aoBNS
 l3DSk6XOOk7YdHV8TO8qYvqfSGB4CsxbjRuLvSWGmllZTClmVi8qovBh05COxWr1hzAP
 Sf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Lve7dpICVmMuYk/dTxbhJ3NggBKtPwRUvp7xp/DvJMw=;
 b=OmHovNAn+GDRbN7xuhGCIWD09XfdRc97qXk6u3mDxVq1kWZxWeXIg1YRiTNgK11930
 s2C2DQwxKyagGMEM6nnWUYm/cr88jKjdcbWi1RfbGupypBQj+kJIH23yZBvy1yPElQRh
 0C7v+NewBTFXfb0QvYV27k07BtamGOG92BSQATmLrbTP6lX8rgtM9SZyBdi+JniLL/xM
 T34XPACx/NL+HxPi0KXcfz9ftufqrjB5tXb1GlUnnySmFY8teBR9MpWmfw2KgcrU20Ik
 Yw2ayGkmvk5y/pRAQuE3Zb88iaHJWAEgLqhXiVR5coUtUBHbV88p6A/exlmXxQh7phzU
 ZiGQ==
X-Gm-Message-State: AOAM532IIS6H1DnBSLOat395diQ/yruB3mQlemb7EhaQVwoslAKiwzTN
 K2KKXp2zb4UamU/djRNmwuC6+lkoPvw/YKx8m839YlHm5hvR5w==
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr2573056eje.56.1613128799477; 
 Fri, 12 Feb 2021 03:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-21-peter.maydell@linaro.org>
In-Reply-To: <20210205170019.25319-21-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 11:19:48 +0000
Message-ID: <CAFEAcA-zM5iQQwbKpAwRKuv5upDguxRthzmhJVzaJ7sn4jmp2Q@mail.gmail.com>
Subject: Re: [PATCH 20/24] hw/arm/mps2-tz: Add new mps3-an524 board
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: Svg6fRpSiCVE

On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Add support for the mps3-an524 board; this is an SSE-200 based FPGA
> image, like the existing mps2-an521.  It has a usefully larger amount
> of RAM, and a PL031 RTC, as well as some more minor differences.
>
> In real hardware this image runs on a newer generation of the FPGA
> board, the MPS3 rather than the older MPS2.  Architecturally the two
> boards are similar, so we implement the MPS3 boards in the mps2-tz.c
> file as variations of the existing MPS2 boards.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 136 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 132 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 17173057af2..aa57c4b2596 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -27,11 +27,13 @@
>   * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
>   * Application Note AN521:
>   * http://infocenter.arm.com/help/topic/com.arm.doc.dai0521c/index.html
> + * Application Note AN524:
> + * https://developer.arm.com/documentation/dai0524/latest/
>   *
>   * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
>   * (ARM ECM0601256) for the details of some of the device layout:
>   *   http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
> - * Similarly, the AN521 uses the SSE-200, and the SSE-200 TRM defines
> + * Similarly, the AN521 and AN524 use the SSE-200, and the SSE-200 TRM defines
>   * most of the device layout:
>   *  http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
>   *

Just noticed that I forgot one place in this header comment that needs
updating; this trivial fragment also should be squashed in:

--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -16,6 +16,7 @@
  * This source file covers the following FPGA images, for TrustZone cores:
  *  "mps2-an505" -- Cortex-M33 as documented in ARM Application Note AN505
  *  "mps2-an521" -- Dual Cortex-M33 as documented in Application Note AN521
+ *  "mps2-an524" -- Dual Cortex-M33 as documented in Application Note AN524
  *
  * Links to the TRM for the board itself and to the various Application
  * Notes which document the FPGA images can be found here:


thanks
-- PMM
