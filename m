Received: by 10.182.158.201 with SMTP id ww9csp11738647obb;
        Wed, 6 Jan 2016 04:19:01 -0800 (PST)
X-Received: by 10.140.30.101 with SMTP id c92mr131967522qgc.14.1452082741606;
        Wed, 06 Jan 2016 04:19:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r129si37060870qhb.44.2016.01.06.04.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 04:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGn3N-0005JR-92
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 07:19:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGn2m-0004js-7G
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 07:18:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGn2h-00037U-78
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 07:18:24 -0500
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:35810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aGn2h-00037N-23; Wed, 06 Jan 2016 07:18:19 -0500
Received: by mail-pf0-x236.google.com with SMTP id 78so241280521pfw.2;
	Wed, 06 Jan 2016 04:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fCbhzUpKtRBQkdG5L827ZhNVNjOUbtf2h87G7kHQfaM=;
	b=ftpMQ10LI2132erUKY3UTyN7h03Sd2V9qHzEg84i1ETzWTFraymCruBLRK0Aw2zusI
	4xmE32pVTSrHMpF+BJFEDEIlRbOTrJidLziAfCpbMg2oNTaejNzBHON0NUdlQENen09F
	93fyjjFgnIxSpRk+yplADvnGRB45T06eSgOuR646Idgznnb+QO6Sa48s2NaZ9/F3UzwH
	37LC1EHYeImXZFGpngJIXnPSMWFFL5x1AxwCUustws6NiJXC0rkyrBw+ONDr3oDJ+wgv
	feewKrjf8Y/Zw5fQN1rL0qPA2sOwl3ApMTxhuuwRihUEnNsSHo+Lto/pVadXTUdVv1VT
	RsUg==
X-Received: by 10.98.79.66 with SMTP id d63mr142008438pfb.34.1452082698471;
	Wed, 06 Jan 2016 04:18:18 -0800 (PST)
Received: from pcrost-box (pa49-197-174-152.pa.qld.optusnet.com.au.
	[49.197.174.152]) by smtp.gmail.com with ESMTPSA id
	m1sm135219103pfi.27.2016.01.06.04.18.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 04:18:17 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 6 Jan 2016 04:17:43 -0800
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20160106121743.GD4227@pcrost-box>
References: <cover.1451960508.git.digetx@gmail.com>
	<efba01ebc3e93fb00993a2de72c7794b5e4e1411.1451960508.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efba01ebc3e93fb00993a2de72c7794b5e4e1411.1451960508.git.digetx@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::236
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v8 3/4] hw/ptimer: Update .delta on
	period/freq change
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
X-TUID: z178Bn5nXRxO

On Tue, Jan 05, 2016 at 05:33:28AM +0300, Dmitry Osipenko wrote:
> Delta value must be updated on period/freq change, otherwise running timer
> would be restarted (counter reloaded with old delta). Only m68k/mcf520x
> and arm/arm_timer devices are currently doing freq change correctly, i.e.
> stopping the timer. Perform delta update to fix affected devices and
> eliminate potential further mistakes.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
>  hw/core/ptimer.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 96a6c7a..8c2dd9f 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -207,6 +207,7 @@ void ptimer_stop(ptimer_state *s)
>  /* Set counter increment interval in nanoseconds.  */
>  void ptimer_set_period(ptimer_state *s, int64_t period)
>  {
> +    s->delta = ptimer_get_count(s);
>      s->period = period;
>      s->period_frac = 0;
>      if (s->enabled) {
> @@ -218,6 +219,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
>  /* Set counter frequency in Hz.  */
>  void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>  {
> +    s->delta = ptimer_get_count(s);
>      s->period = 1000000000ll / freq;
>      s->period_frac = (1000000000ll << 32) / freq;
>      if (s->enabled) {
> -- 
> 2.6.4
> 
