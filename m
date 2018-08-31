Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp551973wrd;
        Fri, 31 Aug 2018 05:39:01 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZtUT6+wzUaZ8j/zu26NtI9gOkWKxS7hw9XxVZw4QqDVfZLxV/70CPFALY9GpcGVnXExPAb
X-Received: by 2002:a37:4712:: with SMTP id u18-v6mr15344811qka.301.1535719140934;
        Fri, 31 Aug 2018 05:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535719140; cv=none;
        d=google.com; s=arc-20160816;
        b=dA8vnNZbmOnKUoWvKA32SsfM8uOTGkZhODpMJ4ruc0VXPQFmeAVNJvXp5X3erE3/cA
         hiEiHwm4rPUA/lyC7fA1EolH+fHUp2/MLq5/QRFVcDhUVpMhez2tA7ki4JKhJauflNyI
         2qVIYK+Pe1lgs8r3GanHK4I+Tyx5Y/D4AcLIbuzmczaEGDLh56aczJ/jAnd6gsxPWX0y
         Sh/tDZK2bFg2e4ZBKGsVXafwXYMQkrxW2LsgfPbuyNDUufC9z1ucTK0/eiIFPRCtJvwv
         rk/xF2UJPGsxJgunfzUbsd4unt1whzkE+HN9g0d59+f8kRXoS6iYBUNuNJvC3zuEnM0o
         vICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:cms-type
         :content-transfer-encoding:mime-version:user-agent:message-id:date
         :to:from:dkim-signature:dkim-filter:arc-authentication-results;
        bh=uZIUDVs0+BL8evdkJ2CgFaPKwRlpLF6TmWxcEX7TCdM=;
        b=PmBVKZs70evrkgWFS+1Daom1Hu0ZQeGGgBUCDhdxnM3nUAMTc5da1R9gXfuO2gfZ7H
         1OcH+A74qB5tLneEwd87226qgUWQidOZlZpzBwZFf8zCqjGKHPjroFlpE4nbVNoAfCNO
         46FmVwTHPsmbW9yh06ZT0MbB+uxwi1Ex5u5bK6mEUdSD9VvCbj94Aq2v4rSWc1qOC8ki
         mmu06xfMLFcHCsh2PMFsYzmb+wT2WMJ71lQrkoa6WYwWm5rpeMirCOG1Vdrf72WmBkJm
         yV3QwkazT5TCT+wRQS9yNBkIC/aiJ3raAYmV1+nErc8kI0WcdJ6iU1Uy7kdwKBANcgSR
         Mk0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@samsung.com header.s=mail20170921 header.b="cr/oEWzV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q5-v6si8676453qkf.160.2018.08.31.05.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 05:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@samsung.com header.s=mail20170921 header.b="cr/oEWzV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from localhost ([::1]:53511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvihY-0005uq-AF
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 08:39:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <b.zolnierkie@samsung.com>) id 1fvgbW-0001L0-I7
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <b.zolnierkie@samsung.com>) id 1fvgaD-0003Kc-Jp
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:23:21 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <b.zolnierkie@samsung.com>)
	id 1fvga9-0003Hm-O6; Fri, 31 Aug 2018 06:23:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
	20180831102307euoutp02d1346f449ccf8b023087219dd00366e8~P8QHCj0Pl0256102561euoutp02K;
	Fri, 31 Aug 2018 10:23:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
	20180831102307euoutp02d1346f449ccf8b023087219dd00366e8~P8QHCj0Pl0256102561euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1535710987;
	bh=uZIUDVs0+BL8evdkJ2CgFaPKwRlpLF6TmWxcEX7TCdM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=cr/oEWzVFNKeZpVGU/04VAK4A36pWguFursbq3PvsoaLjETyNWq4HH8ADVq+MYcyZ
	RAJufEs8gvH/U3LN/3yis5eSBIJF+vRbjGByJOQRr139WEJXbDGv7s2BncpoDyl89v
	ZDeKvzLlOdbDK+0nDlcbC46Do1r/29O5eKdFFkpA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20180831102307eucas1p17f361e217ef731e7abc46d1407872f58~P8QGogrR-2760627606eucas1p1u;
	Fri, 31 Aug 2018 10:23:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 76.9C.04806.B07198B5;
	Fri, 31 Aug 2018 11:23:07 +0100 (BST)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20180831102306eucas1p1ffbf82383f23675fecb5faf8a2fa54d7~P8QFpjSGw0500005000eucas1p1G;
	Fri, 31 Aug 2018 10:23:06 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-b5-5b89170b6e19
Received: from eusync1.samsung.com ( [203.254.199.211]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 82.90.04284.A07198B5;
	Fri, 31 Aug 2018 11:23:06 +0100 (BST)
Received: from amdc3058.localnet ([106.120.53.102]) by eusync1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTPA id <0PEB00IASM6H9T00@eusync1.samsung.com>;
	Fri, 31 Aug 2018 11:23:05 +0100 (BST)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Fri, 31 Aug 2018 12:23:04 +0200
Message-id: <9310418.Wg32kryeWE@amdc3058>
User-Agent: KMail/4.13.3 (Linux/3.13.0-96-generic; KDE/4.13.3; x86_64; ; )
MIME-version: 1.0
Content-transfer-encoding: 7Bit
Content-type: text/plain; charset="us-ascii"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsWy7djPc7rc4p3RBps2sFqc2HSQ2eLj8fus
	FnPOPGCxWNC9kM3ieO8OFouVx2wc2DwOvFjI7rFz1l12jzvX9rB5PLm2mcnj/b6rbAGsUVw2
	Kak5mWWpRfp2CVwZK/49Zi14w19x5+oVtgbGr9xdjJwcEgImEkf3nWLtYuTiEBJYwSixo30F
	C0hCSOAzo8Sh1hCYomMbmxkh4ssYJeb/YIRo+M0o0f+lmQ0kwSZgJTGxfRVYkYhAmETjpiXM
	IDazQD+jxIYfASC2sIC9xNK/h8AWsAioSuybOp8dxOYV0JT4eLUHbI6ogJfEln3tTBBxQYkf
	k++xQMyRl9i3fyorhK0jcfbYOrAjJARmsEk8+9nACHGpi8SrTaeZIWxhiVfHt7BD2DISnR0H
	mSAapjNKvPm1lAXCWc8osebMMSaIKmuJw8cvQq3gk5i0bTrQJA6gOK9ER5sQRImHROe5P0yQ
	oIiV2DD/KdsERulZSI6dheTYWUiOXcDIvIpRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMw
	2k//O/51B+O+P0mHGAU4GJV4eCM+tkcLsSaWFVfmHmKU4GBWEuHlzOiIFuJNSaysSi3Kjy8q
	zUktPsQozcGiJM7Lp5UWLSSQnliSmp2aWpBaBJNl4uCUamBcWt/OaO2Zt4ppAd8DmWvlaz4Y
	+3yMyzkjwfY3T1xuRkzucrHPGrzFHD5pmlcXuD/mtDm4ZXWC4/4J++aLBsvvPP8xtGfD3c5n
	6yTusiRlyOXFZOzyXXX+3WwxaV5haX5Nv6Vb//xKeFn7/Xinha8Co//ddQvPvli8kfefZ7BS
	enl+X/5EFRElluKMREMt5qLiRAC7F5288gIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMLMWRmVeSWpSXmKPExsVy+t/xy7pc4p3RBtvamCxObDrIbPHx+H1W
	izlnHrBYLOheyGZxvHcHi8XKYzYObB4HXixk99g56y67x51re9g8nlzbzOTxft9VtgDWKC6b
	lNSczLLUIn27BK6MFf8esxa84a+4c/UKWwPjV+4uRk4OCQETiWMbmxm7GLk4hASWMEos/nCO
	BcL5yyhxZcIZNpAqNgEriYntqxhBbBGBMIk1y1ezgxQxC/QzShz+e58dJCEsYC+x9O8hFhCb
	RUBVYt/U+WBxXgFNiY9Xe8AGiQp4SWzZ184EEReU+DH5Hlg9s4C8xL79U1khbC2J9TuPM01g
	5J2FpGwWkrJZSMoWMDKvYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECAzKbcd+bt7BeGlj8CFG
	AQ5GJR7eiI/t0UKsiWXFlbmHGCU4mJVEeDkzOqKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8543
	qIwSEkhPLEnNTk0tSC2CyTJxcEo1MDaHsM/uO3uJ2zWnIfLB08ZGk/c3Xq7UsxDb9Lg1vmWG
	7qNlLzbVu0zwXb/sp5/Z0wluOn75OyK0hZZLes1/wNKXJfGjM6Yi9qCYcNCeH+r+/V8/d2+r
	fbj3Z3qrzmOZZwJS72ZURmxYU9v8xXop05+JFtMzPVR8pmefSFtVvMIpiMG0UvnuXSWW4oxE
	Qy3mouJEANnZsKhGAgAA
X-CMS-MailID: 20180831102306eucas1p1ffbf82383f23675fecb5faf8a2fa54d7
X-Msg-Generator: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20180831102306eucas1p1ffbf82383f23675fecb5faf8a2fa54d7
References: <CGME20180831102306eucas1p1ffbf82383f23675fecb5faf8a2fa54d7@eucas1p1.samsung.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 210.118.77.12
X-Mailman-Approved-At: Fri, 31 Aug 2018 08:38:46 -0400
Subject: [Qemu-arm] [PATCH] hw/arm/exynos4210: fix Exynos4210 UART support
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
	Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9teP5Fd7A8R

commit 97274d0c05d4 ("hw/char/exynos4210_uart.c: Remove unneeded
handling of NULL chardev") broke Exynos4210 support as it removed
NULL 'Chardev *chr' handling from exynos4210_uart_create() and
currently exynos4210_init() always passes NULL as 'Chardev *chr'
argument to exynos4210_uart_create() calls. Fix it by adding
missing serial_hd() calls to exynos4210_init().

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 hw/arm/exynos4210.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: b/hw/arm/exynos4210.c
===================================================================
--- a/hw/arm/exynos4210.c	2018-08-22 12:21:06.328813907 +0200
+++ b/hw/arm/exynos4210.c	2018-08-22 13:00:54.344771039 +0200
@@ -352,19 +352,19 @@ Exynos4210State *exynos4210_init(MemoryR
 
     /*** UARTs ***/
     exynos4210_uart_create(EXYNOS4210_UART0_BASE_ADDR,
-                           EXYNOS4210_UART0_FIFO_SIZE, 0, NULL,
+                           EXYNOS4210_UART0_FIFO_SIZE, 0, serial_hd(0),
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 0)]);
 
     exynos4210_uart_create(EXYNOS4210_UART1_BASE_ADDR,
-                           EXYNOS4210_UART1_FIFO_SIZE, 1, NULL,
+                           EXYNOS4210_UART1_FIFO_SIZE, 1, serial_hd(1),
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 1)]);
 
     exynos4210_uart_create(EXYNOS4210_UART2_BASE_ADDR,
-                           EXYNOS4210_UART2_FIFO_SIZE, 2, NULL,
+                           EXYNOS4210_UART2_FIFO_SIZE, 2, serial_hd(2),
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 2)]);
 
     exynos4210_uart_create(EXYNOS4210_UART3_BASE_ADDR,
-                           EXYNOS4210_UART3_FIFO_SIZE, 3, NULL,
+                           EXYNOS4210_UART3_FIFO_SIZE, 3, serial_hd(3),
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 3)]);
 
     /*** SD/MMC host controllers ***/

