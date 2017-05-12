Received: by 10.25.0.6 with SMTP id 6csp471030lfa;
        Fri, 12 May 2017 16:45:38 -0700 (PDT)
X-Received: by 10.237.41.39 with SMTP id s36mr6189217qtd.222.1494632738614;
        Fri, 12 May 2017 16:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494632738; cv=none;
        d=google.com; s=arc-20160816;
        b=Lqv+cmmnMR/2yQBgJsfHF5TqFxHHkPrmra+IbLl3uGzvysxu39QuZxb74f7ga/2W7q
         JlNdj8ZdGGi9wbUsejRq1y4DLPtKbTPEpD9cLQ7g1Tp5hsW2w3ygPxlTuB5lq/5Ewdtn
         OE5YnSFWdoObV6F4mIzQevw9esi6oBFmKRN2k/Zox8DUJvsGLcOhixucrnnkyRgMZBrH
         T1i6pQAHFFLVjG41WXgoAPOi/BBdPFpshX5p2Pwv03eA+DWkHa69yrZ8WvJgn1Bx1Rir
         4uUwiny4cF70Ix8WxsD/zo8MX/bax7ls86Vg/klvlQe6y3Mci3dQqsRb7kriPjs3ktSt
         DuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ARntjubsQyR5+cZJSQIcfrChA/eTk2P8uu7CiiT9EvA=;
        b=mSQLfb4+8Z6AJzyp/ixPHperT37ikZZXIfn/9eBpRxZizOVWMmjDGvcjGuoH6/yiKd
         efn5N/aqgBhhsK68b4j1lUdVXbWSlyNdX1C8zayuF+hCVJF2n2zC2Vq0AW5++adOuqj0
         XJOXC337fa3mCBM+RwWWpxX8Brhu5gf6f9YEBNCM5gJ5DguvGkx5xhK7C28nGnnt2j7r
         K2e9uR1aK2DU0BYBZTCUV6FxaCn9SIzf+J2mG4dc0y2Y0uO0UISENRAdbGhnBTACkbQ9
         KFlDlORa61YuApW+kWtf8IwRhFOtj0HQztwjay6KoRnYkOJVMumoO57AgPoI/fyq8EdT
         Xy0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x186si1125510qke.166.2017.05.12.16.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 16:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9KFb-0005oE-SC
	for alex.bennee@linaro.org; Fri, 12 May 2017 19:45:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9K9J-0008TL-LV
	for qemu-devel@nongnu.org; Fri, 12 May 2017 19:39:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9K9I-0002a6-Or
	for qemu-devel@nongnu.org; Fri, 12 May 2017 19:39:05 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9K9I-0002ZZ-Ka; Fri, 12 May 2017 19:39:04 -0400
Received: by mail-qt0-x241.google.com with SMTP id j13so8688318qta.3;
	Fri, 12 May 2017 16:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ARntjubsQyR5+cZJSQIcfrChA/eTk2P8uu7CiiT9EvA=;
	b=klCY5Xnx55F7mI8kpKhxZmj/0n94BqiiHoWtKGaQ/JQdtq24x8fuhTExFB1OeJ1INM
	+zS/rHcCyoQ4Ba0gdqzdqY+vkyZiSELNZkHdbz1jA7Ie2ftlv/kTOSpcVBn2TK9Hm2QG
	5NZAxvHESBVndBVhHlG5qGRSzdSlQaHFV7UYI0lhpb781YOY/3UdAXGrCKMq0lAeo5JF
	4ZxefLuBnyLabsSWXAxzzfJp3AsVJ2HNl5tYRGAnkyiWFbIpRspDKtNGZjTj1DGYrriP
	OLyWz2QoJaMd9W0Bm0axTow8THc/GTnw82rHyAL/ZcCYjHZhFX+JIqfPQuxVyHiZ/9GD
	cRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ARntjubsQyR5+cZJSQIcfrChA/eTk2P8uu7CiiT9EvA=;
	b=Rtj2B7EmLxymD1IjN1tgzJWbumDZa2nUCyehvwCtgxlsgTL4OiFySlL4MriYYsbytp
	yTF88Oial4tIinrrWjjR20MoLDOzL6D5KamdYUA0YQCnM1Qy0W1MC5qvnvAr8gCNfHxO
	FCuaxbtnFJ/HSzqEJn8vhh39L2WJ6fi2OX1hsUQnUJx5ZnfdHyAB644xbxraMHYrq8W2
	o/n3gE2WNjLt002pCKznGSZC/sTEOV06cYXSMyzrry1MohZOREa96dcsiZ8mMdyDUPJ6
	kjm8uRV/nxaikdhTkxbbz73IjAHqHyVcw1l3vuuE+rn4jkRQTcDVpB9pZdJFkAjE7zZP
	VHFw==
X-Gm-Message-State: AODbwcDoVdPGIpFlkhGCheSELMemkn/f3F3G+hs4p8FA+LCLe8qI/N4A
	dkx3Jbb/shbtOA==
X-Received: by 10.200.37.26 with SMTP id 26mr6736072qtm.278.1494632344095;
	Fri, 12 May 2017 16:39:04 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	n78sm3253857qki.60.2017.05.12.16.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 16:39:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org
Date: Fri, 12 May 2017 20:38:40 -0300
Message-Id: <20170512233843.27713-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170512233843.27713-1-f4bug@amsat.org>
References: <20170512233843.27713-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v4 3/6] target/arm: optimize rev16() using
 extract op
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nX6Ce1BeBiRu

Patch created mechanically using Coccinelle script via:

    $ spatch --macro-file scripts/cocci-macro-file.h --in-place \
        --sp-file scripts/coccinelle/tcg_gen_extract.cocci --dir target

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 24de30d92c..759b2466ef 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4038,14 +4038,12 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_andi_i64(tcg_tmp, tcg_rn, 0xffff);
     tcg_gen_bswap16_i64(tcg_rd, tcg_tmp);
 
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
-    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
+    tcg_gen_extract_i64(tcg_tmp, tcg_rn, 16, 16);
     tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
     tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 16, 16);
 
     if (sf) {
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
+        tcg_gen_extract_i64(tcg_tmp, tcg_rn, 32, 16);
         tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
         tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 32, 16);
 
-- 
2.11.0

