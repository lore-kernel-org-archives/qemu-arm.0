Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104778ejb;
        Thu, 8 Jun 2023 19:29:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ494e9b5HRXh/uphpBYJGeaItRzXHpE1pRRvCY74U47kGBTzm7UNsRcLkHZVd6LxdPbENlk
X-Received: by 2002:a05:622a:13d3:b0:3f7:f9e2:7187 with SMTP id p19-20020a05622a13d300b003f7f9e27187mr219220qtk.7.1686277786251;
        Thu, 08 Jun 2023 19:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277786; cv=none;
        d=google.com; s=arc-20160816;
        b=NKJJKzSb2kLBojidHyH9dmyUwVal+pOt/tp1fM97soKElhyfR5XcXCtX1YCgDkhzwf
         pC2lTw+rW1cPZ9pt83sPpAKRVVLHBi6vQtX6kYl8kULXuaVDVp667vM/5M8vVyj8JIgb
         x901IvYUPa4EGcyPaLQmYR+hTbuOK43r0RdwnxDxf02T0mwhaAe+SKWbaT22N2+3Fr11
         z18ApYa1UIkQKDrEq6EvB5jHJtKEjJmQUUeeC3bcl9ghau+x/ttq6EcrweuSD8Qwp6X/
         +kYFVoAKAnLUhR3p2Qk2hq4GvxHtUGT/LDheFyvp292E3sB3TGRUkOGVGn1v7jINGQp3
         gkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
        b=sFUElPFlNUJ9IkdT9Smt3uw0obKSUik50S2f2JR7fNoa+C+lU7YlKrJ8Wvjfl1wLzH
         d6GkqwjP2CBRrRLpbEabDwh6FC8l6GMbMHqQqdEBOiWIG7Gu40NqHfZUJM+Xs8dzivPt
         YbiY9dP/H/eJFgxcfoCk6RiHf/JBVUsbD7nWJeCQDLVuQvJsCm1yD/lT9SijCEVXgqqP
         UIxpBzsZXp1QOHtAV8/ChGcQ8KAM6WSXpHh1KUs0//LSoGIEMi17J7Y3rDIc8grwxJfX
         UdN3cG2kRNLAZQeZAOjFPpTm7x23AIlnXipAz2nt3Y7tC3u0+Io6ifMc6cT/hOD0pFVP
         jAuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jTZ1Gdnu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020ac85f0a000000b003e62f48e57fsi1506064qta.73.2023.06.08.19.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jTZ1Gdnu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Roh-00048U-Ga; Thu, 08 Jun 2023 22:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnt-0002s0-GQ
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:43 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnY-0005eO-Hk
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:41 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-651f2f38634so1298817b3a.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277458; x=1688869458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=jTZ1GdnuaVJ/K9msc/E4nzU9PPq7Ifnw3S7658EFXGNtEaBhIoTQNrs2vSeowMjVHa
 DNjSxUo3gqIhCcdXCnHNI1UG5276w6vvHiOY87WVW/gfAi2vbHzjX1oeiUIBUjyL7PtH
 Dq0La4s7K+6+1ik0J66iAP/Q9v7VfEFjFRQ9d7gVYMZx1X6PKrLk1gsEOELSYXzPIknu
 DW/Mi9KszF+LmdqJGxll1rGhcr7KgIqzR47ZR+Pic5IzeBi8jNAmrUdsW+Bk+oPlOsg9
 3gwy0jeB8q/YUqlaolh/3jQ+ziwDUWvw3Wz+34lDGtT5/kMUOhrbdJdkvE+OR18Y1oDz
 Usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277458; x=1688869458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=CIfuUwqWureYXE7mzq2A+XX+4Yf7BHLiHJLTjCUALyzl/veLZyNgAjN6Gsi5QX+UWf
 Gta76Fd+uwD3T6Lc/iEnruxSu3R2IlAcbABx6HIdnUIR+VVq11vDyfj8dCUmrP5Z0QDu
 /9bBaQeF/QBHQQJXgmhHuwtq/t4zYFhCrXglnaMBA2C9CmYpKXGkPwCGpLg982S4FHOn
 a4eD2N8P18pWq5rs/Zt+IIMaQ08MrIqDQMFdTU9Gv4oXqW83P6XfZwr02Xs8BK/I/qW6
 1DOrY6kjccTCzN5YMCmcgfMU23CjjeHVdhWB/xowBBWPWLcEr99TQYEAV+tCLZmVG8AE
 3Rqg==
X-Gm-Message-State: AC+VfDwxtMhbAghIjXbCYp9LQQzI+v7OJGQrLUdkW9uNGD278HUyccKx
 1WTkEzY60i9etky4/j3zYjnDng==
X-Received: by 2002:a05:6a20:3cab:b0:10b:7400:cef7 with SMTP id
 b43-20020a056a203cab00b0010b7400cef7mr73162pzj.17.1686277458070; 
 Thu, 08 Jun 2023 19:24:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 16/38] target/riscv: Use aesdec_ISB_ISR_AK
Date: Thu,  8 Jun 2023 19:23:39 -0700
Message-Id: <20230609022401.684157-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: 7tKbeSFeaVoW

This implements the AES64DS instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index b072fed3e2..e61f7fe1e5 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -213,7 +213,12 @@ target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, false, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

