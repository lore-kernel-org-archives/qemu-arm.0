Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1309022eja;
        Fri, 1 Mar 2024 12:41:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvMCz7gJQIoM5JIPNDVsf56kbc8YMLkxbxX9NBvRz/XPEHt3HUliHXFC1oOgqDOOpa4cuGi7zxIFuXaTiFb/NuYE4dxiZP
X-Google-Smtp-Source: AGHT+IFXV87vfgOxFTKyV1sLYkxPflgR4DGUGqQ9b29wff3ybY2I7xBZUwVFONhXLwYxdsPT8dLh
X-Received: by 2002:ac8:5cc6:0:b0:42e:5c5d:7ab6 with SMTP id s6-20020ac85cc6000000b0042e5c5d7ab6mr9706201qta.2.1709325715140;
        Fri, 01 Mar 2024 12:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709325715; cv=none;
        d=google.com; s=arc-20160816;
        b=EQBIc++hKT52uT99BNetGsr0ydsiQLljADyqekP1SIe27ytxopGMXR9LfnYAgIpfX/
         /BfPrwK/KkX81YGT6qQ3qPr4KEynsLqMuC0qaTwsH8+kP1CfY1/5fLy1K+YZ+KB19akw
         JditvgLjO1nfUBZIK1vMXNMj+4rE+n9MIooyMzToNR3MOWCHEGbu+d8JdZ9j4Hhz3QlD
         CH4fnujfDe5mn+VFCCpB60okqWk5t8VK73W/jrD11Rowjusj2RZGPbuNXEW0K91c0Nrz
         Os/n9KlEVB1IssB+u3eJLEx17VI4KtqXmCwyrDRVPeu8vnDNSCDix/ifJJzlrhLweu/E
         OiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KxuLBWXx0IJuL3Uf7q7zzjCB6UIN8ow8n3bSMH4FIK0=;
        fh=gQUbKHWxndGeE+DWX4FUU/bGRmGjAJrLFJIkYOi+27k=;
        b=FjbfAqM7HnYdXMW3OgaZ+dc4HIMuaJCIS46j9SwjekmCvrjJDn3cmplUZbw5+c1sIQ
         FAoimQF8TCx8RdBLDBd2v33z+P+Mmj0tcczU9A4HUrtG1V6U5Pw+rA4FFcAZ3f771MbR
         owqwT4FjSe4ijS1EQKYLhEaeWRZl11ch5nkwQiZ6F5b1S3Ym+OZqusaOmDaFHlOK1ZGq
         UAy7K0q/fxMkcuOIVMWPvBS0zMmCs/QoRTLeALANxbljxjlgK8LvTKq1J2aN4nyJrgZM
         7CDH6i2PFhNmdDinTCJAkiAnrQhb10QzuH9wMSABbt7r/0oC/3+5mgeVfN2tNZcjqoF5
         3rYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCQcxbCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25-20020a05622a189900b0042ed65fb04dsi535251qtc.370.2024.03.01.12.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 12:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCQcxbCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg9h7-0001zP-N7; Fri, 01 Mar 2024 15:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h5-0001yi-Qm
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 15:41:23 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9gz-0006wl-AG
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 15:41:23 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5dcc4076c13so2132093a12.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 12:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709325675; x=1709930475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxuLBWXx0IJuL3Uf7q7zzjCB6UIN8ow8n3bSMH4FIK0=;
 b=vCQcxbCzb9IUDfgIJaUVxpiBWHdP6oUPwNrBihAGMHXywUU49zTpG38F5+Cq7CFkZl
 7J9Hy0l25G12FWSGODe5+wSr4LFr5nhQLxsn4/7F79PUclMKjuZG/GexJpH/Cs5l2nLD
 6NhVG+fhu69sgMDjnlPgWR+cj3ixqcEd1Vzxrezxgt8hJQ/PoCXGc2Z5GL+4whEiGLgU
 6Lqv/YqFWa7Zbc/9WKnDQKqxOpfM2QwgHzduiO7BaDX56odgncFVhiHBf3tHKqzmMJaq
 5ha0pcOJdk00vChV1b4M/6kLQgteyMWOuRGkB/vJZEWma3+dulB33BGRPadLWhH69U0Q
 px9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709325675; x=1709930475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KxuLBWXx0IJuL3Uf7q7zzjCB6UIN8ow8n3bSMH4FIK0=;
 b=FIkVeKcV6H2vjam96+03Ei0vOhP6aOvddyElos7+tssvvb73fMzWYKJld0Rseds1Ja
 ehIPL2u0g8UG/1zcQJQD0KnKg3NjsqIiY7Z8/yvYZ8XhnwA6KMs9Z97gmRHLvUJwZId/
 5VkJepGOPZhrPPapx1rvSXxcHqxR6GKW5eErZrEUikGkvl+bhyMS8Zu+J4kr4DOGOBjX
 mQaySnNvvFH3SorsIMuXlYT3S/NcNhM9SoBi4ESB/hHidkD4on+2T6u3rb8zLvspQnQ3
 LK7LmnLjUyutZykJfmAToQn06ri3hEKEfbLl1briSgdSmZvdCo6XwtHEI64ABtGmJDC3
 9glw==
X-Gm-Message-State: AOJu0Ywmo3x9riQ64Fyu4vftPz1ArDQCo+B2bA7kJGsK+au+pibSDwfA
 V9G/Zpxr1hpnAL+K+YpvbsQd7olJ/O+51c/jk0nRpiUPVbCuBxj8eaqN9eNhEBqIfTbWU/A0qrt
 N
X-Received: by 2002:a17:90a:4087:b0:29b:9e1:2fb0 with SMTP id
 l7-20020a17090a408700b0029b09e12fb0mr3841181pjg.0.1709325675031; 
 Fri, 01 Mar 2024 12:41:15 -0800 (PST)
Received: from stoup.. (098-147-055-211.res.spectrum.com. [98.147.55.211])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a17090ac58300b0029b2e00359esm681947pjt.36.2024.03.01.12.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:41:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 1/6] target/arm: Support 32-byte alignment in pow2_align
Date: Fri,  1 Mar 2024 10:41:05 -1000
Message-Id: <20240301204110.656742-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301204110.656742-1-richard.henderson@linaro.org>
References: <20240301204110.656742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: PBJeZCYZszDx

Now that we have removed TARGET_PAGE_BITS_MIN-6 from
TLB_FLAGS_MASK, we can test for 32-byte alignment.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f947c62c6b..c8a2470675 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -900,13 +900,7 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 MemOp pow2_align(unsigned i)
 {
     static const MemOp mop_align[] = {
-        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16,
-        /*
-         * FIXME: TARGET_PAGE_BITS_MIN affects TLB_FLAGS_MASK such
-         * that 256-bit alignment (MO_ALIGN_32) cannot be supported:
-         * see get_alignment_bits(). Enforce only 128-bit alignment for now.
-         */
-        MO_ALIGN_16
+        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16, MO_ALIGN_32
     };
     g_assert(i < ARRAY_SIZE(mop_align));
     return mop_align[i];
-- 
2.34.1

