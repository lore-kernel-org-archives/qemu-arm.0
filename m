Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4750470ejc;
        Wed, 18 Oct 2023 09:11:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWTe7tyELqH6Nvhpb70+ZQUfoDF7/LHVvG19iph/YkHHFcJdOASjmVZJ7HHIZ+nGUDc1Ql
X-Received: by 2002:a67:b24c:0:b0:457:cccf:d989 with SMTP id s12-20020a67b24c000000b00457cccfd989mr6214757vsh.28.1697645470082;
        Wed, 18 Oct 2023 09:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697645470; cv=none;
        d=google.com; s=arc-20160816;
        b=aNpWk0Iy8mrMcN+vMtFgc0zDo0ho1E3wP0FzScK/ZSYDyajBdPyVtItiIKWUEX2RD6
         L6Ix/pqjWd9Qcyv2oc6MzJmq3pJ1vLzYm+D5xSO1smgslauxVutZ79o2lxjfbs4pDmxe
         r4tDDn/8oTAaj2xJDXqK3eZChmy0vSPa6kzM1X4K8B2m1uXQfYIBGaPUTxX7tAIivsk3
         YshHbkRVSoXUWWIxLa+8qeGrMYzVLcXKgVgkC8njEHbSidDTXgRxHEK2011At+voNoVm
         bRgaznHMgJbJRGaV5G95uu++cCxdoNW/yGBYoZ+JnHwN+W6Xe0mdvMBbi8hp86nK4/IS
         3frA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=niq7Dpfm7wep1QppagjyXm6GUT5pQjTHtzV6Ze2ydK4=;
        fh=5KD7BjLGFDublHDNRImOelVUthgQZWbxdG3c9Bb6fGg=;
        b=Dr1ud3/0pD/Ywomiz1vTmBOpX3f3Piq/qi8bRJi9tYGUrCu3v4Drt5VCR5H3YvVVgD
         hxUYHl+PiHwsCuC4fIdSzxKotOEVlTmN1BDVd8vK9s73V/A/WI3n0Q7q0K4f+abdeRFv
         ggX1A6S8u6COUAEtUPuF6FAZHF7ilxnOsql00pg6Cokpry5It32qzHqG65tcxP7JvEZH
         y57onqmt50Q/OgGZ1zsfxZ0br4sN9//sQHJYTe5zIJ+FZg6+OOIsQbOF/srv4n1DCdD4
         Nk9O3BJYeX3JxEtze8cxdZENhAAfxwQMSUUM057S7Y/LXEpB/sAwR/xZllormtcS7cSN
         idEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TsJuWPJU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a05610221a600b00457bc6dcf71si357172vsb.570.2023.10.18.09.11.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 09:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TsJuWPJU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt8yC-0004L7-K2; Wed, 18 Oct 2023 12:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt8y7-0004Bp-VQ
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 12:00:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt8y5-000859-Ar
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 12:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697644820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=niq7Dpfm7wep1QppagjyXm6GUT5pQjTHtzV6Ze2ydK4=;
 b=TsJuWPJUfSc356TiiUcFH8IrCFac8QyzWrsjM8MdQlEFqcTSUZDHxWMzGueaIs57b8B4b7
 EWl/zmFPuinqY2OeSEjDfEtkaNlc7dLIrrhUPJkEcakkH9kpznBpDoBpU+UtQrfj6QlsXw
 /5g4dsDQuHUsrW+ADm281GGhWuRpUwc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-vk0gDmJ4ND2ANvy_VBvdcA-1; Wed, 18 Oct 2023 12:00:19 -0400
X-MC-Unique: vk0gDmJ4ND2ANvy_VBvdcA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-77405179afdso767716285a.1
 for <qemu-devel@nongnu.org>; Wed, 18 Oct 2023 09:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697644818; x=1698249618;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=niq7Dpfm7wep1QppagjyXm6GUT5pQjTHtzV6Ze2ydK4=;
 b=R9FbTrGrBpzDg5ThizRpzLqIECKwbZeUBLg5V74+rmN09j6dWy3M9noD8OS9SSDIj9
 unHgCvOfzzvCRLLI1pwmrxB3C1QUwEBnB+A79DfuTVb5LXFVRgdW7zWunoXGf6tE5xwc
 rtOX1Vjm76Btp9FWmbMKxZb8alnHHb8r5coJd5rpRV3shoQIUq+Ir+AdVGA4roDmbf6u
 7+a6hectRcLfs5i+VKW6uMSXkgb36D8QzyzXf9LWHEye7zL8j0w8eXKNdaNKmLkOU5SV
 3h5KpSTLP9/aSKbv6+xE8C1sb9UT32Q3J6nlTjfgzMjpooFDnGgLzzNujz8tescQckSE
 VVrA==
X-Gm-Message-State: AOJu0Ywd3MLbwtVlCCqluAqAkvtbO4WVRV1s8+P8qxFv0EVZ2VmCD7ka
 GQoTyPteoygI/FaBb+fs8Khk0YrYiOl/uTJst24hbB9gOvrn6f03mUax7KEe5c3QjPj9abx6bk8
 GfxZ6rH1yGmSKbjQ=
X-Received: by 2002:a05:620a:1726:b0:775:93aa:cb91 with SMTP id
 az38-20020a05620a172600b0077593aacb91mr6430681qkb.35.1697644818522; 
 Wed, 18 Oct 2023 09:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1726:b0:775:93aa:cb91 with SMTP id
 az38-20020a05620a172600b0077593aacb91mr6430667qkb.35.1697644818309; 
 Wed, 18 Oct 2023 09:00:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 l23-20020a05620a0c1700b0076f18be9a64sm50405qki.81.2023.10.18.09.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 09:00:16 -0700 (PDT)
Message-ID: <86803e52-ec51-4c8f-84a9-85ad545fc8ff@redhat.com>
Date: Wed, 18 Oct 2023 18:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] hw/acpi: Realize ACPI_GED sysbus device before
 accessing it
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
 <20231018141151.87466-7-philmd@linaro.org>
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
In-Reply-To: <20231018141151.87466-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TPvDz7HIQy1z

On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
> sysbus_mmio_map() should not be called on unrealized device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt.c       | 3 +--
>   hw/i386/microvm.c   | 2 +-
>   hw/loongarch/virt.c | 2 +-
>   3 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

