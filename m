Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp848622wrq;
        Fri, 15 Jun 2018 06:24:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJL0Mj7D9FIB+7oeRAnQUdsuqDC2SMcjAqpaZ7rxBezesVj+d4Mq0y90xujVeVQ7uWgHw8q
X-Received: by 2002:a0c:de13:: with SMTP id t19-v6mr1348698qvk.93.1529069099662;
        Fri, 15 Jun 2018 06:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529069099; cv=none;
        d=google.com; s=arc-20160816;
        b=srT3IvhblKm972FRE1i71X8ThqgF7c1frrP10vve9LcpO2Twch6DBJxdf7q+Li9IzI
         WvSpS6tomQkAAkUWnB9yxlrA8+f4eJQ3BVmx9oTux2neuHlRApf5M/DkEDTcPJaEmPYm
         N3tfBX/0oHAWGJBJ4OmJ5X9X0hsYbDicG43hg+i7wPH2s8+5VZEoFICGewcWGpgMnoGd
         nB7m27Lrp0jDdT2CM6FSZ0hAmZZgA7ry6LXi3rlDZXZ+mVJG9yUiT5FbcqpTxoFZJLjB
         sXhE/CecmmAES7qW4rhUIlrE1FC5756qTmknV/OMrRQEiKs8GUwdqLMyXwK0Pe0I6u1O
         3W0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=4zNrvSmhS8pwhB2eUE3M4MhAWx/PUk6OnWbWhehYzHU=;
        b=ZFIsV+M4Qj9m+nxF4QaLsprY+bW2mkPZv7r8t0EvzAt1U9fpMw4d+UdSppMhYKdmrE
         tI/HIbkLXWBIQ5Y9V5U5oT+dtYfYeMFuzl9q7mYsOi43rgwt2yXGDx3AsBnLpU/eF2Lt
         jzSIVgOh5v7XajqwgvwxbGUGpaLokCfG5Z+DFDNk9wGOpevvLvNyCOpe+zkJgBdp7+rK
         TwAbhWFhFJnrRSzdYhrqNc2bGhTsZzTdi5k8PYJ7ufG4AZ2YimjJvr8ZmzpwAwMxYUZZ
         gqwvzy85cPGlcCAuw0djOdzgSJyiwHRctSZRDZx6PDdPonm2SP6DXYJuE7AscorHNmCJ
         ydmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id c45-v6si1153200qvc.60.2018.06.15.06.24.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jun 2018 06:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43FF640122CE;
	Fri, 15 Jun 2018 13:24:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com [10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA78C2024CA2;
	Fri, 15 Jun 2018 13:24:57 +0000 (UTC)
Subject: Re: [PATCH v2 06/13] hw/misc/tz-mpc.c: Implement registers
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-7-peter.maydell@linaro.org>
 <45d89f39-7397-bd71-5cd4-fdb1ea47595e@redhat.com>
 <CAFEAcA_OpQYq6XuKhAsP-W9pimWpF49XVcttcV7rqpOgJu2ihA@mail.gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b3163a63-ae4a-9526-79a9-42cce6ae0eb7@redhat.com>
Date: Fri, 15 Jun 2018 15:24:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_OpQYq6XuKhAsP-W9pimWpF49XVcttcV7rqpOgJu2ihA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 15 Jun 2018 13:24:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 15 Jun 2018 13:24:59 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: njSjDKSV8knD

Hi Peter,

On 06/15/2018 11:04 AM, Peter Maydell wrote:
> On 14 June 2018 at 21:36, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 06/04/2018 05:29 PM, Peter Maydell wrote:
>>> Implement the missing registers for the TZ MPC.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
>>> +    case A_INT_CLEAR:
>>> +        if (value & R_INT_CLEAR_IRQ_MASK) {
>>> +            s->int_stat = 0;
>>> +            tz_mpc_irq_update(s);
>> don't you need to clear the info regs. spec says:
>> the [info] register retains its value until mpc_irq is cleared.
> 
> The full sentence is "Subsequent security violating transfers
> remain blocked, that is, not captured in this register
> and the register retains its value until mpc_irq is cleared."
> I interpret "until mpc_irq is cleared" as applying to the
> entire thing, ie mpc_irq being cleared is what allows a
> subsequent transfer to be captured in this register.
> (Hardware actively clearing itself to zero is unlikely,
> because that costs extra gates which designers don't tend
> to do unless there's a reason for it.)
> 
> From a guest point of view (which is kind of the pov the
> docs are written from), the guest can't rely on the register
> value once mpc_irq is cleared (because another transaction
> might come along and cause the value to be overwritten).
OK

Thanks

Eric
> 
> thanks
> -- PMM
> 
