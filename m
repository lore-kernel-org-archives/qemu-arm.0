Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp945553njc;
        Thu, 20 Mar 2025 06:33:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWptVGGQcKoULTYcAkjey7iqctDBkZ3t0CpxyBm7dZoL8w2WiM81xzMvDrhtlD3TZa7UKOKLH6ZYKdk1A==@linaro.org
X-Google-Smtp-Source: AGHT+IGpU0ul0oLMv8T9nmjVvC8HnoZYzzyi9oVi6ErumXnW86xS2rQ+sbGhRiPr+VzC6aBg2u/r
X-Received: by 2002:a05:622a:4805:b0:476:7199:4da1 with SMTP id d75a77b69052e-4770843d2afmr99863551cf.46.1742477611933;
        Thu, 20 Mar 2025 06:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742477611; cv=none;
        d=google.com; s=arc-20240605;
        b=j4sIYQLdlgymkk2N7aY//PDFMrZ/GZEvrys2UyAp2sLuMd1P2gimS6+Qlk4AHpuvBH
         ISEdnH0oNuHret4RGVMzYSlwZaVdFgL5ataSQ732sdQ+DlIPgwocIiZfcgNcFV0zbDWy
         Ur/CAr/yaHgYDPK68bU0WKtbQsglDLsSxf++peVPKiYbi1SzKcM9WXNlBLYzoiz2MgH/
         lzJx0ng1+fs3+1kkxZZALkELAzqKe1nq8d/R7xQ2N978yy/5XbdPsg9/wjoE7sUnvI8r
         qCF8Ypl7DErQrKrlWI3XvO+8ukmKJXKa2vbF2k0lnWVYjjILGP4DAqe80eq4J8jbWrmu
         lmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GZxg8BppI9WvT0Dj1sY+qDwOoI0QIu58PoW6AIBPva8=;
        fh=WcfKwoFZk4xBvC2/T9m5nWzKtzaw5tRStOiKv2M5KZk=;
        b=g8jGSPLfaDFvPqvBvvGi1Yw4UDU9aGJBLXM3zHcl7uJdv8CdIt+gDDhMF6gk7CuRTI
         ZNPrrJxy1UOSig3Slzab9qdSoj0QliJ8FWsNyqeuOn427dOz8/NC2EPwpOo0GJtX+FHF
         H9XjbW45pil7X/97DAAvSkqeBdgBybHBMjTV4GaK1duE2vPx4SjuxuE7JJevb5pflN1Z
         8ErOB/+L8PItFPH0ZkZFp4P2bGiAEbhwDcqmNh0BNL2wHdh3FbybmUFWdQP0Q9xBuP4q
         sNS27RkZnG/iY34bb5LmMHTS4dN2PfQ3YNvOxZNVs3V1tFcPujeMcZlt9bNZABQT9avH
         vZaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XATm5mQa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb61b448si162998901cf.73.2025.03.20.06.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 06:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XATm5mQa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvG1Q-0001LH-IP; Thu, 20 Mar 2025 09:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvG14-0001AT-3Z
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 09:32:58 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvG10-0003Qx-MU
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 09:32:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so649800f8f.2
 for <qemu-arm@nongnu.org>; Thu, 20 Mar 2025 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742477573; x=1743082373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZxg8BppI9WvT0Dj1sY+qDwOoI0QIu58PoW6AIBPva8=;
 b=XATm5mQaRfy2pBKpz6SW+Qo5FviYfzxhBvP4PIwT4NOJ4VFemdLH1SFxHkinoXAorq
 mnRq0dWvxeeCbEJkLEjZZWTlXKTEifyQFDseMko1+iYR236nAJkvydoNlVvxI0wKtiKR
 05NwrMoEtHzc4i2Rcfo5FmhdbK22f0W0NeYg2gSg02OPvvehw4ibi9sOZjnvGf8r4g2k
 W4sM2wzrRwN9qK7hfGR/Sru+yTOULu7gY1v69cEp4RNhCsRExdpwY+epr7EfifGSXQC6
 OhI43qRVrjD8JJ7C8rfUhoSmewOTAae4QsI+ERHROJlD5MzlVEkMik8UiuIR8wgLNMce
 SpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742477573; x=1743082373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GZxg8BppI9WvT0Dj1sY+qDwOoI0QIu58PoW6AIBPva8=;
 b=ensMuti1zMgwZX2jL2pgXdtLp+E7Wvp32FgPCCFBX2WOgCxrCBBRm17Q6yqTeBq5HY
 qvC09SFFjh66hEKh+hQbW2b99IilQ7a7d1uYOVHeQpzW39mvWpdyjt2pYGnVXygF2y4t
 R0LRSNEBDmfa9uGDCwdWP+0KldI8PIFWbiIpisQDLo2hBUX2sJv1/lBz4QaqnacyyTUY
 ys9ZNbodZXF2hBFr63dCh9MQ9oARKjwCjXjb+pkbTi9Dzru49J8ctrddzLGepi4v4NZl
 Dhw6hTr2VxUoTWUvNFa0n3ouclbsSvgCriaIAW/pYPuqX8Kk/TH5hsHjGH7/OBToyQ3J
 m4Cw==
X-Gm-Message-State: AOJu0YyLU6GSfrEbZF9ll/LOrVVmaknzUpIKW9Qv0eKiMNZCqbvpOE47
 7Jf8ksOFFCPipEbxl0UJJBOy5Czq19ximOTtZGG6a8X5E2xB3cNqCFHuUvU2RUZZyor8Qhgj/Mp
 L
X-Gm-Gg: ASbGnctSQ8YvwHm20zODcXVkdnmAoHyP/bGkMzDE6MYaiPqKZqJhJTo/Av4OFpZyf1I
 tp6QCCoHH5Kpxf+Q9+OPlfpmt5/HklyAVTQJEuw2CpGE4ucC0FoOSoI+uJPtK2/7X8lW8aKkWfv
 JhNVdrILVoPXQthWLEx905zNF7DQA2snPalHYPcoZ1XgaHDvHFWMcHvlSgKsaJV9WwSilp1d9EU
 yqdHDd4zykowbqtJRWPaH/MhTgS8ghhJ3BFECSBeMjwamz3DsUUtBok5yb95Ej42L4MgjdBKa4x
 ZHo156V2eFs+mRO9g3P5MIkQaHv09VHcDbEFv8zOXC38+AP/MEE=
X-Received: by 2002:a05:6000:1882:b0:391:47f2:8d90 with SMTP id
 ffacd0b85a97d-399795a8f16mr4008254f8f.20.1742477572535; 
 Thu, 20 Mar 2025 06:32:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeba1sm48804525e9.32.2025.03.20.06.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 06:32:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/3] rust: assertions: add static_assert
Date: Thu, 20 Mar 2025 13:32:46 +0000
Message-ID: <20250320133248.1679485-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320133248.1679485-1-peter.maydell@linaro.org>
References: <20250320133248.1679485-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: u7AesgNGnRPd

From: Paolo Bonzini <pbonzini@redhat.com>

Add a new assertion that is similar to "const { assert!(...) }" but can be used
outside functions and with older versions of Rust.  A similar macro is found in
Linux, whereas the "static_assertions" crate has a const_assert macro that
produces worse error messages.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Supersedes: <20250320113356.799412-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 rust/qemu-api/src/assertions.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/qemu-api/src/assertions.rs b/rust/qemu-api/src/assertions.rs
index 104dec39774..bba38cfda11 100644
--- a/rust/qemu-api/src/assertions.rs
+++ b/rust/qemu-api/src/assertions.rs
@@ -120,3 +120,25 @@ macro_rules! assert_match {
         );
     };
 }
+
+/// Assert at compile time that an expression is true.  This is similar
+/// to `const { assert!(...); }` but it works outside functions, as well as
+/// on versions of Rust before 1.79.
+///
+/// # Examples
+///
+/// ```
+/// # use qemu_api::static_assert;
+/// static_assert!("abc".len() == 3);
+/// ```
+///
+/// ```compile_fail
+/// # use qemu_api::static_assert;
+/// static_assert!("abc".len() == 2); // does not compile
+/// ```
+#[macro_export]
+macro_rules! static_assert {
+    ($x:expr) => {
+        const _: () = assert!($x);
+    };
+}
-- 
2.43.0

