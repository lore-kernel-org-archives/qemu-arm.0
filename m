Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp256208njn;
        Fri, 10 Jan 2025 08:03:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6//KzFPi7AjO7TuADJ41gKJpBaUB5bbPKwyKUFBCAipxxZ3UoNGeRuNTkF/3G5hmeaoFMAOijiB9qfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFUzRBeGfuw6m9KPmVExue4egHwTAwH6r0k1seFphjEqjz5J4uPfNvZtlUQqVlefujW/0yh
X-Received: by 2002:a05:6102:d86:b0:4b1:16f8:efc4 with SMTP id ada2fe7eead31-4b3d0f9fa0bmr11041091137.12.1736525021819;
        Fri, 10 Jan 2025 08:03:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736525021; cv=none;
        d=google.com; s=arc-20240605;
        b=DhK1T0+GPvMTkQhPCaPoQXwVWpn1bexP760GMjwuPd+k1xdGE6SI4yx7oWy9jAhOIa
         TskrG9p9jcMB0sl/u+aKa+gxI+NHirzScFUNcHS+Nvt16CqEcN5ibjwPjdKNwCXhmtjT
         rPEt9JGFU0BRb3Kqn44k9da+6VeQ0vGJ8bPeHdNCAWlHwi4MSkiU2Rl6t0QOlMErVk1v
         e8EzYdVqKEyrjxpgdBc8xw6Nydnh5PKKedatxG8tAY3b5w1YIqwlctSkPHFfeNmpdG2z
         4LeoeuVWtxEzXMK2Kt8jnS/Jj5+ti+VcVt+KlJxnEzhT0CIUsYJWX3NWPotUifrgbcwF
         UpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+1SHV4ouwmWCxa4hls/VEliYDrrRoOnyygtn8mgw1kM=;
        fh=R8SIgdvnkYJzu29d23a0ixRVm0NtwD9zq26xwjEPJoU=;
        b=L1V3omgyVmes2xHgr+fTN87U7haaApm5Ft7s7xPhcfppBt+LV8xCk+C/WlssnPnxky
         xc0WNJtsr5ZvEKhiKdgPppFgzqfGejUHecjQoJTQrkQW8dE0uUmxiTv4r68aZ4XF9jYg
         yZRtejZrYwff1EiI+Stw18K2j7x6ue+uMRADZhY9Udq2qj1lVTtuHxfaByOx6b3TeGOy
         8oneGzqCqMvbZaqA5JLrZwSHO44keCYqoGW/CwadBnsHFUxKsNGCgCFTDDnOVI08f6lU
         A2hHrHuA7SI221KsRsGQ6i5sLjFDDWp0Z0FJn/qpzBBqYvGeDSl0xgqqC784BOIqhXM/
         x85g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YCW5VyiD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b6092fd913si1538821137.413.2025.01.10.08.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:03:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YCW5VyiD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHTZ-0007Pr-TQ; Fri, 10 Jan 2025 11:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSo-0007FM-TW
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:26 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSk-0004C4-CZ
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:21 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361c705434so16827905e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524935; x=1737129735; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1SHV4ouwmWCxa4hls/VEliYDrrRoOnyygtn8mgw1kM=;
 b=YCW5VyiDAxjhZbB1P6jmdgoxRqXchg1SqeLkZLeiikLr9RIxth2PgjYd3Nqi+6skwn
 pUS6ZA9WZD06I1Ku3+actb+fwPPZep+b5mBC5QYR9kOmGUGSIvmJF4Dh8fIOt2710Cbd
 u1Z57J2694spJhLJnXwyvth7Tm0GSSb8QpgFNz63agok4JOqpynyZHLGoMxfEqfWVqYC
 5+rLOjNCV9i6h+GqgdKxumRwKHYO5y+Hu2Gi6/JgEkzPAxCPIHkbyRaoIzSmLJLqKwgT
 bLSGNMPzT/bz4zokIkfYmMOmJwwAhpDlftvdN/sizW3L7KmVPA0yMi/2wPaEBZyLoXdD
 /4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524935; x=1737129735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1SHV4ouwmWCxa4hls/VEliYDrrRoOnyygtn8mgw1kM=;
 b=Qm5uvZb2GFi7oKaA+ePNlY3Sqm4U2gHyFqE+2aFRQTPjamK6hobA6mt5HDxW9I5dZE
 vled3RznknEX0sSYUK9/j4YpMqOHU0cN37BnLpSDUN1K9qgzF8jIk8QhK4RR44mAP1g0
 ESRbqT4Kto/33VkZ5/k62UKU4FyK0+/ogm8fJJUOYvqQOx1QkjPHtepgWv8dvatu1TfO
 tp1+tLOmzSMmzlCeusx5YHTQkSNlAWYRii0Lf0kl0EKUDlUMKTn02VEcY0V8WGLgncb4
 /i/DYfT2xZoD7G9odwYOWcavXmsy3pdcBI1o19cUz7XeoA46Y1G1v1jialmaGIAIryMg
 0z0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwkO4ju8GiR6DtwDPd4GwieKqz/VoukZIO/iXoyz7IK2bj59KcpNYS5pVJulx7Pc4Us7UdmrUtWA==@nongnu.org
X-Gm-Message-State: AOJu0YzmIJexPRHu+nLTX/F11IgqCcdXwUwUVL4MoghtNQCMDyTjsDJN
 YWUhjvedGi6NOKvtHnBKB2b5w2u/35wSZk1fxAB/mTgmFAB8vMAEvhC2tXwlfFM=
X-Gm-Gg: ASbGncsAiBb++9RW8zPA0vMFNEptqwkbCZyY52Xip86y8zzFLAm3XFjxAfc1qMfy2Ei
 amMG3u/pYxknkl4Yf++IhOicsOWANrMyyNd4AnzPpC97dq90MpPANVeOJCgMhD82mSzfwSJTqRl
 Nf8oj8F+noYD3mib3zb0LRJES4CLHlwzUg1ii4MRKwnWNjMbjsnuJGMn0GD5jDLErepphFPuawa
 U474nWUoCsVsw200YVH4/MOG8sKHQG++0Mula6uu4l3hWSIjzBkqrD1YHx/U9Sr/SOGk4XYZjUc
 q6w5Uj5AxETqgdM5U3gNtqTw/y8FwNM=
X-Received: by 2002:a05:600c:3b0c:b0:434:fbda:1f36 with SMTP id
 5b1f17b1804b1-436e26e51a0mr99968965e9.20.1736524935062; 
 Fri, 10 Jan 2025 08:02:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d69sm55675815e9.30.2025.01.10.08.02.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/9] hw/arm/stellaris: Constify read-only arrays
Date: Fri, 10 Jan 2025 17:01:57 +0100
Message-ID: <20250110160204.74997-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
References: <20250110160204.74997-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: gOxDdfNk8yfc

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 9b414ff9069..7c9e7e6c15b 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -101,7 +101,7 @@ static void ssys_update(ssys_state *s)
   qemu_set_irq(s->irq, (s->int_status & s->int_mask) != 0);
 }
 
-static uint32_t pllcfg_sandstorm[16] = {
+static const uint32_t pllcfg_sandstorm[16] = {
     0x31c0, /* 1 Mhz */
     0x1ae0, /* 1.8432 Mhz */
     0x18c0, /* 2 Mhz */
@@ -120,7 +120,7 @@ static uint32_t pllcfg_sandstorm[16] = {
     0x585b /* 8.192 Mhz */
 };
 
-static uint32_t pllcfg_fury[16] = {
+static const uint32_t pllcfg_fury[16] = {
     0x3200, /* 1 Mhz */
     0x1b20, /* 1.8432 Mhz */
     0x1900, /* 2 Mhz */
@@ -964,7 +964,7 @@ static void stellaris_adc_init(Object *obj)
 }
 
 /* Board init.  */
-static stellaris_board_info stellaris_boards[] = {
+static const stellaris_board_info stellaris_boards[] = {
   { "LM3S811EVB",
     0,
     0x0032000e,
-- 
2.47.1

