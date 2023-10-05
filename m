Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp70015ejc;
        Wed, 4 Oct 2023 21:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBzWlWTgnxltWatYXDstR1EBEdkdLzXufD4g0L66tzVAexrwPu7qMNSa37oo1AruHKWlzw
X-Received: by 2002:a05:620a:44c7:b0:775:73f6:1b39 with SMTP id y7-20020a05620a44c700b0077573f61b39mr4902746qkp.25.1696481554100;
        Wed, 04 Oct 2023 21:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481554; cv=none;
        d=google.com; s=arc-20160816;
        b=B6xnelISqvz0+LdccHo8J9/ipJ1OaqCkZCdBBYESiFpXiZWDSXQfNvB0G5XqWL1h4Q
         cunP5vUOkdfhEIzXuYfwR3Cd16c9I25ll2QORa9zHoda6G5fWXDpAOUtzH+2cwvBE89L
         DuB1Le04z96wcfwqBIGe94171Q8CJp+jevrDFfN308bRF5p2JwJOi8m16h6s3Z73MbYx
         PwxAxtHsnMLzCKDh5ChQ2OUM7Tx21rRjZ3Yd00BGpTlI0P/jYSNK8BniHRDOJjExgkkX
         FuHWrZnDnzRzo/VyydM+ppgwtVO5w2IficKv8XMeTl8vbx2y3KdOgLnCUzmo0BF8uZd5
         nYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bBDxOWnGC99luImlqjntVhvHvQ5f4z9cF2Uz6KLOjxk=;
        fh=Zqss3DfmoBwdRU7PdTHuedy0/Kl0JhC5UcIz397tYYo=;
        b=cbbZEGlPxEKoh7UlJoiCSLUGQMi1GounsKh6gAyyx1SWUWYXRezR4J0AHqtU5sCIkQ
         UY5nUzLmdVhJeOBIf7UmhA8X5Nlsl7FCVFfbny3s1sZDR679HeclZ+kZ5jEEqAMXLsTX
         22PimDwhKt0eZzakpCoVMsMquKxm31QoR4i8SGTkvEWrJQw1NsBE01o3V/D8yeo5//LD
         f8p+RlLi67UgNaMvoECviBqEdTwLP4z5zSohIoMlGtVX72SkmnRpjaOR1MUS9KVSYp7c
         xnohc91IKoyiteK5OWfji8PJ5LVH4E/CEK1DOnQvBibNRZeED/Ca4iE4aFgMYYn/Xn0s
         kLxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nyu1TCQd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05622a014c00b004198efe4596si412645qtw.70.2023.10.04.21.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nyu1TCQd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoGKT-0005S6-Qc; Thu, 05 Oct 2023 00:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKN-0005IE-AB
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKH-0005TF-TL
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso531745f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 21:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481464; x=1697086264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBDxOWnGC99luImlqjntVhvHvQ5f4z9cF2Uz6KLOjxk=;
 b=Nyu1TCQdiopw44rhqWnMJC4Usmj2wzlevTkghe2KtCvEA11j5RQJZI3RY9uT04GSMy
 d/vnj0qElBgbi6icb4NlMfyYsNgo8tb/0aOvMQ6wIn8KBavfTFSxk6bfXTEvPR+Jbk62
 LJdcrjXaiRllBViJOOwRX6xZ2XaxE5D5V2aHnI5WbX21WnDSAZdvTsdmgwBZmJ03AuaS
 SXYubDi0/D1wnlP78bTzDL9HOEIYsMt0sdhj3WHK4NJq9GKlrtfypWAdp0IZvAvEQO66
 4CA0flnL3bytOQiWqbJnFEqRz+HS3E1lrgo758MkGYc9iBuOsNYT7DFC6yTtScGNY9rj
 Aaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481464; x=1697086264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bBDxOWnGC99luImlqjntVhvHvQ5f4z9cF2Uz6KLOjxk=;
 b=iEKaypHfGvnTjbYHr5+YWnNJcF85eZ8LLoFc/Ax5dxuo8refbJqtzR2lWmjceWPhqF
 rHE0rB/2DTMclv+ebN77VZHgs+Z3v/J2AvKGfDisTmXk0bJSxEO1avsonAUZX6lQWhCa
 2Dpnc3sevLb4ZTNMP+pb5sJXE8lbxYe55pe6Y/jFDgVmEBRO2kcIvowQ4dIUynPxqJu1
 4GfUdjPS9+cqnJUD8HMFP1gssXY8HwlqoX5nQlcwdYeftgQeGwLQBr81XllqvNL5mIi4
 H7ufQZrmo9Tf/TNfy9I8JnbCrWm6+cKfyIalB2X05sd8AwXMyCaqVWYnxKk57CgGdAp7
 /HbQ==
X-Gm-Message-State: AOJu0Yze7duefGE7n6MGNFiOkSwXDx6VF39VzK5qvilsQqqXvewnDLc1
 aZjw1eChyoQt5s0PfRGsWYzr3w==
X-Received: by 2002:a5d:5309:0:b0:319:68ce:2c53 with SMTP id
 e9-20020a5d5309000000b0031968ce2c53mr3713824wrv.25.1696481464321; 
 Wed, 04 Oct 2023 21:51:04 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 f14-20020a5d568e000000b00315af025098sm749160wrv.46.2023.10.04.21.51.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:51:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 03/22] qapi: Inline and remove QERR_DEVICE_IN_USE definition
Date: Thu,  5 Oct 2023 06:50:20 +0200
Message-ID: <20231005045041.52649-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: gEeMQHdgfdg9

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using sed, manually
removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h | 3 ---
 blockdev.c                | 2 +-
 chardev/char-fe.c         | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 168177bcd7..daa889809b 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_DEVICE_IN_USE \
-    "Device '%s' is in use"
-
 #define QERR_DEVICE_NO_HOTPLUG \
     "Device '%s' does not support hotplugging"
 
diff --git a/blockdev.c b/blockdev.c
index e5617faf0f..da39da457e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2345,7 +2345,7 @@ void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
     }
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_RESIZE, NULL)) {
-        error_setg(errp, QERR_DEVICE_IN_USE, device);
+        error_setg(errp, "Device '%s' is in use", device);
         return;
     }
 
diff --git a/chardev/char-fe.c b/chardev/char-fe.c
index 7789f7be9c..7d33b3ccd1 100644
--- a/chardev/char-fe.c
+++ b/chardev/char-fe.c
@@ -217,7 +217,7 @@ bool qemu_chr_fe_init(CharBackend *b, Chardev *s, Error **errp)
     return true;
 
 unavailable:
-    error_setg(errp, QERR_DEVICE_IN_USE, s->label);
+    error_setg(errp, "Device '%s' is in use", s->label);
     return false;
 }
 
-- 
2.41.0

