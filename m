Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp807342ejt;
        Wed, 21 Jun 2023 05:19:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JVd63l1xIee3Cf/aJCeiSHiHbYWYHDhjDT9tdZs4A2ZN9RFQmDD6gSRAzrfm2LszfTVi/
X-Received: by 2002:a05:6214:301e:b0:625:af4b:415a with SMTP id ke30-20020a056214301e00b00625af4b415amr15877452qvb.19.1687349975251;
        Wed, 21 Jun 2023 05:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687349975; cv=none;
        d=google.com; s=arc-20160816;
        b=f/X68DBB7HokNNK4wSZnFtdslf+OMkJQKK2tHcD7oI0BFOrtv3MczADcrZGGGs7ogF
         DsVUnDKA+x8OqDXG6ktgj8ZdOEAtfGTPR2tUqWvHF5xSMq4WTHSRUNyJagL4nESDw/34
         Ui4d8waCGVivL7kSGF6wZ3qn9QNB4d4dUYTh2VxtSqYLz1CEiyPh+Pzn0CY1y6fMYAGL
         GadarcRSoNo9MXTfvlVcd+s1nZ+974mqSwJHtOH9IvX9dlHhY4IxnBQ6m+q6SGOVlO0m
         pSKB1xDhg4USUyhts6icVKx9dlGJJlXKbESWOWXl5PfS9FodjNs6bMIDYMnK+03z0EEI
         TSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dTPy8thSqYZgAKDn29KvnLtMmsCZ90i/2T3uJj/CEGM=;
        b=VDtZ7a7UKCQdAeH4+bfnQ4b4wCtV2T1cmwpCLkkI9q8vJsB2MDnynRiXJbnQ4I9U6u
         5IQKvKIfuTAU57kwz15r49lz8ng5KRuIsCwZycdqFdOzJEqVSNck5mfzFz0o5WFTw18b
         2eSaLfuB0V0E8O/TKXeM+inWciWNDbUUpA5uAzlH5cEQNpWb72tF7rR9S5ORWpIv9cXY
         c/E9ABSMWaxlbiKO6E+TeQnsn/AcWfBz9wS88J2/fv7AbmNeqg1FfAx0MEtCA1Ti+QOO
         us0zBraHxMLPvZHpijRIcVpFbE+miEGIjYErV6rFIqdZbecDX2p6V63nhYN4Vr2YMA0S
         WSQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQf0GyV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv2-20020a05621429e200b00625a31d2a18si1694892qvb.496.2023.06.21.05.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 05:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQf0GyV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBwo9-0006o4-O9; Wed, 21 Jun 2023 08:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnt-0006dw-8M
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 08:19:19 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnn-0000IC-D0
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 08:19:12 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b46773e427so65037361fa.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jun 2023 05:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687349949; x=1689941949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTPy8thSqYZgAKDn29KvnLtMmsCZ90i/2T3uJj/CEGM=;
 b=iQf0GyV40LYkREx78g9bCoUUZiCecLFIulcYznbS668cpFFWWzLeX7b6Qmn/hF5Aux
 2bWrxhApiDDI61O1hV0m4jmqZGq9VpkBI99PHkKLLSfXpoYO21rS/E1s0KqVYxQcvVJr
 Y84ZPJ1DcSuHzJt+gA/rKBeqMvCQMOyntbqtjhvoQsg/YwftLjkusZ6lRtpddb00j1kO
 PeZ2otjBaSC9wNnqNidxDkCrDrPTwr1CubNA2h1zQ553mpqQTYMHvVDpBkNJdPoM3hdc
 D0hlsjNmzwCspkzG51I4UH7o/EsWA/lhTLb2mZ9pboeLJ/AJXgwDcuOyNgfb/mPW2FYh
 x+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687349949; x=1689941949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dTPy8thSqYZgAKDn29KvnLtMmsCZ90i/2T3uJj/CEGM=;
 b=D08XSuyhXTNZvLnuf1kK+Gx0POFPC79ZPzLjXwi6QXpaJQgE72o5o49qk0GH1cN9eH
 ESb7U9j6zKGsNV/EbrkXPZZ97OFjYsYoQ2ple0m37aylW1qeM24rsXqyNrcJwZoTS0C8
 cgOHZ8yV0VwckrKuJN/BLnHRZcchR/i3xhVxtlERh3DvSLreMi6FvKJ+AF7ahfDZ477J
 uTCtz5nuuNyfSUIpuZAgT4CdnCJarKhVKfJqUqCrI5LatkjtFNWMJ3LtIUxSWGlGq1Wn
 Xui+X6w9M47azoZkIY/cGI6WShs1ddQnlkFgmqnokVtD/hEEfjUYkYY19cdlaFKrpUGv
 +PVw==
X-Gm-Message-State: AC+VfDzXGA2xKUUBFh3elBEIyOx6zTrrKfpKNKzSOYj5R/bm7w2e5GdO
 jbq8ss0MdGIevqiv7zq7rMCQRQ==
X-Received: by 2002:a2e:80c9:0:b0:2b1:e6eb:1ba2 with SMTP id
 r9-20020a2e80c9000000b002b1e6eb1ba2mr10713542ljg.22.1687349949599; 
 Wed, 21 Jun 2023 05:19:09 -0700 (PDT)
Received: from stoup.lan ([176.176.128.70]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056402014600b0051bdf152295sm543176edu.76.2023.06.21.05.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 05:19:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/9] exec/memattrs: Remove target_tlb_bit*
Date: Wed, 21 Jun 2023 14:18:58 +0200
Message-Id: <20230621121902.1392277-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621121902.1392277-1-richard.henderson@linaro.org>
References: <20230621121902.1392277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22c.google.com
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
X-TUID: o3vZbGgsFIUA

These fields are no longer used since 937f224559.
Target specific extensions to the page tables should be done
with TARGET_PAGE_ENTRY_EXTRA.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

