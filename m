Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp532690ejx;
        Wed, 22 Nov 2023 10:30:56 -0800 (PST)
X-Received: by 2002:a05:600c:3510:b0:40b:3519:824f with SMTP id h16-20020a05600c351000b0040b3519824fmr161209wmq.26.1700677856460;
        Wed, 22 Nov 2023 10:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677856; cv=none;
        d=google.com; s=arc-20160816;
        b=h3CIVI7WVBlBTXh5lIdHw/YReivQPEJ3Apd3iJpRoDEECXK9hP5jKADVgJlRIam5Yz
         KZq0V3eNFETUszeu/RErqyd+FduKfVrDHprWGBKV9UbIAs6KQGbazoJVoLrNHjJDb1DN
         j0M93SvpdNRqx2ZakArRONSvTmMx5+Py4RPNOk/nQ7f2Vjv/Zk0hQZ0ZWeOSOMjZKT38
         SV6nSRlKrc1LwCNgX8xEkuQJRCGSVB98NZEEasSVaMbpGJaK9FjMdmRbAMyaB3c05fZj
         FGW7s/Cne7PjjfYSy5UuIM1p+A+dX3tsYrzzLOCEZQhWs/MWBMxEp0wfsfGRFGpRiLLx
         bNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lSl3SvKqQCH/74SE8sqRcfeJMBZmOK/fR4uLmHCWg/A=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=DsdaTvnRoC5fYNOujbNmm8s75zGrh9Yt40ShIkSM5yTsClFJBb3laqbAB/084M7i+j
         j/JL1BNLaAVLZaaGOD+KfYj6yNbquk3fFxJFxf+ezSpDJ4ev0RshvMP4IyqYnDYlVkDF
         RxQwETEv1a0keMS0YCexvzX6O7cZ6pIDVhgMw7JXPCWydy6emWGgdtP92Ls43+3d7ZWf
         rsax3Y8RFtRZZ2yQA4P4Qt30pS6jtpK3PVQ6ZbayqXBRLyUAe9BdKb+XUcYGXa5R70gm
         zmms+Yxc9bnbo5MhHDVrk5vOuVl/kqxdRv3JSUKYWP0bCc5M5knRk4EtpuRS5NazO6cB
         XOVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zlCpbN/b";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j42-20020a05600c1c2a00b0040b2c1b0f71sor27385wms.5.2023.11.22.10.30.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:30:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zlCpbN/b";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677856; x=1701282656; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSl3SvKqQCH/74SE8sqRcfeJMBZmOK/fR4uLmHCWg/A=;
        b=zlCpbN/bBZ8gzAZBPmHE9mcVyIMssvffed9fJ4KZokw3ciNjcrrmhtvkzmGVetD6kw
         zJNO3PWCEMGApSz/5Ff6JZN1sFTFOipLIKnGKW76FUSTZyz9yBI5qXg0CFRJJhEP2CUm
         Jv0JKHJlkblHq4Gl8MZ91PoTozR1/XJrEebrQSUgDG/xckhdX6b53r8J7NQoSIlgijru
         9as5L6VdD7SWpZMb48J66avRwaRBtZ629vOBh+2W/r2BvBgf4YpFdaniPxp0skufODUK
         tBvAaZzfqGinfwgzY1NoY7IeuUTaf1yJRcvFGvcaJ0+vPItEidiEjBF1tBkxjl4y3otw
         qnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677856; x=1701282656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSl3SvKqQCH/74SE8sqRcfeJMBZmOK/fR4uLmHCWg/A=;
        b=N1bhlhQmhaORraBY8mhAoPHNX8+H+W3OZkYIS0MrdDpvF6tyNW18YF1oqWwI9IIyBU
         gVkPaEoTBQnsSi9lyzHT/nRjQa1rPWiJFJimPZaWIBksIcWBruwjaFoCaHId0E+6k9LA
         uA8dCXJtpYSPEpZBswJGt0dsFFd1lG6UyQqgSGrVjzC/buqaZtlMvbC6ackAeFXHFfGi
         oVccVx7W5xtGI/HgSXo78Yng+Mt5+aNtAJoefW/KCBHdVY7WfNAIOEgTH4pks7K4W7H8
         p7X0mYnDcTBzGxIPyDQw8HRnwIfgvYp7L9oa1s0KbV2Q53w4Kkg2DAPtTVzO8Cjz0gLd
         rXLQ==
X-Gm-Message-State: AOJu0Ywjhl+spgz/WRhAHmf8SMO2znYcd7sI+ywyVHxSEcqptk/e3sN1
	KvXcyOtzNDe8i2O4fmSQjjGvCZu+
X-Google-Smtp-Source: AGHT+IG+lom2T2L1G6ppR4LSOkVj0+z1J919Ft7QO7x8s0p9VZICGrYQcWydldiJjYb9B55ciEXU+g==
X-Received: by 2002:a05:600c:1991:b0:408:53ac:141f with SMTP id t17-20020a05600c199100b0040853ac141fmr2507005wmq.24.1700677856143;
        Wed, 22 Nov 2023 10:30:56 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c431500b00403b63e87f2sm176451wme.32.2023.11.22.10.30.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:30:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH-for-9.0 01/11] qom: Introduce the TypeInfo::can_register() handler
Date: Wed, 22 Nov 2023 19:30:37 +0100
Message-ID: <20231122183048.17150-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QPEfJ7cNSQqg

Add a helper to decide at runtime whether a type can
be registered to the QOM framework or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qom/object.h | 4 ++++
 qom/object.c         | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index afccd24ca7..0d42fe17de 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -372,6 +372,8 @@ struct Object
  * struct TypeInfo:
  * @name: The name of the type.
  * @parent: The name of the parent type.
+ * @can_register: This optional function is called before a type is registered.
+ *   If it exists and returns false, the type is not registered.
  * @instance_size: The size of the object (derivative of #Object).  If
  *   @instance_size is 0, then the size of the object will be the size of the
  *   parent object.
@@ -414,6 +416,8 @@ struct TypeInfo
     const char *name;
     const char *parent;
 
+    bool (*can_register)(void);
+
     size_t instance_size;
     size_t instance_align;
     void (*instance_init)(Object *obj);
diff --git a/qom/object.c b/qom/object.c
index 95c0dc8285..f09b6b5a92 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -150,6 +150,9 @@ static TypeImpl *type_register_internal(const TypeInfo *info)
 TypeImpl *type_register(const TypeInfo *info)
 {
     assert(info->parent);
+    if (info->can_register && !info->can_register()) {
+        return NULL;
+    }
     return type_register_internal(info);
 }
 
-- 
2.41.0
