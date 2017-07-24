Received: by 10.25.44.15 with SMTP id s15csp4191990lfs;
        Mon, 24 Jul 2017 11:42:50 -0700 (PDT)
X-Received: by 10.200.54.139 with SMTP id a11mr23285152qtc.318.1500921770302;
        Mon, 24 Jul 2017 11:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500921770; cv=none;
        d=google.com; s=arc-20160816;
        b=rbdInDgt5K57PUuVksp5czZ1Z/VjImH1VRGeMPW0+Bxvs2ba8h2TuOPzkbLx7EBbPg
         TM7wACZ1f/CVmRmdaWZW8KhC+KN7mFO7jbvGPBLFp6IslT+XBLgNjalSnYRiXy5sIK0O
         bMVuvHbEu9Ew/IsNXl10tHgXct2cLago2kMhUhwzuV4SOjmIC7jknC2j3jZfI818KFxF
         tTjiXsMyVRsl2V70/5/k2YHqwhrQMGNzLPE+LaGgFAzmWHCHh9ZI9pB9Nqqz2rN4adoZ
         bev2O5p6XC7NrWfyQZyijSDhaf0m8bG5mFr9mzogLWElF91oLEpCxvyuL/L8LC09gHje
         ChKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rS3tqT19YdULv0e9r4PvbAfIJexWBni5G2TDPShS8kQ=;
        b=t7RMXSUeypgFVSN0lTPujKZMXbGGgggVtt7z0YVeyq2tiTmvSKYS/qmE/NOxq60CMJ
         3S4bhntUiACbq5Cb3fOmS82CyqxZ5xF7sAeUFCGpj6fGwkT80J3KxZE8QJPK3O72+LG4
         NXx0il4guypCfSdnBJi7rHtCqAocjJRs7EwDieKHtOUL18eWn25M3wQE/5JYXy0fJ3wO
         nDUz0La17hARejyPvU4ug+bT6gcLsBb6RnIz8CqCqwp0f78UIK8LlRwTZKHobdEi3M9I
         h3zOsPAS0qNNJRC2raWc2kp6Cf0Vvve2nh2b+m3429lBO0ZbNEDiTxa+OBKINo+BDfnb
         93sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=W3hijY2H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si814475qtd.40.2017.07.24.11.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 11:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=W3hijY2H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZiJb-0003eE-DV
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 14:42:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6U-0000ln-3F
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 14:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6T-0005UT-9U
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 14:29:14 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6N-0005HV-2W; Mon, 24 Jul 2017 14:29:07 -0400
Received: by mail-qk0-x241.google.com with SMTP id d136so10667176qkg.3;
	Mon, 24 Jul 2017 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rS3tqT19YdULv0e9r4PvbAfIJexWBni5G2TDPShS8kQ=;
	b=W3hijY2HaCvuu7ZY0kc+Kgkegao9kPXej/+NBBom1XsOlgH/hhHUwj94/GGzdT/LJQ
	fhQxwMuwP12ICPY0396mOKZ7QfP/hnwsHO819ND/1tdiMl5ndV3iRyKfIhW/bN3zGu/d
	XjY7fKz84m8gOh9ZSbX6Q6iH5lZTztNbHUXS6y72RGnYCq0REpI1WAiLyWVcZGPtXrC3
	iHT6qFPempGuAVNGZa7/NUgmoLOMDoverzU2ftT3tOiQX9ulMd56J2tME+t3UPlXVmLy
	+ltMOyh0WGYakS3UOYPtWgzzo+SBGo+Oos2A+CptB7c3DPR657c1VA2CKVc9Y34usu7X
	UHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rS3tqT19YdULv0e9r4PvbAfIJexWBni5G2TDPShS8kQ=;
	b=fHdNX2rsKiHMLiBb8acxQ6EmDDwvSfK1BBYYv/JEnyumj9n/1YtukiRw8hfZ7rGSsA
	EPbGcMWCXa5WYnXWtXt3Dzp/lW/K+5jrQiogat5QdTzlcRuD/ynCV8XJ84q8OEqN29yC
	pw0h7fYrZx2KemP6d740EdIyLUS1KZU1gsvjrlZbniWYjCHVjfQHXihEeFXTrWth04fh
	8yxRmraKzXh1Gom8KdqlHAXrGVrrwLbMbip3xLdNanRrZQBYbEug8a2Tf8gq7saGy+Zp
	3HQB8zH3/LD3INV9GibA5CKV8NVofZPG2Ck6YtCV/w3zEbaF4MVgUhfc5/1yOqroOh4D
	4mBA==
X-Gm-Message-State: AIVw1108kmX2NoGnrmANvTjnH0/At5x371BKPGR/BBBHV0zZUO9MvGK7
	Tq3qnjGVUxtbbw==
X-Received: by 10.55.42.104 with SMTP id q101mr20383599qkh.84.1500920946594;
	Mon, 24 Jul 2017 11:29:06 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 15:27:36 -0300
Message-Id: <20170724182751.18261-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH for 2.10 20/35] arm/boot: fix undefined
 instruction on secondary smp cpu bootloader
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ayGcfQ1RK7i8

In a ARM multicore system, write_secondary_boot() only initializes fixups for
FIXUP_GIC_CPU_IF and FIXUP_BOOTREG, while smpboot[] also uses FIXUP_DSB.
This results in write_bootloader() using uninitialized fixupcontext[FIXUP_DSB]
instruction in the bootloader code...
Zero-initialize fixupcontext[] to avoid this issue.

hw/arm/boot.c:157:18: warning: Assigned value is garbage or undefined
            insn = fixupcontext[fixup];
                 ^ ~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8046..fb21f113c2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -170,7 +170,7 @@ static void write_bootloader(const char *name, hwaddr addr,
 static void default_write_secondary(ARMCPU *cpu,
                                     const struct arm_boot_info *info)
 {
-    uint32_t fixupcontext[FIXUP_MAX];
+    uint32_t fixupcontext[FIXUP_MAX] = {};
 
     fixupcontext[FIXUP_GIC_CPU_IF] = info->gic_cpu_if_addr;
     fixupcontext[FIXUP_BOOTREG] = info->smp_bootreg_addr;
-- 
2.13.3

