Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5784133njd;
        Sun, 27 Apr 2025 23:42:20 -0700 (PDT)
X-Received: by 2002:a17:90b:540c:b0:2f6:d266:f462 with SMTP id 98e67ed59e1d1-309f8e10154mr15714384a91.35.1745822539853;
        Sun, 27 Apr 2025 23:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822539; cv=none;
        d=google.com; s=arc-20240605;
        b=Fm4GhkmNWfUyJ379Fk5+UfLly+SC6NY5CyzuoiwV1i6xklO94yVT6qicnoPUx9fiFr
         Kl5LAhDE0MMDyOPUrZuCCzn2kL3rDRG9SXiEhSuwrRh8t9MrvM+ALRa6lBEWhFJTC7vp
         FvbTJDamktFxRYre89GSzxonUfcXf/3HM5xjlzLTWQXUiJqtC92uzijUqaKK7qfZgQ8y
         5iwLJFHxSjrk2mUh0CVhp7rz4RCEH7XA9i4WFu+56hMEElbJwCeuR7Thqgr/ciRA9w/9
         lnN3Myg8izkaOGOXzJBlezep8OrII/4y/6K7IVGAmDS/MoGtAySKmRjSYXvi+jtmqsK1
         I5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jNwwwrl7RJR+XvFix+3I8P23cqfaFaCyk2+AY4/Mz0Q=;
        fh=R1u9A/lHxsnwlnwWatNxKh4ZndGOrmdpMfyjOC9dmvs=;
        b=ZpGRs4+KhMTYPYR4FIV5P0iFwGXYaJQFpumHc54QaDuTC6LMwe9kqM1EHyUD8IfGlO
         7Q4lX7JgK9YbfVlWGUY5qS/9MIS0tYU7Ky5DpKyIJuU1MfaJuwEQnuD0mH7qUbprDzdo
         YfJgch5Wu4reSaFO9kl7vjPHgKaNZa5HykHIOeuCNq/+qCV/QmfTcJeKG7uvPScRIQdc
         ZEtkrjeraW6oAkH6tze6tLZegwr1oOwtmtaYASNXSuCtyHRCiNO8v7mDri+e8lpFjoZQ
         ZXBnhZ6+YGhkumW3GtXGz14WfYYFI7ayD3aedyFtFPoqTdhde/jiszvPofvhxz1nVC+f
         3IiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ipLH7AJf;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4de919bsor56996305ad.5.2025.04.27.23.42.18
        (Google Transport Security);
        Sun, 27 Apr 2025 23:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ipLH7AJf;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822538; x=1746427338; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNwwwrl7RJR+XvFix+3I8P23cqfaFaCyk2+AY4/Mz0Q=;
        b=ipLH7AJf1LPuUCqaUIgLN5LF6fvYZ7C+oUsvRgOGx2soJXAVYOHuraahRBI9VbhdoZ
         BP3XKvvB4O8OJ+JOiEChuiKnJ1F1n5mRLrlKVmUXYoSodQlFyY92yxj5rHINBiTwBcy8
         OT4L7zTgnwRMK0m3jAweRtt+ynDiCGCKWCZGcZazZBn5IzuxNl5MBTd4LKr8sHDiWgpy
         91KzJX+YWcFW3r7eyP/syh/bPZVxXyiUxcyll8/rnUSwiYeAPpfQ+KFn/qEYj41YTgX5
         h3u2LV3pyyymw9b3aCTS/JXFnu2QBfi6qKIWGMcI2swNq7epGAuV93FOZ7OwA3ZC2ZOb
         fFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822538; x=1746427338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNwwwrl7RJR+XvFix+3I8P23cqfaFaCyk2+AY4/Mz0Q=;
        b=qsX0KosfIkc21vTuS3xzj14h7XIGRwnkWFROiqeqncISlUfa3E5o6Vu6sF+oGiTCjh
         E+XUux8cHyoq2dzRbAtp24dVNE6P3YrjyqIuNbyZ8kV+B8Dti1j9okhk1QGxI9lk+as3
         OmiF4Vv1542xWfDIIC6Aw3GhPgiB2/p+RJKRlqSXwANE7eIr8hAFAuOOuQpJTYaOoMPS
         aFRNt+hquRZAQCWX+cSe19pzVDed30Y3dmzKzM290qaeu5NLiyEwddJv/ZKrqmR883Wd
         p0aJFbch2cribnKlkq8wQ1YoSHAETYDvSxMgdQuSz3Gq1qK/u+xoT6lHFzezCliguVDo
         59cg==
X-Forwarded-Encrypted: i=1; AJvYcCVRlvKp1LxL6mNbF95EvoVJE3DiAsA8IpqMBkstKjAUjInkkC1d69EqtWrTP+Xs3QtCSwbfGJ11ceLJ8T2j5xGXWFs=@linaro.org, AJvYcCVhXW6GgbJoi+Yyf5jXieZ22QPAbs4cUG9lFvbrCLjNFadNvwKTISXuCFQfENDTFcjqd4boe5qMwYvppWSXiYHm1w==@linaro.org, AJvYcCWR7eaXbrypWmpje6YiGESTJggidJKKriIDfbxpnhL9wSfUnE28OhomCqBvvBE9HMsIq9RhXc6D@linaro.org, AJvYcCX7z7If4m82q/ogZ1qWYBGK1xEVsHch/UeM2dB27dDIZ/z3Obawn3aQQH9Kp/ljslnlDp45PI5XejTT4eIj@linaro.org
X-Gm-Message-State: AOJu0YwACy+CoMzu3b28Qs7KXhFmFdSDJbhZOd6lYVR3rUNHZROw8u0l
	RaSnySnedjMLS5HtrB3MxRqi6MqLee0c70G1U0KctT/o9Tu6d/Eh
X-Gm-Gg: ASbGncvUxWW+lWyC3myTUhEXzb9o0onK8ZOK9dhFvKrwzgWJe/W3mtBlr0xc2XqNBx4
	BDy79rbEg+de2OIdkrXxBLIJQBSXIoJ5C9HEDMdJ2sZknVWT7Bkqq0aBtWycieW9+NlW4e4n1kK
	MaUEjVtVCDskMuBYtwJrVMesMXT9jvdEk5/2kVQXxF+mJdMET8Ii+bU2Qj4k7X7COUp8VRpCCHP
	1EGosIfk5Il6COp6xr/5ro6vRez5Ww73Vx3/4N6dCUM/UWznnd3KQ5ee16rcv/Vj/Tr2C7sYE3c
	NffOXqOK7FlaMoVESx96Tc2P1114LZmrX6de/Q==
X-Google-Smtp-Source: AGHT+IF/xXTCDS8WdC2brXQez0mtJvz1TNNEJoWG1hHdw+LzWmlY4pW7cKPvxEKlwQLmoKbFi2G22A==
X-Received: by 2002:a17:902:ce8f:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22dbf5f080dmr158540675ad.19.1745822538187;
        Sun, 27 Apr 2025 23:42:18 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:42:17 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 20/20] gitlab: Enable CI for wasm build
Date: Mon, 28 Apr 2025 15:39:09 +0900
Message-ID: <ade0deb2dc65618a91755590f6729485b4001b94.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Mu4U+M7Z1J/X

Add GitLab CI job that builds QEMU using emscripten. The build runs in the
container defined in tests/docker/dockerfiles/emsdk-wasm32-cross.docker.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 .gitlab-ci.d/buildtest-template.yml | 27 +++++++++++++++++++++++++++
 .gitlab-ci.d/buildtest.yml          |  9 +++++++++
 .gitlab-ci.d/container-cross.yml    |  5 +++++
 3 files changed, 41 insertions(+)

V3:
- Resolved patch conflicts against the latest upstream master branch.

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index d4f145fdb5..118371e377 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -115,3 +115,30 @@
     - du -chs ${CI_PROJECT_DIR}/*-cache
   variables:
     QEMU_JOB_FUNCTIONAL: 1
+
+.wasm_build_job_template:
+  extends: .base_job_template
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
+  before_script:
+    - source scripts/ci/gitlab-ci-section
+    - section_start setup "Pre-script setup"
+    - JOBS=$(expr $(nproc) + 1)
+    - section_end setup
+  script:
+    - du -sh .git
+    - mkdir build
+    - cd build
+    - section_start configure "Running configure"
+    - emconfigure ../configure --disable-docs
+          ${TARGETS:+--target-list="$TARGETS"}
+          $CONFIGURE_ARGS ||
+      { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - if test -n "$LD_JOBS";
+      then
+        pyvenv/bin/meson configure . -Dbackend_max_links="$LD_JOBS" ;
+      fi || exit 1;
+    - section_end configure
+    - section_start build "Building QEMU"
+    - emmake make -j"$JOBS"
+    - section_end build
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 431bc07d8f..248aaed137 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -792,3 +792,12 @@ coverity:
       when: never
     # Always manual on forks even if $QEMU_CI == "2"
     - when: manual
+
+build-wasm:
+  extends: .wasm_build_job_template
+  timeout: 2h
+  needs:
+    job: wasm-emsdk-cross-container
+  variables:
+    IMAGE: emsdk-wasm32-cross
+    CONFIGURE_ARGS: --static --disable-tools --enable-debug --enable-tcg-interpreter
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 34c0e729ad..3ea4971950 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -94,3 +94,8 @@ win64-fedora-cross-container:
   extends: .container_job_template
   variables:
     NAME: fedora-win64-cross
+
+wasm-emsdk-cross-container:
+  extends: .container_job_template
+  variables:
+    NAME: emsdk-wasm32-cross
-- 
2.43.0
