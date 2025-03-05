Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp911875njm;
        Wed, 5 Mar 2025 08:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSpc19YPFjH5e4ioVQk9Me+LqGbL41b0/MwSdFkfYrDi5SUhuD8Xn/6eBQi73mBYVAUz+JaDymFUfdgg==@linaro.org
X-Received: by 2002:a05:600c:3544:b0:439:a1f2:50a3 with SMTP id 5b1f17b1804b1-43bd29462e3mr28817425e9.4.1741191176562;
        Wed, 05 Mar 2025 08:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741191176; cv=none;
        d=google.com; s=arc-20240605;
        b=RSCr3hi2nlnQwijXwQLvPHa/VBqVUCj+bS8MeIdj1mUHGjOsSIauOP7NFhDaD+mwhL
         Mb2YVGsfNFoBXWw14ZI5tpfcY38cyr0y+qf+rgaSxaCwewQv/HCu5iZkdHY86olMUO3B
         fyC0emlsRDM6IWTOLas8pznvI11leZH+oe8UOsAlTvs1b+8Xywa/AWxql+yiy6uxd6Nf
         GvqTWGnzQScUFlr0ujt3V4io5cOFRkbbe2bkemnVRtUxExAYukSmLLJ7DVnP6oamHNCE
         rQZCiYXqRpVdJ0ET7hXzxssvC4FXX97TgZkElUsCkVxFYhAfwoRzZl9QaoEZOj4ZRN6N
         0afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5iRGFcNlfrygrR4654WJl6FH925RxAyYFzhn3HJMQeo=;
        fh=6tDrKUwR5Agzts2Czvhsgg5eyIMrlMWFUeQU4noaM34=;
        b=SOJSjzdCh887933N5dxgEs02EIqaONlDa6ynBz5M4oXnvf2dxeDpLDJwxunDl0xrS3
         O6v8vrjgDWWfIeNseD/Ypac4vYiFqJBLawGBhMvTnn3rk5XGLcRqthIA94FWws6aBJnC
         Ie6bjHx3MOsP74IugYatqTJnrnlLGkTxWeckdDBDZMVYcz/ehta9Xpt9fHmHVwBirb9g
         RjHlBSVM7m4HxZyGQh3cdgqKtyzenxQHcoaYmTKZm+kqC9sMd1a+k7d5Dw5FnATicG6l
         Ihug/OgySZbItZc26pSI7Wjo9gfSFOFHcAGLkyzCWmYFlJY3vAb6Jl+AMK0SL+j8kDae
         bc9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ocKq8Z/F";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43b73702107sor62467435e9.1.2025.03.05.08.12.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:12:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ocKq8Z/F";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741191176; x=1741795976; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iRGFcNlfrygrR4654WJl6FH925RxAyYFzhn3HJMQeo=;
        b=ocKq8Z/Fx44q9QgUZBdjRLO0SmSPKqpE1mMSpwpFY3dSD/U6wY6okhL9a6hD9XDBS8
         4bzCvCLuPyylhtO1HxWG1vEN5q8QPoagI+htWw6jUzKkpuE+i5RaTzjUTQas1qEfJeR9
         Aft9dzWIwRhWmXIJmTQ4VTpUKfYF+j5nFsWwpgwsqDsWDHJwCBvoVHafdltRrD6kHwmP
         IqQ8J1pZ9RYmAbYINf0RT7+skqGfXSQSGiHOvt8eCVEfqVYWGI8E868FMZ+vA+YaP5xj
         PYlnt2kbcdnrFvpxxZH1xciyitrI+Wx/yMkUZgsb2avk5hjeJg13q/n5OMw0FbcyyGsg
         BYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191176; x=1741795976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iRGFcNlfrygrR4654WJl6FH925RxAyYFzhn3HJMQeo=;
        b=w+fwcs3bdOmjPPebXXUT2Q/ck0KFNF3qwSFGnKWMHKfEwkxuC6Kox66TSZBYejYiQy
         sn4P68XOkJca8bDEl4hmOKLPcn6ijLjVpp/6dVV87d+1d/ZB8yIU3qeB1a+M6yMoIx0f
         K+NyjpvAf5uIYl15jkKeooJsU7WvSxY5lriNwZdVA+YFq01DweuFLUvNHuXWUpbE+1Gq
         YQjOZV627ezpXfWb2rC2pgllBKzbBt9H02Jev4liZhh+FsxCG/rF2TPRPqA0KvmdJ8qn
         8XyH/yyWyfpUyTP0iS+XNMcdw1chzPYinM/57thXnt1xLgDd+JGTOurUvZqLD3XgJWPl
         gqug==
X-Forwarded-Encrypted: i=1; AJvYcCXlU5gcGxf12jBtpXKoc0X5lyGheKQMvRwzpAKPII1M06ArbLicnACmGXxV9mpTCYwy9zRmYJH+IFoI0g==@linaro.org
X-Gm-Message-State: AOJu0YwcXPHCsfmTVOt4eOyvuKShWh7c4TgV60QD0/z3X6MnLMEAyw4K
	r0wpkDPQJTx1t+18B+oVxyuxzvWh5ZPNSvYKpOCEgPiSvnIHUry/gS9vww9/QrsfmQ==
X-Gm-Gg: ASbGncs/mru0kWdapBWpTUBndaqOPU4vqYVQ2aMyvIVg75RTHR19Hs6mKsZzb01jY3n
	RtJyEb00zCAiNsp0TojRer7Wq+9tODqEhjhDYjH9xBSoRNXyBzYHJdqgnrfNp16JGVMrao4Lei2
	xkt9XN1O1T9dPOsu83vKS8ocg3vM6d1rSSzuQdW7H3fj18i2C08D79J+WB5AIBAn1WDM3j9BIig
	qLlM0+wJEKire2NZlx6SYlkffXvWELxQBwFfTStmz6Q4RkPQNk1fszBzMEFs9bbmFLlr7mlchwk
	k84aow+JfFZl5ZgPXBo1SB3gfq+NVLJJooVXJimk/5zvTymbEswRcv55U11diU+a8bGIGmyPgG1
	pUwkLSDf/76bWaVzkiyw=
X-Google-Smtp-Source: AGHT+IFLvOuqcQaWIvhKOfkOIDgBwiLE7r039mnF8WCMADboJoIwCgmIqRFmjouKEZ5ItO7SLhnuBw==
X-Received: by 2002:a05:6000:144e:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-3911f74e691mr3439508f8f.27.1741191174532;
        Wed, 05 Mar 2025 08:12:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e479609asm21179412f8f.2.2025.03.05.08.12.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Mar 2025 08:12:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 1/4] qom: Introduce TypeInfo::registerable() callback
Date: Wed,  5 Mar 2025 17:12:45 +0100
Message-ID: <20250305161248.54901-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305161248.54901-1-philmd@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ks3eUk39J/Xo

Introduce the TypeInfo::registerable() callback to allow
runtime decision on whether register a QOM type or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qom/object.h | 1 +
 qom/object.c         | 4 ++++
 qom/trace-events     | 1 +
 3 files changed, 6 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index 9192265db76..f046791f60c 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -476,6 +476,7 @@ struct TypeInfo
 {
     const char *name;
     const char *parent;
+    bool (*registerable)(void);
 
     size_t instance_size;
     size_t instance_align;
diff --git a/qom/object.c b/qom/object.c
index 01618d06bd8..c62b7fd1695 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -168,6 +168,10 @@ static TypeImpl *type_register_internal(const TypeInfo *info)
         fprintf(stderr, "Registering '%s' with illegal type name\n", info->name);
         abort();
     }
+    if (info->registerable && !info->registerable()) {
+        trace_object_register_skipped(info->name);
+        return NULL;
+    }
 
     ti = type_new(info);
 
diff --git a/qom/trace-events b/qom/trace-events
index b2e9f4a7127..29af95d8507 100644
--- a/qom/trace-events
+++ b/qom/trace-events
@@ -3,3 +3,4 @@
 # object.c
 object_dynamic_cast_assert(const char *type, const char *target, const char *file, int line, const char *func) "%s->%s (%s:%d:%s)"
 object_class_dynamic_cast_assert(const char *type, const char *target, const char *file, int line, const char *func) "%s->%s (%s:%d:%s)"
+object_register_skipped(const char *type) "Not registering '%s' type"
-- 
2.47.1
