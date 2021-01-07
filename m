Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp458833lfq;
        Thu, 7 Jan 2021 09:07:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcxrjPJCr/47bx5+lZbtLO/5Mem5YE+z2j66vyvfV5clLewquLqWAeyeiahfz//jSvsQ/0
X-Received: by 2002:a17:902:302:b029:db:fa52:2dd2 with SMTP id 2-20020a1709020302b02900dbfa522dd2mr9784577pld.62.1610039250861;
        Thu, 07 Jan 2021 09:07:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610039250; cv=none;
        d=google.com; s=arc-20160816;
        b=wYs+FZZrFE7llWX3lePioCKbI9gx5ScNvHwJ0wQseOa+5bo8YIVPZ3y/blgK3kPj89
         +Bu3tKdbyVrfID844hJ5XBbhjd8o/nFMAzha1e+yzlT+jGux/Vtne1GBMLU9olY9SwQ+
         q2Kka8ooKWWgUEUhGR3Hwo2wQVxCmA1VJtmTrHY3Lu5qdsq7WQN4GfIf0XMPV/GSIYlG
         jV38d/PkbPqDVi1giTqaGioHaidwFlLrgkblh+bZWD3tmxMutmx5Na0XPMB/A+bwzMh7
         kx7+FFY9Vs4l81kW6h4Ysz0+Quv4BrMRMVUBhlBbxLdm5obfcQ/AYfWRprmKxyp88CNT
         qNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Zx1lz6sht8NgXgkoJMV6/FKkXMw7NLMBDt2oS3ETvF8=;
        b=aC/kDep3MgUqWQ4nLeJqud4PqLJZKBnbRc0HXcgLz+bLMeozmuWZ5wSXBLn6wfRPxX
         bpZ3NowRrvwlyYdqzRr8Lgv/PzsvZExGfWFVKG0szYFlmzfDdE+g0WASMD3NCGRnXvfb
         Rzkc2XugRY07sok6capJc2ng23wdyeRbKDwvk1o4jngWLmyYFTPumRQk9jM36X9NgQdv
         5qq1RlZFO8hO6XM5aqTNJtPd2u1KyPJVhYukwipX0H8M+OpQXc1eyUmBEzbxsrH86VNU
         xANIdl147shIpLwFbtUzmwQqniaFynYTIoLJl2OCeAnmn40ZMnUX056ubSsN+bCMdgAd
         CjDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="DwP/dbhg";
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@vr.keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id cl16si2824618pjb.25.2021.01.07.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:07:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="DwP/dbhg";
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 551883F2E362;
	Thu,  7 Jan 2021 09:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1610039248; bh=AZlHtW8kz5BBCXUeA7PKuNpaggryBx9EMe68Qb8hox4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DwP/dbhg3dAlEUyV+3sw+2KdeCkU/aONlAcAmKA+XTuIbtQsSUKMopl3nlq188Yi4
	 7884Peo586IqcTjmh5cPTAt+npJAOXs78eyMlLYf9S93q+5+eHJGXa8WNFGSoiuQUX
	 f8kGVRYrb7ue3Gy8PbHODrv8XA5fZkv+POXxeJWYrTxSUUG+ZbcaUj+f8/cm76fLTX
	 KXb2MBJ7lsRniBgIlGkVrOtN6wCAu3fmEf4aG+cxDYjGLYcRzVCY9kseVUpMMgKcCt
	 53dpm7QLkmcoo2cttnMSQMDco/IkCPyWvSU9T7WR+Gz8WIqzwzhyZ37JSiSWQYtSdm
	 0B+JJqLZ/8QeA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GBwq9C6zHZ0j; Thu,  7 Jan 2021 09:07:28 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
	by elaine.keithp.com (Postfix) with ESMTP id 5560E3F2E39D;
	Thu,  7 Jan 2021 09:07:24 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
	id 4842D742C81; Thu,  7 Jan 2021 09:07:24 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 8/9] semihosting: Implement SYS_TMPNAM
Date: Thu,  7 Jan 2021 09:07:16 -0800
Message-Id: <20210107170717.2098982-9-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107170717.2098982-1-keithp@keithp.com>
References: <20210107170717.2098982-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rYQ8rLM9RrWg

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20201214200713.3886611-9-keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index b1368d945c..b0648c3812 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -835,6 +835,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     CPUArchState *env = cs->env_ptr;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
+    target_ulong ul_ret;
     char * s;
     int nr;
     uint32_t ret;
@@ -998,8 +999,24 @@ target_ulong do_common_semihosting(CPUState *cs)
 
         return guestfd_fns[gf->type].flenfn(cs, gf);
     case TARGET_SYS_TMPNAM:
-        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
-        return -1;
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        if (asprintf(&s, "/tmp/qemu-%x%02x", getpid(),
+                     (int) (arg1 & 0xff)) < 0) {
+            return -1;
+        }
+        ul_ret = (target_ulong) -1;
+
+        /* Make sure there's enough space in the buffer */
+        if (strlen(s) < arg2) {
+            char *output = lock_user(VERIFY_WRITE, arg0, arg2, 0);
+            strcpy(output, s);
+            unlock_user(output, arg0, arg2);
+            ul_ret = 0;
+        }
+        free(s);
+        return ul_ret;
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.29.2
