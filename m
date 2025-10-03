Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD59CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 14:22:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4gcd-0004G0-HQ; Fri, 03 Oct 2025 10:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gcb-0004FS-Na
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:18:57 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gcP-0000LT-ER
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:18:56 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b58445361e8so3007429a12.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759501112; x=1760105912; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDUHrndFBGamyjJa0i4Qaat/bQ68hzkidi1jfvQgaco=;
 b=p7TBYwVOr7pzh+nk/2J48dSdnNYv0l068JiW33rqRlZ6hUtBSDrG7zDTF6bkjeVjjI
 8pgb7ISugJdC4KBIvZe200+yllYoRyhMKbdmziwmbrPizl/hs6B2/LjVamRjDbL5sPcM
 kzRhvhJjD2fwZi4IIu/knuKy9iglpWe3bi0kuH8sSz7YGVWILsL9YeyCaNNMaPSeY4tQ
 9IuEAWAMWvtVdFRDy/Xrqvqofsuo8iUS5xj0wDlFyPDC2+3afhBPHUBuH0j4+EzpiMbk
 I/tAVrTdXxiLu1nkFHiFxHkTdZW64w3eij0fLIsf02YuYlWFqgl75AaOreD8DrETZBy2
 HOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759501112; x=1760105912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDUHrndFBGamyjJa0i4Qaat/bQ68hzkidi1jfvQgaco=;
 b=oXBjyxx+UVtwgONwKhGFZ7SFB7Z0AnfvgkUTwjRUjcHf+HVu1G7KYFCEoD2qa+buPv
 m8l76Kqq4toYR0PgVEP5ms3OsJxOYcw35T9qXJGEcsyEgq4bWXvkVyjuJqTMT9DmNaW5
 wwp917VnciDdYg/rNW/CgBckmnh1XsCFAbqnCF8Znrcc5DLSnJoQ+nzajtY46S89w9yI
 nf8ZJ9Uj13eZOdiBwNN36cPLHsnB5sUClps7wblFjT54VXYpvy8u44BOXP112vsA8+jI
 X2XsK+bFaNbfO5NCxw3iE4ouSVS13EzYvN3gxGHUCiNmDbYvGqA9oSU358RORmjOwOjE
 K+XA==
X-Gm-Message-State: AOJu0YyogZaKINEGT6I+iW5A4Z9/q+kAuy7rpcYG6qYxoWMdpvXIpWzw
 305eus6dh7p8ImgRdIQCcLpzYTXCl4qoMP9/JIGwRYQCcBcWeoUObm3EIArWaruINnM=
X-Gm-Gg: ASbGncs6a+U4sdtlIJedV9SDSztuVTsOlyZVG7F4WpMU91sS/vdeB3xNq9XBnmrGZIe
 QjFsr1ZduXVgedehx+oXuKJES+uCpo7PykYmiMyMz5c0eIWJM+RSiyTavuTc4rrDP3xnL4s2qNU
 SZ3DebzfFlD5C67WHpkUuI5E98nT5mvl7wLO6CQgtaRmSZAeo4pibvc8TTPeQiWVFQgnjA3ie0w
 6Kd1Dsy3Yu7QpQWdCAC9cRg5uvcNZqRKJmzJeLnkxzdQy/jUBed7etk4W6OEN7RKkqxzjq2NN9L
 0TyypjdxSA5qS8ZDHCu6qv1YJiyuqdoTYGN5e7diQYoNhK2JWyhkghw5OcaxIWF/bVCB8ntXnCv
 +09taTcfNVDSQ89wViOODoaLJCq9zCzoCETFafLe8u1OFz/UXoZdNbM7fkmv5a1ux9qo=
X-Google-Smtp-Source: AGHT+IGrD1NKsjbDssKb3XzDT+5wVQ3h2jzrgAIcW8OrTGY57j+wdhKA9O8BczISPUll59GLn1uxyg==
X-Received: by 2002:a17:902:f24c:b0:271:bd13:7e73 with SMTP id
 d9443c01a7336-28e8d0a1ac9mr52708355ad.19.1759501112287; 
 Fri, 03 Oct 2025 07:18:32 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d5635sm51759645ad.102.2025.10.03.07.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 07:18:31 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v6 1/9] tests/functional: Re-activate the check-venv target
Date: Fri,  3 Oct 2025 14:18:12 +0000
Message-Id: <20251003141820.85278-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003141820.85278-1-gustavo.romero@linaro.org>
References: <20251003141820.85278-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x534.google.com
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

Add check-venv target as a dependency for the functional tests. This
causes Python modules listed in pythondeps.toml, under the testdeps
group, to be installed when 'make check-functional{-<ARCH>}' is executed
to prepare and run the functional tests.

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


