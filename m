Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7149803njc;
        Mon, 11 Nov 2024 23:12:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVPVgI4YnYOIIM7h+VaByCCpK3ThKJ5TpOEKPfX3eSK1zQfZdmHtRSigmS4wy8hhbWQsDIqcPqTo2HBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFhjgA0ZM+KYUyuxYMtNFifRPJsT9z3LcPhRW6MptqahoNVvIUwt2pUpeCwEkP20SGjxZPu
X-Received: by 2002:a05:620a:44d2:b0:7b1:4fab:9fa2 with SMTP id af79cd13be357-7b331f183d4mr2159842585a.42.1731395534349;
        Mon, 11 Nov 2024 23:12:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731395534; cv=none;
        d=google.com; s=arc-20240605;
        b=JE9sXXUlidsJ7BUURxY/wKEFVrv2x0T+DSbTB5qn4b6lv8YalctsWrIzXPppVVUX0C
         7psIfxu1FCofRlNqgcOTGljyJuKybnfcuGarPmrdUpuEVsVfk3eHj/WtCo5Y9YIpVbv0
         t0VqQeft7ymFajoGLAA4g4aUdCqO0Z1JgWBEZ9Tssh8YGeNbylT5Q2USxrZN3MhO/cyP
         7lPgAHKdM3HpaWJtCbTLHs5UWzvWrGQjrbQ45jrm8dHLzzRzZIwB56sPKLcByLv3pW43
         tOpnpOuHNPcuJJNZo5sXeYQ967FrPxv9s97rIc0V4nZEqfiggsuviwQXeme3eApgQrN0
         93Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=m11e0o3+CrruBeCDBMWoKtjF5L1A9qeK2nO915NyIeg=;
        fh=9L87wzS1b8/AvNcScga9ZYT2s3Tc6JjgNt28JWVuDCY=;
        b=J9dUyCnnlt3SduAlcXEBKkT1aUTwl1IymBo9rdk2d6vWbX9UJmj0RyI6ih2IFzoA8w
         zqsfpUaQxqjFC0TZd9ZFWn7SXHYl6OdR1xeL+H0LsOteCh+rivfq2iW1/Zn0PkCIym62
         B+PvYx9NIEGP2lmeQ66eCqxojZA7gYd4bcBxB4EFDlUTAMgb+Stc6F0pVxpE0pJWv0Sh
         qNt7fwcr237aohescC09lqshkTSCatDKm3Z2K6Xisbwo8tyIFdOBKytsPNhCzuG9BxH1
         zb5YlK3Yeayiim+47WsCPxg0Co8/MMrpQ5cVkpuaaIypA9PccGRpRVwN0aXGDU1NkybV
         pRfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HktyYLH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac3e9desi1281421285a.102.2024.11.11.23.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 23:12:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HktyYLH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAl3z-00081t-61; Tue, 12 Nov 2024 02:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tAl3x-00081T-11
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 02:11:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tAl3v-0006go-EI
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 02:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731395502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=m11e0o3+CrruBeCDBMWoKtjF5L1A9qeK2nO915NyIeg=;
 b=HktyYLH4W3HOpURf5PCedprnL3kHOVU+CXyh5KdsDSpqT1KmML1dxSyexNmDwYgosdN9CK
 2G5dxr/pIqE6l4wOUw64mgnxAJqitq0R6eRs9+KVZ3JiqPl93oghHI5JsTpbSmlcNqoT7G
 GTXGHcZh61NzrTXk5Gmy8Yt2VpXYchE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-mAx9d4JtOxSSMFWRoEXsTg-1; Tue, 12 Nov 2024 02:11:40 -0500
X-MC-Unique: mAx9d4JtOxSSMFWRoEXsTg-1
X-Mimecast-MFC-AGG-ID: mAx9d4JtOxSSMFWRoEXsTg
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a9a2a81ab82so419478266b.1
 for <qemu-arm@nongnu.org>; Mon, 11 Nov 2024 23:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731395499; x=1732000299;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m11e0o3+CrruBeCDBMWoKtjF5L1A9qeK2nO915NyIeg=;
 b=AR+y4VaLXIGeN++Z9BNCAJ5Yccyilwt+YAKFr/49UOiiVPTV19RcR9aj81H5NCkzX5
 1od3eL0pi9zA9i5wLa7DrZFuHDFTHgYosF7BvaFnoqmU0fpAvqxkuGVsX5j0t5mArOoi
 hJNbi/iN9qyyjxYK6U+q777rJ7e+/Wl0FvthfuGiUuyIYKvSuUY/lmmXKaB//K+WISh9
 1tNOlgoooarIDKr5OkstNXfSRY1RMGQY9CY5+naRzABEgjwkqCivAnQ37U/G+Wrvqu+v
 tyYD3ikpvLAh/7QQYky7NVIVnq1djEuktlCTxyr8UzE1dOo7sU+vutRz+eAx17fIc4or
 QIOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw5V1tb566goaJA+rzI7eTPya+O89FsdwASzwJZdsLDv199/27oTDzzKGwbkYPovwXTf6C81hCnw==@nongnu.org
X-Gm-Message-State: AOJu0YxmuJLNCLWxVqhALMzgMA3KQ7S6AE4Nleit7+v+yjdpcMJICcN8
 RXdOiyAteahU9KW0FfCVttzxfkw4b0eXfmMVHj1/XFzNhqMsGKRb4fE0UsunFZoXRj8s1hdQhqZ
 Fmozjw9X7BPiQZc2ZlgU8eTtOOAb/JRFVcuCxvO0ZpGoPHqhsFg==
X-Received: by 2002:a17:907:844:b0:a9a:a96a:e280 with SMTP id
 a640c23a62f3a-a9eeff0ea22mr1542076866b.20.1731395499407; 
 Mon, 11 Nov 2024 23:11:39 -0800 (PST)
X-Received: by 2002:a17:907:844:b0:a9a:a96a:e280 with SMTP id
 a640c23a62f3a-a9eeff0ea22mr1542074466b.20.1731395499018; 
 Mon, 11 Nov 2024 23:11:39 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-175.web.vodafone.de.
 [109.42.50.175]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc56fcsm690734366b.125.2024.11.11.23.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 23:11:38 -0800 (PST)
Message-ID: <3bea84f6-098f-4956-a40d-651b567212c2@redhat.com>
Date: Tue, 12 Nov 2024 08:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] tests/functional: Introduce _console_read()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241112062806.838717-1-clg@redhat.com>
 <20241112062806.838717-2-clg@redhat.com>
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
In-Reply-To: <20241112062806.838717-2-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H_m-J5JHfvzQqzkd18WJ2gtVdmHyTLqUbJC5mRkGFiA_1731395499
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Yqh79HQm7nw5

On 12/11/2024 07.28, Cédric Le Goater wrote:
> Interaction with the console has been a problem in our avocado
> tests. In some cases, the expected string does not match in the
> output, causing the test to fail with a timeout. These were worked
> around by sleeping before reading the console and even with SSH
> connections in some places.
> 
> To fix, process the console output char by char and not with
> readline. This routine was largely inspired by console_wait() in
> tests/vm/basevm.py.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/qemu_test/cmd.py | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
> index cbabb1ceed3c..bb39857e6cae 100644
> --- a/tests/functional/qemu_test/cmd.py
> +++ b/tests/functional/qemu_test/cmd.py
> @@ -12,6 +12,7 @@
>   # later.  See the COPYING file in the top-level directory.
>   
>   import logging
> +import re
>   import os
>   import os.path
>   import subprocess
> @@ -78,6 +79,20 @@ def run_cmd(args):
>   def is_readable_executable_file(path):
>       return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
>   
> +def _console_read(vm, expect, expectalt = None):
> +    output = ""
> +    while True:
> +        data = vm.console_socket.recv(1)
> +        if not data:
> +            break
> +        output += data.decode("latin1")
> +        if expect in output:
> +            break
> +        if "\r" in output or "\n" in output:
> +            lines = re.split("[\r\n]", output)
> +            output = lines.pop()
> +    return output
> +

The idea looks promising, but I just realized that this is breaking the 
console.log:

$ cat 
tests/functional/arm/test_arm_aspeed.AST2x00Machine.test_arm_ast2500_evb_buildroot/console.log 
  | wc -l
12

Without your patch, the log is way more verbose:

$ cat 
tests/functional/arm/test_arm_aspeed.AST2x00Machine.test_arm_ast2500_evb_buildroot/console.log 
  | wc -l
232

Could you please have another look?

  Thanks,
   Thomas

