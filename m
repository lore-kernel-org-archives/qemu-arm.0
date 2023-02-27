Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4288508ejc;
        Sun, 26 Feb 2023 21:27:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+mIjJ9x9huz4NrqPj6m+aAKWU7zp0rTzePW6HnKQ0JysfuuC/koOD/ZC8dyTuhb2BwYpTn
X-Received: by 2002:a05:622a:134f:b0:3bf:dc2d:f29a with SMTP id w15-20020a05622a134f00b003bfdc2df29amr1303159qtk.18.1677475659119;
        Sun, 26 Feb 2023 21:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475659; cv=none;
        d=google.com; s=arc-20160816;
        b=H+Zy9FR6sAbCUxs0ai5q8G+GMs9PN5jDZ+HY0YFpMX+EpyVh/4YqD4T2xi6e+7L3aq
         LMtlcJcElDQ1geQhO8izIdgKWAIM9Kuq8WKwb44yVZYouz62/0XmW4+L6ICzzbIROlIT
         HtyJaS67QtyAWflpQ1+ApnCYky7u2G3YrtWp/8273sdtlDxW1KW2esmbLbzgpiTtYnKS
         v8UL84JWle1xdv/kxMllIy0tTKVwl7UXxAIbPN/MaREw/VKS2U+1+ux43eBWn5C30fd0
         /ae9ENwbQgwm1jzq9FDL1rYFOKsJi0AuHXo8orn9VhvlCeHtQH9CzTLHwesvXaxG5GL9
         dOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
        b=BYWWhIcEyaGyXTqQw9pALkD8Uin+yXYuGyWNNeWzkEgEycnNCRSfcw4dYslFBg+Psj
         1fs7XlyOiO1pXeHFjn4Tmjdd0IgaO/3uDAsaIs7PFooLo7BpTFyy/eZJRHhgV2pa07f8
         awHHIkA2fHBJLYjHt1NwvtU9oyYyDpabG7v+SOPobdSG1XXTwCiLlicWJjhsi3Uf0Ir6
         LoQKuSXV0MtIUDrkbKPnlXRomR1k/YtHDaP4QObsXcQMiEKacJRagLqpBVQSZQirREcM
         eH5IafTiTFVJ9vtEIXclXuGK6MMvk9xZvP5nsnXlXaVv7qANbdv5467OcfSREwrc8Beb
         9XtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X+pP2vR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a05622a044c00b003bfd9c0e3d6si1729225qtx.184.2023.02.26.21.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X+pP2vR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW1w-0008Ka-No; Mon, 27 Feb 2023 00:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1h-0007S6-2Q
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:17 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1e-0007el-Tr
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:16 -0500
Received: by mail-pl1-x636.google.com with SMTP id bh1so5500031plb.11
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=X+pP2vR6DKKUY7zIJxV0IG+zHr4jj06M02ffECX3vuC0mTcHEe2cgIixGrKHVjrrc1
 bGUaZYz0rdCz035oqhwlOD29cqcJQNFX6Lw0EA2dhduyWqFCL/7tDMytP4WO/cnrEbmR
 9i3ATwg1xAyuwDceVVAKXpoOW3zDTnweKJYaXOniWXMA6wJUIQVvW0IepPzgNHOgkopK
 xDriqG6segjZDhA3FYXTIOHH2mkb8iDkM5oDhxR2RzjNjeOU++xLsQRjxYQyTZYZFOW5
 eGdQw0vdpva2uwdg9uzdpO8jiQCUgkyyNpzEogfXlBO4+1ppwCRkfw0asTYcW9vPMzVT
 YL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=0oNpwRM881zPXc0uStCmumS7l7VwjDwvhij6uPVunLkdJjo2Hzf04Vb7XzDypvQuVu
 xd+3hSijTsLkb6Wq4nrdwlstW1PK00TNSycm6UEuBynXKZ3ZWG+U6YdV0bpqF1+wnnTA
 kFpcFYUVRF2za5V0ingmUiZHeeEFgtxZNbh2W0w8QGgYSd+CO/xBApdOhQkiwXSveqt/
 D0e/x7v6pkNjntRNCAavxDvb3vOITuSu2v9gMnGzH1uMy80xkuy1XUthAMyQ1QSZvVHD
 XQkzPKWS7rrW0AIJT3MYEhYreobyzqm1mbYWHtcZFwehRh7AZ8QiiF46QeEiIVJgyr9W
 316A==
X-Gm-Message-State: AO0yUKU1U85XeIvk1nlYlhuX82DB9Vsw66abscPAsSzxbEIx9u0pCIEO
 E1FsuySeH8OjhejHaMl/WgAuRQ==
X-Received: by 2002:a17:903:1205:b0:19a:b151:bf68 with SMTP id
 l5-20020a170903120500b0019ab151bf68mr27857055plh.38.1677475573454; 
 Sun, 26 Feb 2023 21:26:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 23/76] target/cris: Drop addr from dec10_ind_move_m_pr
Date: Sun, 26 Feb 2023 19:24:12 -1000
Message-Id: <20230227052505.352889-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: Waf00YUz4aDk

This variable is not used, only allocated and freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate_v10.c.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 5e9d1c0fe8..4f03548365 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -800,12 +800,11 @@ static unsigned int dec10_ind_move_r_m(DisasContext *dc, unsigned int size)
 static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
 {
     unsigned int insn_len = 2, rd = dc->dst;
-    TCGv t, addr;
+    TCGv t;
 
     LOG_DIS("move.%d $p%d, [$r%d]\n", dc->size, dc->dst, dc->src);
     cris_lock_irq(dc);
 
-    addr = tcg_temp_new();
     t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, 4, t);
     if (rd == 15) {
@@ -816,7 +815,6 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
         tcg_gen_mov_tl(cpu_PR[rd], t);
         dc->cpustate_changed = 1;
     }
-    tcg_temp_free(addr);
     tcg_temp_free(t);
     return insn_len;
 }
-- 
2.34.1

