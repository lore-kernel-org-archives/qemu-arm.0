Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2390308ejb;
        Tue, 30 May 2023 12:14:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5a9uJEb80Lkla5oMOIfcn1/RVn3UMOmSLf3+M/Ct3Nuy/jVIugVIFLUMZysrI6kq+nbpM4
X-Received: by 2002:a05:620a:6082:b0:75b:23a1:424 with SMTP id dx2-20020a05620a608200b0075b23a10424mr3202015qkb.58.1685474095790;
        Tue, 30 May 2023 12:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474095; cv=none;
        d=google.com; s=arc-20160816;
        b=R5MpzWNJw8E28zWou3C7PVoPjTTkGPS1iGjVCJrIsnfU+i8rheLPYfxFat6dblqLq0
         By/fxW2l9RBSYhgAHCE8l5IcfVXIg8bPS31ZJNVoYSHz8U5/iEWfreB8RWl390cxUOKx
         FZDxtO2/dET0iyktcqgeiqq/uE996csefuMLxI4bwRPnpg+AtLOt89ceTfbW1GB3qzEd
         zpeL1169GkUxj30t1oC/5UPqWaGpMiB1iHkkUekH8S+H1RgGNMLY6h1b4Vdn1ae9DL+l
         bdLSPkRSEv3QO3rxIOpSBey8SCPqXkfZ550E6//8XeehcRKsGHmWNHTi0Rp+/TCdeKzL
         xF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v9ZiT6iOGzF/qLv4FneWlWxT5JuhvBvbdJMyfzS4B+I=;
        b=a3jJKcAU6z3lKpY4NKIfEas9LmA85B8mrHPtBrg9wlLdI6iVYqowZ9GFZuHibIK1TI
         aJRaAgKv9UMhjqwxDx1409AfmAQSvokpP+WTcSNjBQFmDKMHKx9GEtpWrW/lXtFgG7Rb
         VywpdnlTRJR6G8eLIryjtOjCBbyk4tPEVf5EUZ0KGjRtMUVJl5qHNSog+B4XPe4A5XHR
         rdZINSkRZlMQ8II1tfQhGWECAkNF//guFA+fO7PheyAcRUjez9lm/q7xbbO8hVsU82dD
         85IWqjDdpbJ73lSfCe/es0IAGhtxRz3oQUg5Dec6poazLrGfOXeLPK1qpX5fixzFiA3/
         cCvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jh1E650B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020a05620a12b100b0074e0d0cd485si3571920qki.542.2023.05.30.12.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jh1E650B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44ny-00068t-8Y; Tue, 30 May 2023 15:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44ns-0005xf-4R
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:44 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44np-0004bT-KE
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:43 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d426e63baso5445637b3a.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474080; x=1688066080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9ZiT6iOGzF/qLv4FneWlWxT5JuhvBvbdJMyfzS4B+I=;
 b=Jh1E650B8MIKTHMoZhkaJOIV6uycReeoe/IoFyZjyvZl1+XrJuohpMReoZ90V43AO/
 CrPEuTBO+GjCWIxjwiMixx/C9qfSGnWI25Y2UBp7K5xBPlNZcR/0wDDlOcaoXwF+iSd5
 hVPxpnAId+SQGwGUVa6/nCGLM0ggVgZSG8BSw2IZ1Wb6h6qDvd7pPmD6ZOEGuyTNbZ3T
 dlUDFjiGf6mulsKcDWJ+UoKkoKpCm8I5hqxxSE/c8hIXlxzJ0A4j+xqqlxXZQtSH0Vxk
 ndWMcnS5976f7jQeeGpEFfyflnqU6pZEoe3UhIhgvKXuqNEoeWUJQ2DZa65eSPELVNgw
 zqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474080; x=1688066080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v9ZiT6iOGzF/qLv4FneWlWxT5JuhvBvbdJMyfzS4B+I=;
 b=Bt1DEsOz+TqMM7e63e9j44Ll9b7YTQjQqjQj/LvLsSOyVgmE6zp5fQxDkd6TsePyx7
 4b45bLX1cW2n28GN3eiO6lu+M7yI4JLv1r0XYKpav0i+zKDy8gf8bTyOoJm9dC+sjQvf
 5P+lZZRya7vqZMH9NXyqMboMIGz3mXdiCTu+PHG73gW3EeGwZg71T7NZ1/H9N0Ff3/Wq
 WxdNidulbUQgyAZge5KQfJ4ss6xkw8nbG335mRzRV1ak1byzwpEEPT8OeXFcgVDx0O9b
 mguBHn3irrjxxsABdE+zh2HGhQaZ04S0CvotOq3WJkfvEjM/xJmsjMnR5+6kwliSZWjf
 Zyow==
X-Gm-Message-State: AC+VfDx7Qdt+nQY0jyFTvPlgSIaONSBSiqwRtZh4IK/HWX8SbG2oSHB2
 cJo9GZ+mW3NkiiSnhqOxjjjUsQ==
X-Received: by 2002:a05:6a20:2d0f:b0:10f:5fc:80d5 with SMTP id
 g15-20020a056a202d0f00b0010f05fc80d5mr3420801pzl.35.1685474080320; 
 Tue, 30 May 2023 12:14:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 01/20] target/arm: Add commentary for
 CPUARMState.exclusive_high
Date: Tue, 30 May 2023 12:14:19 -0700
Message-Id: <20230530191438.411344-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DBuatArabnLb

Document the meaning of exclusive_high in a big-endian context,
and why we can't change it now.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d469a2637b..81c0df9c25 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -677,8 +677,16 @@ typedef struct CPUArchState {
         uint64_t zcr_el[4];   /* ZCR_EL[1-3] */
         uint64_t smcr_el[4];  /* SMCR_EL[1-3] */
     } vfp;
+
     uint64_t exclusive_addr;
     uint64_t exclusive_val;
+    /*
+     * Contains the 'val' for the second 64-bit register of LDXP, which comes
+     * from the higher address, not the high part of a complete 128-bit value.
+     * In some ways it might be more convenient to record the exclusive value
+     * as the low and high halves of a 128 bit data value, but the current
+     * semantics of these fields are baked into the migration format.
+     */
     uint64_t exclusive_high;
 
     /* iwMMXt coprocessor state.  */
-- 
2.34.1

