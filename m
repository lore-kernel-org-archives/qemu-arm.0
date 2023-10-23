Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1170853ejb;
        Sun, 22 Oct 2023 23:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRiEF12NJtmPHe/P2ISlEK/2lrPM256dVBfLV4JzOjY48YPpHtNx9L2dHw6jiTXNHhwP/o
X-Received: by 2002:a05:620a:d88:b0:778:8ebc:129e with SMTP id q8-20020a05620a0d8800b007788ebc129emr12570169qkl.15.1698043577013;
        Sun, 22 Oct 2023 23:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698043576; cv=none;
        d=google.com; s=arc-20160816;
        b=n2ZdHEtlmoB3TiBLPXcSRp6mrZIGB+xOsaGNL5fFzrQCrOpzFgA5Cf8YHRVbNjHOIb
         +6YScBGIBm41TrP4aNE3D++SQINkALCojPQYNVa1Y53azDihjbqC7xvid8LrFbMhejse
         vsessQZkx2BP/7xEeX7CM6fD+XSOV/CX5gPQjfuU7YsGp2DYPRKuCpkx/2Dgv8pqtHI0
         lDcmBThgSZyMsJ+92qj+fcoP/qVp1i0aZGRLwrZj91oMue3ZNYJPvns4ztPdU1NSzLUX
         EWPLJVqyPa7EtzeD/1HV1Uyf51WdZ2yNQ6NOV0er2xe29CgH+OW92xUC5odgTaeKRag9
         A3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=cBr/NphSnwu114X5q6Jlit06K0k4qu9oIeQu9l2CWDw=;
        fh=DpkbP7dEedV4PMQm4eXqOJbSESG+s5DDiq4o/Hms8vM=;
        b=Q4pAxKISjph6L4Wp5+TO3PbAN17mJCdyP1MRkA8S+gfNuzPGLxuRl14PjHbLe6NI9m
         PzSIGtXB+ZtWl7ylI3jx58hDmgSOxW9WzjRTLAZ9FmSInb14rPDlxIUEFA7Enz5mS8cY
         1DnfIJgfnH901RE8NcHfTRp/yGVq+f2Cfth4JM6VBOafzwbcS2VaULMAlijavo88hhuD
         rgqT/UXTS7PZv+mm1Cg083SruvmNW8Xky94ZyaXUY7XKVOcww/gaQz2gvdVSHsw7YpfM
         B71kFw8hnojWabOP8ZqlVHLVk3UOg9O+neMum99E3pxhBTxu/NTeyJKcWxUYiwn8irFZ
         Qv7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MYbean6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020ae9e646000000b007789724e9ecsi4843791qkl.597.2023.10.22.23.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 23:46:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MYbean6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quoh9-0003RK-GB; Mon, 23 Oct 2023 02:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1quoh6-0003Qe-GQ
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 02:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1quoh4-0001Gm-UY
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 02:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698043541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cBr/NphSnwu114X5q6Jlit06K0k4qu9oIeQu9l2CWDw=;
 b=MYbean6l/JUwE9QMbOboBFoWLfxjHbf+ALv/AqK9NHh6Waegxy+S2b1qN6yQeqEMS1vNmt
 iOT7d78/1rlJ5TlG60HGMd7QGXgUbOy5aZUpFbIV1O1a0RVeaBZ2w5ZUNjMRAvo2TIrjFO
 K3LV9SdmOiSuW0lZSehfBorwvCoXLV8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-_5vRayf8PXSoERvWfFHV1Q-1; Mon, 23 Oct 2023 02:45:40 -0400
X-MC-Unique: _5vRayf8PXSoERvWfFHV1Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-53db0df5b7cso1995188a12.1
 for <qemu-arm@nongnu.org>; Sun, 22 Oct 2023 23:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698043539; x=1698648339;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cBr/NphSnwu114X5q6Jlit06K0k4qu9oIeQu9l2CWDw=;
 b=w36jQXVNognWYL32UyMzz52NDrXmfN8fhtF3S8DV7Q1G04kFfTbIMc1TXOa3GVxWjM
 bU0v1N1Pitk/A7ipCE/eURa+HXrmUgAsLEVImWVo+Hbzdnk5Ke+/mAXtkZpeX83dAUUI
 GrVQeJgPPbBscoZLmw8/KCd/cMfnCkPa+tsjW1vtiyhVZGfG9fB7s7FLDT3xrULD5qY7
 OsowtULIAg32lIrWLEvRjDeVNcH/VIO3MCx3jWXDu4HJGojq25hVLnJBbJ+koYOfeOXI
 /ZFNFg3ZkP3xlkSybX4Mx6QmEOZ2zOkz9VU3K0wC6Z7//kMHLdXOcmFxUW7jLCmbKyoQ
 Qq+g==
X-Gm-Message-State: AOJu0Yx2XVmqojxUuiylGjG30EEV5Lv8VhjTovgQW8lIcggxEsRXvq5J
 A2izaLt7VJwOUi9+aaHq9BI8H7+F3tXF+pjVlq7vm9tw5+xZrJMoz85V858LF+US+1JdEHdl3sA
 LSvnA7qPpryG/
X-Received: by 2002:a17:907:60d4:b0:9ad:ef31:6efc with SMTP id
 hv20-20020a17090760d400b009adef316efcmr7473670ejc.21.1698043539056; 
 Sun, 22 Oct 2023 23:45:39 -0700 (PDT)
X-Received: by 2002:a17:907:60d4:b0:9ad:ef31:6efc with SMTP id
 hv20-20020a17090760d400b009adef316efcmr7473662ejc.21.1698043538789; 
 Sun, 22 Oct 2023 23:45:38 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 u16-20020a170906655000b009c3f1b3e988sm6062764ejn.90.2023.10.22.23.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Oct 2023 23:45:38 -0700 (PDT)
Message-ID: <4a55f2d1-1666-4e05-8680-213d98aed6a2@redhat.com>
Date: Mon, 23 Oct 2023 08:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] hw/intc/pxa2xx: Pass CPU reference using QOM link
 property
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231020130331.50048-1-philmd@linaro.org>
 <20231020130331.50048-8-philmd@linaro.org>
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
In-Reply-To: <20231020130331.50048-8-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: P0meJ0t1bCVn

On 20/10/2023 15.03, Philippe Mathieu-Daudé wrote:
> QOM objects shouldn't access each other internals fields
> except using the QOM API.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/pxa2xx_pic.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

