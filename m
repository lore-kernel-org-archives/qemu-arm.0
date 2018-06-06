Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp964944wrq;
        Wed, 6 Jun 2018 08:29:26 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ56V6U8t5ICEkCEHp/BnTsE+QHxjfXcxDgFQGUxa7OsV0ce0dB2DrK4QpwwCrv8bXasT4G
X-Received: by 2002:a0c:e354:: with SMTP id a20-v6mr3054131qvm.229.1528298965996;
        Wed, 06 Jun 2018 08:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528298965; cv=none;
        d=google.com; s=arc-20160816;
        b=wr0CCjMJFdR3htPXYCktfs2f27X0IP+i2f4Oxg/7hnVU/LSP5jOMVbm56LiSDCzgyJ
         T3xUNBkI869ssXMUU59vAyEQvbXXEMP2acMK2ukxNSt+rbdEuJCHj3z4FneWgTIO/H7G
         Amyf8BEYuN21SgcCgkoBvp8mNIO/Cvik0N7eEuwpKhohVk/IEdbbh7snYulT/WHgqclm
         +38QmwJTyWWMJ+hmM1c8KK2Dk8nvsHRRu9OqzZGg4Uws3iYUt4ND5NvATcfww/k0Ul71
         3Cw5lYSaTQa7npyRVrZRtz+whx0kxpEzJAoqOc9NUeASCApxx/sbJVicpd2DOhSDNJmT
         pg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=O5ti0iCG1c3ADHg6knLG43SRvnYZkESSsHS69ePHdeI=;
        b=eWhAGWXDV4uV5ZksfbTbjvt85TDP824dfJfmE9Sfv9ADj0HgOonNBxiTIRCL6Mqs8X
         itLQ7bkiEJAw+WMq5hXZMf6mjqgd7nwzQZaKBKMWipA1C4y1n9BDb2gKgChBqVd8AZ+5
         BpUMuarI/3Wo9mV/1b4nWbgxq/Ib+hn2z1d4pTYaQsKAHv8A5NioqM30q3bXhr9y0bAe
         k10X14i2lPJ+Tz39M0B20wOx+mBkn0ugAqfPz0AnRqL4VHjkCpkye5WAiLUSutfqFUUQ
         wGH+3w/XqmfdDdNgMyJ+QxeaoDuq9EPBEkS7MfmwDLIBhxovDdMN9MEwpiEhT+bIBYtl
         yU3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QfWDsZ99;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2-v6si7811083qki.143.2018.06.06.08.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 08:29:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QfWDsZ99;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQaNJ-0003Zi-DT
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 11:29:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGG-000500-Fk
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 11:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGF-0003ma-En
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 11:22:08 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:46764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG8-0003in-Lt; Wed, 06 Jun 2018 11:22:00 -0400
Received: by mail-qk0-x22f.google.com with SMTP id k86-v6so4168629qkh.13;
	Wed, 06 Jun 2018 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O5ti0iCG1c3ADHg6knLG43SRvnYZkESSsHS69ePHdeI=;
	b=QfWDsZ99ehZIFJ4fFCjIt12hNZbw6qdVtCEVm70z3MtdFUV70ei1bPFK1+mvedrprE
	FLG7Icnyt0yrzEQg5KqC4Ie/29DUhnWhH2UZCBqhH5qWMSLKgxlY6fCrtLeI7N7bYGl5
	M7ymTedJWvS+SadBBtmRgMtkBBBt0vwAjprjLxsnI+DVXaQALzpIia84QZ411q0/ZxcP
	prpdFyx/VyfEjYTYWgl9Jr2mDOFmlfZJkw1otjNIJon9Zh2DzghOwrafbMKDlFk83273
	AmkKvsW1ITzmKodCjhW/rgEUdQsFBFUlNZVWTvgFlWkdUkJEOip+sTu4ziwC5QlvVtiW
	Iltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=O5ti0iCG1c3ADHg6knLG43SRvnYZkESSsHS69ePHdeI=;
	b=fJQPS0SbxtAbXIBhJ8RIG8mRRo7x49bgFBE3oyYMnN7gQqiu8ZSqTvGkN0uymWv/jA
	pY44pLluimRgFxE0SNmsgE/Hz0uTzArhkIorlsdSpVpvTNYO+rLsCFb90/lJxkCz5V9+
	bAbi+pPbZmmJEo7yh6YaASxiN6mkYzlUukZmjKP8m2epezTxvGZM9kGfgsiogDEXA2Br
	bu7KrZjpHDr2cj1In8kSb+qEmRsKkPjeFjtM/hX0wBvdl+BrT29zOMQ41HssR0tUekIt
	T4H6DTgr08T1+YOlhbpQkqbXf7MJYLkeFL45vpLJNPRWRiICSRN5+aqBLAITnIlJnIcU
	HXpg==
X-Gm-Message-State: APt69E20DN/GWpPlp/yB/SZ+59PWeqsY67t+QsnSqS5hFtXUzywasGxt
	POOpEnWhBdbuZ9jawAoLVbtM4BTk
X-Received: by 2002:a37:88c2:: with SMTP id
	k185-v6mr2947809qkd.102.1528298520193; 
	Wed, 06 Jun 2018 08:22:00 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  6 Jun 2018 12:21:25 -0300
Message-Id: <20180606152128.449-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: [Qemu-arm] [PATCH 08/11] target/arm: Add trailing '\n' to
 qemu_log() calls
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
X-TUID: JiL/IK+PZiw2

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f75aa6e9ca..1248d84e6f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4570,7 +4570,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     case 4: /* unlinked address mismatch (reserved if AArch64) */
     case 5: /* linked address mismatch (reserved if AArch64) */
         qemu_log_mask(LOG_UNIMP,
-                      "arm: address mismatch breakpoint types not implemented");
+                      "arm: address mismatch breakpoint types not implemented\n");
         return;
     case 0: /* unlinked address match */
     case 1: /* linked address match */
@@ -4604,7 +4604,7 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     case 8: /* unlinked VMID match (reserved if no EL2) */
     case 10: /* unlinked context ID and VMID match (reserved if no EL2) */
         qemu_log_mask(LOG_UNIMP,
-                      "arm: unlinked context breakpoint types not implemented");
+                      "arm: unlinked context breakpoint types not implemented\n");
         return;
     case 9: /* linked VMID match (reserved if no EL2) */
     case 11: /* linked context ID and VMID match (reserved if no EL2) */
-- 
2.17.1

