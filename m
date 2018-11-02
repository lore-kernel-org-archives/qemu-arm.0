Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1460291wro;
        Thu, 1 Nov 2018 17:14:07 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cN2q80ypRSxSv/DOkx/lXad5CvmyyTpWPE1JRP1oyg7KywRoUf/f5El2eFtk4kk7Ki3Ed0
X-Received: by 2002:aed:3722:: with SMTP id i31-v6mr8205215qtb.385.1541117646986;
        Thu, 01 Nov 2018 17:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541117646; cv=none;
        d=google.com; s=arc-20160816;
        b=kDTt8IQLN3IwG354tMcQMTcNnAN33yIdlQx7ZLAkLlJjQ+c0QS8nz1JiSIWIKnAXRE
         djzpmGilaKEgJQ+lueHSH1rx3q01i3yhF5FUyOtiBcwLKSDXQlVjbmf8wJJPlX+kO4Av
         bWly/holI7Z8w5FgArihsXHOpGKiZHS0pOuuw99cUyEfLboMD85pS6zlOx6osE1zYrUQ
         8tXM615Tckmitmrjjli7JtQABJg3XH4eO4P02Bar7Dyo2sEv37bjktIjxuyg1RWTfbhC
         Ftq3aINVdADBz7PaWKZxzQgMXBgRyAxeeFJvxqViJ22wey46hErNmPOFWbprqJ6iNlOi
         fb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Ve5Dy1cNhQ/uwACXXwTkneM+nVRvmxt+SYfZfVBxO60=;
        b=ykXGqaPFKOz/t4iptSQ5xenYEXZ+4MV2euQhoofL8aTVC7se3YdpqTJ7+EUJYNX45P
         iySIqtBk6jQvpdnTXckBalQUkq3nybHis+m7RvtVDykZUBDKHdyCM7c9FZeODyaSN2o2
         DT+/KROATUE0sZejc6wr4thFEtCNlgLzLJNl15EPwORMSqPqgiyFgoLCXuAmoTY+OmCJ
         g1TXUjNbsRrin7GZY1B1vYC6bQlODpmvLvUxIkA67TYKpj+IuiSbSVTkyOP0vV5HdcUG
         fvDjakGAhOB1mBgkSYl9zF62nxmnCXXFwemhNAJIzTXJ5tM24dvDSuXW7mPssFcwFqJ8
         HIsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xz7hyWHu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t12si967105qta.353.2018.11.01.17.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 17:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xz7hyWHu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIN6E-0000tn-Cr
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 20:14:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5a-0000pV-GZ
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5W-0004zW-Bv
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:25 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5W-0004ym-3p; Thu, 01 Nov 2018 20:13:22 -0400
Received: by mail-wm1-x342.google.com with SMTP id q12-v6so516106wmq.0;
	Thu, 01 Nov 2018 17:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ve5Dy1cNhQ/uwACXXwTkneM+nVRvmxt+SYfZfVBxO60=;
	b=Xz7hyWHuIWOs+LdK5OsnVKpIJI6GnF2krhxhnMWt2ggp2NYQDsdxQ2w+o1tuOwn4ag
	BUgx0mvCFBEzT3t7xu1ZbVxSSuyu8IF9/6dC7jylBRcPht3Q41rVPkPp0zWV9k4EMSJd
	ejIRgPCEtDDy/7uTGqhgS11CXKM/sVFpxbaeP4Itm1H0UoWhyXTW1PIk3eAwYrXInIDx
	LkD+H/VKoD6YGJJB77Gwt4+yCo2VECfMWVZxdwcqODwy/Cv0cOubXtL4Y7P+eg9y+j6m
	mLELSt1I+OjKHD4aBsFTonKMjkXRlzzbN9CNsFs+VnzOvbc2i6wxEMOpxyJIhQoKOaa2
	QEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ve5Dy1cNhQ/uwACXXwTkneM+nVRvmxt+SYfZfVBxO60=;
	b=n/tAvnULcMG2iivzlDJHaaROWIY0tKgO/vyANUlgWUL6F99IgD5Iq7YLAPCvDzIbBo
	h6uHSTx0k81jYpvE4Graq6iB9dT/tsHd0qFV9MrNHsZkTFuZtg7Vugk32J2TswTkirEE
	8Mjw+NkTKhJ7pGxO4LNf25BhoGog13VzmUFOhu9ohru35PHmnYR6X48zNrLPC/4KsMXC
	Sso7Q5EPk6D7DreXKje1/DtDskt56TssQOoFGHQ5DbRJ2k06tWAlwOOhmyzrz1+AvLNO
	JSF/OqoWm/KuwJ5K0MlPBaWdiIpS9mxRJoWEX7yiMsVNyJR4d4cDCKWotwBGVxlaqubE
	jZzQ==
X-Gm-Message-State: AGRZ1gJyoicuQcP+PmPNA1GyW7ob09gkDZm3r30B1nkTeii3jl2a9Oay
	1kjZpwPMIKw1rCFaBtogE3M=
X-Received: by 2002:a1c:a141:: with SMTP id
	k62-v6mr6795703wme.68.1541117601011; 
	Thu, 01 Nov 2018 17:13:21 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm10539894wrs.19.2018.11.01.17.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 17:13:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Date: Fri,  2 Nov 2018 01:12:57 +0100
Message-Id: <20181102001303.32640-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH for 3.1 v2 1/7] MAINTAINERS: Add an entry for
 the Raspberry Pi machines
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yd9c7LhCuYwe

So far the Raspi machines use the BCM2836 SoC which includes
a BCM2835 for the peripherals.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2360efe3e..c41ea5ed3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -683,6 +683,12 @@ F: hw/arm/nrf51_soc.c
 F: hw/arm/microbit.c
 F: include/hw/arm/nrf51_soc.h
 
+Raspberry Pi
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: hw/*/bcm283*
+F: include/hw/*/bcm283*
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.17.2

