Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp91854njb;
        Tue, 4 Feb 2025 01:21:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZS86ziDCsbiIUbe1Ps70jHj2VE17jdmD7pteInOE8y5qu1Ac2uoZ0wKUmJolPmqoCUjmA8gFpqFv3UA==@linaro.org
X-Google-Smtp-Source: AGHT+IHNdWIQLhCmwte5ug2uZSjIwWp3PXt6+Ex3zu6dIs6cW0/aQXX8Im//jKFqbrFVbrzfLhtT
X-Received: by 2002:ac8:5ac8:0:b0:461:3834:b632 with SMTP id d75a77b69052e-46fd0a7fd88mr356313371cf.1.1738660911197;
        Tue, 04 Feb 2025 01:21:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738660911; cv=none;
        d=google.com; s=arc-20240605;
        b=ZgZAFaqRgF4rLqb8qnXJcUO/4toaTfgex59turCJm65CVd3CSquaJNlPsjM02lzwEL
         aiunAUXCijPVFq7y6AisP/Nbw9h8vT0gbFgKYc5Gk3SGN9SYOyfOEaHIyOjpBQ8m/9SA
         VUiC+qo5oYN8RK1vb0iydA/72Fnoa4LeJ11NYaS1RF8Nr8+Awu7nMBlYMVtQV0o0us1f
         4n7QGSs7Lzv+5yh4aun3daPYGU0xSKusbFFFVbl54Bb4DoOmnfqFbdTebz3AyX/+AB3y
         IHUHLmeeX/iBbyH1v+69o10vxGs9HQOGeXM5r24tSyNdYIQJmd1xSGX2rOSZypa+hFqi
         XX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=taPzlqnqNA89HRzJHV1fOaa3mxJcu/UNcmQ7477fRUY=;
        fh=07rCocLLlHfY2fWqDxM5kLr811c2XNV7I0i7ic4GjJY=;
        b=fYlj4d1DQ7BQAOZj9zCExG2IVq7RCMO87cg6fyhXbObEunTZGxozFiB3TfRxPsow8a
         dyPelfhIELMu/9b4NnbvzHNKwy6uVSRqyuVk1zvcUmWtVIxFucFgO5O750mE8TY9CNPr
         6bJP+G1YtFoyVkq9NlciIqNWKn4Mv08YXWQ/JfgSZyAJXsnjzSE66F2r6sVsUVNhUoyX
         awnYC4JxODnnYCYWZwNZnn9HbTgE2eW70hkic5neCtIW9xaXikrlnoARr97NMcyQAyoV
         f+QmZMyO6kiTki+5EYUZW89/i3d8QqxbN/6NhXNPJbi+93luUAYKVRluVerX1t+uz9eZ
         mT0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyH3oW3L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bd9779si24597461cf.568.2025.02.04.01.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 01:21:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyH3oW3L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfF7Y-0004i7-M4; Tue, 04 Feb 2025 04:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tfF7W-0004gc-F1; Tue, 04 Feb 2025 04:21:26 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tfF7U-00052H-HC; Tue, 04 Feb 2025 04:21:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385df53e559so3851069f8f.3; 
 Tue, 04 Feb 2025 01:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738660881; x=1739265681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=taPzlqnqNA89HRzJHV1fOaa3mxJcu/UNcmQ7477fRUY=;
 b=gyH3oW3LVOkZ7Z7tG1A+R+IGU/tvJhGsij7tOAXTidkAMFgr/susG3mvnuN8H3oI/i
 gbYcucb5r/Nc9Lv20EePAsJlnQGwAbCU4AhZmHwIs0g8WWOTOYywvU0ffcNxnQohk24w
 vRiL6Z/GUMb/wiTrF4Q8vR7+o4c6ziFoi7e/vTRNPcKA6jCVblobVHn2cSKeu2JryhFw
 NDe/UtIw8O2RmhzMLw7836EnUh74pPqGJ9H9fEEZnXDkrk/toDbQKb4QrmYDql7tW1CP
 uTQddX0Pb1FAe1fL3WLgvEZUIMYCQj5UIn3xYV3LgOnKDbauAz0v1EAlc4GZ73DbbahM
 n0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738660881; x=1739265681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=taPzlqnqNA89HRzJHV1fOaa3mxJcu/UNcmQ7477fRUY=;
 b=G9GkOhU+wh4qI1D9rbXKqBpdwFB59eeE+itJB5qs8Cb1bSUgEN8qgQeU0xMGvZ2VLv
 +SW2yO87Y1708RT9TnkVXf021sjHXRCHz2M8XoLwOvRRfFEXm/Ix/M+bfZhqbScfW4wL
 IEiLRxHJA4HyKlD7+zleIA+GhVuDK5aNOxXKGp12sR9tNMPuMOQ56qaaEXqRKZjawd1V
 Pm5oRioAePqJSphWa2bJPGIqHBIDwj6gyNfgXzH1tQoA5wCBGu8OC0iiXzrNs3Wqpe5w
 rXR6csy404QZP1B6UsyFHn0Ec8gQYNhplK2L9KeT4H1J4d8YR80I2D2ny3XYztF/yUrH
 d7bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRyJ2o65F2RaVdrICgqxavGHZR6qvKWLhKPNzm8kjITz8Npu/nIza4Fxsrh/o/DK19Jx/843H1rQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz4JyWOMLHCkOsqHnddHLoJDFqtx/ZliqSkDEhGDAEX3mj+jBJg
 y/MUdrW0QDHBN+HLWZ0V/QhtZbmH02JOj/C9TAUAYZwzEN0xdT6cFjLraQ==
X-Gm-Gg: ASbGncvU580/j0aRXiYwpMV8EEiFV+iutQkVOMCeYm//1vIRUJ0VNBZ+ogxBAaP+Rlw
 zUNYRI5T4qjIMAjneflD7jN4otTVsVXA3wILydnhCDqSqVanwPSWp0GFUskPL2wCyomjSF4PGyK
 EzFtOGK7xmpYroSjSyX0lo1e87l3fjy8Xf50J9DRU0DpbNU7OqftGZ7zICct9B0uuYtGvUEcURS
 ajyv3JrDxpEQBI+7I0H01bli4iRg6YW6iAcCqLXa1iSh5IfaeilA/45GHpCnA+Qyvbnkk6gaHyr
 huw7fI+FzbZpdhzq1jEV/K/zQ6dV1nIjxfbx2igmJYpkMIREVNW4aTZqW0YuC+xHNhdhj7eIzIq
 blQGfWth0Bw==
X-Received: by 2002:adf:ee8b:0:b0:382:3c7b:9ae with SMTP id
 ffacd0b85a97d-38c51943ddemr18272968f8f.16.1738660881343; 
 Tue, 04 Feb 2025 01:21:21 -0800 (PST)
Received: from Georg-PC.fritz.box
 (p200300faaf0043006a2cae69f03f1c85.dip0.t-ipconnect.de.
 [2003:fa:af00:4300:6a2c:ae69:f03f:1c85])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42c7sm187233595e9.3.2025.02.04.01.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 01:21:21 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 01/18] hw/usb/hcd-dwc3: Align global registers size with
 Linux
Date: Tue,  4 Feb 2025 10:20:55 +0100
Message-ID: <20250204092112.26957-2-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204092112.26957-1-shentey@gmail.com>
References: <20250204092112.26957-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: OR3dDZq5ouxX

While at it add missing GUSB2RHBCTL register as found in i.MX 8M Plus reference
manual.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/usb/hcd-dwc3.h | 2 +-
 hw/usb/hcd-dwc3.c         | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/usb/hcd-dwc3.h b/include/hw/usb/hcd-dwc3.h
index f752a27e94..dbdf12b21d 100644
--- a/include/hw/usb/hcd-dwc3.h
+++ b/include/hw/usb/hcd-dwc3.h
@@ -35,7 +35,7 @@
 #define USB_DWC3(obj) \
      OBJECT_CHECK(USBDWC3, (obj), TYPE_USB_DWC3)
 
-#define USB_DWC3_R_MAX ((0x530 / 4) + 1)
+#define USB_DWC3_R_MAX (0x600 / 4)
 #define DWC3_SIZE 0x10000
 
 typedef struct USBDWC3 {
diff --git a/hw/usb/hcd-dwc3.c b/hw/usb/hcd-dwc3.c
index 9ce9ba0b04..0bceee2712 100644
--- a/hw/usb/hcd-dwc3.c
+++ b/hw/usb/hcd-dwc3.c
@@ -343,6 +343,8 @@ REG32(GFLADJ, 0x530)
     FIELD(GFLADJ, GFLADJ_REFCLK_FLADJ, 8, 14)
     FIELD(GFLADJ, GFLADJ_30MHZ_SDBND_SEL, 7, 1)
     FIELD(GFLADJ, GFLADJ_30MHZ, 0, 6)
+REG32(GUSB2RHBCTL, 0x540)
+    FIELD(GUSB2RHBCTL, OVRD_L1TIMEOUT, 0, 4)
 
 #define DWC3_GLOBAL_OFFSET 0xC100
 static void reset_csr(USBDWC3 * s)
@@ -560,6 +562,9 @@ static const RegisterAccessInfo usb_dwc3_regs_info[] = {
         .rsvd = 0x40,
         .ro = 0x400040,
         .unimp = 0xffffffff,
+    },{ .name = "GUSB2RHBCTL",  .addr = A_GUSB2RHBCTL,
+        .rsvd = 0xfffffff0,
+        .unimp = 0xffffffff,
     }
 };
 
-- 
2.48.1

