Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC176606A32C
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mxigmMqm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPE0f-0000hF-Cy; Fri, 06 Nov 2026 02:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xPE0e-0000h3-5O
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 02:05:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xPE0c-0004AJ-5I
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 02:05:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so1603075e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 23:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793948707; x=1794553507; darn=nongnu.org;
 h=content-type:content-transfer-encoding:mime-version:message-id
 :in-reply-to:references:user-agent:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=BwYb7dCyJSibPToehfoNOEEoR03LJVw7Y3v8pFKsUVg=;
 b=mxigmMqmRccT6Rl9fVi2WAVjQAO3rculAJx/1IPFdMotfdQpKSi2tqWo1hYWgjhhg9
 d3L3SPNF5dsP92sRKsOP0KV+Ty5xQ/TMjqy+Wp9jGIhXchHlfYrtgx1FqoN6aVCLcwcN
 Xy2TW5Cq3123MUBX+/DAoCCzlao7eO3TEPXcqo0e5kIGQ93FMIe/kyl0TYL8tgGjURpT
 Eu0MSW4oTl13iWzzZAvyTm0igxH+qIF/r6R49fFz7dsf/jOzeiIx7LL2IEJEqq5H/ycS
 I+tFcbr4+n/34XqSCFZ82QBQsdpXboBJG0jYEu5IUhB5Fyc+xdscyCvwhh9YAMBRvBNZ
 GvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793948707; x=1794553507;
 h=content-type:content-transfer-encoding:mime-version:message-id
 :in-reply-to:references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BwYb7dCyJSibPToehfoNOEEoR03LJVw7Y3v8pFKsUVg=;
 b=k/Z/CvWjGhxsYQHW8csmtVRskOT3Ciowkgtgbx4umroeIxfoE66NjRSYrkyhiR8qF/
 a8U5B4qoq2BwrVxNIoNtekiIZqvUfVlSU3I4F1Nc/FmRqEyJ9JsOtyakBWpOCZPJQkZg
 ETkIwAR8JGjIzHqo6uqEPqd6bAzOIKv/S2249OMOSQ6O1yExH7mDzyyYBs5zYHfGNBXr
 wUXfLcjOJtVQKG699r2BAByvFh5loD8jb315VSiG6lZGUHa7K/8gwuE+xMxVO6Z+aaCt
 89NZuPte6nFbiphAdhZ9oRyQsZBxL98IbtRte6/RLvNcLNJaaVefNgxjFO46M386j3D2
 mhCA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzMFEGo1KgjEnFEnFpH82yBk9zbnl66a7mPGaBxjtCuIxW5kY8YVo0g1az4c1WWUbndrN/aMbsGRQ==@nongnu.org
X-Gm-Message-State: APuU4Z/mMDfu36WEAtC9UtDOGVJbMCXTk6aWBmLDD0ZWLoD9WQjmuriH
 s5NP/BzPrxwwsF1QJrLZoqMf7mmJwVCZ4jRogy6r/TD2/A9PuyTS7GVhsuCYL0hn04Q=
X-Gm-Gg: AYBFou1qoj3xPH5ODGp/0YMldEl2FB6l7vupB6lsgdqRlccjr/iEQjcihWEIpLnXkbk
 kNa8yr/qVMSNz5Taf7fsLKTAbqHRepS4laZOs1uOCJGGUU0doR4KTzr/gwuaj2c3j9tuXo6W/lD
 UnNwztEYm4QJFB6g5/BV+syHxcircCQm12VblQJO0QfcYwuUdzqvSMk5tD6vsUrolkwIAeMfopO
 4bov8b22Dk03yfkYGKDDCImWLRzZ82g0pbkQQ8MWH1F+ujGUAwhSzcQCGweZFqcnm8p+SJx3vhU
 jXYFMy/gtcXsc1NcBjzs+y3cL/t7s9KCLz9Ubm4qvyWDaQA2OiN0DptNu6o9PlcmV45ADLrHQpv
 6hYsTEhImuCLZDgxdEzhdib2HetoziRS7xQNU4jaxIjsF8sCg4jmjcJxBX6JUR1fTGGzVaoKpXQ
 jMTCei2SWDzzeWhEloB+sbkOPbt6hWNVPb0fKbHnyOWF79McWkXQsE8E6oigr/KsZRIR/8FJVHA
 gaA8g5wcKphC8fbQt79zqIhDExHBaBmYjV1x30fa5DjHrrJLFXsKFvYKSNcI7BfCx1cOdvheQqk
 V9BiQGKS6dVY3OlkqAAwig0B0Pf4M4zpWBaP/hvAL21YgMVfWnTi+z/m8KJwejSaERIAazK7HwG
 /gcts6xGyR+sMrVgPNGDguy5sWnS3dWEEWsDAmnDU+8Dec1wNWeC6G8+eABN+70rB1krybGaeDO
 5EtdaKxLNoV6O+E1n07Z6WigC7/JiV/1epig==
X-Received: by 2002:a05:600c:19cf:b0:4a1:fbf8:55c9 with SMTP id
 5b1f17b1804b1-4b6dff85599mr21153225e9.33.1793948707366; 
 Thu, 05 Nov 2026 23:05:07 -0800 (PST)
Received: from meli-email.org ([94.66.192.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56e58fcb8sm112424655e9.1.2026.11.05.23.05.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2026 23:05:06 -0800 (PST)
Date: Fri, 06 Nov 2026 09:01:49 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] gicv2: do not hardcode minimum binary point
User-Agent: meli/0.9.0
References: <20261105-gic_read_bpr_from_property-v1-1-7e7392bfd321@linaro.org>
 <CAFEAcA-eFmvQZ8hoeGJb0hZagBejYWR0_-9-C6iA75m7k1VvXQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-eFmvQZ8hoeGJb0hZagBejYWR0_-9-C6iA75m7k1VvXQ@mail.gmail.com>
Message-ID: <to2jog.2qnecwv0xkb78@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 21:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>On Thu, 5 Nov 2026 at 12:26, Manos Pitsidianakis
><manos.pitsidianakis@linaro.org> wrote:
>>
>> The number of priority bits is implementation defined, and indeed
>> machines such as a9mpcore and arm11mpcore define it in the
>> num-priority-bits property. However we still hardcoded GIC_MIN_BPR.
>>
>> This commit replaces the GIC_MIN_BPR and GIC_MIN_ABPR defs with macros
>> that read the property.
>>
>> The calculation is based on "Table 4-47 Active Priorities register
>> implementation" in the GICv2 spec (page 4-150 of ARM IHI 0048B.b
>> ID072613):
>>
>> +---------------+---------------+---------------+
>> |               |               |    Maximum    |
>> | Minimum value | Minimum value |    number of  |
>> |   of Secure   | of Non-secure |     group     |
>> |   GICC_BPR    |   GICC_BPR    | priority bits |
>> +===============+===============+===============+
>> |             3 |             4 |             4 |
>> |             2 |             3 |             5 |
>> |             1 |             2 |             6 |
>> |             0 |             1 |             7 |
>> +---------------+---------------+---------------+
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4375
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> ---
>
>> diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
>> index be923f7ed8861620d17fbf3d8569c42ae7c95487..e090bd0b283297d0863e13ef07e5738a549ea59d 100644
>> --- a/include/hw/intc/arm_gic.h
>> +++ b/include/hw/intc/arm_gic.h
>> @@ -70,11 +70,6 @@
>>  #include "arm_gic_common.h"
>>  #include "qom/object.h"
>>
>> -/* Number of SGI target-list bits */
>> -#define GIC_TARGETLIST_BITS 8
>> -#define GIC_MAX_PRIORITY_BITS 8
>> -#define GIC_MIN_PRIORITY_BITS 4
>
>You don't need to move GIC_TARGETLIST_BITS (or its comment), as it's
>unrelated to the priority bit config.
>
>> +static inline uint32_t gic_min_bpr(GICState *s)
>> +{
>> +    uint32_t num_preemption_bits = s->n_prio_bits == 8 ? 7 : s->n_prio_bits;
>> +    assert(!(s->n_prio_bits > GIC_MAX_PRIORITY_BITS
>> +             || s->n_prio_bits < GIC_MIN_PRIORITY_BITS));
>
>It's possible to hit this assertion, because I put the "check that
>num-priority-bits is set sensibly" code in the wrong place. We
>check that in arm_gic_realize(), but the property is defined on
>the "common" superclass, so it is present also for TYPE_KVM_ARM_GIC.
>Most of the uses of gic_min_bpr() are in the emulated-GIC code,
>but the calls from arm_gic_common_reset_irq_state() will be
>used also if you have a KVM GICv2. So if the user sets a silly
>num-priority-bits value with KVM GICv2 they'll run into the assert.
>
>We should move the checks on n_prio_bits from arm_gic_realize()
>to arm_gic_common_realize().

I will send a v2 with this suggestion included, thanks.

>
>For GICv3 I pre-calculate the number of preemption bits into
>cs->prebits, but that's partly because there are other places
>in the code where things are written in terms of looking at
>the number of preemption bits; for GICv2 it looks like we
>mostly look at the min BPR instead so not precalculating is fine.
>
>I do notice one other place where we need to adjust for the
>number of priority bits not being 8, which is that the number
>of GICC_APRn registers depends on the number of implemented
>preemption levels (table 4-47 in the gicv2 spec). However we
>check against GIC_NR_APRS in the read/write code for these.
>I think that the only consequence here is "we let the guest
>read and write some values that if it isn't buggy it will never
>do", so we can fix that as a separate bug. (If it does write
>to the nonexistent registers, we are still looking at them in
>e.g. gic_get_prio_from_apr_bits() so we will generate a bogus
>running priority value and odd things might happen.)

I will have to read the spec a bit more on this, so I might send a patch 
separately instead of in the same series.

>
>thanks
>-- PMM

