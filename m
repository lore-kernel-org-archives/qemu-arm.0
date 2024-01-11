Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1477961ejs;
        Wed, 10 Jan 2024 21:12:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCwAK8Tn8TeV66PQ3OB4dI2znizmIEsD+SbNIcTLWDhZBp7XnBHoY8LUXxBc89PzQYPVAO
X-Received: by 2002:a05:620a:1d92:b0:783:2c63:1aea with SMTP id pj18-20020a05620a1d9200b007832c631aeamr775841qkn.75.1704949936162;
        Wed, 10 Jan 2024 21:12:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704949936; cv=none;
        d=google.com; s=arc-20160816;
        b=o6iF9t1tHs3XiWucHZN57Y81AncwUS0+d654TQwomkHtfWHXbUO+KeupNjX8NUlF0z
         rox8mKAV4PFhwe++F+0+70FpdJtQkKaUQjLpSk6P5rig2CbKbrwgfvFa/RpR2T4dstym
         jXwObekiLGYlddG2XuqnPouXvKBj3cXG/uKXzgOrtX+3gojdyzmSfu9JbNUzmv9CtlkN
         0/epEMxpuznUqueduuBmwNuqh4zuej0x4mVr2qmFucdpJbnggU0wkSRe4MjiCOU0NPlD
         u1fpYQSiwEZxc6NKS63nGt2B6dTffhU8hvpANBWnzZWzTnL+2LfzSFVEDPt1dhblEVEQ
         Hwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dhh1OJRTHcL6LVPFoW5weJ2aL2lescEzUbcpoYckhMA=;
        fh=OYVK1kdJ5ipmjnvI90EvzcfYBiSOnCZWwqcNuzEN/DE=;
        b=pqQBKGO5dyC8sksPIOi5/HCp00YoyI9y1yZ6VHxM5jOpUBIf3e176KHa3ibwqxE/HF
         NH4WHDnBQiKyVpZNUBiATbx82Z1qF1cLxMqZ5fV2kfpd81rth6E71qS5VG3BoDQO5Of2
         Wg6oH541EsgJPsnyDp2bA58B4Qsf+x+2878T2wHCAdRJ2bFZnEatx4sHf6qGu05BOWVH
         MreEA6tzSc/2tuD3Srb78dnCY2JmWX2o+R03sQPMoBXUivKBR8ndXmEBqqQ/mW6SwDg/
         r/E0OOGFS/KSTAPwMUydz29mgaBn4xAY9lt9p31jZRzC9Gyi8F/k1RtKx9QTswsZksVR
         UdaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fmrwN/sj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a05620a404800b007832ba01c45si264096qko.306.2024.01.10.21.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jan 2024 21:12:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fmrwN/sj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNnLt-0006KQ-6N; Thu, 11 Jan 2024 00:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rNnLq-0006Je-AL
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 00:11:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rNnLo-00061H-Oj
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 00:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704949890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dhh1OJRTHcL6LVPFoW5weJ2aL2lescEzUbcpoYckhMA=;
 b=fmrwN/sjvhZMDPE8MZDPTKrVBjfylncI6x/WA08YcA3uHegnGLdD/lgTcvuE9N8x3jdH5z
 8yRSayiYYZKDfAq5WcPIBjB5QgpR4ikpF+OmtP+xbHUVR1vtbEAa417cwjg5lMcpHtl7vU
 Gfih7EC/06kiajqvu322MneCA8z1PlE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-CRJzW-aHP4201sDsSSfRCw-1; Thu, 11 Jan 2024 00:11:26 -0500
X-MC-Unique: CRJzW-aHP4201sDsSSfRCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1E08832D60;
 Thu, 11 Jan 2024 05:11:25 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.72.112.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8BB2166B31;
 Thu, 11 Jan 2024 05:11:21 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH] hw/arm/virt: Consolidate valid CPU types
Date: Thu, 11 Jan 2024 15:10:54 +1000
Message-ID: <20240111051054.83304-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3nE3SFRCDyyH

It's found that some of the CPU type names in the array of valid
CPU types are invalid because their corresponding classes aren't
registered, as reported by Peter Maydell.

[gshan@gshan build]$ ./qemu-system-arm -machine virt -cpu cortex-a9
qemu-system-arm: Invalid CPU model: cortex-a9
The valid models are: cortex-a7, cortex-a15, (null), (null), (null),
(null), (null), (null), (null), (null), (null), (null), (null), max

Fix it by consolidating the array of valid CPU types. After it's
applied, we have the following output when TCG is enabled.

[gshan@gshan build]$ ./qemu-system-arm -machine virt -cpu cortex-a9
qemu-system-arm: Invalid CPU model: cortex-a9
The valid models are: cortex-a7, cortex-a15, max

[gshan@gshan build]$ ./qemu-system-aarch64 -machine virt -cpu cortex-a9
qemu-system-aarch64: Invalid CPU model: cortex-a9
The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
cortex-a72, cortex-a76, cortex-a710, a64fx, neoverse-n1, neoverse-v1,
neoverse-n2, cortex-a53, cortex-a57, max

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: fa8c617791 ("hw/arm/virt: Check CPU type in machine_run_board_init()")
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2793121cb4..5cbc69dff8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2905,6 +2905,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
         ARM_CPU_TYPE_NAME("cortex-a7"),
         ARM_CPU_TYPE_NAME("cortex-a15"),
+#ifdef TARGET_AARCH64
         ARM_CPU_TYPE_NAME("cortex-a35"),
         ARM_CPU_TYPE_NAME("cortex-a55"),
         ARM_CPU_TYPE_NAME("cortex-a72"),
@@ -2914,12 +2915,15 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
         ARM_CPU_TYPE_NAME("neoverse-n1"),
         ARM_CPU_TYPE_NAME("neoverse-v1"),
         ARM_CPU_TYPE_NAME("neoverse-n2"),
-#endif
+#endif /* TARGET_AARCH64 */
+#endif /* CONFIG_TCG */
+#ifdef TARGET_AARCH64
         ARM_CPU_TYPE_NAME("cortex-a53"),
         ARM_CPU_TYPE_NAME("cortex-a57"),
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
         ARM_CPU_TYPE_NAME("host"),
-#endif
+#endif /* CONFIG_KVM || CONFIG_HVF */
+#endif /* TARGET_AARCH64 */
         ARM_CPU_TYPE_NAME("max"),
         NULL
     };
-- 
2.43.0

