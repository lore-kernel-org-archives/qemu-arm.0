Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3168663lfh;
        Mon, 30 May 2022 20:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy93OowAvN7/SHxls0hybP+OTRdMSKxW5L4k7+7nKauvVWMvpV0Rl5LEK295oyie+8nGST0
X-Received: by 2002:a05:620a:4249:b0:6a3:303b:6d26 with SMTP id w9-20020a05620a424900b006a3303b6d26mr39119808qko.0.1653967374744;
        Mon, 30 May 2022 20:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653967374; cv=none;
        d=google.com; s=arc-20160816;
        b=cw4UCk7Mt+uahLOG73zXUNvm1Bqa97nzY/8S4fcvnj6MNxZ1ZGXevP2EOV1c24flXd
         KSeGdGa0rvG0Z6YpI9KNedB06onLnJ4Lcs8nFSpXTR4zJjRkDIlVxnJxLhqJQHJSVozV
         eSK7Lpi+2Zl/8lgFIySwaxtH5+zVrI0Pf/hywr/rpz7vvlCgjnjUhOwb0eMPp19VvGav
         QJ+batyc7VAmgUuxWhPhGzd3qsGYiPjG45FClnqvIWHvS6n+aJkAF67XuSS1W6OXOpkk
         KEqxJ5r+OiRXqkQOlvEQmRK8RwXYe27P1kpin9v/tJILzA8eIwKdCxOsRjGYGwCrZgKD
         WS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2XdNrw6jjPQZS1G0m2FflaEfvXHDOD5bt0DVKmeqREg=;
        b=D83G9u7yhwXGMKPKTWlQn7bwj9biqM+RJhX36ezBt0dfjRhmyFdh1DPok+Hm1FT/LG
         gvOT64yE/t1ii64TAVcBZ8FEYbHCYjZWhVuNO0/UNgygPG7fOkny+I+99LCtHN9/D2S+
         0XM981hdJK7PEo8BtFfdC/qoqt/kMNNHxQtljfZP0oeGS/XwP5kmGZMHNTmib1UeZyAG
         d4kUzzs/qCJyK9zO+aQGy/nw0JZQqiummb6dZiuDZErr77Kh0YBbUeFvmjqPBS+IwSOm
         TNcd+t+EJRwH6Izw6XYWKxZLsADBsB0HZmV+QqfEGrb2wPkyzTGorVD5dKnR/UrezNet
         pRrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YLER3mHJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp14-20020a05622a1b8e00b002f39f1e7a0asi10243809qtb.177.2022.05.30.20.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 20:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YLER3mHJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvsT8-0006AI-8k
	for alex.bennee@linaro.org; Mon, 30 May 2022 23:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvsRS-0004oD-5S
 for qemu-devel@nongnu.org; Mon, 30 May 2022 23:21:10 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvsRO-0005Ab-Ew
 for qemu-devel@nongnu.org; Mon, 30 May 2022 23:21:09 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so1142255pjl.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 20:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2XdNrw6jjPQZS1G0m2FflaEfvXHDOD5bt0DVKmeqREg=;
 b=YLER3mHJnjFMQv5b0BAvFJkJeJ18gBTe/D3IN/Fjp0KY94oiboY6ZsxOa90INZj2f+
 9FPAh2MsBrEephaJvMwznHxMSc+v7L+PFJ+Zlnvrxx8SUxUOKeJP8xt6QSE1j3YekMff
 AZsndQ0OMMm5tzzDBxF73EJ8LI6Y6vqKVqZQ9r1qiY35UGN3BsxYvGcP9wej4arMGOQ2
 zuyQl/JLvdy4i05S8ZCaprwx8hfEM97mYDx2Ui7xj4rKO6C9OIsCF9WjpKRvirODoPLd
 cyzYyxXeUvJ21mRQNR76suviYztPogDXk0bT2lgyDXWgpeSl8D6JGFSyB8QMUySR/gzu
 puTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2XdNrw6jjPQZS1G0m2FflaEfvXHDOD5bt0DVKmeqREg=;
 b=uQPnEGgT9Fbvo1R8EQC24s7qLkJgkGp8Gv9Ob8pbqucWkwSEwo4aohtFNuhqfXNxMo
 PqTeZJHuCItTKdvH9eiHT7BwgJBVGhzSJONyqVeb9SHTwHNfuySFATDRsmk3zCmYDRlY
 3njNzOyQtmWnlmU4LLq0XSXclo7mjp4T07NVkbUoo2JvZDtXNBGpUFOBq5+9DwzPyVAo
 9VKvxrCtSNQ1yk3F3W1YAleGj9rheTj5eOBIWihTbRzwDtH6YbWKNctDMfq/nS8bkGao
 56Ne79Vgnr66XgUc1KjSYnZ5kfedME9J09m4HRdvQjXeeQPR9XNEAme+7c9g6ZZnT0ov
 ibTA==
X-Gm-Message-State: AOAM531b4uR0wb5U4a/Ci3WwNTcD5KEHru61YPU+OmoV3Ro5/r+9G6WZ
 wNiKytPwZ82GhM5hiezAjkeXgV0PDbwRdQ==
X-Received: by 2002:a17:902:8a96:b0:161:d9ca:85c9 with SMTP id
 p22-20020a1709028a9600b00161d9ca85c9mr58047062plo.94.1653967264369; 
 Mon, 30 May 2022 20:21:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:b854:be6e:eb63:5d95])
 by smtp.gmail.com with ESMTPSA id
 144-20020a621896000000b0050dc76281ddsm9437275pfy.183.2022.05.30.20.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 20:21:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] tcg: Add tcg_gen_mov_ptr
Date: Mon, 30 May 2022 20:21:03 -0700
Message-Id: <20220531032103.406203-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0O7AherZ3rOT

Add an interface to perform moves between TCGv_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

This will be required for target/arm FEAT_SME.

r~

---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index b09b8b4a05..209e168305 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1288,6 +1288,11 @@ static inline void tcg_gen_addi_ptr(TCGv_ptr r, TCGv_ptr a, intptr_t b)
     glue(tcg_gen_addi_,PTR)((NAT)r, (NAT)a, b);
 }
 
+static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
+{
+    glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1

