Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5073065ejc;
        Thu, 31 Aug 2023 06:00:37 -0700 (PDT)
X-Received: by 2002:a5d:5502:0:b0:31c:84e9:20fd with SMTP id b2-20020a5d5502000000b0031c84e920fdmr4080794wrv.13.1693486837237;
        Thu, 31 Aug 2023 06:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486837; cv=none;
        d=google.com; s=arc-20160816;
        b=rU72H+o4iDuYu1l+1uKCnM1awkQd81RYNhnh2rzuvY9b4nS+MNIDyQ5AMcZVHEkeei
         h/QhJ+CiL1qgQhi5w1L9FL494LWWwOhsMfVuN2y/hqelEb8905Fb8dfcFYBvU+dH7RdB
         oz1Rwnc08PQ8lEHUU8JixiHSQD2/QQpWbFs+MqmjjToEGF1IN6Ixj6PQfkKR5cVv3TaG
         6fvWgsOzFWQ0xIh2b3aZOwDpzbZRYruDxAR4OVOjNc75POa+Fzq62bfmyvP2w6K/NDpI
         H/qf6L1oGNoImGhEPTSZHQQpQe2QJeMzD1SM9sN5yOgv7XsEb5Qs4VSWong7YwyhjAwZ
         j3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uHTYP96hxROQBfiRHrUY1wrTC25GMnf+igTYqzxdbDE=;
        fh=zn6o0f0gv5ZkC2kYOnqwo2ZvBbLYdyI8P1mhTaqTiyI=;
        b=0ZpWDjM//SUEnkNif0mcfo0m4lkHqGEZG02EVefC/GWcQZnYpJmCxyn/Y+q+uAaxeY
         tA4Di90xrTEgsrdFqox0ij8jcAYiBfALBo6XHY8EAGChWerI+xmYyjWUM8/nAZhGt2LG
         u3db6XhIHgidNvanZZKyGyIiQTh8K50ytqxFGXUmGz8Ai/630EUQ7DKgSex5yB46jM3f
         O+pVvhDgkstFAky++RF90eHrStFVgOROKGSNGafpKqc9Br7fB2d2LlynoccMXDctH9Ov
         kEYAfVgq8KppUfLUA0zHeGKuA6pLQbSazFnZpLoMA0t9/SbZoe/8tkrytrRlbRjJvTFd
         vDhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XSd/++v6";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m12-20020adfa3cc000000b003177b461658sor614098wrb.1.2023.08.31.06.00.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Aug 2023 06:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XSd/++v6";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693486837; x=1694091637; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHTYP96hxROQBfiRHrUY1wrTC25GMnf+igTYqzxdbDE=;
        b=XSd/++v6QZt8QNr57kbnuJt4fAvJA/8gbY0Nho7Pxv2kEvcZm8BEK3ybvJjZddKogh
         YkNev9lRb++LeJP8l26dwh15Hlj0CII9VC6cvk0TI4eC+XpDawW8efx5Y2CD+FA0vjf/
         SRZ4D0xjGyhCZAU8hUWCMtavh9jxgaMG4Z+OgJw2fO9ngNTP8so3IHK/LAuT9ocxXdNa
         hAij4ksfFgE1DnIr0EA6a0EGi9aKYL68IjonXSz8bO5mezEAzg6edNy8o0WeNOQEmv5t
         qunC8kOASw94XjqW4A/DG49JVALvzxePkBweNZX93yS5r3qNR/8gEiWRvzgjX77yZxyL
         d6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486837; x=1694091637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHTYP96hxROQBfiRHrUY1wrTC25GMnf+igTYqzxdbDE=;
        b=QGI6DHyCQ9A2xtHLJVsyd1ACEc4uF7enlw1KGlbwucKnXwNpXdjNqbjVzH4g82cKOE
         TacSwfSS/gUYMDhArjqTfA1MG7qTLjojVbT/XYvEXFz+DUzF8VLghgpCzRzEA5j0yiQj
         iQiRNzzlC/eTdPnAHZoBIKzYURHIvu2sjdZGXQ4o32zFtjCJLNqalhBT3FpWLwdbz2nN
         ZXJhT5Q+vHEpL8BGmakhqHUQFIEskqo4lbLWcdt8lj4OkC8taEM0lUDm41K0Eow/eKNe
         sTNTgQQQrcHLl7b51s2UCju/62hJe0110Up8CBym7CKAuiMu/dZM2zWci0P6oJ4GjX+1
         yTKA==
X-Gm-Message-State: AOJu0YxXSptXpxXnhBlsRJ4+n1JULr73iBe2q1eTlbP4RHCzjCv1ArKx
	1iZ/dl9BP5DxRwo2xz6hTsR7ooZZ
X-Google-Smtp-Source: AGHT+IHSfjXXbD7/9ei3HXX1kSg6gDM000wd3/dTlZv3LZYaKRVUta2cW+0Bh9erRMeVWfzJCTAoYw==
X-Received: by 2002:adf:f5c6:0:b0:314:3b02:a8a8 with SMTP id k6-20020adff5c6000000b003143b02a8a8mr3761369wrp.55.1693486836365;
        Thu, 31 Aug 2023 06:00:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.245])
        by smtp.gmail.com with ESMTPSA id r5-20020adfe685000000b003143867d2ebsm2189041wrm.63.2023.08.31.06.00.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Aug 2023 06:00:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 38/41] docs/style: permit inline loop variables
Date: Thu, 31 Aug 2023 14:56:40 +0200
Message-ID: <20230831125646.67855-39-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1P5iFz1JUbO7

From: Alex Bennée <alex.bennee@linaro.org>

I've already wasted enough of my time debugging aliased variables in
deeply nested loops. While not scattering variable declarations around
is a good aim I think we can make an exception for stuff used inside a
loop.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20230822155004.1158931-1-alex.bennee@linaro.org>
---
 docs/devel/style.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 3cfcdeb9cd..2f68b50079 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -204,7 +204,14 @@ Declarations
 
 Mixed declarations (interleaving statements and declarations within
 blocks) are generally not allowed; declarations should be at the beginning
-of blocks.
+of blocks. To avoid accidental re-use it is permissible to declare
+loop variables inside for loops:
+
+.. code-block:: c
+
+    for (int i = 0; i < ARRAY_SIZE(thing); i++) {
+        /* do something loopy */
+    }
 
 Every now and then, an exception is made for declarations inside a
 #ifdef or #ifndef block: if the code looks nicer, such declarations can
-- 
2.41.0
