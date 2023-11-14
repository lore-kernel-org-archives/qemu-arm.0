Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2413952ejc;
        Tue, 14 Nov 2023 16:07:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPUf/IKVFr5/PwXU7n0dklxqxxjSxDRx8abi2DGdtPB3xF+Om8UXGpEyCGZDe4HbRrFSfS
X-Received: by 2002:a67:cb8d:0:b0:45d:a27a:7e8c with SMTP id h13-20020a67cb8d000000b0045da27a7e8cmr10260808vsl.23.1700006821118;
        Tue, 14 Nov 2023 16:07:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006821; cv=none;
        d=google.com; s=arc-20160816;
        b=xja7Tqb9+51Q2tFJ4aqgTimkrkk37OgZ/Qa7QvWMNpMNPuXZ6OTm1U8njuN2dvEHVR
         BuF6YPz08cRC3ZsnoU86CE3gy+sCSiJ/8JDPNcTW5/UxEMBYroZuD1CcCEid7A6DqCMA
         VJrYpXyX1xWHQjr5wAeUtaNXNh9+/VaHz1iHaa4IX+5zzNJfIHJiFd0tUe6YJ+Xirocw
         6pPK+OFd8aN9Pn9cSt6P9w8/a0EpzCEloo5AaFr5kVOKixJu9TLclAkjon1qmmK0LePx
         zUDiM2VXGr6HIda3/Lrpov3ARsCIqYNBDovTz+Oi1Mc9PoS5GH/rSV1UdiLS10fkl5yn
         qdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=R5YZzvC94fhlNvw99fKSNCgXvKmL1c8FqVP4lZp8vgg=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=eYEAKEC4BRb06bnujkbqYIQi2n9xpF6BDKGoGUUnvxWsUr41y7ClLIEKRvn86e/t0s
         igN3diW6YqstKWadIboDf4oPPxHpzWbf+8fWiY2Lveh3+fTNP8GqpEEPKdC0wa2+vVin
         uBjTHG2lLHoRwGV1Bsw2DbFNKEAChpuruYJGz3S+v05oWmY9z+LqVAmQmzQXdq0vczCX
         UYQ4Xys4WiYYSPMXUvAjf3+r7yqfsWxz7sBVI6illLlPAGZgDQq4mdb1NjTNCBgBDs6w
         Qm8Rf84/qy/j0JVRaDhXB4QZ0nARtp0fK93EZAccykg8+9Guwd9BIAhRH8Sp62VqgL/s
         aAdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SpLVB8TK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18-20020ad44b72000000b0066d09d73eadsi7776541qvx.462.2023.11.14.16.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:07:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SpLVB8TK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33Nw-0002aM-1N; Tue, 14 Nov 2023 19:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Nu-0002Zi-CW
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:03:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Nd-0008U9-UZ
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5YZzvC94fhlNvw99fKSNCgXvKmL1c8FqVP4lZp8vgg=;
 b=SpLVB8TKuueDaq7KdSQZotp63NBmh/Bglg6OotqWDd6tz3yoy3UcZq9Kubcw6AN+VJgs9T
 IZ1zQd/UI0jxJschPnbZekj5y5TQMRhM2Nbq1o57rhfoe8dB0WEuH5kvGIaZXIah0IDeim
 ej01Dz/5gwxaTVDfST1Au8yJEhzaZ9U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-Cae6pnPZPeCKEWLWfoWxZQ-1; Tue,
 14 Nov 2023 19:03:32 -0500
X-MC-Unique: Cae6pnPZPeCKEWLWfoWxZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52F9D38476A2;
 Wed, 15 Nov 2023 00:03:30 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73561C15885;
 Wed, 15 Nov 2023 00:03:17 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 29/31] hw/arm/sbsa-ref: Check CPU type in
 machine_run_board_init()
Date: Wed, 15 Nov 2023 09:56:26 +1000
Message-ID: <20231114235628.534334-30-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: T0p2zj9OhnAF

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f3c9704693..31bee595f8 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -145,27 +145,16 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_GWDT_WS0] = 16,
 };
 
-static const char * const valid_cpus[] = {
+static const char * const valid_cpu_types[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("neoverse-v1"),
     ARM_CPU_TYPE_NAME("neoverse-n2"),
     ARM_CPU_TYPE_NAME("max"),
+    NULL,
 };
 
-static bool cpu_type_valid(const char *cpu)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
-        if (strcmp(cpu, valid_cpus[i]) == 0) {
-            return true;
-        }
-    }
-    return false;
-}
-
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
@@ -733,11 +722,6 @@ static void sbsa_ref_init(MachineState *machine)
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("sbsa-ref: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     if (kvm_enabled()) {
         error_report("sbsa-ref: KVM is not supported for this machine");
         exit(1);
@@ -902,6 +886,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->init = sbsa_ref_init;
     mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = 512;
     mc->pci_allow_0_address = true;
     mc->minimum_page_bits = 12;
-- 
2.41.0

