Received: by 10.223.161.27 with SMTP id o27csp1443935wro;
        Wed, 25 Oct 2017 01:46:11 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TyhB7Te3kJW7V4TAorBG7ID+OYr5wk2oLzVI+D0PBsbduoanRH0/hNoHxn/HT8fTqRchWf
X-Received: by 10.37.223.129 with SMTP id w123mr651953ybg.288.1508921171529;
        Wed, 25 Oct 2017 01:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508921171; cv=none;
        d=google.com; s=arc-20160816;
        b=q21o7L3SNL5nCu+OMV+/hCwSN99Ux3ci1t/t7EKUyKzEWhwZg09y4LSt1+fobYe0So
         SNW8lZIiVKggwrlTryclaoQ+mg1Je6KmI/rBf6vjLHGNfqQwnORKJvp5WfV+rYLy3NJ+
         dYdRHQXTT+cWp8We0QDnE0A7dTgQssvzz/h1zIFCE0LNK/nhZlkMT2VT3RHuJkxfysbA
         95+qeou3+3MuL39V++1XmSwRrFm5bRBP+MRFij99uSH4Wzcwi6Ojuh/vkrV0+utzIRy2
         fFZs475UEgE4xS92SxoKdgqp+CWnsdaGMR99C0/CQNkPK0bSKxdhTsrHypsydSwyumc4
         cdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:mail-followup-to
         :message-id:to:from:date:arc-authentication-results;
        bh=oMIywchxq+gZUcXKEXpP/TKOQlDPH1VcRUDMGjtob2Y=;
        b=YH9aDviTgTiJAv/BazUPmPhfYr1c/iGjdc8VRHaB99DDd5J50P5/+LcSjWPjkM9r8H
         CLAR9Zi97RP0aXdBmizZgXib5DMJD+yCf2n3/1BufOi1UACee2wdL30UfBNARo4rizJx
         otxotQwGk1MEMAIbCiPcbiPw0yUyrhgeBQN2hu5kVsbFdezDTk0w/XmJn3yB/zChAcyd
         tQyiNrV1Mxiclvg/go8g6DwwyK+oPaNRO8VuPOhknb26DMYqs4CgfROfsyMQYk81V+Rl
         LGcRFVW8WHqcEYD70V9HGfYPZqT3aKrntT+4+j1IZrUId3K3Zd0q6RcAMxtv+501D1A0
         sMGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v14si350299ybm.379.2017.10.25.01.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Oct 2017 01:46:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:47191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7HKF-0007tu-04
	for alex.bennee@linaro.org; Wed, 25 Oct 2017 04:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1e7HK6-0007tb-4Q
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 04:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1e7HK0-0003CT-9t
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 04:46:02 -0400
Received: from aserp1040.oracle.com ([141.146.126.69]:19209)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <darren.kenny@oracle.com>)
	id 1e7HK0-0003Ap-1w; Wed, 25 Oct 2017 04:45:56 -0400
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by aserp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id v9P8jm7Z015322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Oct 2017 08:45:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id v9P8jmHX002174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 25 Oct 2017 08:45:48 GMT
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id v9P8jlp6018597;
	Wed, 25 Oct 2017 08:45:47 GMT
Received: from starbug-vm.ie.oracle.com (/10.175.222.11)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 25 Oct 2017 01:45:47 -0700
Date: Wed, 25 Oct 2017 09:45:42 +0100
From: Darren Kenny <darren.kenny@oracle.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Message-ID: <20171025084542.g65k7bv65j6nhaby@starbug-vm.ie.oracle.com>
Mail-Followup-To: Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	f4bug@amsat.org, alistair23@gmail.com, pbonzini@redhat.com,
	imammedo@redhat.com
References: <1508898544-10307-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <1508898544-10307-1-git-send-email-sundeep.lkml@gmail.com>
User-Agent: NeoMutt/20171013
X-Source-IP: userv0021.oracle.com [156.151.31.71]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 141.146.126.69
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu devel V4 PATCH] msf2: Remove dead
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
X-TUID: loCvHpnw8D/m

LGTM now, thanks.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

On Wed, Oct 25, 2017 at 07:59:04AM +0530, Subbaraya Sundeep wrote:
>Fixed incorrect frame size mask, validated maximum frame
>size in spi_write and removed dead code.
>
>Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>---
>v4:
>	changed %d to %u while logging frame size error.
>v3:
>	Added comment that [31:6] bits are reserved in R_SPI_DFSIZE
>	register and logged incorrect value too in guest error(suggested
>	by Darren).
>v2:
>	else if -> else in set_fifodepth
>	log guest error when frame size is more than 32
>
> hw/ssi/mss-spi.c | 18 ++++++++++++++----
> 1 file changed, 14 insertions(+), 4 deletions(-)
>
>diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>index 5a8e308..d60daba 100644
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
>+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Incorrect size %u provided."
>+                         "Maximum frame size is %u\n",
>+                         __func__, value & FRAMESZ_MASK, FRAMESZ_MAX);
>+            break;
>+        }
>         s->regs[R_SPI_DFSIZE] = value;
>         break;
>
>-- 
>2.5.0
>
>
