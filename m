Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5191187wro;
        Mon, 29 Oct 2018 23:38:58 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fQut92K0YZEpk3MgEzu45v45p9EORehezW36ARM4XaveXUkiTb+esjI1XQmvj4pFmaf602
X-Received: by 2002:aed:30e2:: with SMTP id 89-v6mr1123835qtf.290.1540881537979;
        Mon, 29 Oct 2018 23:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540881537; cv=none;
        d=google.com; s=arc-20160816;
        b=zUXBJOGeor5vl+eyJ9j6wJ4om9qekwT8iPKsMdQfTErNJUayvRckjLwC1rf/0rOyXN
         zmmf5XANhB4zaNnhXuJ1F/NsPKNgEIvKoIS6fpZNIcQwxR4/T77I+SyWtqeYwP/qVB4Z
         V8+0U89ODkRUo6EeuAUkA8YMAd7UqfCr3pxWGsGCLnNOlmVE2TW0ZlNFg74lw6Vyaz5p
         +qBm2lfZdVEhwVQL10NxQL+kNSvhO3kFAV/UXvQFBHZsRN6EW4v5wdQa5OB3vp5NvepU
         pstZH75GEymW7fZdmxtPZnuEIOSvn4U0+Hmiy9Mjl+OjQkgXQTtukdt9NnaPKXwRVIl1
         F5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=q2WqmOSzn7/ydumNzZKhVJlz5jjDigOJyWWKGVVOZLM=;
        b=AVJPfZFsp2BZEKXy6HGd9WXqC286xSyPw1u8Q9U8XpyGCYrMId18pxgMmYyo7WCKE8
         4eyzm9i5AHTuntdcAdiCQ4XTZAMznn0nN2ySj1qB1J5nu6vDLvkpbOwtFhebCSgvqIF+
         dp5AyPoe5No1NuKkSYgxXU9ISs2JWGh5ngIdLUa3/Y+EJtgxAsj1YIqLgxob4g5WZ3WL
         fg2Hr4fMr6w9IZ05ocgtNEV4PAkZ1Mb7vZOEM6jb5S+UDqXM34cAJBXrJ4BVamMpkrsf
         Xt1znwsT5IhAKagF6Pv7cIAN3ou7sRj67yCLHbfbVBSoTcOQYilGLlxdENBU72/qK7Cj
         Uelg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o51si2882205qtj.204.2018.10.29.23.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 23:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHNg1-0001Of-Io
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 02:38:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gHNfo-0001KU-Rb
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 02:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gHNfl-0005aq-GO
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 02:38:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42970)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gHNfj-0005YD-HK; Tue, 30 Oct 2018 02:38:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84F7C307D85B;
	Tue, 30 Oct 2018 06:38:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBE2E5D9D6;
	Tue, 30 Oct 2018 06:38:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1DE4DB3DC7; Tue, 30 Oct 2018 07:38:30 +0100 (CET)
Date: Tue, 30 Oct 2018 07:38:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20181030063830.edjacusffvgwvnt2@sirius.home.kraxel.org>
References: <20181029223207.31878-1-philmd@redhat.com>
	<20181029223207.31878-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181029223207.31878-4-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 30 Oct 2018 06:38:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/3] arm: allwinner: Enable USB EHCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Icenowy Zheng <icenowy@aosc.xyz>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LG40uLlaqpGB

On Mon, Oct 29, 2018 at 11:32:07PM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Guenter Roeck <linux@roeck-us.net>
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> [PMD: Intented tabs -> space]
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/arm/allwinner-a10.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 0a8ac929f5..92ab66354a 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -116,6 +116,8 @@ static void aw_a10_realize(DeviceState *dev, Error =
**errp)
>      if (machine_usb(current_machine)) {
>          sysbus_create_simple("sysbus-ohci", 0x01c14400, s->irq[64]);
>          sysbus_create_simple("sysbus-ohci", 0x01c1c400, s->irq[65]);
> +        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c14000, s->irq[39])=
;
> +        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c1c000, s->irq[40])=
;

Hmm, is this a companion controller setup?  If so, then this is a bit
more complicated  (see ehci_create_ich9_with_companions()).

cheers,
  Gerd

