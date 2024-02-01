Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp439645ejb;
        Thu, 1 Feb 2024 10:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0hYfhND+h/vAp9Cy5T/7V3AYBtA8zps52Zj7liIW3IIIfqEXMPjnVH1mZD5bv+pX5o/3s
X-Received: by 2002:a05:6870:e411:b0:214:fd41:f449 with SMTP id n17-20020a056870e41100b00214fd41f449mr6091639oag.35.1706813612092;
        Thu, 01 Feb 2024 10:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706813612; cv=none;
        d=google.com; s=arc-20160816;
        b=Sdg+nEHP1hmWIHJFR88SNQlsciAOyJfTu/swqAjWzL04GMfMB0elvOFb1zs0fhPkKZ
         aSrFiAlF+DJex3RiWmwmAcDLA+RHDH3K9FjGZy2NqNzV9UtJyWNO1c6CUpJ4wrwmS3K9
         oaFBNFun4SKDNDU+wcqVRtQArx66bfXaiOnBRWy2wAdgWy+yt91JRDmAGSMqZbz71SHx
         7eAwk/uF5NBTblzpGN+Son8GjOHNENT4JrVdvZueaIDSwSoyKCYKpOzgtmQr6s8EZ4di
         tHV6FMrUJW27GlllQk1Wm9EhrWROpywIiQroV0Ak3MKiBxEMROeyWn/rr1INb51tUAlV
         gXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=fT5v8IMyIAf/RHy2BqiO1lvyiu0e8BmCwKjeDEOSvu0=;
        fh=K2TasX/cR4Ek9e13NrsukGNMCaIVCgtMfWctH8C3gL4=;
        b=WTlY8j3Bfkb6fvs24jsReZ+8PuT/KRV1mcY//2Pw2KJ42ajbWIjJgqyiOCMZwpLzuw
         ugqni1eqdhT6gYI5/FMPbFL04HQQx+abCPb2JEB7FLVbyY6K5Mz6hPY9pLpM999ypLLE
         RDjtH3/gwaRWfIcaj8gdNOIdxZWMLOVs020I/pX6A0t079m2u9tUFLEXTsJzcdhTk7uG
         ch9HCGE4+lcb16216LRGGbaBDpXO4bJ7V+oS+RH1SK1zwKVyyPfUyd57S5fzVKrdp5Bc
         dRGw+6057P1F2OSE/i6taArl7ZCFs3CdQ8GPs+eiQV/MFd3ihGIWEVBxBr0j89+6CQmY
         vi4g==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZeyeRto0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCXKgXZ+mU8HM1DB+8isErRlS0fa4TA+nLL6Gl3J7Uy7DshjtPa4+XY1gtCzeIQy02L09yIUD6SE1Ze6EBzyjb7CcNydhqx8
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5-20020ac85cc5000000b0042aa8920a24si87454qta.499.2024.02.01.10.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 10:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZeyeRto0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVcBW-0002sI-JR; Thu, 01 Feb 2024 13:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVcBT-0002rA-45
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 13:53:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVcBG-0001kT-Hw
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 13:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706813577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fT5v8IMyIAf/RHy2BqiO1lvyiu0e8BmCwKjeDEOSvu0=;
 b=ZeyeRto0gtv3MQJH6lDIjZGCN/bRw0TIsxYkaqra+9E/d8GHW0XH5ZmT1WBdYbzDjf6+1M
 2Qe4/soZUFAgLrYJisJOzHsmrr9uzw9gthG9uMJv9Jwr2yMsecxvHp8Sf0QiaA+brBdHvQ
 AxXfUCBfgTZ0KApYXYzI+5oud95vKM8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-36EDbdYgNjegnNZ4Qe8CdQ-1; Thu, 01 Feb 2024 13:52:56 -0500
X-MC-Unique: 36EDbdYgNjegnNZ4Qe8CdQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a35247a5d8cso117201066b.2
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 10:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706813575; x=1707418375;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fT5v8IMyIAf/RHy2BqiO1lvyiu0e8BmCwKjeDEOSvu0=;
 b=ua93omCTDwmO06jUEr2MJLJ0KRoe0m2Xb3a2S04Fo2uhPk5N9roR0h0+zPqgydzqXZ
 Thk4rLEgygxvYG3Y77McJaWMgguG4vgyKRRfvqbi8yiQlF22FCycweKNhoP358CCpn6+
 0eZyiNsImhUREUZWYKmu7FMpCuKrgcICbnNGEHL4GO+acHWh+oPyMbtRA4ab00dWLGGJ
 y4ubDIpWFP3S12QElqmCTOb7npgflSHqz9KQX8FoV3yOVQItv2ebSkgm9Ha42rE1nLuy
 3rKLzxezabv0cjhUTINNQhZ8UAdZ5Jd+Iuasn/BmelY4aWk13QtqVmgugDqsDQg0mp/D
 uU2w==
X-Gm-Message-State: AOJu0YzGaYY7oWBys/FnBgbQBcCytnrVpUAcsTHoxtQ7EYDCRPqI6o2/
 pEWG/qInhb8UuwSrv1d8/HEnpDl5tl1aq3JsWUB0NwXcY5heB5i+lkKn1teP57IJEUmj15xKUeB
 Xagoyn8KjXHHZhWsmmVriOPti0g4XLG99yj4/PZ0gZq+NPYWhOUfFB4HYFg==
X-Received: by 2002:a17:907:7711:b0:a36:f27b:f0f with SMTP id
 kw17-20020a170907771100b00a36f27b0f0fmr194923ejc.8.1706813575097; 
 Thu, 01 Feb 2024 10:52:55 -0800 (PST)
X-Received: by 2002:a17:907:7711:b0:a36:f27b:f0f with SMTP id
 kw17-20020a170907771100b00a36f27b0f0fmr194917ejc.8.1706813574780; 
 Thu, 01 Feb 2024 10:52:54 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXxZv2MrU2299Bmry3ybx3PeEl3cmuTpEh0P9UfW/AwxnSuNGDzLT4g6cInxFSBRdOHyovXQkF9SGjNt5tAJ8V4hJovtjug79YW/YFiCuX2crvyxgA4TzJF2DayoLW21qP0O/5bPIZUKK4=
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 v9-20020a1709060b4900b00a35cffe5498sm59030ejg.181.2024.02.01.10.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 10:52:54 -0800 (PST)
Message-ID: <5553d942-5da1-4930-b404-2b71a6fd37ca@redhat.com>
Date: Thu, 1 Feb 2024 19:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] target/arm: Move v7m-related code from cpu32.c
 into a separate file
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-2-thuth@redhat.com>
 <CAFEAcA_mf-iGD_P3DB=dw4n=qpFyNODtAz1jFKUdjFkM1eWVuQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <CAFEAcA_mf-iGD_P3DB=dw4n=qpFyNODtAz1jFKUdjFkM1eWVuQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 8U8/CE9vBgEZ

On 01/02/2024 15.17, Peter Maydell wrote:
> On Mon, 29 Jan 2024 at 08:18, Thomas Huth <thuth@redhat.com> wrote:
>>
>> Move the code to a separate file so that we do not have to compile
>> it anymore if CONFIG_ARM_V7M is not set.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   target/arm/tcg/cpu-v7m.c   | 290 +++++++++++++++++++++++++++++++++++++
>>   target/arm/tcg/cpu32.c     | 261 ---------------------------------
>>   target/arm/meson.build     |   3 +
>>   target/arm/tcg/meson.build |   3 +
>>   4 files changed, 296 insertions(+), 261 deletions(-)
>>   create mode 100644 target/arm/tcg/cpu-v7m.c
>>
>> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
>> new file mode 100644
>> index 0000000000..89a25444a2
>> --- /dev/null
>> +++ b/target/arm/tcg/cpu-v7m.c
>> @@ -0,0 +1,290 @@
>> +/*
>> + * QEMU ARMv7-M TCG-only CPUs.
>> + *
>> + * Copyright (c) 2012 SUSE LINUX Products GmbH
>> + *
>> + * This code is licensed under the GNU GPL v2 or later.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "hw/core/tcg-cpu-ops.h"
>> +#include "internals.h"
>> +
>> +#if !defined(CONFIG_USER_ONLY)
>> +
>> +#include "hw/intc/armv7m_nvic.h"
>> +
>> +static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>> +{
>> +    CPUClass *cc = CPU_GET_CLASS(cs);
>> +    ARMCPU *cpu = ARM_CPU(cs);
>> +    CPUARMState *env = &cpu->env;
>> +    bool ret = false;
>> +
>> +    /*
>> +     * ARMv7-M interrupt masking works differently than -A or -R.
>> +     * There is no FIQ/IRQ distinction. Instead of I and F bits
>> +     * masking FIQ and IRQ interrupts, an exception is taken only
>> +     * if it is higher priority than the current execution priority
>> +     * (which depends on state like BASEPRI, FAULTMASK and the
>> +     * currently active exception).
>> +     */
>> +    if (interrupt_request & CPU_INTERRUPT_HARD
>> +        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
>> +        cs->exception_index = EXCP_IRQ;
>> +        cc->tcg_ops->do_interrupt(cs);
>> +        ret = true;
>> +    }
>> +    return ret;
>> +}
>> +
>> +#endif /* !CONFIG_USER_ONLY */
> 
> I wonder if this function could go in target/arm/tcg/m_helper.c:
> it looks a bit odd in this file, which is mostly initfns for
> specific CPU types. But it was in cpu32.c so I'm happy that
> we just move it to cpu-v7m.c for now.

The only user of this function are the arm_v7m_tcg_ops that are defined 
later in the cpu-v7m.c file, so I think it makes sense to keep it here.

>> diff --git a/target/arm/meson.build b/target/arm/meson.build
>> index 46b5a21eb3..2e10464dbb 100644
>> --- a/target/arm/meson.build
>> +++ b/target/arm/meson.build
>> @@ -26,6 +26,8 @@ arm_system_ss.add(files(
>>     'ptw.c',
>>   ))
>>
>> +arm_user_ss = ss.source_set()
>> +
>>   subdir('hvf')
>>
>>   if 'CONFIG_TCG' in config_all_accel
>> @@ -36,3 +38,4 @@ endif
>>
>>   target_arch += {'arm': arm_ss}
>>   target_system_arch += {'arm': arm_system_ss}
>> +target_user_arch += {'arm': arm_user_ss}
>> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
>> index 6fca38f2cc..3b1a9f0fc5 100644
>> --- a/target/arm/tcg/meson.build
>> +++ b/target/arm/tcg/meson.build
>> @@ -55,3 +55,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>>   arm_system_ss.add(files(
>>     'psci.c',
>>   ))
>> +
>> +arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
>> +arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
> 
> Why do we need to add this new arm_user_ss() sourceset,
> when we didn't need it for the A/R profile CPUs?

cpu32.c gets added to the arm_ss source set which is linked into all 
possible arm-related binaries (qemu-system-aarch64, qemu-system-arm, 
qemu-aarch64 and qemu-arm).

The goal of this rework is to have the v7m code only linked into the 
binaries that need it, i.e. qemu-system-arm/aarch64 if CONFIG_ARM_V7M is 
set, or the 32-bit qemu-arm linux-user binary.

> What goes wrong if we add it to arm_ss() the way we do cpu32.c?

The problem is that CONFIG_ARM_V7M is not set for the linux-user builds, so 
the code does not get included in the "qemu-arm" binary anymore.
Now, the obvious answer to that statement is of course: Let's add 
CONFIG_ARM_V7M to configs/targets/arm-linux-user.mak, too! ... but I tried 
that already, and it also does not work, since then we'll suddenly try to 
include the hw/intc/armv7m_nvic.c stuff into the qemu-arm binary, which of 
course also does not work. It might be possible to rework that by moving 
armv7m_nvic.c from specific_ss to system_ss, but looks like that will 
require a *lot* of other reworks (e.g. arm_feature() is not available for 
common code). Another solution might be to move armv7m_nvic.c into the 
hw/arm/ directory and add it there to arm_ss instead ... it's then a little 
bit weird that this is the only interrupt controller there, but at least the 
changes would be quite trivial. What do you think?

  Thomas


