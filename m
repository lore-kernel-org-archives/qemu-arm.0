Received: by 10.25.0.144 with SMTP id 138csp1524921lfa;
        Mon, 24 Apr 2017 10:59:22 -0700 (PDT)
X-Received: by 10.55.39.199 with SMTP id n190mr12550763qkn.175.1493056762762;
        Mon, 24 Apr 2017 10:59:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g21si18836636qte.42.2017.04.24.10.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Apr 2017 10:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d2iGg-00089K-9y
	for alex.bennee@linaro.org; Mon, 24 Apr 2017 13:59:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d2iGb-00088v-Fq
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 13:59:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d2iGa-0001Mp-KE
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 13:59:17 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:38911)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d2iGa-0001MO-Da
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 13:59:16 -0400
Received: by mail-wm0-x22e.google.com with SMTP id r190so75466008wme.1
	for <qemu-arm@nongnu.org>; Mon, 24 Apr 2017 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VqeLL2A7HnszDO3Ima4jPIkKYe/O1uGokWEEPsWmlVk=;
	b=ejwco7svVjaNISEKvUmhIJIPhnEas+8u8I6+QxRva6ykQDCjwU4a2e0+oPP2dF7lWu
	geEp50Lppfjfil9bfMwpQBPjJgP7SeWykrz4qg/hRmmfuxyz6Kpx7WUyZeRwAWLfQSq0
	Yk0bIefQlLdZzqTn2SnmHesjAmpI5mnLs9T7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VqeLL2A7HnszDO3Ima4jPIkKYe/O1uGokWEEPsWmlVk=;
	b=mG7SjGz5r+RoQQBcniPOmn2wRBgNiI5ReJJRpFIOvr204O/gerNL+iB2jathwo/P1k
	ysnuvkeZuiw4mJC2TQQHi4dXwD2yvbDv0Rday6SM8cDrhvRvilmBcUh4cvT+7tRXYGFn
	D/y83VnoMXlzc+A0FjAXOoT6i12VLFO0551o7lXlUQhnpeIxG5idFgue192Si0QOucEV
	yNqTLHBTHW3DHG4dmcXE0jc/ItPPBPDuEYJSL44ci5DXavhX8Sgnw3T4+jnc6tHHsvV+
	XAzOdf33l/xIb7X866DuCvc77tG5BmoLtIwUgiHew0MpsRCP6RSKsl0ds+tl3IGdMX7+
	DQYQ==
X-Gm-Message-State: AN3rC/6d3DfFCN6V3bkfXyjhTQ29HO25R4fxBsDTWYCywTSb9OVOsLao
	gVY1U+O4L9Qfid2RPP6KkX3M6PdukMEr
X-Received: by 10.28.104.195 with SMTP id d186mr10405472wmc.111.1493056755172; 
	Mon, 24 Apr 2017 10:59:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Mon, 24 Apr 2017 10:58:54 -0700 (PDT)
In-Reply-To: <CAKmqyKMT9Bn7OPU+h6o2Xj4DZXrVSBHr=jtR6jMSvhph0koegA@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<1491736758-19540-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKMW-aTdzvTH5sir1BPx6U9XtgiZZ7TVigooXLFMY=UEQg@mail.gmail.com>
	<CALHRZuroavWhKmiZEC6eCh0KFif0dWuQWi=QprH122QnAGjnpA@mail.gmail.com>
	<CAKmqyKMT9Bn7OPU+h6o2Xj4DZXrVSBHr=jtR6jMSvhph0koegA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2017 18:58:54 +0100
Message-ID: <CAFEAcA_PuC_B6GqL0n==SDZooQj9FtviHK3XixHd=m0Twmfp+A@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel RFC v2 1/4] msf2: Add
 Smartfusion2 System timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	sundeep subbaraya <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P2H5mMm2emzo

On 24 April 2017 at 18:44, Alistair Francis <alistair23@gmail.com> wrote:
> Basically the simple explanation is that init is called when the
> object is created and realize is called when the object is realized.
>
> Generally for devices it will go something like this:
>  1. init
>  2. Set properties
>  3. Connect things
>  4. realize
>  5. Map to memory
>
>> Don't we need to use realize function for new models?
>
> AFAIK we still put things like: sysbus_init_irq(),
> memory_region_init_io() and sysbus_init_mmio() in the init function.
>
> I don't think we are at a stage yet to not use init functions.

Two-phase init is here to stay -- some things must be done in
init, some must be done in realize, and some can be done in
either. Some simple devices may find they can do everything
in only one function.

Must be done in init:
 * creating properties (for the cases where that is done "by hand"
   by calling object_property_add_*())
 * calling init on child objects which you want to pass through
   alias properties for

Must be done in realize:
 * anything that can fail such that we need to report the
   error and abandon creation of the device
 * anything which depends on the values of QOM properties that
   the caller might have set

We should probably sit down and write up some guidelines for
how we recommend dealing with the various things that could
be called in either function -- this is basically a code
style and consistency question.

thanks
-- PMM
