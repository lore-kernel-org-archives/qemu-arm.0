Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2809657ejf;
        Tue, 27 Feb 2024 09:14:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMprS7CuVVbTtGNLyk8AQQgaqTXQMY1gPtaty+sGWMXIENzQLVmFa0oFRlybnYOJgx+TR5
X-Received: by 2002:a05:6870:d88b:b0:21e:9df9:2596 with SMTP id oe11-20020a056870d88b00b0021e9df92596mr11452914oac.42.1709054095803;
        Tue, 27 Feb 2024 09:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709054095; cv=none;
        d=google.com; s=arc-20160816;
        b=yWnvw45UWLwK/gd1NyeOVYRVs8Jvyda0LLr4HM06oPHu5uzBgApNO8gz3iXgn1JOMA
         A7kX/dbFXnNKde/bG6z5KPsi9sOiLRIflGo9MIzeMcU18xwWWtg3CF7C3IR8v2ZJcA7T
         mdA8jz+vgi3WblmPx2OZUJxlFb33CnVgl91V1vYqYZgL4PXEnlemMd4JRoLmInm/Au8O
         M84nw/plCwN62hJ4XqgKpSt/9H+zgKf5CQcBVF1tHjAXigQczmWMJhZK1VqgpvrJ2+QN
         M36YEZuUUjisZqK05EhH2T71DAQLa7wJM5T7nb3J3/TCqDC6GQdZbmX/ddijG2wb7f/d
         ZYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=8KxYcjTO8o1tTxUM/2gXBCnQ/OmUKZSk83sSWMMi6XM=;
        fh=oUNEGq5Jp9A1lVgt6bTHDeBq9b6dLi5c7sj/kZOPvQU=;
        b=gYGAyQdanwntso4MjOT6iCC6M4yMamai/r6nlsFlKcNpfEUjiWPt+gDT2j/ERKaI4Z
         7NwpgVGJtNPRfny9HyFbhItO8SH+a5nU82MHrMvNX7Q8V4Vn35yNVxVtihojkPjdtAdk
         etLl4WAVVRR+HSL5LLpLiGcLXYHO399IkkmkdcrjJktWiJI+Zb9lte6TvfrVAheEdbxw
         Ls6/81JzJz8W3IYeYfDiK3hmRMJdXRcDFr1l8eJQ37w2x2ronSfIm84Xh7hILNQNJ0Ou
         NEva6VlAx9RhW00d56oYHSAGLMsDsltihup9DRUT0A9uwxB2bMrc87Vpjg3Ez8PgchiN
         TrOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zm8J1ILC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id he15-20020a05622a600f00b0042dc8c25f57si7691263qtb.23.2024.02.27.09.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:14:55 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zm8J1ILC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709054095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8KxYcjTO8o1tTxUM/2gXBCnQ/OmUKZSk83sSWMMi6XM=;
	b=Zm8J1ILCh5a/2uc6VkO8pHJEKegrZtPJdFSBcOrYPA5An/2WRaKKKfzS66rtKMFZLU52AI
	372D4bs/KgbkjMPCaey5EW8nxQq+5fBwnX8ITI7HgQtcFLbioRHgY93dx3p3JgMdUg4Z1V
	RSWho633M3nkHY8l5um2MDcqQ36v90I=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-diga88AGPvajsEXEniwn7w-1; Tue, 27 Feb 2024 12:14:54 -0500
X-MC-Unique: diga88AGPvajsEXEniwn7w-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-21ea3c5425cso3874827fac.0
        for <alex.bennee@linaro.org>; Tue, 27 Feb 2024 09:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709054093; x=1709658893;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KxYcjTO8o1tTxUM/2gXBCnQ/OmUKZSk83sSWMMi6XM=;
        b=N2vkV7uDX5ZIe6adnpMquv5HtobaUm/hGW2ECAoxD+BAE+pEqISl+axMSSs4BShaVy
         pxLt8X7hBKfhRm50+9YU+mYnyJqJOatXn9Bk2Xo/48/Ditc+4oFApIzb4sPLjJ7GYI8L
         FQvzvMJy5BQH6/PpTF9XbgjYLHY3nbqTQJCj7FMR4bxJpfuqY7eXQEJSnUJaljmFvtTZ
         v/ehOdWqrgWkuV0BCwZjb6D4eOmVr/xAlh1deS23v3ygjAlqMHRmgGWlg2JNDfRXjg77
         DxkENyqY+6WXigoiCYmYu7VyUFijsFhpuNpo5C5jmIjJnAMTx23KPZkQejnm8J+Gu4EP
         35Ow==
X-Gm-Message-State: AOJu0YzFyUJzwqBBQ0Nn0kgS+Q+dE+FkCXiyCcYku/w7X4+yAXbq3b4z
	yNfp2was/uYklUhuN7aLSa+oOWkm6tR7xRdT1R40kAYRyyTcYeGku0sLjdph+JYOUjbnQQEaFXl
	8YbztHFtB0kTRuWXj2E3+zRwistI6U17GbbOj/VwZy1zyzYnb+CG3vzFo8Ri+Mnkaxi+TKyD/Le
	7if5oogmSx2ke7/1bxw8PYG3W2UBruPwevZQ==
X-Received: by 2002:a05:6870:231f:b0:21e:8a73:f45e with SMTP id w31-20020a056870231f00b0021e8a73f45emr12457455oao.16.1709054093523;
        Tue, 27 Feb 2024 09:14:53 -0800 (PST)
X-Received: by 2002:a05:6870:231f:b0:21e:8a73:f45e with SMTP id w31-20020a056870231f00b0021e8a73f45emr12457389oao.16.1709054092992;
        Tue, 27 Feb 2024 09:14:52 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id p14-20020a05620a22ae00b00787ec96ef6csm279627qkh.132.2024.02.27.09.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 09:14:52 -0800 (PST)
Message-ID: <5aea155a-0f82-4739-8f4d-fab4736f6265@redhat.com>
Date: Tue, 27 Feb 2024 18:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/29] tests/vm: avoid re-building the VM images all
 the time
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-arm@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Michael Rolnik <mrolnik@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Brad Smith <brad@comstyle.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, John Snow
 <jsnow@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <bcain@quicinc.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-riscv@nongnu.org, Bin Meng
 <bin.meng@windriver.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Weiwei Li <liwei1518@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240227144335.1196131-1-alex.bennee@linaro.org>
 <20240227144335.1196131-4-alex.bennee@linaro.org>
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
In-Reply-To: <20240227144335.1196131-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tw31lZMszKQZ

On 27/02/2024 15.43, Alex Bennée wrote:
> The main problem is that "check-venv" is a .PHONY target will always
> evaluate and trigger a full re-build of the VM images. While its
> tempting to drop it from the dependencies that does introduce a
> breakage on freshly configured builds.
> 
> Fortunately we do have the otherwise redundant --force flag for the
> script which up until now was always on. If we make the usage of
> --force conditional on dependencies other than check-venv triggering
> the update we can avoid the costly rebuild and still run cleanly on a
> fresh checkout.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2118
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/Makefile.include | 2 +-
>   tests/vm/basevm.py        | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index bf12e0fa3c5..ac56824a87d 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -102,7 +102,7 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
>   		$(if $(LOG_CONSOLE),--log-console) \
>   		--source-path $(SRC_PATH) \
>   		--image "$@" \
> -		--force \
> +		$(if $(filter-out check-venv, $?), --force) \
>   		--build-image $@, \
>   		"  VM-IMAGE $*")
>   
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index c0d62c08031..f8fd751eb14 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -646,9 +646,9 @@ def main(vmcls, config=None):
>           vm = vmcls(args, config=config)
>           if args.build_image:
>               if os.path.exists(args.image) and not args.force:
> -                sys.stderr.writelines(["Image file exists: %s\n" % args.image,
> +                sys.stderr.writelines(["Image file exists, skipping build: %s\n" % args.image,
>                                         "Use --force option to overwrite\n"])
> -                return 1
> +                return 0
>               return vm.build_image(args.image)
>           if args.build_qemu:
>               vm.add_source_dir(args.build_qemu)

Reviewed-by: Thomas Huth <thuth@redhat.com>
