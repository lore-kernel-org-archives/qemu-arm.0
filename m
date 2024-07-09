Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3300844njb;
        Tue, 9 Jul 2024 06:46:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3zOOyIvGXGlpt05l1HeMdJlyzp8laY2Y29knTrjDmBT5TuAPEL9BWIWQDrYhMEogfnD6ZN/uBgyeMDrkDwLrJYWpMBZ+v
X-Google-Smtp-Source: AGHT+IE981SY9fgNCJAgCmZg628Pe4DPHvD3r3KdeuGTvCcz3U7FTMQjZ5AANArQNgpXw9tZXYJd
X-Received: by 2002:a05:622a:44a:b0:446:5cb4:aee5 with SMTP id d75a77b69052e-447faaad679mr30546681cf.57.1720532798425;
        Tue, 09 Jul 2024 06:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720532797; cv=none;
        d=google.com; s=arc-20160816;
        b=isqI5d1j30sE9Y4CWnBxvw0P+BRP4Jyexs8lLG7u3JU/iNRKiplraVhJHLH+a6GwlC
         fsbXaA5ly2gOBv/T/AncsBW82JdYXYbLL2WmjglaBB0zBv4qmYJNr3qkOvXWpQwFisEx
         sDb0OHAuSPblYTfGpZhzpKCPXaQHeBZ34QvONLqm1lIWMK37IXLjwKPdKDRyTiUPyrcO
         IQNrqrBjXhV5kycCfK74Ev5dbKBO2cCBEjTt7zaMPLFqtQFirrQgLsrAZVNnWi6Tqluq
         jNoM0kOrSSuPxuNI63qSlL6QhWiYmypYJXRwq4jRgPs4yVxVYIzFBa0c34TLKUKWhkrr
         WhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OHkYQ/DRu8xLqubztqioO21tM/xMAwH4d9I7ANCcWmw=;
        fh=VCcMn4BWuATIWPeNHT8tXaSYnO4piPODHHsGdCo6mIQ=;
        b=ra3nn06esFwhnz3sh6SuYMYh9erSH0q/z0kGK2QCH2ATY7fyp9rF6wUc6H76VlBfEC
         s4c7gJp39lqtF4f+feFKh54EnBa/hvnsO8Q5xdWbvMoGMcrueH+OaezmKNpgHup+vLAV
         XXyqujLkdK7Bt/TJvsxUH0G2pKmsC3F6rE2rltNpQA3oJ9Fo7orcz5pBg4cA+JZWRJjM
         5cTk5pRfGOVt8YUjq++5NefSP+4KRIaRNR+mCoRTUbyFh1+NP7H6lRRH7CDMTx8Gw2lf
         McW9tBf3rb9IOdOAKtxLj9Uxy/RCmp4jJGY24Sm5b7CrVcbuMnpVtI7PlwTI9ga/X1ed
         Q8Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJbwGQtP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190d75fdsi210200985a.555.2024.07.09.06.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 06:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJbwGQtP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRB9t-0001kj-1N; Tue, 09 Jul 2024 09:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRB9k-0001gH-Ef
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 09:45:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRB9Y-0002IU-Ul
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 09:45:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-425809eef0eso35106985e9.3
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2024 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720532706; x=1721137506; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OHkYQ/DRu8xLqubztqioO21tM/xMAwH4d9I7ANCcWmw=;
 b=MJbwGQtPM2gG/Gec7FYmB1HQT5XzLWvzobTlzDKVuko6mmKioPo8ACJdTeyKmZ8Vz0
 dOKwGYVppLIigj2fEBdVjWEJ4ei6IMefWkPVO3j0F17Csibn3Y3cfIHlLyW0gjURyfCR
 Zlh5QDKrRrGIKa7/mhbGwA6MLHtFZ7IkLnAQ95dbiWP0x5u4bM5JkoKAWtxSlvLvKyle
 6Ibhj1HkW0GB/dc1iK73Eyp/djzyF8rV71I0OUjSXUeGn3W9UrKwl9MNtLwT4ya4Vrmw
 jpPnsoNDgNRF6pREk73i7KI1DXA9SY9Z5JARjKxJPKJOs8zYRVkP07Vlylf9/moZg3Xv
 kZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532706; x=1721137506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHkYQ/DRu8xLqubztqioO21tM/xMAwH4d9I7ANCcWmw=;
 b=EopxPuc9y+Wizc/QRUEZR8cTVbx//3m6VmhpXVcEMvnFL9xBdeDiz+qqqS08TFSXNK
 Fa+4Yfmu3Ux0nMSELkKf/F2CEWR6g4jwVWbpy1cjV4gFDnZMKzJOFFTGlZE8okxltlPC
 OgQs7Yn3JsCESzZAMZ8feKvtUpjNQ9cg4nc1aokZ+TuODInGGL9FPDILkXuDbu1O4JT9
 RmMSLIw8NtXXI+oLY/AszldBR554trV9yuLYS/WISg00CG2w6GFtFECkhtekxLkLjmkn
 AyU6Znt3F0JwS7X5RBgkgLqRc8ioVw7yydUVuCPllo1MZ6xTkdEWv0DX57+6kZCtLYkQ
 l/UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqf6ZSMOtUKbprdfBYYl5Y5canxMl9tY2AfLrQmBLPAB+CtM//+7iMjlEXqlqUBJIklt+lvhACUd45KFh2DX6cGO5V41o=
X-Gm-Message-State: AOJu0YykGGXZ7PxYKtwCubBqCB8qlNLScz14w5uY7mQmgkctnc2HapqI
 xqTEfFWgGoj25sSWUk6leYOH3TU99Pl+OamB8cnaWN2WoAlexEVMrCY7uCkYzv8=
X-Received: by 2002:a05:600c:6d8:b0:426:6389:94c4 with SMTP id
 5b1f17b1804b1-426708f9d84mr17475415e9.37.1720532706318; 
 Tue, 09 Jul 2024 06:45:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1f22acsm210426605e9.24.2024.07.09.06.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:45:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Fix handling of LDAPR/STLR with negative
 offset
Date: Tue,  9 Jul 2024 14:45:03 +0100
Message-Id: <20240709134504.3500007-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709134504.3500007-1-peter.maydell@linaro.org>
References: <20240709134504.3500007-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gLTclGuVRJlu

When we converted the LDAPR/STLR instructions to decodetree we
accidentally introduced a regression where the offset is negative.
The 9-bit immediate field is signed, and the old hand decoder
correctly used sextract32() to get it out of the insn word,
but the ldapr_stlr_i pattern in the decode file used "imm:9"
instead of "imm:s9", so it treated the field as unsigned.

Fix the pattern to treat the field as a signed immediate.

Cc: qemu-stable@nongnu.org
Fixes: 2521b6073b7 ("target/arm: Convert LDAPR/STLR (imm) to decodetree")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2419
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 223eac3cac2..f873e8bc8b9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -520,7 +520,7 @@ LDAPR           sz:2 111 0 00 1 0 1 11111 1100 00 rn:5 rt:5
 LDRA            11 111 0 00 m:1 . 1 ......... w:1 1 rn:5 rt:5 imm=%ldra_imm
 
 &ldapr_stlr_i   rn rt imm sz sign ext
-@ldapr_stlr_i   .. ...... .. . imm:9 .. rn:5 rt:5 &ldapr_stlr_i
+@ldapr_stlr_i   .. ...... .. . imm:s9 .. rn:5 rt:5 &ldapr_stlr_i
 STLR_i          sz:2 011001 00 0 ......... 00 ..... ..... @ldapr_stlr_i sign=0 ext=0
 LDAPR_i         sz:2 011001 01 0 ......... 00 ..... ..... @ldapr_stlr_i sign=0 ext=0
 LDAPR_i         00 011001 10 0 ......... 00 ..... ..... @ldapr_stlr_i sign=1 ext=0 sz=0
-- 
2.34.1

