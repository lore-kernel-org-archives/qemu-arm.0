Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652554ejm;
        Wed, 3 May 2023 00:08:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55AznBk7DjWXumLKjcf8+7mxdQ/Wl/gq2y+GDe2MhUuYbB+wBWQnwood/afCoucGMkAOTZ
X-Received: by 2002:ac8:5ac3:0:b0:3f0:a108:863e with SMTP id d3-20020ac85ac3000000b003f0a108863emr32340161qtd.7.1683097727468;
        Wed, 03 May 2023 00:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097727; cv=none;
        d=google.com; s=arc-20160816;
        b=KGHVLK6x0Vd2FV4UqJRpvPbKdnhe3VToAPVYcj3utRDOwnhHtIa/yazlOUDZOBvH7O
         5mjJg7PiFDMnVfvpyBzdK5+1+Smzhq4gOSjAjgimujomsNt7Z9uFa/EQtUboNiR0+2E3
         FnpuhiNWLCDuNMVq3KZwjNLut46+8kFJKCEiRplRPFfecSNENS2yCjSXmftF07hs5eA+
         3/M9SL17EsBbr5ZiGeOnSCtqBTItZeBBYVozT3yXdY5Hi3+gz2RurzGYETZpVLVCFUGJ
         rciHKJRwelXy1eZeG15bB9KqmGPbCEzAcS2tnQcD1J9YNysOSDkKDdXwqEQHMr/2pJ0k
         uRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
        b=NoRjzy/FgjdR4wCHXW91PYdbBdp7lTx4aK1CW/CBrhkaEIqRrcg92FAPX1Re/93M+O
         zfAJGHiH9G53t2r5Hf595kAfI944on/CaCjk1cb/0+h4hgvrMI5Ml5z8nz7yOgs2VHD7
         CoouyR92ePVWHK3ljyJOIDzAwGF3KXT97X5CzBftvvnRkH0bLFPYa8MDhbf6c4ZFBPuU
         DsGJpBvLxqnu24D9BTPWGAdw4upuwQwiQSwvIMBg67Cpd1wuwC2YJHm7cEW8a5X+WjNX
         olf4EUzkSPeXMW8OZ4MpC/6eaxuSAiGvzLdAcyWYywVF/g7E7T2Sx6waJGktP6lSRtd3
         dLsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rmHQ/Lc8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ac85c07000000b003ef6db3ab11si13775833qti.736.2023.05.03.00.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rmHQ/Lc8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6V4-00087q-Ee; Wed, 03 May 2023 03:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UQ-0006Hu-2v
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UC-0003Da-Jo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:01:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso35345e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097270; x=1685689270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=rmHQ/Lc8SBsyqNr+x4FGgFYmaqoh631aZjTGxKoqX+FLErpESznVcWWH9pjP85ixeI
 4Y6Egsopn7GJOBiTP38Ct3UTIGcSezs0ub1efkEZ5eWJGTOo75vhZL5IJtwh1DzLia3o
 xY0BrRBtbVYYBfkiZdBxTwxkotoj34ONDx8XVAmm0VEGM5Ehmalk/sZQ/KSJvJWw3hAN
 eMTlni+qXTqgx83UxQ4cDTBaHjfUuKVktNDw2wK++cWi/KwWFN7mvQCzVj4dLBx8GxLA
 pXl24Qn8wNO7bFBwYm1uPQEuibKObbC0D5OaWlicGYN8FfsTFo8/OmYT94InBTPhkLmX
 LoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097270; x=1685689270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=W+E5iyFDfy88oUhfiB2VRz5YG6xT3OCPpnc0Wi5d2L6Ivv/BGypy4ygZ/g8BYw8hks
 aNzQwY/Gi+hJ2LIuHvFePgIKZlPpiKjUerPWf4ECEPNy0/1R36EBLmflIWfs+CShQNLr
 W8t64vNLL75tPQBKpqyrMqJyQbQNdXzsF0qdQJ3VAD/1F9on8l8PSey4CQo93wC8hUyW
 RASqHTMIsmnqAi8gkQI699kDMOHjs/XIy5B3HyIBNdsstizpTKeaQzdmvqaPo2WaXBoO
 cXAnYLn9v30zvKXI6L+nipf/bWoxfCnA6md8vmPp/8dQSG5xWiVGnEpaeIvteQ3dDEkG
 DXlA==
X-Gm-Message-State: AC+VfDyjHeyWUvTcrlzZY1LAEktd+9wu0IqLjajKBC4rWB45vdtOyeq+
 S/dHFZlBGMqtCTohzfkNT9UygvGjda8rOgRkoorAJw==
X-Received: by 2002:a1c:740f:0:b0:3f2:5641:3d4 with SMTP id
 p15-20020a1c740f000000b003f2564103d4mr13090886wmc.33.1683097269831; 
 Wed, 03 May 2023 00:01:09 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 51/54] tcg/ppc: Remove unused constraint J
Date: Wed,  3 May 2023 07:57:26 +0100
Message-Id: <20230503065729.1745843-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yoTe5+DDXRL0

Never used since its introduction.

Fixes: 3d582c6179c ("tcg-ppc64: Rearrange integer constant constraints")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 1 -
 tcg/ppc/tcg-target.c.inc     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 9dcbc3df50..094613cbcb 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -16,7 +16,6 @@ REGS('v', ALL_VECTOR_REGS)
  * CONST(letter, TCG_CT_CONST_* bit set)
  */
 CONST('I', TCG_CT_CONST_S16)
-CONST('J', TCG_CT_CONST_U16)
 CONST('M', TCG_CT_CONST_MONE)
 CONST('T', TCG_CT_CONST_S32)
 CONST('U', TCG_CT_CONST_U32)
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 5a4ec0470a..0a14c3e997 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -83,7 +83,6 @@
 #define SZR  (TCG_TARGET_REG_BITS / 8)
 
 #define TCG_CT_CONST_S16  0x100
-#define TCG_CT_CONST_U16  0x200
 #define TCG_CT_CONST_S32  0x400
 #define TCG_CT_CONST_U32  0x800
 #define TCG_CT_CONST_ZERO 0x1000
@@ -270,8 +269,6 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 
     if ((ct & TCG_CT_CONST_S16) && val == (int16_t)val) {
         return 1;
-    } else if ((ct & TCG_CT_CONST_U16) && val == (uint16_t)val) {
-        return 1;
     } else if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
         return 1;
     } else if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
-- 
2.34.1

