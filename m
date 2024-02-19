Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp699993ejb;
        Mon, 19 Feb 2024 05:55:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWd0UeQu3shR379DxVZQufcMTkJaqwUTfzkxkMZusZgcrvB4/c1rstlWK7nvGekn3dcJo0d8k6kZmNLQJSdzGntuYDjL8Ta
X-Google-Smtp-Source: AGHT+IE11N5eY4IaDZ7fyzud96OC8m9LX979YEwSyJ+0sppZEMXEIXK6h6ul4YgdA7JX2y7/cW7o
X-Received: by 2002:a05:622a:64e:b0:42c:613c:b695 with SMTP id a14-20020a05622a064e00b0042c613cb695mr13807620qtb.43.1708350907554;
        Mon, 19 Feb 2024 05:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708350907; cv=none;
        d=google.com; s=arc-20160816;
        b=wW3X1qrbMH+IAJrygThk6kSLEHXySlKAQVl8ffA0ZlYC1EaeJ/FXhyFCftrPr9uUGE
         u2r414yuDF+0G4J/IishMLOrZuhfn4UDt0YV+3NNXBYyFyxgF19PVAwZScW2gOgCd9A6
         j+D/NMcJOjVD5+Gt/RuMefoNK4zNCEb+kVWl791TfXAY9pms3oGXTGAxxWrWHAtSqNlV
         cXy39S46BzwRNZpyxOH8lZfIH1R2lql75w2uW8RWtTmSgXZfn5eL1uj4RZSZ8OuFM66W
         RdupyEl6PdnEUXk3zz00H/A8Pck86qAYMAJAgC4dHIlJjRjytE166i8WuRfx91k5KMX/
         XmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=KOmKu+Rzp/lTJ/ZVZrnXclE2BJLwrNZDXnxjwtEc9xI=;
        fh=F8dSgLzzdCQvSRxSMryu/szA62eHAAivY/m96nUtmt4=;
        b=atoh4SN5pMv7eDhYULgldr0SOUVBe8cqRY4nGGyx05ZTA+UCPoz+YzoSn4quCzvr0w
         fEBrh9+s7FqEopJNVqJ42rf6onD0E19lZidb8y4Pe9J6fjO2Zcgh+rt7++zwyiQxtQlY
         eV/UmF1Fci0s/TgLhiNN98V0bJETqBPjM8f3QvLCiu3db2GEBRi0Rpf6qRXMVD2ZQid9
         g9NEf9YGVUzlUkCdf14F/aBjNalDXbBiFRadx5MTzEwR6ej/HRNdvuEXnYEh3RF6j/3v
         vJkdFKisaA9sBRgNB4TEVgL8QhPhjmWqys21o7PlUtb5miC576uvMz9Jkf/6ECnqNMFY
         3kiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hH1THRP3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d26-20020ac8535a000000b0042dd7b524f2si6037326qto.39.2024.02.19.05.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:55:07 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hH1THRP3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708350907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KOmKu+Rzp/lTJ/ZVZrnXclE2BJLwrNZDXnxjwtEc9xI=;
	b=hH1THRP3lF08LCzBPXbfTT+UxZlSux09eeFjSeITcJ2kt94DtZ6A62AuGvbskR1ISf/tfI
	E2P3wGSi39NiWab7ThtByBzXSlY1jdHdbyoYQAL7JIOZMqnw4ydU50QhIR/upSvwuE769r
	rN2Y2K8FVOnIUJ4tRrfQAc6QI7gdbn8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-jWLKjZF5NmuiOg4SVYPuyQ-1; Mon, 19 Feb 2024 08:55:04 -0500
X-MC-Unique: jWLKjZF5NmuiOg4SVYPuyQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-607cd6c11d7so61992367b3.0
        for <alex.bennee@linaro.org>; Mon, 19 Feb 2024 05:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708350904; x=1708955704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOmKu+Rzp/lTJ/ZVZrnXclE2BJLwrNZDXnxjwtEc9xI=;
        b=PYwFXY+7RGduJp6ixnk4tbkj4OvGNbgiBlNu/k/xxSrXk3C3/NxMdS7UMWOP6pdIX+
         kzMaqeYBLBsW0hRPJ0YuZmzMpC9wv8X6D/2FJxTnwjI6qB4NG42nLDf2hUcBrFfY9DiG
         xBIFKsN+sCIntRwmOB0OS7QHOJshD5IXsw3S++qdEGsAYoj9PTncAlUz0E8UuLLGWmyL
         kPJVcgRbVkwlau0bxBJyNoAS73x6OPyc13+judXEbbgpZ7qKvnzCZ8fb50zp3KDhfpw2
         sfgeS9qS8tHmNfY1CQc2ZXTZQG46kLCwAGiMSTiGPPQVezAVh/i2a7m5uiO1dSjkG/J1
         6SCA==
X-Forwarded-Encrypted: i=1; AJvYcCXKV66hSk5u/gJBAlcPLn0YCVp4wF9HPy9a7LasYq8Pz77sGbABAPEK7tgjrD3pCSb35qsvvnrMtgxqQ8UCeDbxd0F2YdRK
X-Gm-Message-State: AOJu0Yygzl2BkA5hsx1FxzwSCfkO3G4f+IM2SUfvbYvocvvP9Xi4ZdCv
	tu2M6brVtYuyUC0s7xDJzEDA3S1Qq0U1a1kd4nVbxusStQfwEvfCsfVH/oeS1N+MB+c6CqxPMRf
	css+Ez/uprSiUl1Xz5db7RChRWS83zqb2WcRa+/jzMO66Rslf1DBKKw==
X-Received: by 2002:a0d:cb89:0:b0:607:c93f:2c2a with SMTP id n131-20020a0dcb89000000b00607c93f2c2amr12158211ywd.46.1708350904217;
        Mon, 19 Feb 2024 05:55:04 -0800 (PST)
X-Received: by 2002:a0d:cb89:0:b0:607:c93f:2c2a with SMTP id n131-20020a0dcb89000000b00607c93f2c2amr12158197ywd.46.1708350903924;
        Mon, 19 Feb 2024 05:55:03 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-177-48.web.vodafone.de. [109.43.177.48])
        by smtp.gmail.com with ESMTPSA id f20-20020ac840d4000000b0042e14c58ee1sm700128qtm.26.2024.02.19.05.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 05:55:03 -0800 (PST)
Message-ID: <fb09a916-a17d-4d2a-a04d-8c44f73fc1f7@redhat.com>
Date: Mon, 19 Feb 2024 14:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] tests/qtest: Reorganize common code in
 ivshmem-test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Anton Kochkov <anton.kochkov@proton.me>, richard.henderson@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240216144456.34992-1-philmd@linaro.org>
 <20240216144456.34992-6-philmd@linaro.org>
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
In-Reply-To: <20240216144456.34992-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 41xkMpMyxwq8

On 16/02/2024 15.44, Philippe Mathieu-Daudé wrote:
> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> This commit reorganizes the ivshmem-test qtest by moving common structs,
> functions, and code that can be utilized by other ivshmem qtests into
> two new files: ivshmem-utils.h and ivshmem-utils.c.
> 
> Enum Reg, struct ServerThread, and mktempshm() have been relocated to
> these new files. Two new functions have been introduced to handle the
> ivshmem server start/stop: test_ivshmem_server_{start,stop}.
> 
> To accommodate the new way for starting/stopping the ivshmem server,
> struct ServerThread now includes two new members: 'server', previously
> present but not a member of any struct; and 'status', a new member of a
> new type, ServerStartStatus, used to track and handle service
> termination properly.
> 
> Additionally, a new function, mktempsocket(), has been added to help
> create a unix socket filename, similar to what mktempshm() does for the
> creation of a shm file.
> 
> Finally, the ivshmem-test qtest has been adapted to use the new ivhsmem
> utils. Adjustments in that sense have also been made to meson.build;
> also 'rt' have been removed as a lib dependency for ivhsmem-test.c.
> 
> Two lines unrelated to these changes have had their line indentation
> also fixed in meson.build.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Message-ID: <20231127052024.435743-3-gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
...
> diff --git a/tests/qtest/ivshmem-utils.c b/tests/qtest/ivshmem-utils.c
> new file mode 100644
> index 0000000000..b9578ab554
> --- /dev/null
> +++ b/tests/qtest/ivshmem-utils.c
> @@ -0,0 +1,155 @@
...
> +gchar *mktempsocket(void)
> +{
> +    gchar *server_socket_path;
> +
> +    server_socket_path = g_strdup_printf("/tmp/ivshmem_socket_qtest-%u-%u",

Can we please avoid hard-coding "/tmp" in new code? Please use 
g_get_tmp_dir() instead.

> +                                         getpid(), g_test_rand_int());
> +    return server_socket_path;
> +}

  Thomas

