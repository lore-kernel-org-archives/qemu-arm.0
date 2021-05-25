Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4905016lfm;
        Tue, 25 May 2021 15:58:22 -0700 (PDT)
X-Received: by 2002:a17:902:b70f:b029:f4:5445:cd9f with SMTP id d15-20020a170902b70fb02900f45445cd9fmr33189791pls.32.1621983502151;
        Tue, 25 May 2021 15:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621983502; cv=none;
        d=google.com; s=arc-20160816;
        b=WpM8Rwd1xXx5/V+DmmSUqkseq4nmSM3fwszHmjHtqoLz4vaqXmyJxwBi1+/vo5b3wb
         eztcCQJCRYgi6v21QkQzzQZu5DNRuqyF17kbqq6k7rOsnyeNP7fd6SwgzNWiIvHTs4aa
         E5XPF98iM4xBcjZX+G70h7S11+oBafhTGPI3QZya5ZC7I50cCQNR0eKlYeBl66RBKDdf
         FxUtzgw7OO5XtoW5LQOkenxPpeVH1L/6U+Pr6CL3zRZ2UmGd7NJAPFAtO4wdS2po3EJZ
         tEvJgQ/wHqumSzhlE8TBQ+dTgHJhYVviqTVVevMNTMD5R3rddjKc2twd1+Btt1f776q7
         fmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=inUd/h721Ne/1vYYmFZwK9UzqSXV6+upNZJZePrYay4=;
        b=TY+43Ha54lyBuxH7YhNbTLIt7RqeEUib6tjPF+GXBNCSJuX/Hl/aSbksSxJksvUZjg
         Tl4glw2+qNq3sO3bTIdUKTOtKfrrmGy9zxePhlV6LCsLxNrN5xM1wBjVKXvjhcdg3uM8
         yAZBlKA7Acb0cZmsmF97JvBff+T4HccUV++gDUZDvysI4zLlFLI77VPvKly8wpeO52tH
         V8LEbYSwXTyrmdve5bLwWA2gdbwYRJnRPfBwSL4YJSFsGQVo3kDLdjRrN5UM84G2oFYy
         V02GPOM8OzagjEo6SueYy+UD1dZWn4AlJxJU37l2rZGTUtosHUn120PoDMzZ4CcB//h2
         h7Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kL1vkKxm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q16sor9254131pfc.17.2021.05.25.15.58.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 25 May 2021 15:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kL1vkKxm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=inUd/h721Ne/1vYYmFZwK9UzqSXV6+upNZJZePrYay4=;
        b=kL1vkKxmskvj6qxDLY8hIJ4NVkoE5oaGfjbkYvLOufs7Thtk8meRcnifD9J0Iwcc8w
         nrhL8OPEnLrHYW4JXj12TaKF3LQlCpDFjpk19HbleG6cyx3WwZTCc/0BgsDaK8zpW9rW
         FqWenm6jLPDerA8czIVjTk94szmN8pi6ZjDNPrrT5UlGtn1Yw0Jqvjkh7Hz2C9sewiSL
         1l1osvFEQ9+FS4vx2fYxJzw7QZ0ItEp7E6xj+SH3LmdfyuWd5+AFzikss1q1Vff30438
         pcGS9UNtU0uxv+EKt26dHLojff+8z78fVybOp0pm3YJETUxAIRiRcc/a5SMgc9ww1RxA
         Tw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=inUd/h721Ne/1vYYmFZwK9UzqSXV6+upNZJZePrYay4=;
        b=pwKxWXU+AoMUQ+k1UrQ/mQMuXLhjABxHOpphipVWxV4MolNN5yc42nYiaylEb+c9vf
         24PkkiRAWk5LyHIfyjlOlwX7cFMm90inj6mZZKxWfSKRvyQDPoevxmGd5BsxXPdAFzcG
         pCWv+eLLn00OwJxQdG4+vh4YK5pzb0OqQqeasp2otJChj/HQj0twRnzRil0DO4BP3fH2
         asNoIi6XFwKqrC150bHhkx1Wt1MAGlb2nNa6WR8aOoUioB4DvVI1LInFRw8apovp/l2M
         x/kULKCFHio6eKsAi/MkxlVq/BWSORGcQD021MiOyncSSGGRP6H88DmK8Ajn851OzfLc
         alIw==
X-Gm-Message-State: AOAM532EmfGvQEyCPAHSSoeofTNH4kW0o37W01kd3zTp1t2oGohEP6a7
	o6t41HB3ksaLjHoLm2OTV7sga1am
X-Google-Smtp-Source: ABdhPJwFfIykPwZf/JlIChQFe3tqGtkIRQecHD5MsrcZQ18ISCwtP+bvyARRM60I8gm0phQvyJNfQg==
X-Received: by 2002:a05:6a00:cd4:b029:2e1:b937:77e8 with SMTP id b20-20020a056a000cd4b02902e1b93777e8mr31316925pfv.43.1621983501679;
        Tue, 25 May 2021 15:58:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 15:58:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 05/12] softfpu: Add float_round_to_odd_inf
Date: Tue, 25 May 2021 15:58:10 -0700
Message-Id: <20210525225817.400336-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vpncymOtXcUU

For Arm BFDOT and BFMMLA, we need a version of round-to-odd
that overflows to infinity, instead of the max normal number.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 4 +++-
 fpu/softfloat-parts.c.inc     | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 8a3f20fae9..3b757c3d6a 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -134,8 +134,10 @@ typedef enum __attribute__((__packed__)) {
     float_round_up           = 2,
     float_round_to_zero      = 3,
     float_round_ties_away    = 4,
-    /* Not an IEEE rounding mode: round to the closest odd mantissa value */
+    /* Not an IEEE rounding mode: round to closest odd, overflow to max */
     float_round_to_odd       = 5,
+    /* Not an IEEE rounding mode: round to closest odd, overflow to inf */
+    float_round_to_odd_inf   = 6,
 } FloatRoundMode;
 
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a897a5a743..7f69da1d8f 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -176,13 +176,12 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
         g_assert_not_reached();
     }
 
+    overflow_norm = false;
     switch (s->float_rounding_mode) {
     case float_round_nearest_even:
-        overflow_norm = false;
         inc = ((p->frac_lo & roundeven_mask) != frac_lsbm1 ? frac_lsbm1 : 0);
         break;
     case float_round_ties_away:
-        overflow_norm = false;
         inc = frac_lsbm1;
         break;
     case float_round_to_zero:
@@ -199,6 +198,8 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
         break;
     case float_round_to_odd:
         overflow_norm = true;
+        /* fall through */
+    case float_round_to_odd_inf:
         inc = p->frac_lo & frac_lsb ? 0 : round_mask;
         break;
     default:
@@ -259,6 +260,7 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
                        ? frac_lsbm1 : 0);
                 break;
             case float_round_to_odd:
+            case float_round_to_odd_inf:
                 inc = p->frac_lo & frac_lsb ? 0 : round_mask;
                 break;
             default:
-- 
2.25.1
