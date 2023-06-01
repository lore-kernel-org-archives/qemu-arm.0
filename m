Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp272712ejb;
        Thu, 1 Jun 2023 01:56:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5WO6PkcAi8QBE/B4axuj9qTQyahbKS98ESliYYzygLxqr8sh/fVdJXqN42m2G5Tvqt9wnt
X-Received: by 2002:a05:622a:146:b0:3f8:4905:9532 with SMTP id v6-20020a05622a014600b003f849059532mr2640328qtw.65.1685609817023;
        Thu, 01 Jun 2023 01:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685609817; cv=none;
        d=google.com; s=arc-20160816;
        b=C/bq1HD2yIMnhcz8rsCxs+Hnbfe7rBj94klRnzBV9QnGc2URjgTmVaL4njIMGYEU+Z
         CrIhFDB62AFcHUdbum5sIH87EPEBgut1oiGuhNb4w2JyIWDCMcLujUhE7CZggdvk68Mi
         8yAQahsbvSH8QrtrzaJM273TiOCZ/qWMgaxax95ieHbrz/p97nB1pOKes/2A4YxgoUDG
         ttglxD+TkTXt6l4S+Gs+TDI720yuG3km2bm9FgcL3EeqEeCWwtaqKwz+pJPlUTsDqwyk
         toiebmcLQn1o/b3qki/1PNxF2JV/+Cgt+uj3iyKGhf5dLoVhRglW7VDN/yYqmw1Qs2Eh
         h8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OPcIYzogUvkAuZPoOm75OhqrBG7H/WeIx3UuNAUp5fo=;
        b=BTsqN/yNmZXgljk3QGouLkdtEII7uFKNfOiXe5qt2mz2cue2PAHh2lYWrq8jva9qXH
         8AzpZeJJ67Qmi2h0NgR6YV+/lYQy+2+5+9V/gnd9aBKxYatKuOUItlsdVKG61XidixDs
         SkPvXISDFzCBYJ8FLRiHTcKwsA0mCo3PHxQcfELX6jQemREUWPmWVQRa2dPmegvuqDEM
         Ubb/DMjVMwRQfecUWsNf+5w9L73j/AzCkpT5rExyensl69iSR8shSjZb4LTT79mOt/Ml
         jl20VG2eeI+Oc+zo4nOWGvmPHgLEtZwkLPjhxrP71rJXTvsQIKd2IQAfm2S/+1mOMK3T
         78FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FX6eJkI6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a05622a01c200b003f43703b305si9343724qtw.714.2023.06.01.01.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 01:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FX6eJkI6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4e6d-00059O-W8; Thu, 01 Jun 2023 04:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4e6c-000593-K3
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 04:56:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4e6a-0008Nw-0U
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 04:56:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f601c57d8dso4705575e9.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685609781; x=1688201781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OPcIYzogUvkAuZPoOm75OhqrBG7H/WeIx3UuNAUp5fo=;
 b=FX6eJkI6/zkoli5SwaO19QQzfQhZzeBHLijCM7/sPrm4NI9OhHW9t+FcxPIBhJiY/m
 O/P6jVqhnrLbZmmZxN/as/m1wSc/IxtdqvZkPC9QgPdztN3nYYMffqOyqUn/BEG0VDfM
 P2EToh2ekvhHYUfHsXHkjCJuE6gonTAL/QwKumqXUkd+4QDYsaFqwrKOTbIHYkYlCYpl
 1/WlWRKYzg71AqKvRRmIefjMRNJdnXaSrF/Mp+ysQfvqA+ZGD7clQLws9JQlFq463kwH
 Mokl5Sllh2jLO3Hddpx2Ug+3B0+b45xGMPOvdMV0benz0hP7oSebjDPf4FDb1FsegM2u
 IWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685609781; x=1688201781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OPcIYzogUvkAuZPoOm75OhqrBG7H/WeIx3UuNAUp5fo=;
 b=dUmDZXkEYIX4/gPWibT7w2d4pfjXqzMfZfyxmNcbCTDMkV25eP9cGVLlu3k677XmmU
 p8A8pW2/Jk6IltCG7Tx7ExIoYgDuu6KkbO9fhPguSy+jK5D1yx3qMjYtcCeZwGEeVN3V
 d8IF8vJeyJdXr+ERYWF/7lj+PxepQOoHQZMXAWrbhYmQEYAYoKE3ZEsqFEXgNyISx76V
 E/v2PKVDVEfHyEpQf7sljC6CGi5k/VY3O1vcU/3tdVX8CbRWYlBOBUzMLoMX/wL2TMxQ
 JvYwdt7D/LV438K9QvXpPByN4Ydhn+CbKVBMV9WXsU3xluOmRLXgPG5vH+Q+/tG4u8bW
 AdBQ==
X-Gm-Message-State: AC+VfDx7GLtgaDcvbwkEKOC25MjxZgVDNU4my+/lqdnEBtaIStthMV8h
 EmZZNZO61k5ohU69KPsQQLrkPw==
X-Received: by 2002:a05:600c:218d:b0:3f6:3486:1391 with SMTP id
 e13-20020a05600c218d00b003f634861391mr915286wme.13.1685609781082; 
 Thu, 01 Jun 2023 01:56:21 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c224700b003f421979398sm1537847wmm.26.2023.06.01.01.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 01:56:20 -0700 (PDT)
Message-ID: <f3dc3d82-3928-c75c-18cf-dc42b9060c65@linaro.org>
Date: Thu, 1 Jun 2023 10:56:17 +0200
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
 <72ccd4c2-7c60-e015-2322-721d09a8334b@linaro.org>
 <233b42b2-6fbb-3882-6158-d2a82bf88be1@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <233b42b2-6fbb-3882-6158-d2a82bf88be1@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: pEfLkoq7vwAM

On 1/6/23 09:41, Akihiko Odaki wrote:
> On 2023/06/01 16:16, Philippe Mathieu-Daudé wrote:
>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>> Recently MemReentrancyGuard was added to DeviceState to record that the
>>> device is engaging in I/O. The network device backend needs to update it
>>> when delivering a packet to a device.
>>>
>>> This implementation follows what bottom half does, but it does not add
>>> a tracepoint for the case that the network device backend started
>>> delivering a packet to a device which is already engaging in I/O. This
>>> is because such reentrancy frequently happens for
>>> qemu_flush_queued_packets() and is insignificant.
>>>
>>> This series consists of two patches. The first patch makes a bulk 
>>> change to
>>> add a new parameter to qemu_new_nic() and does not contain behavioral 
>>> changes.
>>> The second patch actually implements MemReentrancyGuard update.
>>
>> /me look at the 'net' API.
>>
>> So the NetReceive* handlers from NetClientInfo process the HW NIC
>> data flow, independently from the CPUs.
>>
>> IIUC MemReentrancyGuard is supposed to protect reentrancy abuse from
>> CPUs.
>>
>> NetReceive* handlers aren't restricted to any particular API, they
>> just consume blob of data. Looking at e1000_receive_iov(), this data
>> is filled into memory using the pci_dma_rw() API. pci_dma_rw() gets
>> the AddressSpace to use calling pci_get_address_space(), which returns
>> PCIDevice::bus_master_as. Then we use the dma_memory_rw(), followed
>> by address_space_rw(). Beh, I fail to see why there is reentrancy
>> checks from this NIC DMA HW path.
>>
>> Maybe the MemoryRegion API isn't the correct place to check for
>> reentrancy abuse and we should do that at the AddressSpace level,
>> keeping DMA ASes clear and only protecting CPU ASes?
> 
> The involvement of CPU is not essential in my understanding. A typical 
> scenario of DMA reentrancy is like the following:
> 1) The guest configures the DMA destination address register the device 
> has to the address of another device register.
> 2) The DMA gets triggered.
> 3) The device performs the DMA, writing its own register.
> 4) The write causes reentrancy.
> 5) The re-entered device code corrupts the device state.
> 
> I guess 2) is done by CPU in most cases, but sometimes it happen with 
> another cause. In fact, the current reentrancy protection code covers 
> the case that bottom half handlers triggers DMA. The intention of this 
> series is to extend the coverage and handles the case that incoming 
> network traffic triggers DMA.
> 
> The essence of DMA reentrancy is in 3). This happens when the DMA 
> address space contains the MMIO region of the device and there is no 
> involvement of CPU here.

OK, thanks for the explanation.
