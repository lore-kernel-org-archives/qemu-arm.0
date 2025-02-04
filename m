Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp408403njb;
        Tue, 4 Feb 2025 10:31:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5LFgOhyP/nGbcN7OPMY75Z4/sX6JSfSdvPWgl2k5Auk/2OXu5/KybchC926p+RchPD4uMSvTWJ4un6g==@linaro.org
X-Google-Smtp-Source: AGHT+IGeaOiwm/fECjiisp1s78M6cczfH2vffJ/hMqBa0bcIVOnjwrUOcBD9vhjgTB/YClyFF/4y
X-Received: by 2002:a05:6102:2c12:b0:4af:c5c8:bb4c with SMTP id ada2fe7eead31-4ba47aba04dmr81949137.16.1738693863959;
        Tue, 04 Feb 2025 10:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693863; cv=none;
        d=google.com; s=arc-20240605;
        b=Ef1S8rjRZFwGWnn2AP2xFOLWKGlpW8izORGJNxGtmFe9/UfEnqLEorkkndT2hbT8hb
         64yztxMRBFRwE1fJKepTVwaElSXs+CQC3DcAhW1IqyXPc2HFmygE75bKKE7r1cq6tXoi
         jGw48y+c86dQ/5MmAykn+9rbHc397DEProzhUsnPt6wnQG+KJ+sekT1lGuAJthd1QnLZ
         /R2XQ3D7x8TMZqIMqwJisQrZnCB8wghyyLCrX1VRmdfnDgPkwSNn3n7pjTk7XXdPsqAc
         ZLSX/4lZbfPUA0w6BeNI6gxyIy/PRt8U2MonbWAd0CoMvV7LP2P1EDZl3x5KG6rh9l0W
         MC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4aC2ap/lG5aepYBxnBeqfmcNSow0ZaEbYXj6+8sjwn0=;
        fh=mkBVnWpxAF9nxrF26AUp4APXPlKkUIEYxwX1Hhh8YPg=;
        b=bZCuAb9BDiQmTbw02jP1NP271JnlmPhBjY1kGdZvZ16U0vfJa/7fSnR9MbXDSCUxof
         MkxU6Go9NQj+3YdbDBwtkry/w7UL2lue3hLrdFJhS5bddnL44fNJ8rkF++s3SyhJ8gjS
         FixcFBFU7gIdNG7pSlzCmd94sl7z0eZUIJ0zsYKy8WTwDsfIzkkZlCgAwcoyxiXAPCrZ
         DcSOfV1cjfCK749LWdwFptFJbbX+ZtQQ1Xyyed44qiy6q7Zcu4ggYnc97iXVLcO5vU7f
         SqJafblKinp/1vclIB2VztQLbKMDZSQzCJCzRaFd7LjTz2CHrU6AXotJLsH1eWMF0CGv
         DB2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n57ph8DL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-866e49ea12csi317366241.7.2025.02.04.10.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n57ph8DL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNgG-0000vh-3I; Tue, 04 Feb 2025 13:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNg9-0000es-SZ
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:29:46 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNg6-00052L-QS
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:29:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so70383475e9.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738693780; x=1739298580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aC2ap/lG5aepYBxnBeqfmcNSow0ZaEbYXj6+8sjwn0=;
 b=n57ph8DLgLLgyq8Iw9YGtl7g3eZhRQJmCD7K1MCv1YQtia2ny//kmjyyiLDUWIs1WH
 1o5M7+nBs0A93utB8bfyVa/XOwAO/UVrVW9IwZBsBPZFlnxXa1W6Q0ljQIHIFNWUf+qS
 GKipALFNVsMeUwBeJvH+sKjG4WfuaFpzXqcRo/Fzh1mYnt/xUJy1L2orPI0ouraS55Ny
 /qkg4tIeCoHGf4D69/DbxIcY9DeEZKsSvpqKJ/x//iC0Kj87sYgNDjRZzFcR46lemXyX
 MHzZ0VAts7yrsk77Hr2je5uiEZlkGigpJpA9qrRydFJlhBTGYcyYHd7gyUFy7JjNXIvT
 +B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693780; x=1739298580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aC2ap/lG5aepYBxnBeqfmcNSow0ZaEbYXj6+8sjwn0=;
 b=by75igSvklP4hDcDToC5SIcHlGPFIU5z0b/haaqcBjoM8x4Gw645HaNr/lY/YSzpwE
 OWCXWowx/EnjkwZdgIjIAUiy4NntQdk3lislD8b3a90Iky28lVIJoMV4FztIQOQYJ1i6
 Tskzf9GeG/pGQCbiygsjSGw82aCD04sPrEoCmsvlswEk8SsE4UM7H6reeb4zI3grLjVq
 evZfHCUfP4H7KlTGAkxNxMHDlEPcEF5L/6S7rkJpu9QGEB5TUPsjteN3dhWeJJsc5iTf
 QsjBG4XugnBbczBcC2jpw3s2FAncWfJ5IJhWSgWDFj7YJynFYG2zMeIfHbv7YWpAwtOm
 71MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUojB4igmNfCwsA2jSaL5uE0+45yh3Zg9ikLMKb3/eu2ZTlbr8n2W0lE46FLh/AW0qc/gG/wv+kbQ==@nongnu.org
X-Gm-Message-State: AOJu0YzL7yxfx/R8N+xYyKWDoxO/3sGihqGCsNomicG9HsOknVUdX5Is
 jw2B9UVG+x6X/i/9hdgRHJchxqdLjzqaVFin0ilr2NuNCNmYOq9HZ5XAGghtdOCejm0ZcqPVF4a
 6MtI=
X-Gm-Gg: ASbGncvtT3V8XwPp2ThyDqQzVlWarGKTXwwEdWfr4x0Hg42nAN7aqctfz7JYsGwKTff
 HzRP+xKRre7W4Xrl/P50Vq9v+qDAmV7gHMIvdeOYvk76VH17gfDQTX/gumFhESh0cAudO4v/WzF
 hwvm+yoTjIJVd3uHduwxoEY8xvqza5xqkdLbq4WbiZFG6n/chvIAh7h8aB0DCxZL/ywW/kFgVfn
 tV3epM3Ri5ySSJR/+HY5rX+ontrS22i1ws/5SIot9Bv1xG9K5P2L8kjgsAbEWLpSYptD3OTWnhu
 IdRAn/j/0fqmE8bCBKHxUoDHgEZp+0jxvdd+iPHOg+dAcGpa+UfP+SVSjLboNO9MjA==
X-Received: by 2002:a05:600c:3488:b0:434:f5c0:329f with SMTP id
 5b1f17b1804b1-438dc3cb2a8mr304005545e9.14.1738693780102; 
 Tue, 04 Feb 2025 10:29:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f492sm196719305e9.38.2025.02.04.10.29.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:29:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 7/7] hw/boards: Ensure machine setting auto_create_sdcard
 expose a SD Bus
Date: Tue,  4 Feb 2025 19:29:03 +0100
Message-ID: <20250204182903.59200-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204182903.59200-1-philmd@linaro.org>
References: <20250204182903.59200-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: a+DkelKN3910

Using the auto_create_sdcard feature without SD Bus is irrelevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/vl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/system/vl.c b/system/vl.c
index 5ff461ea4ca..dd8053e1e79 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -53,6 +53,7 @@
 #include "hw/usb.h"
 #include "hw/isa/isa.h"
 #include "hw/scsi/scsi.h"
+#include "hw/sd/sd.h"
 #include "hw/display/vga.h"
 #include "hw/firmware/smbios.h"
 #include "hw/acpi/acpi.h"
@@ -2661,12 +2662,19 @@ static void qemu_init_displays(void)
 
 static void qemu_init_board(void)
 {
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+
     /* process plugin before CPUs are created, but once -smp has been parsed */
     qemu_plugin_load_list(&plugin_list, &error_fatal);
 
     /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine, mem_path, &error_fatal);
 
+    if (machine_class->auto_create_sdcard) {
+        /* Ensure there is a SD bus available to create SD card on */
+        assert(object_resolve_path_type("", TYPE_SD_BUS, NULL));
+    }
+
     drive_check_orphaned();
 
     realtime_init();
-- 
2.47.1

