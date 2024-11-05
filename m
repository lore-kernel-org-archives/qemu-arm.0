Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2822074njc;
        Tue, 5 Nov 2024 05:31:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzu/WxVbFvW8jcqozO6lc4xqpIvaOQS4RwAT8+F37S8IQ+oUyX1+9/9UuDcwF+AOjxBjPfae40lN6Gng==@linaro.org
X-Google-Smtp-Source: AGHT+IELQ2CBKxE7a3DkuotPTjr50X4pGXCTfE0U41YUFtXTtNaXz3N9aKwXhAw3CXCrNfPetjhp
X-Received: by 2002:ac8:5987:0:b0:460:93b6:a4d1 with SMTP id d75a77b69052e-462b86a2d4cmr195363031cf.31.1730813465190;
        Tue, 05 Nov 2024 05:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730813465; cv=none;
        d=google.com; s=arc-20240605;
        b=gu4aRxIwgYSCPqZsPUNRzU5TJJ+o1WFTdN2+C73tpTs/kFJnbRw+Z9gUAVO3pLmBWw
         bor7poGCG8/jOQBtIXbuQsoheDGIR+Vj4snqm1fTjaNBSESDoRtj6w3PirFC93Y8l4g4
         ddCL/fZdcOpbXF03PJNJHSBrnKszdD8ZtI1NAhaSUdCzu0acdL994LzR18JrPsGP0abr
         Phe+dpfhNjVBV0LGhvbmAPu272sppeK1jz2NUj0gx+8KGH7Pva+jkl3WjUmnyMjuAzu6
         9IPKNqtoA6iuJlPWzmPbqw431rZd26y4gx4NbJJA2LrLeY/zxCothPZfYQmibNfgaA+V
         Mw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=v2YSGNtIzPCb7pVyPfTKsVCShY1Tt6E9azlgMwcN/8k=;
        fh=nSKOeb92TiNxLCa3gpCn70SH5OEOgwVNyyaRt0HC/v4=;
        b=YHTpKk2kr6k/7Kv7sXfibT+BVnHVfYMNH21yiMTLf3tEaeBaRKMI7tBE8Zqfuzk5vX
         lPC0yFyDESw5BxjFYM0RDUubzcG1zW2pGANeQEFVVcqzto6xieNDTTreC/QNJNLeLVq3
         9dKlkVGqKgQPZXB45xHXwvEr1aGhDqObULTmoQ0h2ig6Oi8jfVyq7MTWb2hKUzGbaKPS
         tW7gLkJGgFob6NjgGRSEvv6s0Sm0Kpvk+yfd6TgUVrndKlvT+0YB45BFFQwOEpiC71gB
         obNKSBbSR2uzkgMQGmrnffOLHdr8Xyvxzx9TJL9S7nDntaf5g2nM4UtyHoYPLmzMoM3B
         FkgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=btMsRm5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1f07d4si143490101cf.481.2024.11.05.05.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:31:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=btMsRm5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Jdi-0000yf-Vc; Tue, 05 Nov 2024 08:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t8Jdd-0000tE-KX
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t8JdY-0007EP-Ax
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730813422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v2YSGNtIzPCb7pVyPfTKsVCShY1Tt6E9azlgMwcN/8k=;
 b=btMsRm5vusvQUiLB/Xoz4F6zFJ8LU9VMuXl8hOxsSaynjHm9QeIq6mZ7O7B9uhC4dOIUBE
 CK9KC6+4i+gy/gMEmeVw3mMuY4uRNeP5LKkTbCubtFDHdfMGDMF9Md+hYnpR2mxkG5w9ms
 rhol0VCSJ31WUBFVsTphoYCORsy99KU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-hFJ8jAAnPG62NjFmQHzRTg-1; Tue, 05 Nov 2024 08:30:21 -0500
X-MC-Unique: hFJ8jAAnPG62NjFmQHzRTg-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-5eb8b4b3eeaso3468753eaf.2
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730813421; x=1731418221;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v2YSGNtIzPCb7pVyPfTKsVCShY1Tt6E9azlgMwcN/8k=;
 b=DgYOmtwJPxOTnhZuVcGRPNh1c3usjbClimeD6t5zhYJeHOUPOVCO+6QVkAdbi2x1U/
 Cc4c+uL+KEd1IaQmiCuQXsIBGghiquVQQ39BHBdSC29CzhqreLTP9AOYMcxWlVkpU5Db
 6u1aXbNXVEKkwSXU+bmR9L/SUrUCWXsloEPwCc5tExJnujG1kYyaKfyugEupPNZAHrha
 FtzD4lzL/MTulN/fopgDwsVxQBxxrK5tI9OwGJ19YCCRlTg/h98vzvnMOb+J899tZqf0
 LYlHoXsqRm9VvRwinslxxp43ZwtqxUTfiHJebmL4EkS7Vomg3aYtLiq4ObwPlenRNAYC
 1hyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd+jbH2o/7Be+6cVPNo/OJtqN2exUhFuG8/CsyozMlaTIq+AbJb+Ihhho3nqApgDRaql/5p4vl+Q==@nongnu.org
X-Gm-Message-State: AOJu0YxfvEevM1qXZSsjbvpauSvXsVKW5im1WGi0kkUnpz1vNUMqOiaC
 6C4GeJpBcEtvnV2Lji5lytb/ZjEMTCyhxYfImT/mCjU63lz44ueDSH6tG4GyPe0WmZmM3ANM7xv
 dT3zZ2fG2mY+Ca0NdHiOi1pkfMw2zacXGjzsMakGVS2rPY5G7KQ==
X-Received: by 2002:a05:6820:1841:b0:5ee:adb:546a with SMTP id
 006d021491bc7-5ee0adb5630mr6074082eaf.3.1730813421035; 
 Tue, 05 Nov 2024 05:30:21 -0800 (PST)
X-Received: by 2002:a05:6820:1841:b0:5ee:adb:546a with SMTP id
 006d021491bc7-5ee0adb5630mr6074077eaf.3.1730813420749; 
 Tue, 05 Nov 2024 05:30:20 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-55.web.vodafone.de. [109.42.51.55])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ec7063df84sm2258134eaf.39.2024.11.05.05.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:30:20 -0800 (PST)
Message-ID: <6b4e07d1-8950-4f93-bb56-b76871638154@redhat.com>
Date: Tue, 5 Nov 2024 14:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] test/functional: Fix Aspeed buildroot tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20241105132339.2967202-1-clg@redhat.com>
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
In-Reply-To: <20241105132339.2967202-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: oKCVzcR8UVtE

On 05/11/2024 14.23, Cédric Le Goater wrote:
> Since commit 786bc2255256, cached asset files are read-only. Adjust
> the QEMU command line for buildroot tests to reflect the new
> constraint on the flash drive.
> 
> Fixes: f04cb2d00d5c ("tests/functional: Convert most Aspeed machine tests")
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/test_arm_aspeed.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
> index 9761fc06a454..19853161b267 100644
> --- a/tests/functional/test_arm_aspeed.py
> +++ b/tests/functional/test_arm_aspeed.py
> @@ -125,7 +125,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
>       def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
>           self.require_netdev('user')
>           self.vm.set_console()
> -        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw,read-only=true',
>                            '-net', 'nic', '-net', 'user')
>           self.vm.launch()
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

