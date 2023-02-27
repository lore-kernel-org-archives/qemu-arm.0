Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4296479ejc;
        Sun, 26 Feb 2023 21:41:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9Xx4DssZpDICjmnblFJ4cLlh8G14qdji3QI6TDDiKfrqKSs7fCK+fLFtw7lHDrkkPQovBv
X-Received: by 2002:ac8:5a15:0:b0:3bf:d688:2a77 with SMTP id n21-20020ac85a15000000b003bfd6882a77mr5057040qta.64.1677476518629;
        Sun, 26 Feb 2023 21:41:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476518; cv=none;
        d=google.com; s=arc-20160816;
        b=yX+xDmB6Yyo7YHemeQ2/5ETq+giV/uMYJqEUTSZPI3rP9LAQ2EAv0oSs1nQjCS8y7c
         vJh2d/FGbsmVwaoPF0+JZ823cxxj1AJAjaB24jcFu70C73POIBZacYDCIgco8maveXYs
         /SLkkZR8yunsoHnMYtjWy+CJyjIMDyGTWOb9f4yqhocXSOT44t9RKdyMIeIlP2rvxhkl
         XoUh77XzMZhH1gtN4fa2ZViDIIjXrZvKA/Hh81mDZ1rPZ4rBLTMV9wB2TGdWam21lJd7
         HsyvKjWaVPaA7z6B088pq2dnF2+u+8rL8Gv9c3gT0jDjHxJXUNFn5XJ7XC9tSGQTi/oF
         vOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=f/E/huyIJ3zeG9oegc0VTE3ehSZZRH0MHyaySm9JZ4U=;
        b=nhwY9lqIJAGyrbvRPa/UbueFIjwKdmf/JtOW0imoTTjTTVxaSj7JJs+uQOPU285w3G
         VIOZoMyWw/79NhzccS8hRn/hJLasCDo/imJJ+RpO4peIWVMLz9mp62Esi5GbBvUlchFD
         5YwikF7PiBZQl17UCENGoxJSQK+Ou9wIdRHUsy3jPeWaIx1GAwFBevaiWe32nNmcUjiX
         Go0oEBqRYBnzSP+I1gi/JnvuQoxNV5ovzSrhiRUl2swC9Z+yY1WRwkrkhsg9LY6Rdi6l
         YIVxrxQ30RIBuQDVINGlg0Yh0KnNG6tpxglKgjLzNpmGhKGKTbBmVhUGcCsOsIKPJLWK
         0iJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wfIXVdcy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a05620a0e0f00b0073b841d3184si4894510qkm.314.2023.02.26.21.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:41:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wfIXVdcy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWE3-00076I-83; Mon, 27 Feb 2023 00:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD0-0003Mh-2a
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:08 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCs-0002mT-BD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:54 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso10984577pjv.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/E/huyIJ3zeG9oegc0VTE3ehSZZRH0MHyaySm9JZ4U=;
 b=wfIXVdcy70d50AJvoNeSZkD9nTBY/dvJA88SYIzmDOM2uLGHP7GqSrhDIXSe1SOmmY
 gLj/IyWC3Y7K1zjzHWUKAiFTuwUdD/6YOrf2wgCQf8gyEH9nTLgGWL85P/eOcYB6Ganm
 BYZp9d+MEelf7muHrlG9acUwCuHT9QMPKzaKtl35W9Tiz1CHmwqND9DCeXCyhNGk3LuJ
 u8jsqzq1M+RCHG9eIvkQB/fwXHcbYuCZM+4LV8Jov+8/g9RpBE/PNMP2Tk+a6DapVmJX
 IJkVgge+DvtSX6vOKoSOCR3dsberg7lsTmm0zzE2f5WA3gQ7CwUOu4pTHT4EMsfPZqw6
 msYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/E/huyIJ3zeG9oegc0VTE3ehSZZRH0MHyaySm9JZ4U=;
 b=Akud9449h0E/PmRYSbgCvpaoPqso2h3ndrpE/umJv8c1lVwSSjNFE6Tm8i7bwoZIUl
 4NssjGdbQHSDEnTMzxFPhhusWj2Peh8A+lzBP6HdO7bZh8C9xeAEf/AxMB9rkiTrPjZ7
 xXAsacXfWw/lEUYGbiSrt0v5B2cqqza2Z9SE1pDzw1fwLNrlyTUPGGQOfvrmRFGHY/Qg
 EKYyx0JM/DwEAGD8UsAe9qZ93aY20fMAswfvfGBUjzTxqLRQPwgR2SCxFhtmSKOog3rA
 o7N/H1uGo2ltoqJC6Lqg50oRfLa9FRt1wwy+0ptpPtzIpK2NL9sDut9G9sQwM9MAnG1W
 Oj4g==
X-Gm-Message-State: AO0yUKUaqwhTWrfA7LrqttSGp3ALqqQfek+sX7ykJGzmZpVRVq8oEi8s
 KiOOrYAlxZpwV+D4LzDl3JJQqadmPjEniXron4k=
X-Received: by 2002:a05:6a20:6987:b0:cc:1f10:1130 with SMTP id
 t7-20020a056a20698700b000cc1f101130mr17192427pzk.62.1677476265102; 
 Sun, 26 Feb 2023 21:37:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 14/31] tcg: Use tcg_constant_ptr in do_dup
Date: Sun, 26 Feb 2023 19:36:44 -1000
Message-Id: <20230227053701.368744-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: nb1MC1ywIUKT

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index a10d406bba..877b0b659b 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -630,7 +630,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
      * stores through to memset.
      */
     if (oprsz == maxsz && vece == MO_8) {
-        TCGv_ptr t_size = tcg_const_ptr(oprsz);
+        TCGv_ptr t_size = tcg_constant_ptr(oprsz);
         TCGv_i32 t_val;
 
         if (in_32) {
@@ -646,7 +646,6 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         if (in_64) {
             tcg_temp_free_i32(t_val);
         }
-        tcg_temp_free_ptr(t_size);
         tcg_temp_free_ptr(t_ptr);
         return;
     }
-- 
2.34.1

