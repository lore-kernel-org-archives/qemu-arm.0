Received: by 10.25.208.211 with SMTP id h202csp1913112lfg;
        Tue, 29 Mar 2016 01:51:34 -0700 (PDT)
X-Received: by 10.28.65.198 with SMTP id o189mr14169397wma.25.1459241494672;
        Tue, 29 Mar 2016 01:51:34 -0700 (PDT)
Return-Path: <paolo.bonzini@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id cw6si33034283wjc.125.2016.03.29.01.51.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Mar 2016 01:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=paolo.bonzini@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id i204so1537234wmd.0;
        Tue, 29 Mar 2016 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=7+rB/Vbr9evsxVmIPPtdRd3S9ETvXuPCK+JozYvKllY=;
        b=yMA2AacVB7oyihb/o+Yirjn0SLPsmdKANTwdSv3gSR53P2MJzwewIOf8IrE1ZRPCNe
         uf5EgHu7ukzoaGJuG6w/i7YifHXogVsq2kiNAp74yIzA2crAeZWqi7mFK1gMCj4JNb7k
         g9IJdBh7dmrxlCs2k/PRm3NzlSHOE1PVEOhnEEmTL8zitdKI4Lb4d1HORVmCe7kOTKXd
         nHa+hFiKFS4dRA26W5S7vuza2ln4NWhzGpdgW6B9Ui3FPi/1SWANUhDz5tM1MYMAKPQc
         4noo751FPqHngoJE4MYzfoqMCqLEcII/vpFLNQE4YIqbOQcWnDyGTdEm+fRCiJl22d09
         E1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=7+rB/Vbr9evsxVmIPPtdRd3S9ETvXuPCK+JozYvKllY=;
        b=dq6LMSyUDKtYhw3sjCSyO4X33l5/ohlJvhtyvxm/ggywIFYXrsQF88LhRRskdITp0v
         +1FqqCtJFUzWjGwAqnZBRJPwSNirOtWMQGcGOmfZfidSveJviwACrJwXhqMduW+g6Op1
         icObzKULwkW61y005UA+2toe8xtKUjUKzTQS1zXRSGpI/swAjFttT305MjpAsRIHYdOz
         MH0in30myqeyUAko58y+s+faM+4kMtQZjF13syjLYtNhXi6OFMeWtZUWBeRJsx5M1Avm
         3etUjQpAZNBizfLBiStHVHT+WLGGH3l+AZiSmRmSwq222EJwCpJgQxcGOtCmeL4zsoJZ
         ZpWQ==
X-Gm-Message-State: AD7BkJJyr0xVmWE+8y7VLv6NHDX+VaXyG6IvceL0kKjGjTchBmyLj579KnpEGwfWb7Eqlw==
X-Received: by 10.194.95.40 with SMTP id dh8mr1458390wjb.146.1459241494362;
        Tue, 29 Mar 2016 01:51:34 -0700 (PDT)
Return-Path: <paolo.bonzini@gmail.com>
Received: from [192.168.10.165] (94-39-141-76.adsl-ull.clienti.tiscali.it. [94.39.141.76])
        by smtp.googlemail.com with ESMTPSA id i2sm28296880wje.22.2016.03.29.01.51.32
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 29 Mar 2016 01:51:32 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Sergey Fedorov <serge.fdrv@gmail.com>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
 <87mvpnrkby.fsf@linaro.org> <56F4039A.5050907@redhat.com>
 <56F9AC4E.4070304@twiddle.net> <56FA3981.60608@redhat.com>
Cc: sergey.fedorov@linaro.org, Peter Crosthwaite
 <crosthwaite.peter@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Claudio Fontana <claudio.fontana@huawei.com>, Alexander Graf
 <agraf@suse.de>, qemu-devel@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
 qemu-arm@nongnu.org, "Vassili Karpov (malc)" <av1474@comtv.ru>,
 Aurelien Jarno <aurelien@aurel32.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56FA4210.20707@redhat.com>
Date: Tue, 29 Mar 2016 10:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56FA3981.60608@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: +uDWx8OIm4zv



On 29/03/2016 10:14, Paolo Bonzini wrote:
> 
> 
> On 29/03/2016 00:12, Richard Henderson wrote:
>>> There is also a case where a TB jumps to itself; it then appears twice
>>> in the list with different values in the low bits, such as this:
>>>
>>>      tb->jmp_list_first = tb | 0;
>>>       .--------------------'   |
>>>       |                .-------'
>>>      tb->jmp_list_next[0] = tb | 2;
>>
>> Of course, it begs the question of why TB would be in its own list, even
>> if it does jump to itself.  We only need the points-to list in order to
>> invalidate a TB and unlink it.  But if TB is being invalidated, we don't
>> need to reset the jump within TB itself.
> 
> Isn't it just because TB acts as the list head in the circular list?  Or
> am I misunderstanding you?

Ok, that was dumb. :) Understood it now.

Paolo
