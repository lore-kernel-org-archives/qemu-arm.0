Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp380584lfh;
        Wed, 18 May 2022 05:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynbaJUp87c1GVCkiJGBDoZT4HrWevb492F+RQhhPPslg77x2LPxvQh6E9ErWSsdvcVJ7Id
X-Received: by 2002:ad4:420e:0:b0:461:c9fc:e1c2 with SMTP id k14-20020ad4420e000000b00461c9fce1c2mr14532348qvp.53.1652876213942;
        Wed, 18 May 2022 05:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652876213; cv=none;
        d=google.com; s=arc-20160816;
        b=JHhkYEW9Ap62YBJkwJ6GfV1yhMvtdELtD5HCbVjuAFfRP+cQPIdN38Qe5q7PLdWXL1
         VnvUQOVuGomjrNRZmUqCfQvm3Z7Al0eSfQnRJ4TUw8TGBwW7NPDGgg5Ptk9lLFWBfOPC
         42UOrp0gSpvQXIiXnOss709qNzksAQemqzEjGTw3uJ+MkVaDgdDyQ1a2lE53D7FZz99e
         uR6TktMa5i6xMlkw9ySfPuf7d+GJyy3JD5zYQB7QlAcGNZ6rnaXNjfwFqMakvLRK6C75
         pdETGVfo0l/AUjhHoHAfyF+alkEmEp1jT3eQl3xGjl1sxy6gAJJ9um5j6R/PQm9bGoDu
         kf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rVQawEr73mB0JfT1PlFOVA6+J84kDMztatTt2cyaUFM=;
        b=lW+q75su/sEZVI5w5ivPeEdjDwFCf9D8FJ6bcFB1s9ci/ZpbPmwwVl5i4xvR7bjk/c
         mI0hz4BT4vNIQJycAi0eziCe0BMG/HasHABGic+3RD9G/G8D4dC2FvzeTflXkMNesbAN
         1mvQ5BHR6jDQZGkCshNuy5FvhHp5aN+N8tzKas1m4lzWJ4J57iOG7g08qxFBGOvn4pyL
         bY1KhxfH2xEJYMlL93bQXwIj0atghk5Rh/tOcsoNfvhRSl9mm/D3tJTRBR3WDCXqJSNQ
         mJMVobY30Obd8MEZiBHsutn50a1b9q3SiCUYOaAK40DeCM+hD70+CohUIfsIm4Uuwv5M
         zq6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dr/vw9bf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18-20020a05622a119200b002f3b8f81d95si1150173qtk.441.2022.05.18.05.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 May 2022 05:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dr/vw9bf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrIbl-0004N6-CZ
	for alex.bennee@linaro.org; Wed, 18 May 2022 08:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nrIbV-0004Mw-M3
 for qemu-arm@nongnu.org; Wed, 18 May 2022 08:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nrIbS-0003Ee-Gf
 for qemu-arm@nongnu.org; Wed, 18 May 2022 08:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652876193;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVQawEr73mB0JfT1PlFOVA6+J84kDMztatTt2cyaUFM=;
 b=dr/vw9bflkXM0reMOH2qlL132Ai3UFlpOrH8TrLZx7yp0oRCP2pFec26JzdcReiKy1zoVy
 xck8qvPKMYgsb5XoDyRyIDUKzHOjVQ+au/RivIG4aDV10+xep6Vk+IHo0Zm6t3C+rZHh98
 DkDry8jnI0wth0ZTiA/zKho3WZ0m834=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-GjaVzdSGMsGfrwu5W4tzyw-1; Wed, 18 May 2022 08:16:32 -0400
X-MC-Unique: GjaVzdSGMsGfrwu5W4tzyw-1
Received: by mail-qt1-f200.google.com with SMTP id
 d8-20020a05622a05c800b002f3bb450e94so1523241qtb.2
 for <qemu-arm@nongnu.org>; Wed, 18 May 2022 05:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rVQawEr73mB0JfT1PlFOVA6+J84kDMztatTt2cyaUFM=;
 b=gBCsq1f63BuTyZLbeEepNPwDtIqhkKiEo4AhCmPQk3mZYcxl1lN1EJJaS2gW+p/5vl
 uoJqA+589FLigmCQIzXphMgc2JuKFrNdsCMV7qNBiSwAX4ZqHz04EPfCPm/i66FuEVsb
 l+bsfrIXUxzatxW+EC2NPGTEDuUQZAPoB9qeBJsaDhJMCmiTuGpQ2d4iJxnxx1jwRpiU
 FAD9o+mxr6YCXPAmJzyUWRL48tHbIiYhHp9L0AEfaIsgQvWLrdqKHv67rO5VukcvKsvN
 08R6rXW3qpmCK7pgXNX5IBUb6Mtd/q3QwEOtIwo4QexqyD7rHDSQGncn1y6LDEVVTGFv
 AZTQ==
X-Gm-Message-State: AOAM532JbJ/EUOrHyCdp23L2GMGoz0avZzMa75UrVIUto7sWwnV3GHcg
 YFDYYsMildV/y5oIoly6sIpJAoCAobeeJQQdIgZYEmJJsXQT7kXMm7Lt6bamvX/JsIkKOCpxW7G
 hbQIbk1/887uq
X-Received: by 2002:a05:6214:27cc:b0:461:f13c:83cc with SMTP id
 ge12-20020a05621427cc00b00461f13c83ccmr980102qvb.84.1652876190895; 
 Wed, 18 May 2022 05:16:30 -0700 (PDT)
X-Received: by 2002:a05:6214:27cc:b0:461:f13c:83cc with SMTP id
 ge12-20020a05621427cc00b00461f13c83ccmr980076qvb.84.1652876190615; 
 Wed, 18 May 2022 05:16:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a372c41000000b0069fc13ce1e9sm1385838qkh.26.2022.05.18.05.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 05:16:30 -0700 (PDT)
Message-ID: <f69d5ff2-6e04-c8c4-cf1f-5307a0804067@redhat.com>
Date: Wed, 18 May 2022 14:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Question about commit 1adf528ec3bd ("hw/rtc/pl031: Send
 RTC_CHANGE QMP event")
To: jokenzhang <zhangxinhao1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: wanghaibin.wang@huawei.com
References: <876a4b1f-a5ca-6bdc-28a8-682a64661f4c@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <876a4b1f-a5ca-6bdc-28a8-682a64661f4c@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2vI8mSPqCiCI

Hi,

On 5/18/22 11:55, jokenzhang via wrote:
> Hi Eric,
>
> Have you ever tested the value reported by the PL031 RTC_CHANGE when
> the qemu clock is using the virtual clock, which is not identical to
> mc146818.
>
> For instance, adding 20s to the guest RTC value, the expected value should be
> 20, but the actual value is 1652863291:
>
> {"timestamp": {"seconds": 1652863355, "microseconds": 298846}, "event": "RTC_CHANGE", "data": {"offset":
> 1652863291}}
>
> This is tested with qemu option "-rtc base=utc,clock=vm"

I did not test with clock=vm unfortunately. Those was my test setup:

"Tested with the following script run on guest:

  #!/bin/sh
  old=$(hwclock --show | cut -f1-7 -d' ')
  oldabs=$(date +%s -d "$old")
  newabs=$(expr $oldabs + $1)
  new=$(date -d @"$newabs")
  echo Old: $oldabs $old
  echo New: $newabs $new
  hwclock --set --date "$new"

This was tested with both -rtc base=2010-12-03T01:02:00 and base=utc
qemu options. As far as I can see the reported value match what
is observed on x86 (except on x86 the values are not exactly the one
used on guest, ie. 18 for instance instead of 20).
"

>
>>         s->tick_offset += value - pl031_get_count(s);
>> +
>> +        qemu_get_timedate(&tm, s->tick_offset);
>> +        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
> It may be caused by the calculation of the new reference time. The new reference
> time is calculated with s->tick_offset and rtc_ref_start_datetime, and
> s->tick_offset is initialized with rtc_ref_start_datetime, resulting that the
> rtc_ref_start_datetime is double counting.
I must aknowledge I am not really familiar with the clock framwork. If
you studied that code already, please feel free to send a patch, I will
help testing.

Thanks


Eric

>
>
> Thanks
>

