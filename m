Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3061761lfh;
        Sun, 22 May 2022 11:21:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2bqnv14waJ72G1ZyUxQ9Q+Rg5Cm9N24xMMPcKflRcD8hdy3j7QCvwtrwI11H4oiYolqbR
X-Received: by 2002:a05:620a:440c:b0:6a0:4c1d:eeaa with SMTP id v12-20020a05620a440c00b006a04c1deeaamr11659888qkp.370.1653243688197;
        Sun, 22 May 2022 11:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653243688; cv=none;
        d=google.com; s=arc-20160816;
        b=DtJB4k+ojqrMZM9ULHUpKSwEvwPpTaqkG65kwKlym7gzYJANkDzVHk8aT3+tNWKgpr
         K8g9HTULQyq1SftReu6bpHy98QFQqn4fzCiC+B+GIvOHE1M51DHg1QKZnZA6lgtzn+dg
         ILmNY1hVZnwpKpT88YQD5LcngkYZoOXgencsdgLaX2BA46N6P30W01HmnTHS/a0NfYPT
         MXQYxhluW+URSxV77UShGau3be2IQOLyGe7huVJCTcLlroZZsRmXxI+uf3+AIb4MI5SP
         t3RvnJS8/L4CwyoTIcvEA9TvBBzNUm5UwZxSBrqRwDqtCIJgBnHRIPyUIKD3qQw8ZR4X
         /xyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=je3lDS41Aa2q6ws8CdoU2eWSveN8fY5JhhbQYGiKCeQ=;
        b=fNjH68YUqyrOiFBGYhcNC+iP5lGgjBVM75jlF43DojX/tGpZ3f7MQH5i07SN1Fj4Me
         X0rE33ypaVUK3DBr2w1WQU11hRYhZ6KpaTodYbdoTY5n8SlQ3cVu1hvk82u+gxkI8B0w
         IyV1NcUlFWDJ3K8mcVK15sALejiJ2FvPLzt3z+eFf6KWuAGUQqa8Voz/ND7e39EidhYV
         6SEmAhoLRYAXnPuCyTMcz/9a52ccPnIOjjoSWRH9w0w2LRVAYBPYizILI9tQ/ccldWFf
         FB1IX5nyBCQKSbCrvap9B5xdTcC99mLVLn886VP6PSrjBoyyetdtw52tQ4KdSXbBWJo4
         yAZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=nMyxJ5Rh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020ac84e8b000000b002f3ab47db89si2148243qtp.432.2022.05.22.11.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=nMyxJ5Rh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqCl-0000Gr-MO
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAk-0006oD-D9; Sun, 22 May 2022 14:19:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAf-0003XG-TK; Sun, 22 May 2022 14:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=je3lDS41Aa2q6ws8CdoU2eWSveN8fY5JhhbQYGiKCeQ=; b=nMyxJ5RhRHcl+7ICcnGB12aUba
 hq2pLX6XAjqQ+ey8fdtNU71jqLivJIE+O6LkmCJK6+qpOo+K7ldRLQvwjwVWrSMEWuor9dOnJIoXm
 kQ08vb2XwF3E4ZL0zWSLOMYu1eM2xq7c3BUFpyUOt+zgVF2VnReomZQEYb9Jhnsxp1r4dZWOwqXwh
 fzpcboVBr5iRwONIzQm1EKzcCjAgt8Z13LgTRv24ukF5rG6MST3U/mUlkymkFN9CrSeZJNlwEwUth
 /+NXumJPw/KYdsJXsqMX+7r/9zFz2GYhu8sy3h+Wlx176XyIW9U02EyHEIkoxfsklHHk+U6i3Cuyl
 OL8FrEYCmvVpwPUJynOF2HJJJf6v83eVaq8RBMJZpL0SoUL+tHwMFJqiA0u1R1YMaVZcylGLCYNYj
 MB+lUnnjJcv6GkOG+B2ZBvOAmZ28uZjDbN790/TnQlhkLNfiHxTjQcKj2kODZhv0P6kH2b+QlAcDJ
 JEeSzUcuUra/4JugXJVqcU5K+hZW9vbPJNxa92K6+tBjHxZXsI6Oj9PVdUrvQGWtV/c5Oqk11nzK8
 doSI4q5M9dC/UAuJhxdjXWuKMEW2mQ8HpBDAi6ewgYNRPNr9k89Vp1BgZBIls/XMQOpZ2T/oYqTQo
 QXdH2QA+eh7tE7DXdm5/4llOc+1+JpT2gltDa5UOo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9W-0007pH-SV; Sun, 22 May 2022 19:18:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:53 +0100
Message-Id: <20220522181836.864-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/50] ps2: introduce PS2DeviceClass
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZSA7DqyzVJUE

This is in preparation for allowing the new PS2_KBD_DEVICE and PS2_MOUSE_DEVICE
QOM types to reference the parent PS2_DEVICE device reset() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/input/ps2.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 1a3321d77e..0493b78812 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -33,6 +33,10 @@
 #define PS2_MOUSE_BUTTON_SIDE   0x08
 #define PS2_MOUSE_BUTTON_EXTRA  0x10
 
+struct PS2DeviceClass {
+    DeviceClass parent_class;
+};
+
 /*
  * PS/2 buffer size. Keep 256 bytes for compatibility with
  * older QEMU versions.
@@ -54,7 +58,7 @@ struct PS2State {
 };
 
 #define TYPE_PS2_DEVICE "ps2-device"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+OBJECT_DECLARE_TYPE(PS2State, PS2DeviceClass, PS2_DEVICE)
 
 struct PS2KbdState {
     PS2State parent_obj;
-- 
2.20.1

