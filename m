Received: by 10.28.71.27 with SMTP id u27csp1093773wma;
        Fri, 9 Feb 2018 08:00:45 -0800 (PST)
X-Google-Smtp-Source: AH8x226pVk7gCFCYLMmzocl14ZnnVZFGSu61xoORuNK+QtlNDgknHwUsm8uQyXmQv57oRPmyiYVB
X-Received: by 10.37.113.134 with SMTP id m128mr2128166ybc.56.1518192044853;
        Fri, 09 Feb 2018 08:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518192044; cv=none;
        d=google.com; s=arc-20160816;
        b=GhPVoYtG6N3p2lgWreaIIMJLaprjI2ZP3tkS/5NoDquth+t/j6bRToXLSTfbS5VQoY
         pJs0Fzg17rRrtZSDh5QVFMZ//u3iufG2IXk75hNigOT4O94+TamoOrDB4dQ+Mjnbx1lP
         CR3ypJF+Zk5GC8Q8x/DCfGXPld4CKpy7o5qF1uvK2HYd84a+6y+FRNTe3wnNLEKBeQp7
         wzVUZxAm1XZYSYJqKfBUbtZ78WGm+1J9EBzvOXp5wdMj31BboLHPGLI5bdwHbC5IhECs
         9T3ksCCHYfPtD8BUBe5HSJj9A8UYZNRuQaSvwbQYjxUQ1xhiDZDR07YobNHBIf1seiQB
         sibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/w2fw6XAHoOh37axhTBX5ZPgOMhwUaqbhvMPGXg6qt8=;
        b=kUD3Ji9icZXcvcIdk70gk8ZNxN/1HERiCKZquHBRus052OPei2KIhCTQlehJi3z1Sm
         pVKcVyWLxhNKZsumZVvP7jtFoW5k+3PGW+JmZFtC0Sc0YMW2Ff03UxGBiDvzve4l7/pI
         U2JtZvLoVfgf2dvgxqz4Tlg6TYQi4sBHLEN9EHniuYB5T5fsSe/oMShLAR9c6/wLHzkv
         UJ4RIH9Rg8OKevsGxqof/7jTm+OPjt81RM5S2B35a1h7Ch97hykdCM80zyYxqqEkb049
         IOV4feoK/T0KNazSzuAjZ9zxyb6YU8FWf7kskYDSxR4u23A+TpaDtLRRXCeKpSzr6jGX
         fGOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dTPl5C0q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1si452943ywe.29.2018.02.09.08.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 08:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dTPl5C0q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekB6S-0008AQ-BZ
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 11:00:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1ekAjj-0004Ob-Bk
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 10:37:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1ekAji-0007Hh-F0
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 10:37:15 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:43397)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
	id 1ekAjf-0007Gj-Ni; Fri, 09 Feb 2018 10:37:11 -0500
Received: by mail-qk0-x241.google.com with SMTP id d129so7151414qke.10;
	Fri, 09 Feb 2018 07:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=/w2fw6XAHoOh37axhTBX5ZPgOMhwUaqbhvMPGXg6qt8=;
	b=dTPl5C0qDOmEDHhSzKEH/P6TvCJkPtUUTvKbykDYdMxE/oMr/KCSokkoBk7Ld20zwh
	9HLX0RJACaY7tM8DzJbCGqS5KlO+ve3Xif7Bw97Aqp5Ior83aZKSvJx28A1HvTwaEF8w
	DbbSEsX/xmj6fATSWlMvKbBq0+MaLGBkP3Um90FmywV3m+HinIehbXO7urikQZq/levu
	mpyHZ3DpgX0grlj09NdnwsY7hEwbu9xsbkwE6ozb4Ze4e2FDdLlEWBKByd163KXyQu1z
	Uuq1Hmw/n6P6wJnZ55utrl1yoSH8ErBrkY/yJY5DRB++2wX6sDpIHlE5u++bRxIA4cVq
	iuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=/w2fw6XAHoOh37axhTBX5ZPgOMhwUaqbhvMPGXg6qt8=;
	b=cWtTlQBD9AHC8/BDLAkcctprORPWZA9VvxsVGDbJ9AbHmUSZznOb2TrV2j7hMGLrdl
	ObCPpzPs7NBpLVxAppDtrkLu0GfMZZ1FW35orqV7fYxK8FQnmBEupS6OEGthtrE5xT20
	ILv3eHCG1p06SiISPpGBu+jaCAMO1dlPRKe5yelbWcuTpYlo9MqaYifoelYKEu+UimmP
	MDCk3iorKNVuHcIWIDZO/iO1S+tKvUDjBsRLfS+o+FwXcPkB3otGFdDubaXfM8vp1//7
	n2KUlEJ0oaE5jc4Z/bxXeGA+eDd76LrhgTQ5mu+B7KIKc8vwxo0C/yNvgoO5ZUOXQnt9
	mH6A==
X-Gm-Message-State: APf1xPDneXrG5UG3ua433cunEfLFgdPX7ERvysOtnol6eBs+I5SyE3Wf
	4Sd3jb/OSwifZwmJ2aBCvFea3T6oYXsz8vPGVQPnfZLg
X-Received: by 10.55.17.75 with SMTP id b72mr4483295qkh.337.1518190630764;
	Fri, 09 Feb 2018 07:37:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.39.197 with HTTP; Fri, 9 Feb 2018 07:37:10 -0800 (PST)
In-Reply-To: <CAFEAcA_Z1JH6RXp19g2N3rV3TGOTa7LzFctEScrENBYB8eAf3w@mail.gmail.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-4-git-send-email-geert+renesas@glider.be>
	<CAFEAcA_Z1JH6RXp19g2N3rV3TGOTa7LzFctEScrENBYB8eAf3w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Feb 2018 16:37:10 +0100
X-Google-Sender-Auth: gkaEMdLplwFJLus1m6HOUrWMKdQ
Message-ID: <CAMuHMdX07rESnzAko-Tjp6xvdmPEKsX0djp3sP5HZqzv6jvWMw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus
 devices again
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Epmh/KG0RB8i

Hi Peter,

On Fri, Feb 9, 2018 at 4:27 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 February 2018 at 15:17, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>> Allow the instantation of generic dynamic sysbus devices again, without
>> the need to create a new device-specific vfio type.
>>
>> This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
>> Allow only supported dynamic sysbus devices").
>>
>> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  hw/arm/virt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b334c82edae9fb1f..fa83784fc08ed076 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>      mc->max_cpus = 255;
>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>>      mc->block_default_type = IF_VIRTIO;
>>      mc->no_cdrom = 1;
>>      mc->pci_allow_0_address = true;
>
> This needs a lot of justification. Dynamic sysbus is not supposed
> to be for plugging any random sysbus device in, it's for vfio,
> which needs special casing anyway to work right. (Overall it's

Sure. Is there a way to limit this to vfio devices?

> a terrible hack -- in an ideal world all vfio would use pci
> or another probeable bus.)

What about vfio-platform, which is my use case?
On DT-based systems, platform devices are described very well in DT (even
better than what's provided by probing PCI IDs and BARs ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
