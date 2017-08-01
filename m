Received: by 10.25.44.15 with SMTP id s15csp4611477lfs;
        Tue, 1 Aug 2017 01:30:48 -0700 (PDT)
X-Received: by 10.237.53.44 with SMTP id a41mr24610607qte.231.1501576248672;
        Tue, 01 Aug 2017 01:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501576248; cv=none;
        d=google.com; s=arc-20160816;
        b=aqWEnNzAFRxSZQ5ALNbQaLLqdBLERfdOV/LyC7NXxqZG7AY53dytJEwJSW7yn/MpSs
         YXPRijraUzawnU4kgHuYK0eDpSk1hxOgiElEH83OYeNMG3pq+M2cGKkfbiH9jFEn4q6d
         qr+rfF8oRux7JRJnRgEDQN0O4oJv/DaeOD6vMBLHsstejjmPCKq4XWqa2rl+PYodKreS
         ImYvXkQWbb4B8BIVslQFKW3iVOeizM1iVTzW2XNlB01Vs7JADutBR4YDi68vnKmUVWja
         9/2YdmkrCJsg8UmlqCns1N14M3726lI+D61rbhAbEzYVvS/fltM9UBEB2uQ0qQpX/qAI
         A48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=srABhKl2b+vD/Z4lU2FIaTJTeez07FbpMFAFLrWGT0o=;
        b=wzRyCwMfi0Qu/0/xPUp+f1slHwHcC2G/jes0XDVhZuvO2rBolb8l2D88/byPNBitte
         BHeK+Y+jURbgOFQRPwyzwwYlZ65BgZUqInJACnu6Zm3CMCoXFaxVlpmQBGHV/72YEPsh
         5h/oCD0VkoItvO5+oSqIeOvMJ53jpXDCWTxwmcjdlj41N7XJCA4FvPK7Ex3sbLHnAPzB
         qGtNh++o84DMB9ViATi0EbTPoJRSga445MyDehdAjKnIGUM41RkKkHniplRvvrRvq+Kp
         75onjt6fDZwSQORC9olVNUacFQQnhnN6o7H16Vq4EymkOU/g+s3Vxnh8WKX4vTISuZyR
         jA8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=K6xGOGp6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si14949298qkm.398.2017.08.01.01.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 01:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=K6xGOGp6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcSZi-00011a-3m
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 04:30:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcSZW-00010f-Ob
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 04:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcSZV-0008Af-LV
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 04:30:34 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dcSZP-00082a-9U; Tue, 01 Aug 2017 04:30:27 -0400
Received: by mail-lf0-x242.google.com with SMTP id x16so774377lfb.4;
	Tue, 01 Aug 2017 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=srABhKl2b+vD/Z4lU2FIaTJTeez07FbpMFAFLrWGT0o=;
	b=K6xGOGp67s4ql7ITCD9bmiPIqtMynfFokHj+3mydHzI0WTsGDjpb7reDzpuQ1EBbSq
	j4scXuDn6JvZrtcf6XDj9hO700rsmLzOsOWDmAeXmZDHD9llgfc/7Jal4P9UsaRU6C2h
	DdM6eZckVZBiXIi4MSbBR9WRI+NctSSQpIYgzUck2S8pW0fMFWNGltkECStHjvS7z2JT
	b5DflBkz7IeEROQy08r8i7OCGZX2DuDs58umNV7uHli81Cb1Af7hCqhz2ijnDN7gb335
	lv/8TFOGsmlxqM0vG9QWl/Sggrcp6Ir3yvzDtMnKaFL7hG2iRIeXNyE6BB3X8w6R3dBW
	KWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=srABhKl2b+vD/Z4lU2FIaTJTeez07FbpMFAFLrWGT0o=;
	b=dEtdRWjYgZsfNDy5Gw0x2xbRlJh8wH491b35jwn34m8N8ZI5ALj9nUOzrw4P5UElqc
	sVzDmftO+GGCAebdKVplwiDiQkSib2yuZkdf0Q8X5r2XTyWQgAeSY1+wFFqPqHJjldlA
	4NTUvU9VTwfCcVYmZQUlA/YOWpXlkzdbAVuqIfpGYq8aIIHGfhAwCwkzeY0YwlCvpPKB
	sE+xNPV3XIQNmKJE5XTfzB9bp01oT9BaYNsugs35zy02Vyl4ePI4Fn4mUeTgsm5KgDbn
	jZM4r+yAiPUKodQ9g/5mjrib7CguCRa70NqbyO/h7GNHIjsSSl3UvWCaTfgFGPY/MKdB
	TjjA==
X-Gm-Message-State: AIVw113BuppAr+aXMWViyJlvYtCr/JF9/BPPGQ8QlmDLS4fq3uKKAFMr
	uxE+9J6+FIbsIQ==
X-Received: by 10.46.80.72 with SMTP id v8mr6410508ljd.192.1501576225816;
	Tue, 01 Aug 2017 01:30:25 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	s203sm6009232lja.21.2017.08.01.01.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 01:30:24 -0700 (PDT)
Date: Tue, 1 Aug 2017 10:30:24 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20170801083024.GZ4859@toto>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<20170525011034-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170706023845-mutt-send-email-mst@kernel.org>
	<AM3PR04MB0616507B6F0989360D582F37FFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170731170217-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061656F255D688500AC8622BFFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170801045857-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170801045857-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Add global device ID in virt machine
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Diana Madalina Craciun <diana.craciun@nxp.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HCQiz1hlIIIh

On Tue, Aug 01, 2017 at 05:05:42AM +0300, Michael S. Tsirkin wrote:
> On Mon, Jul 31, 2017 at 03:13:09PM +0000, Diana Madalina Craciun wrote:
> > On 07/31/2017 05:06 PM, Michael S. Tsirkin wrote:
> > > On Mon, Jul 31, 2017 at 01:22:45PM +0000, Diana Madalina Craciun wrote:
> > >>>> If we are to use a value of 0 for the constant in case of PCI devices,
> > >>>> what happens if we have multiple PCI controllers?
> > >>> I guess we'd use the PCI Segment number for that?
> > >>>
> > >>>
> > >> Yes, we can use the PCI segment for this scenario. But this would mean
> > >> different solutions for the same problem. The main problem is that we
> > >> can have multiple entities in the system that are using MSIs (for now
> > >> PCI and NXP non-PCI bus infrastructure
> > >> (https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F635905%2F&data=01%7C01%7Cdiana.craciun%40nxp.com%7C6b0c6c879af64718a21908d4d81d534e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=bpYMMqajWzgzdbdQgy%2FUYR7y%2BswyvwE%2BqFzs7wdIkkA%3D&reserved=0). I guess that we may have other
> > >> platform devices that are using MSIs in the future.
> > >>
> > >> Thanks,
> > >> Diana
> > >>
> > >>
> > > Don't have the time to explore NXP in depth, sorry - there's
> > > a lot of complexity there.
> > > Could you maybe stick some bits to specify bus type in there?
> > > It just looks very wrong to push low level things like this
> > > that users have no interest in up the stack.
> > >
> > Let's generalize the problem a little bit, the NXP details just does not
> > matter much. The problem we have is the following:
> > 
> > The GIC-ITS, the ARM MSI controller is using deviceIDs in order to remap
> > the interrupts. Each device which is expected to send MSIs has a
> > deviceID associated with it. These deviceIDs are configured into devices
> > by software/firmware. There is support in the device tree to specify the
> > correlation between requesterID and deviceID:
> > 
> > "msi-map: Maps a Requester ID to an MSI controller and associated
> >   msi-specifier data. The property is an arbitrary number of tuples of
> >   (rid-base,msi-controller,msi-base,length)"
> > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci-msi.txt)
> > 
> > Our problem is that we have to allocate these deviceIDs in QEMU as well
> > and we have to ensure that they are unique. Currently, for PCI, the
> > assumption requesterID=deviceID is made which will no longer be true in
> > case other devices are added. So we need a way (preferable a general
> > one) to allocate these IDs to different devices in the system in a
> > consistent way which will ensure that two devices do not share the same ID.
> 
> My question would be, do other types of devices that are there
> right now have some kind of ID like the requester ID?
> If so I would say just use that, and set high bits in the device ID
> to specify the type (e.g. 00 for pci, etc).
> 
> 
> IMHO if possible that is preferable to pushing this up to users.
> 
> 
> > The reason I put this ID into the controller itself is because on real
> > hardware is actually programmed into the controller. It is needed (for
> > example) when the MSIs are sent.
> > 
> > Thanks,
> > 
> > Diana
> > 
> 
> IIUC what happens on real hardware is controller maps each requester ID
> (or presumably other source ID in the request) to the device ID,
> and the mapping is internal to controller.
> If you wanted a lot of flexibility then looks like you could pass this
> mapping to controllers, but is it really necessary?
> Why don't we build a mapping that's convenient for us?
> 

Hi,

I agree with you for boards that are defined by QEMU (like the ARM virt board).
We can pick a convenient scheme and avoid too much user interaction.

But when we model real SoCs, the IDs and the way bridges convert these IDs
needs to match real HW. Otherwise guest SW will not work unmodified.
To make this work, users should not need to be involved though, it's
the machine and SoC modules that should instantiate the necessary handling
of it, IMO.

Cheers,
Edgar
