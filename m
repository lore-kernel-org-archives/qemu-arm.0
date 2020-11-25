Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp155371lfb;
        Tue, 24 Nov 2020 20:10:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj1u0S/bFwWzZFA9DXOAwC1/3ycGpdCMWStJUY7OSkg8cA7x/erIlxlbVRIdwnBt6sskgs
X-Received: by 2002:a25:d2c8:: with SMTP id j191mr1526268ybg.367.1606277443934;
        Tue, 24 Nov 2020 20:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277443; cv=none;
        d=google.com; s=arc-20160816;
        b=qZUxQu+7WVBkeY+vwytA9P7wCkLJWWSfVi1fK4SYo/Hl5Y8rdztLfq8Dy7pQcSTfkd
         UDCkYJNYFoOYa/m2h4dCd0gwEhglrE29GaXMHtW2dfYhKT9T4XHtjG1S3e6BSnmuJz/K
         sDhO3xogXl/EZrjH9ABkWBx8kMvaKdrPQRu9+tnvldt4XxDUCOqSW/+Q1x5VS4N9np8I
         tPDPCJ0z0y3aHbMWTt8WIILVA0jpp0eoFvVVv6HCEzoolJkDkyJ+1Cma58pNUiRveJZq
         pU7LSDFsdzhrbkTqLj24W8o768VLpru0bv1us8vU/4G4KVQk7nYJfRs1O8OnEoQZ7nYz
         seOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f97D77kFtW+HRq202SBVTA2C2Bh99/g/k3cnzM7yNVs=;
        b=ZhtR2h1J36yPL1RHDS38Fv352AKM71z6KR1sZfiu8Xxde194Dm0RmT0/QWXCpXswW3
         UUdvuvdKKHGpb/jovhRiF1j/CAYUTwnAU2uox2vtAbX0G1VfQKz7wSpjS8RkorULOZL0
         6pbyXH1qVzR+473V181UEZKW4pzgxIt5Y5MYPvGpGFaUWyEaYmmqWBTFuKp1mWj5VHzx
         aTJQwHhbTe5w3cQA34aADNmAPLfTTHZWdRv+n3YvrKX65NytW5df61bOUBLNB++IlTGE
         eWUOVTdxjxoyUL0lwDEPMt1cGZgICM0QZo02DDTbdVGs5CNhIlctfn91CEC0UMAh3uem
         rCcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DV3kYu+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si979793ybe.6.2020.11.24.20.10.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:10:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DV3kYu+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm8h-000202-9t
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm54-0004z9-8g
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:58 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm52-00064P-E9
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:57 -0500
Received: by mail-pl1-x643.google.com with SMTP id b23so442303pls.11
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f97D77kFtW+HRq202SBVTA2C2Bh99/g/k3cnzM7yNVs=;
 b=DV3kYu+qBd+dgDvVz3rVr18hb2jU3aBK4pbAxcxG1O+f2bYJjleUeKirIXnuwKLSox
 cuA5+KLfPfSMBdUwdxfRKBR2/TLSuqeHk7fyhMysBZnD2N8qZmCb6tidWjnBwNmtVrNT
 fV1qUV8P/7kTSeuEsyVMHRO6t39VninK93moAY7BGFOevuVreJd+QVLpAX0iMOP1SCQ5
 5S/xwFVqZL3Q6cErtnml+POrpWfl+/nmCW+wpDGsWNwTZnHx8BGIRI1WIp9NxzAFxJgY
 kjq5heJTP2zFWagvZyGd3d6SL4mt6Nsrb5AvNSvZBZUe542bQlp0IM2KwG3uYdNTjGmv
 o9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f97D77kFtW+HRq202SBVTA2C2Bh99/g/k3cnzM7yNVs=;
 b=eigOxvIgq7l78twUh3zAqXNTZpZLQTpeOu1Zo5ycmx1FIKUi2fPk82i+EdYFopWGQ9
 jiddSR6V61AYugSaN1538K9XnOz3x/W+s839cl1TsIqdOgb/Ptp+NbAJOVIJIiz6PVQc
 owqNpOI2n6+2ckBOqc0rksLuv8HXF1CCx5jvDgVwWauPg8Vq6enjWoZVU48P8R03Bv45
 O22zH9zwA8silmnJosgl7eNFn/uq75bd7UM0qHwya0fNA5yPxsOD5kpwoqhCevZZQc8g
 abSmvt2D40nNABwNvpTb82OfcQ9NBSizNxk3U3t3WNb2q7p/zuq7nYXg+tbG0umZV5Ym
 gciw==
X-Gm-Message-State: AOAM532i+mwQbjVmMLSto2kAZN38F1JiQcgi9IhIl16vuwrOl59sTw0y
 m0V02byzGbx9uJk+93fIojikeUEeaAkNvQ==
X-Received: by 2002:a17:902:8d82:b029:d8:c5e8:9785 with SMTP id
 v2-20020a1709028d82b02900d8c5e89785mr1452546plo.5.1606277215199; 
 Tue, 24 Nov 2020 20:06:55 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] target/arm: Enforce alignment for VLD1 (all lanes)
Date: Tue, 24 Nov 2020 20:06:39 -0800
Message-Id: <20201125040642.2339476-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
X-TUID: AfQLjucyQl/R

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab..32e47331a5 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -518,6 +518,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     int reg, stride, vec_size;
     int vd = a->vd;
     int size = a->size;
+    MemOp mop = size | s->be_data | (a->a ? MO_ALIGN : 0);
     int nregs = a->n + 1;
     TCGv_i32 addr, tmp;
 
@@ -559,8 +560,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                        s->be_data | size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
-- 
2.25.1

