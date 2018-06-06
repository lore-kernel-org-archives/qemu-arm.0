Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp965202wrq;
        Wed, 6 Jun 2018 08:29:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJyoVBAmOlim62ZCMfJsPOKDz6d2E0B1oKX0ftb2rlmh5sNHnGEjy9Uyy5643sZNhGDbHvO
X-Received: by 2002:a37:be44:: with SMTP id o65-v6mr2785202qkf.439.1528298981543;
        Wed, 06 Jun 2018 08:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528298981; cv=none;
        d=google.com; s=arc-20160816;
        b=dnrO+bQbvgAJu6iAQWOzjHjsg8yX6VB5UhaIri/C5TRU7xkl70H7yxGWoL2KC6Feb3
         m2oCl4rSrz01vAQatShg7X6bEkrOfRDnUVLGtLhA9C2+qWi9P+s151SxWbHFJ4oaiptg
         jYEoAwwnRqkwG8mEFqfv4q88CGAwXXE1l0gUGevfXRrSwB0YSijf6mC9pgIuVzGWIa9t
         Fq1PvclOBolfO6Bcq72TVTlCr3F0l3O4NeCHMorIoYHHTKkGbvHPzYzVjo66FyBmR7pj
         vEa+ujLi5ZZKUa0rOlSKsQYCbSe+IQB58ClcgvGSR8MRn90W/GJjeWzfMall0TWKSfSg
         tb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=pIzqXMv5y97bxVBxOZNplXo6uoqRSFYTQLCPiICefwU=;
        b=K+FxMmIw+YdeJIVQDhkq4WzZOHpJPrk7GbdLNH9Igi10+XoMUYAkxpK7H0bfDdEocf
         MVuatzkYCdJ9iBJKc+ggipBbQGVE5bij6Tg4bT8t8bG0HX6JZpRAeiLYj/KNOYJC+Fzc
         loEl+i70D82gTssHk0IcdMbkjYFEt2SaXyASa6+OdQsLhr6TGLXYnRXvXihhtfADcYKT
         gfJcPlYTIfKLG00lpKXD4hkosgNJLTRAMuYoKOyFRqUE3EZd2lROGech0XJBHPkLHmUA
         eV/UJvrQhc5+BNTou9l/KHBptYzq1StYrPwbuMIehh5JPgnUkgDSXnb6KCnMqjkC1viP
         EZ7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DOwDeYto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j21-v6si4903758qtf.310.2018.06.06.08.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 08:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DOwDeYto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQaNY-0003nh-TL
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 11:29:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGF-0004zw-MI
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 11:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGE-0003m8-Nb
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 11:22:07 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG6-0003hk-FP; Wed, 06 Jun 2018 11:21:58 -0400
Received: by mail-qt0-x241.google.com with SMTP id s9-v6so6748471qtg.2;
	Wed, 06 Jun 2018 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pIzqXMv5y97bxVBxOZNplXo6uoqRSFYTQLCPiICefwU=;
	b=DOwDeYtosH5wyTvxWWL/sqJle42wiCUxT1WsSpVK7+GnKEPGDmVDU5DBDSUhslPG39
	k2fGksd/+gyjL+2pFtjdyz3P/0ZjYZIBOHucg4FuPEixafzJkCvcVXF1E82DYTLeQFMl
	gGwdrL0bJdAgzcHtzmkttv+7UKZSYCHyPKhc2rzSrbG9VLVQ0KHYVr+wD8oxB8wOgRwY
	9jm0ZY6whFGXqZLKH/xiB/AY2SnsMIiwWpxx2j7CsvjJnk9b78AWGMbypNa6A6F7cnLl
	arndLGx95nscPNT4ifv7pFVNQax+fLDjP83mjuZvXqy8N6GGQ5SP/hOn++cWMBPZmJND
	lX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pIzqXMv5y97bxVBxOZNplXo6uoqRSFYTQLCPiICefwU=;
	b=FvIE44rA3GIFs/+aeSlTBOGlMOLExa4hDG9nvEySmrd4Wp/z+//ge5BVRtxNn3KtxH
	4b19kqFFEzdhFV3LlVlXIdDFH2g1Add6bdXPxHOGGu7qftwrLZwb7BfuszE11Vb47EYH
	cmmpDKQETc791jYfIo+qAGKGNu36PJMTCQ8gs+gk5sMtJ3/J3J+WTZ+oECANtxOpDDx4
	c/Cw1WrSGoUv6K2A8AGrVS/bjE4KTAVf/nP9EHMeASP0N918zH2r8RC0KR/f6gR2QFpY
	Y1MtqRhbWwqa0kyL4mxU9aDVSXSmqg0qmppM/+xPxtF3LvPWNb2X9kpp+sDsGGJPUZS5
	9uTw==
X-Gm-Message-State: APt69E1jlv2G1386GV01DTZX8H15gk4IJNB32mer0m0XTVjf1C8JqTY8
	tGdgxmMEt+EGl3revoLjiWQ=
X-Received: by 2002:a0c:90e1:: with SMTP id
	p88-v6mr3073549qvp.145.1528298517966; 
	Wed, 06 Jun 2018 08:21:57 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  6 Jun 2018 12:21:24 -0300
Message-Id: <20180606152128.449-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH 07/11] stellaris: Add trailing '\n' to qemu_log()
 calls
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
X-TUID: OUgJ22dUCIOh

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index e886f54976..502a20842c 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -203,11 +203,11 @@ static uint64_t gptm_read(void *opaque, hwaddr offset,
             return s->rtc;
         }
         qemu_log_mask(LOG_UNIMP,
-                      "GPTM: read of TAR but timer read not supported");
+                      "GPTM: read of TAR but timer read not supported\n");
         return 0;
     case 0x4c: /* TBR */
         qemu_log_mask(LOG_UNIMP,
-                      "GPTM: read of TBR but timer read not supported");
+                      "GPTM: read of TBR but timer read not supported\n");
         return 0;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -836,11 +836,12 @@ static void stellaris_i2c_write(void *opaque, hwaddr offset,
         break;
     case 0x20: /* MCR */
         if (value & 1) {
-            qemu_log_mask(LOG_UNIMP, "stellaris_i2c: Loopback not implemented");
+            qemu_log_mask(LOG_UNIMP,
+                          "stellaris_i2c: Loopback not implemented\n");
         }
         if (value & 0x20) {
             qemu_log_mask(LOG_UNIMP,
-                          "stellaris_i2c: Slave mode not implemented");
+                          "stellaris_i2c: Slave mode not implemented\n");
         }
         s->mcr = value & 0x31;
         break;
@@ -1124,7 +1125,7 @@ static void stellaris_adc_write(void *opaque, hwaddr offset,
         s->sspri = value;
         break;
     case 0x28: /* PSSI */
-        qemu_log_mask(LOG_UNIMP, "ADC: sample initiate unimplemented");
+        qemu_log_mask(LOG_UNIMP, "ADC: sample initiate unimplemented\n");
         break;
     case 0x30: /* SAC */
         s->sac = value;
-- 
2.17.1

