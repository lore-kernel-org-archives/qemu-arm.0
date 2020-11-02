Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3825028lfa;
        Mon, 2 Nov 2020 03:03:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxGs8LF/0jqnrSAbn86YYnw8Sid9YP5XXNKmzz+ecS1ASVK960ZXeruaNWKb7qFpgDu9h3
X-Received: by 2002:a37:9747:: with SMTP id z68mr13807884qkd.424.1604315011656;
        Mon, 02 Nov 2020 03:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604315011; cv=none;
        d=google.com; s=arc-20160816;
        b=HigsCSlNyWU8mNG1DzKfcm4qEatqplP2qqKC3InIzPINmSb3l9A4FppHsxiZ9jSDwU
         zM+oqzU/+LrK9RT55DjhSbAwrqA8ad2dKkQEnoW5BX6kHkRva6a1vWODQsQpI9ue9WC/
         T8kCwcnr0anOg/DaxTqo56cxVqAvOrDkllw+zAFbG4xo3zxziR8JJ/XquYXHLSNzkoU2
         bRRryJ6Bhc6UNvQlnWmszA98HRw9hHlE39ISSOiraM+ZMr5uxeDZ6ZqBMjypNriSeRll
         8sGZ0XWRwcrRlYdBk71cRjoT33qxS1NdCulpDvDuTvt3+3r0GW2CpAKkg8+Wpx0MnQbn
         iQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=hMuKc8ebLEN88e+JF8Y4QGCyblPqnx8hyvyCv+7JnD8=;
        b=JahUlbqh2K0oK1VRLjocnllg56zQZEfs6474wEXOG8B+t5RorCKWVyXnbKmUmbQkbS
         HgEFiv4DjevHlHwaGoN0KdDIK+lPb+pFwiVCKptFtEhHU08quom5wzzE/mChcKK39/rA
         BXuJwkIuQe1YuHMtlZARLgfjY9hLZsNH7In4CVTyCzinUm7/R4Qs0fRtwtw3nVGEQEyV
         GFFxiur3ABQdPIATPqG2w7EICXy+038CEd/0Me0nmhuhctaF5K9TVkkpCDZ4JruQ62yX
         iPqLm6w77jxN2rywtnr5HHcJROzWDMlzl3Hm2oDXClHoJy2HhDEWCAaU9uWwNkuhg3VP
         aMzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si9029534qvh.119.2020.11.02.03.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXcZ-00072r-3O
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXXm-0008U2-OB; Mon, 02 Nov 2020 05:58:34 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39574
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXXk-0006nD-4S; Mon, 02 Nov 2020 05:58:34 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id BDAA5605D7;
 Mon,  2 Nov 2020 11:58:05 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 14/14] target/arm: enable Secure EL2 in max CPU
Date: Mon,  2 Nov 2020 12:58:02 +0200
Message-Id: <20201102105802.39332-14-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <2172054.ElGaqSPkdT@basile.remlab.net>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wEs5xxObJUZt

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 649213082f..8c3749268e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -641,6 +641,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
-- 
2.29.1

