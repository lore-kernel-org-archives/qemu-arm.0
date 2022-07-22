Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp148388lfp;
        Fri, 22 Jul 2022 02:27:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUWhyt+t9HYIJNU8ylPfCVBDZBfOW287ySoJ9iDjlv3W7pRP1xVpCnNeNl3O2V/AeZMpNK
X-Received: by 2002:a0c:da90:0:b0:473:f707:c6a7 with SMTP id z16-20020a0cda90000000b00473f707c6a7mr2252988qvj.18.1658482037862;
        Fri, 22 Jul 2022 02:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658482037; cv=none;
        d=google.com; s=arc-20160816;
        b=MnvZzYmZ58zOpsg3u96AAoeLHSAr1zrjSUCBENhLXJNE3sxhWjFGb0/7G+QRQYNADr
         QTENdhRse2K0p2UP9YeKDeiuz5KiVJdrBilC+ocyE43UoIXdz2QM2AJt07FcRXpMaIrM
         hvm2PS0XybLKXTh0oafT8PjDAWg6/wPKimM8Z9rpNk29ByUGrSHYUo3usphSSyjzPgar
         ryPPP3RRHQUvbkPA5ipM9pFCxDpx6YYv4963YU7pmqJ1EUSoyXgo2OjNEoe1lIrShVQG
         b07wmH8FlzaYeVHNoCr48gzbwS9mzCy14t1VVZziss3dWd3zwBpN3rxFeBwEfsKopFD9
         nKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:cc:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=V6QZ1czF51C+g6GnvsBTVWA9cOGVWu2XPkXNWt4MC6Q=;
        b=q8OTLVgYC8uKJwi3GN2Dj0xKgKuSr0yLCxC7loJilYJPAbtYUH6WvbQ//KzcSMRvBC
         om7goezp+mDTj5JSyNU6GMhhfLthRzPZVt9qHsUObl9KX7UYv5ucDjOpp26/ybA6T4js
         46sXbUZl9COE7VQAkZ2GG4ifqOokTP4Mn5HkuLKz+jtqz8X7IEL8GoEVEGzLgxdU7QZN
         4ySbQEZsezjEH8cxNQESl9nCdmaFB/pp+kLtWEKLp3euX1vck/VESaB5giLFlu/BkTLT
         gurqyBy4dqvsyywf29nWvYBj6fMr3H5R6PDzMJnJ7z+ml2Eq0AwIt1aNfoADOpfyNo4A
         oAqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PaiFT5Hb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i63-20020a375442000000b006b61b2516e6si2468370qkb.142.2022.07.22.02.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jul 2022 02:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PaiFT5Hb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEowH-0003nn-C8
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 05:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEovi-0003nc-CQ
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 05:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEovf-0004fH-Gr
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 05:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658481998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6QZ1czF51C+g6GnvsBTVWA9cOGVWu2XPkXNWt4MC6Q=;
 b=PaiFT5Hbq3QavkLKVZQ2ebykVu37BS9d3GkgEX/tRpZu/N8KuZ8QPb57ry9pJ25wMm5Hqc
 bnV3mYOXItV8D/VFzzgzS0e0dW9Xbkuyw76+BhmKNTmRYPcStpWGOx51gyDmUpn3RjxD72
 hNCAfQo7fj5UMVD/OjSLFpc30+elVs0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-SEovG_lQN7qiiE6rnRaBZQ-1; Fri, 22 Jul 2022 05:26:37 -0400
X-MC-Unique: SEovG_lQN7qiiE6rnRaBZQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p36-20020a05600c1da400b003a33a8c14f2so1144109wms.7
 for <qemu-arm@nongnu.org>; Fri, 22 Jul 2022 02:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=V6QZ1czF51C+g6GnvsBTVWA9cOGVWu2XPkXNWt4MC6Q=;
 b=RvD/gqSBSRoioecE0/LuhKFo4SN5F5Y8IVPBVZeE7qzFwp7jXKI3cMFp7qYRbwBRui
 pESbL+sUEXmdcMxxFkQ0D16V4jnBSdVIcUo2p8BXkRbB63sozkj7PzqHArsWcOs7Omuc
 irjZycPUik6pCb0BDS6mvfDxTglFTyKAXNaA6dHzLUBf3QkuyK+NkzCB/NsB4iW2DDJS
 NnQf6tViUCur8N35tx0AdcDhBepRVGFbnpBWKsn0ptmpKqfCs3xN3tuSl7xPBudO/jqX
 xn/wS4yBWUjsAtcF3+cQg27eXGwuMRWp6qPZ8UKEHaGokgbEeOHtPzNwADaKJNTP7PMh
 kP8w==
X-Gm-Message-State: AJIora+OeqW/gcKzUHYwr/UENvr2ckEn9emjZpSMaGfJTjCHpIawL4ey
 DQDG5JBta2TMbIo5Pe4djmAOrfNj6XF7Dc0McpLw+CT+avzutP3/iCmstJqmJIF4olPAbJBu34Z
 0tlaQ64XdJMLs
X-Received: by 2002:a05:600c:3556:b0:3a3:2a9c:f26 with SMTP id
 i22-20020a05600c355600b003a32a9c0f26mr10197849wmq.58.1658481995984; 
 Fri, 22 Jul 2022 02:26:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3556:b0:3a3:2a9c:f26 with SMTP id
 i22-20020a05600c355600b003a32a9c0f26mr10197817wmq.58.1658481995568; 
 Fri, 22 Jul 2022 02:26:35 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-42.web.vodafone.de.
 [109.43.176.42]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c4e0c00b003a2fde6ef62sm4375839wmq.7.2022.07.22.02.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 02:26:35 -0700 (PDT)
Message-ID: <a33c9ea1-e622-ae8d-5f12-1b20599e8b4b@redhat.com>
Date: Fri, 22 Jul 2022 11:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Hard limit on 256 IRQs in qtest
To: Roque Arcudia Hernandez <roqueh@google.com>, qemu-devel@nongnu.org
References: <CAKbPEtZxCGfz4_h8_YMg2bb-kQF0sorLAppKcBTweV0gxM+OLA@mail.gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAKbPEtZxCGfz4_h8_YMg2bb-kQF0sorLAppKcBTweV0gxM+OLA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RyD9LzHahvuA

On 21/07/2022 18.17, Roque Arcudia Hernandez wrote:
> Hello,
> 
> 
> To write a qtest for an SoC using ARM GICv3 as interrupt controller the 
> qtest infrastructure is short on IRQs.
> 
> File tests/qtest/libqtest.c defines:
> 
> #define MAX_IRQ 256
> 
> Which is the number of elements in the array that is used to keep track of 
> the value of the irq gpio:
> 
>      bool irq_level[MAX_IRQ];
> 
> The GICv3 can take up to 1020. The SoC we are trying to emulate uses more 
> than the current 256 limit we can observe at the GIC input. If we focus just 
> on the external interrupt range the GIC would need 1020 - 32 = 988 IRQs. 
> Will it be OK to make this change to the qtest infrastructure?

I guess it should be fine. Just not that you have to adjust the same #define 
in softmmu/qtest.c, too.

  Thomas

