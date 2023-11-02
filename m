Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp177316eja;
        Wed, 1 Nov 2023 23:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhxIRi2zufEBESdyqVq/JjYt70Ik3f9kQwjUjOLfc4yCBHA5R9zfhJVcJWJzx1SHAjD9fP
X-Received: by 2002:a05:620a:2984:b0:775:9a7f:71e with SMTP id r4-20020a05620a298400b007759a7f071emr18740213qkp.50.1698905912871;
        Wed, 01 Nov 2023 23:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698905912; cv=none;
        d=google.com; s=arc-20160816;
        b=zutl6z1YSjGmsfqzRvDPvqrPXbEYONQh2BUqkCkFYHIfXzsNaLDxvN60I+dHMNjIVR
         m98RB/liAcI5jUZQP7X/c1O7kkMWFjLYMSS4iOmgWHScgLCW7cgU9B9OfvCl+mal14Rr
         YtmD7w37PZMjyEH9YqGkooURCkzVuTu0LPjpUgHzOoeAwTA133D+x758X5kpuLQktBHV
         q8gieL+9usHYCkfUImVgAlevm9jDsTW6tEqwBByH/v8njBW0vz/vQyPQSYPwmDlwUMmt
         f9aedjdO5qRScTdo0TM8s+cEl0aRfRx8uqj6DUM2QSQtQN6fpQw1aUH3/D/kZJjB/tg+
         iMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=BOf8cuRnDkJzwRqae8MAnaJxWiCBQCaA6++iLILW2GM=;
        fh=DuEaqkrjC096WqKe5kAiiFohIK1bqLCXeTtEKvSjoDg=;
        b=fs2litbh0vb1RKroIaKFAN9cAIZPM219Ge8P+xtz4u65lS+6ah2Hrze5X7R9FOA+G0
         X+Fkj/yDF+n3gr7uB4RF209OeDFYmJPb1Sa8Zi0rLHBX7oXx07OtmLm8QNsFW3j066JT
         qiopzkHrxwBlcXkxVci0lkYluk7tC28e8FnLuVSyzoPJq9gdbJgvwD8UdQYTIEqA8tx+
         Z3AxNxJzuosFbzTXEIXIPu23UkhXZo2fxfTYDj0ennupH332aiSniJUY4rAoJJBWCVat
         ZRvZfBYHlF0Va5y3AknIo9naUPx9iLgs2xP48TgYn/ncN+pdvqV6N2z54/syfABzTJTH
         srHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPEPihYY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a284c00b00768307e4c1esi3827543qkp.77.2023.11.01.23.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 23:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPEPihYY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyR27-0007ay-ON; Thu, 02 Nov 2023 02:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyR26-0007a3-EY
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 02:18:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyR24-0004Yu-J8
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 02:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698905898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOf8cuRnDkJzwRqae8MAnaJxWiCBQCaA6++iLILW2GM=;
 b=WPEPihYY6cgi/03gqEJLQKicvzBArL7CKcLDCJjuvNM5IKAnzMqRWIGwLAGonqbW34kRjF
 wm7FhgPLx1/7XlEnOpnj4nTGt8WBQj5/+CcS69ghhIdr3ivkZY/qm+jrKv7ZdCRIsYMxA1
 +mt7KN64M7zCCq6gAX4+5HbNnwcwrIw=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-mmRbxWs0NLalpTsmplmUkA-1; Thu, 02 Nov 2023 02:18:17 -0400
X-MC-Unique: mmRbxWs0NLalpTsmplmUkA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1e98a9dd333so743286fac.2
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 23:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698905896; x=1699510696;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOf8cuRnDkJzwRqae8MAnaJxWiCBQCaA6++iLILW2GM=;
 b=aq7kvIdwk28m4qvlYuJ1hnQ4l2xyexaz78KiQ2kU/Iwf3SdZRPqJgkJUUp5wA6vzXa
 JMdXm1lNYbCph8lRfifoVD+YwO0OOE1xt8AQ4vayep2F8xfBKzJ27YSKOUXjjixLInWt
 CVIm3zpk1eGpQDEQuzQy3N79G29rzZWt83hr8pmjVcq/NzSZFFlPsUesqEpANDYAihmi
 u0gDAONLgkLu4HXkRr4d6VHI07TJZAnXiXRJOjmCqxjoAzZq35rI4KCNvZSUkCvvoa3u
 +gFGvxWF+Tod0I5kj4htZdI/Xx2nZQJiXa/bCvdi6zESR8Nqe9RDJkJ+9LB2shLNov4g
 uFUg==
X-Gm-Message-State: AOJu0Yy68h7Yk19asaSxy0tZEPMi8zHWpi98BV9EpgCfSP1MGHB5xnEh
 DGd0yX4mVrwBBqK121x/hIyWUuPlOVhn9dT5QCGolNj36C1BrbOp+ZsUUj8JX/trvFMg9TKm1fh
 mtvzmE4KHS7hk
X-Received: by 2002:a05:6871:2511:b0:1ef:391a:4382 with SMTP id
 yx17-20020a056871251100b001ef391a4382mr15005197oab.30.1698905896498; 
 Wed, 01 Nov 2023 23:18:16 -0700 (PDT)
X-Received: by 2002:a05:6871:2511:b0:1ef:391a:4382 with SMTP id
 yx17-20020a056871251100b001ef391a4382mr15005190oab.30.1698905896206; 
 Wed, 01 Nov 2023 23:18:16 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 j63-20020a638042000000b005bd2b3a03eesm233575pgd.6.2023.11.01.23.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 23:18:15 -0700 (PDT)
Message-ID: <46536a3a-873b-4769-a96e-1a2b0afd0f4a@redhat.com>
Date: Thu, 2 Nov 2023 16:18:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/33] target/alpha: Tidy up alpha_cpu_class_by_name()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-2-gshan@redhat.com>
 <1a744365-19e4-4ab0-bab5-11dd19bb126f@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <1a744365-19e4-4ab0-bab5-11dd19bb126f@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CsFlv5Ozpb31

On 11/2/23 13:43, Richard Henderson wrote:
> On 11/1/23 17:24, Gavin Shan wrote:
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> For target/alpha, the default CPU model name is "ev67". The default
>> CPU model is used when no matching CPU model is found. The conditions
>> to fall back to the default CPU model can be combined so that the code
>> looks a bit simplified.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/alpha/cpu.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
>> index 51b7d8d1bf..c7ae4d6a41 100644
>> --- a/target/alpha/cpu.c
>> +++ b/target/alpha/cpu.c
>> @@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
>>       typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
>>       oc = object_class_by_name(typename);
>>       g_free(typename);
>> -    if (oc != NULL && object_class_is_abstract(oc)) {
>> -        oc = NULL;
>> -    }
>>       /* TODO: remove match everything nonsense */
>> -    /* Default to ev67; no reason not to emulate insns by default. */
>> -    if (!oc) {
>> +    if (!oc || object_class_is_abstract(oc)) {
>> +        /* Default to ev67, no reason not to emulate insns by default */
>>           oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
>>       }
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I assume this TODO gets cleaned up later?
> 

Let me drop this TODO in next respin.

Thanks,
Gavin

