Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp226990njx;
        Thu, 24 Oct 2024 03:29:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJaxATyHbBftnxBhWmdIFciL1OrhzQK+hmwFbhNKBcK+mIRtYXHIkS02lXOyj7HM2MGpTbsl+Wx/m9zQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH4rQ0qKSV4KnC5sz5FIQkCASVh9ZPgskyuHFaY/1JUJ+zqB3snw7ECiRI2hGsPZEoF+fNy
X-Received: by 2002:a05:6214:440d:b0:6cb:ee08:d4c1 with SMTP id 6a1803df08f44-6ce342073a8mr79355426d6.13.1729765781077;
        Thu, 24 Oct 2024 03:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729765781; cv=none;
        d=google.com; s=arc-20240605;
        b=ABwARBhWQkApc+8RiYWrOw+OZUnfkWOcVkqNf+0/feNfFysYtLCbsPGBWTnzLmrK8F
         j8kgQBtxah0R4ybf6977jXcKYu90Wi6/c2gwtGrQ2ksqy3eGnPGskYQdRoXzZkyKWuZ7
         yspVE2n496AuNm/kO23XUuKzWcGL7S2wCUjXCiXC8QMwNF7lj0lQ1kjCQ35fyCuJpu5X
         Xmt1UuYC/RjRm3ymta3bSJbdoSfRWs+txnuPaRJZkEVCKVA4b9p1cUKxIiDNC/1HYbbM
         RpiBIxDfbzsyYXT5kflGmEIgM8Mt7Z2OyKn9sTmjXsEwDaHUPn3R+lX7t7HkDOpBk8BM
         i33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
        fh=Cz9mr7WFxiYKJBC2Bqqst74qbX4rU+wpTENwEkbsku8=;
        b=h4Gq1wbjtl6YtmC7hnSVEpEz2J0UDWmxEQ0zs+iQboEPf3ax7fN1vNanoerImO0Ks4
         /ZjUwPeSZW48Dprusxq0txoNhXBFMyi8o7k4vgkIun6NiwbtR0clTV3W32uS7muJMAuT
         GRwoEe0IPiysGqnsnqA0N02wBQ6GKEs/NOEQZues3bNRnIW8cL1K4DW7wQIDrbSmCUhx
         j5fvncjvXTa21V06YEm3WMIEj4yhsp8kI9s6cVrmxbNR3xBJWXP2V9mVIRyFxfTC6gy2
         DYZoo/2HMinF/nTN0fbPUCcKZLD+FM32zw3D9XSqLn2ud9hgpM/5uN0DIf2Bg8MRgSx2
         gvHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=vAA6hRr3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce009c958bsi116678136d6.318.2024.10.24.03.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2024 03:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=vAA6hRr3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t3v5F-0000wq-Ca; Thu, 24 Oct 2024 06:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v5B-0000u1-Ff
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 06:28:45 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v58-0008Dy-Bn
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 06:28:45 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so116231766b.0
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2024 03:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1729765721; x=1730370521;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=vAA6hRr3XWSmin7ZVcfpnmVNjqHtCHIbbQRY0AtipYtqiGTfjGKnYZcCM/Q16W0x75
 kVhRXxwgbMLEya4K/nwiZ2FzbAlGIXUusFTfCC2Eqklhk0PH+N2DHV4lM4bth7d2/Kk2
 bemb2UzU7LI6Me4Eg1fXbAj0v7SQxl6ga0ebmMLnMDql3IpXSAeSw746Cl4b4PX6+qne
 M6Y+0YORPmKwAKeio1+w7ikPvlactifOAlJ1OCcIJ3rvzKZzLoJHG8Jt5EigkmgJ3XLV
 7UEiFp+oSQjyPbgIhkPF3uvUHG7pdNb2GxD7+OxG79gbbseKkYbtYnk1VdFeFlKEaFxI
 8BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729765721; x=1730370521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=huZUBAi09c9DsfZQ3XHWADEviZhDrYoKdAjy9hPCZYXUuhlTaSnNeuULwDAAV8D5RG
 vNmYjCOdsRdOkImeWSzwhYCMBYrx4jXl/GV2Oi0aEo37Sh3s2/3CPT6FdOKf4hWyu3cS
 R6W8q2fRp/DYMmSwBeJCc1josX7WNLgz4zQ3+sydT2Hzt/GLPM2V+4U6sRnxK/IeHw0m
 j+Oq+8/zb0ZcLUmK+421Ri56AXeQ9aaXZpHw1j9J83h1HOOS5AqDoMNdoKrATbgm6Z6S
 Da53dZO/XkHifsMFdp6b0YyvCh5BcZVRcMCBFdPAyzW+evTMh+JNlK1rzx+ljOCKedQw
 lrqQ==
X-Gm-Message-State: AOJu0YyL+5317vJefew4h9TcwJzvrlEsb5o8xs5dWQ8fT2kU3m/XPVsn
 0pqSh3p7yokCAbFlXzFuP3f2zYJCCPgx3YhecRiyrrAzRXegFQzBCZp2T1OsHpe7BasRlqhDAsQ
 8hg==
X-Received: by 2002:a17:907:7247:b0:a9a:33c:f6e1 with SMTP id
 a640c23a62f3a-a9abf851e2dmr534891566b.5.1729765720535; 
 Thu, 24 Oct 2024 03:28:40 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913706d3sm601019066b.134.2024.10.24.03.28.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 24 Oct 2024 03:28:40 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v4 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Thu, 24 Oct 2024 12:28:06 +0200
Message-Id: <20241024102813.9855-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241024102813.9855-1-phil@philjordan.eu>
References: <20241024102813.9855-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62e;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: SqKBRoTV4uIh

From: Alexander Graf <graf@amazon.com>

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 6cea483d422..b45b764dfd0 100644
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
2.39.3 (Apple Git-145)

