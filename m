Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5240094wrt;
        Tue, 2 Oct 2018 09:13:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61yy4OJzYVrCMNtFsUNpXdBs87d0C7fRlOh2IZ6gi7m5a9pvJhtFe4TyR83pDsU1+UmqK1n
X-Received: by 2002:ac8:5293:: with SMTP id s19-v6mr6236971qtn.336.1538496789756;
        Tue, 02 Oct 2018 09:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538496789; cv=none;
        d=google.com; s=arc-20160816;
        b=VGOhr71J+xZ6ijpiQV4TTzJg7C1Kjl/6hUyftCGZv4hGIHJ4gWqmMc4xmK/63dU4Zi
         eQdTIh5vidvKSUqKuTci9DYhOs+09HEkKYUymavl+25Qkp8Zl9OyG19rFVZluA7LwqC4
         zpitiAVglgyedQv3bIV+I43sIMtLaeA51LB6lv3RL8H/IUR/VL3x5CX2i0/Qx0wxY0w9
         0lgznxayWk9oQXjKbw0U/x4lw62CJZQOwrXMcAh2I+jAEea7StDYbcoImhOT9mxFst1B
         r36FTHDDQRgd52DV0SQPKpoeYgGcvCLwWIPRYnW5ctYI8BtI8RrTjlzcsvJD03SV5vKO
         BgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=K3CJeVedk2yNshFIgLMmDFWONCVGAOHB+JF/uuXJa+M=;
        b=KZt/WRsCAlwAdYYB4tOY+rq/9cQji9MdAgn7NdavHNDVFiUcH41Udiavofohs/dv3l
         nsImn/9NJni/Qj6FLZu+VXQV2LAGAf2q1F3UMumodl1FKzcjk7hKeo5axq1whI5kz5eu
         rtHyt6mI9GLQXWF2FOg2vNtvRRRdCAEqJJPYX9iPDmE5u/1e1HZ8D55CCX8HxQWy9fhZ
         QqZ+0mGXC/gElObF9DqYOcdxlkEOXXq6YZPdY7rjJ+wmYlh9aIx36o2JmLhw1Q2TrUpl
         7PPlbrFiyOD2Z/3a3gfGqCkmHKyvfhPcO6fKLYmm3Kc25zMkuHJTVBfozvVpHEaXB+4G
         ps7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wz4FuVGG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75-v6si2319838qkv.68.2018.10.02.09.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wz4FuVGG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7NIL-00050q-8P
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:13:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7NIC-00050e-9u
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:13:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7NIB-0000vp-72
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:13:00 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g7NIA-0000uv-UG
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:12:59 -0400
Received: by mail-ot1-x343.google.com with SMTP id c20-v6so2449161otl.6
	for <qemu-arm@nongnu.org>; Tue, 02 Oct 2018 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K3CJeVedk2yNshFIgLMmDFWONCVGAOHB+JF/uuXJa+M=;
	b=Wz4FuVGG3niMSJXCFYj5bs7/u8oVJ3v4srYXy9ztPiz9uvJmvYboSwmHFyILMund7f
	BP8RyDcYYF9Y4PEJTeE4o2CM81o14ENI8b24UoM/jWYubr/8EeuKVDZ8zhoC0aRM7l4Z
	ATYzYNrkjdkaOLcPqKJ0IPD16QF6GZR3BUkI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K3CJeVedk2yNshFIgLMmDFWONCVGAOHB+JF/uuXJa+M=;
	b=EnHvFBlZps18cEjWeqkpgrOYombnliqrG6rr6kMFgGLO7TXzpUT0ogoX4jD4qAwnnw
	co08k7kXzoyXcmStYDXw8c5kNtP3O96k3yq9lIKPdNdU92VzjRbt7/Qvg3O++Ybj3J/N
	hn3jXsGamtdyrBvzjAj02YC53GmNXJZtMXeYWnlGaJozk0oeXYoSHlDwCmaZYQCkJS5J
	4OOpNMlckPMPmK8jSZD4pa5eSFjpuTGB3CXJbTd0h4ztEAkHAV5hlUUKiA8jj8sTsFhT
	4fHy9j9zvSQ2hvVq2xzdgkHkyg92VapUAzJfd4XlPt7zvYD0sjJQ3QUvEd9fKWxSDdxO
	87SQ==
X-Gm-Message-State: ABuFfojLOne2RqGEESubad4zlMr2qmhQMf5LRYnj69ET+DGR9jGx3WKP
	IOevVBWYa2UCb5v850IExLfJljOzdhadsoPYLu/rSg==
X-Received: by 2002:a9d:554a:: with SMTP id
	h10-v6mr8937823oti.151.1538496777450; 
	Tue, 02 Oct 2018 09:12:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Tue, 2 Oct 2018 09:12:36 -0700 (PDT)
In-Reply-To: <f18e92fa-7b49-04b6-0adb-4f1a84668168@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-9-clg@kaod.org>
	<CAFEAcA8W0ixkfje4NSx-+kdw4rNh44JgNTu2OhDD_p91nHK7hw@mail.gmail.com>
	<f18e92fa-7b49-04b6-0adb-4f1a84668168@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 17:12:36 +0100
Message-ID: <CAFEAcA_injuKY7=fLvG7sj2p7Ffzx5tNQ4f3RxjsNk8Hy-rYMA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 08/11] aspeed/smc: add support for DMAs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VKfPsOdOkUA+

On 2 October 2018 at 16:48, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 10/2/18 12:56 PM, Peter Maydell wrote:
>> Rather than having the DMA device directly grab the system_memory
>> MR like this, it's better to have the device have a MemoryRegion
>> property, which the SoC sets with whatever the DMA device should
>> be able to see.
>
> ok. I see, but it seems I have a chicken & egg problem.
>
> The MemoryRegion I would liked to grab is the bmc->ram one in aspeed.c
> but it is initialized after the SoC is. I don't know how to lazy bind
> this region in the Aspeed SMC model using the Aspeed SoC model as a
> proxy to pass the region property through a link or/and alias.
>
> If I could find a way, the model would be much cleaner.

Usually what you want to pass is not the RAM region directly but
some container object (which contains the RAM region among
other things). This is often a container that you're passing
to the SoC anyway so it can put its devices in it.

(The direct answer to your chicken-and-egg problem is that you
can create a container before creating the SoC, pass that to
the SoC, then create the RAM afterwards and put it in the
container after. But that feels a bit like a workaround for
a less than ideal structure, somehow.)

thanks
-- PMM
