Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1803731njm;
        Tue, 2 Jul 2024 01:03:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6kSt5SkL1p2WpumU/ZV79Uzvn7vMzFIj61hIpAwoKPVAoTA08r/NpswUlsol7Cgi/LE+uOs24rQHjbNeOyi7lPwcEB9xz
X-Google-Smtp-Source: AGHT+IFlhFlLoT3tkVe2LklnTgTjtLCTw6KatDOZyDFFikcvoQ5OS3zUIMdGC+dIOlHcj05JsxXR
X-Received: by 2002:a05:620a:15b8:b0:79d:71e5:4de6 with SMTP id af79cd13be357-79d7ba8a0fdmr829845885a.61.1719907395921;
        Tue, 02 Jul 2024 01:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719907395; cv=none;
        d=google.com; s=arc-20160816;
        b=XW/LOlHlIVlMfQzGVwR6EaP01PURsxWz0Q7xho0mM9Me7imIHwVw+D5xFUiL9KjJM3
         sIGTrYCftDbU9musqykLfmO2+HXeVl5TprvVvzU2zAVsIyWa1OEDpQqNhMj4wi2DbThR
         7S38Ozq1ydPwpvKrY5T8kB0nLJXetMtOkwZkWIwMkZgJ6f6A8zaR8U+dz77JyK1Csh33
         waqsLJ0+lYDAf/07hejZLxUddhowk7kRDiH9QXvqg4jEanBxpK8xCqMkx+qGv4t/Veyl
         LgI2UT+UnyPPgpGGMVx7g0I5dc+hz3Qpk3kYWWbrGBrjnBTMg6TUw1oD51B60TNKAcXt
         g0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zi6zYQMto5lubYOQ/sYeE8+FoDtdbBQU0ZE882Zr2eA=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=mhIn21rtQMbbiQp+d2LLHwa4rXVtaJDHBRFHzglqwVT/52IzWvjzlZDqmx7sewfsZ8
         CPvhrIWJauZEZYKRZpdJcKB8XfNOqd5n3EqfDMx3UPLOnoh0hOSFrL5oVV52jw/nZGaX
         XNLxmn2qSsymxy2beqcs9pobgdG/LItXYT64BWYEWrwsC1v0qiTs4UbyQ0tXTFSt0EQL
         Uspws2Kcrq7ld8HqpwReTuVbqJLOQSuG/+sCt6zuO0Fz74f1ODRs/0Bz2XUOTlZdJdP7
         P+7jMc49kdI7pEsZBwXy7+N+Q2t1Wivaj7ryQz0fS2rDQyMIkOB55H6ij43ibquy4lKq
         pTMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KM6gXAka;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f0be0si1074743285a.260.2024.07.02.01.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 01:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KM6gXAka;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOYS3-0006R9-5c; Tue, 02 Jul 2024 04:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYS2-0006Q9-0j
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:01:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYS0-0006gC-LX
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719907279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zi6zYQMto5lubYOQ/sYeE8+FoDtdbBQU0ZE882Zr2eA=;
 b=KM6gXAkaw9nVd4Hp+TDQVXFyCzokstXEcZwNF0R+oXpWWr/bYZ0kM/f2EnekGYnqhydiCd
 9WuCvIe5epvDjQZ7jdcwdOHZ4ep3S/eTad5FPT/BsbnoU1gWDR4jC7HqvrA2BC6ShaGwyD
 djyrhXTbix7xVvB8ifxM8vedj40XsX8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-NX0n8toxO9SkFCxIEvuLwA-1; Tue,
 02 Jul 2024 04:01:13 -0400
X-MC-Unique: NX0n8toxO9SkFCxIEvuLwA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AC4F71955D80; Tue,  2 Jul 2024 08:01:12 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1B88319560AA; Tue,  2 Jul 2024 08:00:59 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 5/6] aspeed/sdmc: Remove extra R_MAIN_STATUS case
Date: Tue,  2 Jul 2024 10:00:41 +0200
Message-ID: <20240702080042.464220-6-clg@redhat.com>
In-Reply-To: <20240702080042.464220-1-clg@redhat.com>
References: <20240702080042.464220-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4/894xiAA2Yf

From: Jamin Lin <jamin_lin@aspeedtech.com>

Coverity reports that the newly added 'case R_MAIN_STATUS' is DEADCODE
because it can not be reached. This is because R_MAIN_STATUS is handled
before in the "Unprotected registers" switch statement. Remove it.

Fixes: Coverity CID 1547112
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
[ clg: Rewrote commit log ]
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_sdmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 44da085e10cb..ebf139cb5c91 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -595,7 +595,6 @@ static void aspeed_2700_sdmc_write(AspeedSDMCState *s, uint32_t reg,
     case R_INT_STATUS:
     case R_INT_CLEAR:
     case R_INT_MASK:
-    case R_MAIN_STATUS:
     case R_ERR_STATUS:
     case R_ECC_FAIL_STATUS:
     case R_ECC_FAIL_ADDR:
-- 
2.45.2

