Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp388378njj;
        Tue, 29 Oct 2024 09:51:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDZHEJRVr1twyOBGsxOUQPQB6NgcXLggqzfecrHAgvSNDAAy8dg4tXSZon6+IdsWLEZ3FBleGFUW5GsA==@linaro.org
X-Google-Smtp-Source: AGHT+IGkLSaExqTF4bFuwdZ+dpnDCYnvVIw6uiuEP4sgcrqla8F0ZtimqEsXnnSLLv15L6fGaQA/
X-Received: by 2002:a05:6359:4c91:b0:1c3:724e:f4dd with SMTP id e5c5f4694b2df-1c3f9f615f2mr579539155d.21.1730220666456;
        Tue, 29 Oct 2024 09:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730220666; cv=none;
        d=google.com; s=arc-20240605;
        b=LYd+ZNSwjoNfo9rqABJ/B10wlm7ysLPuWgyplXe3ddTDOx1ZUy6NKIEWVg6pkzmeK4
         G5YaPveRTcod71bV0SMFBWaGhlMHvtsOrS7Kuj3mGXC7QPJuBg5IVbr34OZGGar6e92M
         rAFRmpf12i8Cy7o/Cn4WsBqV/GpQI5B/NIoZBV1i83DBlKDPjvvYVC8jfUmUIh88hKAD
         LNDsFteVowHW2u+UZ7yOZp4DmpyON75hl15MN/6X/PVRf0G+QyWHGNeEFPll9t2Apfk/
         mGfA9ibOK1ebndBumcT7wvRtldpK7oRVwOujY/R1ecu/mgJK1t3PRc3Mk0huTiaQi4jV
         1ygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=DrSU8xJch8PzoJDY19shLfpYcCtp3lOt9na6cdeE2VQ=;
        fh=I4/5dneAOm+A3CgiQUuMFCjJ5P1aye68EGC0+qrsfzs=;
        b=k/enNwIMVwulOkuqX1+zn/cYWkdLCyhXBdPhW+y7u98LBGclzggUEI6FDGMOy3zDmj
         frw2/Sm38xAovYWzXtCowUl/m3mi6xrapucVH6Jk2cYVYOjoAJQH1DO0r4YYwuQTUtX3
         3uWR+SsVG//CjzSWkZDzncwbgoGIl4wk+SLcKCI1q0Y42p82jJrewWJqMLa+bUqPYIie
         9cW4/0j/0j+8VXeaHth4gPyBtRDEx34IZdL/Zd8LEenWITp85/gSdUYTHkIfxDxv+ZQq
         Wf6/t7/BybQFMCFwfXMDCbpACeK+VauUzJu8K0xxN1vIiq5vpap/raTz/Z+t3kXOuGxf
         jTJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kjh68D+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-461323c736fsi109883141cf.590.2024.10.29.09.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 09:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kjh68D+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5pQq-0005LX-EK; Tue, 29 Oct 2024 12:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t5pQo-0005LG-Tj
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 12:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t5pQm-0002xU-8E
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 12:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730220653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DrSU8xJch8PzoJDY19shLfpYcCtp3lOt9na6cdeE2VQ=;
 b=Kjh68D+qFM3YwFM6BzR8lyXyhSX80/htTyln1dIwpkS1EG0OKKM/cViGgvdkuDJcEC/t+r
 tLwarnU3sKye3+bLp5JYwhGyw4cwYpwFrVU9+Myfyw5YJBPObj/zgYRtz/5+yTXnWLjNMv
 BPSIygUmiQtPh5J0QrNteZjwtqPZIF8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-EjGH0w11PDe9XI5rRvo7YQ-1; Tue, 29 Oct 2024 12:50:52 -0400
X-MC-Unique: EjGH0w11PDe9XI5rRvo7YQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-539eb3416cdso4850026e87.1
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 09:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730220651; x=1730825451;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DrSU8xJch8PzoJDY19shLfpYcCtp3lOt9na6cdeE2VQ=;
 b=S6FWtVaVnad24tDmlp7+EwLp0dJhOieCyPjocFTAqEedBvigLu5ZM3OXy9YRlWWaJT
 DkOGSswPjg1+cXyPfW1Yxggw7XsppAWgmygbhtuYgGNToG8wKUa4VP7JEtudytvoY89Y
 2dhfsRZypf4DMiAtYpev7UES1DNkynrnZW5nHwqVrMalsCfx6EtE6d54LPWYPIR8ESBu
 w4Ja1PXjRg3M5Db2gyfnF6XqCrK3gH1wwk68J8wR/dJGP2fVr+vjXY1NTwSbAg4D6GRT
 jDk/c9ahet3YCD9QkW24U54Oih9Fix6UhXBonokzxeBkKBnsgguBTXaxF9ZaTAhmWRy7
 CnXA==
X-Gm-Message-State: AOJu0YwVd8vcHSRXxGZfL244CouxD9UXRHP52kIyJ2fCF4tNYAVW4eIS
 IW3dI8gxqFUcilIYJm68OK+qpt1SrV2TzWT/wmZ2Y7tp1BOmOHGqP/DnYNVV5pBY98XcFAN5b2v
 CyDjfFAqbb0GfP1se7Qi2SJflP20zt2Nv4LJaK9BslFgkxKeVlA==
X-Received: by 2002:a05:6512:3d0c:b0:539:f8da:b466 with SMTP id
 2adb3069b0e04-53b348c37cemr6208955e87.11.1730220650926; 
 Tue, 29 Oct 2024 09:50:50 -0700 (PDT)
X-Received: by 2002:a05:6512:3d0c:b0:539:f8da:b466 with SMTP id
 2adb3069b0e04-53b348c37cemr6208935e87.11.1730220650463; 
 Tue, 29 Oct 2024 09:50:50 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-48-251.web.vodafone.de.
 [109.42.48.251]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573551sm150377115e9.6.2024.10.29.09.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 09:50:50 -0700 (PDT)
Message-ID: <c95b7e5f-0345-4648-bae7-285ecde8dfd8@redhat.com>
Date: Tue, 29 Oct 2024 17:50:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Convert the BananaPi and OrangePi Avacodo tests
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Joel Stanley <joel@jms.id.au>
References: <20241029092440.25021-1-thuth@redhat.com>
 <c5ff463d-c5fb-4d00-95fc-f3c3ce9178d5@linaro.org>
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
In-Reply-To: <c5ff463d-c5fb-4d00-95fc-f3c3ce9178d5@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.302,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: xUcCXeSkA0OJ

On 29/10/2024 17.31, Pierrick Bouvier wrote:
> Hi Thomas,
> 
> On 10/29/24 02:24, Thomas Huth wrote:
>> Some of the URLs in the Avocado tests stopped working since the
>> original assets have been removed from the servers or moved location,
>> see:
>>
>>   https://lore.kernel.org/qemu-devel/CACPK8Xc=jsz5iT_WR7s- 
>> rcu1cRzryiK+-0o=6vUK_D_qMMrP3A@mail.gmail.com/
>>
>> Since we are currently in progress of converting the Avocado tests
>> to the new functional framework, this is a good opportunity to convert
>> these tests and adjust the URLs (and hashsums) along the way to make
>> these tests work again.
>>
>> Thomas Huth (2):
>>    tests/functional: Convert BananaPi tests to the functional framework
>>    tests/functional: Convert the OrangePi tests to the functional
>>      framework
>>
>>   MAINTAINERS                           |   1 +
>>   tests/avocado/boot_linux_console.py   | 411 --------------------------
>>   tests/functional/meson.build          |   4 +
>>   tests/functional/qemu_test/utils.py   |  21 ++
>>   tests/functional/test_arm_bpim2u.py   | 206 +++++++++++++
>>   tests/functional/test_arm_orangepi.py | 270 +++++++++++++++++
>>   6 files changed, 502 insertions(+), 411 deletions(-)
>>   create mode 100755 tests/functional/test_arm_bpim2u.py
>>   create mode 100755 tests/functional/test_arm_orangepi.py
>>
> 
> I have a general question regarding tests in QEMU.
> Is the current goal to convert all avocado tests to functional ones, and 
> then remove avocado from codebase?

Yes, I think that's the best way to move forward. It's weird to have two 
test runners in QEMU for the tests, and since we're already using the meson 
test runner for almost everything else, we should continue this transition.

  Thomas

