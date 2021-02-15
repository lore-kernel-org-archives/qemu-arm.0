Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5503270lfc;
        Mon, 15 Feb 2021 02:35:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3Dkn4uk2FpQ2UKo41NvkwqzViQvXUOJmQnDZinTRBnlwGJ4pLac4ZtE/R81wB4/PqJJTM
X-Received: by 2002:a25:7145:: with SMTP id m66mr22236611ybc.283.1613385351078;
        Mon, 15 Feb 2021 02:35:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613385351; cv=none;
        d=google.com; s=arc-20160816;
        b=iI4ZERTwV40pooh3mWqWdRZI0X+WSUT8NQ2Qkl8A8/yW/G0ug5s9Jo8TYkb9pdl9h0
         aoN2WOC3gCjH/871uSefEuDv03I0fX9AESbNRWDUMByoTC1OQLbfX2w9hy+SbFmOs8Sa
         tMrvytB+aSNPybazo6eMTlKAD1IdKN0XxTpTcpiPQQ1RU3oMOjFqCswZlJXvXjcX/6Xa
         3YeiP3poT7I1jRe/CkKtTAKazmimh8JcSacsoVAs8hQaX1AI7CjG8n8gymKBd83kcBW2
         F3YtkyP/wbVFTM4PweByMlLmOC1bU+wpomLKRTKidVB3tMmlEWvHvZUKiOh+IMfvN1qK
         xZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=k+iy8xHCSQpgWfxPW8C578vD665e8MF/3+qtPx7S9FY=;
        b=dZGOubQSRL9hgnl5CBnZHvyZCm31o++mN34V3cDP6e+9QjcD1Vvl8YOWEgGTfTQOX8
         wCyh511InKi76EyJQ//Dvmas3OoKE9YWxJZiDRbwoFsqeQ9p18ecuv7rXssQBY4tNRWZ
         Wr+6+sfe+xLviuNKM+7UuRZIBQe59dDBU6R2GaJwBD8tbKeUM0ayBjqc6RgVZ+Dzedum
         sfhguX7TOeWiQu2I2Ma8lc2jOeUm8qE3UKAauRTdqKPWV6zp+WbSRC5lfjilMTnZkS+d
         JyrTwzXI7SvUrGcj+MwaewfdgYxwLhV9veJ9NmlTPQltyz24SVGixfTN4li9i02saYW5
         +4zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YOQNBcH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si16724066ybt.235.2021.02.15.02.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 02:35:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YOQNBcH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBbEM-00084K-CU
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 05:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB1-0004JM-U9
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:25 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbAx-0001gU-Bp
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:22 -0500
Received: by mail-wr1-x42a.google.com with SMTP id n6so8222882wrv.8
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 02:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+iy8xHCSQpgWfxPW8C578vD665e8MF/3+qtPx7S9FY=;
 b=YOQNBcH0sebvMbrbIVjWnmzMVLrJkW5gPskNsRg0zg/qNNG2V4btGIzBQ7ZoIMuD5+
 h6RYi/Ddon2ymQXRiRLZKK1VfDj6AsAtBt1yezOLoDO9q33+b++0BDw2JOKGzh2xZjNO
 l9ZHtOfTCcdbb/BiGrPQSIvPNGDNwxundKTC0PmevyZhHu8dwvhDjKeO0xXf+VvAKYRz
 Sx46OfXUztafDb7iRRxV+9c15sMvXZT+tiBmYRGI8PTHKFXExSP16K69ohtsWfK5lKFA
 9eHMS12xQaClqmYnh57WwtJ7MbZ0osT+2VQQVRgdEBT6ORSwxVVWdbKRSGv/mJgWK7E3
 G65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+iy8xHCSQpgWfxPW8C578vD665e8MF/3+qtPx7S9FY=;
 b=bvPlTsKFK35ZCDFlrnpETWNNBkM4awM7+Swz1ZVfrBkz3wFU8py1nsgT+lPEp1j3kR
 9rNZqhr5tnBqWT8x6xdgcu6PR3G2Fxqa5DlwRFZMln5t20N0joZYCzHjC2UbqIvClEHA
 oEnNCQ+0iZgzaz77DQmRja/eGJhAYIQQja8h6Oja6VhJg2CEDhphczZs9JX2BYPWOOVy
 U5HVMfDvmnqo91CtWs75ivoQuVZobWUwqIEFcdxQn4X1RVOrmQeiAUzT/4vhwqNLGoQW
 rfMAS4gn3ifllRgw0QNbagy6qrbgbfLoqgXEebiFNysWuJJ6F9B2McH8UD29fBwfFsVX
 xorg==
X-Gm-Message-State: AOAM533WcNYgTJkMqHUlT479FrBPAf2dGvas3CsdcS3kV1B0akDaZiCR
 qVXGXcUFapsivmJvQ9qwZx7eb2A2iWxGQw==
X-Received: by 2002:adf:f089:: with SMTP id n9mr18457716wro.98.1613385137921; 
 Mon, 15 Feb 2021 02:32:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/9] arm: drop dead code for non-32-bit-RGB surfaces
Date: Mon, 15 Feb 2021 10:32:06 +0000
Message-Id: <20210215103215.4944-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 427cpyL9Bhvs

This patchset removes dead code (including a couple of 'template'
headers) for handling UI surfaces that are formats other than
32-bit RGB for the musicpal, tc6393xb and omap_lcdc display devices.

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB, so the legacy code in these
devices which was handling the possibility that the console surface
was some other format can all be deleted.

Notes:
 (1) the patch "hw/display/omap_lcdc: Drop broken bigendian ifdef"
     fixes a bug introduced in commit ea644cf343129 in 2016 in a
     previous partial start on this cleanup
 (2) the omap_lcdc changes are tested only with 'make check' as I
     don't have any test images for the OMAP1.

With these plus the other on-list patches, the only remaining
'template' header files in hw/display are pl110 (which needs it to
handle the different guest-side pixel formats) and the
milkymist-vgafb device.  Milkymist is in the 'deprecated and will be
deleted in a few releases' bucket so it's not worth doing this
cleanup for it, since it's not blocking any API transition.
(I'll take this task off the BiteSizedTasks list shortly.)

After the musicpal cleanup and the tcx patch I just posted, there
will be no more users of is_surface_bgr(), so that could then be
deleted.

thanks
-- PMM

Peter Maydell (9):
  hw/arm/musicpal: Remove dead code for non-32-bit-RGB surfaces
  hw/display/tc6393xb: Remove dead code for handling non-32bpp surfaces
  hw/display/tc6393xb: Expand out macros in template header
  hw/display/tc6393xb: Inline tc6393xb_draw_graphic32() at its callsite
  hw/display/omap_lcdc: Expand out macros in template header
  hw/display/omap_lcdc: Drop broken bigendian ifdef
  hw/display/omap_lcdc: Fix coding style issues in template header
  hw/display/omap_lcdc: Inline template header into C file
  hw/display/omap_lcdc: Delete unnecessary macro

 hw/display/omap_lcd_template.h | 169 ---------------------------------
 hw/display/tc6393xb_template.h |  72 --------------
 include/ui/console.h           |  10 --
 hw/arm/musicpal.c              |  64 +++++--------
 hw/display/omap_lcdc.c         | 129 ++++++++++++++++++++++++-
 hw/display/tc6393xb.c          |  48 ++++------
 6 files changed, 165 insertions(+), 327 deletions(-)
 delete mode 100644 hw/display/omap_lcd_template.h
 delete mode 100644 hw/display/tc6393xb_template.h

-- 
2.20.1

