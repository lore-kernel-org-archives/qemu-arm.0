Received: by 10.28.71.27 with SMTP id u27csp845476wma;
        Fri, 26 Jan 2018 07:44:30 -0800 (PST)
X-Google-Smtp-Source: AH8x224zbO+C8GPOPczerdf++08wHlLwRXx5jBL4GxjPXfRzljL+ShJi7RI8D8yzfOauLHBJd4WY
X-Received: by 10.129.129.6 with SMTP id r6mr11781012ywf.195.1516981470145;
        Fri, 26 Jan 2018 07:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516981470; cv=none;
        d=google.com; s=arc-20160816;
        b=MSVzLRWqDAd4Kb/arvXanC3fdw6Q90O8HpSEoMHO0MV5Q86RowgwmUYpB6snweCJPY
         moVDhdxMpKwRssOAV1ucgDz+HASn1EFbPfgjCUjqZ3aIdpEfukoATR84xnRojmGj+9mF
         Ad/hRywE00ekNL5ninI9HG/j9/WCvrv96flIC/uCNp6npAL7jQ1hGPNii7MTM3NBnRpM
         PBWRRhEIwScksw5beKBVkPXuRkMsKVt6enyoRbV5N2EXw2E3f638c5yNzkNjLKp21MRR
         TJsmD/eRTBr+4cpG5niYNtdfHH6hIjLnC3Kb9YklzQNKhkYyPBT444gHNejC0Ud9HdqG
         D5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=oYnyk63wV/NCvf6dK1L6y0OETn87MAVgYT5gZDuNRtU=;
        b=sNGHvv0ZnoWyfdeGHsoeU3aY7vrOGEcejnAJH+Wv93jC0CJF3ju6KFIFHTmmVkcYyP
         bwgtaAMZpSkrMCuspocvWNK/s0sEJxvCe6qmlVQXzs4ztMZs5h9Ui8LEyCR/56NOcxMV
         8ffH6ltVjvJIb8g+FVbDFyI7oQDb1ABEspsyz7QthoIlncTOvSkVqY0Vp3XmxBCUtuo6
         VnAy1EApIFbuGOwTYUPRVjAsQlvO6K7GBs1fSyrc0R7BGQFcVMTRaBapR30L5YszNi7B
         +7sNYzRW11KZ+i9b14vSa3E8lYxlywzmsiFCDBxINOORa84npIw9yh1EgW0AF3pwaFsZ
         x6nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BP6WhaRw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l28si959168ywh.414.2018.01.26.07.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 07:44:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BP6WhaRw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef6B3-0001EJ-It
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 10:44:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef6Ar-0001Co-G8
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 10:44:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef6Aq-0000kX-Jj
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 10:44:17 -0500
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:37005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef6Ak-0000is-Jy; Fri, 26 Jan 2018 10:44:10 -0500
Received: by mail-vk0-x243.google.com with SMTP id g83so529224vki.4;
	Fri, 26 Jan 2018 07:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oYnyk63wV/NCvf6dK1L6y0OETn87MAVgYT5gZDuNRtU=;
	b=BP6WhaRwPejmFSTlN9KTT6pAfsQE4Uj60pNfMhJn+C4FvCT0AjGrS77WWCMVT6k6W1
	Az4O5hy4ujhwXlSRgkJ1j1YTFaXkxC+KP8AA+uGHjJ/rd/bEh/BFYmcIHeexdp42WDpp
	nLZCGtsxXZ3p+LIxnHWUvoXPc77je++NedStuwqukJMPOGla79xrSvI1Whp6Uu4rH6Wl
	Qoyg7TYMaDmc648elhkgdwMYpXjSRvpGLb6IzevovI4UhgWOPUUviZcGu/FHCIrMLe+/
	aqqQOFPdQ+DdJY+4wCkUFQdDWFBJ070fPbKWjcJts5GE9wi5x6kMw730qt5gsQf05f92
	Vrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=oYnyk63wV/NCvf6dK1L6y0OETn87MAVgYT5gZDuNRtU=;
	b=rsgC4HKVC32h0Zv7PNLlp7YyoDKGv6nsnEe2SYpwkOAhTHfoVZOWtd6gU3twZ2MGqJ
	NDpCbdtlP15KQrDos+Khb0VC8qkpDEFPOwmGzbkupa5rBvqO8itwo+gZMtj/WMoYd8BS
	PK7Uu7/9JJbw+7lkR39tqaj2KK70ScUlPGlClmc2ujNELITM7UGwumAQl117uz1GHn3j
	KWkTaW2AGCGVbhmNOqOdrDcz7mPG5hd0wQdREaz3m3b0Khi0msYlmmjCHG/Z93yF4eBm
	xSaLJWvdK4SidWSQ4//T+Ho2tMJ2+aA9qzKQE2JwiqNx2RDZhIevqCjtYuhO3SCuiRdO
	MT/A==
X-Gm-Message-State: AKwxytfhBFIY4xY3OHH9GOR5840vqflpSNh+/qXrq9ZFufPVGgPLpn9s
	rVpwxJtXV4hkDVDDmROwZQ8=
X-Received: by 10.31.98.68 with SMTP id w65mr6666095vkb.181.1516981449809;
	Fri, 26 Jan 2018 07:44:09 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id c5sm2242824uaa.34.2018.01.26.07.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 07:44:09 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-5-git-send-email-peter.maydell@linaro.org>
	<d8c2c2ca-5046-f19b-9514-d3cbef3b7c3a@amsat.org>
	<CAFEAcA9k2KKrXk+2LQd+X7-RFuDQO96bYSo8xi81zfb80+ApFg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <fde1ca29-873b-5e5c-76d3-d620301c924b@amsat.org>
Date: Fri, 26 Jan 2018 12:44:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9k2KKrXk+2LQd+X7-RFuDQO96bYSo8xi81zfb80+ApFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/6] target/arm: Add "-cpu max"
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
Cc: "patches@linaro.org" <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUxRGyo65WC9

On 01/26/2018 11:33 AM, Peter Maydell wrote:
> On 26 January 2018 at 14:29, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 12/07/2017 03:14 PM, Peter Maydell wrote:
>>> Add support for "-cpu max" for ARM guests. This CPU type behaves
>>> like "-cpu host" when KVM is enabled, and like a system CPU with
>>> the maximum possible feature set otherwise. (Note that this means
>>> it won't be migratable across versions, as we will likely add
>>> features to it in future.)
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
> 
>>> +#ifndef TARGET_AARCH64
>>> +/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>>> + * otherwise, a CPU with as many features enabled as our emulation supports.
>>> + * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
>>> + * this only needs to handle 32 bits.
>>> + */
>>> +static void arm_max_initfn(Object *obj)
>>> +{
>>> +    ARMCPU *cpu = ARM_CPU(obj);
>>> +
>>> +    if (kvm_enabled()) {
>>> +        kvm_arm_set_cpu_features_from_host(cpu);
>>> +    } else {
>>> +        cortex_a15_initfn(obj);> +        /* In future we might add feature bits here even if the
>>> +         * real-world A15 doesn't implement them.
>>> +         */
>>
>> Why not use arm_any_initfn() here?
> 
> That function (and the 'any' cpu) are deliberately only
> included in the linux-user binaries, not the system-emulation binaries.

why not use the V8 features?

> (Also arm_any_initfn() only initializes userspace-visible stuff, it
> doesn't provide ID register values etc for kernel-visible things.)

I'd still use an unique arm_max_initfn() such

  // initializes userspace-visible stuff
#ifndef CONFIG_USER_ONLY
  // initializes kernel-visible things
#endif

> 
>> Actually what seems cleaner is to move "any" features here, and kill the
>> "any" cpu, using "max" for this purpose.
> 
> We can't kill 'any', that would break back-compatibility
> of command lines.

and use an alias for 'any' -> 'max' or just

  { .name = "any", .initfn = arm_max_initfn }, /* backward compat */

Anyway:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> thanks
> -- PMM
> 
