Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp260182lfb;
        Fri, 8 May 2020 08:40:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwZ9MSkdle7zqSUHighcKWLqp1aOJQWn5NQeM9TGdqw7ETCmSQ46G6nh+Lziw4nLsMInXL
X-Received: by 2002:a05:620a:759:: with SMTP id i25mr3339214qki.118.1588952456911;
        Fri, 08 May 2020 08:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588952456; cv=none;
        d=google.com; s=arc-20160816;
        b=MYyHXJP/k36DPEAmevHL4A3afnH455CawTMzKASomn60E8z3wA2hhlz5u9OZV2wvyx
         LbBhBGYznfn235Bka9BQL4FFZal7YXS+/qGaD3AvyLJ9W+vj3AkGeZRovfzjANBJDORn
         ifMrKpZZXutceW1fpmCWdptZQyPbcR6+2BQkH55mf2+o+7xQYwNCEo9Zu2T1EQIRWuuP
         PnC7Sh4X+lFVzrpRg5jAsqti3ByCuGHk3g4m/PM/IlzlbAv4iLKQqWW2KK3gaSJ4+7j/
         k8Xbkd+7RmEXIshgZvMDHbtH8l4tLW26pUESixbTdyV+lAAqZGNQ/F4al0HZYCZXJd/w
         Hudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XOD8ltYsEUkkdTRlhmIZq96e/KTiKYwVTjXwh8WZpOE=;
        b=t8kGhLRUabMvEKtQ206kvPIDUYdkbeSSLJAd+r3bpSFs+spriZkiHXU4kPh9W6cxJ9
         DZy2DfZM7JkW89XBCRgNE6HZAtakj3xd6o93u8BHV9ugYmKfgYyTeoBwULdiA1KdpM7e
         Pos7yIwhcCUCHK/GHHlctvQwsLltU6XyfjglWm6/2NJAjYH/Z3IU4AKNy+5hXKooBhn7
         cTvlnUnTmMivVelDMQ+svdZrKH4sznh0mAHxhDCwutJ2rzjObSX1ktuiz/2dcawrK6WJ
         //mrnZW3ekYg7h1SfWvhsZX80Sw3NzZ2FXOml9Dx1gTb4ikrdbkEG68CrOXBsNQVkzN1
         r8Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MNhZLcop;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id j17si1263887qke.112.2020.05.08.08.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 08:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MNhZLcop;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX57Q-0001BT-8Y
	for alex.bennee@linaro.org; Fri, 08 May 2020 11:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jX51g-00007z-Jj
 for qemu-arm@nongnu.org; Fri, 08 May 2020 11:35:00 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47204
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jX51f-0001Na-Tn
 for qemu-arm@nongnu.org; Fri, 08 May 2020 11:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588952098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOD8ltYsEUkkdTRlhmIZq96e/KTiKYwVTjXwh8WZpOE=;
 b=MNhZLcop2k3ClnVLj3Ab9a8XkW946lC/pWdiOj4a9/zJLQH7YuZ/BOUrm0alRaSBtNrB5Z
 opl/rhq2BPpWVwDKyS1shCGad51HBBTNXZRzITcAW4Y9o8Df1lWNruvyLb5THhtAJuJkVH
 Q9IO3589pqo9wsVyZy8HTXk2LN7PBCI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-sEeTndBvPKKx7R1nWTEF9g-1; Fri, 08 May 2020 11:34:57 -0400
X-MC-Unique: sEeTndBvPKKx7R1nWTEF9g-1
Received: by mail-wr1-f72.google.com with SMTP id f2so1061986wrm.9
 for <qemu-arm@nongnu.org>; Fri, 08 May 2020 08:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOD8ltYsEUkkdTRlhmIZq96e/KTiKYwVTjXwh8WZpOE=;
 b=In7NyUhkCOV8j6UFtc2cDbvAX+UsXktMUXmgHgrZXfisoINTpgAZojWhj+BXhWEqIG
 zKcwlyFk5uza6YMjUPCPTttc8zi9E5RI+ZaVUrX4DoTvwa+7U1hVyfnR5uUuvPY2LllA
 ojBvKyqeaH9Bol7xTVY7Od958x6afCzO5i0RZpxAHG1Wm4+yki9jGSTAbnUHWewVWj8d
 YZUEqK2c56JhZfeC1G+HrGbJaC+Cwz0bC6lionRPxRRgn2F4lAsKs9YwtB1/cEgtHXFx
 28eBO80tz2mXed243y4JuPPmmv7GmzyKIna1+cethRff2mYx4G3UNnKHv3fxuBy1+Ov6
 1rzg==
X-Gm-Message-State: AGi0PuZsAZfOXBAO04vsZAZpIuqJHS4tbb3LPtmzTFRfvv9K1OJIjkQO
 L1QLNuZwJdIIKpNao5We6gImA7NeNQUhq2n+LruMZO1AqeHiKr+bp4ZVxgnjK1U+fCY+ns4crwN
 R+8AsqeGaRr5/
X-Received: by 2002:adf:f48a:: with SMTP id l10mr3388613wro.231.1588952095377; 
 Fri, 08 May 2020 08:34:55 -0700 (PDT)
X-Received: by 2002:adf:f48a:: with SMTP id l10mr3388590wro.231.1588952095102; 
 Fri, 08 May 2020 08:34:55 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id n12sm3681849wrj.95.2020.05.08.08.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 08:34:54 -0700 (PDT)
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
To: Paolo Bonzini <pbonzini@redhat.com>,
 Beata Michalska <beata.michalska@linaro.org>
References: <20200508062456.23344-1-philmd@redhat.com>
 <9396e0cb-388a-e08e-c066-82a60708ecdc@redhat.com>
 <CADSWDzvECqOXzusk=tj8r4z-E5CDZn4TNG8PJ5pxLHAn3saOzA@mail.gmail.com>
 <500bd6f3-2b14-eda8-72e5-56c46b7860bd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <653758ab-468d-b6f8-0ca6-404a799e3928@redhat.com>
Date: Fri, 8 May 2020 17:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <500bd6f3-2b14-eda8-72e5-56c46b7860bd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 08:00:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 qemu-block@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Keith Busch <kbusch@kernel.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: khC/kLgBV71X

On 5/8/20 5:33 PM, Paolo Bonzini wrote:
> On 08/05/20 17:20, Beata Michalska wrote:
>>>
>>> mr->dirty_log_mask tells if dirty tracking has been enabled, not if the
>>> page is dirty.  It would always be true during live migration and when
>>> running on TCG, but otherwise it would always be false.
>>>
>>> Beata, can you explain what you had in mind? :)
>>>
>> It has been a while ... , but the intention there was to skip the sync
>> if there is nothing to be synced in the first place - so for performance
>> reasons. I honestly do not recall why I went for the dirty_log_mask,
>> as that seems not  to be the right choice .
> 
> You probably wanted to look at the dirty bitmap, but you would have to
> define a new bitmap rather than looking at dirty_log_mask.
> 
> But that's cool, because it means that we can just remove it!  Thanks,

So I understand I can simply rename memory_region_writeback -> 
memory_region_msync in patch #2.

