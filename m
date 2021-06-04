Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1395177lfa;
        Fri, 4 Jun 2021 11:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu1kApypn9X405XeEDQo0bhz1aeAhjZbeBVB6HBxJVVVo1QkKjDoZ5hdILHId7akQyDRWK
X-Received: by 2002:a92:de06:: with SMTP id x6mr5237185ilm.76.1622831740457;
        Fri, 04 Jun 2021 11:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622831740; cv=none;
        d=google.com; s=arc-20160816;
        b=AuvIN3ozBp5u8c+qEvGLMcHvuGoyKca0O0roxhGX2wwtWVlC3bYJiD4oKtk9/5lc/6
         RTEPUz5FTBQpX22SZhDVAhKeqvzpX+Z195+TZAhEAtiCvC6O8E2sYgW8F0BW5fgXmoqK
         dlcRpgTJzZD+4nMZqeXAnWZ+waxmg/aO4ouFJtfH9iUB7n/4fBubSJ6RNNtSCEWwkkjh
         YRZ5wIMfxPQqa+qetRCbpqd6Qd5qezyKpxNRLIbVl+PGlbgd9TrkVPVYjmQE/Ufe2guo
         YLU6sy5GFoGDi13D841c3be3roKyfH1t02tbu0UfHXlL+2L6vrDoe1obIA02+auK/AnN
         xT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ngf2a8fv1Pxh8onF7826WEkLyZRw0BsqH4cjJDshQJU=;
        b=Se58VeazaXRxPAx27wwJc5X9ouXF9A7xadP4y35M3ZkM4JHAx2P7f5A+UlMS3Uay2z
         SE+VlIOyQmB2r03zMItopQF6IAdJZBc3zeEDc0gMUg658yOGryRaDLaynd9b1ctcIwsh
         kS1fa7Upkm5vxNqCl36f3AmGA+GwrxajpH70IypZFvx+vs2tSWOEDomJJjxAFdPCXXk7
         I6y7HiFC125Xs9yHORm6ML1N9mwkdMoYFoPDlvIFAK2FwAo5Jn1VL8sth2v9IGc37F/v
         2vePNxkattIQRws7nV5Fkj37YHMQa4KdSj9CjWstfvfCaGfW/84lZwGY4C9X1XuNpLEW
         8PPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BahkTYL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si6943092ilb.82.2021.06.04.11.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jun 2021 11:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BahkTYL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lpEfT-00079A-OK
	for alex.bennee@linaro.org; Fri, 04 Jun 2021 14:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEf5-000754-6I
 for qemu-arm@nongnu.org; Fri, 04 Jun 2021 14:35:16 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEez-0000vx-MK
 for qemu-arm@nongnu.org; Fri, 04 Jun 2021 14:35:14 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 69so5100580plc.5
 for <qemu-arm@nongnu.org>; Fri, 04 Jun 2021 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ngf2a8fv1Pxh8onF7826WEkLyZRw0BsqH4cjJDshQJU=;
 b=BahkTYL1TmTbSJ1Hw+9ZHrpEuEz+dk/FBSy7UFPf4Ju0MmqMtyl3f8PCODsMH0FQSl
 KGazJk5CnEsFvgZ8zOK+7RVrOxdL0ZAlb7WcLVwA3BnHfoMR/LOgfFWvOQ3NfHgMvl5U
 RW+iy81HSL2M2XOGaVL0vN2onu0eezid9AKNt7K3fNIJfjJ6+Tj+jYwMv8IPrD8ieXP0
 RVctKCSZNOBkII4qRH04c1885cMdpRbR52UN2cCA+sgKQtFLZZe5xyF3nVthyxxqdhRh
 Wwsm+52rJss8J/9ASxumb/VY8k73gnAZh0revyqwcsXS16JFWEIbQJgcV1Z4RsxSD8W3
 EUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ngf2a8fv1Pxh8onF7826WEkLyZRw0BsqH4cjJDshQJU=;
 b=lW4on+9VAv8MINRBIKI8+FQX9a4OmKsM24FkvFPbCb7bNeVGVuRL7L8zHP8GGxLFwy
 t9mkSzCuiw467Vqh2qyTst0Z8L/GOWYII4ilSSK/GvPU/Gwj4kq8GWVaXGifASBtyR0D
 z86AutM8YVuxg/OvjA0k68A+EYsny0P2ie+ipsgbFgoPDF/dzFu2Wn4d9empLHt4BJWQ
 YQgbIXMqu5z+SvDZKgR2R4AtJahM3TxVqlScRal2MLX8cjb1k0wnqR8gpB21Axh9WObz
 /sgMzesf021cpwAcUPiT6c3m5PxK8/HkyB7HY9EdsVumz6EWKw/ZmFhWiYOaorJA0xYz
 6u9w==
X-Gm-Message-State: AOAM532WGju73scGYjO+SExXOpIO+0miXOcLqqZnitZmEiCXHjj16TqJ
 C3FCXDN913sI7vYHAeFY0uLpgQ==
X-Received: by 2002:a17:90a:bd05:: with SMTP id
 y5mr18753053pjr.213.1622831708298; 
 Fri, 04 Jun 2021 11:35:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m2sm2620578pgu.85.2021.06.04.11.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:35:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Remove fprintf from disas_simd_mod_imm
Date: Fri,  4 Jun 2021 11:35:05 -0700
Message-Id: <20210604183506.916654-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604183506.916654-1-richard.henderson@linaro.org>
References: <20210604183506.916654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yQXZChupfu1B

The default of this switch is truly unreachable.
The switch selector is 3 bits, and all 8 cases are present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2477b55c53..9bb15ca618 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8291,7 +8291,6 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
         }
         break;
     default:
-        fprintf(stderr, "%s: cmode_3_1: %x\n", __func__, cmode_3_1);
         g_assert_not_reached();
     }
 
-- 
2.25.1

