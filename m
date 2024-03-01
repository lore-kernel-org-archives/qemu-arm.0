Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1308853eja;
        Fri, 1 Mar 2024 12:41:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkRygp9Ivu5Lv/e7lboYrVvf8TTVdR3AvpvyH/tJAe8TW8dOUxz498Bp8f9L6NFyElFy2X+FYgwXmzL+0/gU/y08u0Cyh6
X-Google-Smtp-Source: AGHT+IHHWbXgj/46c037B7eTm+ELKFkFAxirYYtJ9mJ8Q08GP2uiD1f7wwxRETznXkepIdTQPbEz
X-Received: by 2002:a05:620a:4245:b0:785:cdad:f113 with SMTP id w5-20020a05620a424500b00785cdadf113mr9381162qko.38.1709325689389;
        Fri, 01 Mar 2024 12:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709325689; cv=none;
        d=google.com; s=arc-20160816;
        b=hSa/LiLdggtCh2qkthkpSTUxRBmK7XqpBv6KaHj/jzJsg81+4PicG/BrS2de1jrr+v
         cvAagLqqQE7wF4yFJUGYsanA66TVIioSVbEyDcWWuyJNUNMnP27HX8bCSKAcpRSJUyVi
         X9y//2+5LCd5o82/23adiwZoes7UQ/KDY//LiszDMppCVTloGYtD64JlJVaASb7odyLK
         pHXnUoZBvb/cBQz1RUQOUfATYA5Upo9t5+B86Zs/sGn6GMbFlDuzMj3n4By4GLx3+KFz
         fVG+ByVB7/+7VQctvV6fz9ZMoeSNzGLnWPNQYZJ93U6VXjQvxeCtOzM84mQ1vZ2562Zk
         pDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uSxGM8jSCUAKauTODiPxOuZGF0sA3+vBxABkPlr2Gc8=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=piZ4h3a+xmF8S9rubvqfcUeFDE1Vz6zWfNul3Nhoxrj8ulv/qMqb7I5q0w53ax1U5J
         yIBZFFokkAnH0lBLwJ5z6Kf+IoFzJQ+vohw0D672s0yjPhUEC4zqFvFPh8UcUsxqKmKK
         cCm3QAG139er0nnd7OfWi2F11oKEwyBJhvVH9KWUk2pNMs4ilx/7Rl7JidyBujGTU7ky
         KF5t+dLxXomhkMrFPssUDxZhqtkdP5WL6hw6tfp0b8Pd3M9UQJ35n05IKt/IFDactEcg
         YWfukyNcWR6hOt+TNFROHbisS5864UPs2Ch6rexXY7fXZSyWwwf/13JJSAgL7iWz6qzW
         ugSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D1BRQr5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a05620a210300b007881870a6f7si128169qkl.336.2024.03.01.12.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 12:41:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D1BRQr5+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg9h3-0001xI-HH; Fri, 01 Mar 2024 15:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h2-0001wQ-DO
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 15:41:20 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h0-0006ye-UV
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 15:41:20 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2995fa850ddso2931398a91.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 12:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709325676; x=1709930476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uSxGM8jSCUAKauTODiPxOuZGF0sA3+vBxABkPlr2Gc8=;
 b=D1BRQr5+QOiLN5I/UNqsClGgT9yMul/wBvtZjIzhW2PVKAYZ/qQYsah8/BaCgxbIKE
 uAmPIXurda3IPYXJZBJqbWmO4a6vjuci3bC2bSn2xoshmqJfpwfuw+QncMajf6cI+fyh
 44um+pZleU8t1MfcYklp9uageSBIv38CMOP4YHPyXuc7t9ByaP6sWJdkCbT1AKMQfolN
 B7YKvr7rqbwv2h2p9fP12Fe0md29lwih806dg7RZmwCaEI5IkSdvzWyqWadZisP84hP1
 rzst2e9Ov7ibL6mqWWvVNFoidd+DoH2zkbAwljGiXw0Zo+Tb5h5h8XLOTLL/5Gtga5/0
 eXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709325676; x=1709930476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uSxGM8jSCUAKauTODiPxOuZGF0sA3+vBxABkPlr2Gc8=;
 b=ciTO/i7UWYrsQL0cn35kSTcF3GQq3qbnHZ2A7E2HRta0lTUnKYpF/36jxB20cozm4f
 ld5pOpVQXxo9o2VKE119nT5+/Ohn6lrgQj54aZONYFsr3UTwgeQYBd1yUt8vx7GLCdLA
 u6hPawiRCxkc/mHyetWF+gqQgLnE7F1vlrq/3/vCQlTHH/ZoIHHdvk3wAbMVkF8wnMbU
 6ZgBvLr0qakRr/3sDnSDqWd15NKB4XMDMpTaa2JAz9VbwbmQbtlwSdo1NNhO3d+EikuP
 IC2lrDFVXbEYoKzCgq2ZeRHx3xVgrTsLrVHa47zdmkiLuYMTQoFS0cF36xkiaWwmV9R2
 XLVg==
X-Gm-Message-State: AOJu0Yx78Bxn3qZV5CXm+m5Y6XfdZCHCv6oz8/0yV0xaT3SVvIFSXrBZ
 IS2JPRkUiw8KDaeDZ4rEHTHoF3cRox68xIrmViLJOGncoB+jPhBgW62xk59/TQA=
X-Received: by 2002:a17:90a:b96:b0:29a:f150:aeed with SMTP id
 22-20020a17090a0b9600b0029af150aeedmr4650938pjr.19.1709325676472; 
 Fri, 01 Mar 2024 12:41:16 -0800 (PST)
Received: from stoup.. (098-147-055-211.res.spectrum.com. [98.147.55.211])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a17090ac58300b0029b2e00359esm681947pjt.36.2024.03.01.12.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:41:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/6] exec/memattrs: Remove target_tlb_bit*
Date: Fri,  1 Mar 2024 10:41:06 -1000
Message-Id: <20240301204110.656742-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301204110.656742-1-richard.henderson@linaro.org>
References: <20240301204110.656742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: cAAKnXUnB202

These fields are no longer used since 937f224559.
Target specific extensions to the page tables should be done
with TARGET_PAGE_ENTRY_EXTRA.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index d04170aa27..afa885f983 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -54,16 +54,6 @@ typedef struct MemTxAttrs {
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

