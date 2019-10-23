Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1058216wrq;
        Wed, 23 Oct 2019 08:43:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3v1f4yduMMLZS+VyxJmj2hNOhLU8DkL8Rei8/11cZMO1853x4XcoBx9myx5KOGuoOBjLr
X-Received: by 2002:a0c:f852:: with SMTP id g18mr7280090qvo.169.1571845390995;
        Wed, 23 Oct 2019 08:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571845390; cv=none;
        d=google.com; s=arc-20160816;
        b=XEVlD4irJdr7PmE1SO6rQbCQ6jTJevsF//LQnSD5U6n7h/gZRh7137qhnO+ilBfg+9
         b4IjUujNKF07xMNDhgriaTMAgTDrW7DCKxf8xbjdHHZaOGjEIT1BQwIIKhV1lU1zaj6e
         2+Nv5SPS4hO82E/H8UiMT/BOy7yf3jmxF+f76zcQgK8PCsEbDrCU+z50SH/u0g1hh9R3
         NPDSE7XBlheyxYT2mp9XOQNxPMDONlZuZ1qi2B1snMKDerEJVm1CdwN15xj1GzTzN/qi
         3yNNaA7f3jALBRpnA9F2sDcs1K54fe2MZuM8ixcc94TxfS4XuEW5/qNNiYPJwjQlTYWT
         94pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
        b=wvAUSljnjbWLV/qQgVchNIxN8DdnbsRe7bUVho/DuaXQ3UX+o6lk770xuQAuM0vxjM
         pT2LQgBowkTEbKtNOX30lpOLHOtJdDvcqjYyi3khRXWutooPz1cHX8PuHElriaMPfjzU
         fyhMKfOamFQtNcyv5XmAwgVInngpXtUTi9wopjLBwhIOWBLUy7W5b/8umt5mRVw7eYfK
         wslyeVLm99TH55M8s9ssk2H5YO67zx0fZDIFa/7vQeLGKsrHky+Gxcf97goHtbfoVFii
         IlpEkCvFBKl9RmkXQ4AjXqzb68cWmAp/AyKqnbN3pgOSxsaaWLZpLf04Kuw0mjH9YgHF
         nUNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JBY+uoi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w128si19060147qkc.99.2019.10.23.08.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JBY+uoi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNImz-0002Np-Ne
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8t-00088e-Mr
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001FF-A9
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:43 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:32790)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8q-00019A-W8
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: by mail-qk1-x743.google.com with SMTP id 71so16169421qkl.0
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
 b=JBY+uoi/+fsxKtaVdEUfo1r3jJJ5rjOraTo2FNLPBuEm++0n3Useh7V3OBM7lNWtVl
 BwFFrYx2/65n8V4wsrimWFSkDg9Rx0yhIz1U7FMqv10Faud1dPXihm+aY02nZEUx0li7
 YLYjtbsHzXvhKxikF+MJnDRIz888rOYaPOaAgFn+afBbHBEtzY+hORHnaIT/IeXFuE9Q
 WYVHfnlckqHzjRAJ948RWqES6iMm5PEUob0LAYQukgTP8flk3E1bZPMTquIaSSWBQb5+
 p2JZStIJfYpkIaR39moIqnwOQO0Ve9CJUuLvdN0p5Et8aCCFiixR0g21GcXhIveVA3EP
 3VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
 b=MnQXFqUw3V2b0Vib8Dnx4dgm/fkX+m+epcLfciM1dcsWD6SH4kpng24tKBwCDHM1Mt
 mG0hHuQltPpr+4qHE8LIksabJqLtJDRk6Z/lcx2QX2JFrMuMbBLfYrhM4x2gFPsuusJ4
 SsrvgH4xaiHYZHzfdXrfcQSNAGLNUtxGh5j/s1fBmxFgJ+IqZ5KievuCQn9OrJG9L8Qt
 vAVKnXI0lrSLaoyBrqdpLYONkqU9TdKTAgiNEli2nhw46DfpC7y6MYr4NRYbwD3roh4P
 /IuXXZcVD5AwEikYKToF5XOxHOHuyN1dcWiFfo35q5GNgoe0NdK2dmz4R5GivCoj61N+
 oVOg==
X-Gm-Message-State: APjAAAVe3BHPZiDOwfNIZzh1ITWBD/tiWZnmqmI1ADBvSxCc8zfC2n7Q
 xytcEv0126bFuloLMqH4FJ5YdQ==
X-Received: by 2002:a05:620a:20d2:: with SMTP id
 f18mr8909266qka.474.1571842886526; 
 Wed, 23 Oct 2019 08:01:26 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 18/24] target/arm: Rebuild hflags at CPSR writes
Date: Wed, 23 Oct 2019 11:00:51 -0400
Message-Id: <20191023150057.25731-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0JcmrO2miXv1

Continue setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/op_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index ccc2cecb46..b529d6c1bf 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
 void HELPER(setend)(CPUARMState *env)
 {
     env->uncached_cpsr ^= CPSR_E;
+    arm_rebuild_hflags(env);
 }
 
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
@@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
 void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     cpsr_write(env, val, mask, CPSRWriteByInstr);
+    /* TODO: Not all cpsr bits are relevant to hflags.  */
+    arm_rebuild_hflags(env);
 }
 
 /* Write the CPSR for a 32-bit exception return */
-- 
2.17.1

