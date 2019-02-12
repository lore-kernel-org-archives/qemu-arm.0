Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp435977wrp;
        Mon, 11 Feb 2019 23:49:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbEDMzSsBTvb7eeTdLbFL+Mpq9RsrtSvKXHFYNNz1ida1wF45gp0FDBhHky7arEy/ITP/HH
X-Received: by 2002:a25:4e8a:: with SMTP id c132mr1734216ybb.458.1549957758049;
        Mon, 11 Feb 2019 23:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549957758; cv=none;
        d=google.com; s=arc-20160816;
        b=LC2o2LkhgY5wxf+5fGpobpcuYFh/EqYFXoBNEDy3aSabPRLzqiliI4g3fTQzEs25fQ
         qoH5z3VFHFNIo5orcKjOZy3Dhgd4uPuczJ0ghqQmYdJz2aBV14KtmFzsRMnxYjRtpQs2
         A48JP8n/Jmbopib86BSi+oua8bFdgdlbaazvSVhLxeT8k3uG2MoFgUpf4R+wVFIfnwVZ
         nqGWoKH2NoMFyUBMRq1GMhkR07hXVig2F8F6apyLMyZLaNRcf1CpXCsvGAz8I+PQRTmX
         LhAg0LzUNzLC+p2KB4mU9vJpaAUeY28RhXcuvZAZGiYToJKneA2OhCaTrwvmTw+Y1+TW
         mCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=gyJVYE+RE6Pw9+PF2rtBoB0FqLzSP0m28mCpgAHUQbw=;
        b=pd4sgyYWGXPjkZ+/GK3ZwQunwyeP8H+2Pf3VdhYaTrYWrE1GdISiCZnDnyAWEY/+o4
         ReR6uE5yWsgAKnbNF+IaI82hOfSf1iHIOEK9ExZ+iluPbdoKexZ+vWc0sAReU7uuyc0x
         ZxKGPIjYwGNiMtV1V/CxPf1YMzpJ7vdtSc35eZ7NsUwMJK7eZ7zdR7rI91mjSL7zic4w
         a6gTs7VOK1RJzU1l67Lx9WtJ2NuNc+pzkN6naa3MxsJwP6rBfrHNgZ4li4NyzKaW0Tne
         u4lNRdFTeiiozKHVPO6IoicIcguo+PCY4nA5U8SUyvCKxYsMXdHkifkQj1THKxns43Un
         retQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S7vVCiXk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si6671430yba.257.2019.02.11.23.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 23:49:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S7vVCiXk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtSof-0004Ri-Ho
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 02:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtSoH-0004DR-Hp
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtSoE-0005wY-W2
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:53 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtSoE-0005q1-Lw
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:50 -0500
Received: by mail-pg1-x541.google.com with SMTP id q206so879245pgq.4
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 23:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gyJVYE+RE6Pw9+PF2rtBoB0FqLzSP0m28mCpgAHUQbw=;
	b=S7vVCiXk3OO+nX/VPyM/Zd2KHHVsBfQ6lGJtvHYYJ9widL1uez1CLPHQBAnXOx46AS
	BWaOCqhpIsqaWWz03++vZ1pACXIt2HRDRXWVg85OTv8SSbADgdbi/fbVGPAUvjydn3UQ
	SLqbUOw9Uud+K9wtfioF6eypJCk/mIHsVpFFbMbAtAcb9nLcjEja2LZbk0iy6btho0da
	hB0CoPZPPLuTAhWRysyKqbsSBwZZqaebpx/1CrZwv49sQYBo6cDFXLTyQYh/Ful403wg
	GTOS9WyZgbkeS4ZjIa1KQI0lKycX5wQ1r5Vh4Gtox5i2/q2qdu3dmhe+EGG42dZ7g3UI
	Akyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gyJVYE+RE6Pw9+PF2rtBoB0FqLzSP0m28mCpgAHUQbw=;
	b=tlS2Zqrzky0eI8YTUulN5zoQ5RERiQG+Z/ay8dcwIMEImZMMcACaQsTjjfQHSzNE5a
	Eb3igHUeNmG8FfFVGhSE1xE6nND4aaR3ZHaJJYCuB2KELKvVasb+z2pEfxAYi1Nc01q4
	d/HEI9vsDfBZJcV/39svCt91KbIBZ3XBS6ix961dOLzlMKjTle/uVtjggLlnC0B5tyRr
	SDUyOYxar5CpTRYVRNXmNK2gI0FCdeiiInVAwNiaxhHvVr/y8h2N062Id7afgeSDuI/f
	x512G8nE+Z/z9x4foti2Vn9K3tLF5RSzU7NvhMHSq8l8Bz6148m87mj9TMRSaRwutn51
	9YyA==
X-Gm-Message-State: AHQUAub3+5EWWLSQWXLPU5KK22j54ID3MTXby7Vl3Lqsc4v8fWCmBasT
	BePBAuO+EMZfIqurz24xCrnvWw==
X-Received: by 2002:a65:610f:: with SMTP id z15mr2386629pgu.153.1549957724619; 
	Mon, 11 Feb 2019 23:48:44 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	z62sm20975215pfi.4.2019.02.11.23.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 23:48:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 23:48:40 -0800
Message-Id: <20190212074840.13542-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190212074840.13542-1-richard.henderson@linaro.org>
References: <20190212074840.13542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v2 2/2] linux-user: Fix ELF_PLATFORM for
 aarch64_be-linux-user
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
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zoHvBV2wDYsn

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d796d51ec6..5aa0628ae9 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -537,7 +537,11 @@ static const char *get_elf_platform(void)
 
 #define ELF_ARCH        EM_AARCH64
 #define ELF_CLASS       ELFCLASS64
-#define ELF_PLATFORM    "aarch64"
+#ifdef TARGET_WORDS_BIGENDIAN
+# define ELF_PLATFORM    "aarch64_be"
+#else
+# define ELF_PLATFORM    "aarch64"
+#endif
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
-- 
2.17.2

