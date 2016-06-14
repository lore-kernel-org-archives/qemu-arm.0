Received: by 10.25.21.96 with SMTP id l93csp123180lfi;
        Tue, 14 Jun 2016 08:02:16 -0700 (PDT)
X-Received: by 10.140.144.204 with SMTP id 195mr20054313qhq.92.1465916536181;
        Tue, 14 Jun 2016 08:02:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o202si18639760qke.46.2016.06.14.08.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 08:02:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCpr5-0008DM-EW
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 11:02:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1bCpZl-0008Q8-2s
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 10:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>) id 1bCpZg-0007LO-Vm
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 10:44:21 -0400
Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234]:33295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <programmingkidx@gmail.com>)
	id 1bCpZX-0007Ir-BE; Tue, 14 Jun 2016 10:44:07 -0400
Received: by mail-it0-x234.google.com with SMTP id i6so15461070ith.0;
	Tue, 14 Jun 2016 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9AmfcCkUSYVMxRm3w42DlzNqi56Gjb4Wt7Id1rE9omo=;
	b=uxVvaJl60ZtDGWW8XZFN7z7BB2i2iBF0r3qaS7VhBOwIv6WpYkjNiZZZUj5aVmbaGk
	w3zmpo6M1kPoqlXMyd1cyxepTgLrTCxgghg5IybZZ1fn6JdTgm95xudsM9qOhQN60uQ4
	XAAE2GpTIspBdM5dUBUf0LDqXGcskb6kK4PfJEntla3lpvHk3IFjLSB9jMCZMJKWMSmv
	M/lfyZuGzw6lvU8dwA4ogLIe1nuuBiU06rW1uBaqinT/pmCrGiuv+GrPTctmgnG7wOn7
	efLvpFcnjXslae0P/upRPhAjG9aGiOeFexPXj2RkLkqAlADQGlQgR1VyVKZRO3Oh/5xe
	Yv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9AmfcCkUSYVMxRm3w42DlzNqi56Gjb4Wt7Id1rE9omo=;
	b=gAZ3LO//hJQ0QcdP/Nd2Of7Fnafslo7UXfWzczX9svy4w13sXH3AE1dWNJuUGKE5HM
	flu7zCNRZ0OQs1TbHgfTwWkqMDJUvH4vL/HTrugh7w7jcTzPVKXHLV30km93B1+K4xo2
	FblqWTVWYY7HO1sfzR5uwq6fsqfvjVfi8evlBr2q3XRRZinnpRkq8p3pGRQ4bDxyzjTV
	30i1WdkBjOp/JtQtgIokhB7Byd9Olmo0m1PldAyFEFTtE1k5+Zyyvm+ZfR0ehzVJeQXk
	5Hx1fcK5s9vFjeZFeb2hlqn3i9709z7KtZuaG73Dnafpbp4R+siP7Wr4KrWi2o1X1Ok2
	COfg==
X-Gm-Message-State: ALyK8tLna/ljJbBQDOvoLG06KgoawFWx68t59u7IszTHw8YpW8yM4nIDeUWo+tv9Fe6NIQ==
X-Received: by 10.36.29.199 with SMTP id 190mr8284578itj.99.1465915446444;
	Tue, 14 Jun 2016 07:44:06 -0700 (PDT)
Received: from [192.168.0.5] (d199-74-164-53.col.wideopenwest.com.
	[74.199.53.164]) by smtp.gmail.com with ESMTPSA id
	f189sm14809861ioe.44.2016.06.14.07.44.04
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 07:44:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <mailman.7015.1465904373.1213.qemu-ppc@nongnu.org>
Date: Tue, 14 Jun 2016 10:44:03 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <2615C07F-1076-4896-BED0-D13155383A33@gmail.com>
References: <mailman.7015.1465904373.1213.qemu-ppc@nongnu.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc-request@nongnu.org
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::234
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH RFC 06/16] vl: move smp parsing
 to machine pre_init
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
Cc: Peter Maydell <peter.maydell@linaro.org>, ehabkost@redhat.com,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	dgibson@redhat.com, imammedo@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mb1PIf24KBfJ


On Jun 14, 2016, at 7:39 AM, qemu-ppc-request@nongnu.org wrote:

> On 13/06/2016 22:35, Andrew Jones wrote:
>> On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
>>> On 10/06/2016 19:40, Andrew Jones wrote:
>>>> +    if (sockets == -1 || cores == -1 || threads == -1 ||
>>>> +        maxcpus == -1 || cpus == -1) {
>>>> +        error_report("cpu topology: "
>>>> +                     "all machine properties must be specified");
>>>> +        exit(1);
>>>> +    }
>>>> +
>>> 
>>> I think it's sane to accept some defaults.  It must not be the DWIM
>>> thing that -smp does (which is targeted to Windows's dislike of
>>> multi-socket machine on consumer hardware).  It must be something that
>>> makes sense, and my proposal is:
>>> 
>>> - threads: 1
>>> - cores: 1
>>> - sockets:
>>>  - maxcpus / (cores * threads) if maxcpus given
>>>  - cpus / (cores * threads) if cpus given
>>>  - else 1
>>> - maxcpus: cores * threads * sockets
>>> - cpus: maxcpus
>> 
>> I think some machines may prefer
>> 
>> - threads: 1
>> - sockets: 1
>> - cores:
>>  - maxcpus / (sockets * threads) if maxcpus given
>>  - cpus / (sockets * threads) if cpus given
>>  - else 1
> 
> smp_cores is only used by pseries and x86 machines.  I expect machines
> that must be single-socket to disregard smp_sockets altogether.

Could smp support be added to the beigeg3 and mac99 targets?
