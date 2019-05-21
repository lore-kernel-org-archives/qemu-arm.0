Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp913099wrg;
        Mon, 20 May 2019 20:22:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNn/NfhwnNycMStYjp/4Cz+ITgMHHFOiNOtZ9RfdscQdOCytKNtWpeZn14P5WE+jml/Hxz
X-Received: by 2002:a17:906:e0c5:: with SMTP id gl5mr61724650ejb.212.1558408954217;
        Mon, 20 May 2019 20:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558408954; cv=none;
        d=google.com; s=arc-20160816;
        b=oarpPlJjpe3wd7vQ5t7EbfEH8I/XAEKUIDzId67pDP+gD8wXoFLE1W+AhVffFWbiI/
         bF0Bo2reRzh+kghph4+ANW3c5lKILvXGmPh1cVuokd/kXVKEnRyZ7bah1zvHExp5HN+x
         PHHquMeP/2oq59i2BrD8occUkeZkFVzJjBAXlx5fyUYT6Fqn2j2Gy2N8b53mKCCTYIql
         qQgHHNFVl9LUgJBi43+0RSlaPQ8xZYLZLu9RlJ9qIs9hMDRwHJaTp/cbc8NimiTvE+/C
         xk/WT+MrJFzYA7IHPPvkpuuCZBNVzgXWHrc6chzDLMeZ7rFzDjprpQJK8TToAXzwhj8X
         5Ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=93+WcRY0wPU62e2U0WfGLeY8c9JcOq0+LCapmnZtLq0=;
        b=QyjDD7vGiBs3yu7oznQ4NF20Jq938FsGIKZMGKpaKHyw3J+AFXryneIhenaT2Jh6BE
         M7sYukWR66SBC9yo8CNdNZYL59eSHv5r5HSSABw7qbfg8iEJWdusFusmyEzMWk6Rk2r0
         WuB25HpBe6eSzypE+LQE8ikzhGUUnbyhJsS7mIpptQAVXXsQDQmorl1yfdXa7t85yAP+
         PiEbodRhc6ndC8W9IsCY8o8g7URlgKtS9SNTevvfv/TbAHEn+rwBNU9iOFxF6rrKb74G
         +57V1ZG5C3JOupWJjDpqrd9D3XqdFZxfs2AIIb/ubmqau9sVVvwO2GJgiA8PDEE7z8bu
         60Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26si1071404edy.37.2019.05.20.20.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 20:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSvMH-0003qi-B4
	for alex.bennee@linaro.org; Mon, 20 May 2019 23:22:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1hSvM9-0003qb-9y
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:22:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1hSvM8-0007Pz-DU
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:22:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1hSvM8-0007P8-7y; Mon, 20 May 2019 23:22:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60281F74A0;
	Tue, 21 May 2019 03:22:22 +0000 (UTC)
Received: from [10.72.12.36] (ovpn-12-36.pek2.redhat.com [10.72.12.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 907A71001E66;
	Tue, 21 May 2019 03:22:19 +0000 (UTC)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20190520181111.20407-1-clg@kaod.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <57879890-1587-f66f-7947-6fade53f542f@redhat.com>
Date: Tue, 21 May 2019 11:22:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520181111.20407-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 21 May 2019 03:22:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] ftgmac100: do not link to netdev
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Wim Vervoorn <wvervoorn@eltan.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xRGun/y57hDZ


On 2019/5/21 =E4=B8=8A=E5=8D=882:11, C=C3=A9dric Le Goater wrote:
> qdev_set_nic_properties() is already used in the Aspeed SoC level to
> bind the ftgmac100 device to the netdev.
>
> This is fixing support for multiple net devices.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>   hw/net/ftgmac100.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 790430346b51..d9986c6baa92 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -1016,8 +1016,6 @@ static void ftgmac100_realize(DeviceState *dev, E=
rror **errp)
>       sysbus_init_irq(sbd, &s->irq);
>       qemu_macaddr_default_if_unset(&s->conf.macaddr);
>  =20
> -    s->conf.peers.ncs[0] =3D nd_table[0].netdev;
> -
>       s->nic =3D qemu_new_nic(&net_ftgmac100_info, &s->conf,
>                             object_get_typename(OBJECT(dev)), DEVICE(de=
v)->id,
>                             s);


Applied.

Thanks

