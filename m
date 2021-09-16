Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1326720lfp;
        Thu, 16 Sep 2021 10:19:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUnrdlwoopp2fQ1scyT3JJoh6GGSpuijt+UcNzMgC8/ya3y/0GC1EY/bI75gsfqblQ8gS5
X-Received: by 2002:a05:620a:f8b:: with SMTP id b11mr6041921qkn.262.1631812775174;
        Thu, 16 Sep 2021 10:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631812775; cv=none;
        d=google.com; s=arc-20160816;
        b=AiG1LuSXI8VuDeHytYGb+2b6qNvUB0D5+x67A8nFVqe2gcTPs3JjCgT/RaGSn1hux/
         PDskjwRa+iD5b7X198ItNy+f9QIG+g1zYAGL6nVM5rOvrMBekUZOmWOlENtksgNT5Emp
         We7h2B+ehnnWlXXodrBZinJxFRse04+aA6PmxqSg+H7LtnZyn9I5qOsMdaoFBsifQjE8
         kfxmIbqdIe1TcYXAdCxl1JDbJX/MmmLehmmrn0zsw6fKreyImHYjcQriyb10R86tFB6j
         k1B2RBReIaF326tavCq0+SySpP0griZRxhYuzHfTanasX+Y2jhwx5/RnAwnAqhDpal1c
         Ri1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vp2d7Rm6eG2E7A/UD+ACpYSg+XdVticDpgAWqAZ+Rz4=;
        b=HBo6RbJc5qnWCr9jTtI5VKyPBMQZ9GshlLTeDeJVgEDTJuKSj4IOYMbTDOjkYFYYmC
         5bCGBebJSnnzkWEYb+gz7dA1VcEyKKnAzmWlag2knB26NnMIMGuL8F3BLZUQGu7KibIL
         HmC97NEFOJ4wdwpfAYX78183YvyYpmTJYpPkZ7h6vpsH4eYlUKa8edSIQdgF2Qw/Ojlb
         4EeFjZDy05mibuf+MxNBTg9VtrenwQYjrjUGUsmBuD5XOOhZGEuSpRFTYqHl2dKpiBJl
         B3c7kfjGCM6IpNHfUgo0LzlpG4HXUFVCuLlgsT8IMLT0CbvAe19sNSbrZuZDmhWBEMmq
         x2Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MILen4kT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si2198025qkn.132.2021.09.16.10.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 10:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MILen4kT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQv2s-00056j-KX
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 13:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQv2j-000552-G8
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 13:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQv2Z-0001qp-8Y
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 13:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631812752;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vp2d7Rm6eG2E7A/UD+ACpYSg+XdVticDpgAWqAZ+Rz4=;
 b=MILen4kT44VCeDYQXcDC90j06+/hvuLZV67RVveMxnYQ5/P6hGmOk8EqdrMajL9+ZK1zlp
 4VMKauwaWUZ6g+f9nG87n0Mm8n9Apwfs4DxQm+WPg6g5vrO6cnmJzyIVVW4KIf6zhSh8UM
 u7vNQPapjReyCsD3naOdjo6o024AL/s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-mWO77qAMM4K3_lg4NICQFA-1; Thu, 16 Sep 2021 13:19:11 -0400
X-MC-Unique: mWO77qAMM4K3_lg4NICQFA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m4-20020a05600c3b0400b00303b904380dso2822367wms.6
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 10:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Vp2d7Rm6eG2E7A/UD+ACpYSg+XdVticDpgAWqAZ+Rz4=;
 b=N25/vwWkQZZZ29vdDsNZtpiPvOZrP3tYFhmcHUL2g9JfaP8zwiNMZeraswPbN6oZRo
 QBLR4d/TAtYQpVO8AkYzsA/VchAYzBHzlrgM7qmpGOUKfK8XUn9CSx91hSy54R9UM/bT
 BEpRD6590bpHwMmozl81qyLBZdIjwCa60T3jmXV/xwQ/reTww5v2hxNMl4cKWLHQ1B4z
 rIonIYql420Aq26ylSkrEKrMUMHmqQ9CyoArC4/bNS4kFB9f6H5EUdYAn3DmwjL8k+Vp
 cDOYZibBW8IzWuWJBqNaBXfK8Pc3fwQhnRcTZqy92cfC4BQJDWEvvx63BBAGhZH5mmty
 ElvQ==
X-Gm-Message-State: AOAM5323zj/TlejGvx282GriSy709sJLX6sReKH5wjXoU7vNPlI26DX8
 YoveObSwk5pGYnIS2nND1YvX1WVV+PqAKwLax2ib4zEEUOyHdQPjoWszUPiN4el7gJ9CeKtDuE3
 Sw00LuyAILWLw
X-Received: by 2002:a1c:a713:: with SMTP id q19mr11047546wme.42.1631812750117; 
 Thu, 16 Sep 2021 10:19:10 -0700 (PDT)
X-Received: by 2002:a1c:a713:: with SMTP id q19mr11047522wme.42.1631812749887; 
 Thu, 16 Sep 2021 10:19:09 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id x5sm4766362wmk.32.2021.09.16.10.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 10:19:09 -0700 (PDT)
Subject: Re: [PATCH] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210909122402.127977-1-eric.auger@redhat.com>
 <CAFEAcA9gs4of2tw77YfYNjYKjoeBAHy0SknkCFNuZprGa-203Q@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f6aa5469-3ef4-bda1-51bd-d0eec5bf9fed@redhat.com>
Date: Thu, 16 Sep 2021 19:19:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9gs4of2tw77YfYNjYKjoeBAHy0SknkCFNuZprGa-203Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gavin Shan <gshan@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cjnDhb6EoNuT

Hi Peter,
On 9/16/21 3:32 PM, Peter Maydell wrote:
> On Thu, 9 Sept 2021 at 13:24, Eric Auger <eric.auger@redhat.com> wrote:
>> The PL031 currently is not able to report guest RTC change to the QMP
>> monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
>> to qapi_event_send_rtc_change() when the Load Register is written. The
>> value that is reported corresponds to the difference between the new
>> RTC value and the RTC value elapsed since the base.
>>
>> For instance adding 20s to the guest RTC value will report 20:
>> {'timestamp': {'seconds': 1631189494, 'microseconds': 16932},
>> 'event': 'RTC_CHANGE', 'data': {'offset': 20}}
>>
>> Adding another extra 20s to the guest RTC value will report 40:
>> {'timestamp': {'seconds': 1631189498, 'microseconds': 9708},
>> 'event': 'RTC_CHANGE', 'data': {'offset': 40}}
>>
>> To compute the offset we need to track the origin tick_offset (the one
>> computed at init time). So we need to migrate that field, which is done
>> in a dedicated subsection. The migration of this subsection is disabled
>> for machine types less or equal than 6.1.
>>
>> After migration, adding an extra 20s on the destination returns 60:
>> {'timestamp': {'seconds': 1631189522, 'microseconds': 13081},
>> 'event': 'RTC_CHANGE', 'data': {'offset': 60}}
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
>> @@ -138,6 +140,7 @@ static void pl031_write(void * opaque, hwaddr offset,
>>      switch (offset) {
>>      case RTC_LR:
>>          s->tick_offset += value - pl031_get_count(s);
>> +        qapi_event_send_rtc_change(s->tick_offset - s->original_tick_offset);
>>          pl031_set_alarm(s);
>>          break;
>>      case RTC_MR:
> None of the other users of qapi_event_send_rtc_change()
> seem to have to track the baseline time like this. Shouldn't
> this be doing something involving using qemu_ref_timedate()
> as the baseline that it uses to figure out the change value ?
> (The other users do this via qemu_timedate_diff() but since we
> start with a value-in-seconds we might want to expose some other
> API in softmmu/rtc.c.)

I struggled understanding the various kinds of clocks modeled in qemu
and the PL031 implementation. Both devices calling
qapi_event_send_rtc_change() seem to store the base rtc in their state
(mc146818rtc.c cmos data or spapr_rtc tas_ld(args, )) and then
effectivelly call qemu_timedate_diff() on this base rtc value. I did not
figure to do the equivalent with the pl031. I will further investigate
how I can mimic their implementation though.

Thanks

Eric

>
> thanks
> -- PMM
>

