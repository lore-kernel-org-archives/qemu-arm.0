Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700D7CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:04:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL1k-0000oN-Mv; Mon, 27 Oct 2025 07:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1C-0000ZV-PP
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:04:09 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL0y-0005aS-57
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:03:59 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so1073587766b.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563026; x=1762167826; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e7kEo0ehhrs7dmuoByZ33JGWoarerE4gA39Srxdfv20=;
 b=ct7T+UxO8ugUSpNJB6/FR7ND4o6E39239Gw8B2LXS2G+SbM+k5XDQxpMb3CXkE1Hr+
 LyohpjD9uF95+/iPx+5fMJYsPbd5uJT8TJVNiEaRVdV9LPoHAspeb1bWubDOladtTiCX
 jheWo/PbNJsXVIDvVA020QbOGH1CN/2ZEsD5RnIVNJH4WRhYQvxLE6EepoCXYIGUqfgV
 ExyPaUbjyGsqrgNCyLu2wiLfXIlDd493j4WTqPlXa6BCvH8r+4vU03DLqSUxOM9yOcxQ
 h+yaiVBYxsnPngaH5djUD8FqgRq3ThZDW0fpAMMvCEIbYDFpcwSDLCboa5RHOol9FPb3
 JC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563026; x=1762167826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7kEo0ehhrs7dmuoByZ33JGWoarerE4gA39Srxdfv20=;
 b=f5VILLahTEBvDHHphvkO+lRoIq6fuBYfY4JGbhPmp/pk9m9TBEHy/RrIkjATE2T0+L
 ii8J+c4f04Sl+fSDJiAun9YDh1/eeE5g/L7ZePIh3dPgaeiGJq9zl/TgQxP4mU2Gjg8I
 lDI3WPQLEAAGhYD6i2PJ2HgO5Sx8WHjnJt4yg1kcCdA64q/rWj8b3mQeI0UlsZy0b/oV
 elfV9oVqqDBMP2BJkx/sWuVqhOgJDFF8cIf3XlKr9+xQR3OvmhgUup96J3efAFrAKwP7
 KdvP+EpV4g3uKD+hiY3GdcV/wuQdQyIO6hhAJwvSx4qiadoBDglfAWCLAgaGw3epz0KJ
 LoWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1n4H8UU/FHW8khdziDllqCq0WhssuqRAMUY6PKvx2N3urYNQUEfIdJ8bGWbg86MfJPtNx+w1+fg==@nongnu.org
X-Gm-Message-State: AOJu0YykyRLjOBUrV+DcOgAyJvrmqPWEGbLKvz7S3iwV8AIHWj3G4FRt
 lcwO5d+eUEgs2h3UE7Tn9/ZCyCd6M1+GZvOp/WgNg4yqmubqNrPHQlWpUCskd51ilFc=
X-Gm-Gg: ASbGncvkYTHJYSFvmhzoqanEjYVwrHCxsvQMYCgVMHecWA1EyYEJgL/4tYa5gysNaV4
 GKTF5TwlbPkzn2hRSC4Hv8SLTFRAnjpaok0L5dfOkrmx6GjsKy0yYJcv9wTfK4zkyxdHB0rL6Ku
 lCBMtkwCH/M7bD3DhKVp++bZH5Rq5mAp8cNkG3LbkmQb0mOGsNBLfCV/i1xPKMULFAYh3fGTJ16
 n5j4osei9pTfKvx7DiFCMSC1Q7I5mvla20Jz1arOV7siWYoKdqJDxsRuG7/LpjoQBXLE5Dj6qzN
 rhfAvOGMlaMIJ6auLWmDxIZI6uImxUzeKec/Jzw5QzR86QcHOZwzxJcmphhzCkk6jYppEhHqWEp
 RdB/m/rqkT+IlMOosCGOMv/sBEwrtNFYukgQTsEyV0364XgGc7jBiAnn7mx/MBJ9rp6aTCZjxgR
 K5oyG7ojuUDwXLiVr7T8bipw==
X-Google-Smtp-Source: AGHT+IFVnoi+lgvob0wxO832IsVs9tVyax8HId9K0fXhGU6IYMHR6wafX1uSpDqVUcJdkDm74wm4Ow==
X-Received: by 2002:a17:907:7f0b:b0:b6d:5f02:51e1 with SMTP id
 a640c23a62f3a-b6d5f0252edmr1532617466b.20.1761563026469; 
 Mon, 27 Oct 2025 04:03:46 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853077d2sm733626866b.3.2025.10.27.04.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:45 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 372585F909;
 Mon, 27 Oct 2025 11:03:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH 01/35] ci: clean-up remaining bits of armhf builds.
Date: Mon, 27 Oct 2025 11:03:08 +0000
Message-ID: <20251027110344.2289945-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We no longer need to support 32 bit builds and we missed this while
cleaning up.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing/ci-jobs.rst.inc            | 7 -------
 scripts/ci/setup/ubuntu/build-environment.yml | 6 ------
 2 files changed, 13 deletions(-)

diff --git a/docs/devel/testing/ci-jobs.rst.inc b/docs/devel/testing/ci-jobs.rst.inc
index f1c541cc25b..b92d372a0a9 100644
--- a/docs/devel/testing/ci-jobs.rst.inc
+++ b/docs/devel/testing/ci-jobs.rst.inc
@@ -168,13 +168,6 @@ If you've got access to an aarch64 host that can be used as a gitlab-CI
 runner, you can set this variable to enable the tests that require this
 kind of host. The runner should be tagged with "aarch64".
 
-AARCH32_RUNNER_AVAILABLE
-~~~~~~~~~~~~~~~~~~~~~~~~
-If you've got access to an armhf host or an arch64 host that can run
-aarch32 EL0 code to be used as a gitlab-CI runner, you can set this
-variable to enable the tests that require this kind of host. The
-runner should be tagged with "aarch32".
-
 S390X_RUNNER_AVAILABLE
 ~~~~~~~~~~~~~~~~~~~~~~
 If you've got access to an IBM Z host that can be used as a gitlab-CI
diff --git a/scripts/ci/setup/ubuntu/build-environment.yml b/scripts/ci/setup/ubuntu/build-environment.yml
index 0f8ec5fab04..1c517c74f74 100644
--- a/scripts/ci/setup/ubuntu/build-environment.yml
+++ b/scripts/ci/setup/ubuntu/build-environment.yml
@@ -19,12 +19,6 @@
           - '((ansible_version.major == 2) and (ansible_version.minor >= 8)) or (ansible_version.major >= 3)'
         msg: "Unsuitable ansible version, please use version 2.8.0 or later"
 
-    - name: Add armhf foreign architecture to aarch64 hosts
-      command: dpkg --add-architecture armhf
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] == 'aarch64'
-
     - name: Update apt cache / upgrade packages via apt
       apt:
         update_cache: yes
-- 
2.47.3


