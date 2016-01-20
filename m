Received: by 10.25.159.19 with SMTP id i19csp3244415lfe;
        Wed, 20 Jan 2016 09:23:31 -0800 (PST)
X-Received: by 10.140.129.203 with SMTP id 194mr49575360qhb.57.1453310611152;
        Wed, 20 Jan 2016 09:23:31 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v13si44718933qka.57.2016.01.20.09.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 09:23:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLwTi-00069s-KL
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 12:23:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aLwTC-0005ZH-GN
	for qemu-devel@nongnu.org; Wed, 20 Jan 2016 12:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aLwTB-0003MK-LO
	for qemu-devel@nongnu.org; Wed, 20 Jan 2016 12:22:58 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aLwT4-0003LI-8q; Wed, 20 Jan 2016 12:22:50 -0500
Received: by mail-lf0-x241.google.com with SMTP id c134so878962lfb.2;
	Wed, 20 Jan 2016 09:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=bnUuehb/H3n4s6up1dh2cFJ6EjgRvbotiZ66BXnYBzQ=;
	b=ZTvYJp26YfZ3k7lrB9CSjj1EFxbHB2vEE04iV4WJtnSxyU0yxAZzMrXqrGsq896WTg
	vG+PeVCgdrQT2bV3C0QATzgB2LZBrxpAZXaS/8ZTs8v1Cv3qJoueFj+LlhxSHvLYWTxd
	sr5TvTEOxBTI7uK9H8JPV95QmyE8ziZbho+M2yucdkWS/rw/neIgocE5kMrlhfGz+2hO
	8w6biFfSepZ4/DMibDyWahAYqF2VHNCp+H7UbXIWzOx7U2qtja7SqBmC7GKCv/TStjww
	5Xx0aXMSiqMhMr1BJGFN3Oa1rc8z0f9JfAVXisF+YnhIiuSI/of0UKHCIWAJH6wGRltr
	12RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=bnUuehb/H3n4s6up1dh2cFJ6EjgRvbotiZ66BXnYBzQ=;
	b=ep3MZxfMc2RIZy2Fm3AMt0E4jL4bMMSn49e/F8DyPn8mzEoXb2pslFI0Qxu0qjepmm
	evcPQL19v3EPk34cmdLb8kzBi8ZKAavS3gedp7m4MmwjIysVd8Jeg8MNaM00KWClGuRp
	n0yPeZsW3LsXVS7P+/VzGQ9q8tI0VUHKC87+3X/f6ns7VG5JJBnm0tTREQeNzfaCpcCl
	iV+nOmtlyvsZZUpMj7fbx2MjvItj5/4zpA07vqUTb/ZmZrZRT/RX60ncoc7Xi0cnky6e
	oDRbq9jreUTPGmsHEkI3kzG2cCicYXT1qCWtQUfqbTLbnKE3M/plTgxk7/EPaN/01KzX
	uuJQ==
X-Gm-Message-State: ALoCoQkhoPpxy8vGFbyIhDw+WYwhhIUC+O8n5zGf5kLs3igLli73XlfZ/jYwaDjmux2Tk0gPBXKDlm99B0SM7l1IxP1xruTsLg==
X-Received: by 10.25.17.89 with SMTP id g86mr11220257lfi.82.1453310569537;
	Wed, 20 Jan 2016 09:22:49 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	n185sm4622102lfd.27.2016.01.20.09.22.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jan 2016 09:22:49 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<9bdf3e1d349c7cfc6d75cc37430fe4f177c20734.1452359845.git.digetx@gmail.com>
	<CAPokK=qC77XBkNpHa1y_Dajd9Hv8+a-wx9iqC1dRumeKgvUvaA@mail.gmail.com>
	<569FBDF3.2070405@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <569FC243.6090507@gmail.com>
Date: Wed, 20 Jan 2016 20:22:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <569FBDF3.2070405@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v10 2/7] hw/ptimer: Perform tick and
 counter wrap around if timer already expired
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
X-TUID: oqBSvN2nB6uH

20.01.2016 20:03, Dmitry Osipenko пишет:
> Hi Peter,
>
> 10.01.2016 03:44, Peter Crosthwaite пишет:
>> On Sat, Jan 9, 2016 at 9:39 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> [cut]
>>> In addition, there is no reason to keep expired timer tick deferred, so
>>> just perform the tick from ptimer_get_count().
>>>
> [cut]
>
> I noticed an issue here... The problem is that device reset invokes
> ptimer_stop() that invokes ptimer_get_count() that might cause the tick after
> reset, i.e. bogus bh would be invoked after QEMU reset. I have reproduced that
> issue.
>
> The solution might be to introduce ptimer_reset() that would stop QEMU timer and
> reset delta/load/period without invoking ptimer_get_count. And of course all
> devices should be updated to use new ptimer_reset() prior to "Perform tick and
> counter wrap around if timer already expired" patch, but that's not an issue I
> suppose. Please let me know if you have any objections, I'm leaning to do it in
> V11.
>
> void ptimer_reset(ptimer_state *s)
> {
>      timer_del(s->timer);
>      s->enabled = 0;
>      s->period_frac = 0;
>      s->period = 0;
>      s->delta = 0;
>      s->limit = 0;
> }
>

However, ptimer_stop() still would be broken. So maybe it's better to keep tick 
deferred.

-- 
Dmitry
