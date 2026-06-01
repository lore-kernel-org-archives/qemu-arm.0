Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A68CD6E57
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Jun 2026 14:32:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wU3g2-0007gf-Gq; Mon, 01 Jun 2026 10:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wU3g0-0007ep-FY
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 10:31:36 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wU3fx-0005v3-Jo
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 10:31:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ebafde87cso6719996f8f.3
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780324292; x=1780929092; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NT18CePaV0fGVJXLvh+q22hGG/t8aNhHu8KRmvW+bGo=;
 b=cYBlZgB5XqPjpZeaB9wl7egI9T976zBq3Hvd9RDN3diEvmoYmFdBETJLsHQzG3FLgp
 /wn6wA4XSl8jeYVCtbtcqqYHRn4MahdhlzIOXiG+vdP2MDeWF61cAjDJOyDSwqmbcV3b
 G0ILRB3sSB6ars/jzJtIEAtJq9sW7lVnAUAEPQ6ilthRTH2mgNljtIp02xNF1v6grXKC
 d8VvuYZJYPq/I3AgiaybM8HES4dE9gPoWYTwDwV2HQQqUE9U/NSWgl8dr8s7ri1DEvS3
 gNfPKN6b8zSf0iCYvVCkIJSuhV/x0U7l3vk2vePyD0OHunkSA9pEAyx/jOAb+ydRPx4h
 72Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780324292; x=1780929092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NT18CePaV0fGVJXLvh+q22hGG/t8aNhHu8KRmvW+bGo=;
 b=Xs0dItg6oN0Esxms12XayFH5eXPWNqHLXDCP8oyuyXUmiZRgG6HvjRYfF6dFe4Vi5u
 wjHdkKbVMWYvvrNbiycrMPeFRscimGA0SdsX0sPROc+lWfFeI/wrjelyOnca825ln2/L
 k8Dl1oBMepZ2E/tL4zSKA+OQnXgWiEk4jjbWJuOvWTxGGcrbwpYdNn90d/q1LJHDVvOD
 LNMKgikQHCDuEQPxvfPggY5lUQIjtrJlcb8HNhli+V8BpZ4Wmd55KiklDlCfbnZgppK1
 sRCaxomGY7/948mkdK0K2tlXxkyWVPFh3Q6hk4htI9C9vX6k5pI2MLuvxRGXGZSyQkRh
 XesA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8PYGK8fkDN/pP5izOQKLc68JnnmK8AE5Gzbb62YMDRMo4jtGpw0wEB1Q9HC95a+IU2EowWwH0toA==@nongnu.org
X-Gm-Message-State: AOJu0YxxBErdhhnfkfzHf+IGpGs6Rnk5GVauPZtrfybNcJ+eOdU5qvRV
 UpnE0LldAeVrbhqmoeqdkLMDCmm2/WaSncyF6SsIajMh//0cwsyHZRKDPOrn6V8AQrc=
X-Gm-Gg: Acq92OElxvuKJ0AnLe0YAQx94/mdefQCMPAVq4Sj4Dyo4QnAV8cplitsqtN0+YDnJZy
 wTyMcUPE6pTpmFIjU47RdftGQU7l2MB8J5T8yEs+500tv9V/7IRZr+UQ2N9D7+OErt9gIzSFOIV
 pgqkvHvyjeADI4JiNxBhiAFMcpfVfEfyCe3FpVJsC6iGAMHt05xahJ3IE/4K2UqBQfPcWHSohml
 +5RaAvESdu6IXwc+KE4TOMKeg3ilusaHR+KusXgM6H5P26xc47DSNVwBgpNSmYrwY28noHGNciy
 A81pFEhFJ6mIta+ZH7g4JFQ3bsAs5+YRHTJCb87wMu+ZUz5ha3GLC7z1+PTUgqaaNcl93S5oPEM
 K7X9ceNho0XLHYI5GBf8P/r/u/2K0GWDnB0DZJv4gdWYESjuWyHMg1RB2k0DdbYffhpQLjLcOTp
 bryP/i0b0r8sLzL4myxsvHk+4yEtlNZZ8F3Q==
X-Received: by 2002:a5d:55c2:0:b0:44a:247e:67b1 with SMTP id
 ffacd0b85a97d-45ef6b025a3mr15719859f8f.5.1780324292031; 
 Mon, 01 Jun 2026 07:31:32 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3595ef4sm24594620f8f.37.2026.06.01.07.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 07:31:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EC9215F8BB;
 Mon, 01 Jun 2026 15:31:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 1/3] Revert "Makefile: include tests/Makefile.include before
 ninja calculation"
Date: Mon,  1 Jun 2026 15:31:27 +0100
Message-ID: <20260601143129.144786-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601143129.144786-1-alex.bennee@linaro.org>
References: <20260601143129.144786-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

This reverts commit fd63125b9089610d63a53c11ff2fda6b53a2265d which
broke the ability to run the check-functional-FOO series of tests.

We will need to try something else for the MacOS builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 829c51e364c..54547a37b1a 100644
--- a/Makefile
+++ b/Makefile
@@ -45,8 +45,6 @@ include config-host.mak
 include Makefile.prereqs
 Makefile.prereqs: config-host.mak
 
-include $(SRC_PATH)/tests/Makefile.include
-
 # 0. ensure the build tree is okay
 
 # Check that we're not trying to do an out-of-tree build from
@@ -182,6 +180,8 @@ endif # config-host.mak does not exist
 
 SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet)
 
+include $(SRC_PATH)/tests/Makefile.include
+
 all: recurse-all
 
 SUBDIR_RULES=$(foreach t, all clean distclean, $(addsuffix /$(t), $(SUBDIRS)))
-- 
2.47.3


