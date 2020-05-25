Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1991521lfc;
        Mon, 25 May 2020 05:32:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMBJ2QqJMEuq8OsiUGFNoBUrN/AVuJC35m9Y/fIhrviPYBkCUc+R6BTZx0ACbuj9bRbFZm
X-Received: by 2002:a37:8a42:: with SMTP id m63mr25989405qkd.230.1590409948808;
        Mon, 25 May 2020 05:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590409948; cv=none;
        d=google.com; s=arc-20160816;
        b=pbxQvA9+iM2RzW18v3V9r1G2vOqOYzGowPKbiiFACh1oZ7xK2biWn+xmxgN1C/hJQ8
         s7I12i2gitXoSgzxKT/eBiKwrwZCHnhbXJzab+BVZI4iCp3Yt0WAItdOh96pBO/7i9eS
         HbIGKzOD5DFt7rraJ8ZJBsfdMwD1wIys4RpWx6NotqRuS0kYXzR+KZelsdPNiQ9+mBOh
         Q8tw1trJHYX/rQz1i6UL7HG/urcEAZx/sf1w2dYxtsJbjaSyfpR6tTydNDV9WwA+a6Iu
         E7Z366KdnhEYWUAQmtA0Bb2EOk0DtgxrCK1NjBaP02jMd6+kPybBNog+hmeJiPAwn8xl
         S7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AlNW6ZFGEnuCf+hvYjyPazmjBRoFnYUpMICEDFbLyUk=;
        b=ujQic75VBX+8/Xj+5d4gLUbFx8lPukXONQ8pZ8bNr2aYAbZvvBhmKKmXcj7T3zz6G6
         THu0sPTP3mtrvuDF6ZatYsKSuQwEzwuddNvfpuly2Hdv/nXYmoxqwicZcVeksrtKUrRq
         b9mzbrY4BBqNGPEGxNmcPrcxpL0E+alXoC37aK3qJbJdyviBsgsmouj8UDjNKES8C8Cn
         bLso3BuVuzF6VoQ1FHLcd7uACbQB1cnBVQaVUBCsPaqPE2vOssVmX3hc2MFAVlFfsmOL
         rmTBpW3AewJTvVVcuorGyR069jQ1JfNVgPzn86+H8xWg7uitQOBmQj/qaXIb9PwBreNA
         O7yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+a8KFRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g54si3691837qte.82.2020.05.25.05.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 05:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B+a8KFRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdCHM-0006WU-9d
	for alex.bennee@linaro.org; Mon, 25 May 2020 08:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jdCHD-0006TJ-JI
 for qemu-arm@nongnu.org; Mon, 25 May 2020 08:32:19 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58493
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jdCHB-0004Ku-Dy
 for qemu-arm@nongnu.org; Mon, 25 May 2020 08:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590409936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlNW6ZFGEnuCf+hvYjyPazmjBRoFnYUpMICEDFbLyUk=;
 b=B+a8KFRZa7i8y2YcHTXl7MwK+NDi5dNl15ZIi3EXJE47tYjyoVLkAIIkZSjJ4iuPqPEv6f
 tsOW/FYJ5ledQnMt175vTNYsockfuL0S9DdBAdH7+IK0nbPYwR960r6gAB/4w0FBRFpqOa
 O15LfDB3wXstf8vBRo6kln/aPI9Gy04=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-jC1wv64lMwaYqpdCRp7HDg-1; Mon, 25 May 2020 08:32:15 -0400
X-MC-Unique: jC1wv64lMwaYqpdCRp7HDg-1
Received: by mail-ed1-f69.google.com with SMTP id o7so7391865edq.7
 for <qemu-arm@nongnu.org>; Mon, 25 May 2020 05:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AlNW6ZFGEnuCf+hvYjyPazmjBRoFnYUpMICEDFbLyUk=;
 b=Z67Xi22qUNNxktaCEg1nJADvyD+p9BaEM17MoQDYjk3dlYu0etDDRUYBQN8CXzOiEI
 /1U1u+HZSJ1bNJlIgBXm+zLr+FM/i0B+3RtNHQVWwPyHKG7yMqZHwpni3vjd3xAN0E7c
 Ji4ip/iMO6PxQLZl2BHrIBi7Sd03s3Fes2a3E4hkmfwSF4ZiMiOl4CM3/t6Z1nWD5LJl
 lCJ1FM5EunHAhJ+hzP7CBA5Y7Nrl3tYmJu0Q4yWkqXEnLaoID9GxON8NbYRg9WTCcgUg
 5gLVCa6yE+7Onpdj0X/9uLvxrCcIAIFmdtXAGyquvP9//Ng4l3olw08ytylwQux7TVfM
 Vskw==
X-Gm-Message-State: AOAM533e6VQRd1QbqCq9Q7XmAhAc7qJF4wKcEJsth+OZ8FDnh7Z/8Ktf
 ZD+/sIbGA/X28kiRehqLCu1wuCLdxkkdPPDS/pAB7LAgafTDqkYjDo8Rc7Bonr+e/eAmmHG6GOD
 +8PC4CeuyJjbm
X-Received: by 2002:a05:6402:1bc1:: with SMTP id
 ch1mr15373740edb.90.1590409933791; 
 Mon, 25 May 2020 05:32:13 -0700 (PDT)
X-Received: by 2002:a05:6402:1bc1:: with SMTP id
 ch1mr15373720edb.90.1590409933555; 
 Mon, 25 May 2020 05:32:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8?
 ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
 by smtp.gmail.com with ESMTPSA id t23sm15158953edr.71.2020.05.25.05.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 05:32:12 -0700 (PDT)
Subject: Re: [PATCH 06/24] armv7m: Bury unwanted "ARM,bitband-memory" devices
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-7-armbru@redhat.com>
 <CAFEAcA9UampZxo-4Z=6+LKkC9HLrdGYT5AcLyiGVYvgU5VE+cA@mail.gmail.com>
 <878shgh8be.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3ebe626e-0373-0eee-6a54-27a88d656122@redhat.com>
Date: Mon, 25 May 2020 14:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <878shgh8be.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 06:55:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08oLRfJvoiom

On 25/05/20 07:50, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrote:
>>> These devices are optional, and enabled by property "enable-bitband".
>>> armv7m_instance_init() creates them unconditionally, because the
>>> property has not been set then.  armv7m_realize() realizes them only
>>> when the property is true.  Works, although it leaves unrealized
>>> devices hanging around in the QOM composition tree.  Affects machines
>>> microbit, mps2-an505, mps2-an521, musca-a, and musca-b1.
>>>
>>> Bury the unwanted devices by making armv7m_realize() unparent them.
>>> Visible in "info qom-tree"; here's the change for microbit:
>>
>> What does "bury" mean here? To me it implies "they still
>> exist but we've stuck them in a hole somewhere and covered
>> them up", but the qom-tree delta suggests we've actually
>> really deleted them?
> 
> We really delete them now.
> 
> "They've been lying dead in the streets; give them a decent burial".
> 
> Would you like me to s/Bury/Delete/?

"Bury unwanted" -> "Dispose of unused"?


Paolo

