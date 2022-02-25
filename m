Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1924505lfq;
        Fri, 25 Feb 2022 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ns+fYWljoLwi6Vr9txF+6QpXpSI1wN1Odp6zKAkN3xM=;
        b=mElp9feFVLRiU8AnVqG5imkSHn/hXUNVoCNeTyBFOUP/OnAaYY8i9DLqfMvypQPnIH
         MKgoeWz3Zj2wn3GCqS2U5pi5WWb7ve4Te1XIy2SmFRNlUTplQ1MHdLC+Y6Ad+1yOpsnl
         y0TJ7my6Rmr+S9X9RRhnLvwX1JVChZj+jW0JSfre0OAn2SajtwHzIoGKIp4z72oS/2TG
         /WIzXTvX14jfxOfnxdS/G5CCkC/TsEbizepv4exNOy8wnV/YkxnxtCIKL7bu+VZyaTKh
         7//auBYyNKWeYQZJgQohzUyvJIquZ9jXid+I7LBC/fGb25sn2WE0R9B2O7H7YxLeMlYw
         dTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ns+fYWljoLwi6Vr9txF+6QpXpSI1wN1Odp6zKAkN3xM=;
        b=B+7DfQ5LSEsIYC4fQ/dElWNgXykL7c3yd79Ludvl9yle2Q6NIuN/OYcUyWDb9+tep6
         Rm+YnAGfuG/Bt9W66kIjbf+zePHLlSFtNooWtck1jQlLuqK1ucSf90nuvLsCuy0xvF1m
         BpwVTRBdAcvMKn05aVHKqkapANw3MhogV06oju/y1g9d21z91xZb0NFySlX3HHEnT4nj
         EVjJWgdAiOK8peOM9+pvLyCTIYWuenCbBz27ri6A/lAOb9hglj5SCFVG5mehp7NM7Byc
         dDHq/3dkPSG/UG/123u5CqhHWfKxb9aCMfEkZIN8ceUAEwZOZOa5gcUwirU2r16Ttv6R
         66Ug==
X-Google-Smtp-Source: ABdhPJx8FAP6F8AOH0xapCoWbOy6K5jD7XciJgJ20BJpxMUkH4IfWMS4Fet1VM0FfCcyXzGryfxqCw==
X-Received: by 2002:a05:6402:40c1:b0:412:b240:dfeb with SMTP id z1-20020a05640240c100b00412b240dfebmr7809739edb.239.1645809632251;
        Fri, 25 Feb 2022 09:20:32 -0800 (PST)
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b006cee1bceddasm1202190ejn.130.2022.02.25.09.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 055B51FFC2;
	Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 10/18] tests/tcg/ppc64: clean-up handling of byte-reverse
Date: Fri, 25 Feb 2022 17:20:13 +0000
Message-Id: <20220225172021.3493923-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: n8yNc5rhBhIL

Rather than having an else leg for the missing compiler case we can
simply just not add the test - the same way as is done for ppc64le.
Also while we are at it fix up the compiler invocation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/ppc64/Makefile.target | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 0368007028..9d6dfc1e26 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -10,19 +10,14 @@ PPC64_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64_TESTS): CFLAGS += -mpower8-vector
 
-PPC64_TESTS += byte_reverse
 PPC64_TESTS += mtfsf
+
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+PPC64_TESTS += byte_reverse
+endif
+byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
-else
-byte_reverse:
-	$(call skip-test, "BUILD of $@", "missing compiler support")
-run-byte_reverse:
-	$(call skip-test, "RUN of byte_reverse", "not built")
-run-plugin-byte_reverse-with-%:
-	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
-endif
 
 PPC64_TESTS += signal_save_restore_xer
 
-- 
2.30.2
