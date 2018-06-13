Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp905390wrq;
        Wed, 13 Jun 2018 09:22:13 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLru23/z2PWapRLL7x3fZRSsr/xRvLOcIswtbzPV9lso9DEd0+NIUUQEGc99G22JJOAjq5i
X-Received: by 2002:ac8:3212:: with SMTP id x18-v6mr5187628qta.44.1528906933157;
        Wed, 13 Jun 2018 09:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528906933; cv=none;
        d=google.com; s=arc-20160816;
        b=BXZURo8pvWgkK0sA8SBlZXaUyrL2wyVPdavTLlP5DyFrz5Ls5jFF4RLOQm60YuAH/D
         fZYQMGW73AUybA0STQakRipXosB7Cpn6lJC/BjdaXt4eCQYdLMXZcxkYWVY7mBGUIBwW
         8RsPabgte3THYH9ZPaJdhlQlsy6EzGUIBgKFz1c6wzGrMiUZ7nwIeAXeqhbsEYXePqoi
         J5QMzr0ze/6SBp0Euzj5UjwzbRFqWQ4Tn75c68U7OGISHskAdmliYPu1mwuRJc8+/yo3
         pg6OUZyNP6TYm7S6WX0wxoHTKuIYQ3coWj6F6sjatkOa/v0e7Uz51QbH1D7ZbAwbPJQq
         /PGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=BKzyfClkjKAyxWWuuYBbFtBLlUE7WrECDmZMNRKBt3g=;
        b=mLDqnO83qsTGTYYhKmv+UKMCUiPMqJAJVGQ/oASxuCRsTN3O+o0OhgxkKbscL5/TE8
         Y5bd7cDFGfJc3/bEve+xvxNgRBCzOML0WyVdpAmiDKOXCjbuEgaOsr7ik9TxMiaRF9S/
         U4x5pAbo34NskIUcNKNprA+yK+jJ+7J8jBuhK7wVH/ANnQxusCPInCbxd0AwXMnPEG/E
         aEqSg+hP2jpezrne1tarMpamtCJaGD87yG/GI9l46c2beYMjfi3qeqYAhw+FeUdamReO
         nAG9AeWdhmK1aVqj9VDLqry/woWOfhivOsVhABK/k/tmcEaQheQBZxyPBBiz6vyWyYos
         3sJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TfYELlLZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y24-v6si3073840qtj.231.2018.06.13.09.22.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 09:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TfYELlLZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT8XE-0000Ru-LT
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 12:22:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1fT8Wd-0000E1-E6
	for qemu-devel@nongnu.org; Wed, 13 Jun 2018 12:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1fT8Wc-000408-14
	for qemu-devel@nongnu.org; Wed, 13 Jun 2018 12:21:35 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36320)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1fT8Wb-0003u9-Qz; Wed, 13 Jun 2018 12:21:33 -0400
Received: by mail-wm0-x244.google.com with SMTP id v131-v6so6550300wma.1;
	Wed, 13 Jun 2018 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BKzyfClkjKAyxWWuuYBbFtBLlUE7WrECDmZMNRKBt3g=;
	b=TfYELlLZ91P5jhL8+GaIcteWiRHFqrK7eQ3w/YhEhW91x+xwciftHQ5mGw8pSV3+IH
	0uHuBsOf/korEcgb+FCaUojjl7xkQkAJCK1exwKVHn/6J0A0EFphKX80jheADDzUsR5F
	k6ZRAwcVsaGfUnG+eDKLP69vAD+zipeE8Pdknc+n6QdYVlF62f+vTh4fJX8ZBTABkGS1
	xNP5ZvrVS8vWDQWuk/cR0+f23crp+OnXjsxkoirO2jVm8p1FLCDXmwMFyLedE06rsqYC
	jzbRsUQ8toSTLdkzOHlvImRhEUahZokZ3MP5hAgOuJrpYiGwuY1qhfpe3VrgHRrY3GPD
	y5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BKzyfClkjKAyxWWuuYBbFtBLlUE7WrECDmZMNRKBt3g=;
	b=fOMF9k+aJXZkkkn2Q+ZOMsRdBlLmCsiuB8H+nzI6sxV3qG1NjaBk5/tCqfdhSC6dD2
	mLXSaROBILlpDLLXhGezoz2X2GCT3ZRpF0c1darmUM+h6byRy2n564Kl4vlvfRzqCWXp
	p7zN8hEDPyz1pmLMp/YXEFCQtqinwHeM5f/r/+Gn1wLRccimXSvNljHTlOWr5Ixeq/0z
	sLvRIesJE1JoJ9C6L2AZSP7UUfvI4pvMifH5LayhTWECypNbaD21gTO2DfOBgRfIorqn
	lQ5tLYCBK4IgXox21tJM7oIaRrgiiEzqt8nx9a2irzBKS9fW96z5BrR3fPKx/M+MypGG
	rF2Q==
X-Gm-Message-State: APt69E2ZrHDbyjZ4J8H/12yA1ilXAvlTPCcmFlk3AFotgR2az8oF+e+/
	/BsupT86G8G7/PDcO+3RGtHFM0INU9npkS1ayXA=
X-Received: by 2002:a1c:f30f:: with SMTP id
	q15-v6mr3857301wmq.36.1528906891214; 
	Wed, 13 Jun 2018 09:21:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:e607:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 09:21:30
	-0700 (PDT)
In-Reply-To: <431f487d-71f0-a766-eea4-7f3369984a7f@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
	<20180612104430.25745-5-kraxel@redhat.com>
	<431f487d-71f0-a766-eea4-7f3369984a7f@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 13 Jun 2018 18:21:30 +0200
Message-ID: <CAJ+F1CK3R7ap=mEd5pDQzKcU2g9z1v3LzutHx4ibxj=Rk9uUCg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-devel] [PULL 4/8] bus: do not unref the added child bus
 on realize
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
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, QEMU <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ri8uX/w296TT

Hi

On Wed, Jun 13, 2018 at 6:05 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 12/06/2018 12:44, Gerd Hoffmann wrote:
>>
>> When the parent bus removes the child property, it takes care of
>> removing the added reference, in object_finalize_child_property().
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Message-id: 20180531195119.22021-2-marcandre.lureau@redhat.com
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  hw/core/bus.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/core/bus.c b/hw/core/bus.c
>> index 4651f24486..ad0c9df335 100644
>> --- a/hw/core/bus.c
>> +++ b/hw/core/bus.c
>> @@ -102,7 +102,6 @@ static void qbus_realize(BusState *bus, DeviceState =
*parent, const char *name)
>>          QLIST_INSERT_HEAD(&bus->parent->child_bus, bus, sibling);
>>          bus->parent->num_child_bus++;
>>          object_property_add_child(OBJECT(bus->parent), bus->name, OBJEC=
T(bus), NULL);
>> -        object_unref(OBJECT(bus));
>
> This is wrong.  object_finalize_child_property()'s unref balances the
> ref in object_property_add_child().  qbus_realize's unref balances the
> ref that was initially placed by object_new/object_initialize.
>
> So you're introducing a leak.

Oops, too bad you didn't review earlier. Hmm.. I vote for reverting
the 4 patches.



--=20
Marc-Andr=C3=A9 Lureau
