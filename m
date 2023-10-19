Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp333253ejb;
        Thu, 19 Oct 2023 00:36:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTlq+KVKaY3/YmsEku1xeKq+dYLfqWG1bEzcOh6FACzHGoizQd560c31kut42Kh7/AULjp
X-Received: by 2002:adf:ed0e:0:b0:327:e073:d5fe with SMTP id a14-20020adfed0e000000b00327e073d5femr890007wro.38.1697700979359;
        Thu, 19 Oct 2023 00:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697700979; cv=none;
        d=google.com; s=arc-20160816;
        b=ibrMVv+TDMqg6gPpgBPMJaS1vvQ0lADiRFsAKjcwL4eWtxBa0O+GAm92nI++qlZ4F2
         z3/pFq012pOGo57C0f+bS08/GPc2i+W3FNaYefxr4XXBgNnbsf50EumWImlaaH6eBiZu
         ieikcI+JY/mBOFjSPFvYhPJHL3o3lXDXYigXuLYnZuXO3z7Q07niBL/1xx/nR46G4uM7
         wusliPRNuBB32p+OosP4KwYL8uFPRpIyg4J94m7gVqcMQwLoxvOBjB+nzehSoPg8eEua
         u1A1eNiR0dgjPQpx9Sn6LuSzZYXwpENybWlE1dIXvivRWZvniP6iUlqeuTAPXFSJw7Cu
         QWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oi2R7Ubvzgnjzz9Vk61vE6zoo8Uul6YXeMTjibABXnk=;
        fh=Gw7SaiAXUCbFmjGm/8vaR94YyyHsrQY9MPpmywXxTIA=;
        b=LvYpilIXoHGjomwNfmv0F7Nv1mHlRgBNAT0oGdkkjL259qlzkTAfSF/WgIjC9HSbPp
         l+19ZoTElLaYNiW/hFoT2Vh7PRpRdh7zN83LzdwO3GsrMjtmMLUoun7BQZAbaBAQPzE4
         8bcuIuywhvdpuzxEReVA+vtOZLiOOP4r3wHdXlatyDXwF9j//0XLNoMLByC9AEW7CpbY
         OPFk7Mj014ah/Zqe6z1osN5APbdFEJX+joc16AnrlulBDGN9wl+eD59fM33Mze3PoEHl
         iB/B0smEMrTFbRFGt3vkGCydxLZIH5nsbUDX3+46m91LiwU/6/WhNh3mvUbXEqW+MEB+
         B2aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m47UFnu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020adff7c2000000b00317bbf2707esi2277523wrq.72.2023.10.19.00.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:36:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m47UFnu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNZf-0005VJ-8m; Thu, 19 Oct 2023 03:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNZe-0005T3-2S
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:36:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNZc-0004pG-Bn
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:36:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-405497850dbso71285195e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697700962; x=1698305762; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oi2R7Ubvzgnjzz9Vk61vE6zoo8Uul6YXeMTjibABXnk=;
 b=m47UFnu7l27m8pryC1WUrj11jddhPkstKcGTE+mxYRh6CJwWkBsL7ed+jZrKjTCBu5
 LaBt8uT4yb1Get/F0M7GbmXwEwoQdfk+wqR/62Yy0mlSMJo+bfMXwtbC94MXCworHaK5
 jmdQUa1ciEY6PiGrNvLNl/gwOkRKhw95PT4WTumFkYN7Xaggm2MuaTEQhbsj0jkv5uTF
 zDMMlZLhSS2SUZj+K9iqARGx2CnWK2bS0K68so/9CdprwmKLyVf0wsBOvLUM5Xw7j3fk
 05VJO7byH0Iq4POu4xhP1h5RqULm0iB2/sQ/mZqG/2EizSWFMBPVQfJmtQjsgouy27az
 4i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697700962; x=1698305762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oi2R7Ubvzgnjzz9Vk61vE6zoo8Uul6YXeMTjibABXnk=;
 b=a7pMR61i8iDuRmN+ebroLx2A7WPHfdfmvBWNipkvbrIrvOvaIkMwphTFNsZSPJ63Q9
 uMVB3pA0LZrDBmVlnAj4bV25BqOrZ144drElHWHJHlUojGomRijJ3p51eJl0UwgEXGQi
 yG/wK6eOWgZeWUNbbH45enzeL41eltVhKgL7+O6ee0a7bpmXABGgfdRn1e5MkgeS7Q7g
 ZRj8eQ3ytHLqgwyElGyD0wU9iHo4e95nRGCpMtg6dqL/A0nWb9edj50Q5Cq+VJKLN+V3
 np39n6HcLV7H1+xmfWDJRHa94brF9py9u2msMbOoQrt1zJf8/CeL95xSZpMYqhShLF/G
 V1Vg==
X-Gm-Message-State: AOJu0YyxLFQrgpO5bHUdWpy8mfspCUHzqO13ETnwGsvcRllH030meYR9
 WeYSY6k/BL/3uh1QPy6m4u836w==
X-Received: by 2002:a05:600c:3515:b0:405:3455:567e with SMTP id
 h21-20020a05600c351500b004053455567emr1016950wmq.5.1697700962469; 
 Thu, 19 Oct 2023 00:36:02 -0700 (PDT)
Received: from [192.168.165.175] (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c450d00b0040651505684sm3713134wmo.29.2023.10.19.00.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 00:36:02 -0700 (PDT)
Message-ID: <e83c9bc1-c2ba-ef94-127a-aa0eb48300a3@linaro.org>
Date: Thu, 19 Oct 2023 09:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 00/12] hw: Strengthen SysBus & QBus API
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, Beniamino Galvani
 <b.galvani@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20231019071611.98885-1-philmd@linaro.org>
 <885781e8-2dbc-4468-9a36-337720a66435@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <885781e8-2dbc-4468-9a36-337720a66435@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: p86SymBPmtA2

On 19/10/23 09:32, Thomas Huth wrote:
> On 19/10/2023 09.15, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series ensure:
>>
>> - qbus_new() and sysbus_init_mmio() are called *before*
>>    a device is realized,
>> - sysbus_mmio_map() is called *after* it is realized.
> 
> Just an additional idea that came up while reading your series:
> I think we should also add proper function descriptions for 
> sysbus_init_mmio() and sysbus_mmio_map() in include/hw/sysbus.h, to make 
> people aware that the first function should be used within the device to 
> expose the mmio region, while the latter should be used in the machine 
> code that wires the devices to the correct location in the sysbus 
> memory. What do you think?

I've been thinking about this, but I plan to eventually merge these
calls to the QDev API (after removing more unuseful / duplicated
SysBus functions). So I was planning to document there. But yeah,
better to start doing that now.
