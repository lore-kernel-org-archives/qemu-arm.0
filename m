Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp97751njm;
        Tue, 4 Mar 2025 04:51:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXA7LkwjpLD/FcGIkti/hMGIztNGbUqF8wGZ+2U65xSWHdObKvr8AmwG3PUJ+oXSF859HrG1qmp7Z1wIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFapENMDBdnkPwvpAl5hRwQvbCvsLSZ1yjCs3GsoJ6qDOTXqd6XrCNSneGB4kgbwBKWW/+j
X-Received: by 2002:a05:620a:404a:b0:7c2:40f8:9746 with SMTP id af79cd13be357-7c39c66d3bdmr2494555785a.51.1741092691332;
        Tue, 04 Mar 2025 04:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092691; cv=none;
        d=google.com; s=arc-20240605;
        b=eUevFWNs4diG/Q8iiIzOh3d4r+m3Zj+Bu3RqZijgB/MqQZFk1RoOc4JgIB55qawlmJ
         iGB1qoZYpvzA+j5gLQsNvRaoI1up7XXa6GH/ZqTI3Xzlv4G6JKWR+mmgfmdwQQoE+GSy
         tnhC8BnC4T7ZDIrGA831wu6Sy6WcRSDCKsSNrQJ+fEeBHKsSPOKCnd0jOLkfMGfuRDjl
         gUWT3IBmWzPYLZwGEFYeQv/HvAdzq05U2NT/0N2nLSyg3Z7xU+zGqTxYQz2yvpKsFrwn
         J9+46oScQGaAix9dWvYziIW/edfPZIRj9dFTnUf/FliwXwAn6JrVd+t1rj3r4kReqDCV
         YmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mqi3DdaTu4ALCTwdK1EdsuKOZviWGVA8D/zmVKVPbIw=;
        fh=AUxCU78jacJE1vSghMJJha3+F2+VikVKZl38eSKs5/I=;
        b=F1oh2ptpgfO0BM6sLc3o8m+E5AFtuXLWAOp3qVcsiciE7MldRYVPARHMvouU3N/fpa
         ArJXHiD6LheyRkhyVWGbzjnk0pnedFTg7UcWPPunH7uSaoChPdzbW3qQa3/84kQHNSrQ
         ZlIM0ZqRZmuGuZ7jnK7w3NFk6ps5afCdjZDjWmy7CB4Bx5hf8suJkgfxYNoI9zJwM9I6
         bqYP40o/oGY5h1xVisFLW3YXlMdEFWp7+lgtptW3mGpTrnryPjJUmtLZMqjAqVC+wsL3
         yU7+7qB28vCfN6zdX2zc7gnqzg6SBd+orPVmE6Abh9Pv0RQIbbl+8qa/W6JlJU4g0g04
         FVKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MYo1zn0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3b72bc443si448478685a.583.2025.03.04.04.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:51:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MYo1zn0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpRjO-0007YN-Hm; Tue, 04 Mar 2025 07:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhw-0004xI-30
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:49:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRht-0007YN-7i
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqi3DdaTu4ALCTwdK1EdsuKOZviWGVA8D/zmVKVPbIw=;
 b=MYo1zn0tggDUwsGfUj29wj15dLkPJK3qLPNH5cBKMBvdIeUQU3Jekyw5s9mUCROo9/VFVu
 hgjImLH1yZX/7m3hP+a9HZy8QQPPiylgZ5dzSS5p6DRVzRvfWeosyARBTxgCRrSBPxxd86
 N76OLPKvlUColnphLjc8/Yp0WPFZL1g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-8GWymiyVPIK-4F02zqkAhQ-1; Tue,
 04 Mar 2025 07:49:05 -0500
X-MC-Unique: 8GWymiyVPIK-4F02zqkAhQ-1
X-Mimecast-MFC-AGG-ID: 8GWymiyVPIK-4F02zqkAhQ_1741092544
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0ADBE1800877; Tue,  4 Mar 2025 12:49:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 75E89180087C; Tue,  4 Mar 2025 12:49:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D4A5D1800616; Tue, 04 Mar 2025 13:48:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 24/24] docs: add uefi variable service documentation
Date: Tue,  4 Mar 2025 13:48:12 +0100
Message-ID: <20250304124815.591749-25-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-1-kraxel@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hT8RxYPDL2Ag

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20250225163031.1409078-25-kraxel@redhat.com>
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

