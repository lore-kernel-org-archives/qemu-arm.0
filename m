Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp925421njb;
        Wed, 12 Feb 2025 03:26:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkxK6C5x5WflIpkT+e624DwOP+43AbqqNkh//aR0doJA0ET9VSFeaAbBHJ1+RmbUJb/LERwIF0VRix3A==@linaro.org
X-Google-Smtp-Source: AGHT+IH3hduCFG6Hte0+SrJXGaKogldFAsSOCN2AnOK75mFggrX5c5ik/yjByVHB5g7SxBfBHBOb
X-Received: by 2002:a05:622a:14ce:b0:471:9cba:ad31 with SMTP id d75a77b69052e-471afc4d005mr45507551cf.0.1739359599827;
        Wed, 12 Feb 2025 03:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739359599; cv=none;
        d=google.com; s=arc-20240605;
        b=cP1rvi0QdzemkrQDN8kZ1na5L73rys2EmSyQRQdgSAxl7z1LWZ8c1ZEjnmUGzRNzUT
         tE1B9Xhk8IrvE6Za2br4tscW+9ThoESBOKFQEgaMPG1f/dygiQ94zQC8hZtjWEUC4VqZ
         NzWDPoeNTXIVGed5+6GIcNBMR6i6pG9JUxrET/K+bO6z5evdfWv3AFoEoG0mMLBB0tIi
         hByVt4qZjEiHK9iVaNwnbO6Kb9UFpmtWng6y4FONulH5VreaWTXD2dY98DT/eK+97HwP
         BECrR1EmeK3CGsZyaqppppvpMr9PCvF2nlfk33H4WxrSo8EF5LYysi9dre3RDbkhPO06
         bYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HDiUYtW4nbeConrg8Jrfqgn2X4rVVAY8PB/0AQkGf9s=;
        fh=JCO+abS6dl6vufp5Cyo1S0aZX4965YVPC1HqeG28CCs=;
        b=RLIjNIdhJPsUh9oGo3HOpdzxvTBa8MnrPHIIppLeith7HmAbQ4vv70ZbXOq5zdleyu
         bd6SU8MeQ4GXw/mcETY8kFxCDG9Lt5r43QcsKARiD9KReNZm3R5bNKewJMTQfD04wN7N
         tM8Ka64IGVkE8w1wK/7PPJGXeBU8cC9dZCRkUy4yiHya+frqT3U6lM+j/ywrGUJQqWRM
         txX/I5JhWRdgmdzrprh2zNZtSnnBxt39qm+fdJBTB0kqQXGFIfbpnx5p8lDuMTFijK75
         Fn7HsxFqv5drnFijeDRG7YSOQqkbcxgjrbGYlbpFxVYSDh/lyXFEebGhTgCsOl2pE7y7
         BzPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9VmA+Co;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471b2d95c47si11910941cf.458.2025.02.12.03.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:26:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9VmA+Co;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiArP-0006Fe-Qi; Wed, 12 Feb 2025 06:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArN-0006Em-M0
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:53 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArL-0004bS-59
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38dcb7122c1so4418494f8f.2
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359489; x=1739964289; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDiUYtW4nbeConrg8Jrfqgn2X4rVVAY8PB/0AQkGf9s=;
 b=i9VmA+CofWfKWjkM/4+NQyGkXKDLc2OJkF5bxGNPcAJdokYFSqKE+A4VSfzmEILW6L
 AAcP4T/ZGjlNTi0Z8VLkyS4F7/hSgkmQPEAh7tikMaxQDwUnn/iUK75vQlX8uGk4w3DF
 /6BFDNFspzKtk3ncSaCXahkPWouJWAWZIkATMsTgAOC9FnMzKLP5sXly6tS7zcTxZjlh
 DSnd2PWC4K1TUzTqOGaW9BqQTPBGMn+gXPTjxUA2hRrT45kcREfRwV7sPB95zCDDi5qV
 n12mq5dKE/CLEwzYKoxDZoQCgYuGfAQCprs7hF3y6w68fyCPNJv3OvHZemVdhk+IOoAY
 JUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359489; x=1739964289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDiUYtW4nbeConrg8Jrfqgn2X4rVVAY8PB/0AQkGf9s=;
 b=cnu1iCwq/mumYj9O3YO2mQONOjWXSOCmDdKSH044rGuwjo5RcYlV7O9ogvh0B9s7eb
 aRwaKwIF/ktZS5CvvnVw4GZNyPuDRAi5mO0T5RVvWNCJDxD9jevvue93rT1WSkWyZZWb
 gyBTd1JEWCFru24UZKj6FFvsYk8N7COrjYspoavHBSDMazRt+lVquFx/8IxBmXcyezgN
 RUqgfpmpYa73Y17J+goDuYWxYyTwwVpqBfyID4tSUsTACBvr2TsPYBp/zoawoVryBspc
 UIanhkKRlphg3ycIp91VgFBAe+BpxmVdxZGd1s5aI4pGZimXTWCcjV0LDhLgYu2zg9FM
 LFeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGj/VsBCSwllkG4vcSOszj7nmRvyBrM9362/Sm+J9/RoyQofvdquia+QC6dyFs/Rz5uZ6tRDcSBw==@nongnu.org
X-Gm-Message-State: AOJu0Yy2arVgbXhey1ujVLWStVGpqQ/1sZgam3nTdgjbvwT7n5Mn7eWk
 KuClSTTB2i0kbU06UErmbx1jmYWG+SvtOZWllX0wJOEaj3POZev/Iu+mryAnT//KwB9yEMZIVh5
 ZkGw=
X-Gm-Gg: ASbGncvw2QgKI1unkb/5rKGe7HLu1E1+iU3SKWsjWo8ysYJvqshAi0GcdBbjyEOqp/B
 Jq/fxlYQZrbLZCgWhuFcXw4/IRdFpRSeR/v+j0R5ek6LlJsAcD4wuivXmrp56VTyn8oVSZt1W9y
 DH2iEEdS+O2/LiZD5YGYhhCH3tjVPTlIc63cxx1Y36H0Rt9OKYw/hAm5n3NMbuwX7NZ77rtPnRn
 Tbk9kAyxpfcx9r811ZZFf5bV7F05AFzakg0uH/dcm/dsEKDYJqZPi752bhq7wVQWwmTSQbCGbiL
 maPZwIO71gkU9hZx46J9ZpqdUPLLfnQChoKnUtNaJGy6MRhv/JAlxjRyU/baV/H18g==
X-Received: by 2002:a5d:5f50:0:b0:38c:5bb2:b932 with SMTP id
 ffacd0b85a97d-38dea25918amr2224245f8f.3.1739359489363; 
 Wed, 12 Feb 2025 03:24:49 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbf6e4a4bsm17005739f8f.92.2025.02.12.03.24.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 07/11] tests/functional: Avoid using
 www.qemu-advent-calendar.org URL
Date: Wed, 12 Feb 2025 12:24:09 +0100
Message-ID: <20250212112413.37553-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: lQTCt7Jwb0sY

Avoid fetching assets from www.qemu-advent-calendar.org
website, prefer fetching microblaze assets from GitLab servers.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_microblazeel_s3adsp1800.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index c382afe6bfa..5bf94d88dd8 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -18,7 +18,8 @@ class MicroblazeelMachine(QemuSystemTest):
     timeout = 90
 
     ASSET_IMAGE = Asset(
-        ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
+        ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
+         'day05.tar.xz'),
         'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
 
     def test_microblazeel_s3adsp1800(self):
-- 
2.47.1

