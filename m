Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2148064njk;
        Sun, 1 Dec 2024 07:08:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMrkefZQXh1//4QF944wS+lPOK7IkLWjFFVUTjsLbbSYRrc0cyPKQ0Gy5a+1cRwzRvVi2pe6ZPNwDqCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEmGsRENpL0Ms7sFlruSKIgYxS9ZXS//uhJ1RUqO7l14uxFWEuixVfwZxAXIPMFWGt3b1SY
X-Received: by 2002:a05:6122:641b:10b0:515:4d6:5dad with SMTP id 71dfb90a1353d-5156a90332emr14307193e0c.6.1733065722421;
        Sun, 01 Dec 2024 07:08:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065722; cv=none;
        d=google.com; s=arc-20240605;
        b=VwIqO78HdprzbA0nS7XSgL3LPHppaWxMLJ/JojmGDDLFuu+8Nr/lXVIN8TUENWzRG0
         9SQy0T9pGmIa9YPLzc+ijkxV6B5dZemKCgk76U6gG/9DaPmjUCS2Pn1uxIJy780WjX2R
         vDC61wVvk0Ldy/ctOd/OwvBQ1VEybC8fANgAhwxx9iNH/QsGqfMah2upVNtoBCYA/IuT
         O5WrMx9xrJs5W4/Pv4LzauLaO+mTNbz+T7C/JmmimDeODxLEOp3yAQYt6m1YSq/zsTVD
         SFEkwpB4vliAKaPIPYgMtw7+cpVfM6ocD/1fn2GoJuf0CwEVGFWn/6FQydWHb7dyaC6A
         jqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eYsIv+bnK6/Aj793jyUAXVCI8JVh6W1VGa4MYQzPl5A=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=UQx6wzujEnuWtX+FDqtTi+XS3dC2ohy4GWhzKOPZ62BhQ2hf2WO2qUpnMC60KwWt7H
         KhtFdUssO/XIRI+hH+1XHa9mSd7t+JixdAkzYj6GD/YQ1eaxHy6JDmxhKwFrul2HzxgU
         kR/Isx8fCVaUYyqu3RD2tc8Kkdba2GKS5y6u7tDu3b8oigd86ku/JpbcQWJ3OTe3uOHe
         MfsZxUI8InmafmVHQMYFDvEYG80Rs1uCPDcpEEcjPEU3vvnfvr7RqyJ1GRbVdMv5VVoz
         gSH86lc/ZySWXKj0IgUoD1BTvaJpS2xWKMOR6k3mmSIl0eywRwqQNcxxDq7AQjpgugFT
         y5Hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSMLcSnq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156d0d9ad2si3859544e0c.139.2024.12.01.07.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:08:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSMLcSnq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlWf-0001Cf-DG; Sun, 01 Dec 2024 10:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWb-00019j-Dt
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:17 -0500
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWY-00041d-Ai
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:17 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5f1e560d973so1728689eaf.0
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065571; x=1733670371; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYsIv+bnK6/Aj793jyUAXVCI8JVh6W1VGa4MYQzPl5A=;
 b=YSMLcSnq2btQhpR6t6o0J81v0KGSmu9uMnD6lUhKueO+uK5mKH+HTWD5y0BopCHBZW
 G2+XN7lF5FseBpLXWJqDaAaGZ8u7tOcxiZ7s2t1MXa26dq2ugwGKjVkQozqkQCUYRKpn
 T0t5mAiMx8Dhj8osCLYD5C9M/aGMt9xb0JtMKkBAPagiGsijcQw+D7rg//RgA+ef+7Xm
 jhVjccKfuh3a0nTqVqebwqlOK1D/g0Z54aqKjUyIbwWUjx+nCo8J3lvlBpTr4k+Pynr3
 USNF/cbM6mC5cIvdqrDKmdwz1N4vsoen5+C+YTrfwV9i0CStS/ecAbSCQVRlnV1rknDH
 kcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065571; x=1733670371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYsIv+bnK6/Aj793jyUAXVCI8JVh6W1VGa4MYQzPl5A=;
 b=cZ/1aErVZuqdjDoIHVxAPOKaKI9iCVDuDMBUuQ8//EQ/6rHpHVgnLUdoSulQapMS6d
 KBhZNN2Ygr4beaB4rZ8VGImAbQpVw3bSCVdSgQxE1d5wUqgXhqOTOUV/VyxeJJXR6s2g
 f6zgo+5Gl6fO2dcEyLOuu82b1TLgacFlW/AuQ9leqbtYsf50MaWVIUKiotY/imOnvGrD
 sZo3GKNt5d8NA+e3F6SpdhuWQrGEgu2ligwfd97/WxSVZDMQvGce5MUQD9MMBRhpN8Ey
 O1UAzLjpJ3GIh8yKaku7JyzGsWOIMtTXOJle9F6r8j4Gf2VRNA3Tv9xNh8bHsZRclh2g
 Msmg==
X-Gm-Message-State: AOJu0YwpQwuxLIIorWgkh0tQ7KeJjK3NlIxsCQY11qg7sdhtQbvpdWO+
 CsKxrIXSJCnxYrFG0IVewMFSKO+/Z6+1WeNVhKiq/heF94dm/Jf3556V5XV5BagcT6GYIDctbQX
 1mws=
X-Gm-Gg: ASbGncteop5mNKvM9Zy6oRf+I5ehacOgxNxqN0W8JpbyL2X1SjHwOpej+xCtf91zzds
 i/JHF43+U/9Hys9F7JDGI28CICuNK4ygG250hEr7izhz2y7FLAwBwsutaMB3rL4EcQpTvRqFvXI
 06xZMln2wu7i7c6+pFcih9f2d5tE0Bv+i9qONDlO1sogKCKzBgduc/bLkWlpsW8IhlWBgoR/AnE
 AlNloh3or4jSgJX0NIe+S0ACKAg6268+H05qtjsSTLd8qctzk3V92A9AX8ULJ7PfmW81Q62+441
 4wJ8rMQ+H261siFirGh+qwdj6flGgrkvoJ6b
X-Received: by 2002:a05:6830:dc1:b0:71d:53ed:c2ce with SMTP id
 46e09a7af769-71d70bc63eemr10128671a34.2.1733065571070; 
 Sun, 01 Dec 2024 07:06:11 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/67] target/arm: Use ### to separate 3rd-level sections in
 a64.decode
Date: Sun,  1 Dec 2024 09:05:00 -0600
Message-ID: <20241201150607.12812-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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
X-TUID: qODH+9ue8AWk

We already use ### for 4.1.92 Data Processing (immediate),
but not the two following two third-level sections:
4.1.93 Branches, and 4.1.94 Loads and stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 331a8e180c..197437ba8e 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -161,7 +161,7 @@ UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
 EXTR            1 00 100111 1 0 rm:5 imm:6 rn:5 rd:5     &extract sf=1
 EXTR            0 00 100111 0 0 rm:5 0 imm:5 rn:5 rd:5   &extract sf=0
 
-# Branches
+### Branches
 
 %imm26   0:s26 !function=times_4
 @branch         . ..... .......................... &i imm=%imm26
@@ -291,7 +291,7 @@ HLT             1101 0100 010 ................ 000 00 @i16
 # DCPS2         1101 0100 101 ................ 000 10 @i16
 # DCPS3         1101 0100 101 ................ 000 11 @i16
 
-# Loads and stores
+### Loads and stores
 
 &stxr           rn rt rt2 rs sz lasr
 &stlr           rn rt sz lasr
-- 
2.43.0

