Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4298697ejc;
        Sun, 26 Feb 2023 21:45:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+RfDrUVOTVT4bfEgEgTMtQkp2hRAaKSiAqtXgyqPH4i8XLVNRNEdjoztdE0sTwmTWCM8QJ
X-Received: by 2002:ac8:5f4f:0:b0:3bb:7603:d68e with SMTP id y15-20020ac85f4f000000b003bb7603d68emr30491502qta.10.1677476757834;
        Sun, 26 Feb 2023 21:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476757; cv=none;
        d=google.com; s=arc-20160816;
        b=uPzTcDk90ZaAJZZbgMZRw1ssqZDsCOgwN5kkMdGguF3xXyDzayTG9bUIQG+PtAqfIc
         CENKB2fGI9dHbegr8RTtLYwAogd8y12d6+K9cMSTYSI/5Ejg/A9Vt0zeYOFVDnWTUi6T
         SkoQcUnE0bjzHUVUBYTBEeffljUipYdDOLtzGLV4sSnd5OBNtZ2zPCOoFiX+ursrvf/H
         D78LU84pqFZWEzxsetr5SzqepBy13XnLeE+aJYCc905FMNzjE2GuzuV6/acLa9KJV+ne
         9Oup8GCGuAj/aDAUJS7wx+8gWFj+yZELZI97Imd0ZJDCGJnkgkl+1L2gJ+bmIf/jkLxl
         ob3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
        b=KEesWGdyI4ulpADAuxnMBx8eVd3Ti6d1uqJJgR9zKsEANCigNXKdr/S4JAzUTZYuuI
         2wnWltPMtTtC5Zc1ckzE9B7URgfNqBVcQsXeTumfIv6VOVwzKTjqTXV1XrjNTkvyZOz/
         3L5MXh1hoF0gKLEKwDfY7Khc6kW/QgVDMmhtrEYweW1uX0LxXSR3W9I9ixkhY86pYEJj
         5nVHPCupln8B8m3dYKn3Yc7oujaFQPYplKnR/4mNE2rxpGyZBwza9BidFlIOy8iIkyhh
         CWWiiO0yH4OSPtyhZWxeTnbh1C1ZYy/FLvT+K7Ecu0xiHlf2+mJf5fcRh0N60ClD5wtX
         yTSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhcOvwwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a280800b007250f6f7202si6380086qkp.209.2023.02.26.21.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:45:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhcOvwwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW84-0003pe-24; Mon, 27 Feb 2023 00:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6a-0006wC-MU
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:31:20 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6Y-0000R3-Rx
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:31:20 -0500
Received: by mail-pj1-x1030.google.com with SMTP id oj5so898209pjb.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
 b=YhcOvwwbiX6cL1Sdo+8L9MSukEeppnPOyBa4IG5upsnYugKpfhDtmgulzQPyY08alC
 t+J8F+gaWMN50jyk51AkkEUvsN9IU9Ei2o7SF1AwngIp5nMXBeMJJflAFpebcQaTxYmL
 GUdKqM8tCNjMt49RWemQpVo73gRTLcePqpuhvUofW/q/ROIynWBU+AeaTbkOq7PDbxCW
 R3lA6lQQeo86L8gbudXyW7xQzxwEGriwlCisYIrR/AFE8d/oFddZXPhDAHmOTFn7MY2a
 FfWnC0wvlHq89P047NAaUaBwGZ7thI82zdISSvboxOciZg4PBHFaQCEHFtBUaxlbgSxa
 W4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
 b=d61A/a7T35a9EPk6OG+jz6oOLorR9SZW0sV6x9FQO0GRulNGN+SNGqa7Far8bJ5RNs
 +XQGZTqOUzegtZRUr2yf1IsEPcLUDWFPZO2lBAqWdHqDM0KvHEwbYzfvu9Z6FZF4Dfys
 NLoG7ZFjMlpOyR4+XC75mVM++VIZOdz7n4FQllGYPMOHG49rcYjlcN1ZldGXHSrIIttX
 /WIg2DtTgeOI3ARQos3BakJy1dDuaZLuSj51l2hslBszO8mSBoGmOcGKPO72jDpcA83e
 mWVPuGNx7IHovRO7VbroAMLF1gKnY6NfrZkhCoQOAuvKgxOzqhffWPxDwvqc/eIcJ8L8
 9fVA==
X-Gm-Message-State: AO0yUKX/JpzWzWp6XPch2MUVZu43VdZRFb/gQEsJ3IanTmcuDaBeJ2dN
 U43wUnbMXu2UjHSf/RBXRGUtDQ==
X-Received: by 2002:a17:90b:4d8a:b0:237:d5de:5e68 with SMTP id
 oj10-20020a17090b4d8a00b00237d5de5e68mr5558160pjb.49.1677475878019; 
 Sun, 26 Feb 2023 21:31:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 67/76] target/sparc: Remove egress label in
 disas_sparc_context
Date: Sun, 26 Feb 2023 19:24:56 -1000
Message-Id: <20230227052505.352889-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: MpBDLlM+VmiA

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

