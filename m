Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp930871njb;
        Wed, 12 Feb 2025 03:38:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVqdYOifJf7NXL/w7dyyPYliXRvpfDR3D/Xv+H3BjVnOa75oZm1QDVFZJC84E+LTdBNc+UftgsqfVawNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFVohJ77TIe5lSuHGrNMRH0/8zqbAdmPMccGFmEahXwCWTnkZRx8tZj6TRIzQXARGIjccmu
X-Received: by 2002:a05:6000:2a6:b0:38a:88ac:f115 with SMTP id ffacd0b85a97d-38dea2e98d1mr2319016f8f.34.1739360303244;
        Wed, 12 Feb 2025 03:38:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739360303; cv=none;
        d=google.com; s=arc-20240605;
        b=CYZ9YF1WzO931u/v85QRiP5x5Ly362tJiA4tN/g2SaR0sg0oY9pFHvuVJb2UOMovx2
         KKAjYhdoTxWDnzc8KAIfAx2xOkoBO8jT/ThRRV2pNxbdmSwdoDKWYQs1ZuNn62ABTCk+
         TzYZ9gHeSBpEh/vE8o+/aaf0A5LkxfS0qmku1A99V0d052XbLx2gYZFO1wP+p6sdx5dA
         FigLEdNLgibN3Dn46iG7itsYe2BcYbGacuMMK6fdd5blvOUwzV8chWxItwHGu1QwdOgn
         AzodNgYyJkWiaF6J0puVoeITPpPvOnJLMSWQ65yNrcg7I86am2mCIYGiWJL4cMe85rg5
         cvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=fdAx9belAf6W5/OTtK5Mrt9oS3V2UprySoa1u+ILRdA=;
        fh=7j3NTiaOAafsYlnSXNWdtkJt4Na/dmT1JgUBc2xn6IE=;
        b=Az2xNjIWWPcT/aNTRItPeKdsvP3Spf2D/IFzkDZcoDoaUZaf9hT4QF0z/8v1wD3n0k
         PTnPS4McbwxpFy2yAMMxmkHPb5ixedq7Sfz+fnKVvSuVwCdrv/9RaFNk195EGcTDQsTe
         IvI2rTPWoKjMIh9rEl/Oaa87Y3Dm2VWbv3PRE1vdSxBXpoXYXswswFcHuVWQoVt8jL4S
         7D1aFjVN7jE4J4K1TNI/i6dA0AJtQceKpKsqWQaXk4vF1yDJxaD6zGinrFv1us9KmQD9
         5zScQFkg8OV7B3ZTOGxEelnQPlNBw/j6+7va5XZUtmLnPfBrN38FkXEJj4d1Mo7vVBQE
         eSfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bsYGzcTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38dd6ba929asi6020570f8f.620.2025.02.12.03.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:38:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bsYGzcTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiB3w-0001Nc-5P; Wed, 12 Feb 2025 06:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiB3u-0001N3-Cu
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiB3t-0008R9-1V
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739360266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fdAx9belAf6W5/OTtK5Mrt9oS3V2UprySoa1u+ILRdA=;
 b=bsYGzcTN5jEQ9SY/HWBZI1v1dz+XTqVtsWh9Pr1vc4gfyGBNNdhnLQ0uyJhkgy8dcFJ89I
 XLPYJS0C7FWi4nJS4K/hfDxi9+Eo4nbeb7vOtRdh1CyE7XnO+PwDyv0YIeepa+jRHH/vNP
 nb5Pi76DEoIepARY3Exs640ME5789uc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-wisBqXM3NDCk-4HCR1Q8OA-1; Wed, 12 Feb 2025 06:37:42 -0500
X-MC-Unique: wisBqXM3NDCk-4HCR1Q8OA-1
X-Mimecast-MFC-AGG-ID: wisBqXM3NDCk-4HCR1Q8OA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38de12153d4so1940775f8f.0
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360261; x=1739965061;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fdAx9belAf6W5/OTtK5Mrt9oS3V2UprySoa1u+ILRdA=;
 b=VxNHzlkvPUWhYshF6d4qR1zORk8TLyk4xnbQGw5ik8gtczs5LuaPyRuCLCKPd2KRnl
 hjEs53JfoJKgeqSCETnZmqDsgUzogERfNO6eURMStnUJagB/RlvudJInPT/BvtFomfW6
 DgmqycSYUgC61P994klaPt9RyEA5jHEVnVicWIGye/VZiYVQxWehmDvQWQ1fIdwCFhrX
 h2SJeCHYzzfVHmrNL39117oLRCUZJOcKHJvpVqJk32J8cBTho/Eir1+GzKatbpe64hsi
 Q2+bjA2HUmWG5AbFCH4ZuTpvUQ1dSYWgYKJx/jUbG7lmyI86E0gfKE4T4VyXBK5mNwOx
 KKIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY4a+C+2pUR+O5oK3HYBe7cGBHXFmCnz6hEmDnbJZ7LRQrrcqqQwPxpuNYGnHKWnwODx+THkncCQ==@nongnu.org
X-Gm-Message-State: AOJu0YxXl9hdLE6VIQdXjhKGuD12JSieA3oQEZ6wYVBS2jLgoVItlXFZ
 GPNBRfr2qEgXrIoVabqNlwz6ULqG9Sx6IR/xGcbQAtp6QZwzmpagn6EU3sovnDCkah53hcpwuK3
 X94sqjO7t/5BmPG7d0v7lz2DjJQgCSimJqg89x2t9JVjRSNd8Mg==
X-Gm-Gg: ASbGncsSPW8XibAAvw1JdKp2L+aGHePr6uw0fAFSR/kbeJjj81vLMkhsGSdsYKNFsKO
 vpWMtUB6KhmLWiKwSCdevm61HCW9Yi9g5GFk6HDjYAW7d01WzkTPyQhis0B7FT+B2c3p762gIJG
 bpIg8Mhy7hQ/HeCGfe2LU14BIu0vRPPKXbY3tTV3Ja30BWySwoYb11+j8+i+MJo9Z9dzEILuCgq
 W9N/2cuWFdau7afTaSeP9nssZgrdGbGEzzgLsm0W1HE4LBllNk8kTw4PyiUYSZI6Arr3h2hinnC
 m5CetNwG6/7pNBWP47uH57pq8gWDbrL4Pw==
X-Received: by 2002:a05:6000:1887:b0:38d:d69e:1326 with SMTP id
 ffacd0b85a97d-38dea25917emr1984525f8f.9.1739360261612; 
 Wed, 12 Feb 2025 03:37:41 -0800 (PST)
X-Received: by 2002:a05:6000:1887:b0:38d:d69e:1326 with SMTP id
 ffacd0b85a97d-38dea25917emr1984494f8f.9.1739360261094; 
 Wed, 12 Feb 2025 03:37:41 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-37.web.vodafone.de. [109.42.48.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcaf3e4bcsm14209303f8f.41.2025.02.12.03.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:37:40 -0800 (PST)
Message-ID: <cb828dd8-25f6-47c6-9ac7-cae5b0d0932e@redhat.com>
Date: Wed, 12 Feb 2025 12:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode
 QAPI enum
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-2-philmd@linaro.org>
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
In-Reply-To: <20250212112413.37553-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1FRH5QzlS_A6owjFr6cod8ZxBSIZvlJ-Z2qtWjKw9DQ_1739360262
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
X-TUID: oejuoHWV5YlX

On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
> Endianness can be BIG, LITTLE or unspecified (default).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   qapi/common.json                    | 16 ++++++++++++++++
>   include/hw/qdev-properties-system.h |  7 +++++++
>   hw/core/qdev-properties-system.c    | 11 +++++++++++
>   3 files changed, 34 insertions(+)
> 
> diff --git a/qapi/common.json b/qapi/common.json
> index 6ffc7a37890..217feaaf683 100644
> --- a/qapi/common.json
> +++ b/qapi/common.json
> @@ -212,3 +212,19 @@
>   ##
>   { 'struct': 'HumanReadableText',
>     'data': { 'human-readable-text': 'str' } }
> +
> +##
> +# @EndianMode:
> +#
> +# An enumeration of three options: little, big, and unspecified
> +#
> +# @little: Little endianness
> +#
> +# @big: Big endianness
> +#
> +# @unspecified: Endianness not specified
> +#
> +# Since: 10.0
> +##
> +{ 'enum': 'EndianMode',
> +  'data': [ 'little', 'big', 'unspecified' ] }

Should 'unspecified' come first? ... so that it gets the value 0, i.e. when 
someone forgets to properly initialize a related variable, the chances are 
higher that it ends up as "unspecified" than as "little" ?

Apart from that:
Reviewed-by: Thomas Huth <thuth@redhat.com>

