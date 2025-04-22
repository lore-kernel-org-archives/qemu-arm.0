Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2338883njd;
        Tue, 22 Apr 2025 06:08:56 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX49M/CLy8aOyLfXrRySCHZehgpDZ/xUPJUiQZ78Fv4BAPpUFnzqBqZwfr5lZS5gPHbFCEqtQ671/vKAg==@linaro.org
X-Google-Smtp-Source: AGHT+IGOf9WgEM45esp6wJII6iRLjxVVR09DKrVGmd6FBaRRR15SYmYaOUhMW2l+hiQeRS7HsehB
X-Received: by 2002:a05:6214:3015:b0:6d8:b3a7:75a5 with SMTP id 6a1803df08f44-6f2c4683834mr281829886d6.42.1745327336552;
        Tue, 22 Apr 2025 06:08:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745327336; cv=pass;
        d=google.com; s=arc-20240605;
        b=QlWAhJqHQ2UN+7bh759jf9neRKqJJvKGp+MSDC2Tc0Eqs4N2XMtMKu2eK6PpY8OLL/
         dHUzz4RViNGrbw0EGi59bztysUd5wSuRfa2GAeKMQqH0rx0sVzK09P9Rr/4BenWOm1sB
         6cH9htpYvJnhrZTmmZTMpKBFlObW1hM3ldEdsER/Qu8xh16SActTrYEhLpGIgK3rZ5nC
         JXXRSoAb2VFVuH3DyBldY8UwIP0wPzx6na9o/8oLTVel7bH8d4xza+pBpGjES8f8/suI
         DBUwc9YzVUL/mMxcFsU3ZqvF9xl2ajpiUqNsnKvCe5M+kLI7A9bxQOiSxVMILmeNMlN6
         J0eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent:subject
         :to:from:message-id:date:dkim-signature;
        bh=1f6fhPG4bAKk0JZt43u8c0MdQmVwY/dIp/p0/C0Ji9o=;
        fh=xvxAVwIapeTfUGVhawOHceEeuve1SNCNx1giFMTcN1s=;
        b=M5RYiX4eNHcCQUwvRjTfWK0Wa+U2ws5NO9CMG701T+IZcV5CtUytpT41C6gObrsNPI
         j0P/QXjmqEwe6slpdS+6gBVm13eZ+LdGuHkuWqlvndx3R8Z3UxFk4YsOnkVC8bo/yZiC
         uBh9IjzyUPi4MLrN10E7IC0nFUiVeU6b1gPA/T7f3arCbruwPA1Pp434fg+5Q+o0aU+F
         KG5ygPSK8pHygs+kxb0BzcEWW93cz9aDW+nJe8KBY84SxLH7DXdOhUmz/29uqX7lUSQt
         IfYPU92UtoOCb7FnVntNc4pgeAYdFhrT7nX+HpGY9u9BzelNyl7vbK2AYFWaSIW1Nqav
         DqPw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=Ym0B7m6r;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2b01dedsi107531856d6.34.2025.04.22.06.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 06:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.beauty header.s=zmail header.b=Ym0B7m6r;
       arc=pass (i=1 spf=pass spfdomain=linux.beauty dkim=pass dkdomain=linux.beauty dmarc=pass fromdomain=linux.beauty>);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7DLf-00049D-3I; Tue, 22 Apr 2025 09:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1u78PW-0000p5-60; Tue, 22 Apr 2025 03:51:18 -0400
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@linux.beauty>)
 id 1u78PQ-0006e6-CH; Tue, 22 Apr 2025 03:51:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1745308234; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P/kgcEwkpQQRfCAd7YqqnzxgppohP+jSKyqw7/XhF9yr71eDYoaCZRPwnn7Xb9z1Kve7P7QKO4fTIenhEu8TXiFuTOiqhr+KpXWIi9i8UkFajKa5LTBf9/SWjB/TdEDtjPEwymVqa+OAmdsNjf7zbLLG1ewpRlSX6iiOByaOUPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745308234;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=1f6fhPG4bAKk0JZt43u8c0MdQmVwY/dIp/p0/C0Ji9o=; 
 b=F2RsFmyJyb9mgZsBBGTPEu7JEmk802msYgQogeaQTi36CcA152NSW+3RzzOo4jGujbngbPlzgMQW/X39le5p5NMOAtnKMSapfIvWP8MyCqo49WrERd8AskwDlSG9NHbJcCcydtSIiIJxe5ehK8d+HAgzjMIZZFoFcP8p2KRIC1w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745308233; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:Message-ID:From:From:To:To:Subject:Subject:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
 bh=1f6fhPG4bAKk0JZt43u8c0MdQmVwY/dIp/p0/C0Ji9o=;
 b=Ym0B7m6rWEbMAKn2VwRtfsqozZmAmjGTep86N+4h5lddXx8zvqHkoTGztdaGukLV
 9Alolr5InuK+cB3SNzEL0xD6I6N7BFk+Jj5R/eYYXEC3NOfNFP8WotFfhtc+Odz09s9
 RwxXxf7m78SBKMHAr5IeivvBGGLxvcS/UBrMyq2E=
Received: by mx.zohomail.com with SMTPS id 1745308231245860.2718604626467;
 Tue, 22 Apr 2025 00:50:31 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:47:18 +0800
Message-ID: <87a588wsc9.wl-me@linux.beauty>
From: Li Chen <me@linux.beauty>
To: Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, =?ISO-8859-1?Q?=22Philippe_Mathieu-Daud=E9?=
 =?ISO-8859-1?Q?=22?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, Song Gao
 <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Sunil V L <sunilvl@ventanamicro.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH] acpi: Add machine option to disable SPCR table
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/30.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.15; envelope-from=me@linux.beauty;
 helo=sender4-op-o15.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Apr 2025 09:07:38 -0400
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
X-TUID: UhJsUUYWZYIL

From: Li Chen <chenl311@chinatelecom.cn>

The ACPI SPCR (Serial Port Console Redirection) table allows firmware
to specify a preferred serial console device to the operating system.
On ARM64 systems, Linux by default respects this table: even if the
kernel command line does not include a hardware serial console (e.g.,
"console=ttyAMA0"), the kernel still register the serial device
referenced by SPCR as a printk console.

While this behavior is standard-compliant, it can lead to situations
where guest console behavior is influenced by platform firmware rather
than user-specified configuration. To make guest console behavior more
predictable and under user control, this patch introduces a machine
option to explicitly disable SPCR table exposure:

    -machine spcr=off

By default, the option is enabled (spcr=on), preserving existing
behavior. When disabled, QEMU will omit the SPCR table from the guest's
ACPI namespace, ensuring that only consoles explicitly declared in the
kernel command line are registered.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 hw/arm/virt-acpi-build.c       |  5 ++++-
 hw/core/machine.c              | 22 ++++++++++++++++++++++
 hw/loongarch/virt-acpi-build.c |  4 +++-
 hw/riscv/virt-acpi-build.c     |  5 ++++-
 include/hw/boards.h            |  1 +
 qemu-options.hx                |  5 +++++
 6 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ac8f8e178..f25c3b26ce 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -940,7 +940,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 
     acpi_add_table(table_offsets, tables_blob);
-    spcr_setup(tables_blob, tables->linker, vms);
+
+    if (ms->enable_spcr) {
+        spcr_setup(tables_blob, tables->linker, vms);
+    }
 
     acpi_add_table(table_offsets, tables_blob);
     build_dbg2(tables_blob, tables->linker, vms);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 63c6ef93d2..d56f44f4e8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -590,6 +590,20 @@ static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
     ms->nvdimms_state->is_enabled = value;
 }
 
+static bool machine_get_spcr(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->enable_spcr;
+}
+
+static void machine_set_spcr(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->enable_spcr = value;
+}
+
 static bool machine_get_hmat(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -1294,6 +1308,14 @@ static void machine_initfn(Object *obj)
                                         "Table (HMAT)");
     }
 
+    /* SPCR */
+    ms->enable_spcr = true;
+    object_property_add_bool(obj, "spcr", machine_get_spcr, machine_set_spcr);
+    object_property_set_description(obj, "spcr",
+                                   "Set on/off to enable/disable "
+                                   "ACPI Serial Port Console Redirection "
+                                   "Table (spcr)");
+
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
index fced6c445a..0e437bcf25 100644
--- a/hw/loongarch/virt-acpi-build.c
+++ b/hw/loongarch/virt-acpi-build.c
@@ -557,7 +557,9 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     acpi_add_table(table_offsets, tables_blob);
     build_srat(tables_blob, tables->linker, machine);
     acpi_add_table(table_offsets, tables_blob);
-    spcr_setup(tables_blob, tables->linker, machine);
+
+    if (machine->enable_spcr)
+        spcr_setup(tables_blob, tables->linker, machine);
 
     if (machine->numa_state->num_nodes) {
         if (machine->numa_state->have_numa_distance) {
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 1ad6800508..7f6d221c63 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -680,7 +680,10 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     build_rhct(tables_blob, tables->linker, s);
 
     acpi_add_table(table_offsets, tables_blob);
-    spcr_setup(tables_blob, tables->linker, s);
+
+    if (ms->enable_spcr) {
+        spcr_setup(tables_blob, tables->linker, s);
+    }
 
     acpi_add_table(table_offsets, tables_blob);
     {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index f22b2e7fc7..cdf2791a50 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -444,6 +444,7 @@ struct MachineState {
     SmpCache smp_cache;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
+    bool enable_spcr;
 };
 
 /*
diff --git a/qemu-options.hx b/qemu-options.hx
index dc694a99a3..953680595f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -38,6 +38,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                nvdimm=on|off controls NVDIMM support (default=off)\n"
     "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
     "                hmat=on|off controls ACPI HMAT support (default=off)\n"
+    "                spcr=on|off controls ACPI SPCR support (default=on)\n"
 #ifdef CONFIG_POSIX
     "                aux-ram-share=on|off allocate auxiliary guest RAM as shared (default: off)\n"
 #endif
@@ -105,6 +106,10 @@ SRST
         Enables or disables ACPI Heterogeneous Memory Attribute Table
         (HMAT) support. The default is off.
 
+    ``spcr=on|off``
+        Enables or disables ACPI Serial Port Console Redirection Table
+        (SPCR) support. The default is on.
+
     ``aux-ram-share=on|off``
         Allocate auxiliary guest RAM as an anonymous file that is
         shareable with an external process.  This option applies to
-- 
2.49.0

