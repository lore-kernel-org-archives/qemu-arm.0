Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1438E6FE51
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Dec 2025 22:28:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYAqa-0005Zf-Fp; Tue, 23 Dec 2025 17:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vYAqZ-0005ZB-8u
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:27:15 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vYAqX-0007OJ-SJ
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:27:15 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-34c84dc332cso4629649a91.0
 for <qemu-arm@nongnu.org>; Tue, 23 Dec 2025 14:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766528832; x=1767133632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwRSR0ZKIOyzQJTFyNymlZJZGKDFvR8rJCkk+W5rX+c=;
 b=MxnvKsyQauqR+iWnkGMmoNtYi032jUKgkhAvNvIaq0L1ymf5CiUqCgxVTSLxalQl8T
 0P41vl6NYH7KMbCKqKYn1IdWiQwRxC0ZlPBh7zYOE+lcm/zR1rqw1n/P+eRi3Kk5DjU4
 dZU0TX9ztKutVU25XnKf75bzd6wzE08l2oin1OAip2Wk7KOCAIZ1jvmyuMnlz7ETuEEh
 kZrPCZ02Q7Rd2gqowIddeF9UGa7F19skr17l6wSI18hVCbMZ8O2MTOyFl4LSqOXuuYPE
 ErCqv0jwDt/YNH8XjgyGJ+hhLtEGDWMbdOeyZh2qbWilJBpx111kPnsw1oVdk2EwQ0Ow
 WMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528832; x=1767133632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IwRSR0ZKIOyzQJTFyNymlZJZGKDFvR8rJCkk+W5rX+c=;
 b=fYu7ITSr4cQtf1Ur8TP8EhWFaOqKc4TIS6zIx5PoSEN55rAkk9dqstM5xFMPDcsRxP
 TK91aDdrt5wsMQAE0O8CqDpjcslnQ5XJbc9cbHY6S8zZt03qpsxkY+cwOO/Vxg2ev1hn
 IXJ0eyL1538BywyDYgLePfksZby3Pq8Mq8hTfw17iGHepHpHIKbhqLpchrACnuimmrmj
 DNNHt6PnSI6gwgSMApjq1RrcueglmbCcFQW5GfRokj5xtQBS0/4pBMaAQJmUpwRuAWUX
 KvEeKn7RMVTJF8NlbGRT7RCxlJLPapncomUG4OBAtzO2NTcBn6EwwLJsJi6foQrrPuhb
 6RJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvj4UR5jn5osJ6YIpHDTrSxJDu1OHZ5FfXg58oUtyXyjboLpJSU/sxvQVOo4RCwLWelP046yUXIw==@nongnu.org
X-Gm-Message-State: AOJu0YzNupIakSvDvtvzKrwnFLY0ei+yQgijQMYFRfkGG7WVjLW1HpfU
 Qwgq8uTr7BEGRPDQr7q+QIrizDSvOBuZTZV6coDJNr5k4Z2PqG26AlASla9b6L+3V+I=
X-Gm-Gg: AY/fxX47odjAqUoEDvtCQblK9MAXF/YKe6OkB52rcJJhbF3WsP/kkUVCKfZJgrtMKUt
 xFQ0bo1Q14/WT9qUIxxf8Dz7/SIdpzxidF0Hd5Myvv+l9c83xGnDDVze+iyvZhT4Jske6885Svw
 NrEKnZwsgr09Luyu3DZCI1KbWrWZWFn7vtF+PGen14PgMjlfuqPLyesjbivYpa2UeSszccFxhyD
 IA89TVk1VydtXXkjuc+1jHm3sbDW8GIWd7dkosiwi7VIy5mjjknDKcM9PhXz80XsCjex/tg5rbl
 kDQ7Gbq4iRqboxSMVU6UQtdGOLoRKhirdPdRQMlhxlVKCNWWAPJr0s0EQvouxmMcGCYpSEXS3gu
 4Qc9F4jq/luAFDAJzV0swpgAn7n8X2RffW0n4btgzRLudoARAXu976OltzTkRvTRZAmDCwmMh94
 BhMNNu5U65B4ZPrbaYsTNRLKr5y9U=
X-Google-Smtp-Source: AGHT+IEO3lREqjy9+6Sn4w54oXKPFg3D7NA3MwlquGvj/YDBBtmHGmNjCGxSBI+6U73zaB4/h7cXtw==
X-Received: by 2002:a05:7022:799:b0:119:e56b:957e with SMTP id
 a92af1059eb24-121722ac244mr22058709c88.3.1766528832235; 
 Tue, 23 Dec 2025 14:27:12 -0800 (PST)
Received: from gromero0.. ([179.93.129.179]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217243bbe3sm62803123c88.0.2025.12.23.14.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:27:12 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 3/4] target/arm: Add a _MAX sentinel to ARMASIdx enum
Date: Tue, 23 Dec 2025 19:26:48 -0300
Message-Id: <20251223222649.187935-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223222649.187935-1-gustavo.romero@linaro.org>
References: <20251223222649.187935-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add a sentinel to the ARMASIdx enum so it can be used when the total
number of address spaces is required.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39f2b2e54d..718d140712 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2336,6 +2336,8 @@ typedef enum ARMASIdx {
     ARMASIdx_S = 1,
     ARMASIdx_TagNS = 2,
     ARMASIdx_TagS = 3,
+    ARMASIdx_MAX = ARMASIdx_TagS
+#define ARMASIdx_COUNT (ARMASIdx_MAX + 1)
 } ARMASIdx;
 
 static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
-- 
2.34.1


