Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1150269ejb;
        Mon, 30 Jan 2023 10:27:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8rnyRJsX5/JSRe4MmdPvhnwxp0s68Q/PN9UK990o4hcFE2WqA3PIvpNA2M+mB41G00IlfN
X-Received: by 2002:a05:622a:1041:b0:3b8:6c4d:488a with SMTP id f1-20020a05622a104100b003b86c4d488amr5320797qte.37.1675103252140;
        Mon, 30 Jan 2023 10:27:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103252; cv=none;
        d=google.com; s=arc-20160816;
        b=brUhUyKMSXJUvYZkWiIAyoFtUF/OwV/BmGYMK5tcukKRiZuZKmI/79llsnVe2MEYVu
         S/beY/NsivDiASLTEkM6OXok8Z35BuwtbuWOOnjcfmNOF2Eyr1X6zrE/xEFc6HHLmjRi
         r4tIKZgZas7Vxej+vCrWJfsWYJruPnkfvfYYQlYr+8DZSpOx8EYG25KegN/j0oIQxxZX
         6bNawE4m46F4q1gCK4GeJpOlXLAQ5OsrFxt9Z2jDJgTvGHAeCFXOWIVMmKO6JZLiqq8o
         dzEL3bPIb2iVA4YVyRpQyxph4ugyCKgffzcDJ751ZO+HMaWNrJ1EToZV3Bu0UUry0sZN
         VdDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Vj+8R3eAUWvoTvt+rtdp3a8e8+qsFowbhWMk+Fsc6nE=;
        b=Q/fAkannc4/8V0PwTxf8eHnrSEVmJzDHgY3ky84budQjQUl16X8N06HxNRQyTpRvfs
         fPZwk1F5N6blBC9pHDLAgq4VbeeFeuDDoVqw0IzEKuxskoaFbVASLVBWantxZH3VTsU+
         eOROLrAEHmHD3hEL64PHHqkb4p5yhstyzpsLoPVNtLxd83J8/ldIlCSuiEfg1NKXKAm+
         aIZ88JZJo/toLyfQhDEDEWh24sRAd5Dl7CSzmgQ+dDmOI9I63TSwicilf/tR1ySV6cBh
         nBfOQs7VjYhRtr9ZiooSWiTl4uB2Dn5TTcOyEBI0qbKfZ+E9SgvmeQABnTvmYgFI6X/p
         w0dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRELcrA3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a05622a00cb00b003ab9d290685si6974889qtw.374.2023.01.30.10.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:27:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRELcrA3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqT-0001FQ-2v; Mon, 30 Jan 2023 13:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqQ-0001CZ-CL
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqL-0000DC-Qw
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id h12so11971900wrv.10
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vj+8R3eAUWvoTvt+rtdp3a8e8+qsFowbhWMk+Fsc6nE=;
 b=JRELcrA3NnnBuZvuy/RVQCm1kH2JcvOT5mju9FW6IjVjmBBUd1PPDPDd8E28Prp3sL
 82ruCcn6Yx/WTuCIbNVMdd9oStM8ehSCkyP6uZkxsfBmPj7L5a8l3BrC+1eXoxQYOgjc
 VjDmUddULcDPwjgdXhBPjHs0nOItDUo8kEoSka71ZvxnO86ccvm0Xyq6jaCRzWepy1E/
 DCrcCEYMXSC0n3buqUaP7ykrcXLa5H5UphbuLUXaJFavgcwR+gXyTe1KJ0xDxBTX4znq
 2LXp5U0ebIiu/v213y1B4DcJvFJdsOvf7WtL/PUtwhi8pY4FscesA253oamxqM3Agd97
 Tl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vj+8R3eAUWvoTvt+rtdp3a8e8+qsFowbhWMk+Fsc6nE=;
 b=NstZmSw7d8ph15FEy6D2N8/iQiykmHm8BQ2JJm1ELfPxINMWa4u1iqeGz5qoBc6JTd
 7Z6rBUhy6bBjzvAU5c7gzbhbBFz47+N5CKp3j1pnTTBj7KaJKZNjJVSckC9p8LiN9TJj
 07aUlMh+TCAZUYohwg2yXsNAaZnJQPzJ7/zN5PifKJk+lqPpxzxJGYM375TcY88d3SFv
 MsFVL33HcU/fU6AUgHFB4FXN5gTXMOQ1LQoRIAZr0MxNPgjLnd+VzhdlC1DMQN6SP5Wd
 S9kEEHEXqffDwBISAvywI4lGQmdaMs8jKOFYhEtgwqX0dmFjiNTP4eLtDK6KTda/aoK4
 TSbg==
X-Gm-Message-State: AO0yUKXJrTuKX4SdJUazDbCUXlJnMXgU61ne94laLi+W7kp2lL83o4//
 EYP5yXEXMeVKPdx+4CRuCU+yFnJDbahhpSKO
X-Received: by 2002:adf:f14a:0:b0:2bf:cd9f:37f9 with SMTP id
 y10-20020adff14a000000b002bfcd9f37f9mr11830193wro.4.1675103124529; 
 Mon, 30 Jan 2023 10:25:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/23] target/arm: Enable FEAT_FGT on '-cpu max'
Date: Mon, 30 Jan 2023 18:24:59 +0000
Message-Id: <20230130182459.3309057-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yyeWCH1bovUi

Update the ID registers for TCG's '-cpu max' to report the
presence of FEAT_FGT Fine-Grained Traps support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-24-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b33d7c28dc1..c76555f51a7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -28,6 +28,7 @@ the following architecture extensions:
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_FCMA (Floating-point complex number instructions)
+- FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FRINTTS (Floating-point to integer instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb5..4066950da15 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1224,6 +1224,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.34.1

