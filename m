Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1776724wrq;
        Thu, 5 Jul 2018 09:08:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc7RET16oPC2Cek1XXZ2VzCk+7PYb/j2r4d1JIPKEmwcGhndnQMmCr9Ui8QdJAQwIF+5f4n
X-Received: by 2002:ac8:2463:: with SMTP id d32-v6mr5973905qtd.41.1530806924192;
        Thu, 05 Jul 2018 09:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530806924; cv=none;
        d=google.com; s=arc-20160816;
        b=UjG1y6hylnrKrcnlh/QW7F6URWCRpfd0K+UgM8asTVibJsbBC9NGdlyJjTAW9hZWgY
         OjPgB3IOzH/gX8FaacEezsp8zA08pyWGDQP5F08Et3U7qDAGhuw9rwugn1MTUoBSsTVg
         VbtCjXdO1af0PIvUYjLaq85XgwoP/+TWJCdD2VlO5ug/XdLyY+qZpcfVHovpjzy7xff8
         HkBfb4QgN6tHFzfyLB79EmHx6X/1/BiVyHIejra9NDOR0s2PyDH901EEdvd4La/IACEW
         1edyjZ4lr5akN6jc1DIUYfcWyiiSBuNXfBcQKDL8a9lQbdTttr6hwR0WOfgT3IbAQfWI
         IFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nliH/EX0aglHIk/Fm4qYSToW9q6u0Iktv2X5oO8SSFQ=;
        b=nD34QolRTEQgXogAIZ056zpO7QdeIoAvCwfKW7TW0xrBaUmZ//ACsKCeAh5CfwXQwL
         +gqyT6JjAtUZL7gTpbfBqSumtAkd/AjyxT+4PfdYoOSbR7DQ449EQj8K/lvUlGotHyxg
         w3fATUwT+qFZ4bXa2DMV7tEAAt6L9QFb+onoYfPheRxIYUkH43qX9omrfJnx4De1zbd2
         eSEi3j/She43fUxhU6fl0C1QFh8kqzZMTBAv5arQLUrCHAnRqqmhYW0HWF01Pk+T6YB5
         grI7E0Bj3yPG71z/lJ//Oy9ADAMWrcT33TEyjWcXvn31d6x/VZuz+Zawmz3xn4hDGPMA
         8aTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D9L8FTvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19-v6si2524519qvc.241.2018.07.05.09.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 09:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D9L8FTvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53505 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb6oF-00042T-Jg
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 12:08:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6ef-0004dK-CG
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6ee-0005D6-Nw
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:58:49 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:41713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eY-0005AS-US; Thu, 05 Jul 2018 11:58:43 -0400
Received: by mail-qt0-x229.google.com with SMTP id y20-v6so7514318qto.8;
	Thu, 05 Jul 2018 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nliH/EX0aglHIk/Fm4qYSToW9q6u0Iktv2X5oO8SSFQ=;
	b=D9L8FTvZ2/QbSUCGO28QkTtKKOaHqh5CzBCj5kOL5canY+mWLqaDX/1RBwMKmSUPSa
	Y/5vRLaqmrnxsZX1oJN8dMn6AgXU/Oox1R+6JibzR65V0ka68ls/UOi7lw4pbGOGsRoQ
	wMtRvkehsQyW9tHh11oaE17GKnt6lZxbxOO3J5yCwHg92ZllLjpVdqUohIkpG2IrpnOk
	hFHj3c15HSpoZCE+1oywlqsGoT+i7bqopiyNeFK3HFjEHDqXKQ1jSy6R4B8rJld+M4OH
	DPIJwc26fwfFpJC2pObk/CbMce4Md+unFbCO+KllJTPYRIiKOaRPqmkKT5k9OZyRD+x7
	K7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nliH/EX0aglHIk/Fm4qYSToW9q6u0Iktv2X5oO8SSFQ=;
	b=MJhhfeX/OOPF8CLkkg7Hy3+q6Z0tGxFLA2qdR4PL2e8VKjSKA86Et1/KPEzNY3FKiU
	zg7Nk20lHUhv4tg2tCPQLn66X/ajekNq286nZdxOWdadzQnCVPB/UosYZzvt+GTqSihn
	o6pizavARCwD/pQKyfEk8IdU7H1e+M3fPZ0NjlCFJTPJKyv5wx7p/5yAue9S7VLFqyyU
	FJgWhgONj8vII3/KsZpjsIT/0FvFvO0ZxquK9UrpVbNavFMP6l00/mpY7JJlz9iQ6sgy
	VThdjHhTzz1OwTX+ZNnPmxmpXYHFGRvWXUiCrSv4WXNDU0pxMITHSq46KK72NaWH3sdx
	UEGQ==
X-Gm-Message-State: APt69E2x1QAC83WLPHBRbOGerdcARdBvQXkVIz1W+KwVjOp2pq3YDBot
	yfMxFrD6B/LQW2V/jHto/6+uZ9/R
X-Received: by 2002:ac8:3274:: with SMTP id
	y49-v6mr5837266qta.194.1530806322099; 
	Thu, 05 Jul 2018 08:58:42 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Date: Thu,  5 Jul 2018 12:58:11 -0300
Message-Id: <20180705155811.20366-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705155811.20366-1-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-arm] [PATCH v2 7/7] hw/intc/gicv3: Remove useless parenthesis
 around DIV_ROUND_UP macro
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM cores" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F5E4VQccHcxP

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/intc/arm_gicv3_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index b798486ecf..31ec9a1ae4 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -62,7 +62,7 @@
  * avoids bugs where we forget to subtract GIC_INTERNAL from an
  * interrupt number.
  */
-#define GICV3_BMP_SIZE (DIV_ROUND_UP(GICV3_MAXIRQ, 32))
+#define GICV3_BMP_SIZE DIV_ROUND_UP(GICV3_MAXIRQ, 32)
 
 #define GIC_DECLARE_BITMAP(name) \
     uint32_t name[GICV3_BMP_SIZE]
-- 
2.18.0

