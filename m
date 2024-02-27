Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2756593ejf;
        Tue, 27 Feb 2024 07:50:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU8adbPYAL+3LYTJKhEGrXQN+XIUBqJ3QCkQR0ByZelsAD7VpFvuY27D+oQGDr9wmjne4PgPB7oQFZXUep241B+QWx7lU2J
X-Google-Smtp-Source: AGHT+IE4mytkDSmWgrH0i5cMCkX4kNvbdNsMb9MUArgpaTw1dC0xluR4r7kF5cvs/+pvr+u/HEcQ
X-Received: by 2002:a05:6808:1886:b0:3c1:b0a4:ee32 with SMTP id bi6-20020a056808188600b003c1b0a4ee32mr1333528oib.37.1709049054524;
        Tue, 27 Feb 2024 07:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709049054; cv=none;
        d=google.com; s=arc-20160816;
        b=aVPZRzPC/Co7Dpb209HoPp8P/MkwZfzpYnmyBB2gm+bGFhaiBkmcWnqtn+fzQ+92Er
         wumwkSzumZVfcLZWut8sYGOm/EdnYh1Qy6D9LAcVZtMfHdNG45aPY7hE1fnWFZlzsm2d
         e1kTEqamP0kf6qE5xmzyVTxmqTx9EmHDnTiWZ+rAUC2FAWPN7h5uLUkcVSABA+4Qk8sF
         8rKbNsvHoYTYMeF2IpHrSHJVYIgySIwCpBnweBR7lXrhjxUu+BI261aKu7Uh1apN2kgy
         XSRNqZbaOCMU2zdTnQM6d2P+kzg3Ej1MDPeue8lOb7XbPlhFyePEfd+aFM3NQjjv6YkN
         Wtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2IIWe8ZIEvueHRDnNV8eVA1tzlePHPCprrBOjpskc2k=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=ETH04oB7zSR3ogKTiHTdAyh/KAb3yfr2ucSVWC+nmZfGGiKLieW08rC3UNxsh4QqAr
         yMy6vuKe2JzDOFdIsxOk1fnJUXDlBn1BeCBqyVcS2ECUQiTf/sBjkhnXp7mytRt/ufrx
         syjwFOgYUz/ChUBkjUo/VtA8ShIXeyQf0n4XXl0VmR8QUkYU5UG7szYLi9BjsRWRYYt9
         qknMu3vru6ffiOP81S0YBbA/sc5QCJa/mAPdHUcIDIYKmja6bP6Yo0ulWk+NSMSyfixl
         6rynvPSjPiL3bVSCgkmIhRhXcIJ0wIGJfAjSy13KQg2kSQikvQ0N3GZlm9MphAH1n6XC
         Mj3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uccl7Xmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020ac84708000000b0042e77c1c89dsi7119397qtp.172.2024.02.27.07.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uccl7Xmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rezhT-0006eX-9s; Tue, 27 Feb 2024 10:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhL-0005se-IR
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhJ-0008WI-T7
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IIWe8ZIEvueHRDnNV8eVA1tzlePHPCprrBOjpskc2k=;
 b=Uccl7XmgSFO+GCAfEh2vuLmLfb1Sz5aWhAA2MXPJj5NVwpZETUKgYbZLZoOkwMiVC5IgLB
 PlVro85fl/7PijvcHD25pWhDFNVErC1zQT7Y2rQu0F2OvIV3wVhuhs6Mxyq9P/+VUHaw0c
 MoCvXaNTBHg+qtlqjNZRInIJwM0F0m4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-BO-3fyZlOiuJdpcXwthSxg-1; Tue, 27 Feb 2024 10:48:46 -0500
X-MC-Unique: BO-3fyZlOiuJdpcXwthSxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B381845DC7;
 Tue, 27 Feb 2024 15:48:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB8922166AE2;
 Tue, 27 Feb 2024 15:48:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 18/19] pc/q35: set SMBIOS entry point type to 'auto' by default
Date: Tue, 27 Feb 2024 16:47:48 +0100
Message-Id: <20240227154749.1818189-19-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
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
X-TUID: gWlQgEY6nBqG

Use smbios-entry-point-type='auto' for newer machine types as a workaround
for Windows not detecting SMBIOS tables. Which makes QEMU pick SMBIOS tables
based on configuration (with 2.x preferred and fallback to 3.x if the former
isn't compatible with configuration)

Default compat setting of smbios-entry-point-type after series
for pc/q35 machines:
  * 9.0-newer: 'auto'
  * 8.1-8.2: '64'
  * 8.0-older: '32'

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2008
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c      | 2 +-
 hw/i386/pc_piix.c | 4 ++++
 hw/i386/pc_q35.c  | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 56562e7d9e..2f69dfd0a8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1831,7 +1831,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->nvdimm_supported = true;
     mc->smp_props.dies_supported = true;
     mc->default_ram_id = "pc.ram";
-    pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_64;
+    pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_AUTO;
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
         pc_machine_get_max_ram_below_4g, pc_machine_set_max_ram_below_4g,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ec7c07b362..f9da942c55 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -535,12 +535,16 @@ DEFINE_I440FX_MACHINE(v9_0, "pc-i440fx-9.0", NULL,
 
 static void pc_i440fx_8_2_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
+
     pc_i440fx_9_0_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
 
     compat_props_add(m->compat_props, hw_compat_8_2, hw_compat_8_2_len);
     compat_props_add(m->compat_props, pc_compat_8_2, pc_compat_8_2_len);
+    /* For pc-i44fx-8.2 and 8.1, use SMBIOS 3.X by default */
+    pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_64;
 }
 
 DEFINE_I440FX_MACHINE(v8_2, "pc-i440fx-8.2", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 53fb3db26d..da3f92bea7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -371,10 +371,13 @@ DEFINE_Q35_MACHINE(v9_0, "pc-q35-9.0", NULL,
 
 static void pc_q35_8_2_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_9_0_machine_options(m);
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_8_2, hw_compat_8_2_len);
     compat_props_add(m->compat_props, pc_compat_8_2, pc_compat_8_2_len);
+    /* For pc-q35-8.2 and 8.1, use SMBIOS 3.X by default */
+    pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_64;
 }
 
 DEFINE_Q35_MACHINE(v8_2, "pc-q35-8.2", NULL,
-- 
2.39.3

