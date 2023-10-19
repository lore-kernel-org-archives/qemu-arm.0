Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp331716ejb;
        Thu, 19 Oct 2023 00:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ9Xm/BNJejxPL4QeC/aRWVZv3HH9IBhAGTniN2KVrxnZY/xWgmRO/ltugwHqz47mkhcUw
X-Received: by 2002:a5d:51cf:0:b0:32d:9740:5a22 with SMTP id n15-20020a5d51cf000000b0032d97405a22mr856909wrv.3.1697700782951;
        Thu, 19 Oct 2023 00:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697700782; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7tbgHaYGk13YDpBkHoZZ/MgelRelYOtU/mIV1Zk7FK8jvC/i+35izfwYBE/KJj6t0
         +Ts6xMco7ClzVixJGq81PSofobBUud1kIqewzS/pmBXrE/ygbj5QhVZnZrD0BKATNC+a
         9sIg7nJawU7NPtk0fZe7lVZcMI5v4LoSxF3ZRsts5u4qjwaaUTTO8VgaD5I0zuVyYZLn
         DQBDUMVuKIdAOtLp1BjGnW4eOXGoX7Y+hh15dZZFdSV6cQF4lqiWTKgIjxaf8VZGHN8Q
         pkqGV216Y0NahXB56bmVf/+pdRn3Kj/wD4fIANv6HOmE1xC9UPMLgokUo7ZzmS3ym1AQ
         IZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=JsbunO1ZP8IRqrq1kt9M0R27ejuML73I+v0C5y+JthI=;
        fh=/Gu37Vr91t9MFY1Ts9oDksSE8ZDQNteBQkb4V4psqfw=;
        b=CR4FiuHz1aF4LLIjKZNVSIV0eu7Kd/iTQG+YR4jx9sWtPz6Km/D53wSfMJzK8HYTgp
         NUlFRYaH84Tq0seb8Qr5miGifDPNK7VKWU01IF7G95RXqdX7w+ZzjqDTCb7F+mnrvYQv
         pPkl5ke5TutzV1NVyPGGg2xemyOCjyyIJJy6cht9XMrfNIw2yFQqAw0B6QoRu9Lb3WIl
         sH+4vNl55tT4snqKhI+hRG5yKdbKmhUv1ZU6U6+WyNYcqlXF+DMkrIAkiJKJDcKJiJ2X
         cFPM5rr8wUWRnpxjElCesV95cv/LT7BvdX2P3cLcpldHX2yC2cO8cjOFiDDkX641ZT4E
         ONzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AwqP0YJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a5d5263000000b0032db1d741a4si2235543wrc.279.2023.10.19.00.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AwqP0YJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNWK-0001aP-Pe; Thu, 19 Oct 2023 03:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtNWE-0001ZL-U7
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:32:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtNWC-0000sU-J3
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697700751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JsbunO1ZP8IRqrq1kt9M0R27ejuML73I+v0C5y+JthI=;
 b=AwqP0YJpKrzDaKNyVLPvCQbX24OP7E/9BzkRGIv+kzRW3apTY7tNllMMujZ/c3UKYwEFP8
 C7lJg3jedN72V+aNN065NUqRpwTh4ys4/OHtdtduUnX16hPx3ngiWbwk/wCTNyqpnyTp9C
 OjanesMz+Etg256U+c9bHJmkcEvalV0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-5Rv1MAqSNeqDA9kgZQYNmA-1; Thu, 19 Oct 2023 03:32:18 -0400
X-MC-Unique: 5Rv1MAqSNeqDA9kgZQYNmA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-66d155fc53eso90065896d6.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697700737; x=1698305537;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JsbunO1ZP8IRqrq1kt9M0R27ejuML73I+v0C5y+JthI=;
 b=uwYr9SvRk7u6XKbvWkMjPYlQxoabsDz9A2dye3EfaNbRWTLwtomItHc+YpOa6KMiK+
 Ybbk6BAaZY9aiXsRi/ABm+jAh4af8Dc/n9LzWweM6tNKTRmabCmBin5y56svMeqdYBt9
 PquGTglt6hz29oqrNAvJfWemZUmJtkLGq+3PKHsNmkFbfNtBK7D+/Igoa8IYkwSEhTeL
 MxfO/Gqa5mfRp07N4MgjSCfzkZUy5b9ULwIf7H/MABLFmuQg9/x2aAIBK735zm3ayKwF
 Uvv94+nO3/iKHVCBY+QzYEwbIYB3zyerCJPD3AnZPFYKH+KRvWarVxiawQPJoxMnelfe
 6F6Q==
X-Gm-Message-State: AOJu0YzCcC8eOkj3nJ9Ugpw1Iiti2bOOJcC74xLbrGTrjh942IaVa06+
 aPUNXe4IEiJqwt4KBPS6Vh4a8cjawrc8ILK94FyHsGsswco8T3aJsso5rRBZCUxElfE/AidPM21
 VoIGVqMfzKd0O
X-Received: by 2002:ad4:5ba9:0:b0:66d:403:414 with SMTP id
 9-20020ad45ba9000000b0066d04030414mr1258305qvq.54.1697700737526; 
 Thu, 19 Oct 2023 00:32:17 -0700 (PDT)
X-Received: by 2002:ad4:5ba9:0:b0:66d:403:414 with SMTP id
 9-20020ad45ba9000000b0066d04030414mr1258279qvq.54.1697700737284; 
 Thu, 19 Oct 2023 00:32:17 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 t6-20020a056214118600b0066d11c1f578sm591707qvv.97.2023.10.19.00.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 00:32:17 -0700 (PDT)
Message-ID: <885781e8-2dbc-4468-9a36-337720a66435@redhat.com>
Date: Thu, 19 Oct 2023 09:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] hw: Strengthen SysBus & QBus API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 8gUNjSmyXoUw

On 19/10/2023 09.15, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series ensure:
> 
> - qbus_new() and sysbus_init_mmio() are called *before*
>    a device is realized,
> - sysbus_mmio_map() is called *after* it is realized.

Just an additional idea that came up while reading your series:
I think we should also add proper function descriptions for 
sysbus_init_mmio() and sysbus_mmio_map() in include/hw/sysbus.h, to make 
people aware that the first function should be used within the device to 
expose the mmio region, while the latter should be used in the machine code 
that wires the devices to the correct location in the sysbus memory. What do 
you think?

  Thomas


