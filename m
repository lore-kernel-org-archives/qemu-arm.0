Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp51274njb;
        Wed, 4 Sep 2024 02:25:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9IimyFyjqLERGMgSR4HgLvcknH6eH4mddjGG7NL0UdRewfryYBp4jNLgT7TG1wdQ57pMzKYUSpJiUCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFmLHcI//4oqluIjBdo9G0WiVIrf+uQ7xNtf3kzYDu4P3Ixcem1DuVCjZ4aAO9TWOxPTvdy
X-Received: by 2002:a05:6122:7c9:b0:4f2:f1f1:a9f2 with SMTP id 71dfb90a1353d-4ffe4a7d39dmr22345097e0c.4.1725441941503;
        Wed, 04 Sep 2024 02:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725441941; cv=none;
        d=google.com; s=arc-20160816;
        b=ClhmaDsgOLgcoblDjp1tfFHuSw+XLvhVi8Qb2vLmVVzP5IN/JYg5QgQbFYdVjjcUtn
         8zGv20+3NEF3mdQNTRhP9vU6ElLi6uLkUZ12qkXdJXsjAIKC3o0RlrzRMQK96/RKn1v9
         61ur1ZAvXgDSeDkDlpD/E+ozdA00k91Q91oX3S9NLXUcz3P5gjiLIyz9lIADF2gILuVp
         0iM8fAetqPlGv/VVhCPqedcsCjg/R6O6JffxcuHf0cUDJLx+G5HR+7Syij/Bze3l/KCy
         pu7FFaEIZvcYhUirL48Hklh/fZwHrtEYhc5Nx2iAyGDJdx8bnmsd6uUHW3vD6Bx9foJS
         7IUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=v1/S2BidM9eu4DBUlvbPen6nc7Opg+/pGViAro3iJG8=;
        fh=5ButASqRcvbPrLO553fnN8iDIDdLfunkjLILXK4Hz9c=;
        b=SQAZJx8OvnT4jDxp5w6FW+LejCnmqlGCLzXFhLYEIoT7qcT3Sr5G7DVRjXVSuLu+DC
         qsWGitL10jy7q/EeSdP89B76v6kXpMpxL2L1feRp2NGaK9XaVhGaXKckWb8QGvNYMjRh
         7BBXMjAh3pioHUUIh9oD9ASxg4Mg9CvRv+W7IzAiUjmcyeIuVFmIp0b32oFAt4BUQ4jE
         6DCcPPfGJpjdCW5lCJOXDVIisdj8PbEu7BP16gWL12ne6OJaUQDxQ2pg+JI38SO/XfaA
         AK1xBxIqwVDec3poCOIq6QKr8nFL1u7zHjyzbc1fXCOM0a1CSPHQKWx4dK5bmBR/mIcc
         FiPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F40aADqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d3d482si146022421cf.242.2024.09.04.02.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 02:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F40aADqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slmGB-0002ev-Fu; Wed, 04 Sep 2024 05:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmG5-0002dB-UA
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 05:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmG3-0002Hg-W5
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 05:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725441898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v1/S2BidM9eu4DBUlvbPen6nc7Opg+/pGViAro3iJG8=;
 b=F40aADqrKbO86dLLT3TZ1NPPEXCb8tdz7z644tKBK90flV+9Qeh/UECM9VIturhHpFSXft
 vuOINPMfjQmZmSs9SaDq/UVeyy7VLLGTi7Um4zD7EJwZkz4VVdPuoKdAjM2QdU4V6GudKd
 bCo01Mjt7kulOdobVUDXsFmgwvJisj4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-T_Owo6ygMVmiiLXPHunvRQ-1; Wed, 04 Sep 2024 05:24:56 -0400
X-MC-Unique: T_Owo6ygMVmiiLXPHunvRQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374bb2f100fso405545f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 02:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725441896; x=1726046696;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v1/S2BidM9eu4DBUlvbPen6nc7Opg+/pGViAro3iJG8=;
 b=r9MzSy49JbFGfRkP76ef+1oScB4kJ7CHrBQhxlMEUWQ3+iKfBDmYC+8AvWQWDlSEiC
 ARLVhzJzD3ZGvPFxihvD6mgeVLkMKQfA5CXu5boOnMu3UQZn6vthgpjKuyHu6S8lsfV8
 V3yRcoFW7BTSdGnaqBWEx5aERfxgCpZN7/kJlLRgSIwJ/XZE3lqN6CWw5wSpyv1ORoCr
 AKXMI9xqwIt2yexenh4F3b7fpjZx0+kKBXbe89Lc4V3UIkX7bG0GS9K/CNFKIxFwoQpa
 5YchJgkfhUTMWQSp6PTb7P+OEBNr4VBIONwDtS7+u/7UP0bgMF4HiVgiTcaSQFRM0VSM
 vtYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZeu40QnI9ZP31qTd9V0cB7ZnyoKWzbCJf6c65YhCxZ6PLnh0H44kM2sTRLKdgtShqjUUVP0ZvuA==@nongnu.org
X-Gm-Message-State: AOJu0Yww3ZE0myu/gR60ax/l8/iE+ggAdYtuaI1LOsa1aSkZWChmPAg6
 UVF8+4dBbSHOjI4zhl1TPI+5bYiiaDwbV6vwH14vbscNOKwXtXBOEhO7Vj6cBHVAJu7hSnq/sqM
 tzMeWL0SXxo0WFpOrNBQWqCL36XNrF53Lcd1pXUjtK37VI8spRg==
X-Received: by 2002:a05:6000:dc4:b0:374:c847:83a with SMTP id
 ffacd0b85a97d-3776ee8fe79mr1142434f8f.8.1725441895584; 
 Wed, 04 Sep 2024 02:24:55 -0700 (PDT)
X-Received: by 2002:a05:6000:dc4:b0:374:c847:83a with SMTP id
 ffacd0b85a97d-3776ee8fe79mr1142415f8f.8.1725441895076; 
 Wed, 04 Sep 2024 02:24:55 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df954asm196516185e9.26.2024.09.04.02.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 02:24:54 -0700 (PDT)
Message-ID: <9451205a-704c-4063-b098-3c692961bf27@redhat.com>
Date: Wed, 4 Sep 2024 11:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 27/53] hw/display: Remove Blizzard display device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-28-peter.maydell@linaro.org>
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
In-Reply-To: <20240903160751.4100218-28-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 3nlDOih2npG0

On 03/09/2024 18.07, Peter Maydell wrote:
> Remove the blizzard display device, which was only used with the
> n800 and n810 machines.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                   |    2 -
>   include/hw/display/blizzard.h |   21 -
>   hw/display/blizzard.c         | 1026 ---------------------------------
>   hw/display/Kconfig            |    3 -
>   hw/display/meson.build        |    1 -
>   5 files changed, 1053 deletions(-)
>   delete mode 100644 include/hw/display/blizzard.h
>   delete mode 100644 hw/display/blizzard.c

Reviewed-by: Thomas Huth <thuth@redhat.com>

