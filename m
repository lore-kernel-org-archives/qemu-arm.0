Received: by 10.28.71.27 with SMTP id u27csp1082841wma;
        Fri, 9 Feb 2018 07:51:20 -0800 (PST)
X-Google-Smtp-Source: AH8x227NRL1T/SmZuONxacj/AdX2cdWnTZANCYZ+eYyLwLzF3Wrd3fW1bKAyPVAI4fQTqrGxh6iG
X-Received: by 10.13.204.147 with SMTP id o141mr2159573ywd.349.1518191480694;
        Fri, 09 Feb 2018 07:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518191480; cv=none;
        d=google.com; s=arc-20160816;
        b=kisjKc/69npvs2XKG6h97WkiL0CPcaJNVb2NwwNNfwBopVrrSOPN1A6aqCa+0F9O57
         40f0p2TtKDfSJsxsFkn6mxaHXtJDoJMNJBGyR1vFA/pIhFJWxJ9DPOpLoHIF5jM0336k
         Q61aZ+Z9fXo19yj5hvjU+Zyhuvtn74vp+mw36GjjS2fSNARXVBk+ZWyPSyaUU6yvonv9
         ddOl9UoH9/JG78mpPHs77XmjbH4c+dgQ5muiMO0SR2yLuIvD7eUeLdCpOgvTSjmGSksn
         UcafstykssTlWJxUeWJ/Dx+eFGgfFjdDyB7C/Fjs4BEUP4mSgDNCE9Neo69Ow/lef+va
         VH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BL1lcLgUfC+Pb0VbHtvdSe+a//3yxPidg5Olr7kqrBc=;
        b=k1fhU4sVeTYqrJyHR8sWgtMDa/PaxtUOuRZmUDl6g2efU7QLNhG3CXOm/MuIHRVqPw
         vryH0zKC3wdOji6qtP5bT6Lg2SFo2bBydz2bybqlGqlP/Sg3JqvGZiwOVaCA3NiWKkRD
         5TGpRjVsPsGw0zkxEk80ZJNvsf5YKJhxU8CTwLAE4DpxuCyW/OyplDtHVEOjKYM6MoEt
         PGE8IsM9vSYA+eAyAKAw2iP3SP3Y/s4Bxxdnnvo8w3aPmUZAXjw2zU3WXh3szmmxSj7I
         jbPDO042FYJeljQyPY2LAGUTlbkzJMFnAU89lWfjFVvhXPQ1eLMfBb0tT9IevP+WZPDF
         sGwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jY/0fTNH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si446707ybj.659.2018.02.09.07.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:51:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jY/0fTNH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAxL-0000Vn-Tc
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:51:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ekAtJ-0005CK-Cu
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 10:47:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ekAtH-0004hI-UY
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 10:47:09 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:40100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ekAtH-0004h2-O9
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 10:47:07 -0500
Received: by mail-oi0-x242.google.com with SMTP id 8so6402477oix.7
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 07:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BL1lcLgUfC+Pb0VbHtvdSe+a//3yxPidg5Olr7kqrBc=;
	b=jY/0fTNH/jaJJ9dxOETgTRwREkpwFady8adI/C0fSdM8vsmRxrVl5VRlj3p5t77eQ2
	7g20PehSVS8q85JzmevVLit6Y5/HAN2HfxtGpB76pYK5i1ndFFMDhiP3+fqvqWXB5DdW
	dV/HuKsiLyAWNKkMYtjueIqoo/C+qzqWAt45c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BL1lcLgUfC+Pb0VbHtvdSe+a//3yxPidg5Olr7kqrBc=;
	b=RVvyQBFK6EZe5IzGKZSablBOslPT0wgEETfC/g1Ee1jO6XO2jPp3Niw1GhQNvKPlTS
	WbXQH60g6cdDNSS5btlRStxWuwe1ZGzzPxfXxJLhWKuPax43rpGg9wsg7wDFULzeIfT5
	EZmycp1g1ktFoxj084hvXGiE0BdeXR3F4vtcu224inOjVJB6lMXRfjFkmLvybqJqHPJ8
	KVgzcsx03LRGqjjPYpQcpL2lZEfQf8uMW/VIcDiUdffvrNRRCj3belMYoAkvHhzggS/o
	bAWZ8+Apmv2fztSRAlAVkgaZn3nXmn7OmWWHncxk1Ycc25K82p6GGxAdRPoqGq92aJdH
	zlVA==
X-Gm-Message-State: APf1xPA6QUKvw6rBWet/A05pgpxGVJXxb+LbwiVWS0BYHFxtISIyIash
	YCQaR3VKwAoogr1YUG6/rjmeYYRP5EudeAQ4zUjGWw==
X-Received: by 10.202.96.196 with SMTP id u187mr2195715oib.63.1518191226847;
	Fri, 09 Feb 2018 07:47:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Fri, 9 Feb 2018 07:46:46 -0800 (PST)
In-Reply-To: <CAMuHMdX07rESnzAko-Tjp6xvdmPEKsX0djp3sP5HZqzv6jvWMw@mail.gmail.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-4-git-send-email-geert+renesas@glider.be>
	<CAFEAcA_Z1JH6RXp19g2N3rV3TGOTa7LzFctEScrENBYB8eAf3w@mail.gmail.com>
	<CAMuHMdX07rESnzAko-Tjp6xvdmPEKsX0djp3sP5HZqzv6jvWMw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Feb 2018 15:46:46 +0000
Message-ID: <CAFEAcA9nUXjORak2TB-RGmLeEax0DZ11FsoPDy09V4w7nAXByw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus
 devices again
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Auger Eric <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T+Yk6DFHtuh/

On 9 February 2018 at 15:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Peter,
>
> On Fri, Feb 9, 2018 at 4:27 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 9 February 2018 at 15:17, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>>> Allow the instantation of generic dynamic sysbus devices again, without
>>> the need to create a new device-specific vfio type.
>>>
>>> This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
>>> Allow only supported dynamic sysbus devices").
>>>
>>> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>>  hw/arm/virt.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index b334c82edae9fb1f..fa83784fc08ed076 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>>      mc->max_cpus = 255;
>>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>>>      mc->block_default_type = IF_VIRTIO;
>>>      mc->no_cdrom = 1;
>>>      mc->pci_allow_0_address = true;
>>
>> This needs a lot of justification. Dynamic sysbus is not supposed
>> to be for plugging any random sysbus device in, it's for vfio,
>> which needs special casing anyway to work right. (Overall it's
>
> Sure. Is there a way to limit this to vfio devices?

That would be the code here which implements the whitelist of
"only allow this for the vfio devices which we have
support for mangling the device tree for and know will work".

>> a terrible hack -- in an ideal world all vfio would use pci
>> or another probeable bus.)
>
> What about vfio-platform, which is my use case?
> On DT-based systems, platform devices are described very well in DT (even
> better than what's provided by probing PCI IDs and BARs ;-)

The TYPE_VFIO_* devices in the whitelist all use DT, yes:
the code to handle creating/mangling the dt nodes for the
passed-through device is in hw/arm/sysbus-fdt.c.

thanks
-- PMM
