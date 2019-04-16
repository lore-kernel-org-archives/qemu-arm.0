Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3895408wrx;
        Tue, 16 Apr 2019 06:00:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfBBXV9MDW0I0Q5y2IGCtMAXx28up3sQ/K09RG+4uJimySL4j4YR/oOWDX3fGb/ROwBPMJ
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr25272076wmt.33.1555419630329;
        Tue, 16 Apr 2019 06:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419630; cv=none;
        d=google.com; s=arc-20160816;
        b=rzqFasTUSYlgLFznuvdiidNzEtxGMny+mqH64kyURpr6lVTkjmrywW2WLXziTgaToA
         /ZtHsIgWzCgUAWSB/3VSEJ8AvxCfFMbbJNDeq1zyuD8VXREyuyjo2nDalEQWipDDd5FL
         DyIdm2Tfzu8Q+3DivpZU7cj4AsaMEADNDyRaCnK3LWyMqWYxlcdJNjxphMQez9nU1SGn
         9Lmd7F4jv+lPaZjAUoVgaHgom1q+kRCH6CrwauTsMsK5GbYrP3139c3JnW6c5ofPSEGj
         /u69cx6Vl2QvUkpZ7rTLlvFC+j22tt749mqbzNXh5oplXtDBQAwsdKNnUPihUJghVrfG
         dqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kMVdzvD/XiERD9we9lBIjwqedh398KDiYXQYlDS231U=;
        b=gamYtj0eE4FFCNAx1nWw546+QSNrDJLDdlbYENvb25Ruo/C9uG5EsN13ADJNjGV9js
         /w3WSxuG8hL2y/BWyBSEkXNAjP2DPOMrxifow0U4srXW5cIYqMeAScjS5qBD9eDeY/eb
         Ajt+DQGiZI3r8c80b+mTJNJYLipgMUIAjvJXNpjaNNuN/qIiliOAxB6o5lyxsDRdjFrp
         aB9d95l9927dUR+D8K0OsqnGQaWEZ3TT56mv9lNgruqd5fwA78oo6eLs0PbU57ufxD+O
         YiBaxSr2cw1gIjU7WcCaM/rhjRvi1jT9bJiwtukz5Ikjwg3BGEGmASSjqOtyDn+axKv0
         1JfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XwUfkKGk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si8821363wra.359.2019.04.16.06.00.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:00:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XwUfkKGk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNhN-0006YW-AO
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:00:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf7-0004bO-Ft
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf6-0001B2-E4
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:09 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNf3-00016e-19
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:06 -0400
Received: by mail-wm1-x341.google.com with SMTP id 4so25257403wmf.1
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kMVdzvD/XiERD9we9lBIjwqedh398KDiYXQYlDS231U=;
	b=XwUfkKGkrXVJMk+vO1201fkwjDMcyWw5SXhBM5FV06Y5VvZluX5LaJ+gsW1nymTKsi
	lrxrIO1Fv3fP3ffGmubHBc4DlOabh6Y6Z/+jft6eEedpdVYMGxkhINvXTV7WIDpa434Z
	cXmoFArG9pBeT1uG3W3GONGvaZg0zyB7uotL3dWv+6hYYjIZzK/9fs9ny0lyYY5+cGY0
	n36DACKlJ8GPRIzlekJk/wV6xJDV1v1TgX3h/QSp068JBx5D55V+2COWoXr4Y14oHoui
	GCwhHrkRXF0vaM+X9Oqa+pUY1Rkvq1C49AXo/pyVfrwjkXmHJWKwC0bRMAYzhNjSUWce
	uxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kMVdzvD/XiERD9we9lBIjwqedh398KDiYXQYlDS231U=;
	b=cPOGionNtlh26YpFZZuNFD2cCm7Uyr7n2iD050ZAMKA+W0i9BdlcgnQCC9X96ZAYXX
	4F3M+4oc+kRSFQzl/Dh/VMlgd2kmlnmCAIwhAKYVC7sdLyU1yLOE0ba5RrLfCkWAIyE6
	1xJgyDE/s210898mDwdGxFHaR7GAQzsQfmL1RgCaMQHgE5Q9u0W8RWMFGV9TWEsrRQBJ
	A+BvjGnlnwssaGEMWI1QtTF6vYG0TBlGILMlpnNWd6XlOmz0A/tzIJBEFhQ6W4kWY+KK
	CEwMpa1pj41RK3tPsOjLzrUd0v0TuNnbrM2uKZf4k83f0nvR/KAmq2I0Kg3T1v56zNNr
	nJog==
X-Gm-Message-State: APjAAAXYLI3TJgUPkIvJCkn3iXj+tzzqPoeZ6t39WZJsoquIZXqXoUoI
	VRUEY0oIf3ewvJ5xMGT3+iycYL6ZBpU=
X-Received: by 2002:a7b:c92f:: with SMTP id h15mr26435726wml.115.1555419480496;
	Tue, 16 Apr 2019 05:58:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.57.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:57:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:25 +0100
Message-Id: <20190416125744.27770-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 07/26] target/arm: Clear CONTROL_S.SFPA in SG
 insn if FPU present
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6QlLZ/BxHpV0

If the floating point extension is present, then the SG instruction
must clear the CONTROL_S.SFPA bit. Implement this.

(On a no-FPU system the bit will always be zero, so we don't need
to make the clearing of the bit conditional on ARM_FEATURE_VFP.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 27e5f98bc73..b4f1609a1c6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8809,6 +8809,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
     qemu_log_mask(CPU_LOG_INT, "...really an SG instruction at 0x%08" PRIx32
                   ", executing it\n", env->regs[15]);
     env->regs[14] &= ~1;
+    env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
     switch_v7m_security_state(env, true);
     xpsr_write(env, 0, XPSR_IT);
     env->regs[15] += 4;
-- 
2.20.1

