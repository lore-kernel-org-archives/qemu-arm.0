Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2600193ejm;
        Sun, 23 Apr 2023 22:52:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZnHIwfeaW3lZg5nXiuFC9SDkvAGWVRX1fTlAQsEHX6pFbZQAediAwcKcjvGLUxfuVQdeX4
X-Received: by 2002:a05:622a:64a:b0:3e6:59c2:cbae with SMTP id a10-20020a05622a064a00b003e659c2cbaemr21610561qtb.34.1682315562191;
        Sun, 23 Apr 2023 22:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315562; cv=none;
        d=google.com; s=arc-20160816;
        b=gkyx9m1S3kBUhlFEHr5zMefX7q53VH5Yk8b/MWc5A9xcXBmrwZROJ2Ok6zDal9mVqE
         xcI11YDBxcGcZVmmv0ooigBkofxEQvOFN/eosRy4o9kx51QEpch36+s97olpORv37d8n
         LiQv9NrBbgcw9LY4oj3YlOuaHinuFA6h8lc8kloTXHoGXlcl5ccV2kPyJTLivN/vPqZb
         drVGxLEVXEtj6bGBjpAyTqF4oBoHzF8Sh5cc9oxQF9/p49P6iJx6VsLTvErEmbMUl6CM
         vDvMnYvesdmVZ2MwNEbb6OvaM9XZnKEfy9myt+qmrRWAh/wexKKXjkNIzwxxKb9OSY2y
         DY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
        b=BN2+mY1scogg35E66Z8mE+v0FcRj268hwMy6lAUNlB/6W9fVKm/VmBsrJ9bX7u9E/a
         08Uxu332ezUnJ9DAKJ9kQM8J9jQiIGFyQkK35DhGfrE8XT96t6PmF0e5NkozPtLLpc7+
         lgjR4gZF95HrQ5KG37yU2oQGgX059pyjGODv0T2JZjNBv+LgTokFgr5DJ9nktyfLbOkt
         XiiETOPV0Hzh5aDbY4CDgWG4nkFoxE3z1O0tNwpfQZQpr52e7igOD1/QNzuIs+UY13VZ
         KS7OFL5/6rCjnWSrSjqUDvwZagFxN2EqctUtiygPvldZTwKqSPtcxT6S/jeHF1OCs94w
         tNmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loIzhHVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t199-20020a37aad0000000b007468b186a1fsi6486570qke.86.2023.04.23.22.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loIzhHVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp52-00074e-8O; Mon, 24 Apr 2023 01:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0g-0006J7-Ot
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0I-0005MX-0g
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso2316500f8f.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315079; x=1684907079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=loIzhHVZ8cgAyCUje2Ol0tC5Qt51NjEgcT4ZD9Zb1mlwqhk0tOlMugfWrtEQagx2wY
 qlw1gWu0L20Oe1mD+X/Cu1PUaIJPx5hT0Nc3AYOxMWStRTDn0GmixILlCWyE1l4BnG2K
 JyFl6h3Zj/bPkuiXJq1fZdiMW166ZnvVkh4AvFu0uVQLQXFdvbjYk2qrJDJwj/DGh0nR
 ViyYKW+q5Srv1AqV36Eaz0AcUSfD1Q6ZyCNlpSYyVwELChJUh1YCJQcsLQBqmgS6EpAu
 j6HqXMqv0n+Dp9qbp2SDhNprGk1g7cfhJemzPLI/j4IhSTVqzmFoU5x96cYcbQbNE53X
 xnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315079; x=1684907079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=W0z70+oJ07+XqyYDoavqpijmPaB8y6qPyY8T3w1V2jIEm9qwJ3HScbuXkdzTPNBlbG
 z4GrtlwJPRnosCRgp54Jt3VITIFoTrt5RaamG+GHwJIEvTWwMs//x79eFaKwqUgY/3Ct
 nhg/we248XShydyB9mv5u64CG0MM5eRBT3LGQNzWHLrKGlW6L8jYQdKdVoeETsZX5oyF
 cQm9gfesLEeIAW2SoHKu0APRHPifsYLNJ20Zc2SJ/w/XSa7CoRbwvtq+7fqj3O8UGWUA
 SVk/DAkdniIx0znePd9MRb0oUdK2ixv3CvSrgj+FphBh065h4CJ2dhls+y0Xt84YPYEv
 SrkQ==
X-Gm-Message-State: AAQBX9coLINqgmXIb3pYXDze5TR5bly1o+URwTmHSMGeliYbjQIuOYko
 B3e1HNfKPGhnwuCkXSn8jfGK3A==
X-Received: by 2002:a5d:428e:0:b0:2f9:b08a:a3af with SMTP id
 k14-20020a5d428e000000b002f9b08aa3afmr7404891wrq.49.1682315079542; 
 Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 56/57] tcg/s390x: Use ALGFR in constructing softmmu host
 address
Date: Mon, 24 Apr 2023 06:41:04 +0100
Message-Id: <20230424054105.1579315-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GNQ5teyOjpb5

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dfcf4d9e34..dd13326670 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1853,10 +1854,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        h->base = TCG_REG_R3;
+        tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
+        h->base = TCG_REG_NONE;
+    } else {
+        h->base = addr_reg;
     }
     h->disp = 0;
 #else
-- 
2.34.1

