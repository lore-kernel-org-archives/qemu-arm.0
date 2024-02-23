Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp766162ejf;
        Fri, 23 Feb 2024 11:18:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb0PAnHKGOhgOUKYWEDL7i+E6Y2c2iu+4VsRbxn1+vzhWG6ZMQzb/zajrBw7Ng9fcSCqox
X-Received: by 2002:a81:ae06:0:b0:608:c5ca:ccba with SMTP id m6-20020a81ae06000000b00608c5caccbamr753046ywh.42.1708715884033;
        Fri, 23 Feb 2024 11:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708715884; cv=none;
        d=google.com; s=arc-20160816;
        b=NZgEIMQi2zFdKkoSzaiDhQUK0WMGXr6ESRUzAa7rHqFguzbB02UKlYIfQTh7oFa/Ml
         Rt8cYwqXGNoH6vt6SN/uYTm1R5oDfFUC2ILUdjOh7Iq8g6CREcefuSsDofjUGkgpXBaF
         mvOBFVJQdealJqqXKDJ9YPSDHe9U7xalluoRyNjmVKz0JrCufCdV0hZMeC9l+wa5FWOC
         uGGDEQ15c7kYF6uRGAphDreUDmHFc3V9paafVQygyjbywMRmQN9X0rS+x0oTI58sEq8l
         pvJwwFhIHSmXr/N7OPnRjibn7vkACwdJWw3Gx8qm+BG0bpoA/Slnf8FDBZGHbOd6iaN1
         nCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=itQAUMMOZcJtxJNZcr/T1fsAp5e++SkYNEcWquRoLuQ=;
        fh=aa7KqWuBBkG0uohUf8uotd2UoQqKUNCpu8IcHCdvQdY=;
        b=O11Lck0Hg7FS8JKHd4KIz7rnQb3NvqF+v4sxV1eBuaVz3P5E3DLdDiy0IGjZDNzXg7
         nBZ1H6Ip5SM23J0O2tT46IkSEtEOP+o1wzUSGyRjZxigC2vOkvrHS1UMY1rDL7fL8goo
         sk4bM9f1tk5RANIHO+H3fwSSeU/PH+qGvwdnRQwEbktU1yiswIgAIlap+xQCHs4qrxxh
         LN+xPiZlHIGX+lIaFh+S9YMfzAkOP7xt8DTMIFZMQV0GyAp1GrqzfVfeZD5Z45vJVGhj
         LSdvKu1TY6YhmHRKsaioesNfzLyYAgGOxXD4Pw2fgcGEGUygFzfgMWXz7E7tiK8g4djx
         Bu8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSEoaacl;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s17-20020a05622a179100b0042dacda1996si17273520qtk.579.2024.02.23.11.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 11:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSEoaacl;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708715883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=itQAUMMOZcJtxJNZcr/T1fsAp5e++SkYNEcWquRoLuQ=;
	b=FSEoaacl5O5d4xwrtmI/jtiROUE1t+zCu8fYSR8mJX5cpG7S3DGB8rQ7hQuUw5fBEpl2xI
	WFhb+jsLDTznfzmOe9bbvBiTChmVnlLG/5q3zVsnxPcdbQiMZ1m7YRtkJsqfkjeWw295iK
	fJQ5a57bbI2ZSYGOML1aVvDc0cxgIck=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-CMvP9ziNObqjayiwy1bHog-1; Fri, 23 Feb 2024 14:18:00 -0500
X-MC-Unique: CMvP9ziNObqjayiwy1bHog-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d22e2f9a0cso5561371fa.3
        for <alex.bennee@linaro.org>; Fri, 23 Feb 2024 11:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708715879; x=1709320679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itQAUMMOZcJtxJNZcr/T1fsAp5e++SkYNEcWquRoLuQ=;
        b=VcK4kQThcqJGKrb16ieR1t3sYYuJgKtld2ACkI2Edknf9VO6D06ca9fgH6oDb4H3oj
         9XQBcCviYkLr0Q8ggdqEGf/sDNv2uZ0LxTsZyMoD5vpUW8r/meTdcQsfyAV5k6rIGaGM
         Ni+sRbbSM/e0Y8MrMLUYRSsuQF1vd63POlQJjkKoAR+Y58FqJqEn5ybGWIY+METbo8gn
         Q8NT2s29WeqaaH0NLvCxSl8OhTcgwufpx541bRgEWaWkmLilJjOSl4nP73210NSA/qP9
         QqhhI1rDtFeOHqtJikMu4R5eDVacIerEKqXbg2UDRO1ahTGKGCQ0iTG07Ny1M16PglQm
         /KGg==
X-Gm-Message-State: AOJu0YzCtxp3jWoTXjaRH0kFawbYz7mLAGBv13lOGQiUAV8piS+i7eUg
	7wQ7+WZ1a7eC3fJCDbu0Uf2L7905vnUY6mQbw7swnlHU2bB51YZ7Z5lWmBBt25bswXYV3OViQPv
	azboJkcLig4xAKMt03jETPhk29f3DdQEPL+CiATJsupIa10izCM9ng3uhIkKuHHh4Mwe4p9YbPd
	POiR0nnRO+ZywTIe/oE+gM/dYrEL7guUnUyQ==
X-Received: by 2002:a2e:9003:0:b0:2d2:5275:b40d with SMTP id h3-20020a2e9003000000b002d25275b40dmr49965ljg.31.1708715878840;
        Fri, 23 Feb 2024 11:17:58 -0800 (PST)
X-Received: by 2002:a2e:9003:0:b0:2d2:5275:b40d with SMTP id h3-20020a2e9003000000b002d25275b40dmr49918ljg.31.1708715878409;
        Fri, 23 Feb 2024 11:17:58 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-176-215.web.vodafone.de. [109.43.176.215])
        by smtp.gmail.com with ESMTPSA id jl20-20020a05600c6a9400b004126101915esm3320007wmb.4.2024.02.23.11.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 11:17:57 -0800 (PST)
Message-ID: <aed34f97-f2d9-4e4a-bfbe-9e90e1f96037@redhat.com>
Date: Fri, 23 Feb 2024 20:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/27] tests/tcg: bump TCG test timeout to 120s
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Cleber Rosa <crosa@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, John Snow <jsnow@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
 <20240223162202.1936541-3-alex.bennee@linaro.org>
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
In-Reply-To: <20240223162202.1936541-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: if7QteY/E8SU

On 23/02/2024 17.21, Alex Bennée wrote:
> This is less than ideal but easier than making sure we get all the
> iterations of the memory test. Update the comment accordingly.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 8cf65f68dd8..a4c25908fb7 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -93,12 +93,9 @@ QEMU_OPTS=
>   
>   
>   # If TCG debugging, or TCI is enabled things are a lot slower
> -# ??? Makefile no longer has any indication that TCI is enabled,
> -# but for the record:
> -#   15s    original default
> -#   60s    with --enable-debug
> -#   90s    with --enable-tcg-interpreter
> -TIMEOUT=90
> +# so we have to set our timeout for that. The current worst case
> +# offender is the system memory test running under TCI.
> +TIMEOUT=120
>   
>   ifeq ($(filter %-softmmu, $(TARGET)),)
>   # The order we include is important. We include multiarch first and

Reviewed-by: Thomas Huth <thuth@redhat.com>
