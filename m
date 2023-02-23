Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1086414ejc;
        Thu, 23 Feb 2023 12:44:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/gditzEVqTrsWVj/vP4/1k/1qgHzX0U4mCpAPsFxpY2MMJQnpMF/0VZ0febLkd+j/KtnGR
X-Received: by 2002:ac8:5ac1:0:b0:3b9:a754:30db with SMTP id d1-20020ac85ac1000000b003b9a75430dbmr25438200qtd.13.1677185099776;
        Thu, 23 Feb 2023 12:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677185099; cv=none;
        d=google.com; s=arc-20160816;
        b=RbNI/DNcojKUFIy3exjo659CIyla4OL9H/PaXQ5leoP+tlblQVQR5P5OK+IE8kx7Gx
         UVhfDYH2i6Vb6hD3VKI/Dlvbdw0Jne0sn38ZV6KA4S5Jm6VHEw10fzHJijlUALb9Rh6e
         Av6JSrQyAm0Vr7bBrKwTHQRqpdiOZAYjPobLoWHBN6sHi3HPaZttNlGh9oVgO33M2NhD
         GyfyMl4FEZ484uaRXFkYipKLG4od7nwmssJfNw5OG9wpD+H8Ac4jfBHh91PHlCgI3mMa
         0JsWegKOM1dTKcwI1EwtuLMHEbD3KGNrcvKmJItkxlQ6uzp5OswFpPDiXD6gYnQD5Ftg
         3WQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1DH8GytkPurA9HrZaN37YWqxqd2398SYcw6ExGS87Do=;
        b=P2ILBgAdEwKsBoVLvQXEbNMOhVpJMIBq5mYMWsGh06lBneFYlyLLT/ZoLR2XfFsiuL
         VV9ze0XolxFW/RCR/n8vbMK8SYDiREOwgicw9ABEIupBT69u68470Dm8rm19BvJ6USt8
         tFOgqoOZJoZaWCmN5/nxqNOcWBbqcA5LsXfawGiyP8CDYM7BUNrwnEyN20Doo3vJNLVy
         YraCfum/KRXcZaCqjHH/zs1++e1MVhi1GVDU4cyqtEbtHeUK7FNv/eBu47prlEMhejah
         rfkpJpbkOCsuhai9fnQsdq53SwUjiXSqhqBPVWn1MUEDi6Zf5Pq3odnNA1EhpU+1UjyQ
         DiVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XEAP3hiJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac85f8f000000b003b86d9317c4si8067561qta.2.2023.02.23.12.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 12:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XEAP3hiJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVIRi-0002tF-A5; Thu, 23 Feb 2023 15:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRg-0002rn-Ho
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:44:04 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRf-0007T8-20
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:44:04 -0500
Received: by mail-pl1-x634.google.com with SMTP id ko13so15136087plb.13
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 12:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DH8GytkPurA9HrZaN37YWqxqd2398SYcw6ExGS87Do=;
 b=XEAP3hiJfXhcMkZwci7Eq88t0pM4bM+B+Hk/UBnOnFyrF0na7znaTQ9a4rSOIBvNI5
 m6CpW4LK5DIu3a7cLvgWKAsJDWw+x2Vgb3kS3TCIYA8Ly9Gn1xrjPYnohLn79kWPN8ur
 fiSahnMRIPsHnkiKZuXHLWKEuiHebwDmw62FJhzPoDB6JJdSWozoo3cuCqIfbfztl+oW
 FrNzUSLwdn01+j/PkgrNwfCoItLSLPGRj2Ki0VJYRj0C4hXmfWAMkb1FTM7W7WCpoPzg
 OtRCYuToKb4xVOHqumlSpmCbu7HjW6oECeS13UTfFYxufkO4iccXVJ9FjrIMGhm3ec83
 Ssyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DH8GytkPurA9HrZaN37YWqxqd2398SYcw6ExGS87Do=;
 b=IsmdDkbdKSWqzzlkcixFOMm5VYT51+SmxzIMwmm5joPud4WP3DwgLHucl+LGe5PmwD
 Z4Pak9D/nV8v0qyJqGMAE+BnM0FHyxWY3fR0/5WVlDQjLvQShWaSg2+quEPbg30+95jX
 kn6XpmjuqxbQFwOQvPJQbCMnBOoWaWdwDupwp/9kUe0Ei1Bvo2gqJcdMQMr69ZgzO/tE
 uMYShRBMrDwddwAg3zGBKLq6CtTchvBoixMtYXSFw3sdMFNuzQbojz4zHsddarKvZAa1
 /n8eH2z3+yu7L1p27P9HovEj8ltRRg79rkbhWIFCvVHjsNgmvjHGYhS9OckwYX+j9doM
 ofJg==
X-Gm-Message-State: AO0yUKW0Mxli8iwBHG5XlIFtgOMDVuj6ETj48yRIEcKd44O8oo1msX+h
 wpzs3tnKNUtdaXYip6pt2nPUWBRHZ9HnS93aQl4=
X-Received: by 2002:a05:6a20:8f10:b0:cb:a66b:3a88 with SMTP id
 b16-20020a056a208f1000b000cba66b3a88mr10004856pzk.1.1677185041785; 
 Thu, 23 Feb 2023 12:44:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:44:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/13] exec/memattrs: Remove target_tlb_bit*
Date: Thu, 23 Feb 2023 10:43:38 -1000
Message-Id: <20230223204342.1093632-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: aLv2sZh6xE2k

These fields are no longer used.  Target specific extensions
to the page tables should be done with TARGET_PAGE_ENTRY_EXTRA.

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

