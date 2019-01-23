Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp835950wrt;
        Wed, 23 Jan 2019 07:51:15 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5HSHlwii6S9pkCK7Pbzmy5GaYHkn7kBAoI5dFkvti1NwZiDYlE2ZJZsp4PhZlbIhl7LMtl
X-Received: by 2002:a7b:c181:: with SMTP id y1mr3298967wmi.10.1548258675159;
        Wed, 23 Jan 2019 07:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548258675; cv=none;
        d=google.com; s=arc-20160816;
        b=zczMK0u3AuBdGTqwyO/01PrN+HXcVT6vVpgGMJ8ULHk9oS6aN4XF2nzmVXJgEZn+zQ
         sDr+b60ZhSs55iokv5IKXwpd/jaiamtMf8X63pBhdEzml3mdC3XIxEPQrXo/5Ucq11ii
         FgtqATJeq3+pu5OfumfJoOEVYo8liP+ZtGrUdQbN6W99t7DD/bE7cSKhjGZyY291M7x1
         Eqd6Q2WgroTsqMXCqNcy7RHZcUqj2/WazVPIoJu/cx1Dp09cGf5Qu/P5fjfh5Zr3+YTx
         ZpNfsg8beZ7084PVY88itPa5FOUGWUIMqKCQn05zcLdNhAWFK81gMa/zHfXDiuUlqmsp
         e7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UbmrWoyXVDL76pN6mx9BycSrj9m2Cj0nzehoyp/1pAg=;
        b=xNWs8pv9bNhyFqkK6wTd74UoTXigzawTZf5E79l29PhV4EDiEgaFSPCwUSAM2lwcXp
         fAZCZGM1lpKIeEP4P1UbWPa0KMffH3o0A5zMrkSLWEaTPayhKsSP1myUgyMcOvnYobK+
         QLAOyd2bVRyq80Ha3IOTel1774C4164Y64OW+D2KnP1Y4jNTbmLx1RHFMB1lIHD/Uk8X
         kWvXvZ8oxmbO/Idt0OaGH1kR8XRSUoNXMmzH8xDYCL2+zO6+tLMLE4B2YA+rTwLiA2uf
         og2wDZrq/EmXFHf70VzKmcJt38Hpib/yPkUUM1ohhnJCP2uIFaS0UGYYyaRadRz4e9DZ
         W3wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GdguvcuN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si74088638wru.306.2019.01.23.07.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 07:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GdguvcuN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:37189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmKo6-0002s4-9m
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 10:51:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gmKnf-0002ls-CF
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 10:50:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gmKne-0001G9-Ds
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 10:50:47 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gmKne-00013g-7R; Wed, 23 Jan 2019 10:50:46 -0500
Received: by mail-wm1-x341.google.com with SMTP id r24so207226wmh.0;
	Wed, 23 Jan 2019 07:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UbmrWoyXVDL76pN6mx9BycSrj9m2Cj0nzehoyp/1pAg=;
	b=GdguvcuNVuG7+O8XoZ2g5OO/SZOnLlPbU7/zfCJrFtwFRKpb0yLzXRDs/W7LZ6M4v3
	p7UtaJuwfGhYBCw/4R6IwqtnPqyUjClmXnqfiPzAWntERU0QKscCjs66V2vWM97JE1Dp
	1nn7IJjRcOKG1Bj8ewpwKrMR2zACbDNcWNYmdeffy4xlYHKb0BG8kQxZZrlINJx3kqI3
	laN9A0p72texZG8vCE4PJfQvVq8Tij5F+/bxqotYIi5yPKurI9zA7N4yfv+Z0jZKR94y
	nWOCatZcZTHnISQ1RVmd/rQj/1QjK3hOJXdATXwO2ftwwxF/Es1GDPr+Cm/0+uRi/gMi
	1n6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UbmrWoyXVDL76pN6mx9BycSrj9m2Cj0nzehoyp/1pAg=;
	b=AHue4IGfGN23oWx9TVat983X9xBRJXKWN09LB5/589Pe2eHeQzmjP1MoqQqWi1hn9t
	i4IvC+m58V3zKT8BksZ5S2XfLTS15Sg04iRQIvssqT+CnmTO7CIiQxPPMN6I4nA1/8s+
	2gj0+p/uiLmfKAkXmGryn4Sk6ONr5XaIj56RcYOh9rarzn3OkYG2NFmqbO+EhjFsPK7L
	IaZxVx4JYl0HqTkVPBU1ibTZXRcS9HiBGD53Lj51I8K3WD28ZzNBOPyStmPePJPFC+p+
	dglhO0VYDuZEYzEQtaRiv+HK3UZjwHAsAtskowbJSduuMyVE02KrBAcp9gKA4F8je+ca
	wnUw==
X-Gm-Message-State: AJcUukcDK0hShJLYLCqfwzIhg7dtmVW0b4LNCy2XMKf2LlmAJAn7COvL
	laFFh22WnC3bKzD/BxeeeHHlswByU1ZBIdHvMz0=
X-Received: by 2002:a1c:7eca:: with SMTP id z193mr3413787wmc.140.1548258622303;
	Wed, 23 Jan 2019 07:50:22 -0800 (PST)
MIME-Version: 1.0
References: <CAAJhNetR-8z37JuOmFDRuq3JfG_S03VDZkciqiKh_kieoqxQ1g@mail.gmail.com>
	<628a94ba-2202-6a15-865b-16d52653288d@redhat.com>
	<CAFEAcA8jvRRpphFS7jvisU+f0SEvU1DOhrBxgKSRWEMkZV3eOw@mail.gmail.com>
In-Reply-To: <CAFEAcA8jvRRpphFS7jvisU+f0SEvU1DOhrBxgKSRWEMkZV3eOw@mail.gmail.com>
From: ksourav <sourav.jb1988@gmail.com>
Date: Wed, 23 Jan 2019 21:20:10 +0530
Message-ID: <CAAJhNeta4fWX7y-ap-CSUhrHDGrZH_Xss6tyDa6=vn_uUJSk0Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [Qemu-arm] object owner argument of
 memory_region_init_ram
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9mnV+9mQ9CEb

Thanks for the reply.
Should I send patches for socs using NULL owner to qemu-trivial@nongnu.org ?

I have been reading qemu source code for soc and different device
implementation for past few days to understand qemu internals.
While I have a rough idea of qemu object model, I would like to have your input.
If someone has to learn about qemu object model or soc implementation,
what would be the correct way ?
So far I have implemented a minimal platform device and experimented
with it using linux driver on qemu. But I am wondering is there any
other way of doing things to develop understanding.

Thanks in Advance

On Wed, Jan 23, 2019 at 4:23 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 23 Jan 2019 at 06:10, Thomas Huth <thuth@redhat.com> wrote:
> > On 2019-01-23 04:07, ksourav wrote:
> > > I am trying to learn how qemu implements different soc.
> > > While reading the source code, I found that in some socs, object owner
> > > is passed as NULL to the routine memory_region_init_ram() (for example
> > > in nrf51 soc) and in some socs(for example in Allwinner A10) an
> > > object(non NULL) is passed to memory_region_initi_ram().
> > > When I checked docs/devel/memory.txt, I found below lines.
> > > "For regions that "have no owner" (NULL is passed at creation time), the
> > > machine object is actually used as the owner."
> > > Is the machine object refers to the actual board instance that will
> > > use the soc? For example microbit in case of nrf51 soc ?
> > > Is there any reason of not passing object as owner or in other words,
> > > when do we pass NULL or an object to memory_region_initi_ram() ?
> >
> > I'm not an expert here, but when you look at the description of
> > memory_region_init_ram() in include/exec/memory.h:
> >
> >  * @owner: the object that tracks the region's reference count (must be
> >  *         TYPE_DEVICE or a subclass of TYPE_DEVICE, or NULL)
> >
> > So if you're calling memory_region_init_ram() from a device's
> > instance_init() or realize() function, you should use the current device
> > state as owner. But if you want to call the function from a
> > MachineClass->init function instead already, you don't have a
> > DeviceState* yet, so you have to use NULL there.
>
> Yes. Also old-style boards which don't use MachineState directly
> will pass a NULL owner, as will very old non-QOM devices, and
> probably one or two devices with bugs. Don't copy those examples :-)
> (the nrf51_soc you mention above is an example of a bug.)
>
> The reason the owner matters here is so we clean things up correctly
> when the device goes away. So for a machine model it doesn't matter
> because the machine is never destroyed. For an SoC, that is also
> typically never destroyed and so bugs where the owner was not set
> easily go unnoticed. But there is a corner case where the user can
> introspect an object, which causes a temporary copy to go through
> instance_init, which can result in leaks if ownership is wrong.
>
> We really need to make sure we have a good grasp of this kind of
> thing and write it up somewhere (in particular the object life cycle,
> what can or should be done in instance_init, how things need to
> be parented to ensure there are no leaks, etc.)
>
> thanks
> -- PMM
