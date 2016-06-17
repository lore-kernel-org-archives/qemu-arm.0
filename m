Received: by 10.25.21.96 with SMTP id l93csp328303lfi;
        Fri, 17 Jun 2016 08:44:40 -0700 (PDT)
X-Received: by 10.237.53.115 with SMTP id b48mr2963713qte.67.1466178280470;
        Fri, 17 Jun 2016 08:44:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n24si31889496qki.131.2016.06.17.08.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 08:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDvwl-00042v-TC
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 11:44:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDv5t-0005yP-7O
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 10:50:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDv5r-0008Qo-7l
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 10:50:00 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDv5q-0008Qe-O8
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 10:49:59 -0400
Received: by mail-vk0-x232.google.com with SMTP id t129so118858083vka.1
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BDT7IU5bKZmfLg3P7axXKMaPUtzWCQwUlTTmPSIV86g=;
	b=DPlT0B5+s+jBXy6V1NRm64nnIEc83/KqwlBV5uMpcsY2ML23GLSlho82rBoiTJ8aoZ
	qjNmDLjc5KXKU0CC4yB/EfpZD3FxeAcAuk85vNaQ9FV0eGzcPBgeJTOT1ITqgKRCgqjq
	Je2cjLK1jc3rmW4vtik9bnEKPyJ35MVwaRAlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BDT7IU5bKZmfLg3P7axXKMaPUtzWCQwUlTTmPSIV86g=;
	b=PpEnXDjFBaiR7eGfFjzc8e57zSKnSHM4CPQCwg/UWRm5LbCajNnxcQw+4WM4f16wJr
	fwocjK8wzwhhi83vIX5rKn9b3D4rFcGGHFvPdkKPfINcBIgSTc9oQzIjPgt1jVWacRpe
	BWpG8/1PAdeyFg6PECJlTBrj1bBAS0yjTzRBe1jYJ7QXCThel5pMqZ6TwpFSSw/EJ9gs
	9AhoeDUuMAq2YxxaIPPr/3EaTIyBmzJ7x66HaRIMCIY6tWM25GLoGhPsmgz5gyU++z56
	qttQ6EjYTFZrSkEtmjPhYX3P9I4m+pc5ItoBl0emsvxSW1yWzVRrNzACV6OBfGJqGaVx
	kS0w==
X-Gm-Message-State: ALyK8tIwz0IcsPC5cnrgMIK3ze7N3vqgZdJB0tv+3K5fjWwO/K2/c30i/u7OGcEq/kLPm9kr3TaDi40HZ6gC/BEV
X-Received: by 10.31.228.133 with SMTP id b127mr1277154vkh.90.1466174998090;
	Fri, 17 Jun 2016 07:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 17 Jun 2016 07:49:38 -0700 (PDT)
In-Reply-To: <CAFEAcA-G4rL8o-6gmQvXHMVUrvH9utZOQuFhDO=J9imtzophjA@mail.gmail.com>
References: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
	<20160526144629.GH28935@redhat.com>
	<CAFEAcA-G4rL8o-6gmQvXHMVUrvH9utZOQuFhDO=J9imtzophjA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jun 2016 15:49:38 +0100
Message-ID: <CAFEAcA8QmK+_cHfPuk90poixxbqSJpb+OuoXg-3OnXcfRYKQUg@mail.gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: Reject
 gic-version=host for non-KVM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4DU00+DZbzqE

On 26 May 2016 at 15:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 May 2016 at 15:46, Richard W.M. Jones <rjones@redhat.com> wrote:
>> The problem with this is if I'm using TCG fallback mode, how
>> can I specify the right gic-version?  ie:
>>
>>   -M virt,gic-version=host,accel=kvm:tcg
>>
>> Only qemu knows if KVM is going to be enabled.
>>
>> The same problem happens with '-cpu host' BTW.  I really want a "make
>> it work" option, as I've said on several previous occasions on this
>> list eg:
>> https://lists.nongnu.org/archive/html/qemu-devel/2014-08/msg04173.html
>
> I agree that we really need to do better here (thinking about
> the problem is on my todo list but generally other more pressing
> issues intervene). I'd welcome suggestions for semantics which
> (a) do what you want (b) are reasonably in line with what we do
> on other host architectures (c) don't break existing command lines.
> (I think those are the main requirements.)

...so does anybody have any concrete suggestions? We could fix
this for 2.7 but we're starting to run low on time for that.

thanks
-- PMM
