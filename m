Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6222544lff;
        Tue, 17 Dec 2019 08:13:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfFEmy75X1nNkfJEMS0aXEtWw1O+BfqeFIVT1arm8CTZH99h25Qj3JaJhdCEH65gFmtOt0
X-Received: by 2002:a9d:51ca:: with SMTP id d10mr37401053oth.76.1576599223637;
        Tue, 17 Dec 2019 08:13:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576599223; cv=none;
        d=google.com; s=arc-20160816;
        b=0+6RJO/J/g4Mo2cx/96luYqsoWbsIfQN6N52FjQmatMvlZmoIMYX9l2cGm3wRE0GYv
         XNsT+nNJaPvtTK3P+5FZPYZY4pkU6PEvARsboYl1v/zmoChEigQOr4dVAZBkb6I3cSIE
         PhS/rT8GR8mx3jnDpgQSyEMYGm24TNQKHxO0lO93qUX/hqFHWJ5k6S20oPTIKEKQIyIo
         rcEy0Z9JkSX1DzYvsq6Bz9AxHpZ5soE1atW2/QpqVDVXr2iRYDfmQsAPyZtrAJBNWJqs
         usuahjA5VEfAJbbzjNxb2nMNL0HhMpN1RtRhgwRXyky663cT9X7EQ5IRfzAx+9T4gKht
         ddsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9eA6rPNcaU2ZWLl5G0XTFFRhC0j4AKLKeAJsM48P8eE=;
        b=uoSlnwE9YZng7C/1p8YTQOBcJXmnZpgmN7pxBsDMHF/BdRle7Oq08zpv3ypl+LiCTH
         Vme/Z75YXbHg30jfeQ2fTODMHYRswuxbTtqFjZL54/Dc/eYJ8XZY9Tb5SQA2paQHYjjM
         Y0HnJjhbvbUIzTMnW/f0Yw0FPeIYJJTkrW86sleqrjMuuUyJzEn+2iclWpaGDdPyGYS1
         eYj2lcAPO4HdMHZLHynTP1u+A+twoWOU3hhpUqiB/gAeWetYqvpEiu/mlmnzqoxOBHSa
         719sT3M4V5K5s3WLjSTTqFsCmPo31vaFAcNSPJl7wrMW+qNETq25abBWCaDkQxncLVYq
         hMLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gUJAhbf/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si13454835otf.32.2019.12.17.08.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 08:13:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gUJAhbf/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihFTh-0001e0-Rv
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 11:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ihFSW-0000sj-NR
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:12:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ihFSV-0000mj-8O
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:12:28 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43861)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ihFSV-0000ku-2a
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:12:27 -0500
Received: by mail-oi1-x241.google.com with SMTP id x14so5752745oic.10
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 08:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9eA6rPNcaU2ZWLl5G0XTFFRhC0j4AKLKeAJsM48P8eE=;
 b=gUJAhbf/BbeTUy3EGzWR9W7DUBuThSDmXWfPvtpqb6pqMlwHbG0RRVJm+myNSSmU78
 NCg5wHcTaOGqjsKc20aXQ27zPWoeiPes6/PxS721vk62iSYftaCBCrwuMiqx04TKEg9s
 AY2M8wr7PyKTmmfq50oe8FUmIXwWR8QABEZDShPS+b3MrqBJpTrfkLfpGHWwXS+8tmiN
 B8q1lt7/JWetuPYTKdJYdiE20GBKKpyQ6OEp3nZKUaoFv1W53FtG6IENGoEnOWDf6Rp9
 fUt3FWwj1oV/jnuy72kSs4QBSaDTtPFFU4N4FFET/75OS3uJF47rsCnAa9H9Idt320AK
 ZNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9eA6rPNcaU2ZWLl5G0XTFFRhC0j4AKLKeAJsM48P8eE=;
 b=AyfVoCxLXRJUC5pfmnpgK1q/C2cz8Lf+Zrvq/EQ1WkONhQk5GGTqb2AaJDZKQv/BYb
 d3KArzzDrZBgByUUG6NECeu2dJMSy5fGmVaZBxTEybhGuYryvAJyPVgk6odkw4yUbSyz
 AKbyRwWsR/We2Ny79obBJO7N2O503FY9+fn5Q0IirHwbZK50+gu+mqb/wqb4HW7YOipi
 wRVXECsiVXLtjVNIQj9XarmcO6fj35Ay9vLjBgT54YJQEPiNHb1tGLV3mtzAXebbDbFC
 XfCYzncOyis9GZG8rM1sfEEkbWT1xfVxrTXlUZ1+Sr+8JG78dBLh5ZniSJpM7gyO7Twj
 q92g==
X-Gm-Message-State: APjAAAVrTFkEVtUzoZqyfjd+xQaXkmuQflL6t9TNX+8GfEnthZprpKqD
 7DZjWIYjuHARGBewD26oVpy4M/q01jFkGn0vIGBHIg==
X-Received: by 2002:aca:f5cc:: with SMTP id t195mr1919853oih.163.1576599145997; 
 Tue, 17 Dec 2019 08:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20191216233519.29030-1-nieklinnenbank@gmail.com>
 <20191216233519.29030-7-nieklinnenbank@gmail.com>
 <CAPan3WpW1Q3zpnqgk=MWRWe99=MQ4XoW2kw8L3tioFxfEBXd+Q@mail.gmail.com>
In-Reply-To: <CAPan3WpW1Q3zpnqgk=MWRWe99=MQ4XoW2kw8L3tioFxfEBXd+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2019 16:12:15 +0000
Message-ID: <CAFEAcA8Viii4Em_bf4Y=AG0jU+EFFFTX6dO-52qd=RT4uHbCVw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] arm/arm-powerctl: rebuild hflags after setting
 CP15 bits in arm_set_cpu_on()
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HTsKThWuHuNG

Cc'ing Richard : this is one for you I think... (surely we
need to rebuild the hflags from scratch when we power up
a CPU anyway?)

thanks
-- PMM

On Mon, 16 Dec 2019 at 23:44, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Hello Peter,
>
> In the previous version of this patch series I included the fix for setting CP10,CP11 bits
> in arm_set_cpu_on(), which is now in master (0c7f8c43daf65560). While that worked, I did not
> realize that setting those bits require rebuilding the flags. Philippe reported this [1] initially,
> later on during review we discussed [2] and attempted to correct it [3].
>
> Could you please have a short look at this? Right now I don't see anymore
> issues, but I'm just not very familiar with this area of the code.
>
> Regards,
> Niek
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg01920.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg02784.html
> [3] https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg02785.html
>
>
> On Tue, Dec 17, 2019 at 12:36 AM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>
>> After setting CP15 bits in arm_set_cpu_on() the cached hflags must
>> be rebuild to reflect the changed processor state. Without rebuilding,
>> the cached hflags would be inconsistent until the next call to
>> arm_rebuild_hflags(). When QEMU is compiled with debugging enabled
>> (--enable-debug), this problem is captured shortly after the first
>> call to arm_set_cpu_on() for CPUs running in ARM 32-bit non-secure mode:
>>
>>   qemu-system-arm: target/arm/helper.c:11359: cpu_get_tb_cpu_state:
>>   Assertion `flags == rebuild_hflags_internal(env)' failed.
>>   Aborted (core dumped)
>>
>> Fixes: 0c7f8c43daf65
>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> ---
>>  target/arm/arm-powerctl.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
>> index b064513d44..b75f813b40 100644
>> --- a/target/arm/arm-powerctl.c
>> +++ b/target/arm/arm-powerctl.c
>> @@ -127,6 +127,9 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
>>          target_cpu->env.regs[0] = info->context_id;
>>      }
>>
>> +    /* CP15 update requires rebuilding hflags */
>> +    arm_rebuild_hflags(&target_cpu->env);
>> +
>>      /* Start the new CPU at the requested address */
>>      cpu_set_pc(target_cpu_state, info->entry);
>>
>> --
>> 2.17.1
>>
>
>
> --
> Niek Linnenbank
