Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2250043njb;
        Mon, 21 Oct 2024 02:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVMjaX+IdNLYo8MvgKq5TCj9ybCSlUMe4TShF0CRK3sGeJPv3cPy84SEOMSBKvi+2MtVUDOnFQTSLL+A==@linaro.org
X-Google-Smtp-Source: AGHT+IFnFMsINHCBYoqnbYetWYTBnQGMt8itXPG5Hs0i2OMPfyXmEEHasnWybgT5prWDZG5W1rsK
X-Received: by 2002:a05:622a:449:b0:460:8f0a:5111 with SMTP id d75a77b69052e-460aed43fa5mr166891521cf.30.1729503420372;
        Mon, 21 Oct 2024 02:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729503420; cv=none;
        d=google.com; s=arc-20240605;
        b=a0wWX4nNePAn2IeOk6edqqfnqc4SKTDt0FwufL7WJ4gUTdeilPgXVoNBnc0AJDQYSK
         C3X6tmCCBS8QZS807Ul+WspwKcKxvSKiYaE18zPVJcd+hIzBrf6OkWCVHzijOdUoaK7l
         aVYl/GSB2UkZ1+WdFSAnHnBLFC5QX2OxtuttTAaj9dFVMeq6YHuq8mdefGFaxOyj03nA
         u0XOwGzkedljstLBuDONLapwMGao7T8K0CzX9F9erlEAJ8GJxS9DTHbWHW4exgs2QZP4
         PTxysu4Dd4+oWptMbkLEZVMgJNqMfL//1zLAe6GqR5XGTjJO7B1GpQWHk/9ZIRPNKI7v
         3Cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6Q6TUSCsyGLdOq8QPQLqSfxmLjzwXR9aec/DA6Z3PJM=;
        fh=tWkr7bBSjSqTykShrxKEdO6wiEYiXROKKtjn2ihZKV4=;
        b=kcPzcHQkZF2dGhPaPEscCT6HKF710QpBHX0w1Yfq9gImw1iV0l9QHjVZdI91D049ma
         sBOGZWsQx2g1qQleHh1+ljOkm6uvWEq3gYvQaZZp9S9W4sBkwsOCC/clH7rH+R0J58bT
         8McN/6kAF0hV9FOPEI6kgQH9DnK5BdeL034TqokiOL5mx2gSkY3HfbW+ErS0hp6c0REt
         FtNaQTk7d/ng6eOq2VS3ZLJbfvDR0NA69LsToAbpmg48Brq9AwMBTrkG1B5S15++nSq8
         Wn6G7whnQMFSo1EBOxfNNdnnEGNJFVx7HN3S6sUg5wmgSKyz67DjYeCmsqYVkTShG4Q9
         WCJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XYwjBzip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3ce65b0si35855621cf.246.2024.10.21.02.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 02:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XYwjBzip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2oq3-0005a1-Nf; Mon, 21 Oct 2024 05:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2oq1-0005ZO-GM
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 05:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2oq0-0003Vx-2O
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 05:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729503390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6Q6TUSCsyGLdOq8QPQLqSfxmLjzwXR9aec/DA6Z3PJM=;
 b=XYwjBzipYB8XoWzBHpYyzbxmpL+BNBqcS9tIp13+2weItgvdXD7LfbTdSHS2yZ6HiJCdLH
 Vk5Gkb/jwymOwHlMB6vMtVfB3DE/ceIV2E1XNrLS5V9AyogRpkuAWZvfbaKQwDzsbfYaNO
 hS/Jv6ePCGVlWQPbfrEqx5kO73+5Wx0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-rM5MeFpfMveZ4vMxQkG0MA-1; Mon, 21 Oct 2024 05:36:29 -0400
X-MC-Unique: rM5MeFpfMveZ4vMxQkG0MA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4315b7b0c16so30201335e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 02:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729503388; x=1730108188;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Q6TUSCsyGLdOq8QPQLqSfxmLjzwXR9aec/DA6Z3PJM=;
 b=mAFsEIM9OpPJ5hN0oTS2SNMUB3q9q4xQW4bwprq7DvvWLjUyUMlApc74nGFqIT39VQ
 3JtgmKPSXVS+7ofMdryCHFQMtGQlZ2/z9gKnonLF/DMn/YhcQVHjOBCjQuyb4eqOiokN
 ZafTy3u96brxeRLyo1oJgyEYUiKXShDbVrfIDe4KVl0slLzQ0hdk+4csqykifve53uJ2
 Iw1vuPuOv0wEfzH5DBxsn4QZCmjxvM9BY8truYH0/NDtY35YrFpgl/mt4daBmb8qx0RN
 5r4/iY3qfIjtEDoZ6p8WHVBgVhQGJxtkqQWXUQHJ05surk4QqmaD7JtWdHBJP41c1qkM
 t+XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGKwLQaKCWMtnO/Mv9DJrD9p/OSg3HMVUnNLYw8heVIWuirFUG5JlFMkTc7uE3VEMLrvI2mDrTcg==@nongnu.org
X-Gm-Message-State: AOJu0YzMN5zmoTPpaQ56SxF3raf1JPbL4H+rOXatjmhbXhXhR0mZ8RGt
 B0xZ2M4/y9N7GphAYfhvrq9Ol0TI77yzoLeC3OaS5nzhBRYJjNnCamO4b9gBKMwt4bUZ2NyMlsn
 oCI4HYiAbX4tTkwOE+MnpawCPkLvuJyelmed6eHYeng8xWSFYdw==
X-Received: by 2002:a05:600c:45c3:b0:431:3933:1d30 with SMTP id
 5b1f17b1804b1-4316161f596mr92927685e9.5.1729503387994; 
 Mon, 21 Oct 2024 02:36:27 -0700 (PDT)
X-Received: by 2002:a05:600c:45c3:b0:431:3933:1d30 with SMTP id
 5b1f17b1804b1-4316161f596mr92927485e9.5.1729503387593; 
 Mon, 21 Oct 2024 02:36:27 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-50-24.web.vodafone.de. [109.42.50.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f50b15csm51502545e9.0.2024.10.21.02.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:36:27 -0700 (PDT)
Message-ID: <774d48bc-0c4b-4862-9cc5-39f1f487ec04@redhat.com>
Date: Mon, 21 Oct 2024 11:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/functional: Convert most Aspeed machine tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 berrange@redhat.com
References: <20241018071726.2723934-1-clg@redhat.com>
 <f1249e0b-290e-4416-a776-3f5d6ada1ece@redhat.com>
 <341dff70-d0bc-432b-8764-8cb9b1aba1eb@redhat.com>
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
In-Reply-To: <341dff70-d0bc-432b-8764-8cb9b1aba1eb@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.527,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.699,
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
X-TUID: KTPeAY/gC9Xc

On 21/10/2024 11.31, Cédric Le Goater wrote:
> Hello Thomas,
> 
> 
> On 10/21/24 10:53, Thomas Huth wrote:
>> On 18/10/2024 09.17, Cédric Le Goater wrote:
>>> This is a simple conversion of the tests with some cleanups and
>>> adjustments to match the new test framework. Replace the zephyr image
>>> MD5 hashes with SHA256 hashes while at it.
>>>
>>> The SDK tests depend on a ssh class from avocado.utils which is
>>> difficult to replace. To be addressed separately.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>
>>   Hi Cédric,
>>
>> I'm seeing errors when I try to run "make check-functional" with this 
>> patch multiple times, e.g.:
>>
>>    File "/home/thuth/devel/qemu/tests/functional/test_arm_aspeed.py", line 
>> 111, in test_arm_ast2400_palmetto_openbmc_v2_9_0
>>      image_path = self.ASSET_PALMETTO_FLASH.fetch()
>>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>    File "/home/thuth/devel/qemu/tests/functional/qemu_test/asset.py", line 
>> 104, in fetch
>>      raise Exception("Asset cache is invalid and downloads disabled")
>> Exception: Asset cache is invalid and downloads disabled
>>
>> Could it be that the tests alter the file in the download cache?
> 
> yes. the flash image is updated by Linux. I don't reproduce the issue
> on my build though. Are you using special options ?

No, but I rebased my staging branch to the current master shortly before ... 
maybe something else has just been merged into the current version? Have you 
tried rebasing your patch to the current master branch already?

  Thomas

