Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp633625ejx;
        Tue, 22 Aug 2023 04:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNOJnn6+FR771WvWc2empnUTYCQcoK1/I5ZpydropH2VAhWJ/r2O8oHHbITlm4TXe/H1xQ
X-Received: by 2002:a05:622a:101:b0:403:b6d2:8dc4 with SMTP id u1-20020a05622a010100b00403b6d28dc4mr12497240qtw.34.1692702243994;
        Tue, 22 Aug 2023 04:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692702243; cv=none;
        d=google.com; s=arc-20160816;
        b=NCgVKrZLVVXknZl40hhmxziYgutVOKg1ELCH51T3ja60bwLtI62us4hSG4hrdOFDL+
         pRgcg2rzbi4g5FnCZTI84j+MWfaEaIlT3n+OLbtHqkav1FN3J1QY3TzmMq1L72+EK6tG
         gta+0DKPWVqFQZDfa7ZgLSx8vLZq+6WHfxyN0R5J4S2VTbjov2RxcYvG2/bgkqVPUItd
         kmcXHsfXjKHW72DXOHtUn5KQfeZBYFIm27AXKvs4m78qxeBKBdWbbv7n+7e4pCKthWWN
         ZEvh+bhpKDQEGNok4f2NAn/GbKJvP/LLtmLiHyCUiUpCuqqTywp9Y++VTbiGl+vgZxKK
         kEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=emowz0axu/kGB6eTmVL35kBP/OFbuZg2HRDsrnbXrTA=;
        fh=nNMMnsLJfx+wwcL6Hpjyue2kO7c5wJkFUZ+p5f7qT8I=;
        b=Fri1jRZmx+6t56UTDIa8+Fxxg/B+a3tjmcRRdddLgszNfms6L0HFx9zYVqBlKTiiNO
         JTZQOKlQ0PRpwwSgyFGxj3bFnA+xeopXERWEFV7XO9ZXWtnG9PWmjc3t2Xu4T8awdNmG
         H/WyM4r8wOjaM8hMWHBjIpU3daCPPdH8eI2Y30NsbCx1ocLpMI/jQyKTdTM+LgoyMuYo
         GNNXoHWo4yj9IqQmFqub2/97cx9XaXJS8ImhExsvEbb1Cb8KYNp5XtHqxzQO+IZZOJYe
         KngEIUiOr0tvTstgD8A27Ea17vXeVuNWddnL5M5OHMRGubYAxaaibOBBTmCRl4GDG4I8
         BF7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJp2t9c4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020ac85c47000000b0040fde0ea8b7si1071148qtj.285.2023.08.22.04.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJp2t9c4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYP9g-0006QL-Uw; Tue, 22 Aug 2023 07:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9I-0006IB-DA
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9D-0003Lk-NN
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fef34c33d6so15254195e9.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 04:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692702122; x=1693306922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emowz0axu/kGB6eTmVL35kBP/OFbuZg2HRDsrnbXrTA=;
 b=HJp2t9c41grX9JI1wNgMU9cHLkvXsxLAxm54fboaHuOiSqdzi2jm2DWq/MTHvWe/Q0
 Ft0BQIkNxlqpSyxNB1GUIeXD3vU8F+OCGTucV93L0CUFPP6PGjvE59H1ISjgpw7GI3NM
 2ZXvCUW/O200mQBVJfOyi4sLgj/JE2/HcQ7q0uysG9kMkI1GOijtFGZ4PgBJ4N86XLmk
 iJf1Rrnhkd5hvHcf6jjcLCLOrgq5hVV3a267Vj4ZDuEqjVip+fCBoSuH+OibkCcmSTJi
 nyuKqDsV1twNMhJXZDeGObB4O+g8gLcmnG1HUTsmSuIoc+SfPlgdMYQftsTKAW978mCH
 PiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692702122; x=1693306922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=emowz0axu/kGB6eTmVL35kBP/OFbuZg2HRDsrnbXrTA=;
 b=DRe/WLzjw7GYq8o5XsnEb/ucgjr8ejRaEoauZRYwqioP0mfN0kG9kZk0P6oKf9bdTX
 EfqoZzZ0VBxFxXEUhpVDdFyPe6mEIMaw2oYDOIKh1XKKF8RX2/Eb8+aYjHEQ9Dxq8SAG
 lQARu0zh346EbzvHcPg4MJ0TwmMkJIZBhCQkVcoMP9dgZrWCpbpwEctLMGRcfzTx6Fer
 YVkCHMFYXYtelL3YbrHUl1IlpRqdBVpnnCpfzZjbkZwgcK0c8vnWf3LBeS0/nYtW+Nbk
 dkywSswrsj5o4zN2ypeISOwCVlI7FG0KR+3DrTJFJk164KHZjRgYo3kS7OrtHYifur5Y
 P33g==
X-Gm-Message-State: AOJu0YwtcVhKa11O7UmL9i08kTs2KSGuvbQCuiGjA1MtTr+L+lvh0nEL
 7kSbBkl9x9zj9vtto/OehaQrmw==
X-Received: by 2002:a5d:58d9:0:b0:31a:d344:38eb with SMTP id
 o25-20020a5d58d9000000b0031ad34438ebmr6621664wrf.45.1692702122703; 
 Tue, 22 Aug 2023 04:02:02 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 n16-20020adfe790000000b0030ae53550f5sm15380844wrm.51.2023.08.22.04.01.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 04:02:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH 4/6] target/sh4: Use hswap_i32() in SWAP.W opcode
Date: Tue, 22 Aug 2023 13:01:27 +0200
Message-ID: <20230822110129.41022-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822110129.41022-1-philmd@linaro.org>
References: <20230822110129.41022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4XlWtNyqZS4t

Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
introduced the generic hswap_i32(). Use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sh4/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 49c87d7a01..0f96a099b3 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -678,7 +678,7 @@ static void _decode_opc(DisasContext * ctx)
 	}
 	return;
     case 0x6009:		/* swap.w Rm,Rn */
-        tcg_gen_rotli_i32(REG(B11_8), REG(B7_4), 16);
+        tcg_gen_hswap_i32(REG(B11_8), REG(B7_4));
 	return;
     case 0x200d:		/* xtrct Rm,Rn */
 	{
-- 
2.41.0

