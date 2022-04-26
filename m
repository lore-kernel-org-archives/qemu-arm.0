Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp369177lfu;
        Tue, 26 Apr 2022 09:52:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3OccapWM0pZ2Qat3WSWhK46HT4IISwRvRKzFkiG96kG8LxUgjCsORn7ku61S3Rob8CHXh
X-Received: by 2002:a25:950:0:b0:648:ba7a:b98d with SMTP id u16-20020a250950000000b00648ba7ab98dmr2509929ybm.42.1650991937486;
        Tue, 26 Apr 2022 09:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991937; cv=none;
        d=google.com; s=arc-20160816;
        b=wXXa9E06dsM5r5pnqzLVchfdOTLOkE0zb8MDe/zEXpXtffOF0mDasyZYwc9+Hzh6yX
         XQMNA5m4lktcSh0WP10oFe5N+/vwqRjfYna3bOSSKFH9/ts63q5XIdeBK3d3+39Q+Mpu
         b3Xnw/GB9x08xp4w8OpDPIhuhDmw6iK0UqcJrgiudkpEOqpOevJv7IY52L1X1G16ETGT
         OjXBbGIWZpmXf+xZt3ch+bauqudFufoiDl3swcez25iXd7W+S2Jb+NThLZKXI7mYaLeh
         aXTv4io1TZFatGH03loC7rnH/l2/oUnKEdUJI48hQZnXMuMdgpzLob6EmmlWtb9nX96O
         a3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fMavBc3LF21tCnxOFcQlctg5X2JRkGnD8DmWT3QUZyQ=;
        b=kGOHwA2a5QzIB4Mb/RP7zNFD5n0ep0H31w+ByuEb323i95XRO0nQLIJSkcB3vsyo/x
         OrV9WmFJfIkKQym+ZRH5YxctBTD7Dh7xTX86HJwAXQqaA1UKJ93IHdGY02gYraUuOEpf
         W/u3/JE+iSqUIh23PwEBRY2at4w67L2XqJ9Kv2238uLKv+Eble6ncLIEWHO0c3CsplkV
         kuETPlFRWy0y0sS3l4pgzUClStytkuHtTvuEhon6dPoAKJhKUiKuQIjjEfRTeLMx9fJ+
         TqjBFjrJQLJefgYy2FXd2glz/f6ZfvFah7xAQ4qeR5wQmWhDfxYUcG47vayLJ6ifo5JJ
         +6fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zLjTevTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a252d42000000b0064868835913si5463674ybe.551.2022.04.26.09.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zLjTevTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOQC-0003NY-T3
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035U-4T
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5o-0003tj-0u
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:16 -0400
Received: by mail-pl1-x636.google.com with SMTP id c12so30706502plr.6
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fMavBc3LF21tCnxOFcQlctg5X2JRkGnD8DmWT3QUZyQ=;
 b=zLjTevTuMnYWbGWfGVz/nBpNq5yFNxWZVgnbOD1hlyp0pKY3BtAYRAH2A5AHt2Luj3
 84yKibNnMFf4RCcUhPVeNjm04Ci4BJrHy4m7l056L4v82oX5YYHQgyDGknYYw82LPsEa
 Xxru9DKTuPB6/RuBiLjZDkQcI4pELyL1IUAIB+11o5EOIdIkQzigrv7nAKolQfW9+KcY
 MaBrNYUvB3l8qpBvD2au8dK1+KJv4xU2rEDTiq9IsV37OMh7CWYjZHErG9zmf8Qx96Hr
 UGHspLuWV0x5ic6OSbSLk+fJPt7TNTGbSRn8NZ4eVFyY2KDbcNfePwnljtpKHCZwDG4Y
 KpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fMavBc3LF21tCnxOFcQlctg5X2JRkGnD8DmWT3QUZyQ=;
 b=tEzo7ktZfDy6HdOAL1h4/2KyBRU+V1+khDHXACC1jbFuM5tV3PxyUBL16H5bn8/oVS
 ykEoq9qZPB1KNjEPbhv3ObKbq+pa3VoioLUANy3p0ph91blfcHQ0bJ64iJxsA2riC1on
 aHNzkQqmNKCzKj39jqJCkAec41j755I5MLckPb2RpnFArYyMH2A0c6iDfkGAFR1ZFmAH
 YRQZK6SUdGhi1c8rXMHDLvlnCjQWc+1Of3oq+OB0DHJ8DCHl9JH4aOGG4AdOf7cRgiLg
 z19W00Djnlx4YqEhlKa3EPCcn2GgplGb3Br3WzJMEzf/IksQ//PhFim2GHL5AECZA+A/
 eGRQ==
X-Gm-Message-State: AOAM532BkGjjfPEcewTo8WehCz7J+Ny/9/9ai17MGDXnimH9t6JDY+YK
 REd4qNP80hTkYk3SKGRzgkQLYwOn1I+ziA==
X-Received: by 2002:a17:90b:33c6:b0:1d7:b80e:7877 with SMTP id
 lk6-20020a17090b33c600b001d7b80e7877mr26982055pjb.121.1650990670728; 
 Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/47] target/arm: Use tcg_constant for op_s_{rri,rxi}_rot
Date: Tue, 26 Apr 2022 09:30:24 -0700
Message-Id: <20220426163043.100432-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C5n2cACLKXGw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8476f259fc..223fd5fdfe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5495,18 +5495,16 @@ static bool op_s_rri_rot(DisasContext *s, arg_s_rri_rot *a,
                          void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32),
                          int logic_cc, StoreRegKind kind)
 {
-    TCGv_i32 tmp1, tmp2;
+    TCGv_i32 tmp1;
     uint32_t imm;
 
     imm = ror32(a->imm, a->rot);
     if (logic_cc && a->rot) {
         tcg_gen_movi_i32(cpu_CF, imm >> 31);
     }
-    tmp2 = tcg_const_i32(imm);
     tmp1 = load_reg(s, a->rn);
 
-    gen(tmp1, tmp1, tmp2);
-    tcg_temp_free_i32(tmp2);
+    gen(tmp1, tmp1, tcg_constant_i32(imm));
 
     if (logic_cc) {
         gen_logic_CC(tmp1);
@@ -5525,9 +5523,10 @@ static bool op_s_rxi_rot(DisasContext *s, arg_s_rri_rot *a,
     if (logic_cc && a->rot) {
         tcg_gen_movi_i32(cpu_CF, imm >> 31);
     }
-    tmp = tcg_const_i32(imm);
 
-    gen(tmp, tmp);
+    tmp = tcg_temp_new_i32();
+    gen(tmp, tcg_constant_i32(imm));
+
     if (logic_cc) {
         gen_logic_CC(tmp);
     }
-- 
2.34.1

