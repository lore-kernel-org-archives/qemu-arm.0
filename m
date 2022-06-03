Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5479809lfh;
        Fri, 3 Jun 2022 02:25:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbSW0YvHdm1J3qx43OacyKXBReKXxYkH6abFo992ulJE2sNuIiNJqtOHbRNxCMDWgaIR/F
X-Received: by 2002:a05:6402:1150:b0:42a:9dbf:8860 with SMTP id g16-20020a056402115000b0042a9dbf8860mr9628160edw.350.1654248312754;
        Fri, 03 Jun 2022 02:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654248312; cv=none;
        d=google.com; s=arc-20160816;
        b=Fc3WXCKIwr+gPN5GVHLXzv3rx7UpUSB9lAKevacodNFVunOu4FDhmjtfGy/j2kAvsY
         hYLE8rwsNszWCwaqRPA6/1TG0ul/sq/ccgRpSLx1TKz0j86cHfC02/ra2PgM/LNcjZBq
         +P3lAb3U+QkhxrQ4likf2C6pwfKuI+9Tkv5Ezw0yMNsvYhjbrKy3K3fWMa13nhhxVdCc
         wRqCWRgiX6u5elCP1RZ1zTTzZgEuZOuOIG5LVVyLK586QKA5dOXDh3ynUtDjp1OPyqle
         pZbdrbyFuSrxBCoO7ig0j6pNNs9TIh4eVgNdH2VCSDmEvDkYGE9cCLlioH7HZ2N8ASVU
         MBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=NyHrT6JgF7UvJFOy3h65Q+/YFOYSmVtFX30ttaXBqgg=;
        b=srQLwZ+D+0/SkbIYmk1EHshO69KQOFMEz8wIPeUu1Ekn+khqw40dLVKcqurbDy0saX
         1WV8WhoxbrYLuAXxvAuEEmFh1IohvmZkf0s5TlajWT0gpFW+GZ0GcF14zUwEfj5BZ6TC
         7VBGtzEt3cNmvbbWstqwRUgvOf0ypA6c5bFUaEEShebC6nEmktbNOtYS2GtzPbZx1yI/
         b34cfXGMzoPYy9jLBR7xL9tj+NWoBdzSy6skTdrhbIc+GhM01+DH18PhlM+vWI38v1/e
         dSPNW+OYYe3tG1Q+b5N1Qc3WWXFhWfFrrxHRil6ojAXlITAel94iv6g/ZmQbLudwhcNJ
         821g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VJqFpEW/";
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a1-20020a1709065f8100b006fee2dbae0esi6210666eju.312.2022.06.03.02.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VJqFpEW/";
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654248311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NyHrT6JgF7UvJFOy3h65Q+/YFOYSmVtFX30ttaXBqgg=;
	b=VJqFpEW/jOLlbCwbgdY/97n5WmBh8xUQZXJLUhl2oXS5xi4KfUYLtXhVRkNQQYqD26dkxX
	qOfw40OiQpU9YrtZqIDqBDk1CUaptfmHnq13Gfh4roybXn+ZBpM/4cVDCgYwkBusV1htSl
	a+/fp92k7PvOO899FpFKepkGscf5D9c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-WO6NuD-JMdauTPaWGdQHyQ-1; Fri, 03 Jun 2022 05:25:08 -0400
X-MC-Unique: WO6NuD-JMdauTPaWGdQHyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32AAC3C8ACE0;
	Fri,  3 Jun 2022 09:25:08 +0000 (UTC)
Received: from gator.home (unknown [10.40.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D942940CFD0A;
	Fri,  3 Jun 2022 09:25:06 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: f4bug@amsat.org,
	alex.bennee@linaro.org
Subject: [PATCH] tests/avocado: Prefer max cpu type when using AArch64 virt machine
Date: Fri,  3 Jun 2022 11:25:05 +0200
Message-Id: <20220603092505.1450350-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-TUID: tfYcwwRYbZUu

The max cpu type is the best default cpu type for tests to use
when specifying the cpu type for AArch64 mach-virt. Switch all
tests to it.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/avocado/replay_kernel.py     | 2 +-
 tests/avocado/reverse_debugging.py | 2 +-
 tests/avocado/tcg_plugins.py       | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 0b2b0dc692b1..c19022ea977d 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -147,7 +147,7 @@ def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index d2921e70c3b4..d6a6d7277235 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -198,7 +198,7 @@ def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 642d2e49e305..2bbf62f5036e 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -94,7 +94,7 @@ def test_aarch64_virt_insn_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -120,7 +120,7 @@ def test_aarch64_virt_mem_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-- 
2.34.3
