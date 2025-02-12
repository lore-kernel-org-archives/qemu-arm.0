Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp942908njb;
        Wed, 12 Feb 2025 04:03:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWI5ZWYi1GbUNh7m7TIq2CI9/d+6KQ89HK64Q7SbZrYCBM1lGXPqiSMyWlYkjJzAUUnt6N3BBpcp74gbA==@linaro.org
X-Google-Smtp-Source: AGHT+IHMsgmigtP8UUR2ytSBJdcpcg3kH9Y/Q2+X5E53HtEAIqpfIJPQosyYoP1H4jOWU0NRbXjZ
X-Received: by 2002:a05:6102:2c84:b0:4bb:eb4a:f9ec with SMTP id ada2fe7eead31-4bbf22df260mr2217741137.16.1739361788815;
        Wed, 12 Feb 2025 04:03:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739361788; cv=none;
        d=google.com; s=arc-20240605;
        b=G6EeBBK450yNALMaLCe+mxCODnEiyeBuByPLFpK8I/lxcaHLNCugn0waIaNxfQzEYD
         gnmYQPZ43B8wjla4eRDLWXCVcBSrpjWL8VhjedP7Oh6QYwwwu0uzuT/ffg4qxCIEWKQ3
         8IYk34SWuJadQ6AUL0+yyLFm4QUPULBGGnkpwpUunDOFxqbYP+KWx4OXlghJBBBLtb6j
         OBY8UGyOXM1kVFr9vZcVLLamSGt1IccM+SwjvAX3e1uWsyuDzukRq/zeDQ0BtZNzkUnZ
         Ru1qcXEP/AM+QbovESb0dkoM7XPqtXRCtQsRGayLcMzpPhwFcJ+99blvYXEb0mCen6lz
         fuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Basu0NzGRbdjUqVR/+YNCnEJIE3+3Y+dcbfNVJalzX4=;
        fh=aHBhpIUlUNxBpmqOWe85+i52M0eT8kcB84HJUG13R7g=;
        b=AwMd9dKbIUIJwWF+evS3h5Lj925wh0UXpe7rYRlZYkAM2wqd4KefFgjVK8OwdfKjof
         7sPzfkc/SnX7v9c4dXkoPfr0Eymkw4z1zIY+8T4thlNfjR+7cayq/k4+uWy0kjKkeIEu
         Hj4dEzLJMbGYf3eHvihm8uL8ufpNjzQ24zj7F5w7oKg127SbuaZw/XqZPQ+30BHtYua4
         qauqO+/FFj9Jo70+m0HT+d7VqnP7DvagvVbIK9BUb4JG1VIQXOhB+8Z/WO9+rVSdPeco
         hXhSyddG2MgiTzWTKbRh5WSwU1WRsz0rZz6Va6uTh9tDu30xC/g7IOuZV/sd4KoJWoR2
         qh9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wgq0ikOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4bbb5a0e655si1795858137.173.2025.02.12.04.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:03:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wgq0ikOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiBSD-00085D-7S; Wed, 12 Feb 2025 07:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBS5-00083f-2H
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:02:49 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBS1-0005Uh-3s
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:02:48 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5de849a0b6cso5952378a12.2
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 04:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739361758; x=1739966558; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Basu0NzGRbdjUqVR/+YNCnEJIE3+3Y+dcbfNVJalzX4=;
 b=wgq0ikObQGzOURXDlfJtz0mPyMs7hKQbsdDKhPoS6l0v1Dwigk5Ao2G/ZuTNQKAHPq
 C3knENWrG2HuXOLUv88H6DUcOlvlIE1kcwvAUgAB6mIYP5P37XTO4q8VrWx9F9GZRO1T
 yh5sAqt8fYxLG1Fvscc/fRQ1biBNEyCECm/M0rm3DNXaPwmuxzavL3DVielUIo+RWlmG
 P8lZd0dngx4eCBQwT89JqnLqy55/A3+AwgcEFku++PwpTJev0aZh0z2NMb/ai9yhO4TE
 cHYgJYIfxiYxO0AekJROR2nCyJMvjk9R3t1ixa6JTT/UHgDckfotJR6Jjv9pfAucWn4V
 KAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739361758; x=1739966558;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Basu0NzGRbdjUqVR/+YNCnEJIE3+3Y+dcbfNVJalzX4=;
 b=Mz2/JPCJS+uMGn8iG5IsOT0ET6+eED4RMq2Yg/Mjgh0Tf0qVY2h8gYNKEbIfIMVgl4
 XtYH6AZg7Zv4mBswEIPq2AoKluivH6aNtFo2rnLiuEo897Kf7dCJ6X7gn8+yZBy/Fkfj
 n6TT4+Nt6TcQu/wLp12/1dxYyeC8H+xY9MgUT2nJ5N5LqgwAiJIhcxmtVnTUiJlo5hrc
 p4CqF6MjJ+kHtw3ikEp0JHPJJW8zN8hiFWx0IpvwEkTWG5tXyLcrKlPbyLC10RQugpag
 zEZbvUz59VoHh9VOJIMa4uweOlOyq4Ki5sVNtWwysnU9zpLbUGhU4r5IpBgA/Wei8M55
 IekQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVODsgxt7JJWKpE6PToga5GNKowI1YoRCcgRPT8uh4RhuDQp19vEJSkGYuGgJ0xNDxMRwHawHt2nw==@nongnu.org
X-Gm-Message-State: AOJu0YywrBbGfEzLmfKSUW6l/bUO9pvB22QjnsORMgRBJRHWusS8keeu
 NihRkeHKsmtgWAk7Z9ZmiAhqKLVCffKvHSf568J+zPhA15WlfP3uSf4SYlWkWE1yvt5TuahbhRu
 y+hY=
X-Gm-Gg: ASbGncsZa6NRQCkcOaUtNfnIsKbmtDXej45uSlOC59jmAsI5e8hKsrSFucp/95RmqK/
 lrNbU19zqASWJhv6jcLvTTuXRN2eYSfN/UcOjEJCD9Y4cqydlDMUCO+IQGWFMrivp/w/Lj1Zk7J
 Ue5izNpfqdel3KXGcMP0E39wUYD6l3Jjzk+rKum9y5BqOOPpoAdqXm9iStibmHbmWP8h6ZWL9Pm
 aLFd7GNNEFEZhkbHwSJkzYEfKNoML6rqyx/+lnPW3BuOXzh6VSnEfSFH+ZttXRYuKBn+zBq1VBA
 6wbZPGNv5x2JrUt3WUjiGYH09pLYYhfrayBaxG4DimmTdzXK0SmnOSZJozA=
X-Received: by 2002:a05:600c:4e8d:b0:439:4a1f:cf8b with SMTP id
 5b1f17b1804b1-439580e73femr31401585e9.0.1739361739588; 
 Wed, 12 Feb 2025 04:02:19 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd7f039sm17595138f8f.59.2025.02.12.04.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 04:02:18 -0800 (PST)
Message-ID: <24377a63-0772-4dda-875d-2c4fddd1bbca@linaro.org>
Date: Wed, 12 Feb 2025 13:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-2-philmd@linaro.org>
 <cb828dd8-25f6-47c6-9ac7-cae5b0d0932e@redhat.com>
 <50ba4e4b-4124-46bb-bb84-4758ce9c5e66@linaro.org>
Content-Language: en-US
In-Reply-To: <50ba4e4b-4124-46bb-bb84-4758ce9c5e66@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qZYVrAqJjigo

On 12/2/25 12:43, Philippe Mathieu-Daudé wrote:
> On 12/2/25 12:37, Thomas Huth wrote:
>> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>>> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
>>> Endianness can be BIG, LITTLE or unspecified (default).
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   qapi/common.json                    | 16 ++++++++++++++++
>>>   include/hw/qdev-properties-system.h |  7 +++++++
>>>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>>>   3 files changed, 34 insertions(+)
>>>
>>> diff --git a/qapi/common.json b/qapi/common.json
>>> index 6ffc7a37890..217feaaf683 100644
>>> --- a/qapi/common.json
>>> +++ b/qapi/common.json
>>> @@ -212,3 +212,19 @@
>>>   ##
>>>   { 'struct': 'HumanReadableText',
>>>     'data': { 'human-readable-text': 'str' } }
>>> +
>>> +##
>>> +# @EndianMode:
>>> +#
>>> +# An enumeration of three options: little, big, and unspecified
>>> +#
>>> +# @little: Little endianness
>>> +#
>>> +# @big: Big endianness
>>> +#
>>> +# @unspecified: Endianness not specified
>>> +#
>>> +# Since: 10.0
>>> +##
>>> +{ 'enum': 'EndianMode',
>>> +  'data': [ 'little', 'big', 'unspecified' ] }
>>
>> Should 'unspecified' come first? ... so that it gets the value 0, i.e. 
>> when someone forgets to properly initialize a related variable, the 
>> chances are higher that it ends up as "unspecified" than as "little" ?

BTW I'm not sure QAPI guaranty enums are following an order
(at least, as in C, I wouldn't rely on that assumption).

