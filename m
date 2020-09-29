Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4992101lfq;
        Tue, 29 Sep 2020 15:56:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Xl8jzlwkYYxkvOhYiln3cpehOB6jeFqm0kG9h8AZmBxuBb18JueFFBY5LrDCVpiKvCNi
X-Received: by 2002:a25:1f84:: with SMTP id f126mr9600613ybf.192.1601420163627;
        Tue, 29 Sep 2020 15:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601420163; cv=none;
        d=google.com; s=arc-20160816;
        b=hAbO95+qRIOAWIGJPhabHgAT65rMXSfXSgOwH4VOwCBruEMmgPeJBU9LH018tHnsRf
         AoTR0Ie+82xGooTb9Rv66DJnQiBE8AZwXJwzfAySiWkdaBvHGSnUAj7iAdsjS3Wh+Hvi
         pi5WO7bj1gnCmFjk8/hzTZwEyrq2CoZ/jtUfUxp3/ZucGR0RFoq5UAZSJkR7RSBOTaz8
         XsrBL/jNIe7FVrr4Fsc6FLPwxH7/wiNQmsgOGmnZKMEpfOs6ECjxRx3rCBR9mg560Xux
         iWF6itWRJHvEMbJR0ZwvqMNjsEpU2f7G/0/z1+G/UtcJZ2NLfIpkjU8M1lE3LR4m2RYg
         Wxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vdf7bQWqpFNs3r3ydPMxG1ARTKmwVNGr5rEsk2E5fdY=;
        b=jdZVq9Jve6nMef/eQ84cllQX0w1ATkUasb3W/neX0wF27BOMi8m0l3W1WgmIMc4sdX
         uz8jCqcJU/acDCJEbTvCdr/WSnxbILZi9hfrwBE2N+ny6zgkWoOytArAK7iYQLyxPTZe
         aAvqbBXaRIz5As3SkU7rJZGpJLKYPX2Kt93P4Ev2SCGajdqQNVv7mSDAMTEPJ34zACVB
         ogehFGUsSFvGb/+3LlT1cKpBSso4psTgM9enw7B/N7mT6jppi/VzfJ2y+wbVlnN7jyHf
         FMfpYLnww2EuVnHmSMMoAGfGyL4V1MpdJNANJr8G0QygZ/9VEXkghXbMfK6dPDDjzaUu
         F6mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UyVNuqZb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si5617942ybe.283.2020.09.29.15.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 15:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UyVNuqZb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNOXS-0001O4-Ts
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 18:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNOQk-0002rb-8B
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 18:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNOQh-00053s-HS
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 18:49:05 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601419742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vdf7bQWqpFNs3r3ydPMxG1ARTKmwVNGr5rEsk2E5fdY=;
 b=UyVNuqZbcbl3QPcSe8e0A2/MAMAl8fB3fqgNadGbvycFx2692J7lf9jnp83szJkHv0J7aK
 PbFpGrMCMiNBXlTYKmy5SaYhUkaB6Zw6wsenhliL8XcHKx6TAaCOzKXfjvrBVlWK/AoduT
 BnlVJeT7THQI4N22l8O1fTthqC0sOK4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-nRA3uT9XNn2b72aGC9ufPA-1; Tue, 29 Sep 2020 18:49:01 -0400
X-MC-Unique: nRA3uT9XNn2b72aGC9ufPA-1
Received: by mail-wm1-f72.google.com with SMTP id a7so2428630wmc.2
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 15:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vdf7bQWqpFNs3r3ydPMxG1ARTKmwVNGr5rEsk2E5fdY=;
 b=UJlBReGm+LFhudsPElml8qSv5hJkPhPxD742nPgMmYGKEsKzB5bMi/EXcMeKEyTVkw
 7H3TNZZSDOWZSvKLe0oHOY43w8GRTndI7UNH8TJZK5L2Y32KoFPNt9pWZ7nUxTiVtTXE
 oh3Nl2cUJQKBaWvmTfMGPvkN9KsXxuhn1kE5yYALlNLoOFO6chA9oCMNn2ziWokzm+xt
 FGoRWpSBGVC+TkXHkwY3/HWzFNtnaczaObQeTkL4rIQ3LCzUI0AQsMVRuvLTcnHCrpBK
 ETxits18PPB99rmCnM9iS9IpuH1V3NdK1O8jEfdpQl8/l/qBABI2OrUlRHHVfgWNGmRA
 jRfw==
X-Gm-Message-State: AOAM531k/AxWdli9Tg3mvikd+6Zn1q3pdbd0leHytYIEClv86EAwhxSs
 gUxBfTMXHZL5W1AMdg+VXvCdU8y4oroRGEojJ8QC4TT6Vy1OmnYj7NFjodMhh3B8p9DIiyo7bYh
 3rMRdeuhJVvplZ3k=
X-Received: by 2002:adf:ec90:: with SMTP id z16mr6425276wrn.145.1601419739732; 
 Tue, 29 Sep 2020 15:48:59 -0700 (PDT)
X-Received: by 2002:adf:ec90:: with SMTP id z16mr6425264wrn.145.1601419739579; 
 Tue, 29 Sep 2020 15:48:59 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id e7sm7740685wrm.6.2020.09.29.15.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 15:48:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
Date: Wed, 30 Sep 2020 00:48:57 +0200
Message-Id: <20200929224857.1225107-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zNici2aJ3KTw

The current 'virt_kvm' test is restricted to GICv2, but can also
work with a GICv3. Duplicate it but add a GICv3 test which can be
tested on some hardware.

Noticed while running:

 $ avocado --show=app run -t machine:virt tests/acceptance/
 ...
 (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERROR: Unexpected empty reply from server (1.82 s)

The job.log content is:

  L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-kernel GICv2 emulation\n'

With this patch:

 $ avocado --show=app run -t device:gicv3 tests/acceptance/
 (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3: PASS (55.10 s)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/boot_linux.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 0055dc7cee..c743e231f4 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -182,10 +182,11 @@ def test_virt_tcg(self):
         self.add_common_args()
         self.launch_and_wait()
 
-    def test_virt_kvm(self):
+    def test_virt_kvm_gicv2(self):
         """
         :avocado: tags=accel:kvm
         :avocado: tags=cpu:host
+        :avocado: tags=device:gicv2
         """
         if not kvm_available(self.arch, self.qemu_bin):
             self.cancel(KVM_NOT_AVAILABLE)
@@ -195,6 +196,20 @@ def test_virt_kvm(self):
         self.add_common_args()
         self.launch_and_wait()
 
+    def test_virt_kvm_gicv3(self):
+        """
+        :avocado: tags=accel:kvm
+        :avocado: tags=cpu:host
+        :avocado: tags=device:gicv3
+        """
+        if not kvm_available(self.arch, self.qemu_bin):
+            self.cancel(KVM_NOT_AVAILABLE)
+        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-machine", "virt,gic-version=3")
+        self.add_common_args()
+        self.launch_and_wait()
+
 
 class BootLinuxPPC64(BootLinux):
     """
-- 
2.26.2

