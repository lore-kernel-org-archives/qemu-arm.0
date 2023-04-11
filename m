Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp184269ejc;
        Mon, 10 Apr 2023 18:09:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8I83PKqPdPeMKGKElgY1ZAuZbDN4AIpdFVf3WoFs3zVBYbSr4/p8UyUYWstRQ7qOjcsnn
X-Received: by 2002:ac8:5905:0:b0:3bd:1081:b939 with SMTP id 5-20020ac85905000000b003bd1081b939mr31661588qty.0.1681175364382;
        Mon, 10 Apr 2023 18:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175364; cv=none;
        d=google.com; s=arc-20160816;
        b=iwHSJHiuaPkpM6OGXkHLkZLA1RliAw8fjfUe1Ypnu3qM2j0czL0pQDS+txyvutcoo2
         VkhApnk8AeQ2zKaVvPhPr0wO8EB5YnSQU84z32u7ZqfuO5lP+TloWYhvOyKC7884rJSj
         i8jZEuOLkXZKaoguDvFYw0gvVDP4jPuOUYbwGuwXTHZqWn4/s83H181F/SrqGL9ok5Q+
         WcA/4959uJiS9PHGuofjOOliRJFUaUsbZSn33Evt1mEbfiSc5H0lblls+GGJN+7g16C9
         HTxEaLrkChSVFOr8G0dEL1hQPcR8A1EjAHvetE76/0MpteOwk/dVKF3njPgF3ds+u8NP
         9ZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
        b=j9XpgwSwuw2LDJswYE4irQ2vecQxgYcIjdUkPFLobqdwdXAdT+7/XAXEFe2Kh8esOh
         xUbjwaJkwd10q5HMfBu31T6FI0gGzp8gtwBBvvhoIcjphcRI6m5kEMtsbNODg36r38VU
         mC3ujLAzFysQbkR2RuoNnq/k5XSaNCx8hKLuAJ+3K0vVz0JFXcVxyvQyiQsJkoueBKTy
         fHAj03VockGgpD5EORyVOeNylKrx1toOyJJM23zdmLYC7WhuD+gyM+VKjCq7X+PDQLLQ
         p78GTDocOQUguqBlYIqsh3arM+nDXhWEjlNNs9N5SqSvT4fRPHKONqt20xMA++Aph+1u
         jSOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTKt+itC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq39-20020a05620a46a700b00747a2434db8si8286930qkb.772.2023.04.10.18.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTKt+itC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Sw-0005Zw-59; Mon, 10 Apr 2023 21:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Se-0004x6-QJ
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:17 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sc-0000aC-30
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:16 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pc4-20020a17090b3b8400b0024676052044so6390405pjb.1
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=lTKt+itCjKNifxk7EQUs9xlVFhZ7sChSGzBy97f4HCVIG7myhJaKfztzuoouLfE6aw
 NJ0T9AJkFqi5RGF7N9eiVzRYx7W3CpzTN4F7tpX0CFBRiJB7LlJSuQyJJrRncdMj+ePL
 tqyHW2vxZD+rt3Wkk4oYN7VCWDwnbBr/4YuSF3rljD8jaV+mtd9zU+4nzCTzCkAQ57bX
 dn/iR1zsr9UJiKtvy9CjinIA6xrrf7KWhexJc3PPcbjSc+uZEVZuBdi/UZ8lT07KHjqe
 r64w7L7MKyw8Xh8dEq7PhwNtZ5eYeP8Y3ViL5csx0KVLTqVjvo524xn7D6xCSlW0dxNh
 Ym0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=D70IpPtiFkM/M/1o/IEmQFIE+uHLVBLQ7N+VOkd6SR+MmF4p965yrVyDT14AER8laX
 sIRzJcAPIXyJRp1NkQYavUjJ4gYccLJMtgTr6eRpiIj0SmWX6JlNpZlJHlO7xxjfxVg7
 7NcAkN7hImQ6yNLTvZsvjWx5fLNazkBmWB8xUOgftWRmXqhwrpMX/tA7pu/HmgcOfwkN
 2dtefdkDQ1X6GC32Lj+HGqkxqHB0fmJThS4bvdVI4VKkK5spRVy9HbHARNiPbnq3QG+5
 XMT65TLzHqCnO1Q76xxhAo52N0E4Wx4eQeYKd7IM8SfdeEW0/4ovJPYwUozlPiidcZnH
 uDsA==
X-Gm-Message-State: AAQBX9dcHmKzOr34+NyqUdn2EE5Q7mXiidxOZy99xMqkVzmJjgWUCK/4
 1FfgN4/L13WDbyPyynu/9O/xbA==
X-Received: by 2002:a05:6a20:4282:b0:db:c5c:e0a3 with SMTP id
 o2-20020a056a20428200b000db0c5ce0a3mr20633728pzj.10.1681175172674; 
 Mon, 10 Apr 2023 18:06:12 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 19/54] tcg: Clear TCGLabelQemuLdst on allocation
Date: Mon, 10 Apr 2023 18:04:37 -0700
Message-Id: <20230411010512.5375-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: 6OAEqV5onpk3

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

