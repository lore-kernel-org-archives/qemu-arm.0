Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1036088wrq;
        Wed, 23 Oct 2019 08:25:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyP7HmDQYZDKMrkbLl2atbSzaIfwI02nAshVmJWprh1k/GDpELM8oO7jnV2F/+GSrJnonEO
X-Received: by 2002:a05:620a:1015:: with SMTP id z21mr9121757qkj.471.1571844300841;
        Wed, 23 Oct 2019 08:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844300; cv=none;
        d=google.com; s=arc-20160816;
        b=EsYOIEqM7WAGETuJjV8+cmreBo8jF79QPcBgc+KyiwIvjZsDZIlv3wjViU+EHoZzh9
         74oeEGk0A0Fqd4nKzij/IXqFaE3LzE4oxV7Z0xudOE8A0Eb5fH1O9FI+JB/DJNIe5dbm
         OYKRaMQvsYjgGkpMMSqxk0d2OyHP+7Zw+kh55USKnpwl1MyAthRCF/VuxTLw/vxccCWw
         MZww81bBLrmlH8eSFHV0CDOgb7/K5aveZei/Sj0/9P2Vth4iq+6GZece/XCkOaEzpIi9
         fx0MHNY1+KlrsoWVGHzG0Hpsl0bUmmkbobhADSg7Zd8fC1O1v2imXpAUuhVgvwuyS1Sh
         vwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=EixSCP/+s4Pul7ok7q0wZeyo8cfwDyotG9VjfWeZAIo=;
        b=puvuHcKldXrWD9gg/formTRZoxS6xSmHgXAZ8yuEofmCYmL6no2wmPYbbc/EVGxJSy
         ApLBiTErFu5uqHn3gDiAEzqzoEl/1iEX4dMMk4aWbC6PYrvuzewanqymF1TBv91Q1Doj
         5bkMKCe74SFiR7z7zey/vn+D4DxhSJ9LPl+2ldDRLZ3zh3KLD/uYd9Y6A3uqQlLZxnop
         EFhKXYkRjw0Gik2oqs6FU//pV4nUISnu8/NnZqf0JqVgbhfcZGnsA10J/jO4mLGeTnWW
         UrohB0Gr0Gl8y9Y8x1Dh7aaTCHMnMsYO1tJJxNpEgntWor1ta8QLpxD4ZzPEam3xUCM7
         TtZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GlbSIzeR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si2824695qtk.220.2019.10.23.08.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GlbSIzeR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIVP-0002XN-NV
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35352)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8w-0008Ds-0a
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8s-0001I9-8h
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:45 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:41742)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-0001BX-Tr
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:42 -0400
Received: by mail-qk1-x744.google.com with SMTP id p10so20031248qkg.8
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EixSCP/+s4Pul7ok7q0wZeyo8cfwDyotG9VjfWeZAIo=;
 b=GlbSIzeRKSN/EHYUAeDY7EnT8G2ux3tThi7Ui+TJAxomVtmu7TRpeE52UIwqz4aDcr
 469KLYqwpj3BoNTWyfywn0cHwFt2SvViu15RU8ayL4i6KJFRtaYiSYQ7mcfogCzpUvib
 mqLFyGotWK4wklkSCUEsjMaZrOHoVtDra4ZGUgNlGDlEcaby9FsVA2xW+59FE5styI/P
 zWbuM5dF8JWYSZB/zblE3Xv6jBFhcYBXSJlof+R3eRHVXDg1Qrdujt4kxm6p8TJnGYqy
 eIj87hd1XxUL0hlnclvAi6A/WPrYaQofwKUnX7BpJP0e/ViK6xWdYhe6J2ZMEe75oBel
 2ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EixSCP/+s4Pul7ok7q0wZeyo8cfwDyotG9VjfWeZAIo=;
 b=o2FtbNLylkE8kc7RRXlk1ShxFvLDSw+YrusuRiongYFRT0x0CPRj74GjOKYl5jKmLI
 Kg5zW+li/Uuaz0cq8Z6SpXmb9W4BUWeGay+71cBxHRITWNAkC97Gcmej+RNfjd2E5t1g
 zw7BbolZWMEGg6BNvnYj6Mw/WJ9D5cgHFfqpjU3SZZsUb2F+KtdL0YK0th/f5eKHI/SO
 g8qCITyepkavtF3CFHCqFKSP/Avpd+hObEdGWX58seLQSuSl0s1G94VbDWLgfVRz8HmB
 bVdf15jBDKze1IvbPBRxqlRLJIedh/uwsYEdhHQYf9z/hNqZkp7IpG3gIE/0TwxRD9BX
 2JnA==
X-Gm-Message-State: APjAAAV4Wb/9VQFlSbiBXrion2zIX1WcPhxtwssXm8GXU2VjUZLdj4T/
 M3mKlRsTeSi/5g1t4kryJfRKGA==
X-Received: by 2002:a37:6554:: with SMTP id z81mr3910082qkb.9.1571842893582;
 Wed, 23 Oct 2019 08:01:33 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 23/24] linux-user/arm: Rebuild hflags for
 TARGET_WORDS_BIGENDIAN
Date: Wed, 23 Oct 2019 11:00:56 -0400
Message-Id: <20191023150057.25731-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
X-TUID: 8GnuTv7rCEgB

Continue setting, but not relying upon, env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index e28c45cd4a..7be4071751 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -440,6 +440,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     } else {
         env->cp15.sctlr_el[1] |= SCTLR_B;
     }
+    arm_rebuild_hflags(env);
 #endif
 
     ts->stack_base = info->start_stack;
-- 
2.17.1

