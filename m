Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650750ejb;
        Fri, 7 Apr 2023 19:50:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350asoBWAjlNUfw9DCHmmoOtqeW7cF3XKK2WoUwAxDnS1zGmoEyxRDycL3WUBo8WlPdIuHI3h
X-Received: by 2002:a05:622a:612:b0:3e4:e4fe:ac7 with SMTP id z18-20020a05622a061200b003e4e4fe0ac7mr995886qta.43.1680922214970;
        Fri, 07 Apr 2023 19:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922214; cv=none;
        d=google.com; s=arc-20160816;
        b=WutpCyhd4cd0JHs6mygRutuwCbiyrifphUmElS27WJv/LbHuWbubzp2S6Yo+ldQki3
         JLucB84KYwLkJwAYPoABSwBGsukSlf3syJFmiJlPAhz5ZtEnnhs5nx8v6t2GBIDO7E5B
         7cvANzI/uSo0tb06uheuNAZcKnnW7CXYl41GJ/LADiKQ6pzL8BcJEU2WeQMpMt4pkuUM
         0wYxSUSPhdfQu4HbaLZVkws27xBJtUwP2MhErMOu2dGi3KMj+xWGGhW80SU+LlEASvHy
         VCrshMeBcptK+Yw+oEcEqxZ1XhMun0Ideuod8UojwzW3gaI4ilfe1Vp+wYfhRAGbOIEB
         1aPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
        b=JccoRj3LlevJEearEPZt2unx6V1nD0iCfNF4o24fZ3SEQmmLpDaYtfEyePZ/mKiicd
         7ffphbfkniKk5ik1bupPVGzhGFui9cfpRy+9qpQFpEt7Ca/CsFy46g4xv2FaeamHFjNF
         0BPF/rhEX1+B1wH8rdrPTVsLsYJKTDRVYnH7R26kqId+KRA+RUzsGwUHwTqmvgUEe1hz
         Ktn3TtON/3jmt7adyYwaB+UZAtNAuzbE+fn0IG4mEHQKDPyIQs4Vx1Ghe4q48o+9CBZA
         qoYKWG21lDGKXsWgRp2mnqf4H4tN72XJuX48fSa9ct8udKJm601h5Ke7pC98Nao32F3F
         LKHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GZnDTfw+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020ac85a93000000b003e210050c47si3846234qtc.66.2023.04.07.19.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GZnDTfw+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYa-0007j4-Rx; Fri, 07 Apr 2023 22:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYY-0007fC-F9
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYA-0005hn-Uh
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:58 -0400
Received: by mail-pj1-x102b.google.com with SMTP id go23so3074404pjb.4
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=GZnDTfw+ocGP8T9EweD/v0n75UlL02443JTIUxqAwOyd/QnRde6jlMnlyjuYQJUQC/
 /jVp2HVxTV5uMmdf7qylbwGdZnHw2cPzp+YQi4pEUffws+ZvuRdfojhMLr326JhQ6yjX
 aCcaiejN9peWdMpeK3EXS/8pbslh+nxL6drKWL96qUpoS7xBR2inqGo9fnXy7E6fTgXV
 n/T3WoT+jhTPJPB0aOh/WKTKFZcB/IlJur9+7BjcfirVvbqQ592yefPM6pZjG1kxxD8Z
 oSqCnKq15X2iQiDoGvajZTZ2GWLKeoP3qJtLe81lUrvnaelV+sb5u0Mb6TlaG88EpcBF
 qCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=CXpHiuDR5qhUSd1K3NZSdqZldRg2I6Leo0AuBrlJMOTCWDW7x/XEcEdZ4oLEswizKD
 xNJ0YywtPQqfRvkeKoGI5+vLNRCF4tHQaC3wdeNVfBDfTjccVOPA32/o3/yV99QpKoxq
 6BC0PrNinMHxJxhQZ04kEgO9TzcZ1mOoO2Q7kpkkPuXAmKSxIPW/a+g1ETqzs1ZY/j0t
 POgn0xXiB7cAchQLxtItJKcfZQucXgH5jrli78T20YKLj8bEGhfQqiKO1XLcLgSs9ghK
 BeJIVfnnL1YqRw3wI/sEJ+NpNx/Pa+/LEbM4F2Nq8HnURmucmUi3hszJh+qAUL7964no
 8fjQ==
X-Gm-Message-State: AAQBX9dBz8q70S+QIRy8FREfofyOIkKLPWOARKNYfrn7FNF7AA3LIARB
 EmgLm1CdNPEnQ9VeL7w3oDTBhQ==
X-Received: by 2002:a17:902:d093:b0:1a5:1e67:2500 with SMTP id
 v19-20020a170902d09300b001a51e672500mr511896plv.29.1680921813479; 
 Fri, 07 Apr 2023 19:43:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 19/42] tcg: Clear TCGLabelQemuLdst on allocation
Date: Fri,  7 Apr 2023 19:42:51 -0700
Message-Id: <20230408024314.3357414-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: CBUqpnxQD3hD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-ldst.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 6c6848d034..403cbb0f06 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -72,6 +72,7 @@ static inline TCGLabelQemuLdst *new_ldst_label(TCGContext *s)
 {
     TCGLabelQemuLdst *l = tcg_malloc(sizeof(*l));
 
+    memset(l, 0, sizeof(*l));
     QSIMPLEQ_INSERT_TAIL(&s->ldst_labels, l, next);
 
     return l;
-- 
2.34.1

