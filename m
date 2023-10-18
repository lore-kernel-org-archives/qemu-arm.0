Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4753043ejc;
        Wed, 18 Oct 2023 09:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyIaI1ufQIIU3rj8xAJfXsJVnbV/+s10axjwF5dYINKE0+e69O27PrnZRdSr1cWoLlGkkc
X-Received: by 2002:a05:622a:1182:b0:417:d1e7:5e9b with SMTP id m2-20020a05622a118200b00417d1e75e9bmr7090830qtk.26.1697645685040;
        Wed, 18 Oct 2023 09:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697645685; cv=none;
        d=google.com; s=arc-20160816;
        b=Fm7lvfaqamVgDekCKknqIdbQBl+dUlgZwGRiMcv4j0IBN+46CHTvoMCWwGsH70SBEQ
         mclqKpfou+fgy+xUQ+iLlq/MSFbhw5Cwno/4Dad7PtrnWttzThEPz3PD9dpRqybt7QR8
         GwQxHNxc45d0E4JgS0k3fqRpEIj+qNbz+3/DN2s+L3NJj8b8AQdt+kdeVN68KAd+Jv1G
         nt1h+59k23/8eJ5j8ZlpOKLC5X8BTVcb2QS7vlVwLC82uJbq2x5vcsAtHICxFeKDByJ5
         CRIvV/osmcNcvuk0PEcNQ9vPoRCTTsDsA71DgkQEyXCrlBTRPT0Fm3gTaoWmRy+Q/UGe
         KmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=2jx3MKIhr3Cy2mMKX0bXq+MRNohATmhsH0HuVOnk4E4=;
        fh=5KD7BjLGFDublHDNRImOelVUthgQZWbxdG3c9Bb6fGg=;
        b=p3zqys7NRDttXr+exWC/kzWXK89cXcbRkaPHJ/A4/qdTS1QmOzgK+V7zo97AtTzBj6
         OMzG1dIzdH+GGk+3qd5Axw9JU2q01CZi5f+wj+InQRh6/qsDoO3PO08XIZDrJH1Blshw
         4fEyUdYBv8MbwsAcRLUFSC1O64m6ijSBLQEawU6dNcIkB6pw6j53gspYeUqO7ZpjVZJV
         N1K6j6bms1ZwacCIo60JghqjzwpG9j7/fV0mQu14F8rQXKUbIL6Y3O0oCm/602lM0J78
         chn59b+6pahxZA+7+gx+fhSA8v9IKXKe8RcAskx4alu+fe1pPI1/PVMn26fZ78ntDcA0
         huzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QdahWCR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22-20020ac87f96000000b004033ec2f5e4si152296qtj.464.2023.10.18.09.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 09:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QdahWCR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt9BH-0007Ou-To; Wed, 18 Oct 2023 12:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt9BG-0006uw-3S
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 12:13:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt9BE-0002RS-GU
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 12:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697645635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2jx3MKIhr3Cy2mMKX0bXq+MRNohATmhsH0HuVOnk4E4=;
 b=QdahWCR0ky+54WPWj02F7MPB0UgU44l8cjbSyh0GXiv3o3LLM74cEiwb4A+im5qZ1Qf/b7
 gKY07ReJM6lO9jjhv4OoZAbER4SM2AjxjxUe0v1Z/ra5olbm+YhyBhlFtM2pd9Z3KEqh78
 1zXizFClYCxbBbBqvWKVNr8JZGuuaAE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-nhkFy0aqMX-sMM2fAOdr3g-1; Wed, 18 Oct 2023 12:13:49 -0400
X-MC-Unique: nhkFy0aqMX-sMM2fAOdr3g-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-77774341b3bso255961585a.3
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 09:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645629; x=1698250429;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2jx3MKIhr3Cy2mMKX0bXq+MRNohATmhsH0HuVOnk4E4=;
 b=vdkz/U8l2kPaJVMtOKoBFPpX0+DUXg+USpyxcL1J4UhSMwSuRwpMTTbvLfhIJDcVzb
 gyjAgkfv4JLzLw0NQtezcja3IZZ0xoTjrM+SgZsDiC2qflEMiYLJe9vCllOs8RoHdebn
 HpYG0omplO1fV9f7IitnYs62Hri3inWU6YHEleGB4GPL3uJphz8jppG83l0g6pr3Pkqv
 /NU0gZpZ1IjQA5GFLOODUAnA7tT1EGJIRATDLxJFajAvT6imASN6wprMTkSJJGrozR/L
 /wFtWS1qLCvhVNB8E2pYrLfL24zxtca+XUxEZKSTHyiDWttjcNzHgznGUg+q88nQ0iex
 S8QQ==
X-Gm-Message-State: AOJu0Yzg+nc8NjcrDgpW7CAz74gckWZ3se5NixoYrDnP9tcEuRV0E8zM
 iHUje1VBsXEuGsbz5iuLyX9jAc/hEa4lQVbvefrQFs5syukopu7MmqHX0OJlxNcw+wbu7VYyw1t
 JfJ03gxm6TvIc
X-Received: by 2002:a05:620a:1929:b0:774:33ce:cfb6 with SMTP id
 bj41-20020a05620a192900b0077433cecfb6mr7102486qkb.30.1697645628762; 
 Wed, 18 Oct 2023 09:13:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1929:b0:774:33ce:cfb6 with SMTP id
 bj41-20020a05620a192900b0077433cecfb6mr7102439qkb.30.1697645628439; 
 Wed, 18 Oct 2023 09:13:48 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 t22-20020a05620a0b1600b007757eddae8bsm65681qkg.62.2023.10.18.09.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 09:13:46 -0700 (PDT)
Message-ID: <44597d18-292d-4a4a-91b0-febf2519d9b8@redhat.com>
Date: Wed, 18 Oct 2023 18:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] hw/sysbus: Ensure device is realized before mapping
 it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
 <20231018141151.87466-13-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231018141151.87466-13-philmd@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eBgVo+vmyQuF

On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
> sysbus_mmio_map() should not be called on unrealized device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/sysbus.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index ce54e2c416..a46828a808 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> +#include "qemu/error-report.h"

I assume this hunk should go into the previous patch?

>   #include "hw/sysbus.h"
>   #include "monitor/monitor.h"
>   #include "exec/address-spaces.h"
> @@ -132,6 +133,13 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
>   {
>       assert(n >= 0 && n < dev->num_mmio);
>   
> +    if (!DEVICE(dev)->realized) {
> +        error_report("sysbus_mmio_map(type:%s, index:%d, addr:0x%"HWADDR_PRIx","
> +                     " prio:%d) but object is not realized",
> +                     object_get_typename(OBJECT(dev)), n, addr, priority);
> +        abort();
> +    }

With the hunk moved (or the order of the patches reversed):

Reviewed-by: Thomas Huth <thuth@redhat.com>


