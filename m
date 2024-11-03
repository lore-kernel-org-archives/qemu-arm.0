Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1598514njc;
        Sun, 3 Nov 2024 07:01:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUaRmz1cTsqpszW+uVhQAAJty0zHQe/wZu5YD5jlzDiUd7kVufZiBik5OXwIsxgiGg/dxJJRUqsjVgVJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFLMTE57pGW72iOixg7tXEp6pYnVJ9vIHPncYopcAYq4Dr67nfy7YCJvj+wXLRMePhpeXti
X-Received: by 2002:a05:6214:5d0e:b0:6cb:c70e:4e9 with SMTP id 6a1803df08f44-6d351a93026mr210858156d6.10.1730646112540;
        Sun, 03 Nov 2024 07:01:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730646112; cv=none;
        d=google.com; s=arc-20240605;
        b=R8XWUYVBLj4TJEjX6tjBdyjgJ7jyQdYY100zUFG17gP4/Ge+Aa+I57KKIFlQCf9Hn+
         AepGdnRluYOFRNCPxJVo3TdQ/8OGT7o3SrNMpAME+tEr8estVXVaPkIeFWzh3Z16YzxW
         giBeokVUICLIUXVXiJpdUkgd987pwNlzPXD0gRoOyJ8JUnuoCKuVJgSoK3mHAo/uLSua
         j0buP+ZZmEL/gjKJQL2yF2M+qZPvELytg39cyl6hX3FAqgkB8Lf5Rdr0UqSQCfPcHGr2
         /49H5zB3DOEIAn3MXcSwi1/zaUoAdLbcqyaHuLVPkW/ADMOoOdBw1vyNsIM9J16z/1m1
         lo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
        fh=4LCp/m+t0k/+2/xajmQN/fh0EjSmkmllUpFk3Bg/700=;
        b=JHTHnoL52w42vMFBOCQlyKQxnDUnpLS94qEa4fsiYkYFcJiQBR27BccMmKo7NLDA1a
         lLioaK+bFrgn4bwqBhOPyMeRoK2GsMe9R/fCicld78/1yqCs0/RQMuY865STR9OeuPnl
         Xy0oSYMPhb3eOPdIHerZOnog/gAMUl7IZyJF/o+glx4Yg9HDS8XZmz2Fxvecwnfmj/Px
         mbcN0XCeOiln6IdewQ4HiUShhOrFl26V6q+CSwr0hGQ2E1RGrYp8EUoUXO9Hq3ZY2J4u
         7lByjnYozL62bbul04GtWvXWuE7/vHTczbaCjZVS7bvFZZ+WXy2VH1SWsLroz0h29NoW
         ocog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=1XqMEEgG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fd639dsi94571336d6.187.2024.11.03.07.01.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 07:01:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=1XqMEEgG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7c6v-0000bm-6h; Sun, 03 Nov 2024 10:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c6I-0008N5-MS
 for qemu-arm@nongnu.org; Sun, 03 Nov 2024 10:01:15 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c6D-0006a1-Vb
 for qemu-arm@nongnu.org; Sun, 03 Nov 2024 10:01:10 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so5053661a12.2
 for <qemu-arm@nongnu.org>; Sun, 03 Nov 2024 07:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730646064; x=1731250864;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=1XqMEEgGSa31la0PRSNcvvaITHuBrkl7ii3A7oPMT9pMkH5u3Jmg3goTx65hIW3s98
 T0XUxKenM0KgJA5YlPIWk59KXr7KJ5InTNUOzntfLlGvicufl1gZopi4gJQ2QHkTlFlI
 mZej47dOGioLOU2coWJh6jMVtax8OgaZ16WfLhFiakaEVrutdbY85lRA6B4vvt2afZ9s
 e5XSgyC4W3qUXMvu2VB03k7obPUmAvvIjMiADHoHO7NaLov+uh0P2uukBml1Pb54RsXx
 Wn+Q5rRURjORnocpy4QD4lOLY9Oq5RcPqTtujU8WjnoMjHX1LRDH2FTu3i1qwsrcJnSq
 KKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730646064; x=1731250864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=qAkdmtzJC4dybiaEUIpcCejWQneIKjkato8hqx1V6vKWn/XDEl+wR0DtIvx1DERl2I
 //PK2DdTVKzpF9uCLvf5y3lS0zK8lwh/1PDrXmWqNwJKNradQoVhmSp1AbL5bvyWsoDe
 Xh+YD1uy2bZJFd4kiPiPOXTusmRsZqOEgo76zWizIka3bz2oyaiPrk3RYzDV96nnFAe5
 TwQauM5fbfBtxgJYkNuLKTf6MA9bUWmn0biFpP1atwDfSW5u57qnXpibW5a8JsjmougW
 ttNBRzRtMTodDtK9B3NVUjZXobzdKwuJoajDAE6zqydRCkReXTU3IqWGJk3Dkd+Iz7yc
 RxZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9dTr48kZTuN7O6vs1ze48v4wDwZttnlw0uQtAZV2IMnH3Slcc9NDvsUko8H0usnkCzVbvJNUOaw==@nongnu.org
X-Gm-Message-State: AOJu0YyOPJsRJT7j2Zmdwtz/GOu7zLWJO198UzAd6n0oMaa/SFmCeVpA
 rd7itCSV2pzGW22aAenuOlCx9msfIpeNAqbhkzNLlzjts+brXSlHULrIad6g5Q==
X-Received: by 2002:a17:907:3d90:b0:a9a:26dd:16bc with SMTP id
 a640c23a62f3a-a9de5c91003mr3158638066b.5.1730646063663; 
 Sun, 03 Nov 2024 07:01:03 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5664350esm431536666b.159.2024.11.03.07.01.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 03 Nov 2024 07:01:03 -0800 (PST)
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
Subject: [PATCH v6 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Sun,  3 Nov 2024 16:00:30 +0100
Message-Id: <20241103150037.48194-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241103150037.48194-1-phil@philjordan.eu>
References: <20241103150037.48194-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::535;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x535.google.com
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
X-TUID: T64xYny4cQ/j

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

