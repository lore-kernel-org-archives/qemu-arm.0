Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2549841lfy;
        Thu, 30 Jul 2020 06:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb1Fd39cfW1uvjTeRbUQzJenRxv+QvK6ROh4ycclo8ibDoN3a0ZLKvZS4WLx4wmZbroSk8
X-Received: by 2002:a25:d7d8:: with SMTP id o207mr40022732ybg.409.1596114949284;
        Thu, 30 Jul 2020 06:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596114949; cv=none;
        d=google.com; s=arc-20160816;
        b=J1PUU3W87+6651Q6E7kWEguV31n8qYtJU7fXnfj7fnaqgp7hjHxJJc1Es2GDpUUgCe
         09wa9q9/GeDtTevq3xuFcXOM66lF2MO4sLC5kFXr1g7gYGdczl6lRZwNQ9JPmoI62wea
         7mqtjmpR0eCj5nBpkRxztNQpcCmgCM5XGld/lEoe+yPW72PcPnOfvYfbFZNA8M/MLTs3
         xPSIu151oHQSQgd7Cqw/bkBLAiDG4Z2X3kggHaWn6Cz07/dMnigqwbexXhE/HAP2IzYr
         Xa3fwqA8sP3bFjCcBL5sO524mUmiu1E+uMySTbK8RPJzeXJUi9wGsnjy6IyUc/c6RfQA
         jIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=SeZf0aDOryz8oEIwi7cYGFtK46KvQ1YiUCO/5R0RNio=;
        b=AJkMwy9Q3TfQKhf5wfqpAivGC0NlmtdcIdO8xk8sW+0LcrTuK/zxIS32A8x5r0+v4Q
         BcxqrsOFbYG5akTjJ5z7r8fImDEfCFFOsExGZBSigsAmnDV2Lx6yj492DjaWwYLD755k
         eWBj3mhEm32TtoDGDlp88hSJfhqREUV9CAOZoNVKBoWL8TVVUlffWX3x1uEqGuom8XIT
         u3ZrJkrSgaHnCb/L+t0J6Wwhg4BGR8a+nl6IzZebJ2QzN1lU+0ci+forTiluvA1f8XE1
         scKPdZ14rNYreCftSYD14k84fQMDpgWRaAimy/15LB7F1ZRtKDJk6JqCDW0El1zZLf15
         IVhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dufqvAKW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s207si5122222ybc.164.2020.07.30.06.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 06:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dufqvAKW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k18PU-0003Y3-EZ
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 09:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k18PB-0003WU-UM
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 09:15:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21775
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k18P9-0004kt-NY
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 09:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596114926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SeZf0aDOryz8oEIwi7cYGFtK46KvQ1YiUCO/5R0RNio=;
 b=dufqvAKWy/Cwl6P9z1dr+CM5d4BXohFlCdbWcP3Qk+5b7ZMbp3b72MEH914rD4Kl38TJZz
 If3aYaAE5jjjo3FyndHko2vbCe0Vh9zYVPxW1SYJ8lK94Yn2D0+VuKq7/lfiyfdvQ98fw7
 BOo4XLMIcchwmykArIxmRHdzTXtpJIg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-BW4k-y3jOtmBydwhB_Wc_g-1; Thu, 30 Jul 2020 09:15:25 -0400
X-MC-Unique: BW4k-y3jOtmBydwhB_Wc_g-1
Received: by mail-wm1-f72.google.com with SMTP id z10so2216574wmi.8
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 06:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SeZf0aDOryz8oEIwi7cYGFtK46KvQ1YiUCO/5R0RNio=;
 b=eTvdHPkRCGr2+2X4PSh4i0BWST59fzXR32ffY0JSnMDc4nCysPXqKHjONsTP/tL2P9
 Se8UGi8zwtCfYUsMuFagPwOg0zs7tvkP58/rh8zHsQAwfYQoVHkQcRe32e5j1i410xyD
 S+UhxWMr7mlrn66Br6zf2g+zPz2DsTtGcz/b0VeFqHtEJJA++znLGozQFJVLYlZBhP+P
 R0zcM5F9G+ndZwjVY818evFNslY3C3OtruTygB8oMXOta2Uw06Q4mhxRB2FWkJ+Iap01
 CDY8xImz9trts5+ekMkfnvWFlt62JPoTpFp+O7KUrx5ZCVMILY822WncwDt4rlNxpOBy
 017g==
X-Gm-Message-State: AOAM532n8jJJ6siDnpWXVCI+dVQvGWFjZBy5nB3rSJLeKzdcMb/Gj/KS
 UlDnQl7ujUHDlFl1Da2NlraiQej70h41zODTOMTxP8Qbdk3jqQqnqN53Z5hs8wON8XrVp0roy7J
 aXdcplicVsnA/
X-Received: by 2002:a1c:ba83:: with SMTP id
 k125mr13483068wmf.160.1596114923380; 
 Thu, 30 Jul 2020 06:15:23 -0700 (PDT)
X-Received: by 2002:a1c:ba83:: with SMTP id
 k125mr13483051wmf.160.1596114923109; 
 Thu, 30 Jul 2020 06:15:23 -0700 (PDT)
Received: from [192.168.1.39] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id z6sm10069322wrs.36.2020.07.30.06.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:15:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] virtio-mem: Change PRIx32 to PRIXPTR to fix
 compile error.
To: Kaige Li <likaige@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <601c098c-0f39-92be-8800-99f5fe99399f@redhat.com>
Date: Thu, 30 Jul 2020 15:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:41:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GOQ9l/0FOfjl

On 7/30/20 1:57 PM, Kaige Li wrote:
> When I compile qemu with such as:
> 
> git clone https://git.qemu.org/git/qemu.git
> cd qemu
> git submodule init
> git submodule update --recursive
> ./configure
> make

^ this timeless description is pointless (think at a developer
who read this in 2 weeks, 3 months, 1 year).

> 
> There is error log:
> 
> /home/LiKaige/qemu/hw/virtio/virtio-mem.c: In function ‘virtio_mem_set_block_size’:
> /home/LiKaige/qemu/hw/virtio/virtio-mem.c:756:9: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 7 has type ‘uintptr_t’ [-Werror=format=]

What compiler are you using? That is the relevant information to
include.

>          error_setg(errp, "'%s' property has to be at least 0x%" PRIx32, name,
>          ^
> cc1: all warnings being treated as errors
> /home/LiKaige/qemu/rules.mak:69: recipe for target 'hw/virtio/virtio-mem.o' failed
> 
> So, change PRIx32 to PRIXPTR to fix this.
> 
> Signed-off-by: Kaige Li <likaige@loongson.cn>
> ---
>  hw/virtio/virtio-mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index c12e9f7..3dcaf9a 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -753,7 +753,7 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
>      }
>  
>      if (value < VIRTIO_MEM_MIN_BLOCK_SIZE) {
> -        error_setg(errp, "'%s' property has to be at least 0x%" PRIx32, name,
> +        error_setg(errp, "'%s' property has to be at least 0x%" PRIXPTR "\n", name,
>                     VIRTIO_MEM_MIN_BLOCK_SIZE);
>          return;
>      } else if (!is_power_of_2(value)) {
> 

