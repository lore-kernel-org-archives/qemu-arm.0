Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp866303ejc;
        Thu, 11 Apr 2024 03:47:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsh84d0FvYGhGas8gm3g4Qh6BYQbL968MwkOEFGC+GlGTfLexgTlX/DVEl6O0r1G2fB5eOK/kqQyJgd2mLmZ7LLvbrs299
X-Google-Smtp-Source: AGHT+IFV40JjS9XXodQjT6R6nn3ij89D7aGn4fV2MDgU8eeySYpR4ahGCEZGeD4OFiES3BexcMtM
X-Received: by 2002:a81:5210:0:b0:617:ca11:c7e7 with SMTP id g16-20020a815210000000b00617ca11c7e7mr5500974ywb.40.1712832423452;
        Thu, 11 Apr 2024 03:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712832423; cv=none;
        d=google.com; s=arc-20160816;
        b=02XQsPRg5OLo+4AmmIW8wYbpiZTtntFaapNHYc6JptzLYEKb80ykYSsVV/Z6j/6JVS
         pOqVHdoVb9Nhn1vBdf5TjeSvjWpPrczeu9UDXA4rMgKm19p1pB9zyHa1hWCWvyIvb5Bu
         iVSw1i0pMdMnhAV68gXuUCF7pHRkbZwjROYYyhXdv8nR/IDg48RO66gA3vx28/MJXpO2
         iWQK6QIn9qPJIEJ8m1N0N2g7LVHbvpNLmHZi+3QqUP13Sx2DkHASgaOWiNXheTwRWRY9
         eUEPHEhhpvOA1RRZ3AkALt+sI6F75m9BaB1r1dGt+jLptQIQSAfIQruP1tQ8Lox8pp4G
         PHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=chFRh2l0gcnmg03fCHQ7SXYogZ+gzE1I40m0bX1o6CE=;
        fh=jEo26IF2bP7suy4j2a7uS3d1x4iJkJ3pSZ98Jz/at3k=;
        b=NhCI6gD5r2bVAj24dX6fOYYdC4Luu6yj1zSOx+ikseVbcN7l00NJlv4BTD4BMn7BvI
         3X0r2JLoEZLhuUzW5CzBRXPmiwvlrY3NqPkLiITPrucgCEjpFBQGDcX/ke/uKIUEj3H6
         oB64Q4IW6zFKsbz5DArGSrj7fJFap+iZXULLzFER74Qvo6lhbbp6eqKo38EOS3jTjK51
         xZVwKmw0Ls/2nFX1LFGUVBXikrPy36skr1dwppOd8lneoouPPoI6/LP5nP66GLNi8M9w
         6hbTkyhprRb7jG7igf71o6tn7lu3imhHWFwls5ReV6y4MEl6kR23qb0tjdAYiByau6rT
         Tpcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c5j3mEqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d29-20020a05620a205d00b00789e3ef2585si1281157qka.692.2024.04.11.03.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c5j3mEqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurup-00035p-4e; Thu, 11 Apr 2024 06:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurun-000301-L1
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:44:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurum-0004Mq-2y
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:44:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-416a8ec0239so4319675e9.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832259; x=1713437059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=chFRh2l0gcnmg03fCHQ7SXYogZ+gzE1I40m0bX1o6CE=;
 b=c5j3mEqIll58L5zq6hJWJGZLhH1d7hh/36VU6fYKyFvE7mJflDy8Z6/IxZVkoclLC6
 Us8uwAhhcOIjWRB5wKRchzmwBY9E8yf6W7fULJ3Be0ehRRyuTjBJs7WSjbMAS975K7I1
 PnAl+pFAkjmudj99nUZ3jEWvNGzGwp9ZFJi3xAI1T/6HJIcJkRuntvyUWhmoIvfjTisP
 akSmFEtZuSWCMwto/n3+ztSYikX0U5COHsw7i6pKKvHG7ObedGuMRSDVuA/150ek0E8q
 4YLe8V0pNGJw0WHllYGIl96QB5dm81ulpqa5jVyiGSJeSyrl4gIdQ6bbft69/BKMkLCJ
 wjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832259; x=1713437059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=chFRh2l0gcnmg03fCHQ7SXYogZ+gzE1I40m0bX1o6CE=;
 b=utP5moZVzdt2CfxjIwO+qA6gs17dkp+ZjEqsaLkHzjirO+hpzEU6/Mm61Ryg7cu305
 3yKPPjgcQCZwBrJGDOtMEOWG1NnufPv6e6BhWlX0t+ORF3vx1Q2AHOrk7pGK3SG0yEPG
 ENKJHLSff8E1auL7pD7kFifEXlQban4We+xQCoDyOBjZjLQrDtk1l5QkUL9nSZk7q9hR
 OHX1jALc/UFGXAVfBwlpgMxCUvn2aOrRVWKGUmCyKNaHYCkLw2L1g4QgNc69nigXIcOC
 5aWBw8J+9CDwcEN3YVPa2qZqVlDIeazHtXX2PgNzC9u0vdH0A+820DGQLZt8NopTaNwU
 CIVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfvofZxtSM1v3AWahEQ4iAVuNI/5ikn8jm+RomXx5EUxMT14S8zkPhsCvwD4PG/GBmCJrYZQ7XIdEiNCmFCEa5TAsk
X-Gm-Message-State: AOJu0YyVmffr5nKJMXLB+vVVyzj82m5m/jyl8kJ9IN3+nvbuY1IVg/Z0
 qM3tkCwJCTcTZnI7qJ1plYMFxu9Ph8lUEZqGq/lxpajSKxoWPWfPItaTJ9ZDTac=
X-Received: by 2002:a05:600c:4f53:b0:416:89bc:dec6 with SMTP id
 m19-20020a05600c4f5300b0041689bcdec6mr2004919wmq.11.1712832258773; 
 Thu, 11 Apr 2024 03:44:18 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 he8-20020a05600c540800b00416a08788a5sm5123079wmb.27.2024.04.11.03.44.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:44:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 6/9] hw/net/rocker: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:37 +0200
Message-ID: <20240411104340.6617-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: AkaFxL6PL7b0

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/rocker/rocker.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 7ea8eb6ba5..03ac7a7ae9 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -915,40 +915,40 @@ static const char *rocker_reg_name(void *opaque, hwaddr addr)
 
         switch (index) {
         case 0:
-            sprintf(ring_name, "cmd");
+            snprintf(ring_name, sizeof(ring_name), "cmd");
             break;
         case 1:
-            sprintf(ring_name, "event");
+            snprintf(ring_name, sizeof(ring_name), "event");
             break;
         default:
-            sprintf(ring_name, "%s-%d", index % 2 ? "rx" : "tx",
-                    (index - 2) / 2);
+            snprintf(ring_name, sizeof(ring_name), "%s-%d",
+                     index % 2 ? "rx" : "tx", (index - 2) / 2);
         }
 
         switch (offset) {
         case ROCKER_DMA_DESC_ADDR_OFFSET:
-            sprintf(buf, "Ring[%s] ADDR", ring_name);
+            snprintf(buf, sizeofbuf), "Ring[%s] ADDR", ring_name);
             return buf;
         case ROCKER_DMA_DESC_ADDR_OFFSET+4:
-            sprintf(buf, "Ring[%s] ADDR+4", ring_name);
+            snprintf(buf, sizeofbuf), "Ring[%s] ADDR+4", ring_name);
             return buf;
         case ROCKER_DMA_DESC_SIZE_OFFSET:
-            sprintf(buf, "Ring[%s] SIZE", ring_name);
+            snprintf(buf, sizeofbuf), "Ring[%s] SIZE", ring_name);
             return buf;
         case ROCKER_DMA_DESC_HEAD_OFFSET:
-            sprintf(buf, "Ring[%s] HEAD", ring_name);
+            snprintf(buf, sizeofbuf), "Ring[%s] HEAD", ring_name);
             return buf;
         case ROCKER_DMA_DESC_TAIL_OFFSET:
-            sprintf(buf, "Ring[%s] TAIL", ring_name);
+            snprintf(buf, sizeofbuf), "Ring[%s] TAIL", ring_name);
             return buf;
         case ROCKER_DMA_DESC_CTRL_OFFSET:
-            sprintf(buf, "Ring[%s] CTRL", ring_name);
+            snprintf(buf, sizeofbuf), "Ring[%s] CTRL", ring_name);
             return buf;
         case ROCKER_DMA_DESC_CREDITS_OFFSET:
-            sprintf(buf, "Ring[%s] CREDITS", ring_name);
+            snprintf(buf, sizeofbuf), "Ring[%s] CREDITS", ring_name);
             return buf;
         default:
-            sprintf(buf, "Ring[%s] ???", ring_name);
+            snprintf(buf, sizeofbuf), "Ring[%s] ???", ring_name);
             return buf;
         }
     } else {
-- 
2.41.0

