Received: by 10.25.208.211 with SMTP id h202csp1079549lfg;
        Mon, 22 Feb 2016 01:19:20 -0800 (PST)
X-Received: by 10.140.105.195 with SMTP id c61mr32482311qgf.40.1456132760375;
        Mon, 22 Feb 2016 01:19:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9si2474162qkh.109.2016.02.22.01.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 01:19:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXmeF-0003FK-Pi
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 04:19:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXmds-0002rM-Bt
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 04:18:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXmdr-0006PK-Gi
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 04:18:56 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXmdr-0006PA-8h
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 04:18:55 -0500
Received: by mail-vk0-x235.google.com with SMTP id e185so123766165vkb.1
	for <qemu-devel@nongnu.org>; Mon, 22 Feb 2016 01:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8RDWubaG46Wt/7qz0g3DpY1IDIDVO85asduLMuEka20=;
	b=DctwtFtbO9unk7dhTaHPePl5YCypGL6VLY95iInN/rTE/BZzqSgrTOSBUQnRvfowS3
	MtImoFztQqniIXeRrSb/N3rxvBOUCffv6wi3FXBgNk4lScYTg9PwkgOonVW4jVy7ZYzb
	Mq59UDc7deZj5WCF9jZQBorViLDn3+8hSWP/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8RDWubaG46Wt/7qz0g3DpY1IDIDVO85asduLMuEka20=;
	b=mGjFCfetAfYS6YW+prrnECjclQFSt7z+mDyCZfZFB7FW9ZE9k59AqnCAcBINKYOPgh
	4txXMF1xh5xQbCMWPv2KVYZ+hlDjLbSreuJf43fBLFxgX6DLMnlB3BK39cW6ZVLpZRru
	jMWbgCvJnzcrVa9QwqM4+mnNtxzAGoHAz5w2torKTlFEaDAO16BLfX+Q3D/YRCuQEqvF
	+Moc1oQkFhuOm+MIep8a5OLAjjWLCaSXsxWc/45DN+hDD9DPdVxhhXdbv5q4A9Uf78EV
	JXasuy+h0F7nri7WKiA4Ny7h1tQRwyK2f6gfWSC5AK4qHZPJMW9HHYlDQyYAmVTavr4R
	5a/Q==
X-Gm-Message-State: AG10YOQe1pK2ecqbdfT5V0XoDRBrZ7f4qS7Saytstlgp7pJ/FiVjWdY/+B2pC9rflvhM2b36bEIXHb/MgqurX1pG
X-Received: by 10.31.141.2 with SMTP id p2mr22698678vkd.37.1456132734920; Mon,
	22 Feb 2016 01:18:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 22 Feb 2016 01:18:35 -0800 (PST)
In-Reply-To: <1456110933-5457-10-git-send-email-zxq_yx_007@163.com>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
	<1456110933-5457-10-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2016 09:18:35 +0000
Message-ID: <CAFEAcA-iTcWTX5eVpe9NWb5MqYVcxUajRCnzQVFY=raBq-an4w@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Maksim Kozlov <m.kozlov@samsung.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-devel] [PATCH v4 9/9] hw/timer: QOM'ify tusb6010
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
X-TUID: 0dfyWoItMhu+

On 22 February 2016 at 03:15, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Move majority of old SysBus init's work the into instance_init.
>
> Note:
> musb_init must be called in SysBus's init, otherwise it will
> break "make check" with error message as follows:
>
> qom/object.c:1576:object_get_canonical_path_component: assertion failed: (obj->parent != NULL)
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/timer/tusb6010.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)

Devices should either be instance_init + realize, or
sysbus-init. This patch would make this device be a mix
of both. You should just drop this patch until musb has
been properly QOMified.

thanks
-- PMM
