Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2071000lff;
        Mon, 14 Jun 2021 08:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzunEB83fq/PmXspqDCvd67/sU2gl44UdTauaqTsQ4ch04Ot/XuTMIL78qefkYEOZOi7PcQ
X-Received: by 2002:a05:6402:1705:: with SMTP id y5mr17662301edu.232.1623684341727;
        Mon, 14 Jun 2021 08:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684341; cv=none;
        d=google.com; s=arc-20160816;
        b=z3lOfdj+VgrMA/IQWB9+zWmqBO0HdwgP4UY+tQvqq9beLSGKQzO1pvy9EnFzOev4LJ
         Z6no6YxzlN6cD++7UXykBpw+kyalthgw1NjAufSUYianedBhFtjU7NqDQllxr6QyrFp8
         XaQgNicQxWl2IT5pRIpYH9bGnLFDA2xf6h0KegvUiX7PwOiTIVoiSvEGdcfZnaQAXETa
         jX+Hz6Hlz5IK+btiOt6uf6JoS3xpXEEQj4vZ/9h8WfLkBFn2Q3C/1++GdSUd+/yxKmxt
         PFeN4ZzwjILVxdfVwWsLNPX5wsj69iDC8XtjV0ZZZZzf/947aeI6FneKoybhNE6YbB3t
         ztew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=82usIVl+ptqyv261o6EebgRru0vMcw1Yn5ta4kVZS6U=;
        b=E6lqa5+JfqxL4JsziJKuwf7FORMBZ3iRRnWCIDZZfywnHN6nnOCHsUH2C0BUzOFI/7
         OLnNHLIsbvNGxW4Mye0w1TGoz0YevZ8MLNoz+pHUOGxlWxHTUo1E+6Y7DiaIX4hA2KvT
         3Kk7VOn7cDImqUs2D8R28pfcZzDnOMP8gXyz34OsGUYgUyNzfWw/4G6juf0IiJvIkl5Y
         MCeUip7SjtbdK27SdUhOqxZvoMg4CeXVknQaxCnU2ji8uTZ45hxxcTlku4rZ0fMK+FLr
         ceVyJtnWA7R29txAHxbJgY8rGVdgPFjcpoeG4O/fjTDqh7DbjPLeQNCE82ciRjRKA/FA
         B28g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G54F6UJh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si12666227eja.465.2021.06.14.08.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G54F6UJh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoT6-0007tR-PS
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEW-0000qS-8e
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEM-0000II-Sw
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso13315816wmh.4
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82usIVl+ptqyv261o6EebgRru0vMcw1Yn5ta4kVZS6U=;
 b=G54F6UJhSj+MdGzF3P28kSZ9o8oxgAct2k7mqVN+JdQJLpLjiXXOG9K+GkCkp8Edxh
 DJdeTq9KdysEMZlWZJ/nY6l3lWQTifx+NvbsSEkL5St0w9B1CK4YtUA6MduhFGdQiXNa
 xzrHM9JoAkkhAwaKM/I1vPydoGyO8pKMTNyYPWc7WSgUVo1jpYVVWbn13TYz7+azd6ir
 ByYDW3mkKPZCgyaVjbHqJrTBDnSRqwocb/l3fdOw74vKVIO6QFnqRQz6GvKJVb3Z9wct
 /KEtM8oLI47z88K/JO34xeRO0+4GvoF9SJenGjb98R9InbGT1SpvPUKcqMv3yT/cYOGT
 bYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82usIVl+ptqyv261o6EebgRru0vMcw1Yn5ta4kVZS6U=;
 b=AbsLhR2RdPbhfuwCcHA79FEamo2ODbuUVJsm0kuNoHbwYxRMcpPhi0PZoEUOo4cwGF
 MS1lMXxs85J/8jDbQPn9J0ertrNHGwUe1oYBCMdlNfyejxEnB8QLbe27u5RMwOj6r2yR
 gcJm3KfKjiD83iNgBun582PGd7Hh9aeCDoKr5QOQWwn7bQp5g1S7wwRckmyIQfE3j126
 VB7l76pKy+xrs0/Rv134HA+U+WYD/duroVA75sifx6TDekzxS/jdzAfMQhWilPEKcMB8
 QNw62TylFE3sXEl3dqQEeFBbCDINQGMUb9q4v0gf1K7HcjsCOWfw/gSn0PXnzgbTpjn1
 v0aA==
X-Gm-Message-State: AOAM533ywrQKE0rkXb4ELOhaXqP7X94Wk1t8vpc8t4+U8WMC/0ETY61Q
 bs+D1CMHE36iM5Ad8ICVXVX0mGbp/Y5vgA==
X-Received: by 2002:a7b:c25a:: with SMTP id b26mr17461639wmj.31.1623683423859; 
 Mon, 14 Jun 2021 08:10:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/57] target/arm: Implement MVE VCLS
Date: Mon, 14 Jun 2021 16:09:25 +0100
Message-Id: <20210614151007.4545-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pc7jxIyfx9wU

Implement the MVE VCLS insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 4 ++++
 target/arm/mve.decode      | 1 +
 target/arm/mve_helper.c    | 7 +++++++
 target/arm/translate-mve.c | 1 +
 4 files changed, 13 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c5c1315b161..bdd6675ea14 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -33,6 +33,10 @@ DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vclsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 24999bf703e..adceef91597 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -68,4 +68,5 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
 
 # Vector miscellaneous
 
+VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
 VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3d3b35d4848..1590b3ac83c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -272,6 +272,13 @@ static inline void unknown_mergemask_type(void *d, uint64_t r, uint16_t mask)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_CLS_B(N)   (clrsb32(N) - 24)
+#define DO_CLS_H(N)   (clrsb32(N) - 16)
+
+DO_1OP(vclsb, 1, int8_t, DO_CLS_B)
+DO_1OP(vclsh, 2, int16_t, DO_CLS_H)
+DO_1OP(vclsw, 4, int32_t, clrsb32)
+
 #define DO_CLZ_B(N)   (clz32(N) - 24)
 #define DO_CLZ_H(N)   (clz32(N) - 16)
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9eb6a68c976..4e5d032242b 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -198,3 +198,4 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
     }
 
 DO_1OP(VCLZ, vclz)
+DO_1OP(VCLS, vcls)
-- 
2.20.1

