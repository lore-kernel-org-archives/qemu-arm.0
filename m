Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1055196lfg;
        Fri, 12 Mar 2021 01:28:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEVmINxcEZSbKr1aj7nm1dxDAwBH5QPrxBjC61QF3oRZBiqJuoIv9NRWIQE7kQ3Rvz2UZy
X-Received: by 2002:a67:3054:: with SMTP id w81mr7200123vsw.27.1615541316493;
        Fri, 12 Mar 2021 01:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615541316; cv=none;
        d=google.com; s=arc-20160816;
        b=elJBUQkDI6jdzabTyjEkkgjKAaVrNkGg9bXOU5CMGo+O/QbdbCCGBE0vt0faN969o6
         nGdstAcnFH7B39cyWd0mza9IdZJyier1QXWrOUnbDgRxcKBWhwXNmhKpPz/ZQsa/pYVW
         tkH8uySxQdApptbLtnRoe2U+h0dK7Uvtkm+za1WmGpDthuJd7QqLze+Yv6CfkXWdrz85
         6ia1XO/TJdbD9AYE3bshwg6usxisQEylQIKjOMZ51lyPBowYmCGgX8YiJf/uImMTPQL4
         CyVEwUW9G62vXrEosBo9b1uIKh3IPwTxkM6FcybE2v+brfeDIZlqThwX8gzQ98ZorBrd
         PGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to:dkim-signature;
        bh=jiekMfdzXukuc2uB8mHUYZUiV4+o0tYgdC9CkTUjzi4=;
        b=Um78/ebCM500AHBPqpJIXZ3ThBVap7F3KS8/bmOxMmkKNIe4HrY5oe8RT0askW1FAu
         y2cQosRjjFCGmKAV5soBljJDC8MNX4TM+PVKu6EllVeGnkfNNg1xBkexcVAL9W7ybhuY
         +qRmllwPkZVzu50/YYk7NJpm+xpGAfonEaniTnnN5tVIsoXzroDMrKP9DCLP5Flhy7Vr
         JaqWZBMxqd8M7gt4vqGpJPOk08Jd4nyterAHjhThZHjdWg1SBievL/YlB8Qqadbayg3V
         5gOyx7WeI8r5nhFa9CIulvFA3gUNu4xbqhDmtfddeculQpdddsefhJ2HDAjpO/fiAJP4
         P1Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JpbNzCx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si939702vsn.336.2021.03.12.01.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 01:28:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JpbNzCx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKe5z-0001fP-TC
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 04:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKe5b-0001bt-Vd
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKe5Y-0007OY-2h
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615541287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiekMfdzXukuc2uB8mHUYZUiV4+o0tYgdC9CkTUjzi4=;
 b=JpbNzCx+Wbnjffh01Thg2gCup7o59U00A7Ktia+dQDL8f5IvYk0+ZNxtbwnDEKUZATtyZX
 lI7wQW747gKiuv4HpjBQFAv+TcO1cgWgjn5dR2SFuN0n9VVgLNPNQa8EOeL9BjfEAom4/d
 fxehS5fjKeI/r7UDhFELxFy5eDLOGi4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-Fu7iDcYhOFGzx12V0Dhhvw-1; Fri, 12 Mar 2021 04:28:05 -0500
X-MC-Unique: Fu7iDcYhOFGzx12V0Dhhvw-1
Received: by mail-wm1-f70.google.com with SMTP id z26so5116006wml.4
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 01:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jiekMfdzXukuc2uB8mHUYZUiV4+o0tYgdC9CkTUjzi4=;
 b=siaECATzOlv3bCOiG2UHp5aYHsFK/K8/bW6LCcPEXlC+SxsmBKDt/ynL3qixHziHki
 txzvR5geCIGwF67Esgwg6hDD0cb5vQ3QpjBGRfJx4ZIZ215IN0nL3oMQuJlIr8TivCqL
 V8B2Kl6wO6eIviEd4xutebZ00pi9FuiV2mBnfWrjto7kbszEzfloLNoHAEXswc7VE1dh
 YfYHcvJ21ADTd7m6n8RLCW3H6Gozen4ym0w4nOqA9AJWHdENCwcWjWSrzrOzNgb55+21
 7NqpZRhTlGyeC3oL63dB7dX/5N5XJ1ZnlZfdyqZfPVxSSTeACxnBixeT0npPIl0bqkTz
 Kmfw==
X-Gm-Message-State: AOAM533l1lUeW93Q79IxvEW3qji3n72V6G3rDF5eQoPeKb01luXUiqh0
 mgaSxPDmkEnSkcDghgVeeAnEFg6RFPXdsQtviQVLyKVRp7m24tYNTR7opT1sJPcbqtNwLXBOnzQ
 s8BjNXJFk4/tx
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr11829679wmc.35.1615541284073; 
 Fri, 12 Mar 2021 01:28:04 -0800 (PST)
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr11829651wmc.35.1615541283895; 
 Fri, 12 Mar 2021 01:28:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s84sm1521570wme.11.2021.03.12.01.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:28:03 -0800 (PST)
To: Andrew Jones <drjones@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
 <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
 <c36e5524-7eaf-16a7-5362-f992fe3a8383@redhat.com>
 <20210312091719.6sfr673oppm7hpdr@kamzik.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Message-ID: <6a5d8eea-2527-f7dc-336a-1a0571e53869@redhat.com>
Date: Fri, 12 Mar 2021 10:28:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210312091719.6sfr673oppm7hpdr@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QGn0Mel/Akrr

On 12/03/21 10:17, Andrew Jones wrote:
> On Fri, Mar 12, 2021 at 10:01:43AM +0100, Paolo Bonzini wrote:
>> On 12/03/21 09:48, Andrew Jones wrote:
>>>> I think we definitely need the additional data section here: For KVM on
>>>> POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on
>>>> MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE,
>>>> for KVM on x86 whether it's the AMD flavor or Intel, ...
>>>
>>> Could also pre-expand all of these and list them individually.
>>
>> That seems worse (in general) because in a lot of cases you don't care; the
>> basic query-accels output should match the argument to "-accel".
>>
> 
> For these special subtypes, what's the property/state that indicates it
> when just using '-accel kvm' on the command line? Because if this qmp
> list matches the '-accel' parameter list, then qtest and other qmp clients
> may need to query that other information too, in order for this accel
> query to be useful. And, do we need an accel-specific qmp query for it?
> Or, is that information already available?

It depends.

On PPC (if I remember/understand correctly) only pseries supports both 
HV and PR, while all other machines only support KVM-PR.  So in that 
case it's a kvm-type machine property that is defined only for the 
pseries machine.

On MIPS instead there's no option and VZ always wins over TE.  I think 
it could be made an option on -accel, but I'm not familiar with MIPS 
machine types.

Something like "name: 'kvm', types: ['book3s-hv', 'pr']" would work 
nicely for KVM-PPC, and likewise for MIPS.

Paolo

