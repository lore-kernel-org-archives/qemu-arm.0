Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396982njc;
        Mon, 24 Mar 2025 21:59:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzESE/2pRxI2tyWYFfYajwjNBP2u0pMaDNlMUNW+xBTcpucd/m+uOark3i6aiU10FByiy156iUYe760Q==@linaro.org
X-Received: by 2002:a17:90b:3bc7:b0:301:1bce:c252 with SMTP id 98e67ed59e1d1-3030fee95d3mr24871271a91.27.1742878769309;
        Mon, 24 Mar 2025 21:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878769; cv=none;
        d=google.com; s=arc-20240605;
        b=bht/uqkJ6LvmgCYSLdSls5IRk8JxwIT9VjXhImfjELgKaBzFc3agV+kyyBByhhp9cx
         EYVuOXHRe3dODJMLoISvLTxf9jfplW2fl6XEalLQmYJfFL82tCdWEVvgjzsksKtcBlA0
         RJoI1Gf1z9E2oMsTrwF84fTWPwe4IOERK2yDL1hZtErzAjf72YpGAGG3GWqFov/eVQmL
         gOcRl5aTUEXx8nVHOu2eV9F6j1Y9hAJAJIaHs0jSxyYnNZe7rkhacZ7OCRzAF+eaQgwV
         WLveRGDdg6JnxmZSTbd47JJeQrw7ldKEuh+pIW1TzukirvV/F+U/R1FiJ998Aow4t8F/
         8V3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8rvUTTGe7RSowwob33glnfX6lSJ/LNSVbNxwketpLmc=;
        fh=kGIuOEVSkSQFmtMDuSyH03tBo+YojvgYw2duZNhz8Fw=;
        b=WLV1qOEpU89DtpeZjXl+N5ZeJZcuRq89a7bbgzyOdpURBe4i+N0EmTw0QVwztEBKs1
         g5tuxOQv4HHfLbbfoimm8cYqDY8C0NiB741HdS0DRK17eJ3Jv2ywpnn61IRf18JavfLW
         ZDoIsjk829aLKGu8i9Gs8qW08CT1hdQI2g6lN+8ZwUafDZjzETLPDIO5o6/VzgIOxYDp
         Onu9EQ5mO/6eYpZAmKrpqR1Z7xy6iZsBDEluBnFKF8mZ3ly16NbRt7XUbEngoyOwv50R
         tDrzPQGrgBfGdj5m3cAmzGFlwcc0tC5E6MhPd5npPNnO4YnUanMi4mArDQ22TgXKReSt
         VL3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcR2cMOs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f5a4723sor7003016a91.2.2025.03.24.21.59.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcR2cMOs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878769; x=1743483569; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rvUTTGe7RSowwob33glnfX6lSJ/LNSVbNxwketpLmc=;
        b=XcR2cMOs3wNJBxkZe4P/PNHpZ2eV9K2gAZOqp0TNqHqU/u3WULYnebXwlSmBGJ4L1N
         XKjtj9dk10lEk15CCuy5y0SHgAJsjLNO0xboGpg3CJkboTUdapdMoP+w9K5ISPz9nLXg
         qaybftyIxRBw963diMiqgdzgsVyf7tufGyODqMhCuWvF73zYtS3wg1E8BsISsWiaVyNi
         hzjPpo0UVcvb5gq0jhiUyapsnp6lSdhoXtecmZimY7x8e8UPhhsTXc7lvcmVZl7QLeS3
         j5uXzkLvYaKjT0ikpdx9VGQ5Z+k+2HVPccHoQDSU8yj6WGFjOQ6HUmptS5JDYBwZr7ra
         pouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878769; x=1743483569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rvUTTGe7RSowwob33glnfX6lSJ/LNSVbNxwketpLmc=;
        b=JReLkFWmwGILP168CqC0YpuMoyfN1w8Gp0osHS6sS3yZx3sWLyn7qF9BfraZGmJteR
         641E8Osn3J+YTz86RW1+HCMdd5+/XJYfbMqI9NeSRA4lBeDN4bVDMnwtRLB96vtQrJJl
         byYYYG+4CLHiRBciPP9yFepzmkRMhv3p0p+znbOJpU0Hc/34iaYJUze92IsxR+whpKQv
         ihX2YVQgTcxX2RFbdmAEwuGMiK50d5rcpwtrcWgNON+Q6TUrSG7lNxqoznLjAGmLIMCR
         1FWfnYTF+AdXS2GsQ1ojSpl4StxcwiJRIP1txI/xB/wT0wYzGf2axb0gVWgTSYEbT88o
         Hy/w==
X-Forwarded-Encrypted: i=1; AJvYcCWskubEg2KNKXA+F5rXEZcHJkVf7lg2yathHD55ehMORFRoX1YVtzd0LWfj8dejzxinyf1cdGu3GuNYEg==@linaro.org
X-Gm-Message-State: AOJu0YzRFJteBzHUE3xl3+OzA4/RT2uOP/+xDzeGEUIytWih91ExQr7A
	4DpIuLRd3qYaPAM6ojicuPhcWkDW2rSajdk71JNh4vs08wV/Ibdiz1hXq5nK4pbudQ==
X-Gm-Gg: ASbGncu2RPKqEWN9S9VnrVL2xkeffIKt+OInRCHLH1pfBGE8gdR9LrmvmsKxwcL8Q24
	yVxQS1dQ/TK0mYFivkv2jnYmGYZl8dTh36BDlTUAPsfUF7gZx1HDCH6e6X02xISWc7Y36c63QcK
	VB55uD/vXAEBhE+c1NxKjhQMyADFSiHgyFRAzmlZ/P8sxjtFcpOtvidJLr28Gcp4ZuILS5i3H6b
	Pznfb/W45rYEM6ZHQwOieeZQ8iE3g4bobD4JJOGVX1rrBml1GYuWrc2UUhjxs2WADsqR6SSqxXe
	EaGXsDoT5cDqPyFTP3fmDDE33gAG0UMx87t05IpRjRwF
X-Google-Smtp-Source: AGHT+IGd5UXWo/Lkrytq7CX1i0u6UBOb0hauVyNgTE4qX82WgibZ4vfYtc9KuC+rTMrhj/xFHAo1Dg==
X-Received: by 2002:a17:90b:35c4:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-3030fe75747mr22925455a91.8.1742878768857;
        Mon, 24 Mar 2025 21:59:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:28 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 08/29] exec/cpu-all: remove exec/cpu-defs include
Date: Mon, 24 Mar 2025 21:58:53 -0700
Message-Id: <20250325045915.994760-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KUWgTTMVZgd2

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index e5d852fbe2c..db44c0d3016 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -23,7 +23,6 @@
 #include "hw/core/cpu.h"
 
 /* page related stuff */
-#include "exec/cpu-defs.h"
 #include "exec/target_page.h"
 
 #include "cpu.h"
-- 
2.39.5
