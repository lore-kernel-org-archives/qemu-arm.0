Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp229969ejb;
        Thu, 1 Jun 2023 00:16:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KCI3mAgeIPAF5Kcnto9rLwJtbPLOh7Csck3Ch1Hc1flFNFGIKkA04JOZW0ilPhHC7czn0
X-Received: by 2002:a05:622a:1182:b0:3f8:2a37:20f with SMTP id m2-20020a05622a118200b003f82a37020fmr1018464qtk.34.1685603817616;
        Thu, 01 Jun 2023 00:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685603817; cv=none;
        d=google.com; s=arc-20160816;
        b=Wa271lnUvrNcg7h5oHHBm4j458E7jqRc5L1WQ8ER2xXEcheLQytR6kznz8tG/8hc7Z
         dF9AsEsq1qCo0/7OJZHqRliF6PcC+aomKvLD5Vsm0njbYryTmGc+w15Du/yM8XUBRTJq
         /w5ZQw6lU/htBPcr3sWNmXX3nAvMWP0ZZhRYYdcA0hrYQcWW67G0Dv+Ryo3/sTYFFgm7
         L7LSSVw0VU8UnfySt/xpUd7a2BEHUsG+fqTF5AWIWvQ10ov+2YfzD3663bVLvPQY5rAI
         qnBIjIoHs7+bpWwvv24M2UEx8cL5XHvR30ksixc6dMcIIzfrN29o/Ryn/0pNKu6t/bhJ
         apiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WxzX/yCNlI8j55zMId0+95rQUKgWabv2ID5tlei60QM=;
        b=FVjGus8QnOhcp+pp/EWWh9FyMHlzsIdeIGd93N4FRmooRNSQ4e8y/aZ1NJlLua//W0
         8MtB+Dc/9LuucyZMeqEA7eyLOi+TEqnfUVTnc3B8cHUesGh+7itdU8PNKPRr/J/i2LME
         gj0GpzA3Q0gNm37gVRygg+/O+kAHfh5PmzqkUYSOIxre1ryOOjKY3miJEfD74t1BiNRI
         oIdomgp+i1jsWxIzNOJIz2JrH0BbFAy8IZuYa3aMDjrX138rqepQFEQX2tv8R1qMrRt7
         OnV8xe8XvI1Eed7LQrDrYSTnGdMbXiuwsnYU1N1F1lrWb53AYPbx02E+nN/2n/i8KSuD
         RrqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gen2Cia+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05622a01c300b003f6b025c0b1si9605239qtw.500.2023.06.01.00.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 00:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gen2Cia+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4cXf-0003zF-8d; Thu, 01 Jun 2023 03:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4cXc-0003y3-KH
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 03:16:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4cXZ-00048D-KE
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 03:16:12 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6e68cc738so5335455e9.1
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685603768; x=1688195768;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WxzX/yCNlI8j55zMId0+95rQUKgWabv2ID5tlei60QM=;
 b=Gen2Cia+8jwTVAFZKVgGWlirQvMrtFyXZ9UoEsuR/bvjDIJOGRMO1lVO1gSIX4316Q
 +OJNvgZk8IX1ihXqQXwqenIpLkmpItGw5/co228wbljIfirJPEqEEgVld+V61ZA3s5zA
 Cic5VL9KIipJMomumYYWISL9cGH3jPqHF99y/q15gHBv7D12a5Mw/5ZIymC48Sm9y5sS
 qkuas5BNYbHlymXURf3sSCAO+av/DtT0fuSx5WKZ/JOXOBF75uwl7oSoOb0rAt2dV4es
 MGwK0yAJHxO7sI6vCYvZEVfTWDmIkQU2ZD82keOoDRTLpHyLMypa+6jxdJ6OWGPlyBA3
 5Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685603768; x=1688195768;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WxzX/yCNlI8j55zMId0+95rQUKgWabv2ID5tlei60QM=;
 b=EEE/cX1Eglv/EAHLstjRfvlMpL5UdmpZbDuHM2LKusc6/rKEilhQo2DUAldqHJFEvR
 rFHLP3acs5LGmDq7C7T8HGOMdNokgYEwYtow70YMNBf8NBkz2lmTftks8yT5vuSaHLik
 CMaVAOjYvR/oevavlvD5UZWyNtH1y15LzCSA+YXrDNw896jKxDr8Bi9JDesnuKfA7+bl
 gCCZLEZrvrUWYQmOW1CZqw5BToExsTE5ldv4/rkPzIL6LcHAXLCU9FnEEgkUJONGyMKJ
 yGD6jOrse1IjpXAAfeUjL9S6XMMYoC6c33j6QH0x6RFoogiplS9yZBJaTbyMk6yFcW1j
 rwGw==
X-Gm-Message-State: AC+VfDzTPXXMlLcFiDImxgLf9GvhjbVll3xG7xGacnPtJv4nuwjq5l/k
 iTJjiZZyz9M5BRxW8+bP+MAF8g==
X-Received: by 2002:a7b:c5d4:0:b0:3f6:ffe:9ef1 with SMTP id
 n20-20020a7bc5d4000000b003f60ffe9ef1mr1110012wmk.36.1685603767760; 
 Thu, 01 Jun 2023 00:16:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003f4272c2d0csm1185408wmj.36.2023.06.01.00.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 00:16:07 -0700 (PDT)
Message-ID: <72ccd4c2-7c60-e015-2322-721d09a8334b@linaro.org>
Date: Thu, 1 Jun 2023 09:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] net: Update MemReentrancyGuard for NIC
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P
 <pj.pandit@yahoo.co.in>, Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230601031859.7115-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: wOJtnyVRJGlj

On 1/6/23 05:18, Akihiko Odaki wrote:
> Recently MemReentrancyGuard was added to DeviceState to record that the
> device is engaging in I/O. The network device backend needs to update it
> when delivering a packet to a device.
> 
> This implementation follows what bottom half does, but it does not add
> a tracepoint for the case that the network device backend started
> delivering a packet to a device which is already engaging in I/O. This
> is because such reentrancy frequently happens for
> qemu_flush_queued_packets() and is insignificant.
> 
> This series consists of two patches. The first patch makes a bulk change to
> add a new parameter to qemu_new_nic() and does not contain behavioral changes.
> The second patch actually implements MemReentrancyGuard update.

/me look at the 'net' API.

So the NetReceive* handlers from NetClientInfo process the HW NIC
data flow, independently from the CPUs.

IIUC MemReentrancyGuard is supposed to protect reentrancy abuse from
CPUs.

NetReceive* handlers aren't restricted to any particular API, they
just consume blob of data. Looking at e1000_receive_iov(), this data
is filled into memory using the pci_dma_rw() API. pci_dma_rw() gets
the AddressSpace to use calling pci_get_address_space(), which returns
PCIDevice::bus_master_as. Then we use the dma_memory_rw(), followed
by address_space_rw(). Beh, I fail to see why there is reentrancy
checks from this NIC DMA HW path.

Maybe the MemoryRegion API isn't the correct place to check for
reentrancy abuse and we should do that at the AddressSpace level,
keeping DMA ASes clear and only protecting CPU ASes?
