Received: by 10.223.150.237 with SMTP id u100csp3225071wrb;
        Mon, 6 Nov 2017 16:55:01 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Rs9hDiR61sXwrPHHQtfT6+3z9uc/8nQCDtXB/7lDMImGrzuJFwLaH1nt88mYVVdykzgecr
X-Received: by 10.37.207.74 with SMTP id f71mr10219475ybg.20.1510016101316;
        Mon, 06 Nov 2017 16:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510016101; cv=none;
        d=google.com; s=arc-20160816;
        b=OQw7t96/bA1qCg9KCwFrkHY3IdOQ6wHPpebVJ3ffbUi/DIufmKlQaVsmDyVhAIWxsP
         vTjMRILxh0T1SMvg5vRx9TnoliPVhVp4xgGzuVTkkFagmZrrKUxOFUS+6kN+7KGhrjc6
         FUneqBbA7Sz3mbVrojB4u7SPM+hS43MmGrhgJ2+NdTIgFkEFNsezPHnAboWEDspG1EHE
         /egUAEokvgrqU9/fP62dJG7lyzF79MlIo+adDlRYzMqiAOxb3X+nu+pnZgWzhR0q3jWE
         mvkSgTfuI//QrkhKUEmZjWGetXbwH9pBahTEVVTSYWsZjIAdbNutKS4/9GeIV2milTmU
         HkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=onPm15FTsoXxXoPNnmSK879F410zQEZiwxvQvwMkVws=;
        b=odMWMKRw1BhuMrYh+4zIMeCzxM6Hh/1hmUamZOow1JnYKt4ZUWqypw58BF46vugvAl
         pKUaFm2N/+Xi77wFQ6zsIl5aDySdfBzLvB1Q33+S7GRH+waR4qiyTNsnedHaqYOgN3kI
         AuLNq356gRibW5xFxpwkyRP8lsQK2OXV7frsHLMA6aquKLUZgOqWMkWKxoAjAGJ7EVqu
         2RKhDJhw0uw4qsHeZfm8+UfrrkeI1GjI2iejz/iqISJRz3qvTYPKAHZ7sT8k6Kaw33Lx
         RKJkP1HU8NJICOL0xb1F+EN8eLIiSV73q9CB0n88G7FdBj6jTKs8kGu6DpsaD0F6pAiC
         0bAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=up63JOwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si6425ybb.47.2017.11.06.16.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 16:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=up63JOwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBsAO-0003wY-O5
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 19:55:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBsAH-0003wI-5f
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 19:54:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBsAD-0001F0-7B
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 19:54:53 -0500
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:49331)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBsAD-0001EN-1L; Mon, 06 Nov 2017 19:54:49 -0500
Received: by mail-qt0-x22c.google.com with SMTP id k31so13341065qta.6;
	Mon, 06 Nov 2017 16:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=onPm15FTsoXxXoPNnmSK879F410zQEZiwxvQvwMkVws=;
	b=up63JOwXwIheORkAaXsRF5+KsS+p/ELWL3NrTfLnNQxkim4mSpVO2flCYjK39SVPcN
	laC8hb1NdWCJ4GVb6Xi7z9tUYpafp7FzMugAQgZ5fQN12Qx6lQ4i8uGuXusPkifa7ypc
	SsO99BcWGW7DzuLekBN+SNRG6X7fr4kRp0rn2YMIjOD64dc0t2vq6U3wEVdl+nQa5PKN
	spf4zlH4AaLYaOMqCVpHtZVgcM/XzLtPc9JgGr0JEQvuDNcfU0/Pk+uptoODDZQcUpLp
	3/NLptohh9XIvB29noMw7ko5VLfFrNS5hN8Dmt4JtZ0knRw07au1BaZjZCpTsipLSazC
	se4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=onPm15FTsoXxXoPNnmSK879F410zQEZiwxvQvwMkVws=;
	b=FqW87Bdg2TiHGR2H86Qo0+QNa1y0glAOKhmiWbPnjZE+kYuDwsuKYi6o1KeSV6c52P
	0+6OipCV4I2YEx7v4CNOd6Pi+5elrFvwc52I2M/qGa3m0Mz0/WncQzEp31CjwQSRzlbi
	j+M6S3vS/Vjlyk0pcHK19ULZeu/Q5uoUNWmGYWpDHhgL5gNAmYG4XaCwauds6GrQ6QKz
	lDU04zyfsV4cqv11r3YTAkg2j4b7+RufiNes4/6wy52fnSDTQD81RxeDCx1ApbKkPhcx
	oijFVhRVzb/X0udrueE+xxccRfSutayKGLDWT8i7CzpJjHBHdHPhzn1BAexiEwJVRfbs
	z6iA==
X-Gm-Message-State: AMCzsaVMclDCcmb0I/zgC29I1JtI9Te/XKnwKSE6UcuuFlXwRtAxzDnc
	7XVpB/FnwbQbvGqzwclEIcI=
X-Received: by 10.237.57.228 with SMTP id m91mr26262107qte.267.1510016088275; 
	Mon, 06 Nov 2017 16:54:48 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 42sm2013qty.85.2017.11.06.16.54.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 16:54:47 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Emilio G. Cota" <cota@braap.org>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106215454.GB2152@flamenco>
	<CAKmqyKOSOHdpzfu_WMPWo6Mh_kfmYhem0nR=BD3_hUws0tGEww@mail.gmail.com>
	<20171106232145.GA25246@flamenco>
	<CAKmqyKM20ibTxSFQ5FE_fzgOkcHfjXmrK36mpKswz=ZPwfMshA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3ff3c20e-fba9-2f77-5f4c-8ffe6ca0b669@amsat.org>
Date: Mon, 6 Nov 2017 21:54:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM20ibTxSFQ5FE_fzgOkcHfjXmrK36mpKswz=ZPwfMshA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Thomas Huth <thuth@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2P/u4jxENbFU

On 11/06/2017 08:33 PM, Alistair Francis wrote:
> On Mon, Nov 6, 2017 at 3:21 PM, Emilio G. Cota <cota@braap.org> wrote:
>> On Mon, Nov 06, 2017 at 14:32:35 -0800, Alistair Francis wrote:
>>> Sorry for the silence here, I noticed these were broken just before I
>>> went on holidays but didn't get a chance to fix anything.
>>>
>>> For the Xilinx case I was thinking of patching the machine code to
>>> sanely follow the -smp option.
>>>
>>> -smp 1 -> Only create 1 A53
>>> -smp 4 -> Create 4 A53s
>>> -smp 6 -> Create all the CPUs
>>>
>>> I see a lot of advantages in not forcing the smallest number of CPUs
>>> to be 4 unless we really have to.
>>>
>>> I do see a nice advantage in being able to set the default smp option
>>> to something not 1 so the default closely matches hardware, but users
>>> can override that if they want to.
>>>
>>> So for the patch below I like the default_cpus option, but for Xilinx
>>> at least I would like to patch the logic to follow the -smp option
>>> instead of force a minimum.
>>
>> Agreed, honouring -smp would be the right fix.
>> Just note that since this is a regression we need the fix to
>> be in for 2.11.

Can we revert some patches to avoid the 2.11 regression and take time to
see how to fix this correctly instead?

The -smp help is:

-smp
[cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]

How would we start a Cortex-R52?

default would be: -smp cores=4,lockstep
so we can disable DCLS with: -smp cores=8

having Lockstep not being 2N cores but aliased as N, the only interest
being injecting fault (or actually 2 cores, but 1 stopped, the guest not
aware of that).

The ZynqMP indeed has 6 CPUs, why not add apu/rpu options for ARM?

4+2=6 cores:
-smp apus=4,rpus=2

4+1=5 cores
-smp apus=4,rpus=2:lockstep

There will always be 6 cores to this ZynqMP, why want to have less than
4 APUs? I'd rather have 4 APUs, all of them can be offlined /
hotplugged, but they need to be instantiated and machine-initialized.

> Ok, I can spin up a patch for the Xilinx boards in the next day (maybe 2)
> 
>>
>> I just took a look at the non-Xilinx boards. It seems simple enough to
>> substitute the hard-coded value for smp_cpus, but yet again
>> I see "Property" structs that I'm not sure what to do with.
>> For instance, bcm2836.c:152:
>>
>> static Property bcm2836_props[] = {
>>     DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus, BCM2836_NCPUS),
>>     DEFINE_PROP_END_OF_LIST()
>> };
>>
>> What is the purpose here? To enable/disable CPUs with -global args,
>> just like it's done for the Xilinx boards? Shouldn't we just use
>> -smp for that?
> 
> Hmm...
> 
>>
>> Also, note that I don't have a way to test these boards, which
>> explains why I'm reluctant to change board code. But of
>> course if board maintainers step in, I'm all for it :-)
> 
> Yeah, I see.
> 
> What about if we set default_cpus to the -smp option that is expected.
> Then on some of the older boards (like the bcm2836) we print a warning
> in the machine init() if the -smp option doesn't match that?
> 
> That way the default args work, we allow users to specify a overwrite
> but we warn them that it might not work and it ensures all boards
> follow a similar flow.
> 
> Then if we can test the boards and know that -smp 1 works we can
> remove the warning.
> 
> Thanks,
> Alistair
> 
>>
>> Thanks,
>>
>>                 Emilio
>>
> 
