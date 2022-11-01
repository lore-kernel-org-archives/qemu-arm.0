Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2043426ejc;
        Tue, 1 Nov 2022 10:17:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FjmcqhBJsG61Cl+b+FOZ9bTFZbEpjiCYf+YNoqg0pXXA+65UaYcL91slGgTviPEd6R3R8
X-Received: by 2002:a05:622a:100f:b0:39c:f1b9:6104 with SMTP id d15-20020a05622a100f00b0039cf1b96104mr15847223qte.500.1667323031816;
        Tue, 01 Nov 2022 10:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667323031; cv=none;
        d=google.com; s=arc-20160816;
        b=mUVvgdc74qRgQ/QjSq3qQZ1gy2FTinAWeHiXAuQ1X08J/H/qdYXWXsmRYxn6wbPOBB
         X0hPi/DIq8pk23fMzMbrxEYAMn1F3EIuzJ2xH7Z7zAXXR6SsqO2Dlf6Vd1Ov2gLn2rEg
         o1MgeaOyAZOzvoEORoh3bGliF8D2P5bKFjKK9sJG6vmCZRe2vbSPfl6SSE5fDMBtWfck
         yensht8yv3yiUi7gKQRu/cO1BgcQleSj2MuXY5a+CdYGkfZbKuBQCvxzYwlAFsEarY8F
         /PDJ59LaowUgOiK7exXcAXmUPWdFgBtCriG9KqV8W+Q1R5huUbWYQMVSz5/y9wG/O0BO
         MCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Mba77bVt95Ve3hfStaqhl/1AXMyPU4tUX11eugH/fU0=;
        b=jed90djhXBJTYJ8PICCNjSqyfOWUTnVjdCNFHmPDplrEeFETvF8j3PhMqXRO0XsEBb
         kbzKyYJLnpKeKa7+PiVTl+Zoh7S+YLkEMnURfwA5cc5/XsCvBd11uAEeeHTOHnhsd1a5
         rXGq7niiTzX+kbssCLUZG28H5GGLHWV86GYSkdOjOcxcrvyaNhoAVGQ6jL4kGtkMtQpb
         t2WiQcuNm/+fW6mZZPqylW5pibt6jWfEP5qvBfKyP/A37wpjAOgMd8IIbPOCw1aln6Jc
         DUA/09Ir/tYqna38qpUkpboTHT9o2BwCecRhZBGKTTOfAHHYjuIbNH1EQ4vnoRz7AKVY
         EEDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qG0pxekU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br18-20020a05620a461200b006b8e3f090f5si6588606qkb.461.2022.11.01.10.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qG0pxekU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opsMM-0003ZV-17; Tue, 01 Nov 2022 10:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opsMG-0003Yr-6X
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:35:16 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opsMD-0002Ny-D2
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:35:16 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v1so20414873wrt.11
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mba77bVt95Ve3hfStaqhl/1AXMyPU4tUX11eugH/fU0=;
 b=qG0pxekUBNhh1tPH/tFgb3F/j+UZ53esyoFnp3wW+58djCX3ZkrtMmWAsm87jMrMtK
 pygxmomdAwJzv/couqUYhSzDK8NKA2X57pt/EvAktp7INdEhxuVaq0cymWqh8APU1xCo
 MMravsII6HiyPsFUQYYamARrET/ix7DkfvxuqusLHgN18k1eTViLMB9LExerrtim7ZaK
 KgJ0Z9fr0FiC91u9Yav/rn6tYrnssH8ZIbZd9THSUB2gqM/8MRMtFdThiYvAXNG/cvK2
 oml/9+kZ+gCAtKkOhonFZhzXeD6tIniKEPilDVNy7zBPAx77WuQg2ZXiFo3d8CaMpWRb
 aHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mba77bVt95Ve3hfStaqhl/1AXMyPU4tUX11eugH/fU0=;
 b=mkfgq57w9nPu3WeKq/Tt+NgoAA2k/WO1QoTMEmU/X+z2LXXeQsJ60njjGROArV2GCm
 hdCie+7il41lHSIVKrxrdDpvMPSw7BEFP2IpHCyCzin3pS5knXkuqgkT8OFaoAjTlPos
 TuNKb8W77T60VmKEh4iJNuqP40VLbr2/09sxDVKr1KrMKc0jc0QkI+TYOl7wXZTwaSgo
 iv0Nge4P63zRdSmF3mHE2jVfi5++N5CzfVEj28vGvE/mfWyHGrGYeG4ocLayLK/I3jkH
 F4KD9/4U+BfHo5Tcrm2opiesWbEAYerlcYA49Ll8wqhjhCXqodW1463ThqdmmgFzWsVk
 BGkA==
X-Gm-Message-State: ACrzQf1U/KG+fsf6fn3+fJFLQivQq6ZZnIMvIH0wwD9czCNPFPuPR7Gn
 D8gNOH0NuQfnvcT3SvoeTx4BjQ==
X-Received: by 2002:a05:6000:156e:b0:22e:6bf3:79d0 with SMTP id
 14-20020a056000156e00b0022e6bf379d0mr12109853wrz.456.1667313311767; 
 Tue, 01 Nov 2022 07:35:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c414900b003b49ab8ff53sm10672323wmm.8.2022.11.01.07.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 07:35:11 -0700 (PDT)
Message-ID: <05002f72-176f-1299-0160-47d0f92c7344@linaro.org>
Date: Tue, 1 Nov 2022 15:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v8 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
 <20221101135749.4477-2-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221101135749.4477-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XXEtiDstg+qZ

On 1/11/22 14:57, Akihiko Odaki wrote:
> pci_add_capability() checks whether capabilities overlap, and notifies
> its caller so that it can properly handle the case. However, in the
> most cases, the capabilities actually never overlap, and the interface
> incurred extra error handling code, which is often incorrect or
> suboptimal. For such cases, pci_add_capability() can simply abort the
> execution if the capabilities actually overlap since it should be a
> programming error.
> 
> This change handles the other cases: hw/vfio/pci depends on the check to
> decide MSI and MSI-X capabilities overlap with another. As they are
> quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
> adding code specific to the cases to hw/vfio/pci still results in less
> code than having error handling code everywhere in total.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pci.c         | 34 ++++++++++++++++++++++------------
>   hw/vfio/pci.c        | 15 ++++++++++++++-
>   include/hw/pci/pci.h |  3 +++
>   3 files changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 2f450f6a72..b53649d1fd 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2512,6 +2512,25 @@ static void pci_del_option_rom(PCIDevice *pdev)
>       pdev->has_rom = false;
>   }
>   
> +bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
> +                                  uint8_t offset, uint8_t size, Error **errp)
> +{
> +    int i;
> +
> +    for (i = offset; i < offset + size; i++) {
> +        if (pdev->used[i]) {
> +            error_setg(errp,
> +                       "%s:%02x:%02x.%x PCI capability %x at offset %x overlaps existing capability %x at offset %x",
> +                       pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
> +                       PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
> +                       cap_id, offset, pci_find_capability_at_offset(pdev, i), i);
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}

I apologize for jumping at v8 :/

Per the Error API, function taking an Error** as last argument should 
return TRUE on success; or FALSE on error and setting the *errp argument.

Your function return 'true' on error. The confusion might come from its
name 'pci_check_capability_overlap'.

 > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
 > index b54b6ef88f..77b264c17e 100644
 > --- a/include/hw/pci/pci.h
 > +++ b/include/hw/pci/pci.h
 > @@ -390,6 +390,9 @@ void pci_register_vga(PCIDevice *pci_dev, 
MemoryRegion *mem,
 >   void pci_unregister_vga(PCIDevice *pci_dev);
 >   pcibus_t pci_get_bar_addr(PCIDevice *pci_dev, int region_num);
 >

Please document function prototype of public APIs.

 > +bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
 > +                                  uint8_t offset, uint8_t size, 
Error **errp);
 > +
 >   int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
 >                          uint8_t offset, uint8_t size,
 >                          Error **errp);

Also, consider configuring scripts/git.orderfile :)

Regards,

Phil.
