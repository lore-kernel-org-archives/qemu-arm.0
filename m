Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp799797ejo;
        Fri, 5 Jan 2024 07:59:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0CKFuMdPztAaHYd7OtWWZ1RzdKRrGUhAcsGL9erpO8dag3XJbPfQ3oPLPkK7+1NmO+0Sd
X-Received: by 2002:a05:6214:c28:b0:680:6223:c56e with SMTP id a8-20020a0562140c2800b006806223c56emr2008985qvd.82.1704470341200;
        Fri, 05 Jan 2024 07:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470341; cv=none;
        d=google.com; s=arc-20160816;
        b=GC2/PDg5YSJeLW/ASXSio930AfIhNlQQsRd8ILUtwJEZBpeyGkaMuQmzF5TgWkyKzJ
         l+F7KAOzGT273/9yZU5Dw59wASb78iAx/Dvql5AMb73TC2wr/opfR3hFfOFA4q3BDMaJ
         ECxDszqhBkpi1bqRt1ri6r8I8uImi9dKvQqBNFiX5+0GQ/3IODl4nVq7aSys9vKuVDkT
         f91vzalAXt2icP4NtldOsEoHRtEYCuXbhPm9/eUi3EASF9ubTvWtcFGV8Abxy1Q8FzxG
         GT7AW08Vcn+e5N8pAcQXA5JrsjF/UwmoTQjcogR7eChdi+kSZPYg8ZqJ65uSimL1VtGD
         HnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=X1UceGM9JMyf+mvn5Vqfm2bFDJfnlw6Hthf90m+0+RM=;
        fh=P6daQqniyYPoLBFy1SCvSyZnaCi7XKZAHvbWeRxCTRQ=;
        b=TJm0NBoauTDiMKKuhVgvDUasMvhkT87ZkVVubyAPHDUkS2/9ZTEiQXvh7koJBy+5v9
         oWskbYO4Br0KliLqbyG6ogNZFeVOZgku8KmZrDxbFwBOvCRXR/djj9qUsN2ox/2ZE1Cg
         AnVkeinlx++32UDMAAT+sj5FNZlDmdp/+kcKCAxR4ehdp1kEqxxe5rnnntshiA0kHJOP
         2pMyyYpTnJud8SxpiWAexej0PPu3XNUPROX0odmDjmF7HEn8OhCuwK9qi03TRz6uFHyq
         meYG+CQG7rXnr8fTIwhLd9shYCy2yCoKDZkjLyZluvGna3HR1kIvDDzD/IibPIOZnTgl
         9M0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uz3+Keve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020a0ce003000000b0067f8cab3dbasi2066149qvk.158.2024.01.05.07.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uz3+Keve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmTK-0002ET-KT; Fri, 05 Jan 2024 10:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRr-0007fY-MB
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:27 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRp-0008M4-NF
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d5ac76667so12905745e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469764; x=1705074564; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X1UceGM9JMyf+mvn5Vqfm2bFDJfnlw6Hthf90m+0+RM=;
 b=uz3+Keveir5GfCNNPI4bKaz/IJviY0QjaiHfbycrEa3nNitGKCHtXLcEG7wGWqhwWN
 jWYM/6Ziz+NElFCvid4OHeIU70L0VL9A3JHaSiCBE7DXXVC3DmWwJhWf5GCpnj9D3dwO
 BBL/L1aRVNdR6wvDbbHxpFg42BY4BbiUFdQWg+irIS9J/fuMW3kv5DxSxkTegPANxkq9
 +9ofRqjBB4gwTuMFk20jSoXKMZT1dJ28zm0WtVsW8Ku8oaDcNnEGz69xmjn2DJrNXnaG
 /8SsBr2w/p8mxe+lqUP5t3oMs4nEOhUD9DHpNyADmyEybbRJWkThlqOvgDFFYtO98Zu2
 2thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469764; x=1705074564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X1UceGM9JMyf+mvn5Vqfm2bFDJfnlw6Hthf90m+0+RM=;
 b=jrNccPYxwz1rZrhB+Pr8gK08BJBp7kZQu+RnuHlxl2EU4/JZA+yUehfel0+npsT/C+
 0o8pfPQ9TSBsttKTI5LPJZszm8ERdojO4hOYkMiMTJOTBPSlNPJtYVX+fu6y5mLcfnP9
 rikUY1slO3B0629NQSmsUehrq3ZGUV6+3amxz6WAcspxSMDkSSLl1jHwVzbhR9EMnUMb
 IoUv56Ixg04+iWalHMk9X4odIw4iFYlvzm/KtD8a5FfOR1sMXKaWb4xeh5V7o+hvZjLp
 HHta2OYBZZSOm/am6ruv8Vkqejp0U0G8PBAW6f872zR9nAQyk+V5CXVAhBfUC/mM+StD
 bEPw==
X-Gm-Message-State: AOJu0YwoeBDn1lCH5Tb5tthMQdFOXfOAf2p+jg6I52MArK1+jKiFgARk
 5//aYnyyP/FM51UlHIeAn4bVuS/PvMF/xcJmGaMcSh2hPTE=
X-Received: by 2002:adf:e9d2:0:b0:337:39c7:48 with SMTP id
 l18-20020adfe9d2000000b0033739c70048mr1522360wrn.1.1704469764364; 
 Fri, 05 Jan 2024 07:49:24 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 d10-20020a056000114a00b00336710ddea0sm1618390wrx.59.2024.01.05.07.49.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PULL 61/71] util/oslib: Have qemu_prealloc_mem() handler return a
 boolean
Date: Fri,  5 Jan 2024 16:42:54 +0100
Message-ID: <20240105154307.21385-62-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 44aLeA1HycU8

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have qemu_prealloc_mem()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-19-philmd@linaro.org>
---
 include/qemu/osdep.h | 4 +++-
 util/oslib-posix.c   | 7 +++++--
 util/oslib-win32.c   | 4 +++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index d30ba73eda..db366d6796 100644
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

