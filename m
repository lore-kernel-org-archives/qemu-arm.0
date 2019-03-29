Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1851277wrx;
        Fri, 29 Mar 2019 06:13:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKWNOwMXh8qU2K4UKE6QGimqUEmrME73lh68tjeSpVbhOQvbLy4zz2THZZIpr8L8Q2IkwC
X-Received: by 2002:a24:3a8b:: with SMTP id m133mr4205183itm.26.1553865216591;
        Fri, 29 Mar 2019 06:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553865216; cv=none;
        d=google.com; s=arc-20160816;
        b=UvpjOOa2iHnqcpoiJ4duONc3dfqbnVQuChtkx6jGdinJIgy9ISFnO69bGjFmrMiO5A
         jRPtl7rzeZe9ezotRApqVHq1f3DKpgUMKTDbElshwZMzQMl4mBBH3GFU0eNgIRStVFhU
         t9Z9EzzOxAtoCsDXMZHIjBzl/Bznuj0JUfrr526GAcGbZdqE+TFHpbhu7Vpg7pHKN7CX
         Yn2HBGSlXu5Eb2MpXOYC5R/1PZvcDpu15yDy31j+UyaRVcEbbkEALll8N/ENPL8nawif
         gpqhAX+6e48tEM+s+HQFlJoN2bV4D/AqWi6uuZGZBirIW4TJdHg5aXkKt8kNm8bx80VB
         2OKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=3/oUGSvgSgQ4zd1bCROXBciKkdYCdt2t2dp2mjl+ToU=;
        b=GprQAg+cdlSENXkjmZQxVUGFOzlSI+BM2qKiFZ4OZFRznXOuNdB/IbTCVXZqsrXWJU
         SQEuJHPe4TnXAXiHJguGrplJjMqgqo6or5gvCbowg0RirSpDvHUjuP/MnPeytL1w2LV8
         oYgiUUdwJuoFbgYwnMkyKkdGwrdDbiotjckBV9l5ZDTHrV78uJMEZWHbOMX00l150hqS
         SaceMrYmMUhM2uTTatROoXep9NzAtOXutRml0IB0VyUxNY0wL1WCG6aXh3jwtuY3l/9I
         CurqRbfbMlRoBGV2or3L0RxxIpshPEm7vd9O4AibhqmfRtFcOQX7bcF51oAmDO2EMFrC
         /KZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si1042320jak.22.2019.03.29.06.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 06:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9rKB-0002Cp-RN
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 09:13:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h9rJm-0002As-1Z
	for qemu-devel@nongnu.org; Fri, 29 Mar 2019 09:13:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h9rJl-0007rp-6K
	for qemu-devel@nongnu.org; Fri, 29 Mar 2019 09:13:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45750)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1h9rJk-0007rS-UB
	for qemu-devel@nongnu.org; Fri, 29 Mar 2019 09:13:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id s15so2523909wra.12
	for <qemu-devel@nongnu.org>; Fri, 29 Mar 2019 06:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3/oUGSvgSgQ4zd1bCROXBciKkdYCdt2t2dp2mjl+ToU=;
	b=S28eD1q2kL792S8YwNbGOuJzDATnL5TZs9MNDsf7lMHzHE8PkfHaJQX+zJ4kHZKmtB
	+ar8mZEjbo2+kDFhow3w+O/gsaktXPImzkTVEfAObNGz57/Qlkb0Rul8ymvXy92KCURQ
	iarwOMhrmC4XBF8bAEkRrXdcSB0U1NRO7SwodzcCeeaq8AuaieKfWy+65hEzsVnXm9Vx
	0omln42L6yPemcp2d4xpGzLzT5+KUaLPwgkaUsbgZTO5Ey3IquV2Bw7iJWq+k3ZaYty6
	0C4VaICwjajHy8PpvymiWNAHe35fsH3vzyKd3gM73nvEwVXpKTpueArKPnoeUXtYvGZ5
	mZgQ==
X-Gm-Message-State: APjAAAV9qdQ2PTg76oRYYM5kQFez/07tXNPubT/2AUCqlVSnZa3qFU1R
	jmwheGyGYTQOqKkSHKB7uyMXbA==
X-Received: by 2002:a5d:400c:: with SMTP id n12mr30905676wrp.31.1553865187939; 
	Fri, 29 Mar 2019 06:13:07 -0700 (PDT)
Received: from steredhat (host40-210-static.34-79-b.business.telecomitalia.it.
	[79.34.210.40])
	by smtp.gmail.com with ESMTPSA id x18sm1633896wmi.6.2019.03.29.06.13.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Mar 2019 06:13:07 -0700 (PDT)
Date: Fri, 29 Mar 2019 14:13:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190329131304.fnh4fjyhtw2eji7t@steredhat>
References: <20190328152635.2794-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190328152635.2794-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH for-4.1] hw/ssi/xilinx_spips: Avoid
 variable length array
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B2GQvF0Jaea9

On Thu, Mar 28, 2019 at 03:26:35PM +0000, Peter Maydell wrote:
> In the stripe8() function we use a variable length array; however
> we know that the maximum length required is MAX_NUM_BUSSES. Use
> a fixed-length array and an assert instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ssi/xilinx_spips.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

I really think is a good idea to remove variable length arrays!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano
