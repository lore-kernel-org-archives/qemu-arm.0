Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCB7C982C4
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:32:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6rbP-0002km-2w; Wed, 16 Sep 2026 11:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6raz-0002ID-NB
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:51 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6rax-0001Wq-Rb
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:49 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843c3ea1f6so514674f8f.0
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789572646; x=1790177446; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dM4u0r6eILzCbZESrBWVF/DDnjUwt9qXh1+CvKMqj6s=;
 b=tqT6fIFzsTg/gDqzfEZnO0iEP9sWwluipfoqMTIzSuGovRu2o00nqr7Wrwar03SY1M
 v4nDRQKXmttnJpMeJWgM0Z33VyqUhFzP0J6yuPvtdrvX2EWaC4CzxGGA2KmoGB/m4DHI
 Wmgr6RQlVw6ihWFgT4LSqlVvLtN4C6ueK4Omi4qv0N6moulQZl7NPTKEn6GaNc0BT/TQ
 WeX3+qbEzMu6WeJg/PYsumRsfCAIbkneSFivEnU09vF6l1LiFCFEOKLXc1+QqZ0q6g6a
 fzE12+LNgIB17RT9GebXWPsvG30XOaZrcsB2+2lQRCuBUav8rck8rB6dyvixLbtP9n3g
 Hkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789572646; x=1790177446;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dM4u0r6eILzCbZESrBWVF/DDnjUwt9qXh1+CvKMqj6s=;
 b=D5Tk3FjjYPmg2yOD7gel8lS7cY+CW5Vh7nkiq1McN06hLuBAxXzCs0po1jeNUlnb11
 yZhOyNEviftJ/wt4yvu06OWb79B6PYIYbzXedf8kkNb+IjG2L6kW9R5LYb+4aySw/h+Z
 lumYNhCAZt/6sQXYbnJU4TRoPkB0rEYe0rrX33f1G0zTG6yKpePTNK4Sf1/fUVUlxG/L
 BZNa1oF+7Xf95AQki7YGQLYJHuHE3JWUsldoiSmJAmhg5+Gx6jy6n6nTuri2oUQdsF61
 RhT68STU+Y8zMJEoj+rINIR8ClKOCIhSm2n9I1Zim7vAXBB4BAzLR0F9U33GVeiRoNPB
 Wqhw==
X-Forwarded-Encrypted: i=1;
 AKwUvByZM0a8lPz48n55iFGmSWTu0LFrBURcwocx5gGRdGZYE9ALKP47aHOocwwwKPcBtP0fBrb+X2s9eQ==@nongnu.org
X-Gm-Message-State: AFuF++mPDVTfXPaNyd6Z6GsXIQ0QWHLxKcL05qCUJHQ/2Cz9/U6IMa1m
 l2B+sF7Smo6WIzC5g7QBDNdxtdDls3q1Ckr+4g6WOB0Ec+hsuD7BCQMMzNljnC+GZko=
X-Gm-Gg: AYBFou2F0foqqAxiQv1cJ4FBcVXIqfkcdrb+BsxSJeXWa/gaEnJHcZwqvKrBSNmSu5i
 mhehl/yePiTbD2xEq5HB2PJJBFpnUQ3kvT9aIwGFwSyXujtw/tIeBj1T4xbSGFvnGIqkflDGrAd
 1Q6mdFXYSGdtdq+HCQ11VHYDsWFtX2ee4xDcVwmT6faRakdMQXsJzMKrb1AdmRWBlRw7DXn5MvX
 YpOUEUCLoOI5wNtJVzj1Q0BvX9dEPvLOy5obLjeA0AP2mFqkGT6ZUKyJljZLyyN/R3CrqAL6Du1
 eWA+xWs+i/mK7o6i7Ns1eARqZDzx7gQJiG6NTq8v7hRQ1qzgDWLXwiZH6m0FeNzENAIKLrMUaYV
 6HktUfEGNwwHb6T90lnnKeXf+cQ6ZYk7Yb6kbpzbH3dEbXvigjJSr92M217nGwn1xejU04YG0T+
 wCKSTzy8EXpJELvxxDDtRKT2oOEMRpoplRSd/jwUQ+7fP7ZMBMFe93jM8AyoOJMwl81kyQDnSmc
 HQFZ5MxYA==
X-Received: by 2002:a05:6000:41e6:b0:487:981:4e0d with SMTP id
 ffacd0b85a97d-4870cef12ffmr3982043f8f.19.1789572645987; 
 Wed, 16 Sep 2026 08:30:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf342a0sm7668898f8f.24.2026.09.16.08.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:30:38 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C036161A0A;
 Wed, 16 Sep 2026 16:30:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>, Brad Smith <brad@comstyle.com>,
 Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 15/19] tests/docker: fix brown bag typo for docker-ccache
Date: Wed, 16 Sep 2026 16:30:08 +0100
Message-ID: <20260916153013.2134555-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916153013.2134555-1-alex.bennee@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 85825d74dfb..fa873e09b4f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -197,7 +197,7 @@ docker-help: docker
 # Where QEMU caches build artefacts
 DOCKER_QEMU_CACHE_DIR := $$HOME/.cache/qemu
 # Use a global constant ccache directory to speed up repetitive builds
-DOCKER_QEMU_CCACHE_DIR := DOCKER_QEMU_CACHE_DIR/docker-ccache
+DOCKER_QEMU_CCACHE_DIR := $$DOCKER_QEMU_CACHE_DIR/docker-ccache
 
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
-- 
2.47.3


