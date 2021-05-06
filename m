Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1271861lfg;
        Thu, 6 May 2021 06:38:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy/5YyF/jkZZeqIunkJseCE+mbgqXKlsOz2Y8SCo164gj+3ihOQWaqoXv4Quyv/13g7pJV
X-Received: by 2002:aa7:c412:: with SMTP id j18mr5198743edq.163.1620308295267;
        Thu, 06 May 2021 06:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308295; cv=none;
        d=google.com; s=arc-20160816;
        b=ijeyGA/ValoDa5gACV9UTa90V2seMywKyy3fLXHVGZDdBsk/RW5w3bqTxKrC83Qqew
         eviKEVx7ie10dIEQBzfCGyD32NtCfnENR+qaNkIcOq2T9eBBSxbF/z9f/Q/rIDDl/BZ+
         cTw0S/eul7NB1tIY2tNOj2tBe6qxZEMAFUyvzcJBzC2VY9DkvINxe4aQ63USpawQbyqU
         j4SFBfTxIeejoU772fkBIjGy2A/7KUkKtUomwJ20dEj9LIMtl/Kg1r+T9Zaztgjoi2U5
         37g/6+KvtMtvXhOBg7VeVNY11FAk9Uao13wirIoPwNE+yQxYgBxkVNbXXsoUcIkTCYgf
         a2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Cm48fhhROvZKoiSjxSIRZaypJ/0uOwpu6MiKB+h4o3c=;
        b=wqLJfTLJAdy8m0rPkJT1DBaiYSAAzW9bIfxOQi+lq1Nclv9Fhr/7qhmNAyuCu9v9K0
         +bu6Za9ULF0UyKbrW0lP6fmCxSMnnJiYAihuyd4r4C3ugWzTvNk+KcbVIMCHg/qkSu2c
         B4QjQcKn9/ktEf0H4MchRGinW0eHv5wVm8Ein9vLdUgtyKLbsEUg6sytvBxdNGoFji1u
         TaT0OuKDLmPCv8kZ618O8qGNd8ucxyS99EIU2Kll+ZPYT7dpcu3PJgQjJfvtEn1pBiAa
         fRF8Onvqk3w1j1GvLT5Tco8oFiTlm3dFkdCBFABp9JYz+WEhMtibGNt9hTzmHuzbPevw
         gmgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R70Tuipv;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p10si2345973edw.62.2021.05.06.06.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R70Tuipv;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cm48fhhROvZKoiSjxSIRZaypJ/0uOwpu6MiKB+h4o3c=;
	b=R70Tuipv4JX6wxytql0XYqRyWgNaS+qOduPa783Tol4VqYxR2zTt5wN+bND31YIdSpsyKR
	n/r1Sigo/gpmK8mOdWaNdMlwzsxbI7Sg5NAR4nQKWXyA/elSkwGktBWGG9MdVjngo+5aZ2
	qVXSzzcTCZOk5o6Hxka7kCgyYU7gV64=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36--OlAwPEJObWGTQ8eoFw5_Q-1; Thu, 06 May 2021 09:38:11 -0400
X-MC-Unique: -OlAwPEJObWGTQ8eoFw5_Q-1
Received: by mail-wm1-f70.google.com with SMTP id u126-20020a1c60840000b029013f6df1cd5bso1034092wmb.0
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cm48fhhROvZKoiSjxSIRZaypJ/0uOwpu6MiKB+h4o3c=;
        b=DWPllc3Jytf59u1GUdraYJdTO+NmkZ4wu23dBmdQygkRDW/q/iHLDZgKcF5F0Rd1L3
         4Q4cZMYtI4YndPCPmUxVcscN/5jWcQzDbmT9B1yt6CEceJfh9u6eOaqZKW1bl1/13O33
         WqmoxKkOE6Jr3x/NxqrAEc6gXm076wfjubFvixk/ele1BqmEnteI50H1gffQHl9tCIyY
         b/CZMCPxTlN9r+rL0tq+pYn4s7k3ojjoCxjDoasHiG36OfrEDHnyOfN5f1IHU8mhgI3h
         saiYUW/qdB/RAza820D8cLTR5NpPPLfFJ4D2Sm/SP939dwR78c3+s7l9h1P/cWDNG8pW
         D8Sw==
X-Gm-Message-State: AOAM532nTtia1gRtUaCZDO8SPAfN2dea2aBqzyU/yn4+aoc4TyG2fnAS
	+aCQm/DzONCubYBU/LGp9t0m3sARfJClj/3Fx8xoR2XH3RcX6HD5RIuaGxS59UdZTKVOpd19II9
	HPpxAgC0T2FltWtI7
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr5076463wri.178.1620308289925;
        Thu, 06 May 2021 06:38:09 -0700 (PDT)
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr5076448wri.178.1620308289821;
        Thu, 06 May 2021 06:38:09 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id j18sm3230757wmq.27.2021.05.06.06.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PATCH v2 2/9] backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD
Date: Thu,  6 May 2021 15:37:51 +0200
Message-Id: <20210506133758.1749233-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0izgR8VX0kn8

Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc1934..e5f1063ab6c 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
+#include "qemu/lockable.h"
 #include "io/channel-socket.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
@@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
     uint8_t *buf = NULL;
-    int ret = -1;
 
-    qemu_mutex_lock(&tpm->mutex);
+    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
+        buf = g_alloca(n);
+        memcpy(buf, &cmd_no, sizeof(cmd_no));
+        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-    buf = g_alloca(n);
-    memcpy(buf, &cmd_no, sizeof(cmd_no));
-    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
-
-    n = qemu_chr_fe_write_all(dev, buf, n);
-    if (n <= 0) {
-        goto end;
-    }
-
-    if (msg_len_out != 0) {
-        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+        n = qemu_chr_fe_write_all(dev, buf, n);
         if (n <= 0) {
-            goto end;
+            return -1;
+        }
+
+        if (msg_len_out != 0) {
+            n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+            if (n <= 0) {
+                return -1;
+            }
         }
     }
 
-    ret = 0;
-
-end:
-    qemu_mutex_unlock(&tpm->mutex);
-    return ret;
+    return 0;
 }
 
 static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
-- 
2.26.3
