Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp787144lfb;
        Wed, 6 May 2020 01:28:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypIras4Wyy6Gi6On7vs7JnWt1pPcY+wxoWvd53tjbEfsOhX6J3PWbjuaHi8AauQRdUTVHUB8
X-Received: by 2002:ac8:32a4:: with SMTP id z33mr7278326qta.363.1588753700238;
        Wed, 06 May 2020 01:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588753700; cv=none;
        d=google.com; s=arc-20160816;
        b=YKOta/65mLMYm6egP+OEeYkWpRqm2w6tGGH8xWR9I4CuMBpQVMYgRvoNlAxV7DAtwj
         snMkUh4ekZfzb+xySw4YwBCAtmIYBeny5fjFMGdfPsfrWia8YfzafHTftuOzQLHO4Weo
         rxha/xpbnyKRpfZXccS+UbQCsE/0Idp3gUbnuA63dUYmdF7Aj5GJBBuSI7E9c7/jWxEY
         edqgtDHvoA7hxpvlGuMmXRe3qFggGviDKnhw9RW9Ap+ta9GtilYMVzbt5CY0kO1MGqyX
         g9t5MxweZfOuQTFFdH4ahhHw81xSrTpNaS/TFhRHWh+GZr0+DoPeXiYaSnp5ldZ4drjN
         AVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4ElgN4Yyb+eIV6c4I3OLIyiUxN+73Gjyr4WakNYFeQ8=;
        b=XzgJdM3aD6M8BFL3bx9mEHd7ZzR8wZAvr4wRFoU2V2lZ4pAvvyjakw/Dsus4v5bgaT
         ybfAvoIBl0oOBEBnZez3djBoirJDPQVDv3JQjPVqDhOsrqmQZpR0sTmaf2ZApJoNGm9h
         NMPMR+5L1b0V+o5OYzrDResmde5r2belcFkJ6wRvS6a2Z1zuGIQ0QoY4tUnh2q0mrgTQ
         yZ7Ui3MEJt2WfXoNkk/sZO2YZvySGjHpRTIkBcqAb2bJEG1fGKaDDuE8NEK4bPufGQWe
         mwjfxlQMMhTCGa4eeOTkZjbDz39QhyAucR1j7zAjzMLAcM0AY/z6NucBy8Zd1pnzCRhL
         7UkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZktoJS4m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id b133si378866qkc.299.2020.05.06.01.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 01:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZktoJS4m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWFPf-0001Dc-IM
	for alex.bennee@linaro.org; Wed, 06 May 2020 04:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jWFMv-000558-SB; Wed, 06 May 2020 04:25:29 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jWFMv-00079c-5g; Wed, 06 May 2020 04:25:29 -0400
Received: by mail-lj1-x241.google.com with SMTP id h4so1369269ljg.12;
 Wed, 06 May 2020 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ElgN4Yyb+eIV6c4I3OLIyiUxN+73Gjyr4WakNYFeQ8=;
 b=ZktoJS4mnGX0eZRF6ZloA5KkZz4XYCCAbE04KQ2SJNxGHQl7B07GeW+tRYrgNnCivE
 oSfshteVeUkxRe+7VQJVtr5bgpklAWprrITJNZ+CjteOaINfHvcshLY4f/sWCBcmDVuu
 gSjDLA+2jwNCOj6IfjpQE/q1yHxke8L+EAkPhppNGCNcAm8xuHoLCjrDwwaFAUM0G915
 mte6H4vS4gzYU/aeiKDAENvA5C1jPxBH37ZZPLyDsHZAkeqqHuO42lg0gU/uTiH248Pc
 pGYgAFiHQBhx3AMR149X1n32chHkjPAH7+En5kdK1JS7V1jgQWmTgynn6BpixC1RNrDL
 NZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ElgN4Yyb+eIV6c4I3OLIyiUxN+73Gjyr4WakNYFeQ8=;
 b=puveFV5aAWbmr64fE7qZwug/3CAbCyv1r5kzplhZMWKTaKHhf9mN0azg607/N5bfmR
 CV4zcE7iHl2XNNqCQXKRgYf6ffTAKOI7y+h/Uu6g+rU56DmahOqUZg0i/Ysg27KVkv5w
 CU4s2CsKIUpBsrfaFXjUuEZnEpyZR2qrM/lo7qNUAbv+k+6fByASxZfEvapvVNonTBkB
 1cXFfvHL+TLyGMKooPp383rNnEMU87xFNXe6bii817QieIepEgH1ePJU0KLFxeznS5qf
 h74k3KKaiI7xUvnLiMz7Awo30we8A6rMcXImTojw7mMr4DcN+xYBdetHRp5oC7uzXoph
 58fA==
X-Gm-Message-State: AGi0PubSSLxw9FsouMxoR2VbSIuAfZqxYEIMY+9tlCoHEp10aH1LvvoH
 pXO34VO11jx07RESrCa7KryM5FNhy7M=
X-Received: by 2002:a2e:8807:: with SMTP id x7mr4267886ljh.173.1588753527081; 
 Wed, 06 May 2020 01:25:27 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h4sm1012453lfc.97.2020.05.06.01.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 01:25:26 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] MAINTAINERS: Add myself as streams maintainer
Date: Wed,  6 May 2020 10:25:13 +0200
Message-Id: <20200506082513.18751-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506082513.18751-1-edgar.iglesias@gmail.com>
References: <20200506082513.18751-1-edgar.iglesias@gmail.com>
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
 FSL_HELO_FAKE=3.399, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, jasowang@redhat.com, alistair@alistair23.me,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com, figlesia@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jJ5E29uQUuEw

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Since we're missing a maintainer, add myself.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f84e3ae2c..d3663d6c9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2315,6 +2315,12 @@ F: net/slirp.c
 F: include/net/slirp.h
 T: git https://people.debian.org/~sthibault/qemu.git slirp
 
+Streams
+M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
+S: Maintained
+F: hw/core/stream.c
+F: include/hw/stream.h
+
 Stubs
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
-- 
2.20.1

