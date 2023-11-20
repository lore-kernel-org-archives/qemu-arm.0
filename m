Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp67862ejy;
        Mon, 20 Nov 2023 13:40:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuWJRyCgcElv4Swc+/hOpVgdKxwOnc3f3QENcddLlwi5KlEUJyqJU08fH4O9xps7Z/xNs6
X-Received: by 2002:a05:690c:2d0e:b0:5ca:697e:ee17 with SMTP id eq14-20020a05690c2d0e00b005ca697eee17mr3252601ywb.38.1700516453257;
        Mon, 20 Nov 2023 13:40:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516453; cv=none;
        d=google.com; s=arc-20160816;
        b=T6EF8YoEq6CBJiGT7paVo+zzsUW4QnRifd4NHOpVg7MQF2o6cjOoYqGXhqOp13RvUN
         QSRAbBxNB6d4gQY+ZW3bbeDWWN/Kz2i6TF6BomwBUaE/V87OW68+Zrj9KiB3wiR6RbA2
         Kcveu4QgPNrySMELtd8FtZn+XK0VN3Yc5XPWLERFLAXWiWwd6uxcuXq6KIh1qRmQUcBf
         n2dN/RVpmZMHZIwEpUgWME/HNwby/U/rikc13TaODQjtzLgXR4kiDDIsGoLOeqY1CRmD
         el7lEz7qdEX3w87IJwMPMaz2u8rWcSgdkdCQtGRrjUhrCxyZrG/uVLpW8B/Lj0FHOhcG
         ZSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JQm9clEeaAsqfkXJ+UfY2CLg9Wh2rq/brUmgmj9iQWU=;
        fh=+TurtUsHIdF/4xSdnHQWj5edECWDRYwYAQ9W5oDsKf8=;
        b=p/T1cqMHjZjRYJQ30ksyMysrxZ7ivQExQZJDQ9WTviRLCrqExLH534Zftdb3U50jC8
         MCMr6HwUSUWqqryeiU7Ma7jDBf+JikbQc9pzASQHg1BeEnM7ghGFe72Gt5p2PcUVSVVO
         s5ZHNfMGsn+fstTRGwYSkj2MXxtH1OZBsguJ20JQGCUqCHmrSOYBdwEQSIL/b3SSmXHS
         PQOZrPYSJvQhqzhnAjg5eWKhso9EOWjGcbzeML2s43w9ZEceyzb1j7sKeid2jXKVV1aL
         6Haf4gqcsDx/3SEZPAKLIPAgH/UHYP4X3CscflbHXFaIjzMo5k81uJVK74V30yWmORZ/
         HYyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KP4Ln2Sa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw15-20020a0562140f2f00b00679e5717bc8si1235759qvb.532.2023.11.20.13.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:40:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KP4Ln2Sa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5BxC-00019V-F0; Mon, 20 Nov 2023 16:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Bx8-0000sN-JB
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:37:12 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Bx4-0004Ku-Sn
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:37:09 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32f7abbb8b4so3235687f8f.0
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516207; x=1701121007; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQm9clEeaAsqfkXJ+UfY2CLg9Wh2rq/brUmgmj9iQWU=;
 b=KP4Ln2SakrW4m3VdApZ55sn1c3oTkKI/7IP9rdjOCjqN3IwqAMJ5HZmxAvtQ1CUM+H
 /IqvsS4hOkb5vxBl/TmRMokPoVrT42sxcaRdsOI+qXB+jQdPYKBm4RmIu7JYFbB2tnpY
 zpbRoDvj5Bi+9ZesauwbFRrJCKBTqhGuKCbLNjqo0IflVBT7UHIUsifmo7F1asY0NyUR
 yxrcjomfe8wfdXSJVdL+oRMYDq7hIICL/07w1K46ycJd2C5ggcbaMZA3aB4O3QrY5R60
 Dd7F0MybFiTgWixbmJFvPtjx5qUYwmjAZ6u181yjY6wwvipOOYXQyUvW+tVYVOFibKJt
 cLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516207; x=1701121007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JQm9clEeaAsqfkXJ+UfY2CLg9Wh2rq/brUmgmj9iQWU=;
 b=KjlC0w5v1CsLgJ7nhYEKChS/bsGPwkzeS6eUDWJuAjIGY9qreSOH3IFoXWDYqJ+LjE
 oRNzsGOgm3ss1t4VcwR2gz2UFRL9alhGoARknyPufpMUTxwiZIapWfZrD19U85Vb44yo
 dDElkAC0dUHQwRgN8shuKGF5h72fIBMjeBx1qfrAV6NM7y9YXRJ5gr1Pe7PW62zMAS/d
 YDI+EMtsX3teusa+ufkL+sAWMUU+16TAz5GT8lHT8JJmv8f6itZmWhwnN9s/p9wc9axs
 JIzVI2tiKqW9nnK3GGAahzovAtJxFTWQ14RN6tAmWE1Q6O68mLdxsymLrHBbJVOJ03gJ
 GYvQ==
X-Gm-Message-State: AOJu0Yw2OJ++98qUiTlr3Vrl8OgVjQRRK/cuTWiZIasjoHDutylEMpg8
 iqQi+vtaP7eN7kkmmMeWRAR99A==
X-Received: by 2002:a05:6000:381:b0:332:c593:16c with SMTP id
 u1-20020a056000038100b00332c593016cmr4272767wrf.45.1700516207758; 
 Mon, 20 Nov 2023 13:36:47 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b00332cb17f87csm2549410wrz.5.2023.11.20.13.36.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:36:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH-for-9.0 18/25] util/oslib: Have qemu_prealloc_mem() handler
 return a boolean
Date: Mon, 20 Nov 2023 22:32:52 +0100
Message-ID: <20231120213301.24349-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: CLR6gXP78AFq

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have cpu_exec_realizefn()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/osdep.h | 4 +++-
 util/oslib-posix.c   | 7 +++++--
 util/oslib-win32.c   | 4 +++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 475a1c62ff..9a405bed89 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -678,8 +678,10 @@ typedef struct ThreadContext ThreadContext;
  * memory area starting at @area with the size of @sz. After a successful call,
  * each page in the area was faulted in writable at least once, for example,
  * after allocating file blocks for mapped files.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
+bool qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
                        ThreadContext *tc, Error **errp);
 
 /**
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index e86fd64e09..7c297003b9 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -497,7 +497,7 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
            errno != EINVAL;
 }
 
-void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
+bool qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
                        ThreadContext *tc, Error **errp)
 {
     static gsize initialized;
@@ -506,6 +506,7 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
     size_t numpages = DIV_ROUND_UP(sz, hpagesize);
     bool use_madv_populate_write;
     struct sigaction act;
+    bool rv = true;
 
     /*
      * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
@@ -534,7 +535,7 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
             qemu_mutex_unlock(&sigbus_mutex);
             error_setg_errno(errp, errno,
                 "qemu_prealloc_mem: failed to install signal handler");
-            return;
+            return false;
         }
     }
 
@@ -544,6 +545,7 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
     if (ret) {
         error_setg_errno(errp, -ret,
                          "qemu_prealloc_mem: preallocating memory failed");
+        rv = false;
     }
 
     if (!use_madv_populate_write) {
@@ -555,6 +557,7 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
         }
         qemu_mutex_unlock(&sigbus_mutex);
     }
+    return rv;
 }
 
 char *qemu_get_pid_name(pid_t pid)
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 55b0189dc3..c4a5f05a49 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -264,7 +264,7 @@ int getpagesize(void)
     return system_info.dwPageSize;
 }
 
-void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
+bool qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
                        ThreadContext *tc, Error **errp)
 {
     int i;
@@ -274,6 +274,8 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
     for (i = 0; i < sz / pagesize; i++) {
         memset(area + pagesize * i, 0, 1);
     }
+
+    return true;
 }
 
 char *qemu_get_pid_name(pid_t pid)
-- 
2.41.0

