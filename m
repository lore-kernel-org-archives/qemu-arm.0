Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2993404njb;
        Tue, 22 Oct 2024 04:20:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfvr8yswKGjnq+PbW45gF00ziGCj8Eo5SI3EQZmF2um+LAEL+woWUwHDPJ4ZNI8coHPT/e
X-Received: by 2002:a05:620a:2988:b0:7b1:43e2:712b with SMTP id af79cd13be357-7b157b40f14mr1961600885a.11.1729596034885;
        Tue, 22 Oct 2024 04:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729596034; cv=none;
        d=google.com; s=arc-20240605;
        b=KG+R+4ygHUf9LCeP4lI3GPHpgQqNBUUu2RwbTqc/IKAn7LxaG5c3leZq+vB+Y/t8K6
         KRuwTGqSx1+AiauNVkg+dE/EL5OCaihSQlSGklf+fp32/HDj7VPXaz179yJ6VUU+WIuQ
         8qcP9EglW5wvKCOAKnfeSSEFBaeDTIhZdpmC/U9ojF8XwKLd1r/nIEVcURu87kQm8R8p
         hvChxghemPVa0xifU370iX03P9rD+mVM7VrZU4slvqYwUyv3gbCuU6r71bnrumnbQtJC
         5UI6h06CLgkg/WqvEUwqX6SIoo/kxbFOtMVJCAW2tDkUy2J1sNz1YyFETDQTlUlOaNiD
         XCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Xz5kCx0hdHDiVOVGdcwX+bMGEGNqJ5i23xoa8m0d6bk=;
        fh=z6H+tLebActmKXI7cElA2mfoLLXaJw4w6WDoX5Op/9Y=;
        b=BuukGiZRlGVeqhrvQvHfwdYzkuwXhyDCbuaQt4vq3/wMCsZtKsoGG/9GkRqzIXeY3C
         en7o5/N5XsOS9HWmbwPTXK3yQNdl7wRUjJLCLYnv5Il90HEakBJbTK56fy/EYjhSSxLF
         JqisjYEIh9zjQF/SBHlCK3ooykrQ+9DLK9bOMMTv/2P/GDoYT37KXLVJldd4JGVOVqzy
         DcEbS1iqaNn97RdT/pO6St5QM8bgceCzGN881QT1aZGc8ySap2y64jm1WkbS37xSB/gW
         J3T7tpx+seWRpb5mSAgqzGEkPWZkXb7l21LEhuq20uGIe1Zng2d3+IpLqvNf/wUteuXD
         XdEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Izhp+5Vt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1659cfe3fsi605701185a.80.2024.10.22.04.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 04:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Izhp+5Vt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729596034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Xz5kCx0hdHDiVOVGdcwX+bMGEGNqJ5i23xoa8m0d6bk=;
	b=Izhp+5VtIl8v9ta8p5Ns4QsKgflwJ1U6pOMoYAFT+uEUInk6sv8w858Si3vFsbV8xGEDTr
	QLoFeF+9ScB+THcIGzcQJmm+q5ZiT7Oh9jgLxEpc6+RYwCiFvo6EZxIp+2e24cbyUO2qGn
	nzixrMb6nWRSpEBGPckUQWt3ZEcuUdI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-rKdbTda3MOu_aSs-hWpZ-A-1; Tue, 22 Oct 2024 07:20:33 -0400
X-MC-Unique: rKdbTda3MOu_aSs-hWpZ-A-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbe6ad0154so97093276d6.0
        for <alex.bennee@linaro.org>; Tue, 22 Oct 2024 04:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729596032; x=1730200832;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xz5kCx0hdHDiVOVGdcwX+bMGEGNqJ5i23xoa8m0d6bk=;
        b=wubgqVMZO+Kq4xx5Y8rXA0W84Ej+SMw2I5iG/bw3T6GCOHGeZVqf1yJkkIcmcS80PD
         EGUdCY6cNwMji/Tn9Vu9kZ5UmtYHiBt+95tHL6CAy/G+owWP9MzEY05I2tYNFkD0rbC+
         qyz8GKJmLIfwrvhmbBEXsQMD1eYuGthd0bgyX+q2bxMsRt/y1z/+/GjwN2vMzRZnuR5k
         kseDC2gs1DNv/oFV3qvUvDKhm7Vp4n1B3faFh8DiPo/uilOOhpvU+ExXozwrgKS4B1vx
         YeUOo4zioUGgdaxCLQuxYK588tvdsqhnD7Xhv44UZzOm3MQ+PEi7IdVVepVulNpd3q/R
         2UDg==
X-Gm-Message-State: AOJu0YzYPCs3b4HtYw6n9V+jarE/OhpBSERXVdPtJIZu6n43ifbOZgNT
	v+tglB3fJZcKJAwpBGuEmf7fiKTt8ZKkz/EL5sk/Ihv+W/wT8+OTAofnTnNDWPdOlQZ+ew/1mhg
	sroJq77izLgC7rVxc8UMicpUkYomgZ+v7zdTvge4pDpTuQUJMwSI8BGegJfrohJzuWqEAbn/HSZ
	Z2+otq/JQ8iYPPVwEziURu9SJkqnqDXUKFAYjF
X-Received: by 2002:a05:6214:4804:b0:6cb:ec6a:7d52 with SMTP id 6a1803df08f44-6cde155e583mr240452846d6.31.1729596032065;
        Tue, 22 Oct 2024 04:20:32 -0700 (PDT)
X-Received: by 2002:a05:6214:4804:b0:6cb:ec6a:7d52 with SMTP id 6a1803df08f44-6cde155e583mr240452236d6.31.1729596031563;
        Tue, 22 Oct 2024 04:20:31 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-40-241-30.web.vodafone.de. [109.40.241.30])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce00999d08sm27733446d6.83.2024.10.22.04.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:20:30 -0700 (PDT)
Message-ID: <9661bb1c-701e-4472-94b6-92b7bc3c3550@redhat.com>
Date: Tue, 22 Oct 2024 13:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/20] MAINTAINERS: mention my testing/next tree
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, devel@lists.libvirt.org,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Zhao Liu <zhao1.liu@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-4-alex.bennee@linaro.org>
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
In-Reply-To: <20241022105614.839199-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: faVqUIe4vM34

On 22/10/2024 12.55, Alex Bennée wrote:
> I put it under my name as there may be other maintainer testing trees
> as well.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>
