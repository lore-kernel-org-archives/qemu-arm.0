Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2840822ejc;
        Wed, 15 Nov 2023 07:15:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBsd3JYtDnrznksE+W7iCwlDAKX6DCaRbWR/8LIZ+yqm6WBhQQZdePM8NjuEq3bvGF6DzQ
X-Received: by 2002:a05:6102:3bca:b0:45f:832f:1780 with SMTP id a10-20020a0561023bca00b0045f832f1780mr12558846vsv.24.1700061333567;
        Wed, 15 Nov 2023 07:15:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061333; cv=none;
        d=google.com; s=arc-20160816;
        b=W5c3WrRWVOudl0ZBXokpN1nBUkInkpt4UWWyxvYI6La2KPMWEnf4XDLI1b5FKmjC++
         SNHxIurGKTo7j6Yh1aNlIgrGBbDlnwPMceYXoV33x73Iqgf/HNWww0tpjEOLZBOqZ9Sc
         q/M65l5p/S+zGgueKFT9iL3UAK3XtzMbX0Y2zSTUxyG8qpcsGcjiPHLR7AY1tlFDUE2k
         icbuTBVUuIEn0HPd3mHraF/4a5/c8ZWHdAX5NTHdIJpjk1OuM1/igUK60F/YJRKXXVhe
         AI0BFMos44wUB/GTTX3r4NZonBf4QFRXMDFknOBgyELBbaUV3omvj3Yslnd6qlpx8EUg
         PFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OE/PtN9h0k7LC2WHk+1a688AyRXRE9rchXSc9yKvW2s=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=jNaXwliv4mUnoWoXrAT/hcML6uSMhcNY0fBX+xazZhPDjX2s5KMOmiyU4j4f8Eoqbr
         CaKC6IbjlMpnzSzCtvn/dFIuzkDcIjFNQOLUgEHNsTYiXH0te3oiQfkvQfXmp2pXR06L
         ewYxJwXol677cLPE6xRXj9m7OsTlxy7/g30tTYHfjCM0V9Dw51vKso0QzI6nWl43zIfw
         JwbCK7ukpRJXyZHVaPqt0/Z1DvO6OuJ+lwp3bDkg0Xbe0rqCWA9Ad98QkOyvY4ps+5BS
         SzaIXmrJHgpy5DRWAnOMYy3P/QW22NbNDPwMhNmoImmeY4wl+XrddbdjdoGoqyWeD8nc
         /mOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JI3odbZW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a67ad0f000000b0045783e31da5si1468990vsl.234.2023.11.15.07.15.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:15:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JI3odbZW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3HaD-00044Q-5P; Wed, 15 Nov 2023 10:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZh-0003uJ-Jx
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 10:13:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZe-0003II-Hi
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 10:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OE/PtN9h0k7LC2WHk+1a688AyRXRE9rchXSc9yKvW2s=;
 b=JI3odbZWSh4G+Yl3ATAPndt/NKZ/m+hFaaQYsBBiIT3FUiTtzJiu8SfYIIFhWqgEZ+5olg
 ju8IxFKowpyRuOHiwwkJb3qdzwf9p5VBTkqCcP1aZHxAEZlGWFd2bpbFPGy3Fgsb+qam1O
 DyBDrL58EssRSlCctnRegmnkHYpr5gc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-04SPW4wvMUSJOwM12qjJ9g-1; Wed,
 15 Nov 2023 10:12:58 -0500
X-MC-Unique: 04SPW4wvMUSJOwM12qjJ9g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 570C53810D3D;
 Wed, 15 Nov 2023 15:12:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB693492BFE;
 Wed, 15 Nov 2023 15:12:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6BE4C180AC1B; Wed, 15 Nov 2023 16:12:43 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 graf@amazon.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 16/16] docs: add uefi variable service documentation and TODO
 list.
Date: Wed, 15 Nov 2023 16:12:38 +0100
Message-ID: <20231115151242.184645-17-kraxel@redhat.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HzpSQWgvu/PZ

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/devel/index-internals.rst |  1 +
 docs/devel/uefi-vars.rst       | 66 ++++++++++++++++++++++++++++++++++
 hw/uefi/TODO.md                | 17 +++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 docs/devel/uefi-vars.rst
 create mode 100644 hw/uefi/TODO.md

diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
index 6f81df92bcab..eee676704cfa 100644
--- a/docs/devel/index-internals.rst
+++ b/docs/devel/index-internals.rst
@@ -17,6 +17,7 @@ Details about QEMU's various subsystems including how to add features to them.
    s390-cpu-topology
    s390-dasd-ipl
    tracing
+   uefi-vars
    vfio-migration
    writing-monitor-commands
    virtio-backends
diff --git a/docs/devel/uefi-vars.rst b/docs/devel/uefi-vars.rst
new file mode 100644
index 000000000000..8da69f3545af
--- /dev/null
+++ b/docs/devel/uefi-vars.rst
@@ -0,0 +1,66 @@
+==============
+UEFI variables
+==============
+
+Guest UEFI variable management
+==============================
+
+Traditional approach for UEFI Variable storage in qemu guests is to
+work as close as possible to physical hardware.  That means provide
+pflash as storage and leave the management of variables and flash to
+the guest.
+
+Secure boot support comes with the requirement that the UEFI variable
+storage must be protected against direct access by the OS.  All update
+requests must pass the sanity checks.  (Parts of) the firmware must
+run with a higher priviledge level than the OS so this can be enforced
+by the firmware.  On x86 this has been implemented using System
+Management Mode (SMM) in qemu and kvm, which again is the same
+approach taken by physical hardware.  Only priviedged code running in
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
+Instead of running the priviledged code inside the guest we can run it
+on the host.  The serialization protocol cen be reused.  The
+communication with the host uses a virtual device, which essentially
+allows to configure the shared buffer location and size and to trap to
+the host to process the requests.
+
+The ``uefi-vars`` device implements the UEFI virtual device.  It comes
+in ``uefi-vars-isa`` and ``uefi-vars-sysbus`` flavours.  The device
+reimplements the handlers needed, specifically
+``EfiSmmVariableProtocol`` and ``VarCheckPolicyLibMmiHandler``.  It
+also consumes events (``EfiEndOfDxeEventGroup``,
+``EfiEventReadyToBoot`` and ``EfiEventExitBootServices``).
+
+The advantage of the approach is that we do not need a special
+prividge level for the firmware to protect itself, i.e. it does not
+depend on SMM emulation on x64, which allows to remove a bunch of
+complex code for SMM emulation from the linux kernel
+(CONFIG_KVM_SMM=n).  It also allows to support secure boot on arm
+without implementing secure world (el3) emulation in kvm.
+
+Of course there are also downsides.  The added device increases the
+attack surface of the host, and we are adding some code duplication
+because we have to reimplement some edk2 functionality in qemu.
+
+usage on x86_64 (isa)
+---------------------
+
+.. code::
+
+   qemu-system-x86_64 -device uefi-vars-isa,jsonfile=/path/to/vars.json
+
+usage on aarch64 (sysbus)
+-------------------------
+
+.. code::
+
+   qemu-system-aarch64 -M virt,x-uefi-vars=on
diff --git a/hw/uefi/TODO.md b/hw/uefi/TODO.md
new file mode 100644
index 000000000000..5d1cd15a798e
--- /dev/null
+++ b/hw/uefi/TODO.md
@@ -0,0 +1,17 @@
+
+uefi variable service - todo list
+---------------------------------
+
+* implement reading/writing variable update time.
+* implement authenticated variable updates.
+  - used for 'dbx' updates.
+
+known issues and limitations
+----------------------------
+
+* secure boot variables are read-only
+  - due to auth vars not being implemented yet.
+* works only on little endian hosts
+  - accessing structs in guest ram is done without endian conversion.
+* works only for 64-bit guests
+  - UINTN is mapped to uint64_t, for 32-bit guests that would be uint32_t
-- 
2.41.0

