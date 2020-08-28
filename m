Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1380219lfc;
        Fri, 28 Aug 2020 04:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXoLgb6WTk8TTdxJB8fx2ZtWxL3Vba0jE8Ey7MZqEWV9/J8rsp7mxCOa2Y08OKOvOfAJB1
X-Received: by 2002:a25:5741:: with SMTP id l62mr1764092ybb.299.1598614790875;
        Fri, 28 Aug 2020 04:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598614790; cv=none;
        d=google.com; s=arc-20160816;
        b=TiC+pCUc+Xjmu9PGjkIWnxfBacfH0RBJC2cUuZuWipuC4eUasmBe0/o2PYespNybh/
         MUJT3pFsCxMWXSMnnsZwGU5wyIUs4bGUNRftaBhgiBFVtdo3xtzbtPlf6rBh8SRsNsDA
         Z2vWE2TEyUlYYkxpSDpIHy9TnOPh86SXbKPBjXel1tGL9igA70AANrXF/duwbE3oeDmT
         C0q27/8tbP/eRAxbw6w/yuYTpAJdkTNy0nL+7b7mGlyCth70dOSVa1E1i5Kh9OLqbefn
         XxaAAXyscol3C98ksONel5x/8Z4QqlsErjdaQlaG2q3Ilcrh3qvLb6VHa5zJNhSNTgV8
         EC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=noQfbPQ6VFp4OY/M/zx7YnCj6SkWoOSV6L+2zOpzU2w=;
        b=QRGlZlZ5WI6oVe78C14qG4KlVdMKI4crfNQ4HPsdFg6Lbg3kvvZOEwWQzH17MH7vnF
         a9pJzHjAMYktLa0v8Hs/TrSDcC0PZdZzwmCn8wep5Cu2LfowOgxUpuHNSTxuv2tn1AfD
         WvS0euoY2X4Yv8cAnElBYIW740GvhLZfHFWCCulr31/Vr/H7JD2gdospZPexMoovtiRt
         rSaX0WGzUF/snxPQU3EMmot6+pyXEbNY80YrTwjMH5sZg7hekYjvIGRJ2BWOEgPpmV6q
         NbS+zu6KW9vuauo82PChqCLJOPjj33oYYa2CV7A43Vvev2JAtRNaIRHBOULcLEbo9Qcf
         cOPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JWp86s3f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si729319ybc.473.2020.08.28.04.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 04:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JWp86s3f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBcjW-0000TI-8P
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 07:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kBcjL-0000Pm-8i; Fri, 28 Aug 2020 07:39:39 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:32910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kBcjI-0004Pv-No; Fri, 28 Aug 2020 07:39:39 -0400
Received: by mail-lj1-x241.google.com with SMTP id r13so955796ljm.0;
 Fri, 28 Aug 2020 04:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=noQfbPQ6VFp4OY/M/zx7YnCj6SkWoOSV6L+2zOpzU2w=;
 b=JWp86s3ffEjr38M0Ej09xCaTwz6IwpR84UkJBS33AV0bUJZytp7NW7VsSrFp3Fxjxi
 koqrwKOw+TzabSHPCJ8T4rW9R/dj4yGq8fGbhvwq0ZSLlgje4O1AFkVRGVvLmqu2jWY0
 ynlqmSpGXt3uScnRcxIVjQ8/kxWc1Rfd057zFK0+UNNTMYfLLiKZR6XdzszLxE5dK5W1
 3tFwtig5rIUcgAg/BkMPO37j4v4vNrCnaq/yIqSF2zH61s1FxRJixntXjCtbRcCKsV2m
 Cqu1ftQyux4iJfb6XY1VBMNfzqsX0TS+IjHPiK2oWXMKgW189di1XquOQcsfBk3IN3C9
 zHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=noQfbPQ6VFp4OY/M/zx7YnCj6SkWoOSV6L+2zOpzU2w=;
 b=QCqrD21HTjhJaKklpC0W5HTLFTK5Muvs3yU1LNJ0PH0yYJmfSIT2WAt0aMIGIGZ78R
 toMIP9eSH5q9GT76XtT/A3C0pxjdHuZMdVSEjXGdL73otzwCBuz9H0UIg2JJSuJRBML1
 ylcyewzXDLB10Lb5hTDILPl4k4z2wM6OcOU8ADTSIzzJxUBpAAE+f0Vnc5BG9mkY6llz
 JDP34uBLlBnsNZGfZUAz3syhqqjB9olE1GidBrBpexkry8MFqNQaqP7MpxIEKJ1Q9fAA
 0NLm1W2+iS8ujJV+ytpb9nxr8SuP9ORGzuMZsaOgM3V7mHOhNwlxfjeO0OoFiqk+Uybb
 ZjgA==
X-Gm-Message-State: AOAM530johbq//cV17jTu37wff02jhZmDfl6QBRhUBX4EML7VbTnQU3u
 nwKswlbBk2uYQwMl1weS/grIt6xTkmk=
X-Received: by 2002:a2e:9b4c:: with SMTP id o12mr662308ljj.49.1598614773531;
 Fri, 28 Aug 2020 04:39:33 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id t25sm241769lfq.7.2020.08.28.04.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 04:39:32 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] target/microblaze: Use CPU properties to
 conditionalize bus exceptions
Date: Fri, 28 Aug 2020 13:39:30 +0200
Message-Id: <20200828113931.3252489-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200828113931.3252489-1-edgar.iglesias@gmail.com>
References: <20200828113931.3252489-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.425, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJwOirl8L/6H

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use CPU properties, instead of PVR fields, to conditionalize
bus exceptions.

Fixes: 2867a96ffb ("target/microblaze: Add props enabling exceptions on failed bus accesses")
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index f3b17a95b3..13ac476199 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -490,12 +490,12 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
 
     env->sregs[SR_EAR] = addr;
     if (access_type == MMU_INST_FETCH) {
-        if ((env->pvr.regs[2] & PVR2_IOPB_BUS_EXC_MASK)) {
+        if (cpu->cfg.iopb_bus_exception) {
             env->sregs[SR_ESR] = ESR_EC_INSN_BUS;
             helper_raise_exception(env, EXCP_HW_EXCP);
         }
     } else {
-        if ((env->pvr.regs[2] & PVR2_DOPB_BUS_EXC_MASK)) {
+        if (cpu->cfg.dopb_bus_exception) {
             env->sregs[SR_ESR] = ESR_EC_DATA_BUS;
             helper_raise_exception(env, EXCP_HW_EXCP);
         }
-- 
2.25.1

