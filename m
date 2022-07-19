Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1806327lfp;
        Tue, 19 Jul 2022 02:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu9L59VirJbVT+wx3oluEviEJf1eNBPzfEIALq3s+XxcH06WLa7FrqbYcFx+2stVimUu/j
X-Received: by 2002:a05:622a:93:b0:31e:f9e4:23e4 with SMTP id o19-20020a05622a009300b0031ef9e423e4mr2733326qtw.565.1658224711562;
        Tue, 19 Jul 2022 02:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658224711; cv=none;
        d=google.com; s=arc-20160816;
        b=AO1p0VAzZirJ+VfQhlQK9M7aQ/HEk9dq8LfdeV2VG3uonTC8WQFktpomkcTrp3YvTN
         eue/eNDf7UExQCuN6oEaSwTu3B50EZqTOIf/UAw9c8MNTwDLwvsFO68pBac4a6zJQ+gC
         JWdTBk4eOaDSaGOoOwSNlSi/OVrAMkHTlm9SURQ+SN6HbdazAmlGBAGgpaIiFggGlwKg
         J148oQj2VmK9mZWIk8fpELLGRAh7oK1yhmK5tWsykl0+M/9RSsPzYfzWNHkq1kaUBkOT
         fiKn00hqMZkcuBVB1j/E/nu8PPjDvfsiMsHMQ2b7psVVw8JxWdyewDnINh/72P7xUhGL
         wE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zcCUcrXpPNIREcERVZmzf5hNw6d6j67CX8zgP4/F6/Y=;
        b=p6zEXNUcqEyLhb7UTEi85U9RHDm9wIz4m2OBm+cRgWd4ZoKKbOhfcgHvtgxmTiquth
         tkL9paruEG+8PLppVqXEFwN1Yyqh6l7vn4XMGQg1Fu15niuU1KUxIqst9a0xKEtIHPyh
         BFyRNC2Ryuwx2hYvDOkERboEf4xvAZsOepQVcSL8xNoXrwciPc8TOnlZlIuj8zdtsVce
         YcQQ1FjcxwaIEFQR9XVbh+Tk8Yi+8mTM/HYhSWnDi/+iY9PmdZrN4ufBFSY/9GLnUvvb
         CIqvpcZBRa9e4p+Wc6cVMXSpxddts2W38LOG1KbMbK+2Yzu3ZUcgPY9aK5RP9cLFtzhZ
         tg7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZCYHazw4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=cl.cam.ac.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17-20020ac80151000000b0031f01ec46desi226113qtg.402.2022.07.19.02.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jul 2022 02:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZCYHazw4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=cl.cam.ac.uk
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDjzr-0008LO-1i
	for alex.bennee@linaro.org; Tue, 19 Jul 2022 05:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjvC-0000xp-5y; Tue, 19 Jul 2022 05:53:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjvA-0004NY-CR; Tue, 19 Jul 2022 05:53:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id bk26so20754694wrb.11;
 Tue, 19 Jul 2022 02:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zcCUcrXpPNIREcERVZmzf5hNw6d6j67CX8zgP4/F6/Y=;
 b=ZCYHazw4/i0ueJ+EmcomzF0GWXRy0OBwxeqMYpSXgA6OCDVe/aZ5O9xnKJPQkpiWE9
 l9F86RXMlX86GkII/UrTOj+t6acGVsNB1oIIODArC+eeJ5aUI4pJAE+PbbNI8QeWpjdg
 blJK62uTmo09YsaJtPB/YEbdD+B0uf24PBn7085ZCCvUB8obUIg9b7wrLvftGo8/n16g
 xLnCrCVVUjSiEFEhsD2hZqpA/edLV8xFFMGe5Rn0g+3gE2E2V3GzPpzlydk1sad59ky7
 cNUehpD0bMFWdZplOEZSgSeqDwjJEzRp9Xv4E8Lvxdj15WV9gVJq6SZoXfZjSBIFo8xa
 WK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zcCUcrXpPNIREcERVZmzf5hNw6d6j67CX8zgP4/F6/Y=;
 b=uuRF1LQJTFbBsjSKJKF8Kl/i+p8wevHPeNJe9QE1gsgp47JK5SParEU1p8eFLcwDB3
 UmUNiRbg5XbXRA/G9/q0Md+VzL8Aw2r2Dfsw91biTzVMarEsV9NMYm5NnpsZtH3b/+uG
 MzAQBdX5hwKCpZ2U26h6IMFdzhPVILsNAptemycaXkIgKg3dm+9h9XPD2T7DFPra+/nh
 Gv52X1gQY8fQEtZOF79StpGay2ZN7rvQasp4WSXGKIUMqbQJn3f93v+DSnCOsZS+CC5l
 B8n+/S81K7Sm+n61kEIgvO+Lc/a8pDo1WlrOmjKh+fXravtlsLRKLCNUA0Xb5v2p8/7t
 wRAw==
X-Gm-Message-State: AJIora//W4fqV4MDCHtWgaB5a3QOocALaCt8H6c7C7oEMhGFphtXBKtd
 gZtn4HhMV6Oh7FzGF+0skPo=
X-Received: by 2002:a5d:588d:0:b0:21d:a5cf:c6f with SMTP id
 n13-20020a5d588d000000b0021da5cf0c6fmr27042287wrf.716.1658224418619; 
 Tue, 19 Jul 2022 02:53:38 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b003a32297598csm1973503wmq.43.2022.07.19.02.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:53:38 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 7/8] tests: acpi: aarch64/virt: add a test for hmat nodes
 with no initiators
Date: Tue, 19 Jul 2022 10:49:49 +0100
Message-Id: <20220719094950.1049516-8-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cp5kQRglKvLF

This patch imitates the "tests: acpi: q35: add test for hmat nodes
without initiators" commit to test numa nodes with different HMAT
attributes, but on AArch64/virt.

Tested with:
qemu-system-aarch64 -accel tcg \
-machine virt,hmat=on,gic-version=3  -cpu cortex-a57 \
-bios qemu-efi-aarch64/QEMU_EFI.fd \
-kernel Image -append "root=/dev/vda2 console=ttyAMA0" \
-drive if=virtio,file=aarch64.qcow2,format=qcow2,id=hd \
-device virtio-rng-pci \
-net user,hostfwd=tcp::10022-:22 -net nic \
-device intel-hda -device hda-duplex -nographic \
-smp 4 \
-m 3G \
-object memory-backend-ram,size=1G,id=ram0 \
-object memory-backend-ram,size=1G,id=ram1 \
-object memory-backend-ram,size=1G,id=ram2 \
-numa node,nodeid=0,memdev=ram0,cpus=0-1 \
-numa node,nodeid=1,memdev=ram1,cpus=2-3 \
-numa node,nodeid=2,memdev=ram2 \
-numa
hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
-numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
-numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
-numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
-numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/qtest/bios-tables-test.c | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index db14908bb4..ca0a66d5e3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1461,6 +1461,63 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
+static void test_acpi_virt_tcg_acpi_hmat(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    data.variant = ".acpihmatvirt";
+
+    test_acpi_one(" -machine hmat=on"
+                  " -cpu cortex-a57"
+                  " -smp 4,sockets=2"
+                  " -m 256M"
+                  " -object memory-backend-ram,size=64M,id=ram0"
+                  " -object memory-backend-ram,size=64M,id=ram1"
+                  " -object memory-backend-ram,size=128M,id=ram2"
+                  " -numa node,nodeid=0,memdev=ram0"
+                  " -numa node,nodeid=1,memdev=ram1"
+                  " -numa node,nodeid=2,memdev=ram2"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=1,socket-id=1"
+                  " -numa cpu,node-id=1,socket-id=1"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-latency,latency=10"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=10485760"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=20"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=5242880"
+                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
+                  "data-type=access-latency,latency=30"
+                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=1048576"
+                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
+                  "data-type=access-latency,latency=20"
+                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=5242880"
+                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=10"
+                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=10485760"
+                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
+                  "data-type=access-latency,latency=30"
+                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=1048576",
+                  &data);
+
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
 {
     test_data data;
@@ -1879,6 +1936,8 @@ int main(int argc, char *argv[])
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/acpihmatvirt",
+                            test_acpi_virt_tcg_acpi_hmat);
             qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
             qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-- 
2.25.1

