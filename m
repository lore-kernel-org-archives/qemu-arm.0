Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp338827njg;
        Tue, 25 Feb 2025 08:37:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULBmE0ail1ijcniIcJ2miUnQ7UYeWD8LX7mJOryEvUgkrXR6ZcyQl6zsZ4QMcEa41+Ca5lVQZ+bpSf4A==@linaro.org
X-Google-Smtp-Source: AGHT+IFQDzv1P7gHhZ1TbKL7nFActCgdBW1ApdWQXy9ailQyFiUJEcrVtYdtHjwS++QSGEqXSy2b
X-Received: by 2002:ad4:5cee:0:b0:6d8:b115:76a6 with SMTP id 6a1803df08f44-6e87a4d63e0mr58580436d6.0.1740501467514;
        Tue, 25 Feb 2025 08:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501467; cv=none;
        d=google.com; s=arc-20240605;
        b=ZgehnlzdKFeQwjvQsvbEnwnq/f67mS+H5oQggvN2Cc1n/GiZs5CfXPPQUafJrXICfK
         vWa9YdWpBFd9jerLdmat+5i+uNxi1BVmxFudG1lsNcxlNQpfNncITx6NvqZTCn2CQw9G
         e2QDYkmWjAOEob3cFc48EyO4hnhvwk0wxxyrDnAK9gIzta2HbQsz0u2ycCpfw2a0qdXg
         IoKaUDgAeTW4JsQBud/pI+f0cWsc/0SbSTYqHVedPixWOqgXSw/IthOhn3iWHUqv6dIz
         TjaV0UBrvQs3QUMyZnNzjHzepgoM37d1JYrpJhPyVOd4mxxhVVFgygPe4xSB8YvqGZpp
         Fkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=erzI/Ncs6Hnb/gTlWEX/91dVhKQq6/Z2g6NMnZjQjkY=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=crn1d626d4mZFNKK5xdBStmic37H8lP411vu3J5ls0YaS3b0+DZcvBZ1CwrTb4sN+z
         2LjZQP4AXNmS6B/4ntWUBLa8DzYeWa4s4LuY+q4D90VEVADgYS6AxT5arVoGs1iN/dsV
         oQwmefHwX1R6Zz97Z0g6DP1K+FuStnv5WvUfOuDgLo8OzIyyVrBzP3FNRNjQ0nHe8UF9
         5cR1kmDOJOExZ63SQ8QLIVzXs0Kga4iSJDb33jGE2k+3wbfy6g9FoJ0aNddmOVnDO6Ac
         sKOpSYYPczWaee4ZWS+rriM+emM6HJiqelgjO4r0gVzb7AwAvSSY2K5AocdzY+ZYfY4U
         KFZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i65ZXA5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b01a8f5si20271746d6.79.2025.02.25.08.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:37:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i65ZXA5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmxqE-0001ID-9B; Tue, 25 Feb 2025 11:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq9-0001B0-4X
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:31:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq6-0006d7-M8
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=erzI/Ncs6Hnb/gTlWEX/91dVhKQq6/Z2g6NMnZjQjkY=;
 b=i65ZXA5TZxET7V65vSzAl6yf9GcvbEZTbSJI83VRpW7H396o5cbKCXZr7J7rIJhd0v32Y8
 t3UjZ9eLAeg5WYnjCxNG5mlVRNNATZxzkz+UuKmbJd4tsD5IZNjyrVw3l9VwCM1gU/wSHH
 QOdO65o3FVzWP75efjM/jNPB0TITd3M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-1-HsHjKtOpy-qXHF9uSBtg-1; Tue,
 25 Feb 2025 11:31:18 -0500
X-MC-Unique: 1-HsHjKtOpy-qXHF9uSBtg-1
X-Mimecast-MFC-AGG-ID: 1-HsHjKtOpy-qXHF9uSBtg_1740501075
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 815571975AFC; Tue, 25 Feb 2025 16:31:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3CDC81800359; Tue, 25 Feb 2025 16:31:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 36BFB18007A3; Tue, 25 Feb 2025 17:30:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 24/24] docs: add uefi variable service documentation
Date: Tue, 25 Feb 2025 17:30:28 +0100
Message-ID: <20250225163031.1409078-25-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WTcWfn643XvM

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/devel/index-internals.rst |  1 +
 docs/devel/uefi-vars.rst       | 68 ++++++++++++++++++++++++++++++++++
 hw/uefi/LIMITATIONS.md         |  7 ++++
 3 files changed, 76 insertions(+)
 create mode 100644 docs/devel/uefi-vars.rst
 create mode 100644 hw/uefi/LIMITATIONS.md

diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
index bca597c65895..7a0678cbdd3a 100644
--- a/docs/devel/index-internals.rst
+++ b/docs/devel/index-internals.rst
@@ -20,6 +20,7 @@ Details about QEMU's various subsystems including how to add features to them.
    s390-cpu-topology
    s390-dasd-ipl
    tracing
+   uefi-vars
    vfio-iommufd
    writing-monitor-commands
    virtio-backends
diff --git a/docs/devel/uefi-vars.rst b/docs/devel/uefi-vars.rst
new file mode 100644
index 000000000000..0151a26a0a6f
--- /dev/null
+++ b/docs/devel/uefi-vars.rst
@@ -0,0 +1,68 @@
+==============
+UEFI variables
+==============
+
+Guest UEFI variable management
+==============================
+
+The traditional approach for UEFI Variable storage in qemu guests is
+to work as close as possible to physical hardware.  That means
+providing pflash as storage and leaving the management of variables
+and flash to the guest.
+
+Secure boot support comes with the requirement that the UEFI variable
+storage must be protected against direct access by the OS.  All update
+requests must pass the sanity checks.  (Parts of) the firmware must
+run with a higher privilege level than the OS so this can be enforced
+by the firmware.  On x86 this has been implemented using System
+Management Mode (SMM) in qemu and kvm, which again is the same
+approach taken by physical hardware.  Only privileged code running in
+SMM mode is allowed to access flash storage.
+
+Communication with the firmware code running in SMM mode works by
+serializing the requests to a shared buffer, then trapping into SMM
+mode via SMI.  The SMM code processes the request, stores the reply in
+the same buffer and returns.
+
+Host UEFI variable service
+==========================
+
+Instead of running the privileged code inside the guest we can run it
+on the host.  The serialization protocol can be reused.  The
+communication with the host uses a virtual device, which essentially
+configures the shared buffer location and size, and traps to the host
+to process the requests.
+
+The ``uefi-vars`` device implements the UEFI virtual device.  It comes
+in ``uefi-vars-x86`` and ``uefi-vars-sysbus`` flavours.  The device
+reimplements the handlers needed, specifically
+``EfiSmmVariableProtocol`` and ``VarCheckPolicyLibMmiHandler``.  It
+also consumes events (``EfiEndOfDxeEventGroup``,
+``EfiEventReadyToBoot`` and ``EfiEventExitBootServices``).
+
+The advantage of the approach is that we do not need a special
+privilege level for the firmware to protect itself, i.e. it does not
+depend on SMM emulation on x64, which allows the removal of a bunch of
+complex code for SMM emulation from the linux kernel
+(CONFIG_KVM_SMM=n).  It also allows support for secure boot on arm
+without implementing secure world (el3) emulation in kvm.
+
+Of course there are also downsides.  The added device increases the
+attack surface of the host, and we are adding some code duplication
+because we have to reimplement some edk2 functionality in qemu.
+
+usage on x86_64
+---------------
+
+.. code::
+
+   qemu-system-x86_64 \
+      -device uefi-vars-x86,jsonfile=/path/to/vars.json
+
+usage on aarch64
+----------------
+
+.. code::
+
+   qemu-system-aarch64 -M virt \
+      -device uefi-vars-sysbus,jsonfile=/path/to/vars.json
diff --git a/hw/uefi/LIMITATIONS.md b/hw/uefi/LIMITATIONS.md
new file mode 100644
index 000000000000..29308bd587aa
--- /dev/null
+++ b/hw/uefi/LIMITATIONS.md
@@ -0,0 +1,7 @@
+known issues and limitations
+----------------------------
+
+* works only on little endian hosts
+  - accessing structs in guest ram is done without endian conversion.
+* works only for 64-bit guests
+  - UINTN is mapped to uint64_t, for 32-bit guests that would be uint32_t
-- 
2.48.1

