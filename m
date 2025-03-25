Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2955692njc;
        Tue, 25 Mar 2025 15:44:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWupmzl+RewbFvuxnImvWba1lt2csFawo/8MjcyuCoYfqOBFdyLrpk4/7OAKF5kTrVo3vqoEluGfjQbgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHBivb3tK2g7ZaHYDT4qLAuoyTTCYSMXFziSlXdMMsMOgxsEAzacwxsTS6E37+VwHxKri4l
X-Received: by 2002:a05:620a:22b3:b0:7c5:a424:1f67 with SMTP id af79cd13be357-7c5ba184095mr1951132885a.29.1742942695674;
        Tue, 25 Mar 2025 15:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942695; cv=none;
        d=google.com; s=arc-20240605;
        b=K3aoE6RW5FUrc0wpqiiwuzipjF1AiECSp02tkytJHToDYBMOdBsFh3hBEotllaKGaf
         g41v9GUzQMGC6Wt3FfhrqtcuxDp8eRFjcpxoY0BeKg8evgj9cGySpWILKCeGrUwqFKUv
         j2q9FDMO7gRmoY49oWBzk8OLkl9JX/SiH44BJYiQVCmlN4eJUg+2TrvyV/dCEXgkoKi9
         v0igZDyNzViJDF+bE1FJmC8kkakNLQQybX4B3fTNt9CbxGywiA3UwB2M77+RwTRhft7E
         Eut0+w4zPvtGKGDW+m4uvmU+EoMvUcdy5ig9Q/+dBlss5DUQ5+6qakEP7rhVtsQ6tFU1
         Odww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E9/STNz6nQDMG9kyJBqDX5R7dSuwG1jTpb/QPXoh7r8=;
        fh=qvO3y/6p6rCVHcMYoc9ohkAD9L7ljedGWZFlRkS/27Y=;
        b=AkKYsL3EN0OL/XWp40wcDuP894YlOFkzOruzMwGQXr9IsbFxfOMpeyXvbAFo5+Ucyl
         jYyJv2eEzKoSX/y4wFTjQVt8152KbnhWNZZ3pcXPdfJ5r+noNK6mADvEAlCwA01Za7od
         8XF4maXhqA/T1RZkGVum7yHpbMicHAUjZaJZUwag3wNRJpbmwvrV528qnb/GX0v90047
         CL4AEWucNHg75W7vEkL7gOmXj/4kt7OHAAUin5K9dP3MsxlDG02fFAHZfzI70IweBZ3z
         EGgUwQmLVc7AdiB6GzI7qPPzjyR+Ail2IzRrsh6VnQA9nBJxG+Gql30PtyaeCvPW1gbA
         igMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s2ZTPOPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9346f59si1065344585a.304.2025.03.25.15.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s2ZTPOPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txD0M-0001vL-Vu; Tue, 25 Mar 2025 18:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD0E-0001MQ-VA
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:44:11 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD0B-000725-6h
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:44:10 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so2130840f8f.2
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942645; x=1743547445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9/STNz6nQDMG9kyJBqDX5R7dSuwG1jTpb/QPXoh7r8=;
 b=s2ZTPOPJs+eqBeYXrVm110GfrZ8gpa+8maI8Vfn8yUdQawg+foKJJSYzCGHkpgVYN/
 yai6KOOfE6h8lI75Xzg4TT3iGnDNo9hjiyJLBsvWYjV64lpxWXVEvIuqzQmh5Wa4xxBz
 5TC88HjQeogoy/zKdPglzdxBP3zageHuWpXs5MMD1cM9QTTOTDC8cpOUN9qSHwPnjq/c
 EyqfmcjEXFWn3oXkvmS4ivdfYKtdoitkTBGUrlkciqRhgRiMwWoOvZxfaMeSZndLQ33W
 A9+OMQtbCSZL63OHfdu7YHVtMYv2aKeDJgDXAHceXPBirNNht0Fje+aDA9XUgmUs4l91
 9x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942645; x=1743547445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E9/STNz6nQDMG9kyJBqDX5R7dSuwG1jTpb/QPXoh7r8=;
 b=rQafEzRe48PM4Y3KrWNo6g+mhsWhOd8RXUehDqhhir2FI0Pp5h7xH59lHiez2GMdeT
 CcsZcKRrD+mnN6U06AYp+aX4QQsSFo6wp9pn60D/WlbnganyP8en/m1V9pahzEfPUSxj
 w8BPbsl6ztPXHGmkIyeToap/wVU7Cf2Nac7mM4XUurW7Uz7fuL8NzOJbtA0frZGPgMDI
 Wlemy9FZm43vea8b0uCSEJCM67KTcv5a6I/Ja0eOCfV0h3SEWLwfbd0Nv4mWZMBdzGuc
 uwgmyNiuHzjWg3g2iIn0Ktr71MkyGt4xIuq7zsoUhSH73q4NP4VvwCooK+kJlj0XCyPN
 0k6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3s3YO1dW4kTLkpjs0nduM+AbXanHTSFCb4AGAxj3b+Zkws3I1aW4+7rBf0FPZrLaHuVzWfkxtkQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz2f2LZtohY1pjeS6sn3l5+x1dLy34AAULuLDJnSIMYKT6hY9u6
 P1IM6gtWFLMFw+hKgXNPQhAZE3u7kCHV6pQv3fQ+691xLJCWOIc+9nkYE6p3rh4=
X-Gm-Gg: ASbGncuXCwzqk14s52/Y4F4JUNgOHECldhJlaFVQZ4S4DiryVJpQOuJmEq8O14/O8a3
 qdx/A974iEWjmR3G/6hGvshGiYNcqMQ6F3Rlfzgia2S8UYGlRHwS5x/cZ0xYPE4bKU2uL/U1wvI
 uRNqHO3L9Q1DKgQM8g9FqOqtK+WagVYMaixmqCdol+qANjdV4jxK98YXiDj87pyD86XqJ6x3Cfm
 lUZZHNBkKI1zv/yP/qe2cvsjnMA8G+at4ODZ7/dgZ7Y0nrjHAxWGHdkyqwQj/OcG8TgpuFw4q+x
 YSFujlJhwDy1U9fo59kOa3N7UaCsqFKw8lqFXbGipgTFExG7HSiNDjLplgs1XNYrW1beBP0Zcrv
 FrA8RZekl1cvIUsbTvN0=
X-Received: by 2002:a5d:47af:0:b0:391:2dea:c98d with SMTP id
 ffacd0b85a97d-3997f8f89bbmr16627163f8f.8.1742942645300; 
 Tue, 25 Mar 2025 15:44:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeba1sm213436255e9.32.2025.03.25.15.44.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:44:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 09/12] hw/nvram/xlnx-efuse: Do not expose as
 user-creatable
Date: Tue, 25 Mar 2025 23:43:07 +0100
Message-ID: <20250325224310.8785-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: OeUX85BAWdzZ

This device is part of SoC components thus can not
be created manually.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvram/xlnx-efuse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
index 29e7dd539ec..176e88fcd17 100644
--- a/hw/nvram/xlnx-efuse.c
+++ b/hw/nvram/xlnx-efuse.c
@@ -280,6 +280,8 @@ static void efuse_class_init(ObjectClass *klass, void *data)
 
     dc->realize = efuse_realize;
     device_class_set_props(dc, efuse_properties);
+    /* Reason: Part of Xilinx SoC */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo efuse_info = {
-- 
2.47.1

