Received: by 10.223.150.237 with SMTP id u100csp3244009wrb;
        Mon, 6 Nov 2017 17:21:02 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QBnAIbPBIg9Nm1aO786Jh29unAkVsaVreVF45tqCaMHtbQZZDu+mEfT6UAQOht/fV3Qg2P
X-Received: by 10.13.254.194 with SMTP id o185mr10694693ywf.355.1510017662246;
        Mon, 06 Nov 2017 17:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510017662; cv=none;
        d=google.com; s=arc-20160816;
        b=rlQsi3sY+fHoQNk79OpILWSjb6v95B8I8nrzKZF7xfm4CzwBNFBc5aQTpLSrd97v4K
         Vl92ZhF44gdMi9+z8BXQKfOAhKM1Q1PcxrAJIAm/Jnsp+LzggcYHajPlX+vFy+kQfVv5
         2YxkbofXXQHUqPycurSHEBZQBWtBaiTlHDC+IRx1fKLAFzQMz6LSADAsu2RAIbouAtdj
         Pqeuple6kfl5GOtNKMdzVGHf1FZ2bS9uJO+j7Tz+YmcTClBv2QSSNpeMIrFAv7tTMF1i
         QX1yHUcSv3/yDehC2UI729I5V5uMfasF7eaBjFX4XdOQhy3YSTCxf6SKTdugo4WZWISO
         QfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=u9eEAiCstQ4LBheNmNJWxHkleWzOHuVoVoNsD1CZXC4=;
        b=Z1JXQHTitTPleVu7NjMClXYoo0YO9F/q1VS3UFbs+lDUuIPK6J7GmcAbKjS7LGFtc4
         hRhDLKNbuT3z5PcWGqFxmxRhfg4w8w+9XyWbBszTkQImLLQgQD8mSKSVWNuU5JTCioN1
         nz4biS5OdguobAr2AYi+3yEwrftLj2Iv3dfQZcu/wGztq9WwtI4F+s25q8VZ/a96vFPx
         BUn+RyXWSoxrLCxmZCUjaFka9UsRGZBzF/Dl7qM/sdPqQ2ItX2yBd+3/FexN3HTlHBmF
         mekzVF7UWUBsnaQ3iy7MCmj7siBPdKsxhM8q4qSNzVnuzNm99f7OvqRcqGyYUcvEj2Y9
         TQEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nqz4qgD0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si10335ywa.514.2017.11.06.17.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 17:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nqz4qgD0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBsZZ-0005oi-NQ
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 20:21:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eBsYb-0005Rg-3b
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 20:20:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eBsYZ-00079d-Lz
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 20:20:01 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:48380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eBsYZ-00079C-CR; Mon, 06 Nov 2017 20:19:59 -0500
Received: by mail-wm0-x22a.google.com with SMTP id p75so566777wmg.3;
	Mon, 06 Nov 2017 17:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=u9eEAiCstQ4LBheNmNJWxHkleWzOHuVoVoNsD1CZXC4=;
	b=nqz4qgD0FFWfpc4NVGUHXKVaeJrR4qHQNuYbsYZ+/uwAONBYtb0qJ+GQS6uImLSQwF
	gnCMNdtN/SVBA/aZkHu/UTWOrblt5gR/dudFgSTYcUmWCr7WODTJoqd3OtqPfEB7p+8F
	P4bOEdn74p6HotWWnx3kcTEe3pLavUFegFVmGA6rqy8Ntiy5v0wGriCmhW0i4chDt4ux
	3E5x+Q3GIvGstPf+dUXQ4t+wzF337inItN+/OvRK0zULcQGF6Dso4JcMPwcdS9Kcv0Ux
	xRbi8awBO2cuF7h20YuhXSWLwXvPrTwiSt8po41JHdaptaymE8LrVPqBuUw+BvKTb/S4
	X6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=u9eEAiCstQ4LBheNmNJWxHkleWzOHuVoVoNsD1CZXC4=;
	b=g0cEL69VZFnwEb/bGw+ZugWSMz6+4+DWYHNIu0Oe/aKCzP2E4mgMdstidpnKSkYxkK
	tZ1s1ukT44/Uy6ZfY5kWzsH6BfT/rFm5E2NRfAI59ehgYTDJea3Z5UjWbfe+totzM1WN
	iuF7UDi2wKV5zyFUZSvkktznIyqnZFCuKTU+nmTGcuEsY58Jvg73CJ9vKF4In2jdTE8x
	eiMRs8mktOlqoyIuao6MzqAYm2UReCBwIIamtDldSyvlyNOzfD5p+WgIzI6IARZdw9Hx
	eo1US+SmHqaLi9BYV5HvsZLkLr5TdipPaV/KOF1eZl0dJRI2rsq2ZFShqXHcq+fDMgGP
	4Bdg==
X-Gm-Message-State: AJaThX5rYFXx+WzqNlJDcqxocOL3JyHifCV1cioYcePpcsKb2AOrhOhx
	t1oBlS/8MwGyO6XNqNNiB1TLXtV0jl+fjhCnQR0=
X-Received: by 10.28.145.13 with SMTP id t13mr55809wmd.40.1510017598226; Mon,
	06 Nov 2017 17:19:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Mon, 6 Nov 2017 17:19:27 -0800 (PST)
In-Reply-To: <3ff3c20e-fba9-2f77-5f4c-8ffe6ca0b669@amsat.org>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106215454.GB2152@flamenco>
	<CAKmqyKOSOHdpzfu_WMPWo6Mh_kfmYhem0nR=BD3_hUws0tGEww@mail.gmail.com>
	<20171106232145.GA25246@flamenco>
	<CAKmqyKM20ibTxSFQ5FE_fzgOkcHfjXmrK36mpKswz=ZPwfMshA@mail.gmail.com>
	<3ff3c20e-fba9-2f77-5f4c-8ffe6ca0b669@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 6 Nov 2017 17:19:27 -0800
X-Google-Sender-Auth: OdxCt6c7vHBmJ3IpvYmZdGk7Kbk
Message-ID: <CAKmqyKPYuxTEuR+xKjiPeMBwHyd78yBxXHhSQjxHgGfJ+2Wj+g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2KpNzcBUVxEv

On Mon, Nov 6, 2017 at 4:54 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 11/06/2017 08:33 PM, Alistair Francis wrote:
>> On Mon, Nov 6, 2017 at 3:21 PM, Emilio G. Cota <cota@braap.org> wrote:
>>> On Mon, Nov 06, 2017 at 14:32:35 -0800, Alistair Francis wrote:
>>>> Sorry for the silence here, I noticed these were broken just before I
>>>> went on holidays but didn't get a chance to fix anything.
>>>>
>>>> For the Xilinx case I was thinking of patching the machine code to
>>>> sanely follow the -smp option.
>>>>
>>>> -smp 1 -> Only create 1 A53
>>>> -smp 4 -> Create 4 A53s
>>>> -smp 6 -> Create all the CPUs
>>>>
>>>> I see a lot of advantages in not forcing the smallest number of CPUs
>>>> to be 4 unless we really have to.
>>>>
>>>> I do see a nice advantage in being able to set the default smp option
>>>> to something not 1 so the default closely matches hardware, but users
>>>> can override that if they want to.
>>>>
>>>> So for the patch below I like the default_cpus option, but for Xilinx
>>>> at least I would like to patch the logic to follow the -smp option
>>>> instead of force a minimum.
>>>
>>> Agreed, honouring -smp would be the right fix.
>>> Just note that since this is a regression we need the fix to
>>> be in for 2.11.
>
> Can we revert some patches to avoid the 2.11 regression and take time to
> see how to fix this correctly instead?
>
> The -smp help is:
>
> -smp
> [cpus=3D]n[,maxcpus=3Dcpus][,cores=3Dcores][,threads=3Dthreads][,sockets=
=3Dsockets]
>
> How would we start a Cortex-R52?

I don't think it's unreasonable for the order to be A53s then R5s.

So once you have all 4 A53s any other CPUs you add to the -smp option
add the R5s.

>
> default would be: -smp cores=3D4,lockstep
> so we can disable DCLS with: -smp cores=3D8
>
> having Lockstep not being 2N cores but aliased as N, the only interest
> being injecting fault (or actually 2 cores, but 1 stopped, the guest not
> aware of that).

We never model lockstep in QEMU, even in the Xilinx fork. We just
disable one of the CPUs for lockstep (and fuz some of the other
logic).

>
> The ZynqMP indeed has 6 CPUs, why not add apu/rpu options for ARM?
>
> 4+2=3D6 cores:
> -smp apus=3D4,rpus=3D2
>
> 4+1=3D5 cores
> -smp apus=3D4,rpus=3D2:lockstep

This results in a different command line interface for this machine,
which I think is confusing and unnecessary.

>
> There will always be 6 cores to this ZynqMP, why want to have less than
> 4 APUs? I'd rather have 4 APUs, all of them can be offlined /
> hotplugged, but they need to be instantiated and machine-initialized.

There are lots of reasons to not have all 6 CPUs.

First of all adding the R5s creates issues (GDB debugging being the
worst offender) that most of the time people don't want when they
aren't using the R5s.

Secondly there are a lot of uses where one a single CPU is running. We
for example have baremetal test binaries that only run on a single
CPU. We can spin up a large number of QEMU instances to multi-thread
running different tests. We don't need the over head of 6 CPUs just to
run a single A53 test. It's much easier and quicker for us to run a
single CPU instance of QEMU.

Thanks,
Alistair

>
>> Ok, I can spin up a patch for the Xilinx boards in the next day (maybe 2=
)
>>
>>>
>>> I just took a look at the non-Xilinx boards. It seems simple enough to
>>> substitute the hard-coded value for smp_cpus, but yet again
>>> I see "Property" structs that I'm not sure what to do with.
>>> For instance, bcm2836.c:152:
>>>
>>> static Property bcm2836_props[] =3D {
>>>     DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus, BCM2=
836_NCPUS),
>>>     DEFINE_PROP_END_OF_LIST()
>>> };
>>>
>>> What is the purpose here? To enable/disable CPUs with -global args,
>>> just like it's done for the Xilinx boards? Shouldn't we just use
>>> -smp for that?
>>
>> Hmm...
>>
>>>
>>> Also, note that I don't have a way to test these boards, which
>>> explains why I'm reluctant to change board code. But of
>>> course if board maintainers step in, I'm all for it :-)
>>
>> Yeah, I see.
>>
>> What about if we set default_cpus to the -smp option that is expected.
>> Then on some of the older boards (like the bcm2836) we print a warning
>> in the machine init() if the -smp option doesn't match that?
>>
>> That way the default args work, we allow users to specify a overwrite
>> but we warn them that it might not work and it ensures all boards
>> follow a similar flow.
>>
>> Then if we can test the boards and know that -smp 1 works we can
>> remove the warning.
>>
>> Thanks,
>> Alistair
>>
>>>
>>> Thanks,
>>>
>>>                 Emilio
>>>
>>
>
