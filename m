Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512BCC982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:59:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FPR-0007k8-4t; Thu, 17 Sep 2026 12:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FP9-0007dk-HK
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:13 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FP6-0000Yn-J2
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:11 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so6063935e9.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664167; x=1790268967; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Do9KFjcXAIF5eGyCbBUaupWbA9FLoFPLY+nZFKwC9x4=;
 b=zx4Qly+qoSfsGafyl3m/uyV+9MFPnudd3JJAZBT0mHCTfpPs69AiMiT9azkNZx9mZ9
 SN3CEZj4tME93knH4wZ4cHH1xJpBwBswTqiQ8hiWW5i389+5eZnj59ITiKWPmhfwTfeJ
 ZMA/kr7zwvm6mSmK58rkt6LNUd5Wh2BgX8xZA5cen9GAYRVMB3YY4UDNQfiFYmdpMMBG
 18eVfK0N3sv2ZO17xIqW39z9//sUGGtDF7RKDNIOA+oUXOfEbtaRgIE3TDmsyo64dNq8
 ePn1JkoVXkEsJy/4MVmJSwChDfxEX/Szyuz+WOc9Yc5O+eNnoeOoXrVmFuUczx/bjTcu
 dGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664167; x=1790268967;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Do9KFjcXAIF5eGyCbBUaupWbA9FLoFPLY+nZFKwC9x4=;
 b=d/WdhqZGur/8CY3KJYM935CLxf69Ruy5unXzk9a2RHHRTdUXKLLqJwi5eQGqNIaFoq
 kfx3U4OI5YDR+YkhiZdVwUS5EKGQAAzEX0AuNg11Znt1KixIm4fXFWGpD4+JsiCrEh/4
 lILVFc5YXIpjL28X7Zmjj/dVGxfIiPq8FSDeQt/oqTOzlwqIa099N1VfaGmWqiFXpUwO
 ToI8n2QpTxNN5DmMTs7UhA1uYmbUe760FI3lGuZ1LoButxFHOIFC5AH8+K06RxC/fks9
 34XHot4SoSpY2eG9J0XzRmoLpdsIhFYwi6nhA8lVMzfUImdBL/J713uDaChxV2f1GRda
 fzaQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwSUw6TkAlCDc+fJvvSU49zfjFoNZpj9QLBLJaU6CYv61G/KZsUtt2/2x74raFjUvZwO33cwe7OtA==@nongnu.org
X-Gm-Message-State: AFuF++lPQziIzzl5T2GBjxcWj4M76ZOENGi0tgpYIdPbXLD0AFbxXCYr
 RVkubz0tfkAHd1HkG+MeF0kprJ2L1WeJ4v988MBCSLmPgCTCNVPIdSEfZyZK4LwDch0=
X-Gm-Gg: AYBFou0tYim+JKm8H67qkO+zw4KBYaUKOhdnFqTmqXt+xyOMfu3vC/Z2dyvEUT2KUJn
 rAMInSYUaSjOcZdDDzqMNgmvEENE4jGPK1kDGqN3B3bL+jXWp52/jx32xbSs2Hz9d5eTYDFznsk
 M2l9aalbkIsZMcQ+julzy8LMVzMg3uDBmxL6T1mirJmg+2MoFhKHgeaJXsqh9Jbi/n6LpWMmcIj
 awgdLxx0kpirpgBwILTtaVEBJ6tWWmTunMF/KEhl8QvGiDc2kTcP+t8IUyq2ZKX7HjiunXSLBjT
 bJRHHEusIJIkOnDdJiDYg1pe3GDL5n4ErRV4xxPEPMtzFnPXylE1+wuiSS0QI2VODNWYw1z4EG1
 6GjLhFf0eJ9Xv/HZtWqXHJg8a7LkGyYj5YKhA2baHS/Ti1Y+OyCWU82PfDkmafr9ta3HoG94EDI
 IQfAlvw7dqOvfSnLiuPBNAhF0T0nBXBJNqFc64ys4dQhjEfCA4aAcifpsT1eUzhmV5F68wsPk=
X-Received: by 2002:a05:600c:314a:b0:49e:799e:c1c3 with SMTP id
 5b1f17b1804b1-49eb73263c6mr92839545e9.17.1789664166654; 
 Thu, 17 Sep 2026 09:56:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf37e69sm16783733f8f.29.2026.09.17.09.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:56:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 59BB75FA11;
 Thu, 17 Sep 2026 17:56:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>,
 Jared Rossi <jrossi@linux.ibm.com>
Subject: [PATCH v5 02/17] configure: ensure it also honours container
 configuration
Date: Thu, 17 Sep 2026 17:55:46 +0100
Message-ID: <20260917165602.3405537-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This partially reverts the bits of 522b299ca43 (tests/tcg/meson.build:
implement ./configure containers options) so the configure script can
also honour the container config while keeping the plumbing to control
containers within meson.

Tested-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
[AJB: untangle changes since]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Jared Rossi <jrossi@linux.ibm.com>

---
v5
  - reword and rename commit (we haven't actually reverted much)
  - rebase conflict
  - drop stray options
  - move registry bits
v4
  - tweak revert to keep disable reported
  - update commit msg
---
 configure | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 1973f023b1e..8f8fec4efc8 100755
--- a/configure
+++ b/configure
@@ -246,6 +246,7 @@ ninja=""
 python=
 download="enabled"
 skip_meson=no
+use_containers="yes"
 rust="disabled"
 rust_target_triple=""
 
@@ -722,11 +723,14 @@ for opt do
   ;;
   --disable-plugins) plugins="no"
   ;;
-  --enable-containers) # enabled by default
+  --enable-containers) use_containers="yes"
+                       meson_option_add -Dcontainers=true
   ;;
-  --disable-containers) meson_option_add -Dcontainers=false
+  --disable-containers) use_containers="no"
+                        meson_option_add -Dcontainers=false
   ;;
-  --container-command=*) meson_option_add -Dcontainer_command="$optarg"
+  --container-command=*) container_command="$optarg"
+                         meson_option_add -Dcontainer_command="$optarg"
   ;;
   --rust-target-triple=*) rust_target_triple="$optarg"
   ;;
@@ -1713,6 +1717,9 @@ echo all: >> $config_host_mak
 
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
+if test "$container_command" != ""; then
+    echo "CONTAINER_COMMAND=$container_command" >> $config_host_mak
+fi
 echo "SUBDIRS=$subdirs" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
 echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
-- 
2.47.3


