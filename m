Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2156485njc;
        Mon, 22 Jul 2024 14:46:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1YUnfoIEzrdFlzzbvZ4rLjDA9gQTtfPDPv5VT3X+zRjZCQYcNvCz5v7wChT8SkPv6uW/EM5GDjHvtJdis7K/WiaBuqpvP
X-Google-Smtp-Source: AGHT+IFfqIBQEKQHfnbOOau3dJIttovch8PTAgW8z7w+fJ5EOVNj2fxkBmU9SrE7APw4EOjOKc5Q
X-Received: by 2002:a05:690c:dc2:b0:61b:e645:3e94 with SMTP id 00721157ae682-66a684c2bb8mr139591717b3.5.1721684818495;
        Mon, 22 Jul 2024 14:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684818; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8RnNy88m71Q0PdlROFg/kGZOzR8+2+zm2hbij6dfy3kpyKR9cQe0O9RmWyVNh61z8
         LUIm9A6R8CZfUvwfpAF5C4/lZ3L02lHUmW2DjuB00/cxXHNUXfvr6o9NwtBAXtQb9l1l
         BH7nJRxriVIpZx+esRewsl7/RyILI6g/7JJmNV81LVMM+ydTJOJkCzO85ZNxxxqraLyF
         DMhjeDcB0VZ6hJed0FDFwyoJ0U4VFksVjRkALQQOEtLxB9fnQH7aeYxFs3E2tQvrFo3p
         8tvezrPLVGkYo5dYAz70Hiv30TQCsBgWhLK031oDjukpQCjwnRXcxW1iJKwitA4+BjKZ
         d3og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VTuJWAM1/9aYMqyRTEKTG2Hu5YYuT8G1Kl37sm47X4c=;
        fh=XV7jQqf6dGABObaHUEox/VkMf59FlwDUAUcMCSNg+a0=;
        b=vNPV1bjHtDdEETGYsRsn/K/Re7MJxh8qs3L4AnmV4+NPrmiYC7cmxDSyKSSSMvWSo1
         QeqCqlKWZkHIL4WxZjmoJw5+fnPlnJ1qLaH6myqCYxIwKPzCXVlN8nfUoaBjfVJ9I4WZ
         JQenblXJI4BxYkIU9twWEFQBVucTRB0fhfsPZlSPAQfPfvdxJJna0WpQFW5senfBsghd
         jKJV5qbWV5mJ1KWiqDz36SDTFk18zXdlyA7y5MwBSu04IowaaoFzINYOlhyyQpGQ4Wp1
         XBOloTHGHNwUwaKBmd9j4T4Bwr9d6tO3XQGO7up48xfjK+xO8N5qAJM5xaz3DKYUVntY
         oNxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=3NxBcAqA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac7c4615si82639056d6.131.2024.07.22.14.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=3NxBcAqA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sW0qU-0006xc-3O; Mon, 22 Jul 2024 17:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0q3-00059c-0R
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 17:44:59 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pz-0004Lm-N2
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 17:44:57 -0400
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-8063553b837so202065939f.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2024 14:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721684694; x=1722289494;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTuJWAM1/9aYMqyRTEKTG2Hu5YYuT8G1Kl37sm47X4c=;
 b=3NxBcAqAjFsobLQ9SNIZE5tSm2TyNu7ZE92K1qSljfxvq6ToZS2sMSInOiiNR8YG9G
 VLWxUgXyAcH2/cf7CcZiPnhPGrhDRWN1i+F3CtIbvLerjrjC3iOp32F95ZnrWlBWZPuR
 oyW0OsM99+4/q4+ZvqDnpHufSKK4fu+Ll6vvzTwA9tf7PG2o2KHFPChGmJ1uyr3EZhvh
 bzu78DJFVXsTyB/pHPBz7NMgdljpUFQYT+AsPSqm4EsdRg92s9JG2Q2DseLCFBi/iOls
 6QXxsmzq9Hw7d0uGiU1VJGzlNuC80wywlZBZXMugYLc+gQWemG3F2UXUx9AWL4mNVVdr
 tjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684694; x=1722289494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTuJWAM1/9aYMqyRTEKTG2Hu5YYuT8G1Kl37sm47X4c=;
 b=Ph93g58uPWybYwGioHD5kO7wz8vPAmpULkoAT9VUOmD0WzOr6QCbboa0AyaR74y3nW
 Pfy0tWf+ejpDNMsTGBfTwKkB5PxGb5Vj2bNFnTopKi7mmNDHqNXXvDwNaTC8Ymeuo8hY
 pE/lQADajM1xE/xXxJd6D6LY+4eC67UnxaMW5i8CcfjeYNlV7GolV2/lA5MFnB+ZZYNP
 DpbganJ2R24LwRHXBAkUi/HaKyk8cGJc3bn9uGNFGcUyyqAAQwYwah3v4+f/mEwD2WF9
 Q1DEanhdB5qakaoZVznSLdNlMHOWEY2rZ/aHzwxI8gRY5z5/zccM1RI5G/HyX+Pb4k1m
 wikg==
X-Gm-Message-State: AOJu0Yy96ZS1xY1bX84LN4gtQeo6GWphyvPnDS6JIYq0+WMBiaoDSQZu
 8uAiEOxKnLnhltZusmOXWyqlfEROoYeg3QN1xT2H7uXszIUWZWIELVWk6gu8zM5z/RK5AFOm1Wc
 m5O8=
X-Received: by 2002:a05:6602:6196:b0:81e:23c9:3f69 with SMTP id
 ca18e2360f4ac-81e23c94004mr286704839f.7.1721684693926; 
 Mon, 22 Jul 2024 14:44:53 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d2ff3sm1816830173.128.2024.07.22.14.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:44:53 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 10/14] bsd-user: Hard wire aarch64 to be 4k pages only
Date: Mon, 22 Jul 2024 15:43:09 -0600
Message-ID: <20240722214313.89503-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240722214313.89503-1-imp@bsdimp.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: W1b+aYyeOfsc

Only support 4k pages for aarch64 binaries. The variable page size stuff
isn't working just yet, so put in this lessor-of-evils kludge until that
is complete.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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

