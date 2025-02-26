Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp998816njg;
        Wed, 26 Feb 2025 07:59:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEa7EVrKC/XXRqgYy0WSilw19yXPrsmfPT5jHxB31V4iVVRnWdAg+68O1nl/HMX/eiPunJG
X-Received: by 2002:a05:622a:292:b0:472:82b:72ae with SMTP id d75a77b69052e-4722473f31cmr262801891cf.22.1740585554289;
        Wed, 26 Feb 2025 07:59:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740585554; cv=none;
        d=google.com; s=arc-20240605;
        b=KZ7FSkvL9JsWBAKuHRR97FZMylK3DOaPoPf/XLLFRJNg1SXgUdzyHBQ31icN8sKq5r
         EC4jkuW0XZZpeoogFX1BBTXSs8D7sbz250fDm7NQ6UpRF4GDvFvqScjNaD1CcIpKGNJT
         Gv3sZtHrYfx2yGXfe7upaVrE6XfIfYHIDm1/bDauTho2LpOScTwwv6dMaScc1euzzKg3
         GKYCZNBLI8n2bzwvWr/dy4bSmJdg4yNsseQuCgdrgw8dV66votdtIZGAfIDyZCjBdDxy
         LkQ+XNL9WOXfQWXsP7FwWDxJosD2TTlYll6MwT6IOHTo8jjxwm1SjiCzjPIXvcZUJNt6
         2fcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=EvpMW5Us6iFxENm8iddIRKVCa+k3xzr2ebPkQ9K6Lhk=;
        fh=kMuyKEDVLpXx+n9GsiCpA1spgm27ONyskfB4MRxywKY=;
        b=Oopv/mlxoIEKiL4BgDez76+wMhccUASyuhrvBBI/AUVPeLuhYQDMSNqwoxr38ZfhWj
         dgqKm4XJIzXUSPdN0DvaFuPIDNR4Ni9z3+8H4qX880eBqkLqo1Sxc/IG+wjmU8Z2YEFK
         2p0bWm52VtBeVg44PehGe/HOXCS+823QJa2jN3g0lvN5PjrMJdRmeA0/g6XVbnpxzWDq
         6UkzprXUDYkhYP2nfm75srOeyDDx2tNMtG5E5vMVnRbqUrevgtaMttq7K5ii2gS1EBsO
         CGIdtbwOVNjSJye5QO4/DOPI6cM7HGETWhAJByV4HPQ4z4rqWqMg6DJrO1rdwULmYD8o
         wONA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=efEYL+pa;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-47377e2f2d3si39046311cf.154.2025.02.26.07.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 07:59:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=efEYL+pa;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740585553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EvpMW5Us6iFxENm8iddIRKVCa+k3xzr2ebPkQ9K6Lhk=;
	b=efEYL+pa1AIyee0AQy21JeKpme25mKbJn8jbN6pj1nrnwFkqQWM3325ToQSCfQuvzODylL
	SPV+uv9x89L1X1BsGpxjw55nM0s2p1Y6TRafxo1XFI8l/CKg7tWTymuRjxa2wEiH7j+Ev7
	AYnt0pYOWtPl9PEXpgE1J+cg51oTo6s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-o2xAgIx2N2yK9DSUovDgqg-1; Wed, 26 Feb 2025 10:59:12 -0500
X-MC-Unique: o2xAgIx2N2yK9DSUovDgqg-1
X-Mimecast-MFC-AGG-ID: o2xAgIx2N2yK9DSUovDgqg_1740585552
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43947979ce8so29948405e9.0
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 07:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585551; x=1741190351;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvpMW5Us6iFxENm8iddIRKVCa+k3xzr2ebPkQ9K6Lhk=;
        b=isY2Bv4KfNE7hrj0cTWkELFECAK7jEdMCVziRS86zeiFr/Ig9j4ig44Rd/636kv+hc
         y5hKTSuU8iXIjhOX8+F2ytvu4Q1ZTic878aiKn1IVG8togbeKd7cl+wGnfQhnr0GPpjM
         N8na5SOqexFGAKkOvGgAnMWPU4NcWvkYTpTPmjxmeXR6rO/n3A6G6NpeiQ9HkX+2IYm6
         JQ5nnzGJptW1k/DszJx//mF7OY1TXtzrd/UKyQP0WHtZVeNk4NMUMa1G05I48Mr6iSHW
         f5a804v6ULY+aSU70vJ2eKRJiDhu4HPgyi7sY6sxWZ05mwqwQc9je8sahIjGdo8QQTeu
         Gmnw==
X-Gm-Message-State: AOJu0YwXiTJOWnDgMhy8nrouRbalXFdc3RvBHq8Gtm4dDnNcS9mXTspT
	dbYwkusYGnS5FPw48YCMJGoZSOMb9ql2ExQ+hDB3aJJMgbNZifzH5V9d2BnLxnMAn8taCu6R0fi
	VCD0lnC7Hdrmio2YBGqAeeB3UMbIXiug7h3KQ5UsWzSLBzYcKcRt0pekEYq6NyCVQIR60zNZ3n8
	zbMUtHIjEneS37qOE/l7bvcVMPoxOa8dPBgg==
X-Gm-Gg: ASbGncvGf13XPgex47xtqvjTTL8Xe1jdkNG2tjnYDpFQCVzMRCnXspUfd/MLWW0v2wh
	tqz6FwZIcSsns/1RD08QvU/WMpsQf2OIJXnT5b30ORX8g1j1uxfnYj3P3o5UOQ1IMDT5+kAqDmK
	lQXBYg66ksemYhG/vELTUp1YzbMCte2ed1Dw55jZnP8g7l6sPIY4tMMnE/u7txPEVD/pj5RkUjw
	X0XU7k87GTuwM3rKJ6P2F0yHKY9GwFef26KRkdCbhOV5StdEX8PKZOSIV9avoMkCaw+zvXV1gLG
	ZD3+qMH9hB9rFJ1NxUpe1HxnG16J3y+URZYltovrTTF8OIU=
X-Received: by 2002:a05:600c:3c86:b0:439:9d75:9e7d with SMTP id 5b1f17b1804b1-439ae21d1d0mr164544465e9.22.1740585551543;
        Wed, 26 Feb 2025 07:59:11 -0800 (PST)
X-Received: by 2002:a05:600c:3c86:b0:439:9d75:9e7d with SMTP id 5b1f17b1804b1-439ae21d1d0mr164544095e9.22.1740585550989;
        Wed, 26 Feb 2025 07:59:10 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba549db4sm25816175e9.35.2025.02.26.07.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 07:59:10 -0800 (PST)
Message-ID: <7a7c5550-898b-4ed1-a74b-c2bb9c9d8272@redhat.com>
Date: Wed, 26 Feb 2025 16:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/25] tests/functional: ensure we have a GPU device for
 tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-4-alex.bennee@linaro.org>
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
In-Reply-To: <20250226140343.3907080-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SZJjfN9xzLr5wesohF9XQA7jlmhHXFXihKfekY4QuGc_1740585552
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rGkrvNEPMj41

On 26/02/2025 15.03, Alex Bennée wrote:
> It's possible to build QEMU without support for the GL enabled GPU
> devices and we can catch that earlier with an explicit check.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250219150009.1662688-4-alex.bennee@linaro.org>
> ---
>   tests/functional/test_aarch64_virt_gpu.py | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
> index 06093c6b60..c9463d7285 100755
> --- a/tests/functional/test_aarch64_virt_gpu.py
> +++ b/tests/functional/test_aarch64_virt_gpu.py
> @@ -91,6 +91,9 @@ def _run_virt_gpu_test(self, gpu_device,  weston_cmd, weston_pattern):
>   
>       @skipIfMissingCommands('zstd')
>       def test_aarch64_virt_with_vulkan_gpu(self):
> +
> +        self.require_device('virtio-gpu-gl-pci')
> +
>           gpu_device = "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on"
>           weston_cmd = "vkmark -b:duration=1.0"
>           weston_pattern = "vkmark Score"

Reviewed-by: Thomas Huth <thuth@redhat.com>
