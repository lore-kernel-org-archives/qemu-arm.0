Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1093248lfg;
        Mon, 24 Feb 2020 19:16:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4sZCcJWy2Zfw3E+uHXiVceEIec5nJXyEaxvsh60x57BsBPZZ9iK7hiflqcuifyXZPJLQ4
X-Received: by 2002:ae9:e410:: with SMTP id q16mr13409025qkc.68.1582600604495;
        Mon, 24 Feb 2020 19:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600604; cv=none;
        d=google.com; s=arc-20160816;
        b=RpVtR2TYa20Y3uNHH5VQ2jnTfHe1hhtanO3JFxP9gblwgON9XCjowws8DukKBWNSqD
         Ofbwaj0ynnjVOKZ7NZG3Kp/DKw4WK3B8eD+RBqslziI4YS/To3XWc8FJQlaiaZDug3pA
         7YHJ+RRGjKQm00mtibAqrkVgmnObEXMn4xSwZWURVJwX3Ji76NiJzjQUxj0YKu+pNcuo
         FHQuCbkoYkHKTMrf4qMGPlMvAY3tTNJpxGgJQsB0dhy9RMfx/+T9CI9Xs/S3JJg8rds6
         lXzf53FvOqMTbovpSpSysHlXIWl8AZLUKfCIUb3SwBrXgsh4vmJGvVDd7v/Vk43bz9eG
         4ZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JkrdoiqyX4e8gyA45brKzFD6ph+2yRZImswzRk/mIGc=;
        b=iM3U/5uZUR7DDaNXj2ezzZcDC49h9Yt1VjA5eKw/j4jw9na8gphytps0DkMPQ6Gbwz
         N7C1fjxXzGsooTzqEvGv3qDxmvtgyA58ca41Sn49/KTc8fcK88ma3ylP11+YeUhW1+g/
         OvwBvj+yT7RkitavT5MuMjI8MB+6apjwID7bxDvosadrOJ6QBXIOOl+O6FQ179M9JHQL
         NgFdZMaZ4PhCMFOoIP7IiI5T8HL/PimyotqoUlxOlOhQ7T8vxWaNDh+GthURXJ0Tu/hQ
         q2W3WjskJZsG8IZkHovN4518HXPWib9JXmQpCfPtG8d7HSP6FamQP0AC49vKm68hC3u0
         ZDMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvbyuFBz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dg4si6396644qvb.149.2020.02.24.19.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvbyuFBz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6QiB-0005kz-V9
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfu-0002xd-7B
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qft-0005MD-9F
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:22 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40208)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qft-0005Lv-46
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:21 -0500
Received: by mail-pl1-x641.google.com with SMTP id y1so4885503plp.7
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 19:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JkrdoiqyX4e8gyA45brKzFD6ph+2yRZImswzRk/mIGc=;
 b=WvbyuFBzKcpNlyrzXqv4JHYynosDt9HBCGEUJjDhjupzslc/PCVu35vlzWdlhLdHNp
 RWhgD6M3HmpWfdCyCxCuYbIhH4bTrnSns37enZm/t8e4ZYGGABg4nXAqs3EqLc3AGd1p
 S2+oL0QyBCElPZNUrcpZ9SFJuf1Rf58uXtK4jeEwxFbpK/PpKIxbZftminz4v3s5UmA3
 G56t3gl8Qe9dbHNOFs66uyEhOTJqqwQ5wSUwht/PdwydIYPWgawbon4Yab4KfsmG9ixj
 0nEe63Rgp4iElpVflbR1u1lwDlCWcK2sMgQQJDTSbrppGGT8d+l5bCQRW89CKbkynWvO
 iEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JkrdoiqyX4e8gyA45brKzFD6ph+2yRZImswzRk/mIGc=;
 b=EhtIXAj6CvRMTy8tEKBNtozfWnl4QAkv9VcK7gKrgJDkwpGTGT+06IhHPcFirQ5Jv2
 uu49XCEMiaW4LncFoSOrcN6QoHXpcHEHoPdCXM70sLJxuiTkNBfMZWOmaYlYhLXzs+uR
 4l4zOZqQaUh94UsPSyISX69Bw1pS6At89TO0F8o5k3m4OUiKfm4hrmROmRisIVb9qv82
 wWM14eL4yzyrbBABbs4qc1X/Y3GaAaS/dpNITzKvEMy/Umj0tDHxlPOzfTyBfrXSELl+
 i9FNUdExKdZMQjxXpMTRoyYQVET7ZnqvpSJPsfXxqbqi04I7eeB4RIk3cZ66DZzI06AE
 LVjg==
X-Gm-Message-State: APjAAAUSL7ZSyaP2nDuhc8pUkOfEvTrD1hKrza/oY3bVfFyVBofOK+as
 4ptaRHJCjlIT747lOaXW5LLBNQ==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
 i2mr52311070plt.221.1582600460209; 
 Mon, 24 Feb 2020 19:14:20 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id q66sm14975242pfq.27.2020.02.24.19.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:14:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] target/arm: Use DEF_HELPER_FLAGS for helper_dc_zva
Date: Mon, 24 Feb 2020 19:14:11 -0800
Message-Id: <20200225031414.15649-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225031414.15649-1-richard.henderson@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PIdqdWVZZ60p

The function does not write registers, and only reads them by
implication via the exception path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index b1a5935f61..3df7c185aa 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -90,7 +90,7 @@ DEF_HELPER_2(advsimd_f16touinth, i32, f16, ptr)
 DEF_HELPER_2(sqrt_f16, f16, f16, ptr)
 
 DEF_HELPER_2(exception_return, void, env, i64)
-DEF_HELPER_2(dc_zva, void, env, i64)
+DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
 
 DEF_HELPER_FLAGS_3(pacia, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacib, TCG_CALL_NO_WG, i64, env, i64, i64)
-- 
2.20.1

