Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp405834njb;
        Tue, 4 Feb 2025 10:26:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgPNOYmVvOcxU2cMgfb/wXkCtaI2sWCQWQYblWOOMkRaWg1E6i+Fqz1Kr3zaxZzMqE97JjFh22tH2XpA==@linaro.org
X-Google-Smtp-Source: AGHT+IGtB2HgVIednhTskz7GNtI9pQU01vU5msc8/dPolN3ZGWwfHGmhE4hW4ZeECkbYoqw8MO4s
X-Received: by 2002:a05:6102:5122:b0:4b9:b499:890 with SMTP id ada2fe7eead31-4ba47b0614cmr35604137.23.1738693596659;
        Tue, 04 Feb 2025 10:26:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693596; cv=none;
        d=google.com; s=arc-20240605;
        b=fvufZQIg1pc44UZQoWJ31cFrXPap8poT6m4cfSYQnkQMPP/suYJnw6DH8kJg/6xKJf
         6W3GkNYdhFabByp2BIrIuGUbV3JeYw75Jvm3MPfj6CwWFT+Epl4UYfUheqWghkqFbvLu
         vpXEBCOJpdDPIL0nMBMvXInIl8HpzvGSEFFxhJubFAmkwDxbm9GXefxK6mTSHn33XKy7
         1Dx06slTxNqGhfz5TQ/X1I2QD58ncoIobOies1uSZ8ysPxr/oekKj1KI8Hvn0WIncbVR
         3BJvfMCWdJfnAWhITrJhZZ+qEMb7o4DY7fcdY4fCseKXMsQN+Xj6CxqKIr0qPjRd0YL3
         FXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=zS47pmtUZUQ6DNMSEfcf2IShFa37ZgG1cQi167gSnV8=;
        fh=xCDhhuS8WP7E5QFWLwwhmB9pchzs7vGChD0UKDvd3SE=;
        b=MmfazcAi3ZnuwRGDXPWvMenSDT3ZfOASyYLHkt8WNHRZ9vRJsL6WA/nE0weZaHX46J
         8fTQmN0/Ac5/vXl8DAlAIvmwYriz1HA8gOk58O+u2sKr0Xk23phCa2YDrlRCu4dbJive
         Z4a1wajQfpz3Pc1xG1iLSGrXcOmBZ0tHxmKLQJERgX7pPswRcgNnIbjZeesituqr/iIG
         K+f86IqMxG7D0VBdi38gwVM8iHOZAfIKvWZspvDCV2hbVajloY9dZYjDFLRcQuFppyLv
         /fL/MT1uMmvUk33zz2ytX3XbKaaPanOZkEfiIn5eRSU0aPuJt+Ejge3S1OaZ72dmmP58
         VkPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OdpdY3tV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-866e4bfe6c2si289315241.165.2025.02.04.10.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:26:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OdpdY3tV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNcq-0005hO-W6; Tue, 04 Feb 2025 13:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNck-0005UU-4U
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:26:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNci-00035T-8E
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738693571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zS47pmtUZUQ6DNMSEfcf2IShFa37ZgG1cQi167gSnV8=;
 b=OdpdY3tVOh7ptz6Dl8ZawHPMs2jHIXOplh21lCNJj8pz3JYadXXGhw1eG1K3L2Bv3pTsrW
 hzJNB9CgeDSXloJNsRDBwdtb6OWJZoAI2jnK2OvIr/So0YXP8lSa59xYsAtyACD+02u3Uh
 ShCigQls3QFWbkqPwSUHgxlmdN1A/FI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-WM2PDN-3OdWhEt0lCUAriA-1; Tue, 04 Feb 2025 13:26:07 -0500
X-MC-Unique: WM2PDN-3OdWhEt0lCUAriA-1
X-Mimecast-MFC-AGG-ID: WM2PDN-3OdWhEt0lCUAriA
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab693930fc5so549296266b.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693566; x=1739298366;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zS47pmtUZUQ6DNMSEfcf2IShFa37ZgG1cQi167gSnV8=;
 b=j6wOu4CVm84wSkbAC/JWs3raAUEUMgFeeRk7bqZcc3shVr9y/3AmiWba52sI5sI4ui
 WHvMPMqAWx0upRXignkGcHghgq+5yB0wI/uI30vIpZv0B3O2YdW/lrweLUpn5AvIk0B3
 Ziubg9WRX/j7pUgg/iUqQDv3mrqBtkjxhfKpthZcVHlrl3vPTNhYNwgfnKZAF1Tm+Eub
 YUx7zWVSHXca7FIdZwkGBCQHcD/g48Q0mivjyMZjVX7kVfrVrUw3KVz3TgiusOTEYNo4
 AYZFGfujGVwMFE/Q07PFpH3Bw5eZZGZMy+w8sOZ8xAcS7G8SuE6cqGzltg1PrkTR9ij3
 XVJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcKzD739wd3Qv6f3g2Vq1pSXMkHdHP8ZP6BZIL+QPsGglWhW9polzwSxVn7XywS++LECqB8EEssA==@nongnu.org
X-Gm-Message-State: AOJu0YyjIcAu0pzMOeMXpUVQQiV0pxR1KfleE0W+6GYH8jdL8hzDSaZD
 qL06eRaW+QU2u4HzWlix+aRGU+fmxssykruBl3XMSkWMwwxtfMe1LSQcjxANV/9VstrGUoIyNxo
 tNf12qHIdFq4q0zo71WtP4LN3b6jk9lH/+p+u1sPR4twzyPZKDA==
X-Gm-Gg: ASbGncu88SV7J5rQQAgLc9nDD8VzRiKxlvE2acyaGL+mLlJ8sSfjdHrZOiM+59uLRQr
 kQGSmBEgOJLpg98vln1ajx70jAOZBVG6v4li3gX2JzNAua3F3r6trH3Dr4XatjBGuTR7zxl7Ckw
 aBAbI0MQnOhKEzfQou/ZYb4PsIPUAj9eS6w2qrGI1U+zgMeu8Ma5JpuCAZFQtYqJ8PjHy+Nmuza
 tS6cESpWDymafKz5IHsgNeVrbJwSnXaHN4rHg8VgB+xDIkjKoCeP3htirqmLk9HlRyu7Yh1YMGz
 DfSSshfwVT+RxtDLpoecSoaQ3i2yQk/uRIan
X-Received: by 2002:a17:907:7b8a:b0:aab:d7ef:d44 with SMTP id
 a640c23a62f3a-ab6cfce763emr3297437366b.24.1738693566631; 
 Tue, 04 Feb 2025 10:26:06 -0800 (PST)
X-Received: by 2002:a17:907:7b8a:b0:aab:d7ef:d44 with SMTP id
 a640c23a62f3a-ab6cfce763emr3297434066b.24.1738693566227; 
 Tue, 04 Feb 2025 10:26:06 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab703a41cb1sm737584866b.103.2025.02.04.10.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:26:05 -0800 (PST)
Message-ID: <6e59b7c0-8a0c-4c49-9029-848cc1d4486d@redhat.com>
Date: Tue, 4 Feb 2025 19:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] hw/boards: Remove all invalid uses of
 auto_create_sdcard=true
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-5-philmd@linaro.org>
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
In-Reply-To: <20250204180746.58357-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tkViyi2qXZWyiXbSsIjDAUzVfe1ff0xzOnWGGW-f888_1738693567
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wCkK1eRchTVm

On 04/02/2025 19.07, Philippe Mathieu-Daudé wrote:
> MachineClass::auto_create_sdcard is only useful to automatically
> create a SD card, attach a IF_SD block drive to it and plug the
> card onto a SD bus. Only the ARM and RISCV targets use such
> feature:
> 
>   $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
>   hw/arm
>   hw/riscv
>   $
> 
> Remove all other uses.

Smart!

Reviewed-by: Thomas Huth <thuth@redhat.com>

