Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5981261wre;
        Thu, 31 May 2018 07:19:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIQ1IoOeiSa3UgH0rQJGrUhZygY8TluoVcTTXpWEa15XAnOuGaGPDtocbuUAeFkOEZejudk
X-Received: by 2002:ac8:78c:: with SMTP id l12-v6mr3273082qth.101.1527776372045;
        Thu, 31 May 2018 07:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527776372; cv=none;
        d=google.com; s=arc-20160816;
        b=tZh7Ta3DcosxtqCenmz3JOaSYTjI40o34UmU2LIWSAitcVWrWqUpE8D3ewhUkrTdN/
         ZKe+IaPDURq++/zVQwX+GKj0zBLn6NWmQTh+HXI9SPq79RqHA6D/ciajpBw1MMeTrkBA
         bWvZS3Npri7Kvadcglqsucwm0y8WWKM2SdHp6iWhgiZMDttmTSe/4tl7JvonjwlhU70F
         YL9XiiHXpkdYLF4gV4hBj0YrQZJeYANilgyivaEXA+/EfoxHxaNL6fGdE3t8q3lyjIGu
         Hvve1IpTDjUthxIDSyCltwTXAl8m3c1K5I5YJmcUJoq/pfrH2JJfqwfd4enFMw56pNtN
         y3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ykSnLQSmvUHjx0oESrhNSVGBOcifkjM7aMGUd0849fg=;
        b=dwJK7BBh4g1ojGjl94LTAS0wz62L0XtDpyZJ96tmYnDJK/tZV7flT/JV74Qq2vCIFV
         irXzFMr4X6j0moMQ9uyUM8BajoW1rpxr29HL/aQBatCtkOGzKVD1p8jEHmtVVUicNQzD
         boeLbqG/zuaNhEDPo2aVJFddIBQMcKzQ56J6lemVHdsQ3SudD+k2kF81QBFJtKz2iSQ0
         N97DamPfZVIzvqawVBNKtB+8ZnltWMeCIZhTZI7i7iB79nqi0fUNDHyLI3qWf8/R9o3F
         JQoSYY2hZEf+oS/Br2BBkCfo09joDmxE/Lv3N0XW69vh6RtK9uEEq17jHd9qTriJIEvi
         ldKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=abIo0WaA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12-v6si8457620qvi.101.2018.05.31.07.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 07:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=abIo0WaA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOOQM-0007l2-7J
	for alex.bennee@linaro.org; Thu, 31 May 2018 10:19:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOOQ9-0007jZ-EB
	for qemu-arm@nongnu.org; Thu, 31 May 2018 10:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOOQ8-0002pi-CJ
	for qemu-arm@nongnu.org; Thu, 31 May 2018 10:19:17 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:45710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOOQ8-0002pL-6w
	for qemu-arm@nongnu.org; Thu, 31 May 2018 10:19:16 -0400
Received: by mail-oi0-x242.google.com with SMTP id b130-v6so19603006oif.12
	for <qemu-arm@nongnu.org>; Thu, 31 May 2018 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ykSnLQSmvUHjx0oESrhNSVGBOcifkjM7aMGUd0849fg=;
	b=abIo0WaAtg/H1zP4a8H9UXgpC88e09WSlDKStfN3zlqaWW+1ANzW+T2YLGZpWKIt8d
	WaDjQYbO2pLXaWOh/djSvrwVCWClb0Hxjd08MyY3ebTt82fKr9Kkm3h1dg5Ns0yQtKbN
	7EfzYNlvAY7v9Fq6AioFPiJvfV13aaUUrE3mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ykSnLQSmvUHjx0oESrhNSVGBOcifkjM7aMGUd0849fg=;
	b=Q5HPSX9xvOZplOlg3H5vpLz9IFEYjMbem3m9yfSX6GR6dAsgDmZ1Gd50eWWfVtpxH3
	jjFMuQyj/hohqBWPWEFeIWddQxGBUXEDSfVLBvlsFukY4MLMNB9gt/ecw8JBkeTFzzO0
	RD8utn6/E756OH8KuW5EDD+Bti7NiSEZ7ACLAur2HM4SUGFJ3KkIwn+oqVcMy2ZfSZ/P
	1ndbIujdbPXWLnSif8im8mCcSWYRBVbIZvu/44IGyJs/pWTHt4KxOGyf3eFXBbqHiF0A
	ewT//l7XWoChzcyF+b/ksI8iKOLysUctYg6RlXQLGp3WihV17Gp6KdEgYFNpEDGgHyp1
	LOKQ==
X-Gm-Message-State: APt69E33ZVDO59jU2H6IXw7gSBWEaTET9wJp03EsZApbfyR63YRFrzLE
	sJx5V16MO8lOGHgtzgNFgW1gmdC/TBFhIDAJ6oQqLg==
X-Received: by 2002:aca:bec6:: with SMTP id
	o189-v6mr3824722oif.337.1527776355398; 
	Thu, 31 May 2018 07:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 07:18:54
	-0700 (PDT)
In-Reply-To: <20180517193104.GB4771@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9bYdwByseqCMKSVtWV59mNruT3jJfWWLju1koCnwSb=Q@mail.gmail.com>
	<20180417142318.GO24561@codeaurora.org>
	<CAFEAcA8RwC7DSbo+mMqYUS6tL5UwfQGMa_r5AnAkJqm7v63HWw@mail.gmail.com>
	<20180517193104.GB4771@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 15:18:54 +0100
Message-ID: <CAFEAcA-+sO3oUqfQXHcHRBu2i-WFzvFKObcBz26qeLS_0+3s2Q@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v3 15/22] target/arm: Add ARM_FEATURE_V7VE
 for v7 Virtualization Extensions
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HrAPHJS8kxov

On 17 May 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On Apr 17 16:00, Peter Maydell wrote:
>> So, the underlying issue here is that there's a QEMU specific
>> fudge going on. Architecturally, if the CPU implements the
>> Virtualization Extensions, then:
>>  * it has Hyp mode
>>  * it must also implement the Security Extensions
>>  * on reset it starts in the Secure world
>>  * it has LPAE
>>  * it has some stuff that is not inherently tied to having EL2,
>>    like the SDIV and UDIV instructions, and the presence of
>>    PMOVSSET
>>
>> In an ideal world, we'd just have a feature flag that turned
>> all that on. Unfortunately, a combination of backwards compatibility
>> issues, the order in which various features were implemented
>> in QEMU, and the fact that KVM can't emulate a guest CPU with
>> the Security Extensions means that we want to be able to model
>> variants of some CPUs that don't really exist in real hardware:
>> Cortex-A15 and -A7 which only implement EL0/EL1 but still have
>> all the v7VE features that you can see from those ELs. But we
>> didn't really properly lay out guidelines for how the feature
>> bits should work in this case, with the result that we have
>> a bunch of local hacks (for instance get_S1prot() has a check
>> on the LPAE feature bit, since in practice that bit is set in
>> exactly the CPUs that have v7VE; and the UDIV/SDIV insns have
>> their own feature bits.)
>>
>> So we should probably sort out this mess first, either by:
>>
>> (a) state that we use ARM_FEATURE_LPAE for all checks for
>> features that are architecturally v7VE but which we want to
>> exist even on our v7VE-no-Hyp-no-Secure oddballs
>> (b) define an ARM_FEATURE_V7VE for them
>> (c) define separate feature bits for them individually
>
> From what I can tell, using ARM_FEATURE_LPAE to represent all the
> almost-v7ve misfits won't work well because ARM_FEATURE_ARM_DIV may be
> supported on some platforms for which ARM_FEATURE_LPAE is not (Cortex
> R5), and ARM_FEATURE_ARM_DIV is read from ID_ISAR0 in
> kvm_arm_get_host_cpu_features() (and may be set/not set independently of
> ARM_FEATURE_LPAE). It appears there is a need to independently
> distinguish between them.

We need (and already have) a separate feature bit for ARM_DIV
exactly because it's present on some CPUs which don't have V7VE;
so we don't want to roll that back into a V7VE feature bit.

> The same reasoning also seems to rule out
> option (b) "one ARM_FEATURE_V7VE to rule them all", leaving me with
> option (c).
>
> It almost seems silly to create ARM_FEATURE_PMOVSSET, but I'm not sure
> what else makes sense to do here. Am I missing something (I'm almost
> hoping I am)?

Sorry, I forgot I hadn't replied to this email yet. Let's do this:

 * define a new ARM_FEATURE_V7VE:

  ARM_FEATURE_V7VE, /* v7 Virtualization Extensions (non-EL2 parts) */

In arm_cpu_realizefn:

 * change the existing "FEATURE_V8 implies V7/ARM_DIV/LPAE" to
   "FEATURE_V8 implies V7VE"
 * below that put

   if (arm_feature(env, ARM_FEATURE_V7VE) {
       /* v7 Virtualization Extensions. In real hardware this implies
        * EL2 and also the presence of the Security Extensions.
        * For QEMU, for backwards-compatibility we implement some
        * CPUs or CPU configs which have no actual EL2 or EL3 but do
        * include the various other features that V7VE implies.
        * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
        * Security Extensions is ARM_FEATURE_EL3.
        */
       set_feature(env, ARM_FEATURE_ARM_DIV);
       set_feature(env, ARM_FEATURE_LPAE);
       set_feature(env, ARM_FEATURE_V7);
   }

 * in kvm_arm_get_host_cpu_features() in kvm32.c add
   set_feature(&features, ARM_FEATURE_V7VE);
   where we currently set V7, LPAE, etc.
   (by definition a host CPU which supports KVM has v7VE.)

 * perhaps some followon patches that correct checks that were
   testing something else and can now use the new V7VE feature bit.

thanks
-- PMM
