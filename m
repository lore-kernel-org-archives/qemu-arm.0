Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1202551njk;
        Wed, 18 Dec 2024 12:22:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbrcY81bB5J67BEn+bimCYzpRo1pmI0oatT9cWBOPZUPRU1VMnbkY2mTIagwE4wlgebALoLzm1Bk+DSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGbCX9RofnP+FPTA4WgHvByaZmVsOA4OOkyA84oALytfDDZd/8ncLT9Y3u5WddzEZLh1Lkh
X-Received: by 2002:a05:620a:2407:b0:7ac:a0a5:9bf4 with SMTP id af79cd13be357-7b8637ad44cmr588966285a.40.1734553379438;
        Wed, 18 Dec 2024 12:22:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734553379; cv=none;
        d=google.com; s=arc-20240605;
        b=My/33MOZDroXCQ1KhEBpJHsLgAJcLEhgp1CAo8/0OVabWBVXADKzPiFyWp1h1x/7a/
         YdePdNz78WoMPVAHQdamgiZ24RbsT2ZNpvfa5iIqbkP7QobORoXl8nHJAKPi/19xlFzD
         MExEvBJhT1GFII8kiTdgnHKsKSHLxUfZPWGIO9vMMXyR5a8rak5nHnXDzpBibN+vYcz2
         T3PyS0nySHZwdXMAhTJM0ASI6V11/cxzD2cQpkp+3vFwgbsugrEREcDDFtTmVGkS2eOJ
         HJMK8O8Ukib+TT9UVNpDofUlrz3UFbtkztIpJGwPPemX0VUt3+90A6N9WdPUoBwam1U2
         16wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
        fh=FgJWw9sBsbnc3hp/8ER2VO4HcR0AzBvLlZJd/TbFRP8=;
        b=eukuZhSu9/68TyuYwfPoJ5WibUFS1rzTZIst09kQbdUFEAuGp5VWKE/23hyz1gEiHS
         nmqY2Qumf/RT5bKaVGnPDKA6w0AoQ9/CaFwB7ddF/fLnzFpem+yrmeLy8QpmY1nrHUS6
         g6d/Fn3AHNux08mPAKJQWkgSAU9DMOaQuwJuCUs8Q+Iur43Zpg5rrFROCwDM5+2P+dTy
         COHptRbJ+D28ctECbYaSnN4uGKLpQBcLpDXUDr5FE3Lrr69gpRugfb1BRgbMX7Jgk+Ww
         1mP6EsNTr3zPnL6rWLtCOshmnardEXwJTXORbLG0dHgu4Dhgq018taHzT7AvniccKjkV
         81Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=sdHX0E+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7048e44e1si1501951285a.550.2024.12.18.12.22.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2024 12:22:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=sdHX0E+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tO0Xh-0001Tb-Hy; Wed, 18 Dec 2024 15:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0Xd-0001Ph-QN
 for qemu-arm@nongnu.org; Wed, 18 Dec 2024 15:21:09 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0Xa-0000J8-Gl
 for qemu-arm@nongnu.org; Wed, 18 Dec 2024 15:21:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso80669f8f.2
 for <qemu-arm@nongnu.org>; Wed, 18 Dec 2024 12:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734553265; x=1735158065;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=sdHX0E+f2BPfkimwAxCMoiRGg1f/sgk99ZgqYNHlTmgDiMONFA9evZiR7WOpQ1Wz0V
 kPIs48i5pHZH1MU1nIiucA9kJuCavm5fbek3LqprB3rpGry7lDn3W+BMFGdCD0Yb747m
 iZjRxg5fQd2aHBd2g6X4IfdF6lu6BtqS+3mkCII6fXC73XtgEeVU/S/aju4owd+IrTzl
 MjRhY1zkcdU5fMaeFWK2f3+CIJMB/3quBRJzY+1TuE6/iqt9aToEgP9e40zzVjGhQAnW
 IZqMJ1fHKBFCUT1sinGNvUysZH4243cZbC9LL0hHKIH7iy8PlhDIjY6BrGvoLn9d6XCz
 7dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734553265; x=1735158065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=tRf144L3+ozu7GSXIthMyyOha7JXp+A4ahdzxbPeRFCncDpFE0gwtRnUwAV+xXUC0r
 LJPMoJHH/dv2GQ0upuvZ0GnQWzgro2PRBOmjXi/yxCCNhtae++ZRXFsjdYcug2AxciXM
 auPwx+5PiSPlDRXexzGpMgX2EO1LbqlmgF6g2Qrm4srUoTCu68ZWr4xAVu/Oy0Wm+pxC
 H0C0sQhW0/U0/w7YTRzTLly93A54hCXPx5bSYZKfjnsQ/UVAOonFLWnx9iBUdmSr+c1q
 FTZs4+2AlJiid7pwLSzEnitBsiIE+FSRk9TPlTsGVYEIzoMp/zz7HPFyYz1R4ak+cwvn
 GHEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX76NRX5va5rHgwAQ9WzFh6KjqXEh6WPFyHBbk0gnf5EaToy86R7jxCmXof/5GWVwVDszf7MHVsFw==@nongnu.org
X-Gm-Message-State: AOJu0YzT9V7nPGQ2X5GclTXeXW0CjEXTycKKE/K9CsO2t6e8dcspsSyP
 xHEygeDj7N37r02gFZd50O1cxuEbLQxId5CAfav62si+hBXmY7sTpuff2WhTWA==
X-Gm-Gg: ASbGncuPh3rgCZOzGpCUI6XOtHKFMmYMyF+553YKOE6am4BRr0uMm0GUvE2k7CDDtz0
 0KF7Ma9afxTjakTXRGfnU5PTfoLQHXjpEI5/ySYiXahePE1yRofMgqS0yU9NhFH5CUeicg1pWop
 EZIeP0GILlSBM21Nmkeysvp2ccoqxTx3bPuVnbhc8sABnrA6X1ZBaARjUORY7bG6fqPWCVkiDM/
 ZERik8uqJya/V/fFpCUYOwrOSlID8tzv5PF769jLeadLn9dy09zHy9u8LTStz8ejbifzszckAqK
 +uvGVZMfF1sg/3Yem1KSRY5vSYlHTBCb
X-Received: by 2002:a5d:5f56:0:b0:385:f996:1b8e with SMTP id
 ffacd0b85a97d-38a19b0504emr1134877f8f.16.1734553264856; 
 Wed, 18 Dec 2024 12:21:04 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120c7sm14842267f8f.13.2024.12.18.12.21.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 12:21:04 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v15 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Wed, 18 Dec 2024 21:20:29 +0100
Message-Id: <20241218202036.80064-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241218202036.80064-1-phil@philjordan.eu>
References: <20241218202036.80064-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::42f;
 envelope-from=phil@philjordan.eu; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: JXlIuw8LfzvF

From: Alexander Graf <graf@amazon.com>

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ca7ea92774a..d75e504dcda 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 
 #include "sysemu/runstate.h"
 #include "sysemu/hvf.h"
@@ -184,6 +185,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_CNTP_CTL_EL0   SYSREG(3, 3, 14, 2, 1)
 #define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
 #define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
 #define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
@@ -1620,6 +1622,13 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         return 0;
+    case SYSREG_CNTP_CTL_EL0:
+        /*
+         * Guests should not rely on the physical counter, but macOS emits
+         * disable writes to it. Let it do so, but ignore the requests.
+         */
+        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
+        return 0;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         return 0;
-- 
2.39.5 (Apple Git-154)

