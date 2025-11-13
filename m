Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71C2CD8C9C
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 16:12:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJZvR-00024e-Su; Thu, 13 Nov 2025 11:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vJZuz-0001mL-My
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 11:11:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vJZuy-000153-FZ
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 11:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763050287;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuxBfdu6kY0KdaWE7A2OKXKhFmTlP7+laG2mTLCscIE=;
 b=H2d7Dq1S5fqKnIm6gys6EVUZtZ/ZpziKj1ESYgnbZcfcurEhDfvcgMXHclJRiFDzddwBhA
 0lT0/uENWPcjXavJ9HQXzGSt4/NjyIFMaa3rUnA/FpTkmNeWEgk1mETM3J6PJUI/rZsHg9
 mVUihxGvWDzES+UKXHRR5sJEGJoK2Wk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-00ZyjpCOOTOkHgts6Nqrew-1; Thu, 13 Nov 2025 11:11:25 -0500
X-MC-Unique: 00ZyjpCOOTOkHgts6Nqrew-1
X-Mimecast-MFC-AGG-ID: 00ZyjpCOOTOkHgts6Nqrew_1763050284
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-89090e340bfso220881585a.0
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 08:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763050284; x=1763655084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kuxBfdu6kY0KdaWE7A2OKXKhFmTlP7+laG2mTLCscIE=;
 b=gfIKv0V0TI5ODRbPBK+MO9WV4P2X/7L4PjoO8/HA25mZxHYeVTZ3t0IdgKh1HpdBt9
 eWj/JFdVrQ1iXQQedhBnzkloa5RO717yJ6ZDWHXMBdZxHXm8r905CYyh0AYxnMXX7cUj
 J51k31vtg93PPhMfIn1xMtu9ewV4V/pxjnErMFjRBK29dsqR3vF2oiGztlaCckJGi2gX
 mHlLabJnqNrYIsrXcAzTdA2tur6PK5IxdCxLeKfoQHFNG4bly66ltdZeUDiApx9AJbtA
 gpY+V17+nykggA5MuHvrFrkECaAGO8YB+qq7dp6BLzNndlUH7chGmlIElK9jk/vO91w3
 Up2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnUXCb9ACGvHg7Pu7iHwsrKjOVkEh4YVyAun6Z0ce1mh0zbWFV7g4NfF04CeoFzIjkqeilddHEFA==@nongnu.org
X-Gm-Message-State: AOJu0YyxZPQhJ9t7MQLxactq0Jhy9HAZlL/MBqkfs+B6Eovhj6Bd/Q+A
 h3Ppi+3jOFU32xXNNfoMWnke0NqozhuvPzc0lJIcBf/dpcLkBr2f7r934rNDQdOaWJcEldFFbss
 kqclgkz/PKgyI6C/xoc5+jVFEjxI08aefGbQNgZJxu34GSvEoa4MArQ==
X-Gm-Gg: ASbGncvXlrauw6sVrY5yAXStRAoqTyFUvKrdXjK2iiz8uns+b+DapE9cyyVaWWgUly4
 FqpvS67gNw6UGCsgOzYnhH/OeA2j2YeXRl/gxWrOifVVhxfEA55lrBqHvA1NGubpJMIV3NCy/Ge
 LEKEk0FBQpov9kcxZJoeRRGr04f5U/L0/F3Sw+RduD3t8wBfyLpoAtGxzWS0gk8kgZHHB9koBso
 +10zrHotk0uJzyIaZ923WpRizDSSUHYUzsJWF0FAnV1+QWGKpFkg20KyZD+7HFzOP0QWGxzDEwE
 M9wHPl8/JjwR4DxHPwgmQDsRz2mJXC8gs6qJyLtNqCU30SxIGynSGh213uqsD7MV4wydKgs4woA
 2Ml7FYVuFeEzfQiZsVPcslybPMfiKEEmxBEgPolJlexHBqw==
X-Received: by 2002:a05:620a:4726:b0:8b1:be0f:da52 with SMTP id
 af79cd13be357-8b29b76cb38mr964927585a.7.1763050284320; 
 Thu, 13 Nov 2025 08:11:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+YhppjKRVYtghjQNQUOILcFalSAKjrwgJUOiVYlATXBb8dSR3XEP2h1zxVAWnf68zVXrisw==
X-Received: by 2002:a05:620a:4726:b0:8b1:be0f:da52 with SMTP id
 af79cd13be357-8b29b76cb38mr964921585a.7.1763050283791; 
 Thu, 13 Nov 2025 08:11:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b2aeeb1487sm156162385a.19.2025.11.13.08.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 08:11:23 -0800 (PST)
Message-ID: <c3c00640-5d27-4dc5-99af-daf5fa48893b@redhat.com>
Date: Thu, 13 Nov 2025 17:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/7] target/arm/machine: Improve traces on register
 mismatch during migration
To: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com,
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
References: <20251016140039.250111-1-eric.auger@redhat.com>
 <20251016140039.250111-2-eric.auger@redhat.com> <877bwtvaj7.fsf@redhat.com>
 <791e0383-c4c7-49bf-863c-d45428f3e48d@redhat.com> <874iqyrnt3.fsf@redhat.com>
 <CAFEAcA8F2JFR-X9oWH9cX+qESWDUbxfU+ZiPmFg2h05dgb4gRQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8F2JFR-X9oWH9cX+qESWDUbxfU+ZiPmFg2h05dgb4gRQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rXF608Q-F84pQOENwjGyO5XiKcwa2IDTFhF2MwXAm2o_1763050284
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 11/13/25 4:01 PM, Peter Maydell wrote:
> On Thu, 13 Nov 2025 at 14:48, Cornelia Huck <cohuck@redhat.com> wrote:
>> On Thu, Nov 13 2025, Eric Auger <eric.auger@redhat.com> wrote:
>>
>>>>> +    #define MAX_CPREG_VMSTATE_ANOMALIES 10
>>>>> +    uint64_t cpreg_vmstate_missing_indexes[MAX_CPREG_VMSTATE_ANOMALIES];
>>>>> +    int32_t cpreg_vmstate_missing_indexes_array_len;
>>>>> +    uint64_t cpreg_vmstate_unexpected_indexes[MAX_CPREG_VMSTATE_ANOMALIES];
>>>>> +    int32_t cpreg_vmstate_unexpected_indexes_array_len;
>>>> "indices"?
>>> Originally we had
>>>    uint64_t *cpreg_vmstate_indexes;
>>> so I reused the same terminology
>>>
>>> As a non native english speaker I don't know if the usage is wrong. I
>>> thought some references on the net though
>> Not a native English speaker, either; wiktionary says both are valid, so
>> probably a matter of taste.
> Mmm. I tend to go with "indexes" as being clearer (especially
> for non-native speakers) than "indices". Within QEMU sources
> there are twice as many "indexes" as "indices".
OK thanks. I will keep it.

Eric
>
> thanks
> -- PMM
>


