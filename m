Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2672228njc;
        Tue, 23 Jul 2024 11:13:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwLZ+PUtXIoIveiUbsJVQp6/Hgt0iYQkXee8jqmjRquBSGeGYrJnSOwg3DkB22vZw86MCFVcorc71s8dcNJyDVIDum35Is
X-Google-Smtp-Source: AGHT+IE58S9HFdLoBGc/Nzw7yb4ltCY6qP47Lp6h5K11NrTCUNjos61fJrRv6io6z/XY6NrqH9Hk
X-Received: by 2002:a05:6102:3a10:b0:48c:37c1:34a8 with SMTP id ada2fe7eead31-493b4b53298mr1855279137.7.1721758383942;
        Tue, 23 Jul 2024 11:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721758383; cv=none;
        d=google.com; s=arc-20160816;
        b=QReI2mV0pkZR6QtAbWvXGzUmb6VcIqwceXAJ/5jeexAewkcBuyh05f157WIcVNDjOJ
         Diccey0KATwVaP9aORc+GH+MppbQq+ul5sHBVEnPoPHS5AoYjhD5RXXi++LDUcu3uLYV
         Az6UVA6PBddN9B188kucZuzPg0O+rTV1op6CqXWerhIx5SunulSAz5NUkojQbCG/0SOz
         Ilj88jrTcIUmEvyN2/pV6h2isEn6T+od6BCyeUDJPsvYmfkBhzeNs63VzdyAIu0Sxrsg
         rE03d8JlifBHSDLCnH5w53oTfz3A/AvSUufnGCNP/HC6b0PIhiyH6XAbkbHA+zisCgFB
         gMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3HfMaHOOWW7MVPgIcUVzJcmEX/Y4bX1rEzWv+B3ibeI=;
        fh=aStWqRkfxhVf5AMezcR6ViH8o5y2sPTUM2oG5U3DPkw=;
        b=BUvtwWa0Nivms4tbYtvAAOLYphngHO4k7xoDgnzdVNEWgPV2L3602nRyXFVvk8Ovee
         3wDdT3D8Uk4FPvsRb+BO33XIaXKd36vwhmQWt2Tg/fpq1cBvQBJxvPIAj/S65oKN0aEz
         SS6xipgSIJQv/7Sf1Jl610aEU1SbTqH1h9APZCBan7kdoOgWjx+f+Hsdx572Vi5iPlR5
         5E0DZEN7zsqb8SMwFYutEl2fQJ663qfUMNHDzgTOknhfLzvwQ8j9s9HY1WxZhw4JWkEg
         4l1W0XuXMLVvtznXTBu0jVehMpeut4qwpUVsRR1xgtO90ayGyFQIqb/I397vtUGIqRfd
         rJPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=yK3jf1rP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-826e003af4dsi1472060241.123.2024.07.23.11.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 11:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=yK3jf1rP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWJxY-00033O-8x; Tue, 23 Jul 2024 14:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJws-0001Br-Le
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:19 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwo-0001DE-LQ
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:17 -0400
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-396cc82f6d7so355575ab.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721758147; x=1722362947;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HfMaHOOWW7MVPgIcUVzJcmEX/Y4bX1rEzWv+B3ibeI=;
 b=yK3jf1rPa6aKIBuKCRnT5wKASjdHnvvVd7IfK3ZVdrv4whgUBsLszxGyP/juDnTvM5
 Q0Gg09iMJLauMCaQCy8V3OqdDCv8DqhpQqwgnRE5AkdkbGO9FwIoJzOSe8T5XV3iUsyH
 EWQtSjYKOLsRFwpXCfmZ/3y3qMVTco1MrQLHtqPeCTTqmgD0nTISQyNaVBA5Yxsa48DW
 2P91hTs+07UlAMN1/XKjIB1UteT5rOxqzMjOi2eM81M493TQIxZeYU/Xyf+Wsme7TmsQ
 PKN+0KFhVg60pDXPK7Kt60tx3G8Wkz4SGFaictWw8chGBqNK2G8zW9XKNGZzyRt/NXT+
 OYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758147; x=1722362947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HfMaHOOWW7MVPgIcUVzJcmEX/Y4bX1rEzWv+B3ibeI=;
 b=WUQWNMdHXOsCa09MEchLuAoUxh3uGE9ro8+dXFgaFmhHFabiVV4LzYbl5gasucIGRx
 4xbzE+Ei4GUssunoGEXIyYRNy3482El5ZKzQeG/EPQTV+tOR39AdclwYubV4qgYFbVBA
 tenMGLomHSv83p0FI0nfRsY4Vn8RiVXBliiu+gd7zxusTSkAYs6GQswGKPctboCU+bGU
 Nx6MTJ+DUVfi2HDL1SwxxFjmKR3pG/JGJPYqA89yIi8KZpk87a8rEVComYInGph85iEE
 oT2AXD6NgYCNMX2WfpiVfe3J6AID8GpmZSvoU2iYJ2UHXcqB6fW4bL84mBWge/7P+nLw
 KdgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKnd2Ks6OwcuDdaV2H1ztvIcyh9A/zT2KjkQDacQdiA+VNOEpCePqlyo7/4sVhZUpIry+wXgoUM6panBQY9XRNiqLO
X-Gm-Message-State: AOJu0YwXY8cA0TI6bYH1dgqK/n8ySuluzpB4xytAqUAXFkVNeSqaWqL4
 redaCdq8lZXurZ+tU8UMh98JV6qu3Ha9dmtLfcOLys78x68qqW7DvXXJyPGsfkg=
X-Received: by 2002:a05:6e02:2165:b0:37a:76af:3fca with SMTP id
 e9e14a558f8ab-39a0e322f2cmr24153175ab.3.1721758147361; 
 Tue, 23 Jul 2024 11:09:07 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7a2827csm33361775ab.53.2024.07.23.11.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:09:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/14] bsd-user: Hard wire aarch64 to be 4k pages only
Date: Tue, 23 Jul 2024 12:07:21 -0600
Message-ID: <20240723180725.99114-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
References: <20240723180725.99114-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: e0e8I3V6z7dj

Only support 4k pages for aarch64 binaries. The variable page size stuff
isn't working just yet, so put in this lessor-of-evils kludge until that
is complete.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 2d5f3aa312c..fa6cae0e3aa 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -21,9 +21,13 @@
 #ifdef CONFIG_USER_ONLY
 # ifdef TARGET_AARCH64
 #  define TARGET_TAGGED_ADDRESSES
+# ifdef __FreeBSD__
+#  define TARGET_PAGE_BITS 12
+# else
 /* Allow user-only to vary page size from 4k */
 #  define TARGET_PAGE_BITS_VARY
 #  define TARGET_PAGE_BITS_MIN  12
+# endif
 # else
 #  define TARGET_PAGE_BITS 12
 # endif
-- 
2.45.1

