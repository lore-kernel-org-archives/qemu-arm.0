Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644C8C531F7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 20:10:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmzjJ-00063l-1g; Thu, 23 Jul 2026 16:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wmzjG-00061l-Ug
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:09:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wmzjB-0006eH-6J
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:09:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47f878135e0so639990f8f.2
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 13:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784837346; x=1785442146; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6UU3q28wGPDgoadR3MrsTsOccux2D+0NMQOVoYhGlq4=;
 b=afyjLhLGzCnlD+QTM7Zu+g5T4fRtbH1xdUHxqXsIs8yvkiUcPB8wKZ1jtbyH7nQGns
 Ug5ysl1KFfPIBDZ9yXUeMa2dtzXjAAZW9mMIpg/nZVrG+ByYrqvtos9FVhJ9v0pZoFah
 WIkwx9dkbYDwiFnrqGvJ8RdGpjMt2oPUaM8Q0AVF655ZkGlXWNnlJ1NXuE8S6AsOgFgb
 4U2fZYzgBjR2oFFZBaSy58XzZ+nUyIwTs+f0F+jQdUfGGUK+5aEsxiyb68LKZywWuKWD
 A2cyQA7iI2SG+irs5GQ5w1ZMiAHuSZwjfDegRQeR1qTYCeCeOnoZ/tywcjH5AxVmpnXu
 o8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784837346; x=1785442146;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6UU3q28wGPDgoadR3MrsTsOccux2D+0NMQOVoYhGlq4=;
 b=LcP9ttAbaRlnFeZQarieU2hYHCTvyXCCNsVT4i0KDzqcuCOs54xIGtb7BuVJvAJbut
 srkVLSy5sWaTUlwQX/NiOABEOuNLOTfDOhvOXLTWO0ofwo2VwfbdnEzZ23SuoUapadY/
 3Z6mimwWTKnATjPEqmMDDKp9C1Xs9R+lBXnjdhzoB5S/nhjBprngifWeTi+q1r16hs4H
 TvooL8tWP87aXhQqazdWy6b03ZSpwa67dNl13od9at0r7qIacB9xHcz8qKBJRF9AWq0x
 Ccnqbf4NgvnEpNpFDdG3/HuoxeAm6hrMu9xjagkiWc1SRwOb7plZUAGN6f2tiQN7ui49
 1g6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro+p89kkqYll5GpmplQx4RhLba89ZjH2PN4gK/xHwhGTsSSeDmAG6sSL4bFR8b5aFhKomIVFJPswg==@nongnu.org
X-Gm-Message-State: AOJu0YyZshG/dzkVOB+uPg17axxf56lr2KZ1ixz9r3fRrzfF8SWa5hnS
 VwSea8tnNVNlWcCAyo1PiMyQ8QO66UhMYSe4CjGgeVgyUwHSQruQY8v0G4lGLX+wLbA=
X-Gm-Gg: AR+sD11dSQqIGdFb4QCmIjnESOn/jvbNw4sRiDspHAgj5veOVx2rzvosFMK8HJB6h/k
 3R8IEH5mni1kMIYUs2Ub2CBbDXVFbUPSP8TI7m1muCYbYR7XaEdyLo9n8Z+YchnZaP5Qwz4zLRy
 HRj2h5sl8YvxFqIWcZMqvQnF4Gze5Vv1BlGKdz5uI4wjfA8sJ1PGaY4RWoAuFDILJ/Uz8C1eNci
 ZhZImPOhaaeCvZ7TA2FtTAMi8IaNcxLTjkkUFOKN6CkPa3eDWDajy3M93jTd+dcTgBnbGZSuiBs
 sqaO9fsXPwZG0uVnMRpa4vDFxtFoLB4AyXoxPPzxNFjTeiJ3GIMlZ9PzJWzbF7wNkQFBJXHEvTE
 LE+BBbTB0f2N/CPxJHB9kCndFIB5ARFF7yMlbiaEKD31Qv+sd+4N8ugpQcSolsHNOG6ofB/q4hN
 Q5XXMLpZJY8hwC
X-Received: by 2002:a05:600c:3584:b0:493:bb6b:5bb5 with SMTP id
 5b1f17b1804b1-49573ccd914mr59631535e9.13.1784837346482; 
 Thu, 23 Jul 2026 13:09:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957af78639sm16891645e9.7.2026.07.23.13.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 13:09:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BAE8F5F8B4;
 Thu, 23 Jul 2026 21:09:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Brad Smith <brad@comstyle.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 1/3] gitlab: use .base_meson_job_template for macOS jobs
Date: Thu, 23 Jul 2026 21:09:02 +0100
Message-ID: <20260723200904.224413-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723200904.224413-1-alex.bennee@linaro.org>
References: <20260723200904.224413-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

This way we'll get more environmental information which will help with
debugging.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/macos.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
index 641a48b3832..bdb3eae18f0 100644
--- a/.gitlab-ci.d/macos.yml
+++ b/.gitlab-ci.d/macos.yml
@@ -1,5 +1,5 @@
 .macos_job_template:
-  extends: .base_job_template
+  extends: .base_meson_job_template
   stage: build
   tags:
     - saas-macos-large-m2pro
-- 
2.47.3


