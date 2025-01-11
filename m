Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp897140njn;
        Sat, 11 Jan 2025 10:40:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVXrVeibgeRR+dWI74frb1D1Mu8YAS/XB/pVaZLK621FFGpQoDrKkdLc8ouMA7CKdzGHKhmRe7vCZf3w==@linaro.org
X-Google-Smtp-Source: AGHT+IELwv/+ZPYxtqtOzb8Q5J3rog8BH/38I+87IEwxIj50RdX0qrJzmtMZjD5hncQfQ56MP8od
X-Received: by 2002:ac8:5746:0:b0:467:8630:585c with SMTP id d75a77b69052e-46c7102c12bmr256298411cf.33.1736620823710;
        Sat, 11 Jan 2025 10:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736620823; cv=none;
        d=google.com; s=arc-20240605;
        b=RtbjPhO6Gcg5YefjZWIHqw4iIEcU++Yf52aBfmMgrxPj3TJngI1gkqM0N2QYtyLaya
         eZET/wsRdxqH5e1/bi/vaOfTRi8phqC19+xOaoLQeAHcoiMR6IKruTW/PP5tD+ldQIMG
         YvNq6iWNaGlm000WFHzrOzMjdEe06stYFUPFDVScDg95vP6paSgrp3WvOGLE+CmDCDAN
         1AHwc0g+C0ahcluW4ci6xviWMMndijaSO2YxlsQjOMW8rI9XRI60CvL9EhYUFbOtZoug
         78vWTGQdgWGntBrbm3dl7iJ2+PRDAoeVQtIDaSf/bh5pgOmDCyKYLnNyaBbcYdKBV5yD
         JqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9Xaj2HO8UwZmDfUICLPjjjrj0phn8PCO9qfBF54euiU=;
        fh=zvd9COVBSzfPajK+6Qdht6l3ekrr4bEoSMO4mWIJ/Ro=;
        b=VGCbLFXbFe853N2ftIRZMTbresLpvx/LrMbHfQhQtTW6gzmFjXCAl4XDkx6oqAvUNy
         ncVuG87liifSX2r1qkYqtKELA0KydnpP4XOQ1JQyoQ/mTMnqgqjBrBBARWyV++ikBnuU
         8T0HtH68egf//Z5w6XVBkpG0scNqYbbYHItVxAfJOmv0UEfNYNaDu35OovIwR24Xz7QQ
         I/3435/QUK6O4Iy3dYNH5jvm6m/UnfKec7h26VXlrdrIBjrw5B9tWFdUW0oDjEdvGz0X
         bPMSBwESqlNTckPLRJLT7oDsGvpavcqJ2VRFqaY+bRMo+HcjiewWiZm1TGj8v99KySY6
         cazg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ya38lZu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873fcb05si49810631cf.370.2025.01.11.10.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jan 2025 10:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ya38lZu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWgMc-0007EM-AC; Sat, 11 Jan 2025 13:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMb-0007C7-1g; Sat, 11 Jan 2025 13:37:37 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMZ-0003wP-Hu; Sat, 11 Jan 2025 13:37:36 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so770608666b.0; 
 Sat, 11 Jan 2025 10:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620652; x=1737225452; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Xaj2HO8UwZmDfUICLPjjjrj0phn8PCO9qfBF54euiU=;
 b=Ya38lZu7C6Cl7lQRK7do7+R5S+4B3lk8B0+Nw1tXz+EKDOuCWzPkwvqyGaz89jERQi
 6x66dK1DdqrpjGYFs2kzCgZ/xCngIm2+EhNUXR00JlFhZjddZFWMXNiu56nIahKJEf6N
 XvEiC//MncEqSRbTVXMRi4ZVxop5d+HdWivdRc2/23vn9YbVkU1H6/J4jj1idwG2awR4
 scpuIHfl6pW+odwI19GjOoG6SgEXDe4QMv/MZSTyXsblfF5tDb+FOl7ggJ9/eWDzcxcI
 mXoc9ceKwgfTT9JTQwK/MSdDTFInI/LkpGb/AvbvahnsjWMLH6auRrHkJ1IeHcaqmEP3
 umkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620652; x=1737225452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Xaj2HO8UwZmDfUICLPjjjrj0phn8PCO9qfBF54euiU=;
 b=Pt5ZbNqXYAVhGE6iW3y4fzPvi/PcQ+ZyVP4NEKQ+MwuK61iRaz/bPrIiw5KN9dVNv8
 Mc2912jOgKya5G66EgwF5NWRjaulqbdfbu8BueQ5g9yLyT+RrqlUwRR7A+WU9fjwwvGY
 SQXm1w/i6d9BQSKoJ4E9qgUsCt3LQXahmSwISMbS17MHR7ePgXPExQdmbs4veDdlgWOQ
 FKjxvVLnnP8PfGd2Aogk9kE8xzeTdEaNxPIOYh7X1+jKqcufzP4mUMcMp6K8nlkFAG2R
 8ScaWJ+nvomtbJ+upgcvHR80Nxnx3NuY+QlneDvDjQ28HOhQ5+/Ie1iT/m8xFOl6Q3+a
 REpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvCDNi6NOJIT6PpJ1n+2+hN+GkDOseMN+IjqKkJ9p4yhYfoxQjvwB9o7AJZXqf7b7uEh7FwaBh1tkPEA==@nongnu.org,
 AJvYcCWRBZdDcL+Ov2AdhEBfkxFCS838OwtKXZs58/7p0QHhiowc3/iI6x/snuAuhVWQAFiv64zIfyvKxw==@nongnu.org
X-Gm-Message-State: AOJu0YzEOpYNl+hXbJCaDnc4uo8dGkcGJyc/0wzVtf6dQaYLfQRxY+mP
 lWlagl60MReEnXpycYLmd02zOR7nyKtfgBc6RXvA1B7weOayf4fXNb8rcg==
X-Gm-Gg: ASbGncty43oh/oq+nLCE02Ifyga8tKxaljT8NcZS1LPnCZdXQmA3m8QU/0ITk0UZFNn
 301NuKt5unPXejj1qHAMdiUyZ3PkaQN2m+MVzu/zx3CYgBLEtV/tkBlRZ30TLR+7F100eezIujQ
 TR1dAVRgdakzWRu5++ddNqFFw0R988XIPYoNYBLIclMPnoKsA8GG+4Et85SOH4Mqy1Zxy2y8JQi
 v8yA7Fp9e2cbmL2YbOFvepuomfvLLDC8HtYE5vXQ6LESTMGiGXLCu/pBN96Tf+ShSA9/hyR7mfc
 7psC4p4XG1G1GnOrUfyMX1Ky27G2PbHpurIxf+pMbWM=
X-Received: by 2002:a17:907:6d15:b0:a9a:e0b8:5bac with SMTP id
 a640c23a62f3a-ab2c3d4d2bamr845691666b.23.1736620652069; 
 Sat, 11 Jan 2025 10:37:32 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-101-099.78.54.pool.telefonica.de. [78.54.101.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af187sm299026666b.142.2025.01.11.10.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:37:31 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 09/13] hw/timer/imx_gpt: Remove unused define
Date: Sat, 11 Jan 2025 19:37:07 +0100
Message-ID: <20250111183711.2338-10-shentey@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250111183711.2338-1-shentey@gmail.com>
References: <20250111183711.2338-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: V9BD/cEBJdtw

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/timer/imx_gpt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 2663a9d9ef..11eca9fa4d 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -20,10 +20,6 @@
 #include "qemu/log.h"
 #include "trace.h"
 
-#ifndef DEBUG_IMX_GPT
-#define DEBUG_IMX_GPT 0
-#endif
-
 static const char *imx_gpt_reg_name(uint32_t reg)
 {
     switch (reg) {
-- 
2.48.0

