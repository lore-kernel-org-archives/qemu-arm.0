Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4621992wrw;
        Tue, 13 Nov 2018 09:12:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5fc8FYtW6+FSPpiZK2MYeERRPNal50RM80hM5Pif0m8+asSNpKadFnw87DwPArRwiB+olHL
X-Received: by 2002:ac8:7616:: with SMTP id t22mr5802166qtq.375.1542129179521;
        Tue, 13 Nov 2018 09:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129179; cv=none;
        d=google.com; s=arc-20160816;
        b=LrEEa3B/bXBaLsu/HpjFs9F5McvyUmVk2q8PvMDGR9eNdh80bzPxCgv+q181zy4XBn
         +VSvjwyYQE7HwgC+iro/42/7IT1tS/3Qakp8UwTO3n/YjNqlBN4rafTRmls3QBJ1Ls1K
         J2sRffTD6ZtYqwel093WsO9FCb386BrburqUL6IrNe5eJl4lzRtKnLGT4y9mxWC6mq4C
         /VrEiRyTnzJGRQV5gvEof1uGnrlQgOcgaQy83T+dbCgT/E2NoAWV/iKdGnogxPi8FxRF
         lVKprbNolTgnT/5a0U9rbVthhG1BTfy1ydrKQ7qsj9gua1+wn8ten++EqTOfQffYMRX7
         07Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sPt12d5fDz2SX0XqcXxU/3/1v95mm5ME3sBhhQTGgTs=;
        b=Hr4aFCie0IPemyUXPdXmxYHhmQ3a+bkn759YjHLxBbLzgef1Rav7dIie21NzGsIdZD
         fjlHVZGkLljxKiZPMoEgseEJNtnIUhv0Qxw66b90sWxlk5gnVR7dP9+IhiV4I8zw4dlW
         fZ3W7w7RDo+LXqMzbPNz3YkObweC5MJgKP5zOYvC8kQo5+Ft2LJBLr6UPlm2AIln4MbD
         7WjU5CAvQ33brR6inhd1Lzi5YRp96vL51r/YGcIPO5n536hLubAvUBuEz0j+vqf7wYej
         hXJIQwLVXDB45WUN/6A38QyoT5rdSjMHaDaLXH39kvPVUVUbvw3+XxF6V402UYhKmtnd
         u50w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si7338761qtj.211.2018.11.13.09.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:12:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcFG-0003yg-OC
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:12:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAL-0007Sq-6L
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 12:07:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbxD-0004AN-BF
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 11:54:25 -0500
Received: from mga06.intel.com ([134.134.136.31]:62858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbx7-0003pu-Th; Tue, 13 Nov 2018 11:54:17 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922138"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:49 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:47 +0100
Message-Id: <20181113165247.4806-14-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113165247.4806-1-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH 13/13] target: arm: Do not build TCG objects
 when TCG is off
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X3YNOyEavRVD

We can now safely turn all TCG dependent build off when CONFIG_TCG is
off. This allows building ARM binaries with --disable-tcg.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
---
 target/arm/Makefile.objs | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 8e513748e3..3f59bf1685 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,9 +1,10 @@
 obj-y += arm-semi.o crypto_helper.o gdbstub.o helper.o cpu.o
-obj-y += translate.o op_helper.o neon_helper.o
-obj-y += iwmmxt_helper.o vec_helper.o m_helper.o
-obj-y += excp_helper.o vfp_helper.o
+obj-$(CONFIG_TCG) += translate.o op_helper.o neon_helper.o
+obj-$(CONFIG_TCG) += iwmmxt_helper.o vec_helper.o m_helper.o
+obj-$(CONFIG_TCG) += excp_helper.o vfp_helper.o
 
-obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o arm-powerctl.o
+obj-$(CONFIG_SOFTMMU) += machine.o arch_dump.o monitor.o arm-powerctl.o
+obj-$(call land,$(CONFIG_TCG),$(CONFIG_SOFTMMU)) += psci.o
 obj-$(CONFIG_KVM) += kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
@@ -17,5 +18,6 @@ target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
 	  "GEN", $(TARGET_DIR)$@)
 
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
-obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
-obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
+obj-$(call land,$(CONFIG_TCG),$(TARGET_AARCH64)) += translate-sve.o sve_helper.o
+obj-$(call land,$(CONFIG_TCG),$(TARGET_AARCH64)) += translate-a64.o helper-a64.o
+obj-$(TARGET_AARCH64) += cpu64.o gdbstub64.o
-- 
2.19.1

