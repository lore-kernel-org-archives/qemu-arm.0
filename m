Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1327304lfy;
        Thu, 20 Aug 2020 05:54:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp4Cvdz4is7OsSl/lmQseRaMmRpOamIWCD126YyC+WX9jl+9m5b6jqo23sQOarGC6IsNR2
X-Received: by 2002:a25:45c3:: with SMTP id s186mr4999879yba.251.1597928084152;
        Thu, 20 Aug 2020 05:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597928084; cv=none;
        d=google.com; s=arc-20160816;
        b=KHssU8GmOofgYv6T0S0u4mEAkqixEjz6/JPRevexDW8c46JpjgOiLgaOPAuVwo79FW
         87k5AA2BN5nPHkSW53fW0DApyKHJnBnnWIu5Ldmi08tZWXfjkS8zBJ3oAywpgzG/QyVP
         Hdia1Z+4d98xkXQiYyWQFa1GrRQ9BPKJZgzaLyElgHVW1Tv048pFbQDlu3qLq6ltQIh2
         UIkaVIilQW/r5m4eVhwW8nZXTbMCaRlbJSl70UoYRBqp8wUl1K8jzwrVduFGSgyr23xu
         tqvRQTRGglpABnGGhFZrpIcqq6sN8ruuPrF/TYVapm19l0MNMxzFYfYk6TryKG9lkYIF
         ko/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=u5PljA5HGgJoQhacENPV2kbekDCEo8Ii1pT/4d+7Uco=;
        b=Poa1dgBCRXTNX+k3AEGSC55joKR7D0QIgdfRn1iGU9mXRpJOR4X7v79o8PlvpHwBHa
         9byDA9q5eOE3DYpFmiNdxloemFBkcz1vn8GfzIQlM2TaY+LNYyZoHjtCveUZJm6Yk1Cz
         9R4y4aLviJxt9v7rjGjXJpMZemtl0jRw/CFZD9WeZIIY9A9Wcohl8glqmB6deLaKZj4K
         fBJwNiYZ9vbTSvUJ2r3L8+i1BVh3ByZ3GDPFhsju7WHuuYX7hiatQstdpg/4dl2MssZn
         9g4qrHh1xb16yERl/T1YaTb967GbIFMpSZB4KfE+fCHMUObi6XMY3c6zFqfOUx80H7t+
         yo/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=toshiba.co.jp
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si1913218ybj.55.2020.08.20.05.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 05:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=toshiba.co.jp
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8k5b-0001Zy-FW
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 08:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <punit1.agrawal@toshiba.co.jp>)
 id 1k8cbx-0000yF-4s; Thu, 20 Aug 2020 00:55:37 -0400
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:54104
 helo=mo-csw.securemx.jp)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <punit1.agrawal@toshiba.co.jp>)
 id 1k8cbr-0005Dr-U7; Thu, 20 Aug 2020 00:55:35 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 07K4tJmI031419;
 Thu, 20 Aug 2020 13:55:20 +0900
X-Iguazu-Qid: 2wGrV5ExkTeoSQFQd4
X-Iguazu-QSIG: v=2; s=0; t=1597899319; q=2wGrV5ExkTeoSQFQd4;
 m=ZSBeRo0cUaHW2d51aGDT4R82sr7LdQDDf9LhBu8iUOA=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
 by relay.securemx.jp (mx-mr1111) id 07K4tIJC021865;
 Thu, 20 Aug 2020 13:55:19 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
 by imx12.toshiba.co.jp  with ESMTP id 07K4tIEa013070;
 Thu, 20 Aug 2020 13:55:18 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc03.toshiba.co.jp  with ESMTP id 07K4tI1N010320;
 Thu, 20 Aug 2020 13:55:18 +0900
From: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To: peter.maydell@linaro.org
Subject: [PATCH] hw/arm/virt: Default to architecture appropriate CPU
Date: Thu, 20 Aug 2020 13:55:07 +0900
X-TSB-HOP: ON
Message-Id: <20200820045507.614288-1-punit1.agrawal@toshiba.co.jp>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=210.130.202.158;
 envelope-from=punit1.agrawal@toshiba.co.jp; helo=mo-csw.securemx.jp
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 00:55:23
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 Aug 2020 08:54:36 -0400
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
Cc: qemu-arm@nongnu.org, Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0cLgBYZp1Bci

The default_cpu_type for the Virt machine is set to "cortex-a15" for
both the arm (qemu-system-arm) and aarch64 (qemu-system-aarch64)
targets.

As a result, starting the aarch64 target with "-machine virt" defaults
to booting with a Arm v7 cpu which is counter to
expectation. Debugging the issue is further hampered by lack of any
output from a supplied arm64 firmware as it is now running on the
wrong CPU type.

Fix this by defaulting to the "max" capability CPU for the target
architecture. After the patch both the arm and aarch64 qemu default to
the equivalent of passing "-cpu max".

Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
---
Hi Peter,

I spent inordinately long time scratching my head trying to figure out
why my arm64 VM wasn't booting in TCG mode.

Please consider merging if you don't see any issues with the patch.

Thanks,
Punit

 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ecfee362a1..7c5cbdba87 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2424,7 +2424,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.28.0

