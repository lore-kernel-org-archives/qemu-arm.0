Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C33C982CF
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:38:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6rhj-0001ev-5U; Wed, 16 Sep 2026 11:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x6rhh-0001eP-DD
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x6rhf-0003KZ-Hv
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789573061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vSAynfvsOSukGpzaqAs0KqHS2LOd6h6pm2e8ic0McA4=;
 b=cQFz0YOQ//7HicyE8Ac381XIpvySoTR7fwWtvtA18/abzGoXtSE9yDEm/mNCNEkcxmeeau
 M+P+G04/xAyA1B80fZGPL2FjyP3nqmMYe9hr8SWs4N0xo2X4SiVnWiOrLtP2RCpIKn3qGG
 PtKuE88RieJ/BdZvrWNQgU8/F6kYe5k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-8Zu3Pm_hOoSBo6aPZJ3oVQ-1; Wed, 16 Sep 2026 11:37:40 -0400
X-MC-Unique: 8Zu3Pm_hOoSBo6aPZJ3oVQ-1
X-Mimecast-MFC-AGG-ID: 8Zu3Pm_hOoSBo6aPZJ3oVQ_1789573059
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-486f77056cfso3840166f8f.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789573059; x=1790177859;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vSAynfvsOSukGpzaqAs0KqHS2LOd6h6pm2e8ic0McA4=;
 b=u6Hg+uJWOAWT0N9STmyetWZsfv9tPcPiFtJtTGH7c7vwtnlCJonC8CLxFYKByHKeNU
 gYw9VWz5E37Ys+14cKaZK519e+euidwplhAQmgfRhyWu4JloPLSKrYwodIthbygfAmH2
 qLHXiCDX3SJIKgEGQMzdYgWQCOOhbx26MlMxn6BuzmCsbuAgWZa5D7tqhLoLGlQakXmY
 7nDQUHrzOfI+BadFFFUKTMjpgbt41Vw86iUG0SXUkq9lYTUhHq3rgo/615Pa7akr6CI4
 qQcT/K6mewwQw3BtnDNmsYGI2l8LPF4OhT4G7Upkqfd43BwPdcpeDeF03kkphNDH1hBC
 ZM2w==
X-Forwarded-Encrypted: i=1;
 AKwUvByTNTxr5eqjevyL4e4yg+ssXYVwHX7zlgLlG0e1BKD5rSluG6rIXn4983ZppYvvASOyMAyzFLtZsw==@nongnu.org
X-Gm-Message-State: AFuF++mRsZsOBcHiRST/dpaZ4j690sIu/JhuUA+rAJ6Oa4UH0gvDFgXs
 DifGaIx38OxxpBdiMfr+qd427ULcEBN3oiwwIT0HPUGJUdkWKAJMZoLoa12fMiT0FmOsQFgwlQK
 rsqNUvlD0mwfhiLcXitmfFbqSeVJRWDoPK13PuNY8KN6+B/tyRHL/Bw==
X-Gm-Gg: AYBFou3r3gI8HogV3rXJST3SpVtGqMPfEn2zBVibftAs5T+vKXpXC0a4H6msjtBaSux
 z82RJ80ZF24IDxUXHGCBHOVYj2sKfoVEcQEbnwZwrYLOIoMeF8k6yyJAkYn5OkV/zh3cCgrcJ5i
 MnYO3UuHS1myBsxx8Uq33a1gEJ0W78Op64dtMH384aOib65nHt5o9aoGSS1lAR63vjbmDXQY2lZ
 0Wyt0l0GH/PPhvkUFQTnb4wy3tvz79oSm0+rZaJXSlerMqX85Ca1V9Jodha3QbNwqpc6haLeTMP
 MTWW1nH9y8mRiL2TsFLHfvwEXUCaeHkiUBlQanSC9Lbk5AJUM6SKLS+7bcvCb9QSxBS+F92K+t+
 IhH7ChfP1lrfVq0DeJpLzdQEAgyPGE/PH2TvgRnueqsVSt7puhg==
X-Received: by 2002:a05:6000:220e:b0:486:ecc3:2d1a with SMTP id
 ffacd0b85a97d-4870d16b5cdmr3992110f8f.31.1789573059092; 
 Wed, 16 Sep 2026 08:37:39 -0700 (PDT)
X-Received: by 2002:a05:6000:220e:b0:486:ecc3:2d1a with SMTP id
 ffacd0b85a97d-4870d16b5cdmr3992070f8f.31.1789573058703; 
 Wed, 16 Sep 2026 08:37:38 -0700 (PDT)
Received: from rh (p200300f6af00a400b6f52cb1a2e89932.dip0.t-ipconnect.de.
 [2003:f6:af00:a400:b6f5:2cb1:a2e8:9932])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf33e01sm9237597f8f.23.2026.09.16.08.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:37:38 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:37:36 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Eric Auger <eauger@redhat.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>, khushit.shah@nutanix.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v5 1/3] arm: handle demuxed ID registers
In-Reply-To: <CAFEAcA9HBVnBcSchvBrt-z9UgYBeJ2EZAJrdbeoL_CoKgvU6rw@mail.gmail.com>
Message-ID: <d10b4520-00e3-f86d-be36-637cb5cf18bd@redhat.com>
References: <20260909144151.26803-1-sebott@redhat.com>
 <20260909144151.26803-2-sebott@redhat.com>
 <CAFEAcA9HBVnBcSchvBrt-z9UgYBeJ2EZAJrdbeoL_CoKgvU6rw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z1gMhSouysxuGlEjq3ksOkWmL4tsnZO5F67ptwqwAtE_1789573059
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 14 Sep 2026, Peter Maydell wrote:
> On Wed, 9 Sept 2026 at 15:42, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> For some registers, we do not have a single ID register, but actually
>> an array of values (e.g. CCSIDR_EL1, where the actual value is
>> determined by whatever CSSELR_EL1 points to.) If we want to avoid
>> using a different way to handle registers like that for every
>> instance, we should provide some kind of infrastructure. Therefore,
>> add accessors {GET,SET}_IDREG_DEMUX that are similar to the accessors
>> we already use for regular ID registers.
>>
>> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index e3f931dba2..9652f8b0bf 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -919,6 +919,18 @@ typedef struct {
>>          i_->idregs[REG ## _EL1_IDX];                                    \
>>      })
>>
>> +#define SET_IDREG_DEMUX(ISAR, REG, INDEX, VALUE)                        \
>> +    ({                                                                  \
>> +        ARMISARegisters *i_ = (ISAR);                                   \
>> +        i_->idregs[REG ## _IDX + INDEX] = VALUE;                        \
>> +    })
>> +
>> +#define GET_IDREG_DEMUX(ISAR, REG, INDEX)                               \
>> +    ({                                                                  \
>> +        ARMISARegisters *i_ = (ISAR);                                   \
>> +        i_->idregs[REG ## _IDX + INDEX];                                \
>> +    })
>
> Would it be reasonable to assert() in these that the INDEX is within
> the range we expect it to be (i.e. >=0 and <= REG ##_IDX_LAST) ?
> That would compensate for the loss of the compile-time checks
> in patch 2 and the fact that static checkers won't be able to
> see the intended bounds now this is just a slice of idregs[]
> rather than a standalone array.

Sure. I'll send a V6.

Thanks,
Sebastian


