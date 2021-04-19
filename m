Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1503315lfb;
        Mon, 19 Apr 2021 13:54:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG5+TggGGVBsV4nteBFwROQPp/22VejoTLf/YvbK0NYBxkOCC8hox2WIdTwmQ8w69vSI15
X-Received: by 2002:a02:938c:: with SMTP id z12mr18094911jah.70.1618865691973;
        Mon, 19 Apr 2021 13:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618865691; cv=none;
        d=google.com; s=arc-20160816;
        b=MfDRwV8GzrMiBpY+LAI5d8355KKAyEQ8D3VOBQ/7cw2uaQtdxShbouaxqK9hH1Y4lI
         kjBvE+hXeOw6AubFIui9CldE8/LiEBBRR7VFEE1SyoPxIOKq//xc9CJmYY4NFRSKz0/U
         W/of2cj3uPTFOznH+i95IaLZB2JFiN9Kr0zma2RpKJeUqr6jeGgaBwduovFGkx85iGTg
         cnKyP2AJoi1pkzScLJR1YUwAG5qX9ED5Q2MFPuly4y+Y6TVdwvG/hAbH/JstsSbWVyLn
         C0+PoBcYbdKbsZEJNF2kUbSEcvJq383sTWGYL5/Kd6h9c4Nio0Vr55G38KjMZdAYEvIR
         li2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ani1RQARSJNMvdPCb6o+N5qGQXgFXuDUDDCdjTRmkaM=;
        b=oIfa0sg9lWp6O+aWpBepXKsDYsCs+EwalDgNEmgoYOFSzes8eMEOrP3KX/GnDZfNUm
         xFAoo/e2MzuP/sM7LuxoLVVRvydMU3FTCUU/lZgVkPjMzgo15PnOlaWYFZJCVGIKAtf/
         6amEV5OSp5eYxjMrspGEOMNINXmnXjUG04BVpoDqk0gCWxSE4Bl8YAhwUpt/gFoZW/cq
         dfIX/8ep5oJMf8m/psOmlE7VmqD6jheNN7M29BY1fz0NvWKspg7DnerlVM+7bpnh0IU0
         Co/TjDfGNf2Wp9OdzXOguo9smhGoxrOtyK7GKF6PAxE8DdX1aclORBuTv79o9J5lOLEw
         KfNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bCWHmY6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si174435jad.47.2021.04.19.13.54.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bCWHmY6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYaux-0008RS-8m
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQh-0007b1-IX
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:35 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQf-0002ef-Ve
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:35 -0400
Received: by mail-qk1-x72e.google.com with SMTP id o5so37219682qkb.0
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ani1RQARSJNMvdPCb6o+N5qGQXgFXuDUDDCdjTRmkaM=;
 b=bCWHmY6HN7l+ILbW31SeegtWX/pXmZ9QJfgIZfPlwIjL2+CPN7zWjNTXD0AyJJxmXU
 RyKsNMjDAd4WKGhI39f0UfYkfmlGYtko1+zqp+ki1LxTrF1owELJThCz7ZTWFgjk5kLa
 4xW8Vvk7SPGClrawJoraFsEQO74EI/SnfCL7sCr8yuTDFQT7aAlPbemX30Vnk7IE5JB+
 gCXoAJHvRveVo5jorD3UfGZsY1RCilbQreq6qt0kU2tddNF7lknv3pP9buTw78HrAckz
 M61uamVOCZrW0U1pFW65+fAL7BoxUf0+sfuvtj4zUIkBE8QSmhly4gvrlv4tzBHJNnCw
 MnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ani1RQARSJNMvdPCb6o+N5qGQXgFXuDUDDCdjTRmkaM=;
 b=oYDoZikJ+AeoML6LIY4Vd/CzZHgCCddQlmd2HymsGCnGkFXZhovZ/qUgOGxg6T80Iy
 ZzGVza1lrQlRg64lmMCP4qU72WD5o60K0XL5mzvhe0NWmkFxKTTn0Auqdal3gl4eXFsJ
 pibeqQ6N06HOb8Kgx2ynFEr/YCVRAMPvQ/6qsvP7cZpv/nvk8sC3EfossAqWmp5xdiao
 cCDf82C273qCFDgHusKYpwjxhjEA0+XjAHILxoyOTFEDGRfLZPv19Ioa47pfvik+axhF
 d0mBXyqvCFCbcpyV5vdmlk06Td+OfEQnF4YdWb21dciuqWdAmTblhpBf0ZM1HEcMBq8i
 sT2A==
X-Gm-Message-State: AOAM5332j+Lv0c4EfLtWW8rrJSJ1Vjk3RpD5y2ZotDL4gktphXKlEfDg
 lH18Yto3EbUO7ug7oF4kXvOzfg==
X-Received: by 2002:a05:620a:1323:: with SMTP id
 p3mr5105821qkj.367.1618863813133; 
 Mon, 19 Apr 2021 13:23:33 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/31] target/arm: Enforce alignment for RFE
Date: Mon, 19 Apr 2021 13:22:44 -0700
Message-Id: <20210419202257.161730-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WhZcghzwof1S

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f58ac4f018..2cdf58daa1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8341,10 +8341,10 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s), MO_UL | MO_ALIGN);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1

