Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2203018ejo;
        Mon, 8 Jan 2024 02:50:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ9YLu69sqPOamKGJXVxoV/sxf8Iqha/7/WIVQk6AwaQaHFLzZ0ngfv1ikXv9dEPP7k3ep
X-Received: by 2002:a05:622a:343:b0:429:78f1:d6d5 with SMTP id r3-20020a05622a034300b0042978f1d6d5mr5574563qtw.41.1704711015340;
        Mon, 08 Jan 2024 02:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704711015; cv=none;
        d=google.com; s=arc-20160816;
        b=gK8LSJFePL4XIZe3UyIrBGY7sLqk28nb3M5GCaW3E7GP6lW7MAE5AsqM7VZGsfwAQ+
         nguOHPBQdG8iF75vpkTKEaFgLNBmMdM0M/2cZHxY/TzYrtRq0s+yWjOGveTGopidLiN9
         3VE6mVgiBBIML3tJx4CSE0LVo9QdPFM18Uoz7XXwhdH7KyEUJK923lx36P7Px40PvCC3
         M8HDGjl9BPtenKJA7IBW00K1br3arcs1sJONiiL8yQOBbgHMxDZa0NKPaLLfrlyrFeXA
         TB77OD0x+DvErUxp28kVzLPGK0Bu/HUZWVxDBfCj+wawA3ieQSUsvIjSYOujl4RRriiq
         4vMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=m8yetf31yAf7BiDoZa2pb4vYexJ5Tffk/BGs3zkqugA=;
        fh=H5xzMKAgNgBTBP3ml7ExJQLb7rTZVUAhqHuN6rwikpY=;
        b=yExgdUhHzFpdVz1XPtZaRuMn5byvwx3lf+i3se4GqSMJZVqjT5DU6RTmx/KVZ8EUQf
         jSgIa8iZZZpTrmuF8Fz5QjCvbhHWz8YQSgMac1Vh4nAVo3VSZcA/0gTHlt2BMX3WLdoL
         ckjmUETnQY0RYFp+hGK1q4yd54bmwAyldLZlQYpvIgsBspv6TQLh4gY/xdqfDrEEtXEi
         YwgMckd4oNqhefMfimluQhNbYcl9eapel025zh0+SruZsnZGJpwGW2zSUxs539IYrg7l
         r5aHjxLu8wXbkxPgd0/mijrNAhqUyeTcYVyp4bLgq8BzRo5M5DVAVOVbzsdC5IileyjD
         WjSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MjkunoOJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h7-20020ac85847000000b004299db9221csi173270qth.136.2024.01.08.02.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 02:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MjkunoOJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704711014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=m8yetf31yAf7BiDoZa2pb4vYexJ5Tffk/BGs3zkqugA=;
	b=MjkunoOJIUTgpKN2PLz3FSn1+HfQRYH1J6vWeE/hbQMMnXHS+yLk9vMIcR2abMkMoB0h/X
	cO9ZRie4tOC4avFLfK4Oa8GuOeU6w9kQGQQsJkjm0OknB8hu4ORCPxr6C31uvEd6QF+j+K
	EVQ+OIXhNQd7uBmpEaBO54iZzOncYf4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-XTYGXul_MQmpltFChYdCbw-1; Mon, 08 Jan 2024 05:50:13 -0500
X-MC-Unique: XTYGXul_MQmpltFChYdCbw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-680139b1990so39789816d6.1
        for <alex.bennee@linaro.org>; Mon, 08 Jan 2024 02:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704711013; x=1705315813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8yetf31yAf7BiDoZa2pb4vYexJ5Tffk/BGs3zkqugA=;
        b=oz/2CKCbkdWEHtfFzzKJ0+XZNaCe2Yb2xEL1sGzdakpBQRycrvNiwlcWH+G1yvF/Jc
         UQf6FG87BvciA8BwJAxHdqMcCkB+nwgg0wH9fV9jZ0ouKn9uwTmW70fwYI+wQL7PHAPe
         QHNLL1u3GvH4u9kdZfiiBQtaCAPChOmeel/lTkmucfK1r4BI/VkW8vYMp+Gz6SIAQWru
         gKFUSQprwS4hNrUmlR6XEv3JU9felTxXa+mT/ibcbpH+n1Z1tutY7ZmPT/fCjVyKv/TT
         bN5Oxx9VM7pDcEXQ8PJarxk7XQutHwRuLoOm2F+/pVFFLxfckiglI2X8L0QfU+ivLnJP
         gIFg==
X-Gm-Message-State: AOJu0YzskpWPl2TSHDFEd4ec/hQCH3dkNFQ4HHUlx93wA1pYapOxBK7x
	dnzzRyjya379f2HweDTnwXHBKDop/SpOMLslziAFzOd6HHjf14yR3mHNLD66w2OBdEOxlduduBM
	jRPj+U8P1yMZWRR713ma0zOwo
X-Received: by 2002:a05:6214:1311:b0:680:fe80:2f7a with SMTP id pn17-20020a056214131100b00680fe802f7amr3723245qvb.98.1704711013318;
        Mon, 08 Jan 2024 02:50:13 -0800 (PST)
X-Received: by 2002:a05:6214:1311:b0:680:fe80:2f7a with SMTP id pn17-20020a056214131100b00680fe802f7amr3723221qvb.98.1704711013104;
        Mon, 08 Jan 2024 02:50:13 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-179-78.web.vodafone.de. [109.43.179.78])
        by smtp.gmail.com with ESMTPSA id z9-20020a05620a100900b0078190599d4dsm2572738qkj.39.2024.01.08.02.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 02:50:12 -0800 (PST)
Message-ID: <549c07b8-1a56-4359-bc22-854fec342727@redhat.com>
Date: Mon, 8 Jan 2024 11:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/43] qtest: bump npcm7xx_pwn-test timeout to 5
 minutes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-9-alex.bennee@linaro.org>
 <084d127e-1d77-4c45-b8e9-fe3d867e7755@linaro.org>
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
In-Reply-To: <084d127e-1d77-4c45-b8e9-fe3d867e7755@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mwp3rovGjYAG

On 03/01/2024 18.40, Philippe Mathieu-Daudé wrote:
> On 3/1/24 18:33, Alex Bennée wrote:
>> From: Daniel P. Berrangé <berrange@redhat.com>
>>
>> The npcm7xx_pwn-test takes 3 & 1/2 minutes in a --enable-debug build.
>> Bumping to 5 minutes will give more headroom.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Message-ID: <20230717182859.707658-5-berrange@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20231215070357.10888-5-thuth@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   tests/qtest/meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 000ac54b7d6..84cec0a847d 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -1,7 +1,7 @@
>>   slow_qtests = {
>>     'bios-tables-test' : 120,
>>     'migration-test' : 480,
>> -  'npcm7xx_pwm-test': 150,
>> +  'npcm7xx_pwm-test': 300,
> 
> The tests seem parallelizable, maybe this file could be split?

I've submitted another patch that speeds it up by default quite a bit:

  https://gitlab.com/qemu-project/qemu/-/commit/71dc6ca2a8fa0eca8ab8e87e

Let's see how that goes...

  Thomas

