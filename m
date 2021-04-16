Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp657415lfr;
        Fri, 16 Apr 2021 12:12:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmobGHyfXqBlEU9rtnIanAchNKVUiOFfvkd7X+iq2KMDZ7JAb17xb9L7+HFPjwcZxUuHbp
X-Received: by 2002:aca:dcc6:: with SMTP id t189mr7504966oig.9.1618600358209;
        Fri, 16 Apr 2021 12:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600358; cv=none;
        d=google.com; s=arc-20160816;
        b=h1/eWw1Tv3GaX0RZ5TtkOtGEWd8uxF2hrxIFmZ7dwwxTZPJ8oy4E7s/EIk4H4jwbfd
         D1A/+AYxB2PhfsvRol0GwoCGnVMZDNIGDCGnGhC8/3rh/+91MMbitUnMG1W1pZxW8fFy
         jLL/vHsWDXIc+6bS6/KXuCI8jI3/8wsUJSBAwYtHx8M+yQcXx6gJu3tF5npEMOi8fKou
         j5L+sezNHs9hGxwWrLMkuAZJW8lZmN8ET9fmUhVfAfxAr0f+3eby6cwEU+40AYyYBA0f
         29XuQhGzeZqR1jpwfkVHHnKMAtu2Pr6R8tTEIpszOlaBpyfbBcUTbX8B/6BukXEuU3ab
         Q70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
        b=lcfmbwyGA5Wyho2/YrA73QjoT0VjwbGF62eJaJZX4ek++kS1d//sc63ZHyoxrusG34
         si7W4EpF7i5M4o9JatGhhsqUL2UywawI5cjnuBECwJRa2hfMrvPzQ76cIh0W6ODDrRsa
         z4p7CpNdzzCIVRcu3QtmtigDoIGBPtGGaVhwt6OgWMWBuviqo825xJID+oMA7nmaRES9
         E7rd3meurKZJ5gqQ06CScl/MwYaQqqrZborzzUO3ArfKT6okIZj1zcrR+ox1x3Hl6Ojn
         oposbpTeuwTGlABJ/BAaXmunYqu1pQtqCqvTS5519GjWzguOvJMkdKckh/+W2kJ/IDaa
         9VzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B4LOV82q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si7032281ood.72.2021.04.16.12.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B4LOV82q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTtN-0001R1-Es
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThp-0003vo-Oh
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:41 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThW-0004Qc-Bf
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:41 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d124so18912335pfa.13
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
 b=B4LOV82qPNJQsvpB5aw3HxiFRhYA6LA0K602UhIr5GiIbz0d90mOgkhb5OKP/SIFSB
 JRnCHhjyTUAILmJg0vykBFbls9DSYb/nX+cGPQuuoOJwT4/c5BPOBGEb0iD7sbmjYaP0
 Dx/tuIr8L41575PnlTnGp6Rdru0I5jbiWz8fRxwW8Cyt1RqXQ3H6QFesIwIHmADThznz
 yJ1I/B5zPwFABrrZwQh/irdhGYn9HRWMsKFCHCeT0tPu7EKe5bXZ9+GmGezOjGUSji1E
 emJ0bCT0hWs/L0x0bjOhSXUf0Ow9wF37CZTPB4agvV8PXaSST8cOEbs52uzOoAqV5XLW
 JFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPy6lM+lGGlDdnIcWgrCcXPOg/hgKZHwQM+u/2SzIUE=;
 b=f/55OL8nFJ3GkrRBdKpGrzASHYj85PMswQxUGmJHxu9bir/BB8Ppr0MpTbFcAJbw4F
 kzgex5VAN4hcTafSRwH1gZzT1VMekOQynB0TUGM9dRvtnQeXeSLVmRH2YwU6qI8n0MeZ
 FqSxXLbnJAqtSszMKM6XgfScFdWXJlxpTpF9heqUKoh2iDnrJtKNY9g63FzYucFBqv2A
 qtPEmTo6RDbXubGYGhl6pA0Shsr/DmZOz1c0Bkprd6bkKeKCKNdzvoFHUBNbeOtyMNTC
 77aoGUntc+MxGBdil3oZne933rJivFFPlEIRcrCRxe1G8lE7yKKGEKZNph8Bk06yFmMp
 Uofw==
X-Gm-Message-State: AOAM533ydrNUw5TiMGsZEMm/12qxDz3yBI8mz8rYnG7opSPr24HdAx25
 8p/viVgb4yBl3sKdg93vfCDMIw==
X-Received: by 2002:a63:cd01:: with SMTP id i1mr495292pgg.262.1618599620607;
 Fri, 16 Apr 2021 12:00:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/30] target/arm: Enforce alignment for VLDR/VSTR
Date: Fri, 16 Apr 2021 11:59:49 -0700
Message-Id: <20210416185959.1520974-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: 60i0VOrOKplL

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f50afb23e7..e20d9c7ba6 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1364,11 +1364,11 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1398,11 +1398,11 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1439,11 +1439,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1

