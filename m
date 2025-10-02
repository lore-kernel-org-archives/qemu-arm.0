Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29658CCA470
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 02:07:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v48hM-0006pN-LF; Wed, 01 Oct 2025 22:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48hD-0006oF-MO
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:28 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48gu-0004hR-7u
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:26 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b550eff972eso330991a12.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759370696; x=1759975496; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RuyHjwseD2/webFaCEvZMus3te6QjmI6epiQChOk2KM=;
 b=kN57Vc2OgniOm7M0ExI1GQ+jP/KsN+Uo3lmTFlZ0JWkFmjj6mcJLpDO9K8Hz5QfVVQ
 KX+lqWGTrIJll8JugrF/uqRwe/M8Ol4qb1Wn3Xz17V7pn/EqSIHW+Ukby8tf+626joHg
 2TuuH9hp5A5wVGUcjJgl2WR3wN8fW03uPmCwoYznjQ/C39cSXJekDq0UtOtraar6F2TA
 QpxGf3Yq8M5HzUpe0ZEPOJXo4yfXiBUwCWrbUUgnCVruQh/txaoqCO8/9JatJa1eThIX
 SnsncZp0Icot1js0mz/sl36ZTTabR41TSBTq1Fhu1GCIxUnpYDXzdo5DbyOFI9xQOV51
 R/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370696; x=1759975496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RuyHjwseD2/webFaCEvZMus3te6QjmI6epiQChOk2KM=;
 b=Nkxmiv8+IS9eC2phvjnIHdiXv/3XMXKmF5mWyyzuqsSPWfSeqhL5HEwxWeHUaJ9dSz
 gdLWn8c8PD/iGlgoTr205U10K0BEfAHIarJ4DLxn+pBx3KheUY3a0Pc6R8sTyb1rRAUd
 Xynv0xjaRdsjcC0X2cj/0d4zZ0Jsllw4o5tS334C+15FuNLhA/vrejU95hMaOAHviaj6
 arQ3X5QzdAq3ULxVWMlKiDCK+ucpZn24WBpw6xId1g6IZ7C6K+3WtEjaC/Ibw2QvjOJ+
 kwd8LlIB0EKUAe/SAP7AoHTZS7v+wS67H0Y6pgBc1OTnPStWqochdXgcET9DONHNkoSx
 DL6g==
X-Gm-Message-State: AOJu0YzaZ8uRRONgwCSjKnskbYFVKGN3YN2+ZMyfkOLIjt79+OUXCM2S
 qWULl+JxRJI/U019EPs3Zt2Q5yt0OwvXx6B+V08QRPLTtKlHT8Lx9ychTS/IFP2IkgI=
X-Gm-Gg: ASbGncvM0n4UA/2gHgPNNOUlegbGGibd5tluEIkBVykyy5nN3+U4kGUuelZMYpplXQr
 dylHeDA5KW3rQuNLqYEI55+kxWuhG9V3EeggWfDxNHIPF/WLnGphxnElyQ7WbrMqi9pZuLFEQRk
 GOd0pMDwgUDxTpKJtz2FGhDUlPXbxSMBP3E4UHqDvJnGvHs3zK+TvHGAkLL9+WFwCCbGBKNM5BE
 f2eeurVbPjqILlyEg8xtxJ+O2Udm5k2Tio+RGJxkkpNK0iOK44+70ebuK2CgP72LFR/ZFTOs04b
 a3/vfP5/YXKbV2kXCKoSTFSKl5sySW/70rB48i693YpVVdl42ki0WRW6mb6ZAyo0FBZI60B+7rm
 2PhK+7zAY8D/IwMfYdcynIP4/Lh3wa4nL7KJ3jUdwwFFp9Nv9PCVPSjX+
X-Google-Smtp-Source: AGHT+IHPxQ4/j6ljkaWyQ75GYLD3b1nqQ5q6TOdMh5Xzn06EsW6kPtx+D4u57o7FuVamTZhA71vUFg==
X-Received: by 2002:a17:903:320a:b0:267:99bf:6724 with SMTP id
 d9443c01a7336-28e7f330032mr63742645ad.31.1759370696370; 
 Wed, 01 Oct 2025 19:04:56 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d95bdsm9476735ad.119.2025.10.01.19.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:04:55 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 1/9] tests/functional: Re-activate the check-venv target
Date: Thu,  2 Oct 2025 02:04:24 +0000
Message-Id: <20251002020432.54443-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002020432.54443-1-gustavo.romero@linaro.org>
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Add check-venv target as a dependency for the functional tests. This
causes Python modules listed in pythondeps.toml, under the testdeps
group, to be installed when 'make check-functional{-<ARCH>}' is executed
to prepare and run the functional tests.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/Makefile.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 62a4fc8ed3..e47ef4d45c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -105,11 +105,11 @@ check-venv: $(TESTS_VENV_TOKEN)
 
 FUNCTIONAL_TARGETS=$(patsubst %-softmmu,check-functional-%, $(filter %-softmmu,$(TARGETS)))
 .PHONY: $(FUNCTIONAL_TARGETS)
-$(FUNCTIONAL_TARGETS):
+$(FUNCTIONAL_TARGETS): check-venv
 	@$(MAKE) SPEED=thorough $(subst -functional,-func,$@)
 
 .PHONY: check-functional
-check-functional:
+check-functional: check-venv
 	@$(NINJA) precache-functional
 	@QEMU_TEST_NO_DOWNLOAD=1 $(MAKE) SPEED=thorough check-func check-func-quick
 
-- 
2.34.1


