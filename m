Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp348983lft;
        Fri, 8 Jul 2022 08:47:10 -0700 (PDT)
X-Received: by 2002:a65:41ca:0:b0:408:aa25:5026 with SMTP id b10-20020a6541ca000000b00408aa255026mr4003581pgq.96.1657295230118;
        Fri, 08 Jul 2022 08:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295230; cv=none;
        d=google.com; s=arc-20160816;
        b=kihJ/dHVLZOHsD1zVNt3Z4iu1oviMga/ZVGAWj8OPJy+F5567GSNHbCMjGc3EgKeOR
         ygN1/f/ZWnIFKp5AbAxY4OmZLtxxtzkPzWl/h9e7Ha6N+vzqIiNZmZOngIViCiQEKoAZ
         r/TCzjONwsZa/50TWSSjkg0B64p4Upj97L6zXlzDpMU2STMwCZ0WHyMNHK93Vh1XS1CM
         FYPd606qF4LT3CfRUoI/sbxecCN22YRaac8F8VB9si2LjPGm02iJ1w/y6y9UPK14QhL4
         zFOf7uN4lXdgfq/juGc8OyZUrcpqqDdryKNQ/LgBf1rRI/cFN2nAaQ1+H+kCyW0Vi8/Y
         w/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iiRXuoRm0+6hZcCT7CVhc/aX8fiaQgpUOM3IjX/kYqE=;
        b=TtFUcH/wX54vE/v7jNdVthEt8S/DGXOqKfEFPcqru1kuQM3Siqi8LtRkpfKrKlGb1l
         zrWhvhTG9hhUr+9rYhb6+SZocoaxaQz8S0qcrXmFq8CHOIfIQ1pka+5eP+lKlELihw1t
         oEeYALvQF152/40II3lPna4GgPtfjKg8rQyFSZ37+Ay/brCW7bpd/L2trJ+EevBHwgXx
         ciqezcxiSZmewACbiFvBWVEvkVvfLq7sE0Jmq/YKzkmH1Ac5QVBDZY5OIdPyGnaj4+m9
         ffv61+iJuzxwKf1t6BoZBH3EN3RTxxevXq4KL7dtULippuONv9ZKRtsuSMEc2WTWp483
         PJAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EXmm3to5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 206-20020a6218d7000000b00528c6690363sor3272803pfy.46.2022.07.08.08.47.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EXmm3to5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iiRXuoRm0+6hZcCT7CVhc/aX8fiaQgpUOM3IjX/kYqE=;
        b=EXmm3to53nsWS9DEDIkMCrgn8NrlmwgZC0zqNF0sq2jMvUgM86rlQVlpm+BOjLiMig
         zI73swUSdOvgPIT2s6enl1Vqs85aLOgSY58HzaHM0QivPslefXfMr1f38LYGIUHIVwtk
         JMO0rEA8IlkAymc8l1yRM/WanxNeIp2isRHADdMWKIv57E3iiDgGeuWdYwrcDo2qWM8h
         kMHCBnZBiXLG4ZWyfQ7Nfqf3zXK3OWt2uNRE2VQSG7gQjNWz4XJgyxCDF5ajolKLc1G4
         F8iaXDUNsu2MvglKfZJKq6ciNbQyvLvbAQ7PWFmLrmdLakH4CdzjX9/6ix+/5hJo1IEk
         wm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iiRXuoRm0+6hZcCT7CVhc/aX8fiaQgpUOM3IjX/kYqE=;
        b=FbEThZTUqaHpGc2BkvA48toW+rHE+XikJgxgFX8Byggkz41KdH+1VY2bMUd3bG4yeD
         cOY6khF8W/glHUxwz/8ZaDJ2f16MVxKmb8rVczUl47Y7y++EBsWceWI/S7oLZbOoS3VF
         bThxpzU/hpwN+9IrGXTWQQb1yEphAX1En1z9rf8gw7QMJp52xIwFPa1EPTAtr99AhhFt
         eZJ/b/N/auwgKKi8oEWB/Fb68MOAuoDXoEcKPi8Gde/rJpUY9U2Eh56aSXqspdC2pOBN
         L2Rylv+G4eVmMT9bnyqAu8FZaCH9UFPcH35WXy8b6DKXDcPLShQG6ioHMtRMF0fIrzmZ
         T9Pw==
X-Gm-Message-State: AJIora9jbm1ElA5vSsQ76SpwCf/a3KTU9EW4EEb+kRgesFcJx8vKwezu
	3ZUs1q309O9Kv0UNOxvS2piZjUIBz1hvJeH2E7s=
X-Google-Smtp-Source: AGRyM1vRq0YPcAc+6t0N3Eappi4kTgoYPE8pENcmvxwdkjIWfzASmXf4T2K6rp/6gkz8NlUaBQvkRA==
X-Received: by 2002:a63:481a:0:b0:411:7951:cbcd with SMTP id v26-20020a63481a000000b004117951cbcdmr3866584pga.66.1657295229649;
        Fri, 08 Jul 2022 08:47:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 01/29] Use bool for tracing variables
Date: Fri,  8 Jul 2022 21:16:32 +0530
Message-Id: <20220708154700.18682-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GdBJEy8NtANc

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h    | 3 ++-
 reginfo.c | 2 +-
 risu.c    | 8 ++++----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/risu.h b/risu.h
index 8d2d646..e2b4508 100644
--- a/risu.h
+++ b/risu.h
@@ -17,6 +17,7 @@
 #include <ucontext.h>
 #include <stdio.h>
 #include <getopt.h>
+#include <stdbool.h>
 
 /* Extra option processing for architectures */
 extern const struct option * const arch_long_opts;
@@ -96,7 +97,7 @@ int recv_and_compare_register_info(read_fn read_fn,
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(int trace);
+int report_match_status(bool trace);
 
 /* Interface provided by CPU-specific code: */
 
diff --git a/reginfo.c b/reginfo.c
index dd42ae2..1b2a821 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -141,7 +141,7 @@ int recv_and_compare_register_info(read_fn read_fn,
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(int trace)
+int report_match_status(bool trace)
 {
     int resp = 0;
     fprintf(stderr, "match status...\n");
diff --git a/risu.c b/risu.c
index 01525d2..79b1092 100644
--- a/risu.c
+++ b/risu.c
@@ -31,7 +31,7 @@
 void *memblock;
 
 int apprentice_fd, master_fd;
-int trace;
+bool trace;
 size_t signal_count;
 
 #ifdef HAVE_ZLIB
@@ -228,7 +228,7 @@ int master(void)
                     signal_count);
             return 0;
         } else {
-            return report_match_status(0);
+            return report_match_status(false);
         }
     }
     set_sigill_handler(&master_sigill);
@@ -250,7 +250,7 @@ int apprentice(void)
 #endif
         close(apprentice_fd);
         fprintf(stderr, "finished early after %zd checkpoints\n", signal_count);
-        return report_match_status(1);
+        return report_match_status(true);
     }
     set_sigill_handler(&apprentice_sigill);
     fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
@@ -344,7 +344,7 @@ int main(int argc, char **argv)
             break;
         case 't':
             trace_fn = optarg;
-            trace = 1;
+            trace = true;
             break;
         case 'h':
             hostname = optarg;
-- 
2.34.1
