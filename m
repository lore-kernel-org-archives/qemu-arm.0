Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8449296wrt;
        Tue, 4 Dec 2018 11:17:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VPApNijY94Yoe5nzcdEZkg6epwubGgOdLs6y9syjAI5xrdALQ/ffJVgCrrryOaSbjYUCD1
X-Received: by 2002:aed:3881:: with SMTP id k1mr19843978qte.345.1543951024662;
        Tue, 04 Dec 2018 11:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543951024; cv=none;
        d=google.com; s=arc-20160816;
        b=05FyBQeeo8m8nP6NXFNRcOU8jA9bvuS4jONfmIOJiaHOxGAXoUQSk3QlocFsu3qk49
         aR2In8X9YCPFjBNfMXBd6DZD9OZOpPQIShQ9TQEJjyG/evzQBEMhaQ8VLwXZAqsU8LWp
         7ZVpw0rO3L+QnxZ9uS3G53TSLy9cu3eQ0PPTB8/cQuVpLGIGEAlqbIwYawAombaxQSxY
         XINhwo0xWHcg+ALTYj5ADbJ6CzGT0R/aSVxT2leeipKD9zFzElOVI2LImmFfLbP//ZN0
         Bl6ob/66C1e8Jv+JmOBZqUQVtZikvzNSkDFaY04HjbiHMa23G6fBtvgv0hEPAUYKkALH
         RHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JhobrS2FoHMQ+Sw7wEHvatmg8Ywnww0WwJfoDbWGPDc=;
        b=MnDUDxZe4o8WCJevdQwsFDjipDZDz++iVVDQmWIC6FSLhF/CfkxRJbYapYV5xHMDDW
         YqZI5lkUrobhyMgCzoOoRa//X5C/VCbgFj4KR6AQy+m/HbYW4AXKWinckztDPwgqwM2G
         49UppMA0wLAL57c7PK+eCteuzGe2Lv4r3NzimrF32Cz1xVeyH925DWvTztGJdkoUhPs1
         h9fYa+4JxRKsezHZK4cEwYAigYcVREHofR682Zbe7htLm1Dk01e4q0GNLqelkGplfMhp
         EfQUvx/FOdOlX+l7ryYW1Yb/7ONQgstzhE+6Gprozz8VTKKXzJ0V7dGDidoThM4PP6Wh
         lmAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=edUh3oxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20si6171352qvc.134.2018.12.04.11.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 11:17:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=edUh3oxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUGBs-0008BO-7E
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 14:17:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUGBg-0008B2-2S
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUGBf-0008JB-D3
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:16:51 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38006)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUGBf-0008Iw-6T
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:16:51 -0500
Received: by mail-oi1-x243.google.com with SMTP id a77so15282000oii.5
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 11:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JhobrS2FoHMQ+Sw7wEHvatmg8Ywnww0WwJfoDbWGPDc=;
	b=edUh3oxUyp8rR/1WR04JlYwOWPonzFgqDFrwd6doBdCYtsUFSWJDQoPDpZ/xNbjTXL
	A1h5q5uFswvsTbytRjlTlntOBt3j3fDHsPMCt4Y2UuTeMyKtAnVPhJ3fKqLpAAkUWmSc
	CIx5/8nj5NkAkUSOaITG69nPMPpNNCUbjNpqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JhobrS2FoHMQ+Sw7wEHvatmg8Ywnww0WwJfoDbWGPDc=;
	b=ZnYhZmu5M2shIIhfxFo4cZrYmWeJ/ckmUqYKqggT9pdRGvJkUOprvaYEamH6ecTZCL
	lV8Yw5zKEhl2NTuzDoRBcBpbWMaIsTdsuVDeY0keShmaM9pTDZcUuxifEer3yR+S/IXC
	m88S202ozbpbjRRee8eERFTYM3moEMzJ38Y2Zc1YdLZQX9ErZ+hcMciegFVZ0n6qFaNX
	qyOuiucUp3kEp/h89NFuhnEjbXczQv4t1KhXKaYdkdcT9oPh0OnGuaCBy8QR+jNIpH5L
	1/4jOo3VXRxSROw5C723393k0Dq7eUpureUwKm48OSLKf3DRfM7Ajt2JAB7WYpeh1s+G
	OofA==
X-Gm-Message-State: AA+aEWZ32Bg1EeiX3gpYZFlLCVjGytY0qtLi6zsAmi/1lAfQPZlYO4tU
	xKwk8MWatsUeqnGM5/qAwxkosrx+Lz1WrkS/02mlVA==
X-Received: by 2002:aca:b58b:: with SMTP id e133mr13133438oif.25.1543951010593;
	Tue, 04 Dec 2018 11:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
	<50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
	<20181204180607.GB18284@habkost.net>
	<CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
	<20181204190548.GH18284@habkost.net>
In-Reply-To: <20181204190548.GH18284@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Dec 2018 19:16:39 +0000
Message-ID: <CAFEAcA9M3akT7sF-kjCg41ucuUhv2PxKaCBmkN3eacvqvf_w9Q@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jw00ljfagLWx

On Tue, 4 Dec 2018 at 19:05, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Tue, Dec 04, 2018 at 06:24:19PM +0000, Peter Maydell wrote:
> > A cluster is a group of CPUs which are all identical and have
> > the same view of the rest of the system.

> With that definition in mind, why can't QEMU cluster CPUs
> automatically by looking at CPU models and address space objects?

That sounds like it is in theory feasible and in practice
quite tricky. You would have to look not just at the CPU
model name but also introspect all its properties for
ones which change features of the CPU and are set differently
on different CPUs (and I don't think there's any way to
automatically tell which properties are ones which make
the CPU different for which-cluster purposes and which aren't).
And if we automatically checked whether address space objects
were the same it would rule out implementing devices with
per-cpu banked memory mapped registers by mapping different
things into the AS for each CPU (though that's a hypothetical
at the moment -- I've thought about implementing stuff that
way but we tend to implement that sort of thing by looking
at current_cpu->cpu_index at the moment).

thanks
-- PMM
