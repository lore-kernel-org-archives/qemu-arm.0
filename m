Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp653532njm;
        Wed, 5 Mar 2025 00:30:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsbU40QONvMDwkenRR4Ub9Dn/fB/NKiqGQMWVoma9d6PQs305Wy77iW2toJrNBz1gn7rRV
X-Received: by 2002:a05:6214:d61:b0:6e6:6506:af59 with SMTP id 6a1803df08f44-6e8e6d1ab32mr26780266d6.15.1741163402311;
        Wed, 05 Mar 2025 00:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741163402; cv=none;
        d=google.com; s=arc-20240605;
        b=NB6XcLjRwnNLy8IrFlq1mODyU7nAbU57tQkXBTEax6KISJ6sfNqNcwmdByyYJfzMEh
         31/EwGEHLLf5tLbpHP4O1vq0c0DLzFYQrkQYYyQDAOfJihnesNzjbnmsuEQltJOJxKNu
         VtrjWVp9v2q+rpzPBD1ikqF3hAAlFBNcDifkr/bTdjcAHGM2fUF2QmaysOCYwEtkJV49
         k7dys1Lat3fFnClyJ4/gJsV4aLVaQxyI/9bXbhmjp+B0jq0aIEGkg92MY+6W3OXGu7t7
         w9/FpYQ5AQ7k3b7IzOPlBafZ0K80r6t/+OppzS8UujKp1ohUfha2b/YRb7gnyzJbUUyP
         DpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=4bKWkKL39Bxqrc7HrjIuffUHyI5hkAAo6QVe+9HKpn4=;
        fh=HIOtrNxQ0hnz3EHw+tiAsJYkdfi4QK9y44Hwm43nND0=;
        b=k3W4PhuLqcgSb9npdm4SwzSa15cfiVOjye6OsDDmIos+7tqlVnwgon0ebYPC9tMlEY
         /PxkjtXAhCssp96h/66FfMcy0dsLniAbZnrVBiZY3gAdOIzUY9W9NKmGWCz2bvCVzMoi
         llMGMXFYuT4OuQwr5xa55D4liZMwzTCvv/hGjkzDKuyOm2sxpa5bacskU80bf2Y99plQ
         fkSLpyYH/gbCDx5zNE3SkdEUqfm5DpUvVzKATmIXrvaPf/UEZBMGxS6mWD3LKX5l68EF
         +wNGA/aOUdOVNee0yFWEoR/lOJXFLKCwgl1RG0MnUggqG8ke4w2c0hJOSGpvNiUACj3s
         qbtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hshZ0fVc;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e7b1esi129673276d6.28.2025.03.05.00.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hshZ0fVc;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741163402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4bKWkKL39Bxqrc7HrjIuffUHyI5hkAAo6QVe+9HKpn4=;
	b=hshZ0fVc0zgkTefn0lcsIwW0s3XJJKeMUIrS/D22GmrmUfYay5iXmTqdQWGzrzLTs7UsUy
	e2ZhTrLD9n/wCKWzt6O2squTvAI65WU7eZKmNlpyCCIdHyDAxsQAOESHhYBm87Pkd5emao
	jQzQ3iIKiD/6bDOkB2FqaJem8zq3mbw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-jpj7Lm1eN_KrOVojpCi1sw-1; Wed, 05 Mar 2025 03:29:50 -0500
X-MC-Unique: jpj7Lm1eN_KrOVojpCi1sw-1
X-Mimecast-MFC-AGG-ID: jpj7Lm1eN_KrOVojpCi1sw_1741163390
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912539665cso57384f8f.1
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 00:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163389; x=1741768189;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bKWkKL39Bxqrc7HrjIuffUHyI5hkAAo6QVe+9HKpn4=;
        b=vjsKmtX8SXIgF662QeTlrWEuuFe9yqXJuCEN0bIladlk8j/HwRrySQvbg6/WPBiiS2
         JEJ/7Ul5SDRIYoEL42RQKOXcDsyyjJCUXAJfvjdi2mQ5fesb2KOIZosfX5rCnZZ46b4R
         KuzYyjqf96Dm9XoLozipsKd5HH3niviotAQyEHBdcQLKl3/VvxXUxbHKUUwBIHT/lj4t
         P/3Yx5u5rOp2P6tXXsAofC/HBptsjVD0PwFEqdnYN4haGX6Aya9TYUe8CGRS7zQzymCJ
         OJHE+SBX2MRa96V5TRAFs8DeWJ6OsGY7yU5mQyerTPn2XthwnGidq/x/YI8c21pRzosb
         OKwg==
X-Gm-Message-State: AOJu0Ywg85Di4mRbWlRrdwZOX7CzoYUTCv52Ma8WDyu2cc8rMG9E1K1F
	EuGdpcG2Y28aeiqhKlwWyWQ6gkH6PPlfy1P0/WsPZTFpJ1dxmA7VjlRjFpUFBT2iqqnxO+OyW8a
	Xe/KyHp6kR8MYxntaLnDg2mPTw7K0XNZJWoqOp93HpZEjfE2BXQFIEXGf/Vq2x13plEY3jN1HWq
	Y04rvIc13VRLa6DbFd5fYWt2fOMJarTGpsXQ==
X-Gm-Gg: ASbGncvtmsbmYIJeh+Z+9p3hF7A5aKdiu+zdlTPQWIqo8rDO/oAh9deKcaJm1hGkMwu
	ALtHE+BcFvZcrHbsWsufUjmTqEY/3GZnFZ7RKecn3TJ1FYwXho1O4lYnXm3NjiZMvkpwIcHbhrX
	JQH8iv0w7NYj2M+WouLslPjEVS73ZgCUVXfkexVUFw99wK/9nFjIy1v+VA5C3rGN0MdyXo7fjn3
	9i9hFTP+Md+dJQKDsn6Rr9tDS25Hc5LSPPytm6epykjxOj9mpKUtw5Cdbbjg1InjSnlilR+aAXG
	OD+1X4lQjXhG5gO8OsT0iKnTr4aOi0uW25HsVX41lbd9nDU=
X-Received: by 2002:a5d:64c8:0:b0:390:dec3:2780 with SMTP id ffacd0b85a97d-3911ea54955mr1992892f8f.24.1741163389680;
        Wed, 05 Mar 2025 00:29:49 -0800 (PST)
X-Received: by 2002:a5d:64c8:0:b0:390:dec3:2780 with SMTP id ffacd0b85a97d-3911ea54955mr1992848f8f.24.1741163389321;
        Wed, 05 Mar 2025 00:29:49 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912563f973sm180972f8f.84.2025.03.05.00.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:29:48 -0800 (PST)
Message-ID: <034b88ac-6d47-4020-a574-13ab91225616@redhat.com>
Date: Wed, 5 Mar 2025 09:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/32] tests/functional: factor out common code in gpu
 test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, qemu-arm@nongnu.org, Alexandre Iooss
 <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
 <20250304222439.2035603-3-alex.bennee@linaro.org>
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
In-Reply-To: <20250304222439.2035603-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NIUx6LCl4t2j-zO5HrroeQDAQVN-ldVDiO2LQbA7ohI_1741163390
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: V83lK53rXm7n

On 04/03/2025 23.24, Alex Bennée wrote:
> In preparation for handling more tests split out the common machine
> setup details from the test specific stuff and add a helper for
> launching the weston test. Instead of searching for "vkmark score" we
> set a custom PS1 and wait for a successful completion. This ensures we
> capture the score in the console log which otherwise wouldn't log
> anything.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
