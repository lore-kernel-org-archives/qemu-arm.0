Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2509500wrq;
        Mon, 9 Jul 2018 07:36:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcrfA/LQbRRTKeVvL5CkgQxSyQqjYAb83vVxfJHs777WEb9O+fPvmkeh9/gc/xnULovqxPf
X-Received: by 2002:ac8:371c:: with SMTP id o28-v6mr11682981qtb.205.1531146989576;
        Mon, 09 Jul 2018 07:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531146989; cv=none;
        d=google.com; s=arc-20160816;
        b=08aiAW+xSwOSovywHR+OiUMC4+xbAHyp0QDWiRbJKwdoRdJEj7rJTtOqSHiLiTmbIr
         zSMgb40bNtytju+H34Kf0Tqaf15j+ehDWW+azwfn2DxqYJ1dHLkGKq8MARNyXd5wnt7d
         PyUdLNdBLc3er4RzUeAdF7Zl+QTjsjnU0+0bIcAE1HH4wT70mmzhiPswKDkyHa1U5lcD
         10A0Nls7QOEKtUOBwNj9cCAktsIV4x/dHGIAyvsNR8qs5llAJvWfbx5HwP8CmdOUyos/
         SV0kREwMU/Sqy8xz0j11y8btEFUtBk5SJKLRgywO6i6FfGSfHAL4GPuhDC4+n9VQRrVf
         kTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=EBCn/hJk+WmfZ76FjsmOieyb7LhkQdRZ5d/hcjM+Ra8=;
        b=Cjo/3u9uwLEtrrBCFlbnvRok12STqHVQpzMC4ERlXwyMkaL+jLaYh2KntMuKNsvWdx
         QiLWHCH1TCzhtI1QsxR8OoA/2hZPZzLn1Y6gPKJ4ND0pxk+N9/ZsvL7zGXaTs0uKt7BV
         QcjxcQjRQiixCqQyvggi3Ar/mjY2kiUUSnuMzgISc9oQ0XjAEek+6YCRNMuXhbQakTIk
         sJ0CXIx7JVTexMk57tgIc+lpe7DfmnctsXOBKvHqjSXxpbTmNFYn5OfRBXjoWGjLiF18
         5zpwrSpSLNNH4fclTPMfOMHoWDJLtgwc00oRD+x+PKd0z64xTrT6weSaVoAVN4qBhpQR
         bCqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b="N/WVvqFw";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=fw3KakZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 54-v6si14829219qvr.265.2018.07.09.07.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 07:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b="N/WVvqFw";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=fw3KakZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcXHB-00067T-3P
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 10:36:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fcXH2-00067N-3H
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 10:36:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fcXGy-0001Yk-6K
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 10:36:20 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47551)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fcXGx-0001YK-V3; Mon, 09 Jul 2018 10:36:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8F9DE21D06;
	Mon,  9 Jul 2018 10:36:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Mon, 09 Jul 2018 10:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=EBCn/hJk+WmfZ76FjsmOieyb7LhkQdRZ5d/hcjM+R
	a8=; b=N/WVvqFw7ohFX2XkfYSBeodmCQNaTi44B6uwbJIVOjwof7igKykSElk3s
	IgD1MGssXONSKFDnIPYX8GVZhGiNlk6f+I3guEA39W1tRp0LzAE3E6B1R7E2nZwf
	lPOueisNgZyLUB8z4odI2W8odnI1LX5FznsyMQtWvWRyY/tUBGE3mnFw6bO5o9ZF
	7c2kRkEJ2NY9YhFP++sKEG97pd0x0frWZEE3Gmuyt3mMWlnj7KhDe+5fVFwvHFJv
	pYG4sTeft9tA6t5yiH1IAcTgbVavNt8AKYTcP8FfxnTQnG4ynXAzUjVO0AaFx/+y
	26nj9fl8upZxO359nAxv4K1/1zCHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EBCn/hJk+WmfZ76Fj
	smOieyb7LhkQdRZ5d/hcjM+Ra8=; b=fw3KakZt16haJREGbiLjTULPs70rRBYAo
	gMiMHwzOP/Vf30gTDjNMXDCv0e6STKAarwxiPw1HpXW7/0qjl/lAehtbhxmHmMf2
	/FQcfhQT5YKDUttpVZhuaYNZob0Eb7ZtdbqmBaiuIZvb+DDHNvbaEWYj2ttcSCXE
	8lF1y/+jpslIHg2eFGftZ1W9q6xOVngYClRQRTKI5wRLo8Oo9+DRreUwEGUCJsRP
	CSYx8MAk4mgKmASpigl02VBpntO1csaHGxVNaGFQY7k1++XACvKFj0EnX4Tp2GLj
	Lym9cOSLuanSB2PeGmwvfr08VZu8cRAZN+n/w4ORpDzU+xJ3iuKhQ==
X-ME-Proxy: <xmx:23JDW22WiEXT8TSx0Zbc2cxSHO2qJKa8FbWUZiYgkeVpRdHtQeEHjQ>
	<xmx:23JDW3aeEeGD7f_J9Zu43U4PYpnADJ2v1laFpRs-9G189vHIK-s8Kw>
	<xmx:23JDW1J-TOj6VXtVEwmSwRosbDRC6TX_kW3mxV9CoPhoBZl8oev4xw>
	<xmx:23JDW8It-qEt_vPUvy5DMs3QeyWQLF_zQdUMb6VMeEIPt7QMS8qJ0g>
	<xmx:23JDWyJdPSnGIxYkz-yl6YfPfxzjJTO3EJvTOB4VN6k8lSoA6ybRlg>
	<xmx:3HJDW9f_W79FM-_MWze_vxTOlr9Scc-vCIoc5KGg-rkviXylS5qihg>
X-ME-Sender: <xms:23JDW1EWmd_Jz9fpeC1OfQ4qoSm6iwIE9woKR2h2QnLXWLCUtzpHfw>
Received: from localhost.localdomain
	(ppp118-210-173-37.bras2.adl6.internode.on.net [118.210.173.37])
	by mail.messagingengine.com (Postfix) with ESMTPA id F38D71029E;
	Mon,  9 Jul 2018 10:36:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jul 2018 00:05:24 +0930
Message-Id: <20180709143524.17480-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org, qemu-arm@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /zLLUVomBQq8

The AST2500 SoC family changes the runtime behaviour of the hardware
strapping register (SCU70) to write-1-set/write-1-clear, with
write-1-clear implemented on the "read-only" SoC revision register
(SCU7C). For the the AST2400, the hardware strapping is
runtime-configured with read-modify-write semantics.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/misc/aspeed_scu.c         | 19 +++++++++++++++++--
 include/hw/misc/aspeed_scu.h |  2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 5e6d5744eeca..9051767cbbcd 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -202,11 +202,26 @@ static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
     case PROT_KEY:
         s->regs[reg] = (data == ASPEED_SCU_PROT_KEY) ? 1 : 0;
         return;
-
+    case HW_STRAP1:
+        if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
+            s->regs[HW_STRAP1] |= data;
+            return;
+        }
+        /* Jump to assignment below */
+        break;
+    case SILICON_REV:
+        if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
+            s->regs[HW_STRAP1] &= ~data;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Write to read-only offset 0x%" HWADDR_PRIx "\n",
+                          __func__, offset);
+        }
+        /* Avoid assignment below, we've handled everything */
+        return;
     case FREQ_CNTR_EVAL:
     case VGA_SCRATCH1 ... VGA_SCRATCH8:
     case RNG_DATA:
-    case SILICON_REV:
     case FREE_CNTR4:
     case FREE_CNTR4_EXT:
         qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index d70cc0aeca61..169611a211bb 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -37,6 +37,8 @@ typedef struct AspeedSCUState {
 #define AST2500_A0_SILICON_REV   0x04000303U
 #define AST2500_A1_SILICON_REV   0x04010303U
 
+#define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
+
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
 
 #define ASPEED_SCU_PROT_KEY      0x1688A8A8
-- 
2.17.1

