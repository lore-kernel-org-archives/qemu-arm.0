Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1675107ejc;
        Tue, 12 Mar 2024 01:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTSiDmTLn+74Bxk0V/ySTI7Nv4+w2jWOgXldHao7SRO8mpwuoIsgVw8BqW8U88fFfzW32vBHAZZT/ht88Qa68zOdJsLgOS
X-Google-Smtp-Source: AGHT+IEEzp4cSjfQEWPZIlAP7gLlqrWBUqVLZujfXeUsou1CLF5h3LkL/nbtFq/yk6CSfb52/QJ/
X-Received: by 2002:a05:620a:2147:b0:788:582a:94a1 with SMTP id m7-20020a05620a214700b00788582a94a1mr1278260qkm.9.1710231921813;
        Tue, 12 Mar 2024 01:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231921; cv=none;
        d=google.com; s=arc-20160816;
        b=gkSZIPdqhDxNgX3hIo9FYR4sIU8JGQ9KPGyqfcllYeZmTHUiyKre9MY7GxajDinDAi
         K4/sGEOkKp14Wg9VBrKC4bxM9cwrb7l3+ZEIkEYpLSMheaJI8HTTrPJ7Z1Q0iPDIjOiF
         zeXVUUcfBvFowWO3qJUyzKw44BUkDnADS/j0FKMg2wVkRFCp9hQn800ney4VJTmeSN5e
         D0F5KHIL5hdCsgcp67aLSiZC7TZbdg4Cm58gLjhuwtjCJZBL3OYkVrjzqFN5FVArQu2I
         lkRiqtawjMB72FjcIBgflLaolKZ3MGf1p5+ymxwohxcOIa3mCLRt9bV5R0vO8wMSWZPS
         Z8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fRVInX4y8Fynbgdt9Z+8X8kf5kplDmxUXnVvwmK5Gtw=;
        fh=gWFiAR7s+cJTfOnGwdzlNNsUF3WzKpRy8DhfdI0E4+4=;
        b=ehPtcQrIghssb+vmd8oKQBCXSYOV9dLXvIELMcBWC/bemrCaCzmIvMjJMPCkq4Qw/T
         V5I85GYq0eu8wfbOdGa73jW4ZU6BuCfgETNmy1diYQBqRnPDPzxmtvvIEibhLsF3afgf
         LieeFPJnqluOQU5HIYLeMRh3KxYbSa14twIU00LbwTNrKB/7bDUuUsGysA9FpFKdcjlh
         7aKoWguIC4EQDOgWrS0y9bVfoxMvoGT/bWTMp8DaeLJtuP2JjsX9IUQw0DNo2pE5Hv9Y
         iHPDAjJljdJwjESvZzeQ76Bei54jbOFAHbQDir7DYYTHpvJa8tF8jOLJ76Gw3r/yT/op
         QGIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9i8HuGZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05620a0a9300b007882531c274si6999516qkg.535.2024.03.12.01.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9i8HuGZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxQz-00084c-UT; Tue, 12 Mar 2024 04:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxQj-00073u-VL
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:24:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxQd-0001Jo-Te
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:24:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33e7ae72312so3332755f8f.1
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231846; x=1710836646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRVInX4y8Fynbgdt9Z+8X8kf5kplDmxUXnVvwmK5Gtw=;
 b=N9i8HuGZkXNEGHjItbgxRDdhWxckjjRcqMu4wHR15NuXt5uWOD0fw1C3x+hP0gpgsp
 kVPYStImkB2auRj8MPgPSpL0xisXKEuW1eGzv9caRJyE34oh319cHZ0QNoFrvCRO+2og
 NELFdSpKx106/mnjH3o0nGiDICNRGdzKGedApoBO2yZ+hf/aJ5OadaVJQrnNGyCNunua
 aJ6JJ4RhYmRRkxKl6+qhZhCZNvUTbvK+qSL9Tba54jnotTOXVhDPhTZ5ZYlSD2JwhzmF
 xjBBgU0HrLVbDolKwH+nxwY/j5v/+vCalXbyv0bbvLr7lQxmpaZJeVRHp7c+vgSe4bhm
 +cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231846; x=1710836646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fRVInX4y8Fynbgdt9Z+8X8kf5kplDmxUXnVvwmK5Gtw=;
 b=kiTCBRoQg/5IGwBfYssroYNKLiI7FRTe7ZpmupOGxIb2+YWJ4zGqVpEjvEIVdQhR7z
 vMnDQ995GWErjZLvPKiB/zchAy9KoBHrAONFikorXYqQS6BW0fg96XdIhcA9LMuRkaj8
 dT9/ANgGLyHkrdA8ZehQriQp0Nez8jzARnHWEGQvXi/3SuvQtuBheIhSL0bmSYkJRrnk
 jqulJQPIrYKc8EmrFW1E6S/Kl/6TJZP8yhcCfKFaq+MJ+yyFOrxd+rD0IiemER8oXBdH
 vkPbTgK79n9qG6+xJqx6c1rqYul0t83WWsMC8AfbVTjn7wZCpF36r5nRvORnJB+r5GYw
 hrcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX9JRNfrPfg5yuyhEqbH0PwfSAHRb5jCJ8EmXx5FNomIS3zwqPyEOtjgkmD0ebOHxCueyHa8nYvlRt/znLOk/7yUDl
X-Gm-Message-State: AOJu0YybEhgBEbvMRXMhSAPfdJD2mzxmX/M4f4wVAhKTNBvfFnavIWCx
 VdJbpIOYHjIwGeh+ilvT5hILubew269FJxe606H1LK0KEtoT6NCbFuaVsAP26UEvI0XpgG0pO3P
 H
X-Received: by 2002:a05:600c:3108:b0:412:7489:c8c0 with SMTP id
 g8-20020a05600c310800b004127489c8c0mr6935572wmo.34.1710231846062; 
 Tue, 12 Mar 2024 01:24:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a05600c3b0f00b00413218ca719sm10882749wms.4.2024.03.12.01.24.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:24:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 devel@lists.libvirt.org
Subject: [PULL 13/13] docs/about/deprecated.rst: Move SMP configurations item
 to system emulator section
Date: Tue, 12 Mar 2024 09:22:38 +0100
Message-ID: <20240312082239.69696-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2JZLoSUgiIoI

From: Zhao Liu <zhao1.liu@intel.com>

In the commit 54c4ea8f3ae6 ("hw/core/machine-smp: Deprecate unsupported
'parameter=1' SMP configurations"), the SMP related item is put under
the section "User-mode emulator command line arguments" instead of
"System emulator command line arguments".

-smp is a system emulator command, so move SMP configurations item to
system emulator section.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240312071512.3283513-1-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index dfd681cd02..2f9277c915 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -47,16 +47,6 @@ as short-form boolean values, and passed to plugins as ``arg_name=on``.
 However, short-form booleans are deprecated and full explicit ``arg_name=on``
 form is preferred.
 
-User-mode emulator command line arguments
------------------------------------------
-
-``-p`` (since 9.0)
-''''''''''''''''''
-
-The ``-p`` option pretends to control the host page size.  However,
-it is not possible to change the host page size, and using the
-option only causes failures.
-
 ``-smp`` (Unsupported "parameter=1" SMP configurations) (since 9.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
@@ -71,6 +61,16 @@ configurations (e.g. -smp drawers=1,books=1,clusters=1 for x86 PC machine) is
 marked deprecated since 9.0, users have to ensure that all the topology members
 described with -smp are supported by the target machine.
 
+User-mode emulator command line arguments
+-----------------------------------------
+
+``-p`` (since 9.0)
+''''''''''''''''''
+
+The ``-p`` option pretends to control the host page size.  However,
+it is not possible to change the host page size, and using the
+option only causes failures.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-- 
2.41.0

