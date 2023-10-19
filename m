Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp623860ejb;
        Thu, 19 Oct 2023 09:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXD6xf+r43h3BCt2XnB2g6OzJP993qBf8BZZuZWNtvUIstkZIgE/pz2jnnsizD3hsUPMGe
X-Received: by 2002:a05:620a:444c:b0:778:8f72:83ff with SMTP id w12-20020a05620a444c00b007788f7283ffmr3384816qkp.19.1697731662868;
        Thu, 19 Oct 2023 09:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697731662; cv=none;
        d=google.com; s=arc-20160816;
        b=RjnTsmrrP5UO/thXh1bL/btot7x5qvXWf0BWfr+N5r03SC+7WfUguW0POJElGCn0/s
         9yoMjGcgydmGLPFjbZYXiJ7wM/R+bbUgMKox29cK6+ZdV69J6DXPUji3IKJ65sgbjaHK
         VusSEakiZEeWAOOhRbHbeDN71LGzOOo3eABjbqIQ1RYQnK6umZ8+WcieB+LiyLEgawBD
         irSMx3hvFtQGoomIww3ra59hPCOcun0OBEKc2vvVAdSYeWtZ29JqWF8CXHFDytnrI86N
         7dno+gU64XD2Mrv4xDavkT3LFy0J/feGOAs7v4YWoXBp0PtE9qtX3QPak9TMzKow6nCx
         3rwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=gUP2fxHPR3Onki9DBL6P85z9WueUZFgX49QUb20kiE4=;
        fh=DpkbP7dEedV4PMQm4eXqOJbSESG+s5DDiq4o/Hms8vM=;
        b=kqLprTOqax+OgbemSP2SELn4vLlMzQFgHaQ1cK5pyFCd+rWIOplPe+5h2tck2dqhc2
         azxtjIznxCV8qoEW/A5zgTg0bcEEhZaaor4qUajicxdwiDeiN91DMWevRNwbop3Zgua3
         OfCeY2wGxErJyuGy3fzT2Ly4rHoErUB5TuUv+sbkfp2k/a1rezy8yZoPwds8R3g1BPUH
         8CV+nPyEIyAB6LPKjw2XUUvVREDTJFX31sYHW+5fNxxhAZmoMtK8TRj8oKh0+97hH5xc
         aXoTw4ZqM+51C8giC+QWnrd/Mm2KyEF+oqvsXaRw5r3CamU2zkV1uh+i7Nadbx0/K+Qz
         jwLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CFhpeCTQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20-20020a05620a057400b00770f73d1d6fsi1689543qkp.222.2023.10.19.09.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 09:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CFhpeCTQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtVYf-0005uj-S7; Thu, 19 Oct 2023 12:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVYZ-0005oZ-V6
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 12:07:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVYX-0003yv-6P
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 12:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697731647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gUP2fxHPR3Onki9DBL6P85z9WueUZFgX49QUb20kiE4=;
 b=CFhpeCTQ4K1B8o7vbVHa44su8EKEDc7lSBRaiKGQzP9qrDDKwT2Az3BTsTb6f9xaVNVqpV
 xvB+kXISQpVj8TrY/Nubv/lJrdfnmdpL2LxSEAtmDAL4tgYyBvf08VVaM1SK1svHJxvAi8
 C2vna/ihm2/64HvOW+mK/K3/MY9KZcY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-dXQIysWkMwKw77xcvtsZMQ-1; Thu, 19 Oct 2023 12:07:26 -0400
X-MC-Unique: dXQIysWkMwKw77xcvtsZMQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-41cc6fa3ea4so12387071cf.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 09:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697731645; x=1698336445;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gUP2fxHPR3Onki9DBL6P85z9WueUZFgX49QUb20kiE4=;
 b=aZU+aZhmiqTWqPwS2xGwwIBaYf7hTCvzQsZghWzC3TAMc9UIPTSnTvQI2KnQdaMDo3
 QgDjWPFHZhQdYw7zyBjLe/c6u14i2r4InhoQPSBzrQU0uVWXGK261tzP2dSZDZpT2L5G
 HRZAEs78mDMi0SMvIHmbDZx/paIPRWUzfYkSGf1RTSz/2wwDHAI2lAijzYPG3j1Ww5xT
 OBFcyA4hQKMzgimKH//Cv3w0gi/ilc/ZY+DYEPHqqA1e7q3X/FsNPQ8uh2EIwZ+FeAbx
 dTRpYnCYQ3c7ryfD4MsGphjdc2dqnkcO/JyUDKSXxjs8M5Tcl/SLyw92f3rzLGcdr5TZ
 dg3g==
X-Gm-Message-State: AOJu0YyriZRTaaBkPPC4gZG/Qa9C1DpSF1hbOqLsuE8Ca5iKq2Hd1HMv
 Irwr+hidUmBi760srkyDqljhn5HRA0KnQVHcyg4/R+Qf12r+CtVrd0Y3uctJIkbE4+TW2o/8Scf
 CSyIWoqI7MBHNkJ/7B+Li
X-Received: by 2002:a05:622a:1920:b0:40d:589d:9ce5 with SMTP id
 w32-20020a05622a192000b0040d589d9ce5mr3346256qtc.34.1697731645158; 
 Thu, 19 Oct 2023 09:07:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1920:b0:40d:589d:9ce5 with SMTP id
 w32-20020a05622a192000b0040d589d9ce5mr3346214qtc.34.1697731644693; 
 Thu, 19 Oct 2023 09:07:24 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 c2-20020ac86602000000b004199c98f87dsm823993qtp.74.2023.10.19.09.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 09:07:24 -0700 (PDT)
Message-ID: <848c65fb-1c32-4a18-91c7-1a0fe7544e68@redhat.com>
Date: Thu, 19 Oct 2023 18:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] hw/pcmcia/pxa2xx: Do not open-code
 sysbus_create_simple()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231019130925.18744-1-philmd@linaro.org>
 <20231019130925.18744-5-philmd@linaro.org>
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
In-Reply-To: <20231019130925.18744-5-philmd@linaro.org>
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
X-TUID: KkdvG7/K3WLD

On 19/10/2023 15.09, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pcmcia/pxa2xx.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
> index e7264feb45..a2ab96d749 100644
> --- a/hw/pcmcia/pxa2xx.c
> +++ b/hw/pcmcia/pxa2xx.c
> @@ -141,13 +141,7 @@ static void pxa2xx_pcmcia_set_irq(void *opaque, int line, int level)
>   PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
>                                         hwaddr base)
>   {
> -    DeviceState *dev;
> -
> -    dev = qdev_new(TYPE_PXA2XX_PCMCIA);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> -
> -    return PXA2XX_PCMCIA(dev);
> +    return PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA, base, NULL));
>   }

I'd maybe prefer

     dev = sysbus_create_simple(TYPE_PXA2XX_PCMCIA, base, NULL);

     return PXA2XX_PCMCIA(dev);

for readability, but that's just a matter of taste, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>

