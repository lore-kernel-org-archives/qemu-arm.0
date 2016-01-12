Received: by 10.25.159.19 with SMTP id i19csp279359lfe;
        Mon, 11 Jan 2016 19:59:49 -0800 (PST)
X-Received: by 10.140.253.3 with SMTP id y3mr177476729qhc.39.1452571189754;
        Mon, 11 Jan 2016 19:59:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d190si96886798qhd.71.2016.01.11.19.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 19:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIq7Z-0001up-Ek
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 22:59:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq77-0001MD-N3
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 22:59:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq73-0001c5-JO
	for qemu-devel@nongnu.org; Mon, 11 Jan 2016 22:59:21 -0500
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:33197)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aIq73-0001bw-Ee; Mon, 11 Jan 2016 22:59:17 -0500
Received: by mail-pa0-x241.google.com with SMTP id pv5so26314028pac.0;
	Mon, 11 Jan 2016 19:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6ZYWxBHNkq54epm7YCsANhAn+Qob85M53hU4eLzqLU8=;
	b=aOVS6l4RgrjafQexovU9yvQkBz1q56/pTw/XVsYKvpbkmP7jC7MgDVmLibtGuOGmZy
	QS6RFZvB7hND77jmecxEE+01IfP8P0gDy2kbcHHu2t463FhYWS/ucmLoRYyC7gfbsUp8
	3mlT/B/DK/j0gsy+TFdTiyNSHJ+wL8K2WZfmFVkbYjeEUO0nXMbSV9C+gKYrWQRPJBEM
	/3sWjhki6pOfxbigbuIkDc8Z3s2X2yXh27SCG4L8QaVBx4H95Y3o+EnGZ5epYZARt68C
	S302w28YU72FoilVhjfNuXzC1LPsflgxqm9rHVxVly5N3F/ZY+nizk/gQn6Rr5uz2Tn5
	/hkA==
X-Received: by 10.66.55.99 with SMTP id r3mr34680530pap.100.1452571156852;
	Mon, 11 Jan 2016 19:59:16 -0800 (PST)
Received: from pcrost-box (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	g26sm26410916pfg.35.2016.01.11.19.59.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 19:59:16 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 11 Jan 2016 19:59:13 -0800
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20160112035913.GH3308@pcrost-box>
References: <cover.1452359845.git.digetx@gmail.com>
	<112f8a3527ada5a92ec851b5c6c2d8e5b84d6d0b.1452359845.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <112f8a3527ada5a92ec851b5c6c2d8e5b84d6d0b.1452359845.git.digetx@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v10 6/7] hw/ptimer: Introduce
	ptimer_get_limit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c4lJvK2mkyBY

On Sat, Jan 09, 2016 at 08:39:54PM +0300, Dmitry Osipenko wrote:
> Currently ptimer users are used to store copy of the limit value, because
> ptimer doesn't provide facility to retrieve the limit. Let's provide it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Fair call. One less piece of duped state for the VMSDs.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Regards,
Peter

> ---
>  hw/core/ptimer.c    | 5 +++++
>  include/hw/ptimer.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 42e44f9..0201d1b 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -235,6 +235,11 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
>      }
>  }
>  
> +uint64_t ptimer_get_limit(ptimer_state *s)
> +{
> +    return s->limit;
> +}
> +
>  const VMStateDescription vmstate_ptimer = {
>      .name = "ptimer",
>      .version_id = 1,
> diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
> index 8ebacbb..e397db5 100644
> --- a/include/hw/ptimer.h
> +++ b/include/hw/ptimer.h
> @@ -19,6 +19,7 @@ typedef void (*ptimer_cb)(void *opaque);
>  ptimer_state *ptimer_init(QEMUBH *bh);
>  void ptimer_set_period(ptimer_state *s, int64_t period);
>  void ptimer_set_freq(ptimer_state *s, uint32_t freq);
> +uint64_t ptimer_get_limit(ptimer_state *s);
>  void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload);
>  uint64_t ptimer_get_count(ptimer_state *s);
>  void ptimer_set_count(ptimer_state *s, uint64_t count);
> -- 
> 2.6.4
> 
