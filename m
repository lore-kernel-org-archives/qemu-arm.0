Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1804036lfp;
        Tue, 19 Jul 2022 02:53:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5r6dfmZn4OsJYwMpfpwW+9JKj7x0xKB9PRMl/Thy7gTaKNSbB5DwRWA8UycBHLW7iROhD
X-Received: by 2002:a05:6214:4014:b0:473:4433:1346 with SMTP id kd20-20020a056214401400b0047344331346mr23690573qvb.96.1658224423275;
        Tue, 19 Jul 2022 02:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658224423; cv=none;
        d=google.com; s=arc-20160816;
        b=ujcEeY6D92uJOsK1oM7nO/tX9rKaPmragiz93vRD2QC+ecw4xmF8bP5sulZibyS357
         QK6T786oP1jLm9GFKYe46NaGiIvAXUwCiHJm6fcvjQSbbS8CTiotCJe61aPFU4czPXcz
         lu514U+2uLszMoI7P08HR1s3kVawO+FQuoxMi0BCIN1wecVzSoh8Q8wmEojArIBN5gzh
         7JcoRgZlqewKrNxVCjzNw4tbiSaMe6kFy3MbNrMvpwdA1ChDz+TUDrXZOmhImX1CbOsS
         lyxOmakzmkCvQVOv5tobdeJAm4CwjfiKNorPaB2+mAF84wsh6pgCOb/bZ9F31wvF/56R
         e+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j1h9zPDvkG8il+pIfLNS6XUWKh8jK8dtTd9R/r27J0c=;
        b=WqLneVeiBum9lum5UD66tFtax5vw1IxsIzJ7wwrYJyhcL5Hla+Y7f04iElTMxd6txW
         F7djaTQoWXa6ORoaQW60jDDw/HP52gB4/uzToodQAkRQEaMImHCBup0liyX2fD6p1w+T
         gFKH7xxZOzZqfjOBHe5s8pKE2KTVPoID1/k76LAqymPfWzllEiYXQWhZTfq5XftmQNcr
         rFICn7f7Wu68JRHfWuSz6mdNMFcGwcqPZbJcMFNVypFt5sWw2wnc+vvP33h7rBLgizo4
         wgTbFrootlTdB8yeLu9y2rIVYtjcMheIE0zcmvlIYtevg8i6Ns0W2NUI76GCUB321KQu
         CFmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Fz8n6Shd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=cl.cam.ac.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05621419c600b004738d4abecasi6330290qvc.28.2022.07.19.02.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jul 2022 02:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Fz8n6Shd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=cl.cam.ac.uk
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDjvC-0007wm-MT
	for alex.bennee@linaro.org; Tue, 19 Jul 2022 05:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjsB-0003Zs-Nr; Tue, 19 Jul 2022 05:50:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjs8-0003ZU-NO; Tue, 19 Jul 2022 05:50:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso7440574wma.2; 
 Tue, 19 Jul 2022 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j1h9zPDvkG8il+pIfLNS6XUWKh8jK8dtTd9R/r27J0c=;
 b=Fz8n6Shd+zp3KXKXIYxQ3OEjhZcVykCcH1d2VoLy20T9upTB1wKejNpgn2Wvc1ns0B
 vAl6v2BJoWTDA5KvSopvmiS4JcJCjMS2wYqGtF0+WMEEMlLXqa877BBAqgCYinrNvnPv
 6f1SY65eHs6fn3UwDmML7UbhBPe2mkMemBHvBLxLVVm/HhEaJv3RF2ZxT90+PzSyJiF9
 enYVBCcVAe43kzhLU2/dzwlrE4vRzggJGbyMCg5TMBnDE+bpLgjJBG6wS4IKjzapzeCZ
 swMa334noonPNl8o1a/7gLGhwyqvWcfDPJuo2dxFeQUmhjuHw4r4irPEiipQSpdvHr5b
 70tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j1h9zPDvkG8il+pIfLNS6XUWKh8jK8dtTd9R/r27J0c=;
 b=uL2SK0O4GvVoCeajIbkloY7K6m4kYlNFI0/CD5TrhfY28GC3VQ+g1wcg9cKeDn+nAc
 Lun/57tQgX+ff5/a213NJ81RymsjI+MtkhiObMTz+fJmw6NMBiwKjiBktux6ANfFWgLo
 29UoH5kPpMOKsa6RzrYFzOqI+7S5UpJWKWg9AMG6WGLz3EDSxdDYjhOKsEOjv0ioz1rR
 CEc1Rc/DZ6ygR3buV3SYRZaiEcy4hcXObCZKjeDoCbsW0KxyAjPbgV7oQjQnMdEbxmXB
 K9P9I1NqZmG5upP6rGgjq0/yh8VvM8ysvimLw4ICmRCX1D60ARUuH5pIUrWtMytsEUPv
 r0pA==
X-Gm-Message-State: AJIora+LD3dR8FOfweT/sJzisR1gifx6Wyc0oEqDhW595j9GrKY/EkIP
 +Eu1fWgbIRQgZmnz/5iecw8=
X-Received: by 2002:a05:600c:17d0:b0:3a3:1b2d:ca44 with SMTP id
 y16-20020a05600c17d000b003a31b2dca44mr8093142wmo.100.1658224230952; 
 Tue, 19 Jul 2022 02:50:30 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c3b9e00b003a2ed2a40e4sm21343573wms.17.2022.07.19.02.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:50:30 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 1/8] hmat acpi: Don't require initiator value in -numa
Date: Tue, 19 Jul 2022 10:49:43 +0100
Message-Id: <20220719094950.1049516-2-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wm1-x329.google.com
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
X-TUID: ZEFw6dNfh+Q5

From: Brice Goglin <Brice.Goglin@inria.fr>

The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
has a "Processor Proximity Domain Valid" flag that is currently
always set because Qemu -numa requires an initiator=X value
when hmat=on. Unsetting this flag allows to create more complex
memory topologies by having multiple best initiators for a single
memory target.

This patch allows -numa without initiator=X when hmat=on by keeping
the default value MAX_NODES in numa_state->nodes[i].initiator.
All places reading numa_state->nodes[i].initiator already check
whether it's different from MAX_NODES before using it.

Tested with
qemu-system-x86_64 -accel kvm \
 -machine pc,hmat=on \
 -drive if=pflash,format=raw,file=./OVMF.fd \
 -drive media=disk,format=qcow2,file=efi.qcow2 \
 -smp 4 \
 -m 3G \
 -object memory-backend-ram,size=1G,id=ram0 \
 -object memory-backend-ram,size=1G,id=ram1 \
 -object memory-backend-ram,size=1G,id=ram2 \
 -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
 -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
 -numa node,nodeid=2,memdev=ram2 \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
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
which reports NUMA node2 at same distance from both node0 and node1 as seen in lstopo:
Machine (2966MB total) + Package P#0
  NUMANode P#2 (979MB)
  Group0
    NUMANode P#0 (980MB)
    Core P#0 + PU P#0
    Core P#1 + PU P#1
  Group0
    NUMANode P#1 (1007MB)
    Core P#2 + PU P#2
    Core P#3 + PU P#3

Before this patch, we had to add ",initiator=X" to "-numa node,nodeid=2,memdev=ram2".
The lstopo output difference between initiator=1 and no initiator is:
@@ -1,10 +1,10 @@
 Machine (2966MB total) + Package P#0
+  NUMANode P#2 (979MB)
   Group0
     NUMANode P#0 (980MB)
     Core P#0 + PU P#0
     Core P#1 + PU P#1
   Group0
     NUMANode P#1 (1007MB)
-    NUMANode P#2 (979MB)
     Core P#2 + PU P#2
     Core P#3 + PU P#3

Corresponding changes in the HMAT MPDA structure:
@@ -49,10 +49,10 @@
 [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
 [07Ah 0122   2]                     Reserved : 0000
 [07Ch 0124   4]                       Length : 00000028
-[080h 0128   2]        Flags (decoded below) : 0001
-            Processor Proximity Domain Valid : 1
+[080h 0128   2]        Flags (decoded below) : 0000
+            Processor Proximity Domain Valid : 0
 [082h 0130   2]                    Reserved1 : 0000
-[084h 0132   4] Attached Initiator Proximity Domain : 00000001
+[084h 0132   4] Attached Initiator Proximity Domain : 00000080
 [088h 0136   4]      Memory Proximity Domain : 00000002
 [08Ch 0140   4]                    Reserved2 : 00000000
 [090h 0144   8]                    Reserved3 : 0000000000000000

Final HMAT SLLB structures:
[0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0A2h 0162   2]                     Reserved : 0000
[0A4h 0164   4]                       Length : 00000040
[0A8h 0168   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0A9h 0169   1]                    Data Type : 00
[0AAh 0170   2]                    Reserved1 : 0000
[0ACh 0172   4] Initiator Proximity Domains # : 00000002
[0B0h 0176   4]   Target Proximity Domains # : 00000003
[0B4h 0180   4]                    Reserved2 : 00000000
[0B8h 0184   8]              Entry Base Unit : 0000000000002710
[0C0h 0192   4] Initiator Proximity Domain List : 00000000
[0C4h 0196   4] Initiator Proximity Domain List : 00000001
[0C8h 0200   4] Target Proximity Domain List : 00000000
[0CCh 0204   4] Target Proximity Domain List : 00000001
[0D0h 0208   4] Target Proximity Domain List : 00000002
[0D4h 0212   2]                        Entry : 0001
[0D6h 0214   2]                        Entry : 0002
[0D8h 0216   2]                        Entry : 0003
[0DAh 0218   2]                        Entry : 0002
[0DCh 0220   2]                        Entry : 0001
[0DEh 0222   2]                        Entry : 0003

[0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0E2h 0226   2]                     Reserved : 0000
[0E4h 0228   4]                       Length : 00000040
[0E8h 0232   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0E9h 0233   1]                    Data Type : 03
[0EAh 0234   2]                    Reserved1 : 0000
[0ECh 0236   4] Initiator Proximity Domains # : 00000002
[0F0h 0240   4]   Target Proximity Domains # : 00000003
[0F4h 0244   4]                    Reserved2 : 00000000
[0F8h 0248   8]              Entry Base Unit : 0000000000000001
[100h 0256   4] Initiator Proximity Domain List : 00000000
[104h 0260   4] Initiator Proximity Domain List : 00000001
[108h 0264   4] Target Proximity Domain List : 00000000
[10Ch 0268   4] Target Proximity Domain List : 00000001
[110h 0272   4] Target Proximity Domain List : 00000002
[114h 0276   2]                        Entry : 000A
[116h 0278   2]                        Entry : 0005
[118h 0280   2]                        Entry : 0001
[11Ah 0282   2]                        Entry : 0005
[11Ch 0284   2]                        Entry : 000A
[11Eh 0286   2]                        Entry : 0001

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 hw/core/machine.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302cce..d4d7e77401 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa_state)
 
     for (i = 0; i < numa_state->num_nodes; i++) {
         if (numa_info[i].initiator == MAX_NODES) {
-            error_report("The initiator of NUMA node %d is missing, use "
-                         "'-numa node,initiator' option to declare it", i);
-            exit(1);
+            continue;
         }
 
         if (!numa_info[numa_info[i].initiator].present) {
-- 
2.25.1

