Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1065451ejm;
        Fri, 21 Apr 2023 04:05:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z8HJnNeJydyMLon6O3ZIYmTDRqGZVZdTcycnqxXe9NzZdQqioSd1hPlobY9PzUF1DuQ2Lf
X-Received: by 2002:a05:622a:189f:b0:3ef:37e3:cc64 with SMTP id v31-20020a05622a189f00b003ef37e3cc64mr7770746qtc.3.1682075149741;
        Fri, 21 Apr 2023 04:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682075149; cv=none;
        d=google.com; s=arc-20160816;
        b=rq9LwDpWS0iZ5S0jr2lvqLfjvjqUcKDrecAUjUEr3Spq1qpNal48OOLnt8NNLPs+KX
         8Wi9dIDkOV89UxbgxrVpxvVB+NXG9nKI76cZFopJR9jWYYgDCs0Qb5PrDXxiJMhwsWjj
         TTdO1jW3AiKj0KGrbCLWmWrqIDo6+AbmCuAQLDvwm+Mp3gQ1nFwMMBvZi+YX/J/kazaa
         fSLV/n/cf3RryiORHEor4rRTvWPTenZYR4FIwykcdk+CpCIFT+779Mtg01RPBsDWOycR
         NLZ3clbi06sl5hOaym+Ok8fSGCBZ8HtlHqi6ilS/QsDX1ucwZbHqZJQ09RS/T6HAdRTS
         l3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hi/oUGaXMoV06BL3wZJ1BxUnFn7Ff8nVmyxC46JJHdE=;
        b=udZbCYZyoEeVnP7MeAdPHLuEiJW37Xxht/QJJvAtzftWtOr73YAz9VLU3k1nInkApE
         r7dIzkPSfwDrCJs9T85M6QXEy2t+vYXKyom8tQuRTRJAjaXP2QCZEsHuNgPd2c+EhBMY
         bmAxaSHmdo+JD3JJiU2VawdGrSLBvZdKejCq7NnUpgfOdA8r4jwmI4j7O6XhWiG6//zT
         Mbiywdi4fpKHPNgco4d/fcYjcdichSrRhELlqOfFRyWjhkLs+LrKnBO5p9Tk9Xy1ldbE
         qm0Z44mrlWRJCTV9gGjMvsLXy6f2jQcn/YGFpNifFN/gOYgSdn4IHTba3jLjUl4tXMTi
         XJNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y5LKyeSg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020a05622a120c00b003e2e280c4aasi2971557qtx.713.2023.04.21.04.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 04:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y5LKyeSg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppoYX-0002d7-IS; Fri, 21 Apr 2023 07:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYV-0002ci-Ut
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 07:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYU-0002GY-4K
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 07:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682075032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hi/oUGaXMoV06BL3wZJ1BxUnFn7Ff8nVmyxC46JJHdE=;
 b=Y5LKyeSgwE+HbqMms74IcVXJ2+Ogp6jT8plu5Fko9ynuHgTlEk2a+Gc7u8BHmxkwE5tsOA
 kkqk1sxY0R0rSuYF94erk684CHRUMN0ULvV3tE+mJUulyBZyiKlOXxwTldT4NmcRgpjN3+
 gs3SytW59MUKd3aJ1jKY5jI7WIUmnXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-t3jtXE3vOXqDTx0UG0Nu5Q-1; Fri, 21 Apr 2023 07:03:51 -0400
X-MC-Unique: t3jtXE3vOXqDTx0UG0Nu5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE14C87B2A5;
 Fri, 21 Apr 2023 11:03:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53D5B140EBF4;
 Fri, 21 Apr 2023 11:03:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: [PATCH 1/3] tests/avocado: Make ssh_command_output_contains()
 globally available
Date: Fri, 21 Apr 2023 13:03:43 +0200
Message-Id: <20230421110345.1294131-2-thuth@redhat.com>
In-Reply-To: <20230421110345.1294131-1-thuth@redhat.com>
References: <20230421110345.1294131-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: IyGP3AOQndph

This function will be useful in other tests, too, so move it to the
core LinuxSSHMixIn class.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 8 ++++++++
 tests/avocado/linux_ssh_mips_malta.py  | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index cb71f50db9..6788837e1b 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -431,6 +431,14 @@ def ssh_command(self, command):
                          f'Guest command failed: {command}')
         return stdout_lines, stderr_lines
 
+    def ssh_command_output_contains(self, cmd, exp):
+        stdout, _ = self.ssh_command(cmd)
+        for line in stdout:
+            if exp in line:
+                break
+        else:
+            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
+
 class LinuxDistro:
     """Represents a Linux distribution
 
diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
index 0179d8a6ca..d9bb525ad9 100644
--- a/tests/avocado/linux_ssh_mips_malta.py
+++ b/tests/avocado/linux_ssh_mips_malta.py
@@ -101,14 +101,6 @@ def shutdown_via_ssh(self):
         self.ssh_disconnect_vm()
         wait_for_console_pattern(self, 'Power down', 'Oops')
 
-    def ssh_command_output_contains(self, cmd, exp):
-        stdout, _ = self.ssh_command(cmd)
-        for line in stdout:
-            if exp in line:
-                break
-        else:
-            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
-
     def run_common_commands(self, wordsize):
         self.ssh_command_output_contains(
             'cat /proc/cpuinfo',
-- 
2.31.1

