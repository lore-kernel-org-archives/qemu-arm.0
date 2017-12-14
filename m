Received: by 10.223.159.74 with SMTP id f10csp6358740wrg;
        Thu, 14 Dec 2017 06:09:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBos8R+2ZVUEZ7JAaARDX1ojqcnjGPmhRdJOAtvqpvir6/1idysYcKFdd5AjFSax/L1vW6rUf
X-Received: by 10.37.42.76 with SMTP id q73mr4666671ybq.477.1513260580290;
        Thu, 14 Dec 2017 06:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513260580; cv=none;
        d=google.com; s=arc-20160816;
        b=CpUiqtlNVICHkdlQu7Ljso0lPhBDr04uhJu6gUabFIbOkghliwGRfl9DIAlgFSxtpy
         m7PA6PIwnCwnR2aqjSNXqDgtkBHMGt3HkpbmzIzwJ1qtbpzG5vTDA29j4SPZJhPnCUtF
         fRrtMFdrzFuY3/xcaWG4bSH144lbi8s0xGhKSzWDF0ybyCjO/AawUrlE+93NbYEJKcIr
         J2Z4qx+4azPw1YRpMyyAqJn6+m11/HXx1Gf6Lv7b2c3382z0WWQNJlikHMRN+HSiGgaB
         IBcicm1lTiAfpxaCB9seMIu5sn+g0zQ8TQqb4MkoPlHSBSmL85PyXZ99lxN4VENiSmm/
         no5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=csb3DADvEgrFlEivGe67JonypgdiQpg1rN53m1KOx7w=;
        b=XA0aa9Oe/a3GmoSsctKlglQ216vzSejaZ3JtHPud7w3OkVqNyRAy9wVnjD8jkEIB7F
         HIo97VKJs7UHiYi34Q9f7d1nRaZrGh1Cy71CiuRfFB21Xk/uIt+LWmXozseTXyqm1iFM
         f+rieOk/thZ4xnfOIaspMA4ax7PDEtwitn9xY9s09Wj8J0fXRFb431hFRvyZxju3peAV
         hxAGWt74pXH0Sa5syQfMWojKxaXj1cn1CvAPWN36xwfNR8BzbiAbh/+QB6QMXeL3Alie
         EtBH1lD6ZCgvwaX63kH8HQsLWaIhq+qmudCK1lWxP9mEbCvNPy4mik/78IOGgYpEjh7w
         S1qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uz4lrzbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i141si852607ywe.3.2017.12.14.06.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uz4lrzbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUCh-0000Ao-RE
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:09:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUCW-00008l-4m
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:09:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUCV-0005Hk-7Y
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:09:28 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUCV-0005Gz-1D; Thu, 14 Dec 2017 09:09:27 -0500
Received: by mail-qt0-x242.google.com with SMTP id e2so8099169qti.0;
	Thu, 14 Dec 2017 06:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=csb3DADvEgrFlEivGe67JonypgdiQpg1rN53m1KOx7w=;
	b=uz4lrzbq+/K+COuGg0Cnq17c4zpAJXLdxDbcN9qMHUKv/6juDQTPxddA6n+qR6vpQk
	r/05NHZrc8uYzBZ1eKVGdECU5r5vSaxW3fwiyfkaBGyrnWRtC1KTLaWK7mHkdX5sSaA1
	2PTZ/vwRdU6cxX6lL9/iC7NtcjO0WVC6ZpeZkNIu4MXsc8tG5Rn+OTVQFPscAGbs9CBC
	Ce9AfUc/5fHAccUaJVVOWBDhuyvR7aXS1d/jVu61pUlXljCXH2QyE5pWJAC+YvAadVnc
	vWXerQj960Umg5fDpHWD3jlIVHZ7UTw+X3QOySxjGlU0aLtiS0SLOEYZlnRwVeuyDR77
	BM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=csb3DADvEgrFlEivGe67JonypgdiQpg1rN53m1KOx7w=;
	b=lWIP9MNgns7/c/GfF7vPm1wcnb/OC3iQAFkS8ZDxSCkvz9QXMdeW7JGhnjc1BzQjBy
	qlvubzkjRe3fSPN6CcJTOr7/qdKFsRe253LebOqhGu2aCll5d5I15ysLw6qzrrRMXuzS
	6sd7ZkL8WvIzgdvtN7/bHBFXshxs55EKZ7Hiwutq3P2wW9WBTEyNUOdeb6Vfm4fcH7lk
	OVxYpuow/zShhomf00uDAFnH+pQP0+b7W0fVM1Ajduwtrr0+2qR8SRH4PLKGhwzMQPyU
	L5pGhnGmylUi/qwJEI17dN8oM5flh6t38vvWzGlBfUfBXGlKo1mYX/zAxUMm+MQc4lVg
	i3UA==
X-Gm-Message-State: AKGB3mIYugsK8eDGl2PTaBjCE0KoTHRF4Twu+gtp2jrnf2odb9EIh/Gt
	LddO6ZwrPFbYJfDSV53iK4RDHxMLFVF3kJe7iiU=
X-Received: by 10.200.35.182 with SMTP id q51mr15726257qtq.302.1513260565905; 
	Thu, 14 Dec 2017 06:09:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Thu, 14 Dec 2017 06:09:25 -0800 (PST)
In-Reply-To: <CAFEAcA-gEjU+rBWSL8V4d520DOVheZoJZ76p5=9hmkXk3NqeOw@mail.gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<CAFEAcA-gEjU+rBWSL8V4d520DOVheZoJZ76p5=9hmkXk3NqeOw@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 14 Dec 2017 06:09:25 -0800
Message-ID: <CAHQ1cqHqhNKVW_vV5G8wU_d_Cu0+9ThpkKdXQ4-LqEXjL0sc9A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 00/13] i.MX FEC and SD changes
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ZW9uDxyZUGQ

On Tue, Dec 12, 2017 at 9:40 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 11 December 2017 at 21:29, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Hi everyone,
>>
>> This patchset is a spin-off from original i.MX7 support submission
>> found here [1], containing all of the patchest that are more or less
>> agreed upon and are ready (hopefully!) for inclusion.
>>
>> Changes since [1]:
>>
>>         - Rx buffer in FEC was moved from stack to heap to allow
>>           worry-free expansion to 16K limit.
>>
>>         - Added more comments explaining rather convoluted bit-moving
>>           in eSHDC emuation code
>>
>>         - Triple Tx ring DMA "VMState" code was changed to follow
>>           Peter's recommendations (avoiding the need to incrememnt the
>>           version_id)
>>
>>         - FSL_IMX25_FEC_SIZE is used as a size of FEC's register file
>>
>>         - Removed leftover code from "imx_fec: Change queue flushing
>>           heuristics"
>>
>> [1] https://lists.gnu.org/archive/html/qemu-arm/2017-11/msg00045.html
>
> Hi; thanks for sending this set separately. Patch 4 ("Move Tx frame buffer
> away from the stack") seems to have got lost -- it isn't in the mailing
> list archives or my mailbox. Could you try resending that one?
>

My bad, I forgot to add correct Cc tags to that one. I am a bit
surprised it's not in the archive since it did have correct To: info,
but it doesn't matter. I'll make sure this patch is sent out in v2.

> Incidentally we should use the new i.MX SDHCI controller in the
> imx6: coincidentally somebody ran into this bug recently:
> https://stackoverflow.com/questions/47538951/qemu-freescale-i-mx6-duallite-sabre-root-filesystem-does-not-mount/47552596
>
> I'll retest that this patchset works with my imx6 image, and
> send a patch to sit on top of it to switch imx6 over to TYPE_IMX_USDHC.
>

Out of curiosity, I gave emulating SD on i.MX6 a try and it mostly
worked (there were other unrelated to SD problems).  I'll include what
I came up with and we can go from there.

Thanks,
Andrey Smirnov
