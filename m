Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp159962wru;
        Fri, 3 Aug 2018 07:50:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf5NXE+ZYU417XUpAlsxFxDCqAnLHQxc5r548ZWPW0XHorDxxYW5HADSJC/oBZCcDBWwBeG
X-Received: by 2002:ac8:3531:: with SMTP id y46-v6mr4053044qtb.92.1533307842872;
        Fri, 03 Aug 2018 07:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307842; cv=none;
        d=google.com; s=arc-20160816;
        b=mCv3fn3XriP/4U0EYWkqz8ul6b+iK+XZv4Fg8EoDOU9XPRj8eEzuHYuzfdVwskq+n5
         TSCZMyzKOrxnrQfSVYGKbyHz83YNcAPudnmugKJoUVIOXXjX6LRaRW/UgUZw1An70hwY
         kX1SRnfR9BU8AWK+gWLVgIxbLL1z692MATjZgYdi+e3trOqlE3KsMSvXQ4d8heDE8Yz0
         GGvwObwN3nbxU4uX40pbTC2cQlTxNFfypec6pMWaiph4oA3wJtTmWe+A6A4CfZzwMH/A
         IwzgOyU0qUo9/Gu89BxGdtHQtEJhYVAIzC10ZMehpqjJZnRsJHlOLjGGlWCbPA6F4Hc+
         JwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=tcJ/zMwpoJZunlF+U6wEnlWe58cFi6BGCR9/wvhiB70=;
        b=UWxR/gtSHx/HNS4ZhZfQO2IfuPd5pBLDwr1P2pIvSYFvar8lsZFStlTsCTM7SBzm1d
         Xiqx1upnRnWUXVJ1AO3rqEXchZjBcwVelnf/4PinN+GTu7IckIXLSePWzf2xkcMcglqq
         IhL/O4mGX283p3pUsPdkQG7toeVXq8TEyHSVsw38yw0KefSKFABzpWIihUcZ1qYNRWjH
         cnUR84T6PfQGava7pVW04266FTL8nHP9sPoMxF7H7LR3X5vzs4d0Mtvo8Lu+g3p5ZQLA
         +1Y/leZ1hMaRO6OTgDNOFTViPYc4N7e2JIoDUQYVJlo30DYi9tbq5ibE9i97MVb1UI2V
         wd2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id a6-v6si988284qke.260.2018.08.03.07.50.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Aug 2018 07:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DFBD8315E;
	Fri,  3 Aug 2018 14:50:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-198.rdu2.redhat.com [10.10.120.198])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 624412166BA2;
	Fri,  3 Aug 2018 14:50:40 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
To: Andrew Jones <drjones@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Hongbo Zhang <hongbo.zhang@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com>
 <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com>
 <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
 <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
 <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com>
 <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com>
 <20180803093748.2s563javprolaqsi@kamzik.brq.redhat.com>
 <730e9571-89fd-2ca2-f88f-47a3c0c3d235@redhat.com>
 <20180803143958.yyujxlmjiftuq4x3@kamzik.brq.redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <9f02915c-748a-1007-8635-e6fa0319cbd6@redhat.com>
Date: Fri, 3 Aug 2018 16:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180803143958.yyujxlmjiftuq4x3@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Fri, 03 Aug 2018 14:50:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Fri, 03 Aug 2018 14:50:42 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-TUID: 5krWgSaA/lKE

On 08/03/18 16:39, Andrew Jones wrote:
> On Fri, Aug 03, 2018 at 03:44:21PM +0200, Laszlo Ersek wrote:

>> In my earlier email
>>
>>   dynamic DRAM base for ArmVirtQemu
>>   http://mid.mail-archive.com/4cce2b8b-a411-bd5d-a06f-b0b80a5fb2f1@redhat.com
>>
>> I investigated what it would take to adapt this SEC driver,
>> "ArmPlatformPkg/PrePeiCore" (and other drivers that depend on it, and
>> run from pflash) to a dynamic RAM base.
>>
>> First of all, the driver would have to be cloned from ArmPlatformPkg to
>> ArmVirtPkg (becasue we shouldn't / can't modify ArmPlatformPkg for this
>> paravirt feature). Then all the changes should occur under ArmVirtPkg.
>>
>> Those would begin with replacing the fixed PcdCPUCoresStackBase (i.e.,
>> the location of the stack, which is the only writeable thing we start
>> out with) with calculating (and passing around) a stack base derived
>> from the initial x0 value. (This is bullet (1) in my above email.)
> 
> I'm actually attacking it without a stack. x0 will have the address of
> the DTB, which may or may not also be the base address of main memory.
> There's no need to code to the assumption it is in order to have a
> stack. The code to parse the DT can all be done in assembler without
> a stack.

That sounds very cunning :)

But, a stack will certainly be needed by the rest of the code, so even
if the DTB parsing itself needs no stack, later (but still early)
dependencies on PcdCPUCoresStackBase (and friends) will have to be replaced.

>> IOW, the cornerstone of this feature is to replace all constants
>> (FixedPCDs and otherwise) related to the RAM Base with values
>> dynamically calculated from the initial x0 value. My earlier email
>> details this as well -- at the earliest, the results can only be passed
>> around on the (dynamically configured) stack itself; a bit later, PPIs
>> (= structures identified by particular GUIDs, located originally in
>> temporary SEC/PEI RAM) can be used too. But, there's nothing ArmVirtQemu
>> can "patch" the way ArmVirtQemuKernel and ArmVirtXen do.
> 
> I need to digest this more, too, and to modify it to use the actual base
> of memory found in the DT, rather then value of x0, which may or may
> not be the same value.

Good point!

Laszlo
