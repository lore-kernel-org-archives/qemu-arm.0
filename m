Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp8298930lfb;
        Thu, 30 Dec 2021 16:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ26DgfMyY9TdwokRKpKnyQV67LK74AWFefN0S5kEwKspHjgjoVWjDkvTJW1EhuLaro++s
X-Received: by 2002:a25:bcce:: with SMTP id l14mr28405523ybm.448.1640908900082;
        Thu, 30 Dec 2021 16:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640908900; cv=none;
        d=google.com; s=arc-20160816;
        b=E1AT6nSsnnf6ZmH+YpOSNfkoIRsDz2238E1bUIzSthEXuSk5VWi3wfLkQgMmz51hgg
         p04UtOtZbVMUdirKzs0NVINSnja9AyGbqo3ZylszLQAAD1tbll36PGOOeowOgK4I88Sm
         fOYWH2I+mJ/dK5r7cXrYEsrzvO6of8qDjbFg7vuRK3b6nBV/HwJujOIs4SUN5+UOEDS0
         SCUcNL28DCeQaWM2/TNfwjAjAAJKXsGdXwsHxa+OFv3S/vqv6ExLtc8NpH84/IZl/q8H
         kCcTLWe4vl3YhAjhFbQF6jo9TibewXOjX6+kLMcdqjWYBnZZFo4pQ8im9pUO4yBfhNXh
         94dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:to:from:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/xn81vPQ6hVXFBfUjuwswozTKQ3KmTFaoD2JXb8F7aQ=;
        b=xqPEQIY4/2quQOEjxpphHyttb35Ueqs24I/fJJX7CgrPryr3i3C6K9A7Pklb5T8tNo
         kGloHx6mJnk+HmuxRVrsH17la5IMe3krJDzOJ3dFAmJD2OY+vIuZAj57fOGkFIF6oiFX
         kCoHzLSjKnO6XKCVKOGFY+CCCPKSCSqlnE/T9TreLSeA1qFo/X3AgqwD0plpFi98azjd
         N7HYpp5K+n2PKzFLc1ymXEQw/TO/et606uLWSL/Y6qKR54rEITyackDL3TQuxX2gj79U
         mmkcz8wek+43wxHn5OyAYTwMe/COopmw78+FJkd40hjPrZReQ4/a8bmDPrkfX7/EiS3Y
         Zctw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ISUlW2Lc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si6982360ybt.538.2021.12.30.16.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Dec 2021 16:01:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ISUlW2Lc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n35MZ-00038g-Dg
	for alex.bennee@linaro.org; Thu, 30 Dec 2021 19:01:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35MM-00037E-PI
 for qemu-arm@nongnu.org; Thu, 30 Dec 2021 19:01:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35ML-0000Hm-6O
 for qemu-arm@nongnu.org; Thu, 30 Dec 2021 19:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640908884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xn81vPQ6hVXFBfUjuwswozTKQ3KmTFaoD2JXb8F7aQ=;
 b=ISUlW2LcXORMcZLPiWgB4Y3duCjEmShfqGkdeuE+Mj9laqvW+V9o6K9gO1OdOpNRfQiP1N
 Ym8XxbCpQ02Hs8fNhr069KVJD3bo+sXGeBzEt10XnBQOOQVf47i/nJXnIVgAjos0Zlteap
 //2DDzk3Rp7rXVGNdLJajWANeVsvcRc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-Ci-WtKVyNOmpqmUOb67avg-1; Thu, 30 Dec 2021 19:01:23 -0500
X-MC-Unique: Ci-WtKVyNOmpqmUOb67avg-1
Received: by mail-ed1-f71.google.com with SMTP id
 x19-20020a05640226d300b003f8b80f5729so16705097edd.13
 for <qemu-arm@nongnu.org>; Thu, 30 Dec 2021 16:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/xn81vPQ6hVXFBfUjuwswozTKQ3KmTFaoD2JXb8F7aQ=;
 b=CoiiM96sOrODSRS3flYOVG3DAO17LTa4RyncaGM1UoSNXpFUsHPJqY5NknrRMN01Ug
 iq+jGpZDsYeek6YzpZaBwdCk2ySC2RvnVRVCD7J+e6bjiLk+ZX0hpCntciJCakV9scUP
 QOLc/pPyy4eAg1FijoK4Tk9EE1vnU//2QihyXrUwUwo0417G8Nj1/4F7xw8Pfmsch5GO
 1BWYz83rSU3niqjxMnqDuODG9ALKgJ/y3bC4xu+OpHsS3hJIuGM0WFpSDmkyvoI2vnRz
 kj+9X1kQj086ieecOY0BLi7ISDq4V+sqkHhKnqvdKpaLgi86wtGIgJLuSCAVRszeNV2c
 PWyQ==
X-Gm-Message-State: AOAM5314yc0A5jClsI74hg8+ySjdkrdYMnBLNGYnVdkwvQCOOFqOdbP2
 +66N9IOBocPDlC8Wrvx0/9XELdquNCOUcEgX2Tu8J3feRM4iwVcejHjMOiEzDVcdYlqYDLlzqyk
 ZByjc+qF6xg6x
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr26709428ejc.88.1640908882328; 
 Thu, 30 Dec 2021 16:01:22 -0800 (PST)
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr26709385ejc.88.1640908882147; 
 Thu, 30 Dec 2021 16:01:22 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id ne39sm8114365ejc.142.2021.12.30.16.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 16:01:21 -0800 (PST)
Message-ID: <7b0147aa-1d45-1496-d8c4-d00eac68ce2e@redhat.com>
Date: Fri, 31 Dec 2021 01:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 00/23] hw: Have DMA APIs take MemTxAttrs arg &
 propagate MemTxResult (full)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
References: <20211223115554.3155328-1-philmd@redhat.com>
 <60d8426a-b2fe-08e7-5ab6-ee73dcd114cc@redhat.com>
In-Reply-To: <60d8426a-b2fe-08e7-5ab6-ee73dcd114cc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mLbF5rhADTjj

On 12/30/21 17:07, Philippe Mathieu-Daudé wrote:
> On 12/23/21 12:55, Philippe Mathieu-Daudé wrote:
>> Hi Peter and Paolo.
>>
>> This series contains all the uncontroversary patches from
>> the "improve DMA situations, avoid re-entrancy issues"
>> earlier series. The rest will be discussed on top.
>>
>> The only operations added are:
>> - take MemTxAttrs argument
>> - propagate MemTxResult
> 
> Series queued.

Patch 14 "dma: Let dma_buf_read/dma_buf_write propagate MemTxResult"
fails on 32-bit host (when passing &size_t). Dropped it from the queue.

