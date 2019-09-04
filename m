Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1145025wrp;
        Wed, 4 Sep 2019 13:07:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyiT5j4+gJiFf/cXmxmVn0REqhT4ESAgNVgvA7MOk4qd6cxvGasz4gHeQJifpdco6JUD/uD
X-Received: by 2002:a17:906:a416:: with SMTP id l22mr29875494ejz.302.1567627626394;
        Wed, 04 Sep 2019 13:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627626; cv=none;
        d=google.com; s=arc-20160816;
        b=EY9IzTHOAAV8eA+X2N6IEwU+ucj5t2UluUG1dVmreVVHAEwqB4PFu6SIGQn1E4NRlO
         DPYTPUd+51rw3cjGgFIXvsXsZYmxBivBuumMRZxChfExpxd6dbFyKaO0F+YOvvWxN0mT
         m+RHbr7NF40bKxmejOMtdYTWwN1M8GuVL8DOmowmHdWZ0vzPZo1GwG44X/fZ4KVb9ivL
         R6NCvrzPnMLwKuLsJ1TEd5YekFUyQ6zT2/pvKcDIQVDCEvQXFlTa1HdOLrFwlX1OGERj
         +UN2F7QCV0HNGbNvgE0MfSrr+JxIlIYXhwdr1byeRgC/ayXNJ6w2fvH+T6FwcZtbX5Iy
         T0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=jCLx5wbUWyoQFBTJtKxHJZzHzglyCub6PkVD7Xy998w=;
        b=tHrsmZWmyskhBdAtJQGYMPMyKsUp3uzi/g6yji8oaH4aaij/oOsWFiltVBG83psKwZ
         5H1G72/wAlEYTg5BCcvFsMUtAfvwgMCzPJpekxEoZadHaoHabnhwpxYobxjByjQSgppY
         a9G9FxjLwdD4rxIF/iS292FjRRquX7JHW0Yvz7/z0b83SV7MhVeMG/sbkYhHWXZIm3n1
         RBr9hE5hTNZLMNis7T4Lc9dkcc6b6W1IY155xWkmW3DGDjbaf9e97h3JGGeVOzs7lytt
         Kc5vp7I9BQiBlnlhk7Ll9uUniJ+tli+Vq0aSf65MRRzcb7gR1Z0jtzMZlOo4KpVf6Pkj
         YYEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XXT+tIT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id of22si51147ejb.113.2019.09.04.13.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XXT+tIT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bYW-00019h-Qo
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0N-0004z7-RW
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0L-0002eb-EU
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:47 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41337)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0L-0002dY-46
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id b13so7276445pfo.8
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jCLx5wbUWyoQFBTJtKxHJZzHzglyCub6PkVD7Xy998w=;
 b=XXT+tIT+OLPZofonDRatHFWp9c7dSQdPlo3AJsyJSzP5Kl/f/7+p8eHm/rSBpy4mZ5
 DNAsUCgfcE8B0vhr3//i+Jp6rvUIvNX1h7lo/X5TGHcS67MYWNIH/Z+rz6vWC6fGdaqA
 H49fHr+ExAH+fmPuwiP8NwsTjNGeHb6qwGzKrp16TEzpbdVcCMId/m5gF6FDi54VmGSD
 pbbaUUiMNdK2ZJC/3fY8Ew5yMnKhEe/2kCIdVJc6BT8zmkjVXzVUUqaXy2Bk3sARuJxq
 tmHssq9btZMFfYq6wXGfwOHeg6gsyr0/t7GzO7XhyRtRBjZ2nbenmrwscxx16ojAy7UI
 mlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jCLx5wbUWyoQFBTJtKxHJZzHzglyCub6PkVD7Xy998w=;
 b=qT+VvJh7qAvAcyW6uP4wn1mdXwSih35Kygyqq/858TEgsly0cRa8kwYLkgpGkO38AW
 0lrsO3sUNCFv0I5SzbcVBUVz8RBTxRrkwhry9CtV9DBlEM8HRA/tKGUeA+uwZblpyMUP
 oCMyf63QhmifB00SEPq7+du719jZfyIvLtWnX+V4wiFpOSZlajcW1OoqQelZjcBc/PBb
 v5NBZk8wpOd5hxJjB/+5XDyRoOfkhZnlCQFUvEkM6x4zD55JvEvf7bfEA8bBQpjVSE3+
 Psk450oUsly+v8NOM7gfpbkCgjEZSN9CHgZsFBZJawAu6GdsMHMq7dHVJQJy5sQ0TOtl
 S3cg==
X-Gm-Message-State: APjAAAVinxgj6xSnFq/LSlADJWX2ftuMGWnfOC/KzvYKObQIM/yqgRoo
 icPGdR+ruLGkah/RBcGfDGNOnQ==
X-Received: by 2002:a62:d143:: with SMTP id t3mr44321762pfl.213.1567625504065; 
 Wed, 04 Sep 2019 12:31:44 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:23 -0700
Message-Id: <20190904193059.26202-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::436
Subject: [Qemu-arm] [PATCH v4 33/69] target/arm: Convert SVC
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
X-TUID: rpYI66kG7AJR

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 19 +++++++++++++------
 target/arm/a32.decode  |  4 ++++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 72e4708e61..208021181f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10081,6 +10081,18 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+/*
+ * Supervisor call
+ */
+
+static bool trans_SVC(DisasContext *s, arg_SVC *a)
+{
+    gen_set_pc_im(s, s->base.pc_next);
+    s->svc_imm = a->imm;
+    s->base.is_jmp = DISAS_SWI;
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10348,6 +10360,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         case 0x09:
         case 0xa:
         case 0xb:
+        case 0xf:
             /* All done in decodetree.  Reach here for illegal ops.  */
             goto illegal_op;
         case 0xc:
@@ -10363,12 +10376,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             break;
-        case 0xf:
-            /* swi */
-            gen_set_pc_im(s, s->base.pc_next);
-            s->svc_imm = extract32(insn, 0, 24);
-            s->base.is_jmp = DISAS_SWI;
-            break;
         default:
         illegal_op:
             unallocated_encoding(s);
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 62c6f8562e..0bd952c069 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -528,3 +528,7 @@ LDM_a32          ---- 100 b:1 i:1 u:1 w:1 1 rn:4 list:16   &ldst_block
 
 B                .... 1010 ........................           @branch
 BL               .... 1011 ........................           @branch
+
+# Supervisor call
+
+SVC              ---- 1111 imm:24                             &i
-- 
2.17.1

