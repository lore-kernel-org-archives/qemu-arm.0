Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7FBC4452B
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 00:54:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmLDY-0003qM-AN; Tue, 21 Jul 2026 20:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wmLDX-0003pr-6l
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 20:53:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wmLDU-0001OX-Cq
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 20:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784681621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ms+PcctC3n342gRzN0mT9Eceor/2hR0BO6Lviff0Eg4=;
 b=XlkwFJGX7teHFslokEbuRVuQu2PuDUW/3Z8Nj8ZdIMpsaXFETa00tpeQHkE4whSfKA2C+M
 Azlf942uO/Mx3Cespu8EuYIjAnL5QSbPasN+xrGwZ1nl1leBAs0uc3Eoxm//TVRSAhvtRe
 olwZuBnsG8/J5GBhUBCj2+FEqJVxzOI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-HkP117Y8M6y33ibwliczhQ-1; Tue, 21 Jul 2026 20:53:39 -0400
X-MC-Unique: HkP117Y8M6y33ibwliczhQ-1
X-Mimecast-MFC-AGG-ID: HkP117Y8M6y33ibwliczhQ_1784681618
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cc8bde6318so212243855ad.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 17:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784681618; x=1785286418;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ms+PcctC3n342gRzN0mT9Eceor/2hR0BO6Lviff0Eg4=;
 b=U5vhuDcuTBr0CjjKNL8N6QVTIIcQe3bJOopJiEDn6YfmsVv8DP384S55itC3dgXZRo
 hvdpamEYA5c/mDEWIPv4rH/LTsmxjyclcQxcVD1MjK54XA+P8qMuJQ4tkQDPo75tuM9y
 /4WGBk3p1oizJXRQfVzk86aED2NAPMtuI5EsQ7XDHiBEa/1a9lAWZHPEBQ03UdmetP/k
 u58OaBbzjgQoUI1zxMw63kLnIrBt50wukK+zItD1dyWFlw62iUXT/aXYWia2G6l/oPW1
 abOgoHWHsiBKkU+CITYoB35lO+EmF9nsW/by43iDH6dRi7hP55RL07omK0yYYDzvhsFC
 benA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpbGILBqJADlPfkcigowvdC8wH4E42TdfrJN1byfdYHcba0RsSjiZ9J/oasO/d0rgKlYCfnpyfL9w==@nongnu.org
X-Gm-Message-State: AOJu0Yz6O7UNpkJhq/pQljpN51HRU89WuIFpxtqeILDKrGErSxhI1v2x
 xxUxQDz+9LkLMYIidnIGfrbLfDZJhUPJcesNW87q2WP/KI4lJ25+09ub/97SrHC1CXoIfmPj1fm
 iHL3UfX9vWQTOMKLPbgfo8PZ/V4/YaQO7bexBCIIgQUt7r3HwUIXSUg==
X-Gm-Gg: AR+sD10C6c02BLgpCmGAl6Mq2tk5oaRKJnKvaPhkM8Y9m6ed9k92Kjq5elF4b3MPd2Y
 mzSLpWlvQKwDHmdLvA9t+IE6F4aHsOswSJENShDZb1lj52KGZ3/miCPdQimm/jo46rz4WC/TnoZ
 z2TkTl0Y4ZHm0CoDvlgF77Vovle5rzZyGTnxjg2+7A0hYktfVQtAh9bLr2G/cs+w5cY69qIlZlB
 Y3NRWxagVDM43a9b+914gzUlKOPFu8DdNHGpUGgLhjETnXZXm1JuciekaliAXHXMziWVvzO1ql7
 eE9yjq/B6ZZeXLeUGprlFMnrtMKahCSvvUVhojuTVgmpup3cxE+cZPsk0X86FOVqIiCQ2ygu3uN
 DDlRUHF+ReZuh9sxzo3J0JsP7eLVqNw1au7PXWoL2LU0=
X-Received: by 2002:a17:903:8d0:b0:2ca:d658:d874 with SMTP id
 d9443c01a7336-2cf34a0a6aamr227057855ad.23.1784681618368; 
 Tue, 21 Jul 2026 17:53:38 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2ca:d658:d874 with SMTP id
 d9443c01a7336-2cf34a0a6aamr227057485ad.23.1784681617889; 
 Tue, 21 Jul 2026 17:53:37 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf8efdbfd0sm5074695ad.21.2026.07.21.17.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 17:53:37 -0700 (PDT)
Message-ID: <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
Date: Wed, 22 Jul 2026 10:53:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org, richard.henderson@linaro.org,
 berrange@redhat.com, philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
 <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
 <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com> <al-eCtxGjG4HHEbl@x1.local>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <al-eCtxGjG4HHEbl@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OkqnwrzLWW5WNIDI2IloQ-MqiAvs9Eqieiq9Xs23nnE_1784681618
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=gshan@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/22/26 2:27 AM, Peter Xu wrote:
> On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
>> If Peter is fine with two variants for x86 and non-x86 architectures.
>> I can post (v4) for further review. That will be something like below
>> and let me know if there are any other improvements are needed.
> 
> I have a generic question on the "unaligned access for x86": I think the
> question is about the one Michael raised here on unaligned access may break
> x86 here:
> 
>    https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/
> 
>    3. (theoretical concern) also on x86, unaligned accesses are
>    possible on guest and host, so converting an unaligned access to a
>    series of aligned ones can in theory break devices.
> 
> Is that a real problem we need to consider, or can we start with unified
> approach and leave it for later?
> 

I'm leaving this question to Michael.

> PS: I apologize if I missed important piece of info along the way; I didn't
> follow closely on the discussion on this topic in the past few weeks.
> 
> One thing to mention is, what we change should only need to affect
> ram_device, AFAIU.. so most memcpy()/memmove() shouldn't be changed for any
> arch when it's pure RAM.
> 

It depends. This patch intends to fix issue [1] in the lower layer by using
the newly added accessors (qemu_ram_{copy, move}) on all directly accessible
regions including the regular (pure) RAM region. Otherwise, the newly added
accessors should be limited to ram_device regions only as you said.

[1] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/

Thanks,
Gavin


