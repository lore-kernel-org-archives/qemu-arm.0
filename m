Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1019791ejc;
        Mon, 22 Aug 2022 09:44:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7xRS7hqx7NsVibVKywNyTBIB8LIIBZnHUH5Z05syzcqLBwFwzEQ3ffSaZ7b5QGbugwXtCF
X-Received: by 2002:a05:622a:1a9e:b0:342:f7a9:a13a with SMTP id s30-20020a05622a1a9e00b00342f7a9a13amr15531215qtc.609.1661186675624;
        Mon, 22 Aug 2022 09:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661186675; cv=none;
        d=google.com; s=arc-20160816;
        b=xdYu2DxfVNOR1tHxg1y+0S9YGDSFqsYLcrHrYHosRxgt0xAZCw0RpREPk9jctSOZM6
         6SUyYJ2/hiVVfx6wz3/2Op7c6uuoM/hmxCtT4Az3OZOaFuJ4yPFG2xFqMETBz2Nlqdg7
         ylBTjvGVDGmh3Wyvs6Udn3uvNwkut5/16eFJpYdnyud6FWE572y3qNfJkFNi3gLP2Fu4
         UyQx/WvA21ZsJN40ndRMPDx6D8Tg8ujHZRvvkADaHqr4xNPYttDxeB68UqNn+8hYZsn7
         1+ETmq4IuAVFBRCLhB9JIcoHY/RXQBQutRtR5YWFsvFhndTfsQNgUyr5ksUtR5YbIGih
         GxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mlHd+wwiv8pBaZCez3yDRMnKt1mN27booBhwkoA66eA=;
        b=qyD5mL7lHk5mUEq/Nn5jPXr8MGlFL3o+6CuhjH2l/QA46cYXyqbEXKjunJDA7EqZJm
         GEkGqY7/NNOFLL7vnMAZLdOkQQlanD4Sgl7P2OJ9ZjtGubBLvBzN8IrNmCNLOVo0Zt6w
         EW9CJXtEu7ILT7NcTLoS1byiEyXrBvKL+4bIJT1mZEZ2IveX4Cy9T+FJ36/2LGiFlOm/
         TcTdVtkJRMcy5lMQ284P0qNCV2zp1iBYNI0Z3It9u5UlppbjQkmZF6Ne2hWF2sH5hEur
         0Q2ghAbZnS1m+RxL2kgNfhfU5n5Ys35wci5IYi0SDCcCgbThqAv+TL3F2zGO8ftys2tP
         dbjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EL0IBj80;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a449600b006b960844aa9si5992706qkp.467.2022.08.22.09.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:44:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EL0IBj80;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQAXT-0006iE-4m
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ol-0004gR-Dh
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:34 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Og-0001cn-BK
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:30 -0400
Received: by mail-pj1-x102b.google.com with SMTP id m15so3300458pjj.3
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mlHd+wwiv8pBaZCez3yDRMnKt1mN27booBhwkoA66eA=;
 b=EL0IBj80XfawSZQ7+1JraUZ4oAKZlwgsFbjXEzE4aBarpo9aqP0BUSKUbMiwo86Izz
 zYPo0TWIxtZAVVFycN7J7ujFIY4fknLTMMKLrmT92Ih3BAgBKfGa48rInmttqJjTqJGg
 wS/wohjiv4V1H9FIjG6xEJy4cdrUV+JspjRUTdXsxmc1woL6QC2QbmikW1BVdsnnfFgS
 eQFfbYOcsWbxy7ljUySXVf9dLIJzrM+8dPguqEG9u3tDrL8EVUldNWc6n80FohbIFfwM
 xFyUtWQvi2k++L5JUSWli5/UtFP4saUQ1SVkN7eI9ARqhKMlDnK0vnuJeA8XMfxrmz9n
 yCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mlHd+wwiv8pBaZCez3yDRMnKt1mN27booBhwkoA66eA=;
 b=H8/8QGzh1Rb69+qFZlG/CFTdB3GYDZOLP9FtTAk8vAbLUJUTeBMAVvz3IPaeQxRbVF
 OxAFIBLIjtnItz1wr7eXbporR4P/tMC1XlIi//RS5jKMsHI6k+iwJJ+HLCY/UAvYUGDn
 3EheWt16YXLIXJoBi9InW8/DtkI4OfUbgOkA8oYSyEqOvIxMDYbh2f2ERC/Cc5FSzleH
 goU948CMvLbE0PJgsXisfXSoVa0gALXMfV3IfmPaECttqKMYcdWNnN8ikgN7ZftO0jkX
 md26o6UWKniaSlyfFdg7iESN3lf+jMwes80mkULqRTmi1r2iA78S5hRoUc0I/HfCwhI0
 MgKQ==
X-Gm-Message-State: ACgBeo16QLGeuj4gA/LAYF9NfQqdHmyC1BzcoiSOLDHgAImwx/wm7sig
 3HOB/kRywewxuFMLZkrAwKSbsA==
X-Received: by 2002:a17:902:e809:b0:172:eded:e879 with SMTP id
 u9-20020a170902e80900b00172edede879mr4863328plg.54.1661182285051; 
 Mon, 22 Aug 2022 08:31:25 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 47/66] include/exec: Remove target_tlb_bitN from MemTxAttrs
Date: Mon, 22 Aug 2022 08:27:22 -0700
Message-Id: <20220822152741.1617527-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kP02v1ycacW9

We have now moved all uses to PageEntryExtra.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..1bd7b6c5ca 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -47,16 +47,6 @@ typedef struct MemTxAttrs {
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
-    /*
-     * The following are target-specific page-table bits.  These are not
-     * related to actual memory transactions at all.  However, this structure
-     * is part of the tlb_fill interface, cached in the cputlb structure,
-     * and has unused bits.  These fields will be read by target-specific
-     * helpers using env->iotlb[mmu_idx][tlb_index()].attrs.target_tlb_bitN.
-     */
-    unsigned int target_tlb_bit0 : 1;
-    unsigned int target_tlb_bit1 : 1;
-    unsigned int target_tlb_bit2 : 1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.34.1

