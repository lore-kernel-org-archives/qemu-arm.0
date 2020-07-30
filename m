Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2692358lfy;
        Thu, 30 Jul 2020 09:02:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXdw9v9XOK2ZidgAJbF+h+nHXoHuphtTOPjegcf441QvYebR7vgogm/rHHKvdKQdApyvie
X-Received: by 2002:a25:860d:: with SMTP id y13mr28321407ybk.479.1596124937775;
        Thu, 30 Jul 2020 09:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596124937; cv=none;
        d=google.com; s=arc-20160816;
        b=wiT3WHlfdyRiYiRNmT/MzRUgtiLvh58Ad3rukZunEMbzSk9VZgoeIw5il12c53HCIm
         RcGIkSpXKhRzxlScsUnzZAQZP8SHR4O7V1p3ksDKEK7Gxo3RyCCUwOmtKu4IY4BAIaMO
         /zZAfbRjSs6PYObg/ivfVmRe2FENs+v9eWp0B0ZasnztHeg8uAECjBJtx6+gcPo4GEXm
         F7XGmjdeT7ZNJj3C6BxCPo+R2efVI1NVdISqNnYHP+aqwPArkHE/5Lw1mhEHeLjcaTsq
         XXeJzDpuXHx+7eCP4RvUtM9pBW/3jtJV9aQBBG13brjBjcMgMZiU588Zn7NPlm3rmWyr
         +aTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=t9vJ8om9B5hkPXUycSKjtBZ/Wy7eZdvCHEAUsm4nZrw=;
        b=bi2mR8MblSEQkUhJXERErHLNVa3yyhmsbyXCTZhl25YMu5QZl0YKndHNdOd0SUPHNd
         k4V0dq6mHxQhnwhqpLAfd6rB3luqdi2jX/vY4Hm+whB4ooA82cGgRjJndPOiOzMfvVg6
         orB+yCZSu5q2v6EBl+QkIDLU20LEbzxyggPJU2pO5QVkUwugf37/LUgPjwOxsRyeavot
         LrYzmqEAQieOMMK5NUREbzS742JR4DLgTCdBqJ+LrjNqUzaZXoOG9Nr84oEScRGfFjUi
         2Fhp/Y4m4TKbkkeS7swamBeqej1VgUwtoWIRAuuLPoh919Lz7m9biMud5NT7z9NlDvaT
         sLFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NLnarS6Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si5000941ybg.315.2020.07.30.09.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 09:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NLnarS6Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1B0a-0006US-Sx
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 12:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k1AxJ-0002rJ-Uz
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 11:58:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38604
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k1AxF-0005QT-Mm
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 11:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596124727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t9vJ8om9B5hkPXUycSKjtBZ/Wy7eZdvCHEAUsm4nZrw=;
 b=NLnarS6ZKWtfXPo/f9tEa7eIN4TJ2I/DOiY6//smifIyW2CDlcVa2ecbLrRMHQUjR0sC4u
 0YvFu2hLXnEzwy4C/D+7+LLsWoM0bJ5vRzlLsZvMVmVj/orriKGsoWVv/uQcshkczp8HEb
 Bk06CaoTv25Zh/sySt2E/B/582Yv6/0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-Fa0VijDaPpaPRA07aPw3Qw-1; Thu, 30 Jul 2020 11:58:45 -0400
X-MC-Unique: Fa0VijDaPpaPRA07aPw3Qw-1
Received: by mail-wm1-f72.google.com with SMTP id z10so2351867wmi.8
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 08:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t9vJ8om9B5hkPXUycSKjtBZ/Wy7eZdvCHEAUsm4nZrw=;
 b=Pq40HVeDDQfYRJv/BhFEqjsMnU7/gBCk4+LxMTdkF3bSYjije0VT8E4rRnhAwpplbR
 L7aCLkRR/SwelmYPk+rjIlJa1eq+SWUJ7Mwgxh4xvzQn2erxP8BkBBHpNR4+uBX38v27
 wj/M2oERRkY5hWNRnHSLbvUWyjYr8ODm63l134ic0JxNw23qh2K3yAsS1zJVtvzvmxey
 jpJTkNyG+9BT7rN7u5mif4vg/u4jk81HOiKlakbiEeOK6nWwqFh1gFylS/cRsc2S8+90
 lYoxKXqVedtZ/+Brj/8shnKKybl0vFJv127VwyQgR+GwDYK0tORT30luSwMmKW8W2u7A
 8ErQ==
X-Gm-Message-State: AOAM531rn5mJgtF167myUjXJmlz+gcVwVKMJQuRC7SDgh8UF5CxoWQ/3
 vPXVqj//3em/YRzNl1fvM6/ESftvgWeTeeDLx1YnuSt/2Hn7mORxut5tlQt4x1jE1fdgMHopYMu
 bL/VhuQxFk0Zt
X-Received: by 2002:adf:8445:: with SMTP id 63mr31327053wrf.375.1596124724838; 
 Thu, 30 Jul 2020 08:58:44 -0700 (PDT)
X-Received: by 2002:adf:8445:: with SMTP id 63mr31327032wrf.375.1596124724566; 
 Thu, 30 Jul 2020 08:58:44 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
 by smtp.gmail.com with ESMTPSA id s14sm9447543wrv.24.2020.07.30.08.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 08:58:43 -0700 (PDT)
Date: Thu, 30 Jul 2020 11:58:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] arm/acpi: fix an out of spec _UID for PCI root
Message-ID: <20200730155755.188845-2-mst@redhat.com>
References: <20200730155755.188845-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200730155755.188845-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:59:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, vit9696 <vit9696@protonmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QmKAR7/CoAM4

On ARM/virt machine type QEMU currently reports an incorrect _UID in
ACPI.

The particular node in question is the primary PciRoot (PCI0 in ACPI),
which gets assigned PCI0 in ACPI UID and 0 in the
DevicePath. This is due to the _UID assigned to it by build_dsdt in
hw/arm/virt-acpi-build.c Which does not correspond to the primary PCI
identifier given by pcibus_num in hw/pci/pci.c

In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
the paragraph,

    Root PCI bridges will use the plug and play ID of PNP0A03, This will
    be stored in the ACPI Device Path _HID field, or in the Expanded
    ACPI Device Path _CID field to match the ACPI name space. The _UID
    in the ACPI Device Path structure must match the _UID in the ACPI
    name space.

(See especially the last sentence.)

A similar bug has been reported on i386, on that architecture it has
been reported to confuse at least macOS which uses ACPI UIDs to build
the DevicePath for NVRAM boot options, while OVMF firmware gets them via
an internal channel through QEMU.  When UEFI firmware and ACPI have
different values, this makes the underlying operating system unable to
report its boot option.

Reported-by: vit9696 <vit9696@protonmail.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Peter can you either ack or merge this one pls?

 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 91f0df7b13..0a482ff6f7 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -170,7 +170,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
     aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
     aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
-    aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
     aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
-- 
MST

