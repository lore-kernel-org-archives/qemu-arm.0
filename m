Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE731098785
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:06:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZYT-0002su-8h; Fri, 20 Mar 2026 09:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYQ-0002pn-9B
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYM-0005zh-Hm
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-668d4751a3bso928180a12.2
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011973; x=1774616773; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvS6HtxG4jcfhqka/2gZ2nh+60WKvsSv+L1snlQc09w=;
 b=ter5r22GBdMLXy8XQ0dKPYhT/MNlTX8n3dvZzX2uQah1Ot1o7cUTh+2c5aTFlBCbxv
 tnTO9rKGVQ3QZD44wqZUIzQTqPPwe3LuXfId0ackrjilsYwzC3Tadmyf1JpTGpNZVU4+
 DLnDjTXsmBeffMGSgXqvDl5pPQLXiFHR47ckYC61w12UvHG863xtB90AlMhdMiAOl4TC
 fndIjKSvVQaLnPV4Djmosi9ZOIcAvcZQm4BGpgTNHIoJbpEdD/LUjvSigWhHvXrVesgO
 1G2hpr9az5vJiHGubKAGUCGIiRF7JUQx5cM+AJHq9sLnlrEBUJICbkP22xPFAAXSUWms
 HD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011973; x=1774616773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QvS6HtxG4jcfhqka/2gZ2nh+60WKvsSv+L1snlQc09w=;
 b=mg9OikCqipu06YhMIIk1bQjI3v+cqIp+Tr3yHAP/ki252b5PFN6mNXjt+vriDxyym7
 YeB8q6VvaDkggW/6e7LueEsqIA7xUSQHeutWU9TbKbto/i1oQtwewq7kGfTnJaOYN9pL
 iXyzq6xbgR1ffQFvJNwrfOAUW9iK7elKdBcoYcKs6BAt6XrRNTtY4FpmyqYuk0jTm4s+
 clL8Pzf6vnWha88wGw2xf1s8R4pm7IXTSjXpWkvUiBdu/ub3Ew3SHpTOHx2nLjSsi52g
 NyYCV7WyJoiGQJKvfVZ7eoFJJ1IXLms5u7Vvs2TA+iFnDEIZWKO4VzZB5Va00ACbeaSt
 fNWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3qcgvYr1lcrzmH6QV+G8A1da4y+gobaYeqcdWRhK7V+bT+uxhI+vtHW4XoS9qRTJIeWfCplQNNA==@nongnu.org
X-Gm-Message-State: AOJu0Yzfq+In+7OLhqMjWYPpz4hggRdnrw+lv3EQSnJDdMALa0nQ8BJV
 XHxJD7//kmgms756UmOygToCIN7I+rW6EkcVt2zq52bXd+GxfcyU03k+/zFWvxYk34c=
X-Gm-Gg: ATEYQzxvPYgYYHlgJS3+MwRWua62iUyMlQ4Qqxvr3akl6lQxMX8brrPeHdqVEkaJqZ5
 9pTldaWEmnq0eeiWNBJhO6mEoGu+xZwlIsDmLBrDV+ZYtG9Q9j7WSjdDYHGrqCdFA2PkZxb1OD4
 kZcnslWCSZkZIHeitSXqUeS5Oo2Z9GrCArIrNMuAKge4/Pq+KPy6JUjDjN6Ak+HrYcEvQtTa5nK
 LamlWEIhddnVXbiOHXmX1XHMaT6RFEsnVjQQScIODBP+zedisb8+QymPbF5KxtgHyKETa6PTl1s
 k3tSJ9t1OLSJWm6s5+ub0cUQ1KfhFJH+f5neAtXtbd7GuH7OOwYcFDJ8bI81+GAxPTldDUnIy8u
 21pgAQeDeqCWOgmsc5bPvakHFTvOyHAWddaEa/pNGzQpeJ5kJ82BLmKyPgI2G5qESNXSIOPmJnX
 iBwXmOvtytseyhxDQ2sYT5X70=
X-Received: by 2002:a17:907:c8a3:b0:b98:9da:4d94 with SMTP id
 a640c23a62f3a-b982f38bd3cmr181168366b.48.1774011971057; 
 Fri, 20 Mar 2026 06:06:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm165814966b.17.2026.03.20.06.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:06:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C7F415F91F;
 Fri, 20 Mar 2026 13:06:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 04/35] target/arm: migrate eret trap syndromes to
 registerfields
Date: Fri, 20 Mar 2026 13:05:35 +0000
Message-ID: <20260320130607.2071996-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

For simplicity keep the OP as a two bit field rather than the two
interlinked fields in the docs (ERET/ERETA).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 5b5a5cb182e..b145a52769f 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -367,12 +367,21 @@ static inline uint32_t syn_sve_access_trap(void)
 }
 
 /*
+ * ISS encoding for an exception from an ERET, ERETAA or ERETAB
+ * instructions.
+ *
  * eret_op is bits [1:0] of the ERET instruction, so:
  * 0 for ERET, 2 for ERETAA, 3 for ERETAB.
  */
+FIELD(ERET_ISS, OP, 0, 2)
+
 static inline uint32_t syn_erettrap(int eret_op)
 {
-    return (EC_ERETTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL | eret_op;
+    uint32_t res = syn_set_ec(0, EC_ERETTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, ERET_ISS, OP, eret_op);
+
+    return res;
 }
 
 static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
-- 
2.47.3


