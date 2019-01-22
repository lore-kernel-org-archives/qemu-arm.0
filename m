Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7046884wrt;
        Tue, 22 Jan 2019 02:15:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6NRyNouIHvlbOityx8YOmO/ddsiByGc3BnuoUnT/ft8Px9FfPbDyOOcLMdKUxJbZfChjES
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr2990172wmi.61.1548152138258;
        Tue, 22 Jan 2019 02:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548152138; cv=none;
        d=google.com; s=arc-20160816;
        b=kAyEmG5ctNJ1mkWNZKP424DIZCg8ARIHSsOgxQKt6fVfxtF5J8nFz1oK77l0R9boIq
         4muqyVB2OwVrndNpqB5cYFRZ5CjEzvuhpKdsP6XMT4Tnw72ZrocWBTOSc/xXPu2k5H5a
         dpscsnyi2QQnp6YQQBtTCNlxzDhmc9F1QPO7va8llLhWbvT2pCGCmlpXo4scj+9qRbXl
         42x5isiQ7pgMDwSFI+ocz4XuNlO4TQNSSkMwE8tbBNK76AQCbBYF6fEV5VNtBI1RlxvB
         gOq8mxK72JsgM4DeX10cvV8UGMjcRuKaZq0z+ZkQBSsMRNRWtqMhWqD4sGPor2ZrpfZC
         DtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=srOvF2wQniTiCAVmemG6GaOAq/AgGEF8mOesGOF8u3E=;
        b=y1/yNytVK/Foixi7+zxP6nCIXlWUYbZf6TuOx67glRpb9cptOy12LhkKUOUeewvZp9
         oly44asCmGQdAqSvor778B+QvD9sK5frstvF79rkH0Z9XcGX4E3RaiZt7ajqat34fvoD
         rNNB1Cwlr7EeErof54+XeahmAOPUs+2yH+sRhi58Xpf27rA8a9yg0gXiJQ1rjf8gzwVF
         6Mu+p8eAACwBvx1fteOfKutr26nJSe1ndnfMQHTd5mpM5zmH8mlKETIIwaaC0a9WM0HO
         5UgtEeg4XT3wPGi5dKLdy2H/VlsD5ZVA7Vi+Rv7LnbNWkwhmoinwBqyZebIAKGhBfG/8
         zT5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si66691034wrv.158.2019.01.22.02.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 02:15:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glt5l-00031u-6v
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 05:15:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glsaw-0002s6-9p
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 04:43:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glsau-0004tJ-Ak
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 04:43:46 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1glsaq-0004ni-Io
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 04:43:42 -0500
Received: by mail-wr1-f67.google.com with SMTP id p4so26500713wrt.7
	for <qemu-devel@nongnu.org>; Tue, 22 Jan 2019 01:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=srOvF2wQniTiCAVmemG6GaOAq/AgGEF8mOesGOF8u3E=;
	b=BtwkL28RrlMheENQQlIvBaeQlVR87trH/jNw/4aA57agUC3Mog9+9swMQX6ibJCZ3H
	+XugE+VHdTJyQc9OfimYpv53njPDaP4Xi92ax+B3bv5uQ6G4rnlT2mVR5F7bCU58yl6P
	MaDuN4Bs/UxsNwccuNPz1yLqi9yMkkSELY00WCm8RmCFLHchV46T3SYXMKyhg4IjihJj
	30EZh4QL+h1beX1jf98hdqug/bMLpUSn5clkm7RCj3X9Q5tJ83UsaWB8mGIwSkEhjAUu
	8M6DfI6dkp+oLx8ZH77vpOdQeuuRsrTZkMNatN/jGxOY06FKFKARPyS5bB6wr1IOfb1o
	NmrA==
X-Gm-Message-State: AJcUukfhwnPiTOhxhGEbxSHGwRf/9YjraVG0U8QVzP0QR3qhQkeCe1kF
	kecvm/ym5AWVMKiDlH7tcSHTVQ==
X-Received: by 2002:a5d:4acb:: with SMTP id y11mr2711378wrs.281.1548150216707; 
	Tue, 22 Jan 2019 01:43:36 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	s132sm34446299wmf.28.2019.01.22.01.43.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jan 2019 01:43:36 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190121184314.14311-1-peter.maydell@linaro.org>
	<383fd07d-9c2a-a7b2-5b88-f9a411c8b91a@redhat.com>
	<CAFEAcA9G7CuZ3wSO9YLs-OH4m1zQ7s73yWp8rwsDBSyUZokyGg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0941b5d5-b399-7306-6779-7c82e53e08c1@redhat.com>
Date: Tue, 22 Jan 2019 10:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9G7CuZ3wSO9YLs-OH4m1zQ7s73yWp8rwsDBSyUZokyGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH] xlnx-zynqmp: Don't create rpu-cluster if
 there are no RPUs
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VjogLZa9GcLo

On 1/22/19 10:28 AM, Peter Maydell wrote:
> On Mon, 21 Jan 2019 at 20:12, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Hi Peter,
>>
>> On 1/21/19 7:43 PM, Peter Maydell wrote:
>>> If we aren't going to create any RPUs, then don't create the
>>> rpu-cluster unit. This allows us to add an assertion to the
>>> cluster object that it contains at least one CPU, which helps
>>> to avoid bugs in creating clusters and putting CPUs in them.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> This is a preparatory patch that is necessary for the series
>>> "[PATCH v3 0/4] tcg: support heterogenous CPU clusters"
>>> (20190121152218.9592-1-peter.maydell@linaro.org)
>>> in order to avoid the xlnx-zcu102 board asserting if started with
>>> fewer than 5 CPUs.
>>>
>>>  hw/arm/xlnx-zynqmp.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>>> index 370b0e44a38..16cba433cb7 100644
>>> --- a/hw/arm/xlnx-zynqmp.c
>>> +++ b/hw/arm/xlnx-zynqmp.c
>>> @@ -178,6 +178,11 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>>>      int i;
>>>      int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
>>
>> Not related to this patch, but this check seems dangerous, i.e. using
>> "-smp 2" we get num_rpus=-2 which luckyly doesn't enter the for() loop.
>>
>>>
>>> +    if (num_rpus == 0) {
>>
>> With the current codebase, you'd have to check for "num_rpus <= 0", ...
> 
> Oops, nice catch.
> 
>> What about this instead?
>>
>> -- >8 --
>> @@ -451,10 +451,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev,
>> Error **errp)
>>                      "RPUs just use -smp 6.");
>>      }
>>
>> -    xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> -        return;
>> +    if (smp_cpus > XLNX_ZYNQMP_NUM_APU_CPUS) {
>> +        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
>> +        if (err) {
>> +            error_propagate(errp, err);
>> +            return;
>> +        }
>>      }
> 
> Yeah, that would work too. I think I would just go for
> using "if (num_rpus <= 0)" in the function, though.

OK, whichever patch you prefer, you can add:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Regards,

Phil.

> 
> thanks
> -- PMM
> 
