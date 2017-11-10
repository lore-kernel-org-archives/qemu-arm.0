Received: by 10.223.150.237 with SMTP id u100csp67244wrb;
        Fri, 10 Nov 2017 15:13:05 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYmUao5DbaVEYYVj6+R+C39TbGVNwiRnh23CpdDMVNd6XJF4jzpesgonNYM8nq4WAXNdSGe
X-Received: by 10.129.233.2 with SMTP id d2mr1478783ywm.407.1510355584932;
        Fri, 10 Nov 2017 15:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510355584; cv=none;
        d=google.com; s=arc-20160816;
        b=x0IlvnCbUmxkoIe4qEHAVL2ShloNjXvPGWj9MDDWcsi/T6YrekyisNCNNR2NuRWuby
         BZn/nsscjVSr81cBD+B7JJ3U7pqSykSufwGearqkN0IC52bBgReGDlrdsTgKXz2yjv5N
         MwfCsVaWxfg5iQep+6jITTef7JYYVriWGHOo0q1qN+VyB0JF9wxxj3xj6QHq3UwdCs36
         526PueoLaUfM0XIdWn8lJF26xJWiNFNyAZfTLRBEiTEKZFLOcWwhQ2Vjq5eRhRmC6lms
         slZCPHat+yuxQoPLp0luJb+/S3MeOK3BANlG14geQycYeWWU46E1aBgFI9/WOYapE3Rf
         xtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7KvMfuABIAJgn29s9Fo3ZM5RF079zPTJa4KiL2OK9l4=;
        b=lhAPNwhQHl59iuB5rkXNxJFYQaUpL1Wo9/WkaukSpokd3a6zca6310ftC5qux5wrVf
         CRENC/335ueME9lsoAIdNK/8NlDHLrj1Er6S84vhUJO2ToG4+I7crfOrT6yfzrj+IPGj
         jzDmi7Jt14kgYxSO5oD7p8aE4UijqF3oVq+btMAjug531CI/Tmtic915crfUD+kHLtwt
         olQ90Ji7DnhBKRkagThTiBStqs9NiiVffUJh0P+Py5Vqpwt8NDoh5Y5SVsDjvi43o22D
         FPSJiiNdrlFlxc5+7k+Ux1RV3W/AvMfZtnKZil8rp+EysZ3wPyo5OYz5zcFTdP5KWrKI
         a9Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WBCYuyVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si2363530ybf.239.2017.11.10.15.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 15:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WBCYuyVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDITw-0006rI-BF
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 18:13:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eDITm-0006pc-UA
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 18:12:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eDITi-0005Ls-SL
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 18:12:54 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:51531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eDITg-0005KV-M5; Fri, 10 Nov 2017 18:12:48 -0500
Received: by mail-wm0-x243.google.com with SMTP id b9so5557081wmh.0;
	Fri, 10 Nov 2017 15:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=7KvMfuABIAJgn29s9Fo3ZM5RF079zPTJa4KiL2OK9l4=;
	b=WBCYuyVqwkfDPocu7NJg03jmdbOx0HE8zA5AJ4pt2XJ23zwFurwpHLPJwEP+lUpSZS
	Hbob7r12tKb/+KCSvw/8GAuZ2DOGgadQn37X+7xYQl+UfCI0tuAcIZqpuMXtH0Z0F6Tn
	bpe8mMNmpOvfzRjRM/NmfS9g5ejsakG8MubbjFVcGlaij+wD7o/nbshMHp3PHk1FsZQc
	URcLMSxdTSd8qL/+VLmzt8w4kB2XeMB0p1imW6iFhvqrs6kHZk4k8DpeMUEEI4gi9B8s
	JMnNqs0ysclI+Q4kf0u4FfFa7ReV67hPEORdH3yQSu/DTzp8J+ZZYV7hoJqSfmLUsDlp
	PSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=7KvMfuABIAJgn29s9Fo3ZM5RF079zPTJa4KiL2OK9l4=;
	b=LBBKZZpRm5oNizmrL8lOClqzpoZxPEtgOeMeuwFbp49Q165hK5Z3zvCVq2im3xDNbP
	X3XmS+Ktgj5Yh7P+vv406A/WZ9kC0vy8VwnkdBXbk+UndfR7hFq0NAqhsi68VvE5U1LB
	T4rwPmKDtbIRaet6TBIaLL7wtX/x4Icf6Qn2tUwisczXmI5XxSGmFUram93ftTGVSXnx
	IYoWlUlVaQOkjhz6ShKX7hrVnXB0lwHVt7dWuDP2HGhvh9Ov+tMcrGSbwzwDS8NP9V2C
	RHUhpadYvKg4ZbMcQB3Ds9TcUdSOkJ3Vs1f8lxWcnbu/lqi/VrMvCZoyCq8ufvYXYhS3
	ljBg==
X-Gm-Message-State: AJaThX5ojk3B0cWtDWKmobaM6M/eyDO8wt5shmqCTJE2vlX6PD/GlzB2
	Y31VPSVaqc/m9IGxKeRHNbiJpgvKQuF2Qoa7jJo=
X-Received: by 10.28.247.16 with SMTP id v16mr1487724wmh.128.1510355567642;
	Fri, 10 Nov 2017 15:12:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Fri, 10 Nov 2017 15:12:17 -0800 (PST)
In-Reply-To: <20171110202345.GU3111@localhost.localdomain>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
	<1510343626-25861-2-git-send-email-cota@braap.org>
	<20171110202345.GU3111@localhost.localdomain>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 10 Nov 2017 15:12:17 -0800
X-Google-Sender-Auth: F1QBc4erYONyAUvhEKzUm7Yl-RI
Message-ID: <CAKmqyKOZtd7JGDHV8YF+9G-8Ke8BO9o5yc1ZuEwA3H7DGuxeVA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 2.11 1/5] qom: move
 CPUClass.tcg_initialize to a global
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: leFOlzzjadmK

On Fri, Nov 10, 2017 at 12:23 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Fri, Nov 10, 2017 at 02:53:42PM -0500, Emilio G. Cota wrote:
>> 55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
>> introduces a per-CPUClass bool that we check so that the target CPU
>> is initialized for TCG only once. This works well except when
>> we end up creating more than one CPUClass, in which case we end
>> up incorrectly initializing TCG more than once, i.e. once for
>> each CPUClass.
>>
>> This can be replicated with:
>>   $ aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -smp 6 \
>>       -global driver=xlnx,,zynqmp,property=has_rpu,value=on
>> In this case the class name of the "RPUs" is prefixed by "cortex-r5-",
>> whereas the "regular" CPUs are prefixed by "cortex-a53-". This
>> results in two CPUClass instances being created.
>>
>> Fix it by introducing a static variable, so that only the first
>> target CPU being initialized will initialize the target-dependent
>> part of TCG, regardless of CPUClass instances.
>>
>> Fixes: 55c3ceef61fcf06fc98ddc752b7cce788ce7680b
>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Tested-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

>
> --
> Eduardo
>
