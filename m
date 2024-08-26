Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp962797njb;
        Mon, 26 Aug 2024 01:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxueyIKG0Wed0/0/aQwVFN9LI7WHt7tHT994lOwtGC2tFPELHdjQC44qrftEswj0G3KuRKaWWBfz8Tqw==@linaro.org
X-Google-Smtp-Source: AGHT+IH1lM3D0VdKJ/ZgI0ZNRmNLIx7g1lVGNr0R20c16RUZDeC6oPZpSvfzYUjKsmb08TkTO8DW
X-Received: by 2002:a05:6359:4c83:b0:1b1:acd4:d155 with SMTP id e5c5f4694b2df-1b5c215c4c5mr1269963155d.16.1724659954658;
        Mon, 26 Aug 2024 01:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724659954; cv=none;
        d=google.com; s=arc-20160816;
        b=D/jLFPXhjrdyvoTW+wgH1u6NeKYkiXwCF9NhwAO3ufzvqUsGcXeBdbBNZSomq86gmw
         ysehq4xWVBaOZScliUr4X0oZXydpPjyay/xWbwsi/Pc+PkG33SP052/X1cSCB8SKV8wM
         h3VGUlTUyJOLxzfX772DfCmTrkdek9hpIzjhBH/VhBgO8mEeMGME5vW720CDolZnlRTY
         On9T7osXgUDAW5tjsV/drmR8PXGF0RIKwsPrszcvUWcjv9HVsQmZsoLdZyXFLBaJHy88
         zMPBwI6IzXUlY1WWvIBqfIjPJcLDSIWZJr56AJlWJGz7N5JJgyL9r+GfcX7bNNcTc6M1
         s2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=2NcUYBy7IWNYMsjCHUlBoaXZNOyg/KJNepog9xMLd0I=;
        fh=9M8Wdjn9/9P+A5fxaa1l3znoG4q07IBn5OcX8ql36f8=;
        b=0mnAdUwLEwVqt3slXgFKK8TnjAIaULy18nKKBOzyg3FL7L7SygNcHnWGJdpdsXfWtz
         ri6g6WbjNn8a0VPpZ+zu+tfamzKUdWmK4p9hCtaZjINYKY8RolfMU5yEgVcEr/wbp2Cb
         VnxTOkHyn1nVaeqqeUdCKPre3aIxw5/CdMJEI5Aa4M/kcIHoxy5QJUmD/2Ezn09JOblf
         x4UrdfJh+EvGJfR73g6Zi45a/maO0/GbgKJTye8o1dT1j7n10/IX00VvdWwyYzlsAsCc
         ulQsM8QOAWJO/aOxB3eN6EtQdZlImOWqpXw8vEjir5AkpV4CEeuXCI+9T96zq0+UkqFr
         th7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AOXHzw9K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f3fd4ffsi979811085a.405.2024.08.26.01.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 01:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AOXHzw9K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siUpk-0003eJ-Dm; Mon, 26 Aug 2024 04:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1siUpi-0003bF-8r
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 04:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1siUpg-0003MI-8D
 for qemu-arm@nongnu.org; Mon, 26 Aug 2024 04:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724659929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2NcUYBy7IWNYMsjCHUlBoaXZNOyg/KJNepog9xMLd0I=;
 b=AOXHzw9Kfr+63BM6uBEo+5PFhHlnOhvlmGPPXXjBQOCRfoH5PIMjXSG9wTi6UqkQBF8Gu/
 r9Co2TLaH0S+G5TwxNp3nsO9iQgVuPI8wSmGdlGl0JN794bsMJKmUSgQGESmwstA9vclYK
 dm5FsLr4TJpkwNXEw/dSMUyQcPMJSlQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-luRFLtAPOKCLD4skK5ch-w-1; Mon, 26 Aug 2024 04:12:07 -0400
X-MC-Unique: luRFLtAPOKCLD4skK5ch-w-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-454e9566734so47928571cf.0
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 01:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724659927; x=1725264727;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2NcUYBy7IWNYMsjCHUlBoaXZNOyg/KJNepog9xMLd0I=;
 b=oRQUofPa2mR+bw3kjQ25eCiwg9bp1H+y5mEOvVjq1si3WM7FYjL3jXzUPEI5Uo6Ysg
 9x5VP83vzLCAbymwtFw17lHl/m6lYSauXlAsf1IzZY3K2GhYYTEJIKNbmyKv3fz0NdzJ
 fd0/xUoG3JNt+ufFrvWCRn2JIP9F4OrFzBVGDYDDXb7Efoi2XgLpEO1kC2t9KNtpd6wM
 Kkytj0dOnmxVulmh+Hr0Fx+//YYSeig7PhGyHcV7mKgfEQ2l3O53OCuPMblfKJgJI42n
 /xgvoUMxLeZffuVOQHuV+ogtSvTOAQrb/tPYHNloiGKry0uFtRVmKfR/9gS9TnQZ6GJg
 l0Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUlCc9goW2boU7Ta8lcYtuCh+9P9PKSJZ9h5s2ezuSl9ND8gzJvU7Zi2JOPdKCwHKzHM4iaze/sw==@nongnu.org
X-Gm-Message-State: AOJu0YxVBpiWdTT1UkDaCQTdTT9OgkGaXpbfdu33xuSb/BGDRktw4Cil
 D6fDPlYjMv83MW8HJKXXaAdFgSlpUraGVEmAaGpQaxKFonUGAAs+KIbnKYY6OzGb/3F5VZjgfXo
 itVyLkb/1gby6F6OU/U24mv5TCGgOJQ0GInnG7aHSetWBRg8JWA==
X-Received: by 2002:a05:622a:1143:b0:454:f62b:837b with SMTP id
 d75a77b69052e-455095a6aadmr119661021cf.13.1724659927092; 
 Mon, 26 Aug 2024 01:12:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1143:b0:454:f62b:837b with SMTP id
 d75a77b69052e-455095a6aadmr119660871cf.13.1724659926708; 
 Mon, 26 Aug 2024 01:12:06 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-177-41.web.vodafone.de.
 [109.43.177.41]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fe0d8f85sm41093131cf.24.2024.08.26.01.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 01:12:06 -0700 (PDT)
Message-ID: <f50da65a-b5e7-4fb3-a99f-e8fcecb9fe1f@redhat.com>
Date: Mon, 26 Aug 2024 10:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional: Convert Aarch64 Virt machine avocado
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240823082423.6349-1-philmd@linaro.org>
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
In-Reply-To: <20240823082423.6349-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: WtAJknfUjr/d

On 23/08/2024 10.24, Philippe Mathieu-Daudé wrote:
> Straight forward conversion. Update the SHA1 hash to
> SHA256 since SHA1 should not be used anymore nowadays.
> 
> Provide get_qemu_img() helper in qemu_test.
> 
>    $ make check-functional-aarch64 V=1
>    ...
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv2                 OK
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv3                 OK
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_alpine_virt_tcg_gic_max            OK
>    1/4 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_virt  OK   30.44s  3 subtests passed
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20240822114146.86838-1-philmd@linaro.org>
> ---
>   MAINTAINERS                                   |  2 +-
>   tests/functional/meson.build                  |  2 +
>   tests/functional/qemu_test/__init__.py        |  2 +-
>   tests/functional/qemu_test/cmd.py             | 15 ++++
>   .../test_aarch64_virt.py}                     | 69 ++++++++-----------
>   5 files changed, 46 insertions(+), 44 deletions(-)
>   rename tests/{avocado/machine_aarch64_virt.py => functional/test_aarch64_virt.py} (69%)
>   mode change 100644 => 100755
...
> @@ -176,3 +178,16 @@ def exec_command_and_wait_for_pattern(test, command,
>       :param failure_message: if this message appears, test fails
>       """
>       _console_interaction(test, success_message, failure_message, command + '\r')
> +
> +def get_qemu_img(test):
> +    test.log.debug('Looking for and selecting a qemu-img binary')
> +
> +    # If qemu-img has been built, use it, otherwise the system wide one
> +    # will be used.
> +    qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> +    if os.path.exists(qemu_img):
> +        return qemu_img
> +    if has_cmd('qemu-img'):
> +        return 'qemu-img'
> +    test.cancel('Could not find "qemu-img", which is required to '
> +                'create temporary images')

Please use self.skipTest() instead ... cancel() was something from the 
Avocado framework only.

Apart from that the patch looks fine to me now, thanks!

  Thomas


