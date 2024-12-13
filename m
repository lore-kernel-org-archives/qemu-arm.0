Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp398307njb;
        Fri, 13 Dec 2024 04:27:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVIuH1mbcBUyD1v/1Yzew0SdkVXQLgDxubYqO5sxIcdSfvwL1viKK7OwAq99q85smDaVRPrAGjDSnJBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHE16sEVgUQJHtnGOw3vPoJ4lzy/+xg7sgDKeYrPOEchsM0EutIUbaA8rIiltR83kma/+ra
X-Received: by 2002:ad4:5aea:0:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6dc968723f5mr40111626d6.34.1734092838622;
        Fri, 13 Dec 2024 04:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734092838; cv=none;
        d=google.com; s=arc-20240605;
        b=Ok6P1FqmU8bfCO4AmOBxWcPH9KHKm/M9akSN5E8AM/xiEuGp155TruJFADChRaC+M5
         v9C7FJlDcQm8uwnl60bpNnV5IbFynpV0BYj7PHfOzSnnhsbNhMhyoppq03TCfGpXcfVC
         ufzdSUzEEJ5sYRTHa/mcXe8gU5Sj27RHwmsMGYSXEStpxNTCY049/kA11Z3XiA/MvkKe
         sV/0LYEIilZz/t0C5tMMEJRVwu7T1QnscHh/yedC7c0bFidubIjL5412Yil9RFvKjxoo
         Hm4RIV9rfVAV3+GLWy/yce/ghi+/CEgzo/CosOV03rzS/5xnZJRnhl4YD8+ddOM+cZAV
         DwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=w/iFNh1Vle7YqZYTB19tHU6pCpdwFKjoDv35iyVfAHc=;
        fh=okL+6Vw530z36fADzeYCx6AyCXuaNeA/EuJlmneZDFk=;
        b=DL00EHugYpSWrFfPgg/FGwhe2xlnzUI7B+ubHqhYW7MXGfdqZBcuC2KNuCABl4Ym8r
         hr9E1AfuSfiOceyXv+N9iBBD+RyPvITL5KyFtKkoEkIt1izG8jSbY2d+r1idIvxzdUme
         gU1QoYY4MUA8+DrLxTSmdjNJEuMxq5RWrbggYI5f1XGc/6WbuXwbIYw9V+ZmeEWn+ISD
         fUD0CxvaeE172HB5eNH0Rf69jMp9+OWnch550kq8k75d/6mmelEZNPwzy8viplBkKy+y
         P7IuTgUD+lweH7WdFeb7wpEMB2hasAbnTUVEFk4nf0xGcAlf8t/Rtki7xo85WvzjKf4n
         ewxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WjeP3jpS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678a7c4572si67150991cf.462.2024.12.13.04.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 04:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WjeP3jpS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM4ke-00050c-Ni; Fri, 13 Dec 2024 07:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tM4kc-0004zq-75
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 07:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tM4kU-00050M-9G
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 07:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734092784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=w/iFNh1Vle7YqZYTB19tHU6pCpdwFKjoDv35iyVfAHc=;
 b=WjeP3jpSc6QseO+XLSTDudzaOqlHSqZjQfK4C3iGrPeeLv9tzv/bO1YW/p+En/CJDuseob
 LGXfwBKmpBVOWasJ7AoKfINLmpZhkSlWKmBycaH4axBMNpWPJj9dbujyvx6nNErrEcVbEl
 zYy6eNHUAXMKpaVnaErmNfCPyHVPxD8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-__9Fv3bpMtGOjkK7jmltZQ-1; Fri, 13 Dec 2024 07:26:20 -0500
X-MC-Unique: __9Fv3bpMtGOjkK7jmltZQ-1
X-Mimecast-MFC-AGG-ID: __9Fv3bpMtGOjkK7jmltZQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-436289a570eso10421145e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 04:26:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734092779; x=1734697579;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w/iFNh1Vle7YqZYTB19tHU6pCpdwFKjoDv35iyVfAHc=;
 b=XXbrWAvJJ5Jl8IxJGB5L7bxAwwW+i1ITcyQiU1kJ6EjFKsPJ6T0ugi4AmTA0CpAwuW
 Ui0dSWn1dPRNC/tSzD8ZPWATiGbCvZFqiZU0/TWghvzfloBQNlsl9rJHEoifkf3o+mFi
 Dldre9jUJZdPUVHKL9Ga5tqrYBM9aFUY1rZCP6qQsrdBGc9oOf2979cBbcHnQtUtG1vj
 ym9kBkaQDbKCY6gy9ULEXWfeEJffoRzfWxaolX1wUxEw0rDPMGeJrn/e5WUIv71TbG6v
 bXOL7VFrCFXys1aoVBF290746ggj/ntOASI0hv3gSZAUheFBqdq6yWkJd4X2ZcwmbzNc
 +2bw==
X-Gm-Message-State: AOJu0Yx+wiQQ09FwocqrVsgNULhixIYUN/F1NK2hkLqvBobq1/2YkEOd
 IdcgrC2RkkYWgD9N1RQ2dl3YRGokwY3IXGFcWvsnjhzd+En+nZMa4bYNp+DmGqM5UgtTJi7959j
 wae3vEu5uIL5wWiWSO6bAuo9XTtX9fYHfrQRkBwAuoTzA7AFq5A==
X-Gm-Gg: ASbGncvjmcbJyHiPPYQn6m6Y/GNtIyDrJe4yBlK6hDR0Q4WE7pnWU7uIUKJsVO0acw4
 2ZpIrQ46j2HtJ4Kgec1J2GGr9StltKnvwbKHODObmedEE2LTccLIt3o1UMbFXTmwZA6Us1bzRKf
 5nhuUO2yIoW2xSk5/sYOgV0YRAj4IduQgL6kz5CtOMX/OBBXU/lEsCaeq1BCtNAlJ+EyMvMmq1m
 SUeBzhyOU/7NN4jClhXUF7+IFLv/WJzZj5ekUkYGKcGNR3znhTrxwDlUxBEY1RlZLLpYPuO46kx
 o/5QRw==
X-Received: by 2002:a05:600c:350a:b0:436:1baa:de1c with SMTP id
 5b1f17b1804b1-4362aa36cfdmr22347745e9.13.1734092779127; 
 Fri, 13 Dec 2024 04:26:19 -0800 (PST)
X-Received: by 2002:a05:600c:350a:b0:436:1baa:de1c with SMTP id
 5b1f17b1804b1-4362aa36cfdmr22347535e9.13.1734092778786; 
 Fri, 13 Dec 2024 04:26:18 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436256b7c62sm47528135e9.34.2024.12.13.04.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 04:26:18 -0800 (PST)
Message-ID: <f03adc63-5167-4982-90e6-70b65f0c90cc@redhat.com>
Date: Fri, 13 Dec 2024 13:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest/sse-timer-test: Add watchdog reset to
 sse-timer test
To: Nabih Estefan <nabihestefan@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, roqueh@google.com,
 venture@google.com
References: <20241213002602.4181289-1-nabihestefan@google.com>
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
In-Reply-To: <20241213002602.4181289-1-nabihestefan@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jn9IMgJpCfqJWmpL6fsy_vOUY8vjTN7_pNbq-MecRbI_1734092779
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FBncLsrMf9cO

On 13/12/2024 01.26, Nabih Estefan wrote:
> Recent CDMSK Watchdog changes (eff9dc5660fad3a610171c56a5ec3fada245e519)
> updated the CDMSK APB Watchdog to not free run out of reset. That led to
> this test failing since it never triggers the watchdog to start running.
> No watchdog running means that the timer and counter in the test cannot
> start, leading to failures in the assert statements throughout the test.
> Adding a reset and enable of the watchdog to the reset function solves
> this problem by enabling the watchdog and thus letting the timer and
> counter run as expected
> 
> Also renaming the reset_counter_and_timer function since it now also
> affects the watchdog.
> 
> To reproduce the failure at HEAD:
> ./configure --target-list=arm-softmmu
> make -j check-report-qtest-arm.junit.xml
> 
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>

I think this fixes the problem that I was seeing on Travis-CI:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2702

Tested-by: Thomas Huth <thuth@redhat.com>


> 
> diff --git a/scripts/meson-buildoptions.sh.tmp b/scripts/meson-buildoptions.sh.tmp
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/sse-timer-test.c b/tests/qtest/sse-timer-test.c
> index fd5635d4c9..d7a53ac23a 100644
> --- a/tests/qtest/sse-timer-test.c
> +++ b/tests/qtest/sse-timer-test.c
> @@ -29,6 +29,13 @@
>   /* Base of the System Counter control frame */
>   #define COUNTER_BASE 0x58100000
>   
> +/* Base of the MSSDK APB Watchdog Device */
> +#define WDOG_BASE 0x4802e000
> +
> +/* CMSDK Watchdog offsets */
> +#define WDOGLOAD 0
> +#define WDOGCONTROL 8
> +
>   /* SSE counter register offsets in the control frame */
>   #define CNTCR 0
>   #define CNTSR 0x4
> @@ -63,24 +70,26 @@ static void clock_step_ticks(uint64_t ticks)
>       clock_step(FOUR_TICKS * (ticks >> 2));
>   }
>   
> -static void reset_counter_and_timer(void)
> +static void reset_watchdog_counter_and_timer(void)
>   {
>       /*
> -     * Reset the system counter and the timer between tests. This
> +     * Reset the system watchdog, counter and the timer between tests. This
>        * isn't a full reset, but it's sufficient for what the tests check.
>        */
> +    writel(WDOG_BASE + WDOGCONTROL, 0);
>       writel(COUNTER_BASE + CNTCR, 0);
>       writel(TIMER_BASE + CNTP_CTL, 0);
>       writel(TIMER_BASE + CNTP_AIVAL_CTL, 0);
>       writel(COUNTER_BASE + CNTCV_LO, 0);
>       writel(COUNTER_BASE + CNTCV_HI, 0);
> +    writel(WDOG_BASE + WDOGCONTROL, 1);
>   }
>   
>   static void test_counter(void)
>   {
>       /* Basic counter functionality test */
>   
> -    reset_counter_and_timer();
> +    reset_watchdog_counter_and_timer();
>       /* The counter should start disabled: check that it doesn't move */
>       clock_step_ticks(100);
>       g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_LO), ==, 0);
> @@ -103,7 +112,7 @@ static void test_timer(void)
>   {
>       /* Basic timer functionality test */
>   
> -    reset_counter_and_timer();
> +    reset_watchdog_counter_and_timer();
>       /*
>        * The timer is behind a Peripheral Protection Controller, and
>        * qtest accesses are always non-secure (no memory attributes),
> @@ -195,7 +204,7 @@ static void test_timer_scale_change(void)
>        * Test that the timer responds correctly to counter
>        * scaling changes while it has an active timer.
>        */
> -    reset_counter_and_timer();
> +    reset_watchdog_counter_and_timer();
>       /* Give ourselves access to the timer, and enable the counter and timer */
>       writel(PERIPHNSPPC0, 1);
>       writel(COUNTER_BASE + CNTCR, 1);

