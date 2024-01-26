Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp793963ejc;
        Fri, 26 Jan 2024 02:51:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUB33yrZP8lETCMzsqDSSemDK+HWvMBlgOTWGiUgYueufzXHt0Y0CsiV8Sgr7dF/vONsHt
X-Received: by 2002:ad4:5946:0:b0:686:92c4:db1c with SMTP id eo6-20020ad45946000000b0068692c4db1cmr1321767qvb.41.1706266314688;
        Fri, 26 Jan 2024 02:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706266314; cv=none;
        d=google.com; s=arc-20160816;
        b=qSa7aAFGu6duKu6zmyfcZWt8YVp9z66xDCIWZRu3llBGqHT2xjluu++ZcLIilgguEp
         icVAvBe7CKXnitxIjn1bI4PbyrpzAuynMNAN+pWCH2YB6Gta76gF7foh/FVXiHBE1FXb
         O1UEX0DBbcMK7ZPMO5sv06/EAI81fz8HE0Oi1EiHtcwPTEfE+rnC1E0B0NH7fLGs0g7R
         NK8kuNkBCbzTiN0j/sxa6Rjmg7//X38qLf8mh6YYuDRH8pD0yk4Ddv2b7qsIo1bFASc1
         mt1TJ0WCMDw47ubXAw1EPdmb57K2u5HoSPrLhmh/Wsj6EjO5EkkDvqBCSkCodMdLKVqV
         dmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=f8Td4YAcTTeu8i08n+IUsnGzZgI+H4uUEg4hwKXQ6wQ=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=QrnKHdkdT3Pu8BrjXdm8hhjjQ4HJ1kTlzdO50GRIsR6mWkhB9z3sssQeZo1tr9lVvr
         dcfCkFS6YYG2td/Lxi+XZRyXhd/V3DMd4rdfFxQOQ3fdr4ukTt9+elhIG8RuZtIeO6/0
         3PPX0/CEBf9uEOFJWaesXeJwMRd7sQatHXkOEYm67YvGHP0sg9NTRIq9Nt5g86Sg7yzH
         5AkovnXK5PZpqUEUOF41JbxIpm/nD5XqNIldf/zHVIX9AeoUs+H+Xq5Hj0/ePPIZb9aP
         h0QnNbLz9qaPw2DE+/QRZYwunnOt43YdIvW3CPw2e9OSXehS4rQyTOg+wsXxdFj4zuEa
         mTkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=hMhPqSVm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a056214224700b0067ab557459fsi1040432qvc.305.2024.01.26.02.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:51:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=hMhPqSVm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTJnb-0004sv-01; Fri, 26 Jan 2024 05:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn3-0004Zv-76; Fri, 26 Jan 2024 05:50:31 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn0-0006Et-LQ; Fri, 26 Jan 2024 05:50:28 -0500
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40QAjh4T015285; Fri, 26 Jan 2024 10:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=f8Td4YAcTTeu8i08n+IUsnGzZgI+H4uUEg4hwKXQ6wQ=;
 b=hMhPqSVmPoQRFifLSzkgPS6lYWQT93PuTDfAWKMl+HF835OM7P+1Dgh5PXjcKMMclFGX
 IWALf9QqHZ1GpvgDD/FPc98A293mzHS8n6zAY/jx4TxKo+nA+fIyEsD9SrprDOfDf2oY
 KQi5KEdNkyB6tgHZLJs4ztYlDQR81nrrI1+Fh9ZFKaE9pPUno1j2TSzgw3JMilJZtxUx
 rkUlU50aM8xsAKNK64EvZOc9qDYn9gWiikwLz7RY2W0Co/MKCdz2kI68IZw3JbGvt8rB
 IkMtLk16SMUDMuJNoYJsMpX9Uf/iAA2gxz57YVor83J00xyIM++s1mQc7zbR5EGZoXz+ GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvadss4kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:11 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QAkO3r016447;
 Fri, 26 Jan 2024 10:50:11 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvadss4kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:10 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q9anOi028287; Fri, 26 Jan 2024 10:50:10 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vru731t1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:10 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40QAo9eJ63177214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 10:50:09 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A9FC58053;
 Fri, 26 Jan 2024 10:50:09 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9745958043;
 Fri, 26 Jan 2024 10:50:08 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 10:50:08 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v12 10/11] hw/fsi: Added FSI documentation
Date: Fri, 26 Jan 2024 04:49:55 -0600
Message-Id: <20240126104956.74126-11-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126104956.74126-1-ninad@linux.ibm.com>
References: <20240126104956.74126-1-ninad@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WVrzhhlN0glg5d3lVFCRPiGnlSVwzq7Q
X-Proofpoint-GUID: FgFSlpubbt91uaMD_9MsUPCCp7piTvp_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=659 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401260078
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: agUAOkw7uCVz

Documentation for IBM FSI model.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v11:
  - Removed Cedric's signoff.
---
 docs/specs/fsi.rst   | 126 +++++++++++++++++++++++++++++++++++++++++++
 docs/specs/index.rst |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 docs/specs/fsi.rst

diff --git a/docs/specs/fsi.rst b/docs/specs/fsi.rst
new file mode 100644
index 0000000000..b33b4d565c
--- /dev/null
+++ b/docs/specs/fsi.rst
@@ -0,0 +1,126 @@
+======================================
+IBM's Flexible Service Interface (FSI)
+======================================
+
+The QEMU FSI emulation implements hardware interfaces between ASPEED SOC, FSI
+master/slave and the end engine.
+
+FSI is a point-to-point two wire interface which is capable of supporting
+distances of up to 4 meters. FSI interfaces have been used successfully for
+many years in IBM servers to attach IBM Flexible Support Processors(FSP) to
+CPUs and IBM ASICs.
+
+FSI allows a service processor access to the internal buses of a host POWER
+processor to perform configuration or debugging. FSI has long existed in POWER
+processes and so comes with some baggage, including how it has been integrated
+into the ASPEED SoC.
+
+Working backwards from the POWER processor, the fundamental pieces of interest
+for the implementation are: (see the `FSI specification`_ for more details)
+
+1. The Common FRU Access Macro (CFAM), an address space containing various
+   "engines" that drive accesses on buses internal and external to the POWER
+   chip. Examples include the SBEFIFO and I2C masters. The engines hang off of
+   an internal Local Bus (LBUS) which is described by the CFAM configuration
+   block.
+
+2. The FSI slave: The slave is the terminal point of the FSI bus for FSI
+   symbols addressed to it. Slaves can be cascaded off of one another. The
+   slave's configuration registers appear in address space of the CFAM to
+   which it is attached.
+
+3. The FSI master: A controller in the platform service processor (e.g. BMC)
+   driving CFAM engine accesses into the POWER chip. At the hardware level
+   FSI is a bit-based protocol supporting synchronous and DMA-driven accesses
+   of engines in a CFAM.
+
+4. The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in POWER
+   processors. This now makes an appearance in the ASPEED SoC due to tight
+   integration of the FSI master IP with the OPB, mainly the existence of an
+   MMIO-mapping of the CFAM address straight onto a sub-region of the OPB
+   address space.
+
+5. An APB-to-OPB bridge enabling access to the OPB from the ARM core in the
+   AST2600. Hardware limitations prevent the OPB from being directly mapped
+   into APB, so all accesses are indirect through the bridge.
+
+The LBUS is modelled to maintain the qdev bus hierarchy and to take advantages
+of the object model to automatically generate the CFAM configuration block.
+The configuration block presents engines in the order they are attached to the
+CFAM's LBUS. Engine implementations should subclass the LBusDevice and set the
+'config' member of LBusDeviceClass to match the engine's type.
+
+CFAM designs offer a lot of flexibility, for instance it is possible for a
+CFAM to be simultaneously driven from multiple FSI links. The modeling is not
+so complete; it's assumed that each CFAM is attached to a single FSI slave (as
+a consequence the CFAM subclasses the FSI slave).
+
+As for FSI, its symbols and wire-protocol are not modelled at all. This is not
+necessary to get FSI off the ground thanks to the mapping of the CFAM address
+space onto the OPB address space - the models follow this directly and map the
+CFAM memory region into the OPB's memory region.
+
+QEMU files related to FSI interface are in following directories:
+ - ``hw/fsi``
+ - ``include/hw/fsi``
+
+The following commands start the ``rainier-bmc`` machine with built-in FSI
+model. There are no model specific arguments. Please check this document to
+learn more about Aspeed ``rainier-bmc`` machine: docs/system/arm/aspeed.rst
+
+.. code-block:: console
+
+  qemu-system-arm -M rainier-bmc -nographic \
+  -kernel fitImage-linux.bin \
+  -dtb aspeed-bmc-ibm-rainier.dtb \
+  -initrd obmc-phosphor-initramfs.rootfs.cpio.xz \
+  -drive file=obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
+  -append "rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a"
+
+The implementation appears as following in the qemu device tree:
+
+.. code-block:: console
+
+  (qemu) info qtree
+  bus: main-system-bus
+    type System
+    ...
+    dev: aspeed.apb2opb, id ""
+      gpio-out "sysbus-irq" 1
+      mmio 000000001e79b000/0000000000001000
+      bus: opb.1
+        type opb
+        dev: fsi.master, id ""
+          bus: fsi.bus.1
+            type fsi.bus
+            dev: cfam.config, id ""
+            dev: cfam, id ""
+              bus: lbus.1
+                type lbus
+                dev: scratchpad, id ""
+                  address = 0 (0x0)
+      bus: opb.0
+        type opb
+        dev: fsi.master, id ""
+          bus: fsi.bus.0
+            type fsi.bus
+            dev: cfam.config, id ""
+            dev: cfam, id ""
+              bus: lbus.0
+                type lbus
+                dev: scratchpad, id ""
+                  address = 0 (0x0)
+
+pdbg is a simple application to allow debugging of the host POWER processors
+from the BMC. (see the `pdbg source repository`_ for more details)
+
+.. code-block:: console
+
+  root@p10bmc:~# pdbg -a getcfam 0x0
+  p0: 0x0 = 0xc0022d15
+
+.. _FSI specification:
+   https://openpowerfoundation.org/specifications/fsi/
+
+.. _pdbg source repository:
+   https://github.com/open-power/pdbg
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index b3f482b0aa..1484e3e760 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -24,6 +24,7 @@ guest hardware that is specific to QEMU.
    acpi_erst
    sev-guest-firmware
    fw_cfg
+   fsi
    vmw_pvscsi-spec
    edu
    ivshmem-spec
-- 
2.39.2

