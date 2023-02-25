Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2638780ejc;
        Sat, 25 Feb 2023 01:22:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+87Y62/xMzlkHTq1wD3m2HbNfg03SaSGd3DCTa7D8Rlb2pnoU8+KimqsezHN0GWGOsX8MH
X-Received: by 2002:a05:6214:19c7:b0:56e:b1d2:9c39 with SMTP id j7-20020a05621419c700b0056eb1d29c39mr35254453qvc.15.1677316968812;
        Sat, 25 Feb 2023 01:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316968; cv=none;
        d=google.com; s=arc-20160816;
        b=tgq8d8cpz7xh0Hh5C2/nAcJc/7jzWjc2D8ZY60sr5QYRHrfpc0nUrbdUto3BV7L3t6
         oUgkBkPTDPbJpHVJ4rJr4Nf8HdvU18nj+Ukv6PV/752rokVB0Le3IvAQVd6kdgsktTWb
         WNcNMwf8HZOygZymBIFVG2MmNJrRm2nsK/8BNPEWuf8wXujN5PA8uCh81uaOcB2uKhLJ
         cVZhHKUfHn0BFsP+QmcSn2zk2SdMcVFedaywVT8EbFywej5Lvi4P4KTng2wRZ9bu1+0m
         1qfJbOCpSSBIoFfBTqkEg+ZdCW3zWb3YJBOH0YqvXgCK0CQtxms5MblmIE7k9L3FWKkJ
         km9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
        b=Q/sELIowiCb+hkGl2WJ5lGFpUT14iUYIJKkUosrl6ImYaV1puZc57ZO/abLwfpIMnb
         4MPEHbRSpfQZXjQLXtwoPRSBlynnMVbW3pxcTTzbGfr32sYwIcf5xtOIYTzlDU5eeYE+
         ABCUGSgMHsaKnudd36q94v4HhLG6HAhay9pzwurKX049KULmdUXcw8vCLi8yWSkZ2Y7l
         4nal41UNlL4tkDmDike+sdnUg0y9QX+vm+URKw1z5RwfnzXz65l/6tHU2vjq3LvnjKyE
         GnuTFcWwyEMIySBjVTeSEhpShye8DJLJVY+U59uGiQo1VHxld5FExJBsj0eVxwUuW85X
         +dmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oObm07HL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020a05620a40c800b00730749b412fsi1454248qko.612.2023.02.25.01.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:22:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oObm07HL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqjw-0000dm-Hs; Sat, 25 Feb 2023 04:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjL-0006UC-5k
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:38 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjF-0002vk-8Q
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:33 -0500
Received: by mail-pj1-x1036.google.com with SMTP id u10so1411059pjc.5
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
 b=oObm07HLe0yPe+9NJ552EyEZEPBwOkuHr1qMlXiZPq1Ir0BaIwh1VcSD7V1+o9gAbZ
 vqLadV5MXa4tK1yv5gVAEgm+OSpfyHVeouuhL9mGWBlnDj8y5AP4laxFfqRccx2qtkD6
 8fznehzPJGgGVAmeLLMCS/EG6DaTA1Vq4oUKQw4VkDTc/7Nvt4SX2pMoJJgeej35fj+2
 kQ+QkBsbG6/hk07/gdxNPFGA2Clrn4Woi9rSw3iWikFNuj/u/IXztgrZgZFfbrv+0x/U
 78HSw/+zPpcS/y5BuM1s4Efr15qk8RFyY2AE5tS6rkU0MK5Q6yTQSgvIng+BPafh2leB
 yvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
 b=pMybxtdh4MT6EYgJDSGfBy/+VGgCbqZP5dYrbxxUD/SEGB0RKqrugy6qePcndm+yjj
 GNFs7JoCiVpjAA0wGC0tBFY8GsHpTrlLQVhYpaTRaCZbb+VT4sm50996PG4oOKRg0ThR
 gT6DiWkgD+DVKdUTPWgeBZjRGh3ldbNmNZ3ImbQuJKQh/m08Br0IQ1tYOAmOGpHimDN9
 URn5g32GqzD7E1ffCoh6lL8mowZ/Uddxy8MXj31wyXdzb7Q4jH7NVGoJnmZLBTQOSNLw
 9sUHQ69/yVVKu0C7LyBBFsaIJxewN2rkwb6NOwMs7n+UXvrEpQzPVd65/xC6rP3v3kOl
 AzTg==
X-Gm-Message-State: AO0yUKUm2Tf2yuFlHE1cAnj8/b2MZIqu3PqTuEhXaAt2Xl+pI+psUJ8y
 Yw+lang83vo8Ti5RSqCXt4HkKA==
X-Received: by 2002:a05:6a20:8402:b0:cc:39c5:1232 with SMTP id
 c2-20020a056a20840200b000cc39c51232mr9063368pzd.51.1677316827364; 
 Sat, 25 Feb 2023 01:20:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 67/76] target/sparc: Remove egress label in disas_sparc_context
Date: Fri, 24 Feb 2023 23:14:18 -1000
Message-Id: <20230225091427.1817156-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: yhlu0oBJ9+Wc

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bdf464f802..560fb32e28 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5727,32 +5727,31 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
         dc->npc = dc->npc + 4;
     }
  jmp_insn:
-    goto egress;
+    return;
  illegal_insn:
     gen_exception(dc, TT_ILL_INSN);
-    goto egress;
+    return;
  unimp_flush:
     gen_exception(dc, TT_UNIMP_FLUSH);
-    goto egress;
+    return;
 #if !defined(CONFIG_USER_ONLY)
  priv_insn:
     gen_exception(dc, TT_PRIV_INSN);
-    goto egress;
+    return;
 #endif
  nfpu_insn:
     gen_op_fpexception_im(dc, FSR_FTT_UNIMPFPOP);
-    goto egress;
+    return;
 #if !defined(CONFIG_USER_ONLY) && !defined(TARGET_SPARC64)
  nfq_insn:
     gen_op_fpexception_im(dc, FSR_FTT_SEQ_ERROR);
-    goto egress;
+    return;
 #endif
 #ifndef TARGET_SPARC64
  ncp_insn:
     gen_exception(dc, TT_NCP_INSN);
-    goto egress;
+    return;
 #endif
- egress:;
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1

