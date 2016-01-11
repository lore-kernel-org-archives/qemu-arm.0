Received: by 10.25.134.130 with SMTP id i124csp2014276lfd;
        Mon, 11 Jan 2016 06:59:29 -0800 (PST)
X-Received: by 10.194.87.201 with SMTP id ba9mr137375804wjb.125.1452524369685;
        Mon, 11 Jan 2016 06:59:29 -0800 (PST)
Return-Path: <paolo.bonzini@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id ex19si119796929wjc.64.2016.01.11.06.59.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 06:59:29 -0800 (PST)
Received-SPF: pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=paolo.bonzini@gmail.com;
       dkim=pass header.i=@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id f206so26661528wmf.2;
        Mon, 11 Jan 2016 06:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=ZYo2HcDL3mHLAAJEqUCltLjZJLHz0mPLX3KXhuNVzf0=;
        b=QVHz/yg7fKdOWnzZhMd+J7xScESUcSasFWdz24DytVPX+H6OAA1C/5ptdzKfM8Ix78
         +AaR/UDxQzhrQVpfu9oMc8UDVz0TNpDS/iw+OcDfWEkk2Hbv1ZIa3q7ynAdMk3fzkAfm
         QMFNUfSBnKNfWu3NYsW+pJKUT3nqBNknQoqvmHkMQlfP4m7Rls3xPq9kmQj7/9o6VgUq
         kCiM+1G6k4QjUGbo8mDIp4KmiL3RlKybl550bF1edZRuwtO+fnE+UW4rZ+3GGmIsG4qs
         RNrsCgrvTPAeteF5jMzOyYU2JZw4IYdIr3xP3C2qwUEosgklrM/TLTAVKNflyWolQ+NV
         zB0A==
X-Received: by 10.195.11.226 with SMTP id el2mr29029wjd.112.1452524369386;
        Mon, 11 Jan 2016 06:59:29 -0800 (PST)
Return-Path: <paolo.bonzini@gmail.com>
Received: from [192.168.10.150] (94-39-195-126.adsl-ull.clienti.tiscali.it. [94.39.195.126])
        by smtp.googlemail.com with ESMTPSA id q129sm13241393wmd.14.2016.01.11.06.59.27
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 11 Jan 2016 06:59:27 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Subject: Re: [PATCH v2 09/19] exec.c: Use cpu_get_phys_page_attrs_debug
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
 <1447682723-3977-10-git-send-email-peter.maydell@linaro.org>
 <5693B259.2030106@redhat.com>
 <CAFEAcA_L-QiV5Wbf6SVVnbKU06TC=VZUL-9SBGkOomqvb8QvOA@mail.gmail.com>
Cc: Patch Tracking <patches@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5693C34E.1040204@redhat.com>
Date: Mon, 11 Jan 2016 15:59:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_L-QiV5Wbf6SVVnbKU06TC=VZUL-9SBGkOomqvb8QvOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: k4LJxsCWmpVg



On 11/01/2016 15:18, Peter Maydell wrote:
> On 11 January 2016 at 13:47, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>
>> On 16/11/2015 15:05, Peter Maydell wrote:
>>> -    hwaddr phys = cpu_get_phys_page_debug(cpu, pc);
>>> +    MemTxAttrs attrs = {};
>>> +    hwaddr phys = cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
>>> +    int asidx = cpu_asidx_from_attrs(cpu, attrs);
>>>      if (phys != -1) {
>>> -        tb_invalidate_phys_addr(cpu->as,
>>> +        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
>>>                                  phys | (pc & ~TARGET_PAGE_MASK));
>>>      }
>>
>> The only question I have is whether it is right to have empty MemTxAttrs
>> here.  Is there any way to use the MemTxAttrs for the "current state" of
>> the CPU, whatever that is (on x86 I have added cpu_get_mem_attrs to
>> target-i386/cpu.h)?
> 
> That's what the call to cpu_get_phys_page_attrs_debug() does:
> it fills in the MemTxAttrs :secure and :user fields, and then
> cpu_asidx_from_attrs() uses the returned attributes to pick
> the right address space. (cpu_get_phys_page_attrs_debug()
> only fills in attribute fields it knows about, which is why
> we pass it an empty attrs struct to start with.)

Oops, that's not clear from the documentation in patch 4.  But if that
was the case, shouldn't cpu_get_phys_page_attrs_debug leave *attrs
completely alone when using the fallback?

I think it's clearer if you pass uninitialized MemTxAttrs to
cpu_get_phys_page_attrs_debug, assuming you can do it.  I can see why
the current semantics make sense for helper.c's get_phys_addr, but I
think they are confusing for the topmost function call.

Paolo
