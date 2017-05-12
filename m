Received: by 10.25.0.6 with SMTP id 6csp48140lfa;
        Thu, 11 May 2017 20:36:26 -0700 (PDT)
X-Received: by 10.200.43.169 with SMTP id m38mr1677834qtm.281.1494560186092;
        Thu, 11 May 2017 20:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494560186; cv=none;
        d=google.com; s=arc-20160816;
        b=nUatsf3TM7NCOKW3TLLlwawRZPQAvGlZGtsOrlJFYRQud/4QddnlNJIgBvUAYDfel1
         bfGJzH48G+Tj5prJeFl6j0x7U00TnA1Cj75ZlMXCcCoRQ9KdMZSDCYSlfuLVu60QLXhb
         AzGCR8nl7AgKUbCcm2AbgYxdgcqhmm575bz90OwX4l3rBsMFMXwZ6ZjOji9gZ1Yna/qx
         Xno0nEl50D0pLA9dmWqI4auVDyMuNMBmqSihNGsK1WSfEbaJK5HXO6eD6gemzr8dfEnk
         OOVGtepBGKeOyrUAv2MsaHroa/ODMaBTCWFJUVHCcR/Nf+SamTRm/XhaiTigzSPIgJ72
         GsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nhTGRxVfoJ7Ah/YLU6COAHFDl7Y4Ci8qhe51bjgzQXc=;
        b=MgrWM2jBR4fR5c2BCd6igPFVp+3jyI0OhYFwIeNd2EgoY/vXgvjpro5TihalDz4ApZ
         Me2mxYGyn2/a448hvtrbmp6btopBYlEpbc+r6gun7wDwVXtXcx8NntgiNzMEE+C8PIkF
         +ohGRvgdFCkpgeDBsARtjs834crvHsqN7L5l+8ly1/SlejLtVbsIOpsGYDnu1Sx9JLKH
         j/Nb1P6IdIboxqsNA3fesgbNuB6szHN44+idAK6FTE6W6gTNhXGNztO4bmmohTrEz5CH
         W3iWLKu8mifo/8owuZMs9qqATSpshHaM1lpnIsR3cdWcfX3yO/CggzOShJ9oYY/pPofz
         rLuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si2152971qtu.248.2017.05.11.20.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 20:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d91NR-0006c9-HG
	for alex.bennee@linaro.org; Thu, 11 May 2017 23:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91NK-0006Zs-Tt
	for qemu-arm@nongnu.org; Thu, 11 May 2017 23:36:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91NK-0003eh-4G
	for qemu-arm@nongnu.org; Thu, 11 May 2017 23:36:18 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91NE-0003cp-TK; Thu, 11 May 2017 23:36:12 -0400
Received: by mail-qt0-x241.google.com with SMTP id r58so5366380qtb.2;
	Thu, 11 May 2017 20:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nhTGRxVfoJ7Ah/YLU6COAHFDl7Y4Ci8qhe51bjgzQXc=;
	b=saq/o/O9iOxF4meuv42d7hLJHLuPQuyhgUdSNspUlyDYoXb80FUKFZ8sPpsEAcFvMS
	Dnt1/ThvckOroxFmrkxHML+cuZ5Yyb2uy0DX3dg7VKUUOyT8+kqp3YGr6lcLHN8hZwRW
	Wc9VvVCbRVad2PoSNia0sVY6WnewB8dJkvfeZE/QrcZf300IUitCSUv2nm2Fc6+XpIQg
	dlwAKI7irrzAsNRMwKfEpCBKN5rcvZt+emjDOLMMUwqKNuX2sOXArw1YPrxrB6waIRIe
	GeN1D/m/Tzp+ERL85K9uZ5PUN5WYLG1etZucqJdG2Kfv34VxcEeB/C7az1m8kEel4rhe
	t1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nhTGRxVfoJ7Ah/YLU6COAHFDl7Y4Ci8qhe51bjgzQXc=;
	b=h5SZbx+r++4hXUXCmVbcH9YUlamM/UiMYJqtld5riOf6GI8rS5Xfa0nNPirEexSvWX
	n0gHtLWmJGShK84kfSePsxCmrdEYip4BxGZuaJ96smsX5yZ6/M8c7vUqCBI0ye7l4pDo
	8As6uVmRdxfwjayqo6xNWe9Jv5MnF44JhjKu/oBW0scWA4tDyJtGEDsanqyvHkaaSmks
	NqDk+livS1oJ7EZQGYaq7iIERNZ2ZnIADg2nYG6gh9/KoEfHI1eP5im9iVWCDVunOGox
	tnOFZLpszKNek/5m+TkNq48hroPjUaE5Xw8Y/ZkS22r5xqvCmzb84R/s4fFfyguKivgV
	prvw==
X-Gm-Message-State: AODbwcB4phSmvdva3zl0F0356oIg/qE527MOCtQl7Z0BFwkzmHTAOfVH
	XfYzcp5Ys1JyPg==
X-Received: by 10.237.53.149 with SMTP id c21mr1831176qte.191.1494560172376;
	Thu, 11 May 2017 20:36:12 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	m188sm1443267qkc.5.2017.05.11.20.36.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 20:36:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org
Date: Fri, 12 May 2017 00:35:40 -0300
Message-Id: <20170512033543.6789-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170512033543.6789-1-f4bug@amsat.org>
References: <20170512033543.6789-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH v3 2/5] target/arm: optimize rev16() using
 extract op
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mKbncOSaYEhy

Patch created mechanically using Coccinelle script via:

    $ spatch --macro-file scripts/cocci-macro-file.h --in-place \
        --sp-file scripts/coccinelle/tcg_gen_extract.cocci --dir target

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 24de30d92c..7ea130107e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4038,14 +4038,12 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_andi_i64(tcg_tmp, tcg_rn, 0xffff);
     tcg_gen_bswap16_i64(tcg_rd, tcg_tmp);
 
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
-    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
+    tcg_gen_extract_i64(tcg_tmp, tcg_rn, 16, 0xffff);
     tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
     tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 16, 16);
 
     if (sf) {
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
+        tcg_gen_extract_i64(tcg_tmp, tcg_rn, 32, 0xffff);
         tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
         tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 32, 16);
 
-- 
2.11.0

