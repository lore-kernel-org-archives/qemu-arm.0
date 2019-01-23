Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp548211wrt;
        Wed, 23 Jan 2019 02:53:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN77X54jmk89MRNi1oBOBXQRsVczmLaj2ndz2egj9Rf3ptfqPsPL2mefNFfql7Otc2l0aU2k
X-Received: by 2002:adf:c042:: with SMTP id c2mr2196738wrf.158.1548240809614;
        Wed, 23 Jan 2019 02:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548240809; cv=none;
        d=google.com; s=arc-20160816;
        b=AvBS+f+EwMafPJ8lLwN+tG14kpxdgYJsmjidav4foK3KG1ADlXp+X4GiwPZ+bXXWjK
         97rpVKV7MCzLGUPKPMHbEYEIS67+ljc+O8WQHm6NsIyv9RHHLRA7XSb/5h8EzCuJTUDM
         kbwq/MdLVGI/o0ThNh97pf4OjO0Fa/HoGpX0mHFJ0WxNVj5bDEr7oJSu0wek/jBE5qq/
         wZf3BEfaZ/VQGVyklRbjnqvkJfZ2dSo2q63WGCANj2sxU2iu+whODR/EAxjs2mVKCeqU
         nro0kwFauwAlTRQqdCNiBAifyD/glkorByZ6DvZJQsHHhKptMB6r8mVOEOSZpLFKS3uB
         bVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zgRK5orlPv97vG0Vl9R7wN27bOKoiNSkeGaJnsLx6XI=;
        b=UDHE/DJMA+jcrc0oBjjIFCvS/PsMG+0izoLHuRpXmprK/2eBcOmAMCjiZcfP/GyfRc
         hOShVFuAFb03OBfDX89JOVQuyVmU0zZuZPauCCrPWpimSfHC/82EsEroHx4QfS/3I+Vg
         dSCKJBQRSGpfvuPmtrZYmBf9iwE/+7/XaPGwBAmcOnu/37AM9gZ1m6EntoDbv85K7QRB
         RH+fb3HCqvyR80C0AMDvHfo5hmNhNJYczW8tat64v+k0f6YHkKnegkhKO2WUCSLoqPR5
         LdawfkUvhCZnZ6Nhd1N3guIZMxPkNkHaoiMXGqaKWyEsNxWii0x/ISkAPusiMQrngoOm
         JC7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XcIms83H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si68210632wro.232.2019.01.23.02.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XcIms83H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmG9w-0001VV-OB
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmG9n-0001VM-H2
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:53:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmG9l-0002NO-EX
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:53:19 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:42994)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmG9l-0002Le-7u
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:53:17 -0500
Received: by mail-ot1-x331.google.com with SMTP id v23so1492220otk.9
	for <qemu-arm@nongnu.org>; Wed, 23 Jan 2019 02:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zgRK5orlPv97vG0Vl9R7wN27bOKoiNSkeGaJnsLx6XI=;
	b=XcIms83H8l9LB8wSdM8PDTM9vCMPHN3KGaB05UZlxSHsRaTcXGVYNcl2G6sBaV6nhn
	fgK/hG8vWJUh1cRqsAtesDCOczq2MSiBiNV1Ttx1OKI4nzawTp7DWTqTmoJNxjsviGRU
	ZeI/fcUewjy22pEd8fjcDAhSGtIUVGB5VAua8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zgRK5orlPv97vG0Vl9R7wN27bOKoiNSkeGaJnsLx6XI=;
	b=rdVi/5rwJnwkDJYYaRDoGJR/5TSBLgXAMVq9FRmxw7awWjCBGOJZUfBvE3KoFP0hzJ
	O2JqN6aHE9JVm/SagYQocUWHD/xnSlmtSNB28z1UBcmEq5ndNeN8JDdiQMhffZe9KVdT
	akjh7krwF38QEL/xCrqwvvtf0NhdAHc2jh5UBitgsmCYwV8fsiolRGvhelFWGOS25tcZ
	O4PGdAunG6aAerFiA431zfPg6TO6iWuuyn55WeWFXwyPUpixTiDJuAQGkI9X0SJE0jQh
	PAvOaDJg3z1yqSX9w5zqTw412Sz5KSB0AZMmRPsCdqvq3YzSzEfYrWZlCESrAUiBNo+y
	vfWQ==
X-Gm-Message-State: AJcUukdQZe1+UUrgkSsDer6PAGn3wxdQYz7eVy5uBqdF7B/nIZu+aRMI
	fNs0xvf6j7k5ZJt4dcqAos04nmGw/R/kVFIlNpTbhg==
X-Received: by 2002:a9d:7d18:: with SMTP id v24mr1065865otn.352.1548240792788; 
	Wed, 23 Jan 2019 02:53:12 -0800 (PST)
MIME-Version: 1.0
References: <CAAJhNetR-8z37JuOmFDRuq3JfG_S03VDZkciqiKh_kieoqxQ1g@mail.gmail.com>
	<628a94ba-2202-6a15-865b-16d52653288d@redhat.com>
In-Reply-To: <628a94ba-2202-6a15-865b-16d52653288d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Jan 2019 10:53:01 +0000
Message-ID: <CAFEAcA8jvRRpphFS7jvisU+f0SEvU1DOhrBxgKSRWEMkZV3eOw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: Re: [Qemu-arm] [Qemu-devel] object owner argument of
 memory_region_init_ram
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
Cc: ksourav <sourav.jb1988@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A1YZaPWOomXA

On Wed, 23 Jan 2019 at 06:10, Thomas Huth <thuth@redhat.com> wrote:
> On 2019-01-23 04:07, ksourav wrote:
> > I am trying to learn how qemu implements different soc.
> > While reading the source code, I found that in some socs, object owner
> > is passed as NULL to the routine memory_region_init_ram() (for example
> > in nrf51 soc) and in some socs(for example in Allwinner A10) an
> > object(non NULL) is passed to memory_region_initi_ram().
> > When I checked docs/devel/memory.txt, I found below lines.
> > "For regions that "have no owner" (NULL is passed at creation time), the
> > machine object is actually used as the owner."
> > Is the machine object refers to the actual board instance that will
> > use the soc? For example microbit in case of nrf51 soc ?
> > Is there any reason of not passing object as owner or in other words,
> > when do we pass NULL or an object to memory_region_initi_ram() ?
>
> I'm not an expert here, but when you look at the description of
> memory_region_init_ram() in include/exec/memory.h:
>
>  * @owner: the object that tracks the region's reference count (must be
>  *         TYPE_DEVICE or a subclass of TYPE_DEVICE, or NULL)
>
> So if you're calling memory_region_init_ram() from a device's
> instance_init() or realize() function, you should use the current device
> state as owner. But if you want to call the function from a
> MachineClass->init function instead already, you don't have a
> DeviceState* yet, so you have to use NULL there.

Yes. Also old-style boards which don't use MachineState directly
will pass a NULL owner, as will very old non-QOM devices, and
probably one or two devices with bugs. Don't copy those examples :-)
(the nrf51_soc you mention above is an example of a bug.)

The reason the owner matters here is so we clean things up correctly
when the device goes away. So for a machine model it doesn't matter
because the machine is never destroyed. For an SoC, that is also
typically never destroyed and so bugs where the owner was not set
easily go unnoticed. But there is a corner case where the user can
introspect an object, which causes a temporary copy to go through
instance_init, which can result in leaks if ownership is wrong.

We really need to make sure we have a good grasp of this kind of
thing and write it up somewhere (in particular the object life cycle,
what can or should be done in instance_init, how things need to
be parented to ensure there are no leaks, etc.)

thanks
-- PMM
