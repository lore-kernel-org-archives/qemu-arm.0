Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2985071lfm;
        Mon, 22 Jun 2020 01:51:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/YljrzviuC9FtlBPN+1lJcvOFyVKb9DHWJ93IEV9MiSiNlejiO1KaewjuZKCCIzzj01yo
X-Received: by 2002:a25:56:: with SMTP id 83mr27400982yba.149.1592815869501;
        Mon, 22 Jun 2020 01:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592815869; cv=none;
        d=google.com; s=arc-20160816;
        b=aedfzXIEbra4eeWqefqh7UhCa/YsmYXUJtz7c9YbYyTVO2LCymkUwKyxatUWvyC2RR
         GFeNN6uLwOMLrwmDi1ZxL0ba+TgkQu/QUaAWOP17LZH7pBsNvgzTVBfWEqJvUKYQkvhj
         hblZgXm1fhBl4+vwBVFaB3Z7EJ92YCn2OzQDYGcwSM4DaVDkzl9oXoZ6vBL6hyAMekbN
         0W6eAS0UgP2OhSzQzAIDQRSK5NMsfk8eVEt7vBSc0oy6w8mbIWyfeS7upTKC+JVBpmhy
         MTJRW/ThdTegrQpYzvT8+eloJGh3VId8kIs3HYlh/EIGVhT4PVEoPen5LO20j9fSFDZr
         5GLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HrOENJmFxClmzMDmvyXZ+378Oo/y3SnM5i2nKt8Zhcc=;
        b=oSa7po+nkbl9ike1h5gkCzZu/EWujDeqW4PhNxNdw+Wk3LGC4fna0uq4C900OQjgUR
         aKOrr8LpgcLZj7bNsMU0d9KfbgVfsWN0yESTvILNn3/6vnvbGL1ikIZUeqlVIdine8mA
         fjUj+5GmC/qiT0nXrrz+Bp4rzJP5qrkBgqB1issboSBXWwvKapgEZZSbnm7Ej5sBfUvu
         5fIMQa2a+fEyge5M5x8zTjp8UJhFkHiTy6JEle8BuXh83gGQXOA0cT+10Fa91yWBJbCM
         dqHt2RK9H9N50+F3yNb/16ocZp2QlJRMjLTcCra6kc8jLNr5NNQDbKnfcUPEJvWTxlGx
         OKrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QbPlQymT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si13456212ybp.419.2020.06.22.01.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 01:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QbPlQymT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnIAW-0002Wa-TB
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 04:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnIAM-0002VW-Q6; Mon, 22 Jun 2020 04:50:58 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnIAL-0003U6-5Y; Mon, 22 Jun 2020 04:50:58 -0400
Received: by mail-wm1-x343.google.com with SMTP id g21so10436426wmg.0;
 Mon, 22 Jun 2020 01:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HrOENJmFxClmzMDmvyXZ+378Oo/y3SnM5i2nKt8Zhcc=;
 b=QbPlQymTFOTixdlgICYer0yrOWJ+8tx423l9IWQMx5A77PpmQ92x1Wxy/xrZopt9I1
 uwfjZHhqCO43q8OX+9WpLdvJHSLLxNy+duFWnBVieoA03okEZNv4Qt/3KW+9zEJP/4e7
 DObK5aRAllPgrg0+Q4tpW+uDd9JxkzPqfZGTNiPIG3T42CS1o91Fjorvz/OO40+5xEOW
 VVLbDtz7PqvbDDGZhf8stBI1IazN8UZc6nxVd7ovb4LvdayXcDS0ZNABfToQSLImmmkJ
 yWHNrB52Y+glY5wjs85EwKoPD5uxSQA6wqPX8ICxMDXEWCfDZoMkeYA5BeY4RYlRdHLf
 D+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HrOENJmFxClmzMDmvyXZ+378Oo/y3SnM5i2nKt8Zhcc=;
 b=MgwiXPEL+8NLY8boN0wxKPYV3c9pjWPfNm/D48xscYfLw+eEpH0RRLjUBvDl5CVIrN
 QiHwrnx9YwCY58goZy3Lu+AA+dXe4RfO1coxvIDynQafHIkN9JSZ8PWUchp/WSLWolpt
 NtjKZw6o4Przz87wBwQu1EKer3uPWJi9zKdbx2rLgopH8zrZGrq41lntrmoOclwD5+h4
 0Oqc6Dn8Ub1E5/VxfMDuwAebZxR43doAax/lEnQLPrFUmIq0elahG26lAQVb+WL8VRcW
 Ihgx/LL5F+443/AbA6zyprdsOojNxwveTB0dd5gVGKc9kb+Dz4wH9TZy7WGLuraLRH9C
 DBbQ==
X-Gm-Message-State: AOAM532DIcfPqbr4kcgqcgBGfdgwwz3TmtlVnR3TjrokSqFPN+43BEzZ
 +4qG/x7xvplGadXIN6QXRZg=
X-Received: by 2002:a1c:3bd5:: with SMTP id
 i204mr17047565wma.134.1592815854869; 
 Mon, 22 Jun 2020 01:50:54 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h18sm16876590wru.7.2020.06.22.01.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 01:50:54 -0700 (PDT)
Subject: Re: [PATCH 1/7] qemu-common: Briefly document qemu_timedate_diff()
 unit
To: Markus Armbruster <armbru@redhat.com>
References: <20200616075121.12837-1-f4bug@amsat.org>
 <20200616075121.12837-2-f4bug@amsat.org> <87d05xsz6y.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <499650b0-63ca-6882-bf63-dd91ffdebdcc@amsat.org>
Date: Mon, 22 Jun 2020 10:50:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87d05xsz6y.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <minyard@acm.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cDTYbWxmMtiq

On 6/18/20 7:47 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> It is not obvious that the qemu_timedate_diff() and
>> qemu_ref_timedate() functions return seconds. Briefly
>> document it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/qemu-common.h | 1 +
>>  softmmu/vl.c          | 2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/qemu-common.h b/include/qemu-common.h
>> index d0142f29ac..e97644710c 100644
>> --- a/include/qemu-common.h
>> +++ b/include/qemu-common.h
>> @@ -27,6 +27,7 @@ int qemu_main(int argc, char **argv, char **envp);
>>  #endif
>>  
>>  void qemu_get_timedate(struct tm *tm, int offset);
>> +/* Returns difference with RTC reference time (in seconds) */
>>  int qemu_timedate_diff(struct tm *tm);
> 
> Not this patch's problem: use of int here smells; is it wide enough?

I'll add a /* FIXME */ comment.

> 
>>  
>>  void *qemu_oom_check(void *ptr);
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index f669c06ede..215459c7b5 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -737,7 +737,7 @@ void qemu_system_vmstop_request(RunState state)
>>  }
>>  
>>  /***********************************************************/
>> -/* RTC reference time/date access */
>> +/* RTC reference time/date access (in seconds) */
>>  static time_t qemu_ref_timedate(QEMUClockType clock)
>>  {
>>      time_t value = qemu_clock_get_ms(clock) / 1000;
> 
> time_t is seconds on all systems we support.  Using it for something
> other than seconds would be wrong.  The comment feels redundant to me.
> But if it helps someone else...

Ah, TIL 'time_t' is the arithmetic time type to represent
the number of seconds since the epoch.

I guess I almost never used it ... (Not something real time
embedded systems care much) :)

So scratch that comment.

> 
> 
