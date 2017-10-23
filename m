Received: by 10.223.161.27 with SMTP id o27csp230050wro;
        Mon, 23 Oct 2017 13:12:07 -0700 (PDT)
X-Received: by 10.37.72.196 with SMTP id v187mr9945886yba.439.1508789527468;
        Mon, 23 Oct 2017 13:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789527; cv=none;
        d=google.com; s=arc-20160816;
        b=mf9MRSx0PrPuBDSug/IEL5aF7pOB1IWNDBJTr+hml7g/pWineFyhy5/pfUS0L7gnH+
         CPisbJjlSobXVl0/+neP8Vy8bak0lyEiBZm+Lj+8/6GcgAzla3vYAMLma61BKtAOgC+b
         Wf6oqi5bCeqMd1wmWP9jxwxud1U2VwcMCE1UnCTvEMwcCHTZXC3SYGNqsMqgTGsAxr9W
         HJuMUxTiHrR5lZq8Ls/0GkmMVMjnkm6dOatGxn5oT4ZoHkqbWWfepnz6Flet8nKZDSJR
         9Vt5BK5Wj6SzZjy+kP2f+nQBy9jLCsVaTiz0W0GJF5qDk6A63vqX7HsuqjKksK1yvmjE
         qMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=IQA5dkdKn2TG6wtuWODAbzVgGBinDJWGHrh8+bbZnfo=;
        b=wsuowF17xSsnmMSTDQROAuNey47p2dssUG1j109CxKoNBcj2Zu4/jC0SN7yxasRfCP
         G1VYx1/77s2WHnDwGUVrrlo0Y375Wzw6fltBsJzE/9J0xMPIQS7lBppx9I6oS5lehVZp
         463zl74i60oAIDI2dklbDl+Aq17DQdEptBf5NZoVgmRWkikYLhzT+NSbKWVbHjWdzw8x
         BHMr+g5zsaRv4W2ILkoPmizdwFUU/lfLh9tz1DWR/qAtrrGV1Y/+2pUfzgxuUnTrYCya
         EUj8kN0fhfsdOe4oPmsoSoTekousAH22sFpBCcu+YTAfm0cpHunse1IOQQVYqeY0/cmE
         22Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ps1cnZ0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si1386367ywb.240.2017.10.23.13.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:12:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ps1cnZ0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j4w-0000i7-Pj
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:12:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4D-00007W-Cj
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4C-0002SH-G5
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:21 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:54026)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4C-0002Rj-AW; Mon, 23 Oct 2017 16:11:20 -0400
Received: by mail-pf0-x244.google.com with SMTP id t188so17914558pfd.10;
	Mon, 23 Oct 2017 13:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IQA5dkdKn2TG6wtuWODAbzVgGBinDJWGHrh8+bbZnfo=;
	b=Ps1cnZ0gxt3HxidCvPZn2TCQbCgiwF/MfuCpTuP+IpBsTmBWKd7eGFiWBK5tjkdyCs
	RO3F8co5WFQLl3FDGLpCUAiFlIQTP0zgYS4z3dgwcdaQXrTka+nrkcDh1AAnjIJop8ov
	9b0nHN6MZ4ZYPh7f442ayNoxrHwd9Cy6sMhfAIq8wOcrOYr+g9aRomsg5ItJMi7Sdrtg
	NIrXzsw/UwXUWTQ6KhD8ioQbPJIljxYwoYGhvFgXFGH6yc0bKsG9WeI+FlKU53SM2x/W
	BpNJ1oXc5MhOYoLsSlhSbLFXq9VxoBM4dKJg55c4htRQwJTaPXTeaPkBRP9VtZH2/tMv
	7aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IQA5dkdKn2TG6wtuWODAbzVgGBinDJWGHrh8+bbZnfo=;
	b=q6ePLSg9KK7Xm3IsVKGavDy1U/z/9JBHlax1JdiAyb0h5/6KgOfGOq1rI1JjmwEIbf
	nLFprp6g7g9eJfdKRrVYKIULcnLy7t1Q9MbVKxEgFpsl7B/V/A+j658NmIzjx4Pa5eT1
	Tt94J1/EOTGsNdsbvYJPjqln/6JqOwlc09KwZ9dIKZuYZVOuWD0PXXpi6CA8sRDbMIr7
	pCftD6JWASdSLHiXmmMo8xtrGN0jNjNaO0V4O8SOAKgsrSibskSO7oFBN2uGoNS5wdMz
	K7WkU+n+GqavpWxXd2h63cVKe98y5XK4i1wZFEDazT0pZ6M0po1K+I9un+tzA1VweUdG
	n+NQ==
X-Gm-Message-State: AMCzsaW9ZdLIctixcHgn2ndrgSCnChWtXlwCD1h8oMIPXwSpdIPdihaW
	1ZESDNwP5PwejMA/oLFEhA19Exi+
X-Google-Smtp-Source: ABhQp+TNzXj21lJKTKpOHW97Ku7dF3E9HSyLfjhqvNJWVbQ316Cos9ao7Z/z2wUvQlcOlrlr0B2AnQ==
X-Received: by 10.99.116.19 with SMTP id p19mr13176133pgc.47.1508789479246;
	Mon, 23 Oct 2017 13:11:19 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:18 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:32 -0700
Message-Id: <20171023201055.21973-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v2 04/27] imx_fec: Use ENET_FTRL to determine
 truncation length
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
X-TUID: lNdYQ47nibzX

Frame truncation length, TRUNC_FL, is determined by the contents of
ENET_FTRL register, so convert the code to use it instead of a
hardcoded constant.

To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
increase the value of the latter to its theoretical maximum of 16K.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 4 ++--
 include/hw/net/imx_fec.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index eb034ffd0c..dda0816fb3 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1052,8 +1052,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     crc_ptr = (uint8_t *) &crc;
 
     /* Huge frames are truncted.  */
-    if (size > ENET_MAX_FRAME_SIZE) {
-        size = ENET_MAX_FRAME_SIZE;
+    if (size > s->regs[ENET_FTRL]) {
+        size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
     }
 
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 4bc8f03ec2..0fcc4f0c71 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -86,7 +86,6 @@
 #define ENET_TCCR3             393
 #define ENET_MAX               400
 
-#define ENET_MAX_FRAME_SIZE    2032
 
 /* EIR and EIMR */
 #define ENET_INT_HB            (1 << 31)
@@ -155,6 +154,8 @@
 #define ENET_RCR_NLC           (1 << 30)
 #define ENET_RCR_GRS           (1 << 31)
 
+#define ENET_MAX_FRAME_SIZE    (1 << ENET_RCR_MAX_FL_LENGTH)
+
 /* TCR */
 #define ENET_TCR_GTS           (1 << 0)
 #define ENET_TCR_FDEN          (1 << 2)
-- 
2.13.5

