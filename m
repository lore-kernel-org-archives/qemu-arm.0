Received: by 10.223.197.9 with SMTP id q9csp5463001wrf;
        Wed, 18 Oct 2017 01:56:34 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R554+DH7qYlgFqAkOxH4UXTsRuW5zxvTySrY0iHP2yyZcf8CoqkTrkCEIyAaBIfoVEYpxD
X-Received: by 10.237.34.213 with SMTP id q21mr1983776qtc.65.1508316994503;
        Wed, 18 Oct 2017 01:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508316994; cv=none;
        d=google.com; s=arc-20160816;
        b=szRzF9OboavP8j8FW7T40RN0mOqAN6XTRcP1CAme2jzr0cjt8V/ybk6KN1G+11z5Kr
         yTaCPnT9JRp7PfHfEUNJcvTcIVkeVwRPkk0WUw1LaIASHmKXXhiEOz1Vhc5IRknS2pYE
         FncN691l55Z5EqyCcsB0KIOffW4A4ks1K04gHQSer/qcpgn+UO7FARJMlk38CVfaUS01
         3+p8dakTKam5VTVB0s5L/5q8j0yQPIvC4J9FUE6eb5xl2Que8vzTJRo0WUsQYbPPh9f3
         8f4kyKzBcAu0AA0eQKDXIXM2Izq17EVihBqvzUM+9DE8RSEAd8OFFcVrYdI34/8rbPsF
         AFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:mail-followup-to
         :message-id:to:from:date:arc-authentication-results;
        bh=0YKqr+ZqTJX2sAMwbpJ2H1QYVSHiglrwZKQYoqLV9WY=;
        b=iNJwWV23JRSiIYt/XPLgVfZVpIyaGQ17Yp3GrgAHSxch4sLrc0dbZROs+kIwtdI65o
         Fk2POlBZCyK1lCMDzyFTPnUtzFIFN0kXszRvt2rtZMwpwllGC5leCkJIhYrNY0+GK8rk
         w5tq8kHEFiEq9ZFkDf+9qIsJvJBMccgJ2RrtatcswarYHbtzER1IhUsiZpHX1dvfgQbc
         kdB08Z9idvlGLFd0WYoX1BSiG2/Wp3slfk9g0a+5Ngm6+PVuQjej9zz1nQkm0AGlc0wh
         e+Wf4Tv1hsCkjEkA8LYx2EuRy2BkBt/CrtoktuzI9jfVVQtPqhh8IFEDG+WFkEAstBhP
         OziA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x24si8187225qta.114.2017.10.18.01.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Oct 2017 01:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:43405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4k9Q-0000rz-EN
	for alex.bennee@linaro.org; Wed, 18 Oct 2017 04:56:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1e4k8L-0000XB-ED
	for qemu-devel@nongnu.org; Wed, 18 Oct 2017 04:55:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1e4k8I-0003Ip-DL
	for qemu-devel@nongnu.org; Wed, 18 Oct 2017 04:55:25 -0400
Received: from userp1040.oracle.com ([156.151.31.81]:20140)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <darren.kenny@oracle.com>)
	id 1e4k88-0002yA-T3; Wed, 18 Oct 2017 04:55:13 -0400
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id v9I8t6os001890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2017 08:55:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id v9I8t59L018789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 18 Oct 2017 08:55:05 GMT
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id v9I8t4TK030710;
	Wed, 18 Oct 2017 08:55:04 GMT
Received: from starbug-vm.ie.oracle.com (/10.175.208.173)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 18 Oct 2017 01:55:03 -0700
Date: Wed, 18 Oct 2017 09:54:59 +0100
From: Darren Kenny <darren.kenny@oracle.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Message-ID: <20171018085459.3mt4gynx3s3gndnt@starbug-vm.ie.oracle.com>
Mail-Followup-To: Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	f4bug@amsat.org, alistair23@gmail.com, pbonzini@redhat.com,
	imammedo@redhat.com
References: <1508298038-4156-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <1508298038-4156-1-git-send-email-sundeep.lkml@gmail.com>
User-Agent: NeoMutt/20170914 (1.9.0)
X-Source-IP: userv0021.oracle.com [156.151.31.71]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 156.151.31.81
Subject: Re: [Qemu-devel] [Qemu devel v2 PATCH] msf2: Remove dead code
 reported by Coverity
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
Cc: peter.maydell@linaro.org, crosthwaite.peter@gmail.com, f4bug@amsat.org,
	qemu-devel@nongnu.org, imammedo@redhat.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MYXoCVsELJ7C

On Wed, Oct 18, 2017 at 03:40:38AM +0000, Subbaraya Sundeep wrote:
>Fixed incorrect frame size mask, validated maximum frame
>size in spi_write and removed dead code.
>
>Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>---
>v2:
>	else if -> else in set_fifodepth
>	log guest error when frame size is more than 32
>
> hw/ssi/mss-spi.c | 12 ++++++++----
> 1 file changed, 8 insertions(+), 4 deletions(-)
>
>diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>index 5a8e308..7fef2c3 100644
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
>@@ -301,6 +300,11 @@ static void spi_write(void *opaque, hwaddr addr,
>         if (s->enabled) {
>             break;
>         }
>+        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
>+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Maximum frame size is %d\n",
>+                         __func__, FRAMESZ_MAX);
>+            break;
>+        }
>         s->regs[R_SPI_DFSIZE] = value;
>         break;

This test, and subsequent use of value appear to be out of sorts -
in that while it is testing for the value by ANDing it with
FRAMESZ_MASK, it is subsequently using the value without that mask
applied to it, which still has the potential to be larger than
FRAMESZ_MASK if it contains a value larger than 0x3F.

Is that the expected behaviour? If so, maybe include a comment on
it?

Also, it might be useful to include the incorrect value in the
logged output too, not just what the maximum is.

Thanks,

Darren.

>
>-- 
>2.5.0
>
>
