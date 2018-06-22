Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp854630wrq;
        Fri, 22 Jun 2018 06:48:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdLHPBd4Ie4xTiB67iwTJ5AycTLWObbx2nQ30+EDpERnSLD2neCPrS6eeEiZme2VdbwvKCE
X-Received: by 2002:aed:3fec:: with SMTP id w41-v6mr1374822qth.15.1529675322420;
        Fri, 22 Jun 2018 06:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675322; cv=none;
        d=google.com; s=arc-20160816;
        b=XIoLSSQYJQkjCXxac5TcSIi6wAK2AsrtdVJOMs8KPwh66zvw4T77qLw/agAGOA69lf
         h+mx9qg2JoDIn83gGAb3yIFB0RKiTS94npRRGSZIzR7mKkUI7cFPvZkp+CVz9iajdfIo
         QD6QTi+X1uEiSrcENgRNOVuabqMNlvs6Z0hrdE80+Kc3mGB8Q/fHrL7NuQ8Yl2WKVYvY
         eMbgNqLYpEtcQQgAc01N7WXkuFUM8e1H/S/+2mrbrX/KvUVAnX5n/tmlijuhahhXPNuu
         U1dsMvSwNRWqb2+0EEMfZ/TWdxQ2s40yxE8WD11vw5bokyh1xvyoeITDtK9s7NKQxFUO
         m7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KhQeiHbv2jQeMnU8i4jHe6xMTLfXjGUU7tfSsxgUwrA=;
        b=xDz385pnsRGomsJL8VkYKHjerY+8zlpR9hpWxXvDzLLNEidH8BWdZ6qdxcYp06N54S
         fV8pozU0zk194hfPt75ziuvcl0OCtNrSJyc+paccVbvxunXf2lw6WA/PxkaO92J2dTpt
         3Ty0b+HJ+kXAT4czKCdthXTF8W3TMwW9r7rVTug9zPmFa+3NCE6Gh1IMq/kI3Xm0ATGD
         0Kw+5PIvAhQvIsbddT544Y/5F0NrJIUE4sQtSJExqbo0lbhPzheBmhTZSzteh36s/FFP
         qP2/cheLRbpviKggnzTqEeDqAx0t+kACqEzb8sa3rCITEf8kZWvZG6hAkP/QI/n1HAfU
         x64g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CwvMWg5y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1-v6si710895qka.174.2018.06.22.06.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CwvMWg5y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMQb-0003nt-OB
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:48:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJT-0006LT-QD
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJT-0003hq-1D
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:19 -0400
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:44607)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJL-0003Y6-Sa; Fri, 22 Jun 2018 09:41:11 -0400
Received: by mail-qk0-x22e.google.com with SMTP id 185-v6so3661475qkk.11;
	Fri, 22 Jun 2018 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KhQeiHbv2jQeMnU8i4jHe6xMTLfXjGUU7tfSsxgUwrA=;
	b=CwvMWg5yg3st5XiqqasivnnCWxphTUYDIR9NxTnw4EMGFVzp4758ulXG8mybdwrJA3
	ovsBnVJzM69J67UcgUPjHucLV6R+73kNJilMFYGljH8RusO68TaFpxR9SeflpG/aea03
	IVlA/UrVbzV+x9K0NyL6CBz/ECJIjv3S1WPRz/zAsQdJ65O68MvmR/xM33NvGqKRErAO
	0I3QwUHvztDJ4V7UKaLi8H+t/WZy1XwKHPKXVo6ayarxsdlb/uJBdq1iLLdOj4KmiX3c
	SkgHrLsdx0OKA59/YMA/7znirWLFAQ+Y+LDaM41au3edXvwe/47WVD+bV1QHv27ZJNYJ
	8O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KhQeiHbv2jQeMnU8i4jHe6xMTLfXjGUU7tfSsxgUwrA=;
	b=Bb/o34tDvwC8HHdK6l+QEExeV0FCKVLGG6v55k3SCe16a+pzmNT0j4RrYIwWRAO9mv
	e08W0kC0/RFJwi41ySGzHyHm0e8bkm9PBQDQq6yMfx30gU5RthJrPe1ZqjXHUTHUbMlY
	upWb+EqDOZyXfMnbA1vM2rGz9j5kBFzXs/6Wqj6+jOC3sTYebq8issjM+74bBaB46UcV
	NRYemfDAhG5tOx0t/zIzmZLtg+wXVg+V99P9c2EfioHgDjiuIpzwqpyNRO0yd0Jj67rP
	K4Rqz9kTweM4DzYDG/RQb5iwcnFPR1bB6c18BibsuwXvojh7we3DHE1SIqnzUQ+ttjC6
	3knQ==
X-Gm-Message-State: APt69E2qD9tABk5Sp/HT++qmRZFeOrEOoAIwlKk7PSm7beEuvCdOtiAm
	8KgQJATUklzRtii9Q+mJ3Ig=
X-Received: by 2002:a37:a0c8:: with SMTP id
	j191-v6mr1305069qke.387.1529674871311; 
	Fri, 22 Jun 2018 06:41:11 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:32 -0300
Message-Id: <20180622134036.23182-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22e
Subject: [Qemu-arm] [PATCH v2 10/14] hw/arm/stellaris: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-TUID: qe9fkc3zXmNS

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a8f1f6a912..d06e366402 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -560,7 +560,7 @@ static void ssys_write(void *opaque, hwaddr offset,
     case 0x040: /* SRCR0 */
     case 0x044: /* SRCR1 */
     case 0x048: /* SRCR2 */
-        fprintf(stderr, "Peripheral reset not implemented\n");
+        qemu_log_mask(LOG_UNIMP, "Peripheral reset not implemented\n");
         break;
     case 0x054: /* IMC */
         s->int_mask = value & 0x7f;
-- 
2.18.0.rc2

