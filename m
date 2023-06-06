Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3795167ejb;
        Tue, 6 Jun 2023 15:46:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:988:b0:653:91c1:1611 with SMTP id u8-20020a056a00098800b0065391c11611mr4663248pfg.14.1686091573403;
        Tue, 06 Jun 2023 15:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686091573; cv=none;
        d=google.com; s=arc-20160816;
        b=n5vAI5ZWWcrfrVuNoHbDH4PTKkOAr7OzVl9xw5cWeqa0FTqnZrvKS6joiUHYEh+N4P
         PaWfrNNmx9n/FHGB3EeDYfbUL0q733An0gS/m7QF3CSBh1wx/INalgDih95ecmsCQKJ8
         obTk8cMnhe7vlqHIveUrGnqOJG9xNPFz/EVr1Sd5tB1LN/Wx0bI0QypfRES0c/R7k2lA
         3H3wrIEHg4YIB41T2OWU+Zdga9EZYO+QaQFnsnHoFuRs/q6TOnwFUEtE8CpQiHaRwar/
         tDmdiYXc6hZrH8+rBpLeRkKn+Ifz2u7LJa8iGiDotRqztZRlJJURmCij/8+09Z827qek
         /wkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DkTYcH4LNlY/B3s1+2jz5JvJQylcIE4mksKLEpxuLsc=;
        b=rrD1L8aPWw4SyMwOrdSyekcvhg2Lm9trrli7AyL24tdd+FWlStQcD0tywFSaZlIVR8
         3yXjHJFlpce7zPAab91VS8CJppd/yoWGXWc5uMFR2E/ppY9UpoBrb/l1trzPmZhQVe1G
         DTq2fNs+08tfEbHuHdQBQWU+7XpbHqc1oRiZvpTTKp9qFkhLqIE08EUzDjiFoBe13y7E
         gvlAHnxwp+a2MPIsCamsfPl1WiBNmKRWqOfdYPDoURuUVz5zFr9Xy+LaY6KrFOczzhaR
         TxYVx/lHtG0lfLToCEEr2tRGOh/OSHjBYKqd+PonRErRQ+JHCEVRzubbTmZSiCsjNpAD
         cAQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PndiyLv+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b67-20020a62cf46000000b0065f9146a1cfsor2226257pfg.0.2023.06.06.15.46.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jun 2023 15:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PndiyLv+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686091573; x=1688683573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkTYcH4LNlY/B3s1+2jz5JvJQylcIE4mksKLEpxuLsc=;
        b=PndiyLv+BMaZ34O7m0V3FKkn4UxjU+qWLG9c3F2GaCbvOSj5soChsPABNRbQjGvi6j
         vwLbZaVQaAnLQ5ZXX4uFGsO5/I7SGA3dr+wBwYrsoMDOu4rf9mnSkhCTBFMNd9YXilFt
         FgbyxF+mjVXJeXnCxIM6+b+4+uOIc0HYZ8NGid8q89x9uAfcYzdYEbYzOt0iUWnsbPZy
         CuWDa6gNwzQOoCnN8ImwdsDFi1ae3BS0YCgcGnKflXlKWr69q8BCMaVzaZti2Bsb4DIK
         yOkpx4hCs7FwMiTbUEj3IYv/Sy0Agb9LVUTaTWCZHtZTadYcP4Gwm+jShuOQcmXdJ/kl
         AHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091573; x=1688683573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkTYcH4LNlY/B3s1+2jz5JvJQylcIE4mksKLEpxuLsc=;
        b=eeNAq9YSDJfSHAqnU11gacev0JCV/YCWioPdTeK2bGP5ZPKPG+F23M6yyvySFFClf7
         g6jYqM1YTwCL0yzEgan4XGKr34CiVPIWGScIqYf/lkA36jCE42goPyrbK7oNpFC1j0Xt
         HYPmCIPe8M4426UC+ax8c2hczQBCefNEtIDf8QDuX2IMN0l3BJdDNPzWM80NYdHWKNjp
         6tauJ5wHO3pp3nTTCmQYj+cOJoGqJIftohtK5sUMrXouJBmH7hUrh+VYpSz8W/E6f4Mz
         fkxOjOOF2vDyQnX+gJ12UClRKdt34ZwFnwI3+ZQDViXHGyjN82Dr2LaJ05pip8joXUDq
         VP8g==
X-Gm-Message-State: AC+VfDwGJlVTEmmFFJARiHEQtc6/z62CxmlwcaafTfaVXAYuYklnnLO0
	l1B3UPGRhSJZQ9ClDBvDJi9OX74L
X-Google-Smtp-Source: ACHHUZ4EKEHvWf07z0wKDpHEhVU3e3QWZOgDsV1LeHDDf9kRtGmnSI+O/Vo8TQDto7VTETyOvfHFng==
X-Received: by 2002:a05:6a20:734f:b0:10e:440:6d36 with SMTP id v15-20020a056a20734f00b0010e04406d36mr1314939pzc.1.1686091572870;
        Tue, 06 Jun 2023 15:46:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
        by smtp.gmail.com with ESMTPSA id t8-20020aa79388000000b0065cfd5cbef3sm3346969pfe.15.2023.06.06.15.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 15:46:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	thuth@redhat.com
Subject: [PATCH 2/2] gitlab: Add cross-arm64-kvm-only
Date: Tue,  6 Jun 2023 15:46:09 -0700
Message-Id: <20230606224609.208550-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606224609.208550-1-richard.henderson@linaro.org>
References: <20230606224609.208550-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cy44uYq4n4KI

We are not currently running a --disable-tcg test for arm64,
like we are for mips, ppc and s390x.  We have a job for the
native aarch64 runner, but it is not run by default and it
is not helpful for normal developer testing without access
to qemu's private runner.

Use --without-default-features to eliminate most tests.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 61b8ac86ee..1e0e6c7f2c 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -29,6 +29,14 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
+cross-arm64-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: arm64-debian-cross-container
+  variables:
+    IMAGE: debian-arm64-cross
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-features
+
 cross-i386-user:
   extends:
     - .cross_user_build_job
-- 
2.34.1
