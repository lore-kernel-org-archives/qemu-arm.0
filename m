Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3028950lfp;
        Sun, 3 Oct 2021 07:41:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv3deuL+BBd67vbUSXBR4QGuzPD6BKhjD9JiMEW7qo9pg648ARDUoSYwiFzHpNgBHlsuMV
X-Received: by 2002:a02:cf83:: with SMTP id w3mr7037264jar.38.1633272102277;
        Sun, 03 Oct 2021 07:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633272102; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3n8oS2eHqxbuMFWzl1TOuJ66cJTT1QRbhF7D4k9YQPBuMgieBPDldGcCoLgg7Qkwc
         5//nUHqOZafo+Gkik6t+bTCG7UtWNpPEp8U3ckrhOiyx/vntv8+bieTXMpawuI58QBs7
         scbk2kZ1DrkU8kvfhS79/s/uEaItSfp3CL03aXVRCvv7XV2omNouQUF3MZ1lWzU9va4N
         2vs14Uo43DDiBS56ZA0EyqFZ2d0AG0l881GgEMZhWN/ZhOYbQEefhtqobymxtDDdSggH
         aA9yH+26Vmq2GWyM1iXs3nDPXVdC64oZc+CANscsoSavRJvh7RvF7MSUzRVEj8j86yN9
         MRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VkTxOuPntTexHAld4+mJv1hOaBW5vbrtx3WxK0zn1+8=;
        b=Qq29pW8lizt6taEnzda3iQNmNLeH4Z7qizyOecQ2N+DR5hm4w9qqmvBywCH3ZhBp0v
         upFWwcYfSvsxajskVxwr1Dxv05Q2J6VlFQis6n1Giu9QTq9ozo67fjUAtODBgWnS12bA
         3hxLkYpFGB7yjDwrDl+sG/P7IfpEvFEKbj2wwPVmPkPTp+ccbAXteADAGcT876Y13oKQ
         cPvX3MzLPSGTiPICTqikSXAmr+jJNddrkPecPwHaZPY3mB8Ajy8H6xP3LO+gMbEiHAYj
         WDmiwS9PiL+9ULort6e2O1GU4YkuZHrNgbsBTpmj3PMg3P3Xp8Pjnusoc27ZQZ5PW3ms
         DJuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=bKslWLm5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si13554929ioa.5.2021.10.03.07.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Oct 2021 07:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=bKslWLm5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mX2gP-0006Dz-K4
	for alex.bennee@linaro.org; Sun, 03 Oct 2021 10:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2dz-0003xe-C1; Sun, 03 Oct 2021 10:39:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2dy-0006ef-1J; Sun, 03 Oct 2021 10:39:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so16694803wmq.1; 
 Sun, 03 Oct 2021 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VkTxOuPntTexHAld4+mJv1hOaBW5vbrtx3WxK0zn1+8=;
 b=bKslWLm5yK61qTCsTGqA+YoeekKU8eZYFj3Z5ieA3WHHre7PiQAvGRjFPTucPr0FkW
 peGNtMCugGUrFXzXNZx3BJ7nGtyTxVwKrYyDoIRwKxfP62L1ozM6HBPB1x7p3e0y/j7S
 9RFnh/qzoUp3ngvCai/yPr7K/TQNplmI1SbSJGfwuFgmfU1bpw0AEK9LzmAsGxrD0dg/
 ZMAwB490rcGKKnuA3C6P64zr7oVMyDxEUzQIGqTJLH5ysmb8VWBln2yTPnzDRLpF5QZc
 K0ERLY5ucg5FVsLuQgePFHlzuXkNig49b35kRfLw2ACgYhIXWHVi0JrMYhkBVcuGRi5r
 77/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VkTxOuPntTexHAld4+mJv1hOaBW5vbrtx3WxK0zn1+8=;
 b=Wf5OStn3Og9JD8u+pOL9MqlGcuf8aOfU136CLis5hn+tHHz/E3FlPLx+7QBv1mZ0f+
 o2PQP8ZvexpdOx7hePbJmI7DR2n8SkFPZvVt33dqG89ZrryuCerFNvVXbcTLWUitcITf
 M1Kjm/Da4SNEkii3UGMFiOrSPs+uGHFPvT6K/aev98alCkx3/7gN6JSpprn0Fb/Wyfkf
 QPLV6VGcfkBSBJYfqLXjkvt/tXyApqzCFRSdYVfY6Bnq7zfDouTqHBSilYhf/GyJbliz
 aevDlndP2RVGNUZxbQninmBVoquixaK/xn8vIsjZknWkRsfXxCp8GQpZSfXWWM45H21H
 sWUg==
X-Gm-Message-State: AOAM532/Lcy7vk26tiDVKXBEgUdl+CYB5ZQaxq7VRbHa4MspjtRM9cEt
 PJJUCgKXgNTORs2k76WYzUDXMVva4/Q=
X-Received: by 2002:a1c:2904:: with SMTP id p4mr13895934wmp.49.1633271948153; 
 Sun, 03 Oct 2021 07:39:08 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o7sm13702769wro.45.2021.10.03.07.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:39:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Use tcg_constant_i32() in op_smlad()
Date: Sun,  3 Oct 2021 16:38:59 +0200
Message-Id: <20211003143901.3681356-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003143901.3681356-1-f4bug@amsat.org>
References: <20211003143901.3681356-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R6n3T2DAmHJ0

Avoid using a TCG temporary for a read-only constant.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f7086c66a59..b41e0f50dfe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7873,10 +7873,9 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
         t3 = tcg_temp_new_i32();
         tcg_gen_sari_i32(t3, t1, 31);
         qf = load_cpu_field(QF);
-        one = tcg_const_i32(1);
+        one = tcg_constant_i32(1);
         tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
         store_cpu_field(qf, QF);
-        tcg_temp_free_i32(one);
         tcg_temp_free_i32(t3);
         tcg_temp_free_i32(t2);
     }
-- 
2.31.1

