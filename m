Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp4207781lfj;
        Tue, 10 May 2022 02:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybMK+z1O88Zkd12v5McABVzLk37+9p4f4f4J0xF8mSUT34btVSOfvDWWgE2JWaSjg2oYYc
X-Received: by 2002:ad4:5de7:0:b0:45a:b6b0:67c with SMTP id jn7-20020ad45de7000000b0045ab6b0067cmr17340824qvb.21.1652173925512;
        Tue, 10 May 2022 02:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652173925; cv=none;
        d=google.com; s=arc-20160816;
        b=Of9HSy+bQc/F+mWej4jmtwzIUE1rLkFryKTED2a2FdIqbECHjIHYIGE3PV0O4SiTB6
         hCNfZvIoGajiJJQdY5kqTbQxV/ARQf1mbhuDPYKpTLU1/3o76I8vyfhclrxXiRG42PZY
         x7OFujJaE9AN53Oo64pIN0yCzSmCiFaE1h0IsHp4N0djuKZdQDoplEb5HGvRS7gojc21
         3MWPJuGkv8uQfMQPcXItUVzG6rtIPHqC+3ZVw4KhbwfaiR0WBbQ9FgnAkEqKbhG3hDax
         xHdywK/pDG4JaYYof6jgrMIKNZ/vzvAYEVlkiW1SIyn7/KrsIEVDytxq7E3/5v61r40/
         Uf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:from:references:cc:to:content-language
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ncKBzl0qNkLIuFukWr9xnif+Z8mL0MAWOnWtgNK39Z0=;
        b=dRHEHgprXKKuIQtxbBFpXzENpPwvEm0heGQ1Qy8Cd6SC7ozamk2HAGl1AJzzG+zWSz
         g9HS44m/z7JY4PNAShe8xPeDm5Cppe85p5f04rUJEX4VooOnqxpojaWDcYvkl09+sjQ0
         GkD5cl+2VMClKsY60rMAvFp47/PO/ofWtj72hmIPTbapjEL/37EF5dl9+oOHj6RHEn5Z
         eh4G3yWTiNmifX0DiajbFGjAMDNxCzARy0FujWcfCFTX20tTjUHzukrS5bn3iJTSJREE
         nQ/8Xs90/Zwzaqxxc+bfXsJm1cund+ygL5hJJgb2wNzEgzov81E4nz8lOrhawQqLOn+g
         hXJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IW9Y+MD4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05622a170300b002f1eaa34acesi10243315qtk.315.2022.05.10.02.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IW9Y+MD4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noLuX-0007jK-0Q
	for alex.bennee@linaro.org; Tue, 10 May 2022 05:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noLkE-0003jC-Cq
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noLjx-0004eK-S8
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652173265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncKBzl0qNkLIuFukWr9xnif+Z8mL0MAWOnWtgNK39Z0=;
 b=IW9Y+MD4JN4uqvK1JWAQlJ4DOGybRnuFE5d5D7Fv+5BhetCgpFSO7x7jzbxayC8DABikfH
 K3/4M2YeOAN+rtaZ2h78Y7zigu1onV1Zoq+WMOIvl9EuYr8wpgKAIUCVEuNTBTXTaaRFTv
 Fih+wDHVAotXxpQhs6IIlrAoi0mX3f0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-yfVue7sEMPOJNCXmqoMZGA-1; Tue, 10 May 2022 05:01:04 -0400
X-MC-Unique: yfVue7sEMPOJNCXmqoMZGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso5027251wme.1
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 02:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ncKBzl0qNkLIuFukWr9xnif+Z8mL0MAWOnWtgNK39Z0=;
 b=Na4P15rDdu7BD7GJDJvzm4HruIzDvI9wAya4b/EI+jscjWcMPCeEkd8eTxqopDNeTm
 aLhk/M2YcyJVOFYHxkBhjVJq56RxT5Dqbtj23+FsAw+y6SjXendgvN7ShtLpT+QLOmGa
 5AXRz6+W7mAg/5M2qhaRXoJFgmw3Lh15mWERulcDdti5NrxjyDPMRm2hXwwIfRvi4wW6
 Ub4DdRA1OdpIwqmAZdwdqqOe2D90hlWDypokNoTm8C/crFNU7sh1t87O42JLp7SuQU4L
 yV27BY2TGr35v2Vm2pzn4ECQvs45EP/tigwQJuzmiVsxfpbAYBQL5eMH2SN0f0pH1vA0
 LKZg==
X-Gm-Message-State: AOAM531dzcXnevcSpt4QEsifkRl44Lj/uF9C5me30d78HvjKfFmbSe8r
 4ra3Psq+CTAMzN0WCScaGQ4YtETfrokceqH1aYdE3vdlskLExIRwPWM9nkXgDaKac9q6MOm73/s
 ANGmkwPq2uq/r+9U=
X-Received: by 2002:a7b:cc17:0:b0:38d:af7:3848 with SMTP id
 f23-20020a7bcc17000000b0038d0af73848mr20632564wmh.41.1652173263614; 
 Tue, 10 May 2022 02:01:03 -0700 (PDT)
X-Received: by 2002:a7b:cc17:0:b0:38d:af7:3848 with SMTP id
 f23-20020a7bcc17000000b0038d0af73848mr20632539wmh.41.1652173263412; 
 Tue, 10 May 2022 02:01:03 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n34-20020a05600c502200b003942a244f35sm2076306wmr.14.2022.05.10.02.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 02:01:02 -0700 (PDT)
Message-ID: <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
Date: Tue, 10 May 2022 11:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-RISC-V <qemu-riscv@nongnu.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
In-Reply-To: <877d6tzs2e.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9rhNAdItK+vZ

On 10/05/2022 10.54, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
> [...]
> 
>> I once suggested in the past already that we should maybe get rid of
>> the 32-bit variants in case the 64-bit variant is a full superset, so
>> we can save compile- and test times (which is quite a bit for QEMU),
>> but I've been told that the 32-bit variants are mostly still required
>> for supporting KVM on 32-bit host machines.
> 
> Do we still care for 32-bit host machines?

As long as the Linux kernel still supports 32-bit KVM virtualization, I 
think we have to keep the userspace around for that, too.

But I wonder why we're keeping qemu-system-arm around? 32-bit KVM support 
for ARM has been removed with Linux kernel 5.7 as far as I know, so I think 
we could likely drop the qemu-system-arm nowadays, too? Peter, Richard, 
what's your opinion on this?

  Thomas

