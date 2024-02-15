Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp738646ejb;
        Thu, 15 Feb 2024 10:03:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHDD8BpN4g71cvBEUnMUGUi6qRmDW3IIqNcJXPb6NvHLlLsy1hEFIM+4E/MxZgV/aQXkVTqXAgn/24ZO5wPJAd2j9OBoXi
X-Google-Smtp-Source: AGHT+IHXWVimVRS5k+Qznef3JBMDZXG00wmpLxYr9dbgiv/sXJVtW65knKiLunzbcWBhWkDB6l1n
X-Received: by 2002:a67:fe13:0:b0:46d:25e4:df10 with SMTP id l19-20020a67fe13000000b0046d25e4df10mr2771043vsr.30.1708020206508;
        Thu, 15 Feb 2024 10:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020206; cv=none;
        d=google.com; s=arc-20160816;
        b=tFh9fUoQVa5YN79xoAqZgSvq3xLAJ/5N+Pn2hOp9g56FvAoJ35L34nmvC3nL4o6wY7
         DZ/gFhqopy9AapuU8vQYtavsTLLTFA0HWT1wTnzXBOn3GF9bCoNjY+ZhSaiRKKMArwrc
         n1yGDIgNx1LgRqfdPz8w148uLa3DGJfkusL5E2X1Aj8AzBi8pMdjLoQ+uxsmEd5Qe3/3
         MzqnoA1XZioPrsZXFFkMLkuGC7MQ4J5FpXeVRuBgbNKdqlzJ7LqBV44GO4HgElq9Wv1t
         vrSx61Fsd456KfLH2TQimHV8huxU7KCBpEw76at3uRcAUyecVAL1+QDrsmBf1yY4s8z+
         JPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dKQRL6VpdheWarEt8u92abxs2j4nOpChsuFzwfI6A1Q=;
        fh=m+Vd/L8Fv4PFnOqZwtv66vpR6hGhdkN7t0zGF6cYI4Y=;
        b=Iunu3PiNQyRaU77jm+5Q/YLFnE0NdbeiYp5lHl/3Rhc4W+KwEYgadMj9CsE4fitMMM
         BReCM+lGb5MriMUPZq0fgTjVPUCZbhsmL79e/hBqj6Twbi0ZzDtUMyw8y9d2zVmJWRZR
         7VFU9ZBlNI3/7uSIrtOaja9xBxRFFo8jC8EcI/sektD3XUIbUXTBRLoZJU4H6k1JxlBd
         6EduQqZJITh0/eIULHleS6JyvXXEhqVHgWuv6Wo2OQNhrOuOOYHsToyRc8ktEJNOAdB2
         YR4uws5a6b4tmST0onQUFLXmHapI25zD4mlRobiFkmMGNBBdE8RBY2+fDqxblzWSSX8x
         fDyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDhse0g3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a0561023d8400b0046d34328b02si398122vsv.157.2024.02.15.10.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:03:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDhse0g3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rag3C-0002sJ-Hs; Thu, 15 Feb 2024 13:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2q-00029w-Er
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:01:13 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2o-0002QN-0s
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:01:12 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so1427403a12.1
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 10:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020068; x=1708624868; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dKQRL6VpdheWarEt8u92abxs2j4nOpChsuFzwfI6A1Q=;
 b=KDhse0g3JgeSjUdQJw8MPxW4aoQwbPXP0J7XwXN+ucVSEEygNJStez+0kP8aRDIcXZ
 ivAZmHL7mEy2IgaMN+Unh84p0RWN/7VMiApQUD6BOH0LKfCdA9xRRbJxY4mKCaenc0Jd
 hnvIQWajIwDxtEU5/vW6DXwPoTOaStMokhjC91208lWQI8OBpyiNcUPTXM2O3C/Alq+d
 lg9EZImac8WEg3D5TfK5xqnZfG2mspp3NcNnnCgVP/uHsaEO17MtXbXBpkYQRG61N9ZK
 ZQ2eZeBVVr8LGdWE4L8aG9ft2eSSzm+s1fSQ5WAwhZvpUy1Fdf+lorXUN/eTDc3wsrep
 9ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020068; x=1708624868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dKQRL6VpdheWarEt8u92abxs2j4nOpChsuFzwfI6A1Q=;
 b=hA235Qqp+NTqgFRvLQF2a+2X60hwzWq93biGr/UfkhPYSgk3xM9rr0kfU10NATgZTK
 rVJrUtC7FkThjrBF4K3/d+2BG08EqrJCVJn9lw5d2dDEqb+IfugbO/xo2YIjVceNVvXM
 2cMRGnAoTGR5hRbBYMCf9NbY+14KZyI92+WAjGlQtNHCJKHeUyl7MrzkD5qAZYAni0Z5
 vA/iXPc/jvtggxGMajp13dJ3BGVM68rhjS3S5ZvoxHx5UgISazUyCIpEQJWV3qo7saZi
 BxyOyt+Cmjt8a61UryXgCFi9DFJCx7Ha9U2HuZqdsIs+jMiF1XppDcogbUhrhV4DXCcz
 dTXA==
X-Gm-Message-State: AOJu0YzFzFpqP3bNgSSKfRGo4oTTwWjEELzoHkshhANOVjJYODR9VvZh
 XS9OgIJlH/MMoykd2+ODQs/2Jsn9nRlcbHLeUX1i2VOeuCY7sMRojnsTrMOUT/+9Ue4wAO9acLx
 rWt4=
X-Received: by 2002:a17:907:20a5:b0:a3c:f576:5f0c with SMTP id
 pw5-20020a17090720a500b00a3cf5765f0cmr1731792ejb.30.1708020068450; 
 Thu, 15 Feb 2024 10:01:08 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 hu21-20020a170907a09500b00a3db6caba06sm302775ejc.1.2024.02.15.10.01.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:01:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 29/56] target/sparc: Provide hint about
 CPUSPARCState::irq_manager member
Date: Thu, 15 Feb 2024 18:57:23 +0100
Message-ID: <20240215175752.82828-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: PQhZ2743vwcH

CPUSPARCState::irq_manager holds a pointer to a QDev,
so declare it as DeviceState instead of void.

Move the comment about Leon3 fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Clément Chigot <chigot@adacore.com>
Message-Id: <20240130113102.6732-3-philmd@linaro.org>
---
 target/sparc/cpu.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index edf46b387e..f3cdd17c62 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -545,10 +545,9 @@ struct CPUArchState {
 #endif
     sparc_def_t def;
 
-    void *irq_manager;
+    /* Leon3 */
+    DeviceState *irq_manager;
     void (*qemu_irq_ack)(CPUSPARCState *env, int intno);
-
-    /* Leon3 cache control */
     uint32_t cache_control;
 };
 
-- 
2.41.0

