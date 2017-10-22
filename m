Received: by 10.223.197.9 with SMTP id q9csp9878539wrf;
        Sun, 22 Oct 2017 11:49:19 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RWdY0UbTgWfFCtgC6exRhPzZBf2tvSO6/tfE2EJDWQ2ZVMhoouLIz7XYJxLoPcQg+71/yS
X-Received: by 10.55.209.86 with SMTP id s83mr5168352qki.145.1508698159166;
        Sun, 22 Oct 2017 11:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508698159; cv=none;
        d=google.com; s=arc-20160816;
        b=xKLgpbCvmZ996C0HSaLl4NHFRiqVtVCYiCBsGLN5u0kxCd2kAZ+GDJhG7wer44TKvH
         35gLV0NEJk8wvNSjkB84+MRETNl5W+El4lI+H9NiIn7lYIiwXefoNXv+QH9ZnN8rnI6z
         Lws8I3+hPR9cSYnGb+IMc3pows45ZC3R4kG/uNPKrIeC5MkWxmkiWyqoFgiAYs9KIN+5
         oXTsKy3KCDK2TlVLCCBCbYeuYHJ2G3l4g27c2Bqb6RuVrabSIy5ErjlVwK2ddr/t8oGq
         avPBnNugz5Ap/ETkLwe+WpEf6y/rvp85S9KwEb89/CDPndV/l6HCAMLXeHh65Pv0tVpt
         zqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:mail-followup-to
         :message-id:to:from:date:arc-authentication-results;
        bh=Te62/diQF22KHQTSnrjAujMnTQXE6To12D/823qvpJQ=;
        b=CdfziemRzjD/81YHHaunbwYNhWKj+B+iJe30RpP7+/qfYseSRbNfJZ0dGt5XJFosyG
         p/OZAH4ZSU837GYENrpGsm5Y30dXh0V/NalidfRhqJlelvvM7kxjMF7bui5wATURoRoh
         H+4PKJB7PK+K672JhoN3J8bQ9aSfQ340uqlAkWeUk4yP5ptjk7H+BWBNHCHB9SqL1yjO
         NUVEL6uAbV8YCaMV4uEiRNvFI7d1f13uW80TEnHq8gCjO1NMJKZCjOXdSdBniYadtHt3
         Bs909qnp8TvQDu6VhubI9gndIq/UwtCMzRB17LmWlHbrul17+GZG6AcJVvoso9t1VoZS
         wZ9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si1591113qka.337.2017.10.22.11.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Oct 2017 11:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:33941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6LJE-0005Zy-Ue
	for alex.bennee@linaro.org; Sun, 22 Oct 2017 14:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1e6LJ6-0005Zc-K3
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 14:49:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1e6LJ1-0003qH-37
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 14:49:08 -0400
Received: from userp1040.oracle.com ([156.151.31.81]:16812)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <darren.kenny@oracle.com>)
	id 1e6LJ0-0003pg-Q5; Sun, 22 Oct 2017 14:49:03 -0400
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id v9MImteM025516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Oct 2017 18:48:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id v9MIms0P004076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 22 Oct 2017 18:48:54 GMT
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id v9MImqQL009869;
	Sun, 22 Oct 2017 18:48:53 GMT
Received: from starbug-vm.ie.oracle.com (/10.175.172.156)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 22 Oct 2017 11:48:52 -0700
Date: Sun, 22 Oct 2017 19:48:47 +0100
From: Darren Kenny <darren.kenny@oracle.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Message-ID: <20171022184847.xgkhvteu67ajxq3d@starbug-vm.ie.oracle.com>
Mail-Followup-To: Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	f4bug@amsat.org, alistair23@gmail.com, pbonzini@redhat.com,
	imammedo@redhat.com
References: <1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com>
User-Agent: NeoMutt/20171013
X-Source-IP: aserv0022.oracle.com [141.146.126.234]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 156.151.31.81
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu devel v3 PATCH] msf2: Remove dead
 code reported by Coverity
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, qemu-devel@nongnu.org,
	imammedo@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D4EwcIvj2Xdu

On Sun, Oct 22, 2017 at 06:58:02PM +0530, Subbaraya Sundeep wrote:
>Fixed incorrect frame size mask, validated maximum frame
>size in spi_write and removed dead code.
>
>Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>---
>v3:
>	Added comment that [31:6] bits are reserved in R_SPI_DFSIZE
>	register and logged incorrect value too in guest error(suggested
>    by Darren).
>v2:
>    else if -> else in set_fifodepth
>    log guest error when frame size is more than 32
>
> hw/ssi/mss-spi.c | 18 ++++++++++++++----
> 1 file changed, 14 insertions(+), 4 deletions(-)
>
>diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>index 5a8e308..e1b6227 100644
>--- a/hw/ssi/mss-spi.c
>+++ b/hw/ssi/mss-spi.c
>@@ -76,9 +76,10 @@
> #define C_BIGFIFO            (1 << 29)
> #define C_RESET              (1 << 31)
>
>-#define FRAMESZ_MASK         0x1F
>+#define FRAMESZ_MASK         0x3F
> #define FMCOUNT_MASK         0x00FFFF00
> #define FMCOUNT_SHIFT        8
>+#define FRAMESZ_MAX          32
>
> static void txfifo_reset(MSSSpiState *s)
> {
>@@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)
>         s->fifo_depth = 32;
>     } else if (size <= 16) {
>         s->fifo_depth = 16;
>-    } else if (size <= 32) {
>-        s->fifo_depth = 8;
>     } else {
>-        s->fifo_depth = 4;
>+        s->fifo_depth = 8;
>     }
> }
>
>@@ -301,6 +300,17 @@ static void spi_write(void *opaque, hwaddr addr,
>         if (s->enabled) {
>             break;
>         }
>+        /*
>+         * [31:6] bits are reserved bits and for future use.
>+         * [5:0] are for frame size. Only [5:0] bits are validated
>+         * during write, [31:6] bits are untouched.
>+         */
>+        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
>+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Incorrect size %d provided."
>+                         "Maximum frame size is %d\n",
>+                         __func__, value & FRAMESZ_MASK, FRAMESZ_MAX);

Nitpicking here really, but shouldn't the %d be %u since value is a uint32_t?

Thanks,

Darren.

>+            break;
>+        }
>         s->regs[R_SPI_DFSIZE] = value;
>         break;
>
>-- 
>2.5.0
>
>
