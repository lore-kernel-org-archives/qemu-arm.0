Received: by 10.25.21.156 with SMTP id 28csp2503195lfv;
        Mon, 1 Aug 2016 01:14:02 -0700 (PDT)
X-Received: by 10.237.45.135 with SMTP id i7mr89924187qtd.30.1470039242632;
        Mon, 01 Aug 2016 01:14:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4si19334087qkf.158.2016.08.01.01.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 01:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bU8MM-0006or-2W
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 04:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bU8MF-0006nK-WE
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 04:13:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bU8ME-00083Z-Nx
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 04:13:55 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:36406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bU8ME-00083Q-4N
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 04:13:54 -0400
Received: by mail-ua0-x230.google.com with SMTP id j59so100996420uaj.3
	for <qemu-arm@nongnu.org>; Mon, 01 Aug 2016 01:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FdBbSTsG7sQHzOCWFcx19PcpJGPTJ0r6VVoS9SFT1UU=;
	b=Ki4Wxyi0X7nNDcRKEoT8VI4zs+J2QCq2Dk1Q+sjwkcFDXv+tI19FerkHrtfSmrhSjM
	i+X3adnFP5/URmPNFcQ4WetMd9Cfm/lZWzrXQGbzTfz9GTDnJqE271V1Q3g8ThVg+yCA
	pYwU5naeBYbsyHfl03N/RcyclL9cyQahwvyT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FdBbSTsG7sQHzOCWFcx19PcpJGPTJ0r6VVoS9SFT1UU=;
	b=d2cJSF+d2mfmvqHwW5EM6ct1Qahy9s723/O8vwh6MKpCmYMFTcSpRHz8uoHuWt/aua
	VTVitX/LzVrFu1Ce1hGh1LxvQ9qzCWGRKLPB3VCRj76R0rIc/Ybb4Jw9qpXpKUn8xdJn
	fhn+x4JeiOYjjAIZpNEBQA1aQ4cdb8NULsCg0fz8JPD1mazRAR7kaQTJSoVBdg+DlaSx
	Xd+FBmsMYqp7eE7zrPte26TnDoQNH9TKz241hFvIyn1kyXysRuMwsgaxstKbLHNDCy22
	OfSZ/bxkXu9Hxhm/RUpRKWstsZlJhHcoTXku8I8gzJCnG/k5nJQqMGuE4S100gUQwA6S
	lnQA==
X-Gm-Message-State: AEkoouuPV6qvMBRm1mlZMksA29asSyiDcKARBZSFRd0xTHFre+9/UuGrTrgBX6EvChdDYA4r/j2guJc4RzabDHN8
X-Received: by 10.176.0.208 with SMTP id 74mr26156041uaj.64.1470039233699;
	Mon, 01 Aug 2016 01:13:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 1 Aug 2016 01:13:34 -0700 (PDT)
In-Reply-To: <20160801094607.057cef2f@nial.brq.redhat.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA_5jngVxajJxdJ0krz0inrkdjTNYYZ+5SNGOipoQo35ZA@mail.gmail.com>
	<79b91f02b26441be993e372cef44002d@nmail01.hynixad.com>
	<20160801094607.057cef2f@nial.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2016 09:13:34 +0100
Message-ID: <CAFEAcA_6TQym4k3wiFEiAwwErJF0NDyqE8gDacfWK+n-rTsQyg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [RFC PATCH 1/3] hw/arm/virt: add hotplug memory
 support
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>,
	"kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rH1cZRHHv8Q+

On 1 August 2016 at 08:46, Igor Mammedov <imammedo@redhat.com> wrote:
> On Mon, 1 Aug 2016 00:35:35 +0000
> "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com> wrote:

>> > > +/* 1GB alignment for hotplug memory region */
>> > > +#define ARCH_VIRT_HOTPLUG_MEM_ALIGN (1ULL << 30)
>> >
>> > Where does the 1GB alignment come from? Why do we need 1GB
>> > alignment for the base but only 1KB alignment for the size?
>>
>> The alignment value of hotplug_memory.base referred from i386 pc.c and ppc spapr.c.
>> Could you suggest a proper range for this?

> Base alignment comes from max supported hugepage size,

Max hugepage size for any host? (if so, should be defined
in a common header somewhere)
Max hugepage size for ARM hosts? (if so, why is TCG
different from KVM?, and should still be in a common
header somewhere)

> while
> size alignment should depend on backend's page size

Which page size do you have in mind here? TARGET_PAGE_SIZE
is often not the right answer, since it doesn't
correspond either to the actual page size being used
by the host kernel or to the actual page size used
by the guest kernel...

thanks
-- PMM
