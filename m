Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2900667lft;
        Mon, 27 Jun 2022 22:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ua0Bw+iXgV4smhZntB6LsXDAYGWhqCdZZuxu3Ey0nJprpu4wRzG5hVHZ2EFdzwRWBNYu2n
X-Received: by 2002:a05:620a:4914:b0:6af:3011:585f with SMTP id ed20-20020a05620a491400b006af3011585fmr4671574qkb.245.1656392707627;
        Mon, 27 Jun 2022 22:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656392707; cv=none;
        d=google.com; s=arc-20160816;
        b=xeTJkXFs1yHcn4vT5Bq4kvZYDXDvzM+2ecnDzizgXeRcX88ccTzx/O8lvK3FaszNqT
         AgP5C3EFLG2r9v6pbhUwy0lqQs7eP8VlZRABbt7K5JvegMy6rWUzYCpPbxvssG+k6b0a
         B83HIINDKn5AdhsXwDB8lhDmQn9VZoCiaE2DRjKvlMFWczLoqlpm+wpgDnV4pXI9qiW2
         OicNiPXBsc+qt5epXgj95m5OeeJ0qltP+TtlTkc06V1xn44/jGBrYUpHqa7EjBmJNsbM
         omIoIBNXwN+jIZY7DkWiq7VTHLHVBEDAUZyBREKKJYwLl29KJJVus+EYNtKGdHSFE9H1
         828Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
        b=O/+IBfPIvk9nomGu265vqsIqw0X/9mB1KTXNcfm5fSQajmLX7F826c8A046XqSdMYT
         cYpbfsQTfqvpwmkXAnpe5dGvMnyyB7nQUJAsW00hPNgrjIve1M14+Hs1qe7D2IjP7ez3
         LVwJs4a2MHIUiawwimFAULzqvkObsA7HOy0cGdFCDbFkjeDpOZ4i//A14bsywX/hSSSm
         ToAnW9GyPNqWxiCSULymA+2oORDPT6CrMDpvucK1+vZ6PMv20+8Ym7jQmTYCBCWNaNwI
         SsNvONERgFuGKcLaR/s9OdyejGRcCxmmrjH/szi/DmHRPB3QCVXUYnEKaV5eWtcSCkY9
         nGEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KkzG5unN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020ac87f0e000000b003067128adbdsi6399346qtk.642.2022.06.27.22.05.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 22:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KkzG5unN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o63PP-0007j8-21
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 01:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kZ-0002sO-Cx
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:56 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kX-0003ut-Jz
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:54 -0400
Received: by mail-pg1-x532.google.com with SMTP id d129so11002530pgc.9
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=KkzG5unNDbsqkQe32WPx+Gpnue9qZLtJai7j2WrSPKNJ2nlKuCS95wbB8M+ALIHdKx
 a2nFrEu2ltHiulHhzk9ihToBp9JyvOA8E8uNFKCL9ptwbzaVHcDjOw1vHG2vGIU1tHVS
 LqUsuqxqMCGu9DdsGBJPOOMtY/dPDDwDm3OKP3ikETCmXqbHcpLh3Q/Bmu4a6VaDzDWH
 FKue1db7oxu7UK/1PK9/wPSkxbK8EsLt7Wh+h7/x+7YZeD+PaMm8TW655yURXAPiibC2
 jr3Di67r8SscoiAHM5Pw8kASzSJ4sdnidW+PY4+rFq9AxKUsJ+6De0Y/CzIf7bk9xJlj
 FVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=qFyBSM2G5UgkRNkSBgKa1zRDo+kfV5sudU4S63U+2OCEl8fl++uGeicbZLA8accKxX
 ypT1E/KtiUyxY+b4XKM4jrzIatlJU89OoT8vZ9MNRCSaLeibaA2h7g6Xc3XAZGHgQqBi
 JMY/DTjEOIufrwobp4YNTADUroWiV5fohURQqBYCwyR3mmz/AkID2eTK8rJmhVPqu9cy
 rxB3ZNFUlvvqFasRApWK2xCtXaZYws7JaTfppGwxOrv29VfQag5yiomVS9OsbpjT2w0F
 1r/Rbk6k/XDUwJrNEHXsEnrJdsxh5dNFdfVgNAQuba82Ho2tSfzaiOvRW6fTzi5DBtEg
 nfnw==
X-Gm-Message-State: AJIora82J8x/qomowXEE/GiveD9z5+s2HEzgbJLuZ6BdnT3eenDyIobT
 x02W6KTz1nYO3TfZy63GpNXq7A==
X-Received: by 2002:a63:149:0:b0:40c:f753:2fb0 with SMTP id
 70-20020a630149000000b0040cf7532fb0mr15687906pgb.172.1656390172716; 
 Mon, 27 Jun 2022 21:22:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 38/45] linux-user/aarch64: Verify extra record lock
 succeeded
Date: Tue, 28 Jun 2022 09:51:10 +0530
Message-Id: <20220628042117.368549-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HirtsWQcfjte

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8fbe98d72f..9ff79da4be 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.34.1

