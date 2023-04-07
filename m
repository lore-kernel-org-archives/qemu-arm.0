Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480325ejb;
        Fri, 7 Apr 2023 11:52:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350bYTdOfKUR1qwKErns3QkKQRKoI32yXgTVc+MVBFIOGX/jr0U/QonHFtGs1beZWPYzdMP1B
X-Received: by 2002:ac8:7d50:0:b0:3e6:5653:eb3 with SMTP id h16-20020ac87d50000000b003e656530eb3mr5157566qtb.60.1680893544936;
        Fri, 07 Apr 2023 11:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680893544; cv=none;
        d=google.com; s=arc-20160816;
        b=yq+iNCG9rBEwZUIE3Z/wLfG5HpLNmF5SUAxHwNfYY1SXIb6ZjZmInKb1fe09Zb29JP
         cA+LdhqT6ICNnfncpCi6rabAwoSW9/2CGyQXCu+zJMkXphbgZByDdgtjn7jg4UVsAndC
         sMUDBPs6WlZtYuCaLjYNZBNaSBZJHHVWCaocMeEfek3YWyPb/iZ0Zd+NJDEn0n4SfF1t
         Vj67I2sCWWExMUXVUYDL2o6fBVytlZG4QwJ6VQcF2rgurzmXiF5uJDSJ49Nv+a0kcHvx
         GnN7kTZSB1iNDFxA2CY6HjWxlZHSfRp4aZoih4chS4aQI5oC+Z/b/BLBM6ArwxZEMsUV
         qi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zTH6CuxWrs3z8O8UOxqSLGt5vbpCwQ7b4HezyRm7T4A=;
        b=r+x4GAzSGbAnfeAxuhU3IFvRttFQNys3qG4A6aHA7vqLSFirFdISDlopwefyvaTMNN
         NqdPCwrNhZU8YUBbKkJPclo4iDHP04TuER9SUad4gSP4zAIQnUa2G1wPLF2lWRcQX3qR
         TkcxcQZlfYd8H18r+GEcaGE1j60y0D5snvuc6bk1yBjeG8piKivGhNTsIGxy+HNYa9Qs
         JtJ8OqU96hOGl5jmLMfPJTCGAxUIOAIj+Z7XboRJ98FvxKAEozGxJVb8VPoJg5/8oIy6
         gAoouQOzDAC6EzhgQ2O9+FRkA2+u68mrCfsCHqVDigN12PBYTmidWeG9YmIkTQYB8MX7
         KS7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITvzG9Z+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j62-20020a37b941000000b007465ee094b1si3206709qkf.30.2023.04.07.11.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 11:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITvzG9Z+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkrBn-00054G-TH; Fri, 07 Apr 2023 14:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBl-00052w-Gt
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 14:51:57 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBh-00087c-IL
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 14:51:57 -0400
Received: by mail-pl1-x634.google.com with SMTP id c18so40655470ple.11
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 11:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680893512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTH6CuxWrs3z8O8UOxqSLGt5vbpCwQ7b4HezyRm7T4A=;
 b=ITvzG9Z+LfxLtCWv+7OYOSLDXxlkY8q+kL4+VK9C+PMjZOajRxHU4m69Y/93/zgTup
 826AdLSBxO0ooW5RbEJipPGx+st8cOZEHSRuaWJirNUxt5yDWS279QDUvou1WwQsIQaC
 3fOg6ijoh06WxWF3BA2ohVHCPa1uiGhYEbSFKMlXcoqOzHaybMjQvtfHPSF673l2QUeY
 F8ZKrPG+GfbXvJfs+qCNtacBI/NRgPZogRzHv9rQq3Q9wekgeQoSrCny6GRA+RY033Ox
 CLyzS0IxHtaMwNL/nyKPnYCth8fzoJY15Atm0eZM/FUj53PdKqpyFIwmuveQeg59CdSx
 Gl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680893512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTH6CuxWrs3z8O8UOxqSLGt5vbpCwQ7b4HezyRm7T4A=;
 b=mwch+PBfq4do/f6U0n6A9NKVZjfvRsz+vFkALUorKSgblPpo5EobcRKR5Vs5rXkaqF
 EetzRw/wvW69ZwH+Ah5HQbdb9SeHkv0Ph6GxFoyUqcY+zyOcDVMzAy6g9GQQn7tsQMRT
 XuJ/sntlXfceyZDtQWVpdQdAF+hHL8JOlGLY7bbv5fX4yajWUVRHxLzMULmqRPSfJHnG
 knq2gaB2mu4LfUO0xk+2rbGibXaygAN1ujZXem1G9kP1MH3HnqGMXqutHQ4S/NfgYhFd
 efUpTFn52pNOCSOwzqUbJr3CpL/Qx3Mo7pk6v637wGqrQyNEzAWtAtuMMnbtsJ1MdsNH
 Wt4A==
X-Gm-Message-State: AAQBX9csZGf7TEtaWBxDMC/IANUkwu6PaTV1XZ2ccD3m2oB55H9Ajuo7
 Lms7KHwNHOt97fx9qFRivzO71d3sPsSeEx7Z2Lg=
X-Received: by 2002:a17:90b:1802:b0:23f:9d83:ad76 with SMTP id
 lw2-20020a17090b180200b0023f9d83ad76mr3342835pjb.23.1680893511990; 
 Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a1709028d8400b0019c13d032d8sm3205796plo.253.2023.04.07.11.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Copy guarded bit in combine_cacheattrs
Date: Fri,  7 Apr 2023 11:51:49 -0700
Message-Id: <20230407185149.3253946-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407185149.3253946-1-richard.henderson@linaro.org>
References: <20230407185149.3253946-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: A2SwtOesoDHB

The guarded bit comes from the stage1 walk.

Fixes: Coverity CID 1507929
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 58a6de09bc..6d72950a79 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2576,6 +2576,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
 
     assert(!s1.is_s2_format);
     ret.is_s2_format = false;
+    ret.guarded = s1.guarded;
 
     if (s1.attrs == 0xf0) {
         tagged = true;
-- 
2.34.1

