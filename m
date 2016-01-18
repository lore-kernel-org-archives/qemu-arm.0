Received: by 10.25.159.19 with SMTP id i19csp1820235lfe;
        Mon, 18 Jan 2016 02:07:05 -0800 (PST)
X-Received: by 10.140.86.38 with SMTP id o35mr30464104qgd.56.1453111624958;
        Mon, 18 Jan 2016 02:07:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y17si30255477qgd.82.2016.01.18.02.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 02:07:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:58599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL6iG-0006SO-Dh
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 05:07:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aL6hp-0005ss-Fb
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 05:06:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aL6ho-0006pJ-Mx
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 05:06:37 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aL6ho-0006pC-Hs
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 05:06:36 -0500
Received: by mail-vk0-x22f.google.com with SMTP id k1so328899959vkb.2
	for <qemu-devel@nongnu.org>; Mon, 18 Jan 2016 02:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CVOeOynBH9QotOMH1uGaxk9TdlJYR/RWj1qU7HKN/1k=;
	b=cSDZNIEsgFvkKDeZSkFc5u4ioav/ykwMb16b2yzFTmF0x/+GwtDTbmDDz6bIOvpeuS
	v5HRlNIrXliRTw4LUWwPc+P8ipDQs2Utt4v9vQ4ihV915MDnWR3CDLEWrRV1Q2m4K15v
	UPTYz522myNnjMukwFHpsVYxbpu4v4jzP9irA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CVOeOynBH9QotOMH1uGaxk9TdlJYR/RWj1qU7HKN/1k=;
	b=SN1u9sIDPYj4bAgG1qT8vNNM5tpNIamSS9lAiD9sW/pEgr77Ur8uSHH9aJximZjZgb
	X9tsjGOnfYzRr/GFK8KLvQ4fi16VCRfxtjkj42fEKHl3t86sdrcdfuGd1ZKQ7OG5vZRF
	xi/Z84QGZoph/bd6BuXUSkXbWTjo1zykGOTu619SD4dBU73FIXOOXTY35bLRled0+ECV
	HRlo21oCV/WbPmpc9Islnm3y8SU7cAebUCSLYT85Xe0vzr2LDbv1ZaO8QSbV8mHYbkmE
	LW2H8HHtlk1Y4sVkE8ZSlXdYchKDipGS6JL2Lt4pBn7wxDIT0E4Yax6ljtytVFGOk12P
	83Xg==
X-Gm-Message-State: ALoCoQnE8JGf/fyPw56y2AMUQkWOm+PjnAWVMogrdOTS294pLOc6XqfoLcpAI7mlKfMoCe/VJVih8x7/k7h6yrIpkdHnEZOHywyXSJm4eO8iOiSbZ7LCD/A=
X-Received: by 10.31.180.145 with SMTP id d139mr14370721vkf.83.1453111596094; 
	Mon, 18 Jan 2016 02:06:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 18 Jan 2016 02:06:16 -0800 (PST)
In-Reply-To: <569CB702.1060803@redhat.com>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<569C8B29.4040300@redhat.com>
	<CAPokK=ovLXz__Tbh--dB+GEFpgBK8w3erG=P2jNrKbY37eJWyg@mail.gmail.com>
	<569C9E87.2030001@redhat.com>
	<CAPokK=qhk15US4a-OHLFo=U2GReQv45dT4oL6z=Hu0m8Bkf74Q@mail.gmail.com>
	<569CB702.1060803@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2016 10:06:16 +0000
Message-ID: <CAFEAcA9DZ6OhN=cXVrbZftazX9eJb1eKRLG2D+Vp6mYnoXP60g@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Prasad Pandit <ppandit@redhat.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] cadence_gem: fix buffer overflow
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
X-TUID: OWcy3yLEY5uP

On 18 January 2016 at 09:57, Jason Wang <jasowang@redhat.com> wrote:
> Thanks for the pointer.
>
> In section 16.1.5, it said
>
> "Jumbo frames are not supported."
>
> So it was in fact not an unimplemented feature?

I have a vague feeling from the last time I looked at something like
this that what often happens is the hardware happily goes on dumping
data out on the wire but this is a violation of the ethernet protocol,
ie a guest error. But I'm no ethernet expert...

thanks
-- PMM
