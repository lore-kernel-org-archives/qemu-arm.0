Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5982420njd;
        Mon, 28 Apr 2025 06:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfR0jHvIF+OjZNStcwtruKTP5GuR0Od7C6vK5YJolgqwY/8CjreZDV58bCP/9kWOpjWyxj
X-Received: by 2002:ad4:5963:0:b0:6f4:c21b:cd9d with SMTP id 6a1803df08f44-6f4cba43f15mr161865306d6.29.1745848367000;
        Mon, 28 Apr 2025 06:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745848366; cv=none;
        d=google.com; s=arc-20240605;
        b=ezRo2rpT5Vqsk44dQRaSjw3VJTg12qq0TrNWGm7quL7yzx0KAqLhMISKISA8uGeeyh
         c5bkYs9UJdu+PWJTrcbwYHwTGE0bQYv5Azf0YPdNqylfphkLHdgZMfPak7J5c8nZjZYI
         A43qmlIN+++7Gm/2isFIl2eLMKHHiaoKav/WIW2n/mk3uINyw9qE5Ve0ZpXylUeK0RZo
         B9EzJA9BfFlfzPp6HygcKwBeQRsf8Ym9C0B0GDW8vTXy0QLqUVTEb/NTA1PWmsAYy4Rs
         xqZOsXecmdF1ytHaD7MZ2YOKtTd/vESO9Bo0LRuaFNrJ0UFn8UP8+XTi+WEln6xBNdKW
         7ERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ydF/CRkQhZ0+q5pcoTRoTNfmD5eC+hVGKPkhgX5DjXM=;
        fh=jf2lbwziKaTy6ue9vQ8Pipxc7vUxBSFDf+GMsIxsvzo=;
        b=j4TGHe6cbxaGqyH93f/PZCGgfY6I31uP81Uuc/ImPm8aTm1DRrXy8dWxncqsuEROdT
         BLARYT/xHFvaeKWHm6a4OEjWkqf+dNUyOSt6vRZ7/hkSl7jgoCf2LzIYdOgsKWslnx5m
         rPrVdnHNjinKIJCSSDv6QSswR6u+2VoqUrT7x6YvPgoDGZfld+HPnvpsKACBg94VN328
         zNrcShoLQwUdxVUQMaJLdQJ9wfiyd7VAOrIqg82Jfdw99Sw7cugA3o8VTFjYDkOEs7gM
         1hg7pDSSKscAtCPH5hwZ8wuwvwtsCGdMfYCE7Tm8OhFWTGMTZ/txEp6pEK3iBjk3ierG
         UyeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JQxcWACQ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0acb510si98603496d6.260.2025.04.28.06.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JQxcWACQ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745848366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ydF/CRkQhZ0+q5pcoTRoTNfmD5eC+hVGKPkhgX5DjXM=;
	b=JQxcWACQ74B5FBXI7Yjy+qH66KMO65MkwhaPgv0scKiPqXaxaM5Ar+8kelN4YOeDo6MmNa
	dIcPpxEKM/2fSJS4APX4fuq6JFl77CWtISEav//hcmxdxX8F3SacR+tBpjSQoCdtMvMC/2
	TKaGKcng3Ma657ORCV7ZYSq4uPF1WpE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-n_qlkB6GNgioolOYlGE9-g-1; Mon, 28 Apr 2025 09:52:45 -0400
X-MC-Unique: n_qlkB6GNgioolOYlGE9-g-1
X-Mimecast-MFC-AGG-ID: n_qlkB6GNgioolOYlGE9-g_1745848364
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb5a03afdcso397696166b.3
        for <alex.bennee@linaro.org>; Mon, 28 Apr 2025 06:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848364; x=1746453164;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydF/CRkQhZ0+q5pcoTRoTNfmD5eC+hVGKPkhgX5DjXM=;
        b=H0dYIQMcQxa6ughRTHVMZY6zjeOKijkQUOhh0Gkn7zn/1OIa65RpF6AabbrYGUHEsH
         g+oj64F621H1JSazp7DiGt+JmqZjiFqBSHUC8rA52ybXmsKJKvWwReNwH+MAZ2U8Uq2Y
         3BOSzGWAEQ3a1rjombaBtP6rysfUaW41FfRXoKXwzcmRvPm2CXQjcncn3W40hNS3fu7s
         IFIebqZurEcZIU6rpmWxqdiZwxJmwxcFcUgeFh/6BmeUa6fCdGHP5q6FMCmayM1uUpE5
         pW4TfQucLxtfgwOowA1rj1h6qtvGpTWph9PUGSfe8AVHZ2g19zUtH+G22an5f2Uj8grS
         vnIg==
X-Gm-Message-State: AOJu0YzwBfeublbARCv+4vI/vHFzTe/BP/fbA8Qb8pBehdpfK2flXOry
	snme7LHNrNQ44ZwBvw/CWnIHggohrdfXUrL2plJgtDSmL2ItBFvdNEhF8pY+VHAXCD+pTacwjRV
	sgNBV+ObEobxtd4x8nTlG9p6PVzCajyF8O4QrdjSmMrYsL9Byq/kzR++eptkuaUbPO830TFRrGM
	8Wn8hZtyXEq1fSeWZTB/YGVwAE6JDVxxigZasz
X-Gm-Gg: ASbGnctIgBaYqrxlkjG3nOb+EogRVLbDV3oUBJp5Tldntxk1WoOEQYSQtuKxsY4BOGc
	25x2glai6PWeIvabKBm1XZw5wRtAGyAYPNi2Z5Cg6Bx7IHi4HV4ZwwnWSgpT2mdA6myXfstP6an
	PgXsM906p4/4cxwBNv0xPXQubS2G3tnB4nKqTgH6UuUikh+q4Rg1Wzxh748bePdC9FC854SiwYb
	bMgkx4gqimGNNws+apyqgWcq6fvyTKKugC1ae6InkXJTNyG4/vX23N/v5woNuhkfGFyAYmpy0Jl
	qRj2+53v0/t4rg897FnyJwSiYJwkJjLaYMOVtwaWAJizsQ==
X-Received: by 2002:a17:906:38cc:b0:ac7:b7:c0ce with SMTP id a640c23a62f3a-ace713def6emr852377966b.53.1745848364110;
        Mon, 28 Apr 2025 06:52:44 -0700 (PDT)
X-Received: by 2002:a17:906:38cc:b0:ac7:b7:c0ce with SMTP id a640c23a62f3a-ace713def6emr852374766b.53.1745848363602;
        Mon, 28 Apr 2025 06:52:43 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-43-178-177.web.vodafone.de. [109.43.178.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb0f40sm632216466b.174.2025.04.28.06.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:52:43 -0700 (PDT)
Message-ID: <0dae4e29-2706-49bf-a40b-8fa9e121c7e1@redhat.com>
Date: Mon, 28 Apr 2025 15:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] MAINTAINERS: add myself to virtio-gpu for Odd Fixes
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-7-alex.bennee@linaro.org>
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
In-Reply-To: <20250428125918.449346-7-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kLrD7dlGIlrez7I7H5zD9H9ZWVQOR4esbHH6bkYc6O4_1745848364
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: SWQ4txAOYfK4

On 28/04/2025 14.59, Alex Bennée wrote:
> Seeing as I've taken a few patches to here now I might as well put
> myself forward to maintain virtio-gpu. I've marked it as Odd Fixes as
> it's not my core focus. If someone with more GPU experience comes
> forward we can always update again.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 661a47db5a..f67c8edcf6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2636,7 +2636,8 @@ F: hw/display/ramfb*.c
>   F: include/hw/display/ramfb.h
>   
>   virtio-gpu
> -S: Orphan
> +M: Alex Bennée <alex.bennee@linaro.org>
> +M: Odd Fixes
>   F: hw/display/virtio-gpu*
>   F: hw/display/virtio-vga.*
>   F: include/hw/virtio/virtio-gpu.h

Reviewed-by: Thomas Huth <thuth@redhat.com>
