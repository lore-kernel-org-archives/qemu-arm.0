Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1027420ejb;
        Fri, 26 May 2023 02:50:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4jSEXjP+QV2aAtGEnDFdAxlQwel3ZccL9lCaRgn+2/NohCIvl0uGCiPnw4LtZQ2lvE7R4p
X-Received: by 2002:a05:620a:28cc:b0:75b:23a1:35ef with SMTP id l12-20020a05620a28cc00b0075b23a135efmr1571511qkp.0.1685094620667;
        Fri, 26 May 2023 02:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685094620; cv=none;
        d=google.com; s=arc-20160816;
        b=RYWa5nQGhuZxSdTa8zcKs0e/wUdbS49Q4SUZDBG0+h8/A9YOTNEpoAZ0n6YGgkjf6/
         /vn6YnIA7KiVy4MLpOkwgthy/u0aZmPo1432EjS+pU6AqpKQp8vfeBdHtQRLO6+VKs4d
         0EmdoGVPqWSnKXjRMAl5xiVY7Yj/JkI8XEC1MjIfKdBuZbVABvAHH3BEbOkk1ibjqcdf
         wpVQ1ZgUrNHp+XEYsSw1Llu5jp950UmfT6mQd0KxbJ7vV0iessuOTBtzV/SnS7Wfk0O6
         tEcv+DU9UBUVw8JPtv6qXv6V6M73lGUfS9tdW0j0Y+DpZT4RMU2U2i4NdCDm5P3qJ/JV
         mpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=+me7z+dwUpEe2fwAvOZdeOW2gImMtbBtRipr5AjLnbE=;
        b=X2y7+JTFmfQCQnnPwzcBG832KTqX/A3gY4Rq9oLUKTY6dmzx/o0tPXByEaciUvjv6D
         Mqb/L/zCg3f95SRHbQvwxegtdZ3bzB6fZ+A3eCe/ELp27SDMMmqF67bBH098rJi4t5Ve
         84kBRl2w96xe015KvVIz/CEsPXbl7AVW1xOxhuc/41RveK3HjeQE5/DQxO8xUkyKfQxQ
         gA3mbidJtDHXjFffpxAswQ9pJ1IkQYVrv5YcsaZSDPmxdH163PKuHJSA3iSZ1eB9Y9aE
         2pi8UhWqBTOcU0rGeVMngHRkwpJYC7ibYH7XRLiBfSncLCTPtZF5O4PaFl3fCiVgIema
         YOQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="evA/RJR3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi39-20020a05620a37a700b0074e4a5d1edfsi1215255qkn.706.2023.05.26.02.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 May 2023 02:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="evA/RJR3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2U54-0003pY-7Q; Fri, 26 May 2023 05:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1q2U53-0003pH-IX
 for qemu-arm@nongnu.org; Fri, 26 May 2023 05:49:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1q2U51-0000jl-Ru
 for qemu-arm@nongnu.org; Fri, 26 May 2023 05:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685094590;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+me7z+dwUpEe2fwAvOZdeOW2gImMtbBtRipr5AjLnbE=;
 b=evA/RJR3tjlSV8leTLdUgsBGTzemfTSmkJGRA4fiAey6pOPxMuGRXXjlcH4/JpPv4758hU
 mk72ioCe1idFUDYUw7nOm6dOmNw0DA9AcUBL67WnDHcpsdsYzqDqLZ3iUHfFuoLmnMH4ql
 fPymYSTG8qW+ayVPLmLZBf9BaZs5iI0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-gPuCKQwbPCqKOEfhZXSorQ-1; Fri, 26 May 2023 05:49:49 -0400
X-MC-Unique: gPuCKQwbPCqKOEfhZXSorQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30aa5fb26b3so332862f8f.0
 for <qemu-arm@nongnu.org>; Fri, 26 May 2023 02:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685094588; x=1687686588;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+me7z+dwUpEe2fwAvOZdeOW2gImMtbBtRipr5AjLnbE=;
 b=hQL6DYmUYHP7ewtfDtfyCIovrNoPXc/hDvkICWuPsihIAtscIxnPB9YJJqfcu7qCpB
 sVrXrMU2Y3AzevW/XASX3QItCbBDwF4WppMewlEYUA2o6CRJEwxEaN09q2TnsXyXyc1s
 UrsES+IF1lKFC8hfSi96dhMql5sFGnMDe2aBAfaGToHBVbS9Bdo0qFVmJ8q9lVQzJnfe
 6ART7v3BaGZYVBxjTsnC8gCxnjE6ReZ/rG6MlDnNpjHRD9fk2i9aRJsGCu1XpSZ8s+rr
 Jm98M2sfsXEfLxMs8jdiTmIB+ykaGZdYZ+0F3vn7Vjfqb9taz6h+bPwv1d/VjAymZXGC
 kXgg==
X-Gm-Message-State: AC+VfDy3dWgfsURhSGoyKtVoDyHdmh+y1299Jgmhw2Fn3kSoePg+mwkn
 8IQXGGAiA6QVX3TEv1+/7IZcYA7dVC0KtoDXg7GJv1oPPmlgVQHdMLev9Ut2dYM+tRmRHkObTX7
 DJfmmVaB/YOy1
X-Received: by 2002:a5d:4ac6:0:b0:309:54b6:33b0 with SMTP id
 y6-20020a5d4ac6000000b0030954b633b0mr1161148wrs.44.1685094587941; 
 Fri, 26 May 2023 02:49:47 -0700 (PDT)
X-Received: by 2002:a5d:4ac6:0:b0:309:54b6:33b0 with SMTP id
 y6-20020a5d4ac6000000b0030954b633b0mr1161134wrs.44.1685094587651; 
 Fri, 26 May 2023 02:49:47 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 o12-20020adfe80c000000b002fe13ec49fasm4476397wrm.98.2023.05.26.02.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 02:49:47 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,  qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 01/20] target/arm: Add commentary for
 CPUARMState.exclusive_high
In-Reply-To: <dbb368d0-839c-ad09-01de-09b1a62416af@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 26 May 2023 10:56:47
 +0200")
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-2-richard.henderson@linaro.org>
 <dbb368d0-839c-ad09-01de-09b1a62416af@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 26 May 2023 11:49:46 +0200
Message-ID: <87zg5r1kxx.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W/VkPnLIKx9m

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Hi,
>
> On 26/5/23 01:25, Richard Henderson wrote:
>> Document the meaning of exclusive_high in a big-endian context,
>> and why we can't change it now.
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index d469a2637b..4e16eab82e 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -677,8 +677,15 @@ typedef struct CPUArchState {
>>           uint64_t zcr_el[4];   /* ZCR_EL[1-3] */
>>           uint64_t smcr_el[4];  /* SMCR_EL[1-3] */
>>       } vfp;
>> +
>>       uint64_t exclusive_addr;
>>       uint64_t exclusive_val;
>> +    /*
>> +     * Contains the 'val' for the second 64-bit register of LDXP, which=
 comes
>> +     * from the higher address, not the high part of a complete 128-bit=
 value.
>> +     * This is perhaps confusingly named, but the name is now baked int=
o the
>> +     * migration format.
>> +     */
>>       uint64_t exclusive_high;
>
> Can't we rename the field if we add the old name to check_fields_match()
> in scripts/vmstate-static-checker.py?
>
> Juan, could we store this renamed information directly in the code in
> VMState? Maybe adding some VMSTATE_KEY_ALIAS(_old_key, _new_key) macro
> and have the migration/ code magically deal with that :)
>
> I.e. here:
>
>   VMSTATE_KEY_ALIAS("exclusive_val", high_addr),

You are asking for magic?
In VMState, that nobody understands.

Sniff.

I remembered that VMState only cares about values, not for field names.
We can rename fields without any trouble....

Until we arrive to dump_vmstate_vmsf().

But I think we can have both things, the only thing that we really care
about vmstate dump is to do comparisons.  And for doing comparisons you
should be using vmstate-static-checker.py

That already have support for this.  Look up:

check_fields_match()

and see how it renamed other fields.

As you know better how to do this, can you play with the script and see
if you can get what you want?

If not, I can try to modify the script to get to what you need.

Later, Juan.

