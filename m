Received: by 10.223.159.74 with SMTP id f10csp3056144wrg;
        Mon, 11 Dec 2017 13:34:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBouEy/CmisbDQaCuYgwlrVy6GSej2NRx8KZuy2+SiThrezS1y6Qtc94c7OH49yKqQWOsHXF/
X-Received: by 10.129.121.129 with SMTP id u123mr1397758ywc.462.1513028098892;
        Mon, 11 Dec 2017 13:34:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513028098; cv=none;
        d=google.com; s=arc-20160816;
        b=q321fVxVehAUBSAs01TJ1W/UBkK45zqLi0d5GS0f3R0VHN1Hw788oswm7pWbjtLRrW
         Q82CsI6hypQ1zh8/GbyM9eqM+0ylmJrpz82yMLs0xXIAtC3s4QjAktzyKenj2/UW7Dut
         7rZAB4+wkx8HNrW1+bgMjDCnlcphC24xaqelqLBS13EobQCxL07eQfy67wgJI06Cm6nu
         l62kxwT0kibKEbZkFRjP3GRY+aNHliurN1pXi03ag1LBJ9Sa0qUCZHwiJnjFxy/Yp1H4
         GjvuggWAiUY0ADzZr9ziRlEt7VI5Sl90EnlIBh8U0oPwfxk+18TN98B3+B4iz1bimg0I
         WNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zc3tJ3GiwAz2q6hrm6F2ynicdt/gKVnWAy4u0ysngQw=;
        b=MhyFZFlkC+jFyaJV5YJf9u1bBMiuqNMsuwrZfv7qpbNdN/ExW9+8v4eKWBGhdJkVYj
         tJHnyXSGoOtwzVInip9OWFjRnv4GTYdqq/Gd3LRKA4aQdSIvPtKYv9fCbDB+UvIxnXT0
         Z4ozRma128yTzKAaV/aZc/RBKGAA+tv0gQdLLgeSxma/FVLUrIgXwJLRsobHDmTwh8tD
         PwE7hqXuQuYWsapGHXjmqv9cztKcAwp/ai7/3UBdoiUE63oN+ud6QcIyOOq0lTmoOaxq
         rOPMNWRFGfZxGJTCJtoAMLRc6+rMXY7l2xOzQyQdnTUPfGK8X29UmKhU6yYwCWhC2241
         uc1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pwD9uRbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p8si3191497ywl.296.2017.12.11.13.34.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:34:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pwD9uRbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVj0-0004U2-A7
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:34:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfF-0000sD-9x
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfE-0004Yt-6T
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:05 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:40770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVfE-0004WR-09; Mon, 11 Dec 2017 16:31:04 -0500
Received: by mail-pg0-x241.google.com with SMTP id k15so11849555pgr.7;
	Mon, 11 Dec 2017 13:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zc3tJ3GiwAz2q6hrm6F2ynicdt/gKVnWAy4u0ysngQw=;
	b=pwD9uRbqT5YSdEha1c8sdw6+QaocZ382vzshSSmQJx2wUuU5gNSib7sS6dVv+1lt7x
	t9AenRu6IxGYovZmtMuj4IeO9ZT/Pxm/iyd4TiN7foGcXaUzaexqauQd1COBpWc2vMai
	MiXJ2Xq22WR9WaSiVDZPrHWXRCuIsWLwPCpgghaS0jH1OgDao90lKL0z0r4GiGbV+Dup
	qgdMRdDGG5dcPrbFJA0gfSpJWY7IZt/IsQsdSN1+Pj5yaAdcGRvmsFyTzZjQ3x6+iE1d
	262NUERUuxP2J8DJBx9vv1Teyh9mN+QETd2+0abEhsXz1xIAWApk3vO2Ot99HOxygq/j
	VUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zc3tJ3GiwAz2q6hrm6F2ynicdt/gKVnWAy4u0ysngQw=;
	b=Oz4tDsRyvE/2fOh6iE/WyuFlYPu2+DA+8ZAv3odmAP9oacePcHbXRJm8TDVbBm0FBH
	d8xNU7udQQlsFXc8rp5tjHcyYtDVbGNHSDM7KVjK3HeRZ5cP0NAO2OxKTu4g1l40qG+k
	37lgO2hdp2vfiuiofZzvBD7j40LSsAnsrLMqiyRJ6U/2OUTySgAdjuKIOhUXHKah9fAn
	4GGSigSU1eSMd8AN6s8+CYNrMVfmaQt07yg760+2txzJUP68I9mdy1xsQTq3ZBifFyr+
	VcoN2plbwuxTflAtmsCkkEsDQ63VWKiZzwrRPvsU6pqMLOachitB+rxZM0n9EsAvWaO+
	CLBQ==
X-Gm-Message-State: AKGB3mL51Aj07dQRFKlcFgn2bl6AGt3GkVnUa1KEegDdx9y55Q+3Shva
	RAb/Av0j2swxPqS2renztUt1tAG+
X-Received: by 10.159.195.72 with SMTP id z8mr1628960pln.183.1513027862709;
	Mon, 11 Dec 2017 13:31:02 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:31:01 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:30:07 -0800
Message-Id: <20171211213007.7353-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 13/13] sdhci: Implement write method of
 ACMD12ERRSTS register
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VjBN93rcbdq1

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 758af067f9..cb9e0db9fb 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1139,6 +1139,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         s->admasysaddr = (s->admasysaddr & (0x00000000FFFFFFFFULL |
                 ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
         break;
+    case SDHC_ACMD12ERRSTS:
+        MASKED_WRITE(s->acmd12errsts, mask, value);
+        break;
     case SDHC_FEAER:
         s->acmd12errsts |= value;
         s->errintsts |= (value >> 16) & s->errintstsen;
-- 
2.14.3

