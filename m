Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp453577wri;
        Tue, 5 Nov 2019 01:12:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqyrl+JL9dmyZ/QEh9Yu9yeBetviukolLnEa2qp6uxoRJDRLbhNxvoR2j9zfEXFmMaOL3mTr
X-Received: by 2002:a37:81c1:: with SMTP id c184mr12265081qkd.59.1572945160853;
        Tue, 05 Nov 2019 01:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945160; cv=none;
        d=google.com; s=arc-20160816;
        b=I2NlYzS1UtsD1ba7OZmL1cL8sYaFiuvyyKnZ+2dVyY/1CA3FuqtHIqvGrNmAfwRqCG
         RA3163mGPubTmAw/lEf7NI4VTo2REbaWLyCds+CbcKvAXBNIk6IGEPd/xQk+nN/auZ+k
         iKw7ul1tl9joK4/30AinXD5TT7eS55WluAtWgYANh/1tAI/zifg/uHLLiSU+6OMWmIzm
         qUn7WGtV34bnLjoTJrWqqcfgvEhLeuz+dz/3prtQ1RdIsI0ijP20HCrfYipdauGJNFnI
         iD2fTPZX1xv7ETyP1Eq0tWFTAGmkpiC1Kw2xQgtIUX9s0sdaR5ulcwCdIVWcBMqhjjP2
         dtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=0z1sV+nrIiXCF7X5ZyGodvqk5mKYFCX8yNrUGVPDSZQ=;
        b=kQtz/HvaCVLdD7iPSLKIfFynNyTyyn9mwspfhvbRCsKvRya/7f+AqTlVsKfoJyw/oi
         jlU83uklX7e5yek2qUKVY55hlw+svdPzBB3ur210Rv2MQrWRBVCNjyhOhJSn28bAj7Ge
         KFX7v2OTnzf78rJsEH/UNrI0xc1FfvoGqs1cQ53ry5W1BBuR/sHHV6oHNQNFqKnJFNw1
         ruVZQLY2k5jQKoaebXo4oPCPw6Mib8KzTS/JcNjR4XJRcg9q9WvtX1gxi0lP6s1cGW27
         lTtqu7mi2nn4hnRv8ZlzbPUhMWFapg2AU5VInpA4OJ7fQrW4utzAwS4BkVggSoycA8Pe
         EMiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26si14893499qtc.18.2019.11.05.01.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:12:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRutD-000545-Rn
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42943)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusu-00051J-KO
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRust-0007jd-AP
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2193 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRuss-0007ho-VA; Tue, 05 Nov 2019 04:12:19 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 30E169802AA03F54722A;
 Tue,  5 Nov 2019 17:12:13 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:04 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 04/14] arm: add CONFIG_SDEI build flag
Date: Tue, 5 Nov 2019 17:10:46 +0800
Message-ID: <20191105091056.9541-5-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 James Morse <james.morse@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AMgWZ3I6nwpC

Integrate SDEI support for arm/aarch64 targets by default, if KVM is
enabled.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 default-configs/arm-softmmu.mak | 1 +
 hw/arm/Kconfig                  | 4 ++++
 target/arm/Makefile.objs        | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 1f2e0e7fde..fc1f2b2ead 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -40,3 +40,4 @@ CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
 CONFIG_SEMIHOSTING=3Dy
+CONFIG_SDEI=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c6e7782580..472bc3a75b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -469,3 +469,7 @@ config ARMSSE_CPUID
=20
 config ARMSSE_MHU
     bool
+
+config SDEI
+    bool
+    depends on KVM
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index cf26c16f5f..72e01d08dc 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -11,6 +11,8 @@ obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARC=
H64))) +=3D kvm32.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
=20
+obj-$(CONFIG_SDEI) +=3D sdei.o
+
 DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py
=20
 target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODET=
REE)
--=20
2.19.1

