Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp929747ejc;
        Fri, 26 Jan 2024 07:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGosBP5pSe7LEFBG3arpxBHmOfCkR+GPvfQq0f0jQ0s03SYT81vXkI5E3FFniE9wqol/CYE
X-Received: by 2002:a05:620a:572:b0:783:518a:da33 with SMTP id p18-20020a05620a057200b00783518ada33mr1600603qkp.146.1706281448999;
        Fri, 26 Jan 2024 07:04:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706281448; cv=none;
        d=google.com; s=arc-20160816;
        b=FlLWIE3W2jabHaS8I/i1y0fkHwFNiJBpIzbWcpNIGxLe4Pel06TXrbXp/0xTNy1CLp
         zaEBUAm/JLE/Uujn96GIDIRoF7HunQLy+D5H+2IbW2UuclpDKjc1QAYftdCjLI0vwgdl
         nMwqq+oWqF7MhyWDpRRMwljK4Wd3c+rh/rtlG0Z6P8ML4xc76zapV+YsLiPAIb2OK5cr
         ooHa/XKOqww5jvV+o9urneffUAq8qfzRYkNwQbCPp+GTGK+JnqIn8t93IZMmu3oxm73E
         OkcCNy7KJtImnAqQvcxJhYGL0bGSR2ptbqkjFi91j7qj9TA0dV8KL8BGJHQFLqazeODg
         KQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=KQqM4d2OnomnUxb6KTJuQsFHZEeo84Y4P4Rfq+HD90I=;
        fh=H+3imE6ZVJ7JMdj/3HsaLpY5Mc8n5vRx5g4Okyz6O/Y=;
        b=EzWaLHvUQ1mqPTwSSiTOdEh0lYd0OHkPHNZauGTNMc8LBzGrnSYnn322Y3R23sGjWQ
         aO3QlGde7jP9VhS9vtqxSu24wstClGnExwaQnwETUgmUXJMqoUSHBvEm4ab6xdM45+S8
         5zEX0dOKgem7WyViJgP7VEgyj++OjX4Kcp0kFPXRKlCfZGP59g4L17qxQ1ucYD+1AUHi
         EYmYYWqyA0LeVxQN5VKVp2lzig/LXFMt0UeKMpc8q/qJesrjto9E88ollkoONMwGFNoy
         KnutLA5ziOU193qpy8zy5cz38KU7g96tbAif8LBVQOcXYleO8MqI6dGaCUqdKxbl7ZIW
         cRAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MysI1ACV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac5c5c9000000b004b793089d0bsi171976vkl.44.2024.01.26.07.04.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 07:04:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MysI1ACV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTNkS-00015q-Mr; Fri, 26 Jan 2024 10:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTNkQ-00015P-2e
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:04:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTNkO-0008DV-Bf
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706281439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KQqM4d2OnomnUxb6KTJuQsFHZEeo84Y4P4Rfq+HD90I=;
 b=MysI1ACVY8TemvQ7415Bkxm7WVcfKLq45arjCTtFyfEh+OxljN/M5lWS6sSjFKi2X0iFes
 tPUQjy3Rf+hGDN4HGly6AX7seetFVxDT/jipapXYOll0Ow4MoVtUolPW98tr5hBKuSVApa
 EIz9jMyGiBsXVjKBuTLV6I844bDdX7I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-qYlzba9vMUKtFM_Drb35Xg-1; Fri, 26 Jan 2024 10:03:58 -0500
X-MC-Unique: qYlzba9vMUKtFM_Drb35Xg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7832a94b051so63304285a.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 07:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706281437; x=1706886237;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQqM4d2OnomnUxb6KTJuQsFHZEeo84Y4P4Rfq+HD90I=;
 b=g5Khxl7NplZreT/A7E3WI00lU6CQM+MmygKOJM4k1rhoNPshUOdXjWH9XvNOurg/1z
 bAulLoqDfcX+Wlqnqdr2jWP3ctuOnhhPcbppahyQP0DeOq2e9g9bGbL1QWypy+of0ZXX
 cFgX28kuPZ8PP7FBpz2tT6HWGT7fNG6gcZWccsaModTUUCXNFSD1mx965LShKpToisEr
 k1HX2Wd09sWND/i5JVdg9djzpId+VwI1pd4aRzGGLOHHfIseUP3Gl2IHwKZcNEHKCAAK
 O7HucCoBFR1L52bxwqXKtTMQSPwMG5pFkXfjZs5EqrzzL1YCZOYON1Jhco/uZNlk4jL7
 5XuA==
X-Gm-Message-State: AOJu0YwnEi6IECJh2lyFt3PphMifOadgR1qRj3Q873hhVItFiDxe7++K
 wlRMkDDTpWH/NOlE8iDXZkbbftYxAzehk69N4T9IVSfNHzlb+x/gzatw7xgea36hUl0UlQClCzZ
 z0fxd2kYRbociylpwXJQFo8kOnvoKspSpDBB/+lY2PPXVq+W9Og==
X-Received: by 2002:ad4:5ca8:0:b0:686:ae74:ae2f with SMTP id
 q8-20020ad45ca8000000b00686ae74ae2fmr1650326qvh.92.1706281437565; 
 Fri, 26 Jan 2024 07:03:57 -0800 (PST)
X-Received: by 2002:ad4:5ca8:0:b0:686:ae74:ae2f with SMTP id
 q8-20020ad45ca8000000b00686ae74ae2fmr1650309qvh.92.1706281437313; 
 Fri, 26 Jan 2024 07:03:57 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 ol9-20020a0562143d0900b006817d42eac6sm576258qvb.53.2024.01.26.07.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 07:03:56 -0800 (PST)
Message-ID: <fd570ec7-68c0-4f7e-a17e-ac5825c805ff@redhat.com>
Date: Fri, 26 Jan 2024 16:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/46] hw/arm/fsl: use qemu_configure_nic_device()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-25-dwmw2@infradead.org>
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
In-Reply-To: <20240108204909.564514-25-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: H93dAe87ls0L

On 08/01/2024 21.26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/arm/fsl-imx25.c  | 2 +-
>   hw/arm/fsl-imx6.c   | 2 +-
>   hw/arm/fsl-imx6ul.c | 2 +-
>   hw/arm/fsl-imx7.c   | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 9d2fb75a68..a24fa7b443 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -170,7 +170,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
>   
>       object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num,
>                                &error_abort);
> -    qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
> +    qemu_configure_nic_device(DEVICE(&s->fec), true, NULL);
>   
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fec), errp)) {
>           return;
> diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
> index b2153022c0..02f3024090 100644
> --- a/hw/arm/fsl-imx6.c
> +++ b/hw/arm/fsl-imx6.c
> @@ -380,7 +380,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
>   
>       object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num,
>                                &error_abort);
> -    qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
> +    qemu_configure_nic_device(DEVICE(&s->eth), true, NULL);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->eth), errp)) {
>           return;
>       }
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index e37b69a5e1..ca3dd439ec 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -442,7 +442,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>                                    s->phy_num[i], &error_abort);
>           object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
>                                    FSL_IMX6UL_ETH_NUM_TX_RINGS, &error_abort);
> -        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
> +        qemu_configure_nic_device(DEVICE(&s->eth[i]), true, NULL);
>           sysbus_realize(SYS_BUS_DEVICE(&s->eth[i]), &error_abort);
>   
>           sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0,
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 474cfdc87c..1acbe065db 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -446,7 +446,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>                                    s->phy_num[i], &error_abort);
>           object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
>                                    FSL_IMX7_ETH_NUM_TX_RINGS, &error_abort);
> -        qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
> +        qemu_configure_nic_device(DEVICE(&s->eth[i]), true, NULL);
>           sysbus_realize(SYS_BUS_DEVICE(&s->eth[i]), &error_abort);
>   
>           sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0, FSL_IMX7_ENETn_ADDR[i]);

Reviewed-by: Thomas Huth <thuth@redhat.com>

