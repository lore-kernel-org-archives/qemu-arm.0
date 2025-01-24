Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp926626njk;
        Fri, 24 Jan 2025 08:29:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVAMotdJHO73kZzGIhMzIJrOwS47Sf4pvo7gaucLRXd2AcZzO7DLuXbKiier9XA4zfgp5ET/X23s/chA==@linaro.org
X-Google-Smtp-Source: AGHT+IHQAsbrN6kuKJJM10toIcfBcREZ7UVVwhB87eHqhHL52SItiUoJ0SvpTJ2sAoY+8QPx1tWT
X-Received: by 2002:ad4:5aad:0:b0:6d9:2fff:c382 with SMTP id 6a1803df08f44-6e1b21bc92amr481461506d6.27.1737736168477;
        Fri, 24 Jan 2025 08:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736168; cv=none;
        d=google.com; s=arc-20240605;
        b=CxQkZLo26qwZ/+iOjo6Mx9qoWuwJQQ09Dd2VE/PACConrKJilkViwIirzQ15GyLdwq
         uQW9qxoaJgXixkqw0DHSfIhsquNyHhJWKnQqSnRSe2/2/kA9skr2Eo9Zj8zpYTWubCeS
         567B1CnVgL4e/MXuKxUWrnsJPIvGGAAZ2YYP4SlxvFPmSPhajkKNTgrAlMn9b0xK7dul
         YVKaGU9GmMaPULzXPq/DCgkYlE3Uv7+860awx4tDbVjemEP/Z47BnmlqgxhXSZ7xVf3Z
         9WS4ikjacSDIApya14dzkExP0uDbZ1TXHTOkEM7CgRUaxvEw1pwEiphkcVBrhmP6OWhb
         qPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wm1x6oiOauNECv1hFmpDM5ccIz/XsL+cZ9qJ5GlshBY=;
        fh=WxZF2JLtkJ2jwiyAWdt0GHe4oSPooj8bNcJf6zZollU=;
        b=Mjz5Wblv15/exAYCAiC6YTf96OHTTDMWnwh/32ZO9e72d8bQsWL9vaV2o6pbVQ5mkq
         MmKuWiOLpBV0Sio2bR07fksdBzvnsk5fpuj98sHR4mEdHMx+bVnZJlPgTtZKZ7QKXIFv
         iKbZs8OhCwxlaE/Moao0fXR3ifiH6q4G5TU6xJmnHfo+h2+0pTguyM6B/yFGtZFYKGAn
         6ezEpPPBz1qjQg4Uc0fVH8604yMvbGhpHq7ampcRy0tFCvfzN1EdxxuxNX+ynDbplYem
         E4eTujnFr+WqIonkurxY3k3nlIDZLB4e8Jdyj6kbxstjJYL+O7AZg+ocZFrIfjTc1yrh
         +oMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wm++KZep;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df6edasi25284316d6.255.2025.01.24.08.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:29:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wm++KZep;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMYb-00043c-5I; Fri, 24 Jan 2025 11:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYB-0003bx-BN
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:28:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMY4-0005Mg-5d
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:28:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43626213fffso22177425e9.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736124; x=1738340924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wm1x6oiOauNECv1hFmpDM5ccIz/XsL+cZ9qJ5GlshBY=;
 b=wm++KZepxv2eKzKGeICpSUkckFI77In3G1MrKj8MfGeOR8EER0mLFje1I6dd9vUjp2
 jTv5hEaYPiPd4VGxFtkc/drb5Vw5zQU3f9eyrdhh0IwQ6I/wUIYLNJwA9Yg2VzzRnEl4
 77aLl4NoLAz6YqjVfcweSHvvUfWoVcKIl6c2ZBQ9IxkgL+vtFCzRwVpt6lf6oBOOA5M9
 caaT1uhR+wYTvVe4BcndmBSXcPje4i9tjXPzJIs/q0MOJIdyv+I0lsWsfj1AGkWk2yRP
 MqjW3aCnjT2ZNG1l2ZYm+WMaflqP3qpzZAwe+xM00tDJhGSAyVQI+n8dBBtZPjFMYhv2
 oH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736124; x=1738340924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wm1x6oiOauNECv1hFmpDM5ccIz/XsL+cZ9qJ5GlshBY=;
 b=NKxYpQmDY9yiFXOjtne0NLABrmVIVBRCpwVuwX8wtXdlAlpxLWI6SPTJqS3cx5soSE
 f11t9RtEhFhE5CU6nkYXvqJxJQu2obcjpnvL/1IXoBsnk4HtPE5fBDbt3vlZC2gLKQNq
 AnRvF8WHPqMHGEpMCYWNux5iT8V/UoZ0hYeOUxaZSh0nFO1RqwXf/oO1YufRiMlL471c
 uSurrk0r6d37p4Zin9xJ9bsQRdfz8Cl4niMkxKeB92Z4PiAc4VHnKyc4UHwf5vKnPfsJ
 eW4r4y8l3v32f3oRsx+xDuSpK+DR62CLgbHlSljtVaydVBNwECxNWdU47KTHQW3sVuAW
 aYIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk/0bwKga0xW/JceZYdVt/4C1leeCE2aG9wIo9+5pBHsOtXNavbTWHp5xNO6Pr2+QCPnNpq5AWVlk6@nongnu.org
X-Gm-Message-State: AOJu0YwKzrdLisJQlMD+SPIlZNxu+jb/Vs/mQO/rfe5L55FLP2mwS/oK
 E4ed5ccYXX+2I95XKg6hvHW8Z0iPFhPoRHI/9Pyeqn8KLoN8MeFl1p/89cvzHV2E6Qt+Ew1HXyw
 P
X-Gm-Gg: ASbGncs4H6TGZgYUxkvtYjgUPSvz3CW3nAe0VpV5SdDoNCyT1VjDiNHijZree050pJQ
 MYdLPR8PkiS+El+yKoapN5/KaKvV9QBvvDWca5f4Oj5migWJ1vPUrFYjRNuS6spnS/bIXzd3ZtZ
 9f+gPLfAQVvfUWS+iMoOY/ECvhsXN8XMM+BQe6hgW3xcHKXwnr/zZr2pNbYm3tCZBdq4efseags
 o3QqIEhZ/OW80Y6brwQrPd0W/Ardx9lHuElECbBuUDub/9QfKRnIrDJT1IxrFKGZ+VvmiiCDlhd
 fQVggKiMWLU=
X-Received: by 2002:a05:600c:45cd:b0:436:fdac:26eb with SMTP id
 5b1f17b1804b1-438bd06bd67mr38032315e9.7.1737736124292; 
 Fri, 24 Jan 2025 08:28:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/76] target/arm: Use uint32_t in vfp_exceptbits_from_host()
Date: Fri, 24 Jan 2025 16:27:25 +0000
Message-Id: <20250124162836.2332150-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +nel5mmPjZqO

In vfp_exceptbits_from_host(), we accumulate the FPSR flags in
an "int", and our return type is also "int". However, the only
callsite returns the same information as a uint32_t, and
more generally we handle FPSR values in the code as uint32_t,
not int. Bring this function in to line with that convention.

There is no behaviour change because none of the FPSR bits
we set in this function are bit 31. The input argument to
the function remains 'int' because that is the return type
of the softfloat get_float_exception_flags().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index fcc9e5d382e..afc41420eb1 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -34,9 +34,9 @@
 #ifdef CONFIG_TCG
 
 /* Convert host exception flags to vfp form.  */
-static inline int vfp_exceptbits_from_host(int host_bits)
+static inline uint32_t vfp_exceptbits_from_host(int host_bits)
 {
-    int target_bits = 0;
+    uint32_t target_bits = 0;
 
     if (host_bits & float_flag_invalid) {
         target_bits |= FPSR_IOC;
-- 
2.34.1

