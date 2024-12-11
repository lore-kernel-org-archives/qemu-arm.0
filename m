Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3879336njb;
        Wed, 11 Dec 2024 00:05:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPKFdacmzV2MGmzwt2WR0H0BHmleeiOZ9BqnDj17Wx34yy1TQ2k7aTlAEZNgk8/FTaoUfC
X-Received: by 2002:a05:620a:288a:b0:7b6:d1e1:a239 with SMTP id af79cd13be357-7b6eb436929mr306239185a.2.1733904302686;
        Wed, 11 Dec 2024 00:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733904302; cv=none;
        d=google.com; s=arc-20240605;
        b=Y7j/hv8FVvDqwg2gDGiLRouMz3GCNCXX8mBrVDLyYm/opAPLPW4/1/ivn20lMozhxF
         6ckv83RmA+fOBf9DIyfRpHFFV4cPMAuqBX2+BYSMlEWFQdykQPHMqqCKV/XbVB/ozHPv
         pnLjsDBxv/ctjIV3374jjN/sg7nXIcIRtaH/hwj7wEqE7phdohaZRZ18dMubzEBQmRsf
         3Tahpaox/s8X/oCCQ3VafVXkIPQYBfsrMCaM+h3gQIWPV3aIeE2mUXwIw46xcqqXcza4
         3E111uIufErVTIiz5m+2Zx2KncclospH8dHZjmkD0KWjaXoxKButmHbOLJ5DeWwWJ9gJ
         HOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=4s+NpWa+3/3BwA8AAQyDd1povigLaAY4ojJNmt2acTM=;
        fh=D7hl6N4SDWuavT/b953Bm6G85dXc4xMRur1Tbpbs0yE=;
        b=EzfXqWAH25Y8+9O+a+ck1mi+IlM1EQghoaMGr6jGo51EhFXsS4YRyAYzH2TwI715rF
         0fy/DRJGT5VHKPzUcNj1MSW/kMI4ZATnL1WYAZtyjIzi4jkivgiWAq/Yn9kdQCcjIUQU
         zmlEzD2FcRmhAthbLY657LHSCNsibtlSWN0yZnno/F924xHUHw/B8sw7LZ6KsoyKcvvO
         wWWfXfI2phmrkzKgKVbnDwA8TXyVzgSVWpR1XMVCkzoLmQC8MSb/Ruv5PwvF2SUpYdX4
         PZOPh/uq7osfGcDCRTVPdktSKtL25FlXx/v7WkgBkp7MLav/47Qet/1JzzeBc2fAKJ9G
         r0qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gfxWWXTt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d9dd3df6si563331785a.383.2024.12.11.00.05.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:05:02 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gfxWWXTt;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733904302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4s+NpWa+3/3BwA8AAQyDd1povigLaAY4ojJNmt2acTM=;
	b=gfxWWXTtwTGw/jjyo6MyBtnVGVzvR4oMYrkZoz2gxyAvmwtVo+Ymb/joAaL00+pYkqJavJ
	MT9DeXijeWFIArsuOwT1O2VuAZtmkJ1WBCa90OhCpRGxL5iChBBB9DAJ7wD6L7ZHOq76ZV
	MVkIO8pGbA5qBKsX8/KnaGFCxc2AQmk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-UGTk8pPZPlieNvVeTEflzQ-1; Wed, 11 Dec 2024 03:05:01 -0500
X-MC-Unique: UGTk8pPZPlieNvVeTEflzQ-1
X-Mimecast-MFC-AGG-ID: UGTk8pPZPlieNvVeTEflzQ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa68952272bso26751266b.2
        for <alex.bennee@linaro.org>; Wed, 11 Dec 2024 00:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904300; x=1734509100;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4s+NpWa+3/3BwA8AAQyDd1povigLaAY4ojJNmt2acTM=;
        b=dzgvyF00ajgYydso3AwRLRQLhlr5fJS7njRv2CWhAOC/qLyaRwH6yYUteQaq7GL79n
         PUi0xdqSGGwI6qzZxdgx0A4WfIzksylZgF6iPyn46/QiUgeDyv9f4OftrKoPEHrUzJw3
         KQYlT/kx+49INY35qk/hCvrYMrM4TKCWXjy20HRgm03JDLMM+DXoy+sa2eKybMDvLRaM
         jfvO6OK7B+hnPoFSkcaiSV9w8OsMwhKpQON40D0EeMZtcngfavnY+AjNY985q0r0EWV8
         vqJFdF96FkSnZ1pATobneM0AjDQQwA/LQlkSlFCYAXtine8z3fezD8FyWVLUgoh0YfSA
         u5QA==
X-Gm-Message-State: AOJu0YzVQlWeSRAjbH29dEeuhai8/DvSkoJZorrxRC1geDALF3dzZQ2m
	Vpp03FsS84RvYSXssVjVPwODGOv7R0C+AMUCAKSw8S6KRkPf/o7wV0osztRqwiqnXnokvn+Os9N
	npYuklW7cWmMNq0ZpSCG4FDOO6V7ZMWFSEm479XqW59L62sgG92qXtDWGYi1h+Tmxg+Kyy+uktz
	YYFOAXicnziSwEILWKTKynmNNMbXJtSzMquA==
X-Gm-Gg: ASbGncue4ZnMk05rmqfbDER2lf773TiyHHLcW9tI0YXHEMwOqLuMPxHOomBkSv9UeXv
	+d5CvRAeEIgS/OKc3vG5CaNxM0oyxDUR1bpaUW+qm/MBFPad885BXpm47VCJ/gL6oZV9UXHvtSS
	jGUJwaOmYHJ5hhf7Qv0/CKBEsp2B2ifw9bFXliAnRSP/OCaAVuLIixyEP/f8QNUWr2Fzhj0za10
	tLprc51JH5+5zrIH42phKfI4re4erCmRO2YRq1vnzEiLtfqM3T5z/PuaVEYXek5FXfZHUNCQFVp
	r3tr77I=
X-Received: by 2002:a17:906:3cb1:b0:aa6:a501:9b3b with SMTP id a640c23a62f3a-aa6b11a33f8mr165496666b.19.1733904299667;
        Wed, 11 Dec 2024 00:04:59 -0800 (PST)
X-Received: by 2002:a17:906:3cb1:b0:aa6:a501:9b3b with SMTP id a640c23a62f3a-aa6b11a33f8mr165489166b.19.1733904299103;
        Wed, 11 Dec 2024 00:04:59 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-51-17.web.vodafone.de. [109.42.51.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6975b1f27sm330082466b.113.2024.12.11.00.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 00:04:58 -0800 (PST)
Message-ID: <ba91b0da-ea60-4802-b336-f3a650d06ae4@redhat.com>
Date: Wed, 11 Dec 2024 09:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] tests/functional/aarch64: add tests for FEAT_RME
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-16-alex.bennee@linaro.org>
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
In-Reply-To: <20241210204349.723590-16-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iniF19wM_xKJl5rdBNODkD8s69qe3caK8AWsggqM3kk_1733904300
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AmXuXul+uTek

On 10/12/2024 21.43, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> This boot an OP-TEE environment, and launch a nested guest VM inside it
> using the Realms feature. We do it for virt and sbsa-ref platforms.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> -----
> 
> v2:
> - move test to its own file
> - add sbsa test
> - check output of `cca-workload-attestation report`
> 
> v3:
> - build and run test with cca-v4 images
> - factorize nested guest test between both tests
> - remove accel tcg option as it is the default when running tests
> Note: It's a long test and there is a work in progress to understand why
> debug build is so slow (x12 vs optimized).
> 
> v4:
> - use pauth-impdef=on to speed up build time execution (x2.5 faster)
> - increase timeout value
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-Id: <20241203213629.2482806-1-pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/meson.build                 |   4 +
>   tests/functional/test_aarch64_rme_sbsaref.py |  70 +++++++++++++
>   tests/functional/test_aarch64_rme_virt.py    | 100 +++++++++++++++++++
>   3 files changed, 174 insertions(+)
>   create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
>   create mode 100755 tests/functional/test_aarch64_rme_virt.py
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 0a76bd9954..4e207c53d5 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -13,6 +13,8 @@ endif
>   test_timeouts = {
>     'aarch64_aspeed' : 600,
>     'aarch64_raspi4' : 480,
> +  'aarch64_rme_virt' : 1200,
> +  'aarch64_rme_sbsaref' : 1200,

I was a little bit worried when I saw the big timeout values here, but 
that's only for debug builds, right? I gave it a try in a standard build, 
the tests both finished within 5 minutes, so the standard runtime still 
seems to be ok.

Tested-by: Thomas Huth <thuth@redhat.com>

 > +    # This tests the FEAT_RME cpu implementation, by booting a VM 
supporting it,
 > +    # and launching a nested VM using it.
 > +    def test_aarch64_rme_sbsaref(self):
 > +        stack_path_tar_gz = self.ASSET_RME_STACK_SBSA.fetch()
 > +        archive_extract(stack_path_tar_gz, self.workdir)
 > +
 > +        self.set_machine('sbsa-ref')
 > +        self.vm.set_console()
 > +        self.require_accelerator('tcg')

Please move the set_machine and require_accelerator to the beginning of the 
function since they can skip the test in case the prerequisite is not 
available. Otherwise you've extracted the asset in vain.

  Thomas
