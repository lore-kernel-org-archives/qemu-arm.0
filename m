Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4821919lfm;
        Tue, 14 Apr 2020 03:24:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypIT1NTkZ8FUhysVJm2d1OeShX7vEj9quQl1HaTV8Hmv5mfI2WNA4xzzDmbUXwtpvChqpUmL
X-Received: by 2002:a17:907:42d6:: with SMTP id ng6mr6389408ejb.265.1586859873445;
        Tue, 14 Apr 2020 03:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586859873; cv=none;
        d=google.com; s=arc-20160816;
        b=gZOo/0dMBEuUs6ChkFy8AYGGtzqd4oKIxzK2R1h2eVVafoTkcYgaS/SilE1ymEA/4Q
         y8Uxm7YSXUiNp3mPc69rBEAs475OM+YYEDz2MIaRKO0hm+0cTUmkMwYnHM/H7i6lJm1c
         MRDuYJ5q1bawj3386Xmy2IfdCFPQl5J2k8hOfgz9sHC/LLlUIztSt8uVPvDRWsDI5QZE
         v4wobA6816aNoEJXTZnSmx68AYN9D1+FBjV1dX9ivNKnmpnjO5pcCGxTg7ByEUEqCOyV
         9wTu0SIHMmgLu4GgwNFwNsIRYIXmBsHkEHl6bz7fxGSArPdfoJ6VNE09Yj8puftxmeD4
         oSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3LUSN68By7GXDCNFcXg97x6JG3M9Y0txbo3rfMOS+jw=;
        b=tYoVaK+dyoIU3wFO56TqQmGVbV0k0YalUFSF8lrYrUVWqpqRAcRQ0DrzbFNQ+TriqT
         9L7/3GqGvZrTfwBT9ZeNfh10SQ4QFb51GN+sRRwz+tdcRSrmaUbGM3kjrOjQqLNGJ+tK
         MNbODFoah5jcrYfm4aE1GCBPpUmwjScvOoEVqWCRWP1uqcFKjXIXh+UBBTRHwcHs7meH
         sWfVNjxuznT6Ou7zLbd3Ox7mmVf+9ypByjIksxJ5eJtMqZZxx0f3MX3cTVviaE/GH8Ze
         CmqoTh05Yo35WNFD45EshgzO0YmcIHtshnE1jmYgfjx8l0WNEAyw7XCKgr1OpBwKu3Co
         vRRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IJxGhJiH;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id jx10si3183444ejb.150.2020.04.14.03.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Apr 2020 03:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IJxGhJiH;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586859872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3LUSN68By7GXDCNFcXg97x6JG3M9Y0txbo3rfMOS+jw=;
	b=IJxGhJiHd3IDUoc6W5Jjn5lVcfulbyK7jbycXKTK/raUi16aZwyeKKh5eNJ1Gja1ayHkHa
	mRP8GvSQSPOcBumDrGrIrn1Vhe/rHuXsfpcCCgXvHy8l+XAgd2TcTLYLjVikRbbXfDlfs9
	XF+cmtXPgxE4361vyMaOJiuzyaXOhak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-GGKsX7P8NQm2i8V0nnZ9og-1; Tue, 14 Apr 2020 06:24:30 -0400
X-MC-Unique: GGKsX7P8NQm2i8V0nnZ9og-1
Received: by mail-wm1-f72.google.com with SMTP id t62so4035707wma.0
        for <alex.bennee@linaro.org>; Tue, 14 Apr 2020 03:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t9E1GwNsR6rUONzYsXKvSxSFUaDQMMKRLLPUd0eAVmY=;
        b=i+oyEbhbeblDXUfs4ICcro2n6VirtmX/WZqx4+5HUKISSul0kEJQv0vbMbYWn/uu3k
         Riz6vynqRCDIAhePETdMlL3CSG0WzLiVmJBPwatToXZ0yV2qEVsb367OUllYDIqArjC1
         E2U2zWNs5ToSI20YYQ4iWneB/qFVk0AM9NKNnufhDjMgol+gcaHyasjR0zPwi7k95kJ7
         fNjQWxDG4LTRGY2e6yODrr0rKrdYw2o5rpKc1GaaOQH3iUl9FA1MJO/ItmccCD6HFYsm
         rESyphy+J4y89c0EDpS6xzJ9xqmGQh8tElYz/+qmyFxKm/TLtekxPNQcX6myCzAvpKDr
         pcDw==
X-Gm-Message-State: AGi0Puak91IyGcMV8hiThJnHqV1E/ZTjxfK7DDKaKH+oxsCfHiJHxIIU
	mFBBxAZg/24jKm2Ij9r7tkZ5GKavItDx4ytuRmKmdlA57QiwABzHbu/jO9T+iczf7x9FaXXrX3o
	bWAQTwYYgwdH7KHSp
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr24395655wmj.185.1586859869453;
        Tue, 14 Apr 2020 03:24:29 -0700 (PDT)
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr24395635wmj.185.1586859869224;
        Tue, 14 Apr 2020 03:24:29 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id l16sm3475766wrp.91.2020.04.14.03.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 03:24:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.0] gdbstub: Do not use memset() on GByteArray
Date: Tue, 14 Apr 2020 12:24:27 +0200
Message-Id: <20200414102427.7459-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 0CfWDrkfdvs0

Introduce gdb_get_zeroes() to fill a GByteArray with zeroes.

Fixes: a010bdbe719 ("extend GByteArray to read register helpers")
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/exec/gdbstub.h  | 9 +++++++++
 target/arm/gdbstub.c    | 3 +--
 target/xtensa/gdbstub.c | 6 ++----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 30b909ebd2..b52d9933ee 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -125,6 +125,15 @@ static inline int gdb_get_reg128(GByteArray *buf, uint=
64_t val_hi,
     return 16;
 }
=20
+static inline int gdb_get_zeroes(GByteArray *array, size_t len)
+{
+    for (size_t i =3D 0; i < len; i++) {
+        gdb_get_reg8(array, '\0');
+    }
+
+    return len;
+}
+
 /**
  * gdb_get_reg_ptr: get pointer to start of last element
  * @len: length of element
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 8efc535f2a..063551df23 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -47,8 +47,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *m=
em_buf, int n)
         if (gdb_has_xml) {
             return 0;
         }
-        memset(mem_buf, 0, 12);
-        return 12;
+        return gdb_get_zeroes(mem_buf, 12);
     }
     switch (n) {
     case 24:
diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
index 0ee3feabe5..4d43f1340a 100644
--- a/target/xtensa/gdbstub.c
+++ b/target/xtensa/gdbstub.c
@@ -105,8 +105,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArr=
ay *mem_buf, int n)
         default:
             qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported size %=
d\n",
                           __func__, n, reg->size);
-            memset(mem_buf, 0, reg->size);
-            return reg->size;
+            return gdb_get_zeroes(mem_buf, reg->size);
         }
=20
     case xtRegisterTypeWindow: /*a*/
@@ -115,8 +114,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArr=
ay *mem_buf, int n)
     default:
         qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported type %d\n"=
,
                       __func__, n, reg->type);
-        memset(mem_buf, 0, reg->size);
-        return reg->size;
+        return gdb_get_zeroes(mem_buf, reg->size);
     }
 }
=20
--=20
2.21.1
