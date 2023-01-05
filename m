Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp639036ejb;
        Thu, 5 Jan 2023 14:46:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuz7+LyvHTipGAtZtWXHHNHVFkf/ESTAuY0XqwxGOCHJh5zNw2p3jE1DzTvbcL1ima4x3UJ
X-Received: by 2002:ac8:4f49:0:b0:3a9:7ae4:eecb with SMTP id i9-20020ac84f49000000b003a97ae4eecbmr79834411qtw.54.1672958770368;
        Thu, 05 Jan 2023 14:46:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672958770; cv=none;
        d=google.com; s=arc-20160816;
        b=bqX43khOKKEVhO8XkYbKtQZUkzI/ZueQoB+g6Ebnd5wt+JbtiwSI9Q/28/NDbDZWC/
         iylvBU9snd7ZjvmD2v4UQGCrYp6yn6r9zn08O/LZzpr4/IbDDmSvO65wIEV0b2Uk0w+6
         XbmIsQdcqMOEaGEKUKpp3dadtPSHbVP3wY/osQ4y7CUFdRJVQuRNe19K7vlNRk/7EiP1
         5J93GtW4O2PBZcqPGpvZ/DRgGL1sQqaosUmPZ5H8d9h4oUrnMfu0YW28m6L75TmX52vl
         1NVA4zdaWTIxmy2Utqwmxea1Zgd5omnPJHBETdKzQP/RHaxxqNnLbRNsU399pOHq4hsr
         HPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=0vqipwJO687PYjgTT1xXJiaZkuc8ITjjIBNOXxLxqcY=;
        b=Rv6XqVtrL0Lmov9SBzzHTqJP0X/uoLTFFFcgnmeXncAm8GOMa8xIT4fkdemJ6qARX7
         /GXzZFJFkoHcIPL5nnO2hj36i773/Z7rCeae+WkpMiV0wexAuPvTiK/OdiectmFAZutV
         1ErubMEa24q9Mi7yPkcaX+sNxiczrAxlIIZ4WUKo+ToNVCG84M2ZlebIE23GvYB+yKNO
         tkB9xs1PrywuZV12ofpX9snxgceiG4kEiFnmE4LLQj2A6IkxtzZuruFhaC6fGtaZ587s
         Hv53oEsPM55aukpf5TYEXmAJDfzyGO+a/3L5XN7R/BhhHXqiee5vRVqT4EvpX6Xqf8PQ
         2rGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=UCqlOsYA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020a37ea01000000b006e3fcaa9da4si20645399qkj.41.2023.01.05.14.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 14:46:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=UCqlOsYA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDYzn-0001DC-Jz; Thu, 05 Jan 2023 17:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTv-0006i4-VM; Thu, 05 Jan 2023 17:13:03 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTu-00023S-Eu; Thu, 05 Jan 2023 17:13:03 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 807E320B92AE;
 Thu,  5 Jan 2023 14:13:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 807E320B92AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1672956781;
 bh=0vqipwJO687PYjgTT1xXJiaZkuc8ITjjIBNOXxLxqcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UCqlOsYAK5YdJHFhB95Nzae/kf/JV37Rwq4gOH+A6n/D35ucLqVL3OmKDcLarRuaY
 vW5HTKkZX0utZKdk79zXLeM71vLQwOqVx5U7En8xPrxze1KP/IlvIlBgsdurd8AAXq
 Xtt7YerXGs6Qwt+FSIZVHQBta222vNxpwcrzv86Q=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 3/3] target/arm: allow writes to SCR_EL3.HXEn bit when
 FEAT_HCX is enabled
Date: Thu,  5 Jan 2023 23:12:51 +0100
Message-Id: <20230105221251.17896-4-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Jan 2023 17:45:55 -0500
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
X-TUID: AtoxTfVkVMPs

ARM trusted firmware, when built with FEAT_HCX support, sets SCR_EL3.HXEn bit
to allow EL2 to modify HCRX_EL2 register without trapping it in EL3. Qemu
uses a valid mask to clear unsupported SCR_EL3 bits when emulating SCR_EL3
write, and that mask doesn't include SCR_EL3.HXEn bit even if FEAT_HCX is
enabled and exposed to the guest. As a result EL3 writes of that bit are
ignored.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c4..962affdd52 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1844,6 +1844,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_sme, cpu)) {
             valid_mask |= SCR_ENTP2;
         }
+        if (cpu_isar_feature(aa64_hcx, cpu)) {
+            valid_mask |= SCR_HXEN;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
-- 
2.34.1

