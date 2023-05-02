Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2072808ejm;
        Tue, 2 May 2023 03:18:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5scargU1vCYR3tseamxrXFDDCpRj8pj+SvTQYkupzAy0aGZV0RcSW3WHASRHjC2hSBTTpC
X-Received: by 2002:ad4:5ba6:0:b0:616:5a74:4577 with SMTP id 6-20020ad45ba6000000b006165a744577mr2832257qvq.11.1683022682181;
        Tue, 02 May 2023 03:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683022682; cv=none;
        d=google.com; s=arc-20160816;
        b=M8gYnoU7teaH/Fo15YAkgJM4e/NC+/lofTVd12saa3InQij8igLqIU266ibEWjIrKs
         H84V76B1cs5pJ5K0wzAmOe4QM5A81ZF9ggXFKcntDJyKRD8KNt3LKms1re/eSchao4WD
         y6zSALaNoM8ZD3tZUkgRHpyOCKTCfCr4pi7MUQaT/Wzwvj/Zh9y4CXbRtL7k7V3wk7DX
         NSzaxLE+joXvLryKpmdgv7qpIjgcCBVS7qeKovNMtf93GAdpGgXpSN7ruMwkNpTQ9KrU
         XBC5fD2+UEg3UqCS8aZ76HAVbAQhGK3/Ukl12bYu4cdIDA+2dATqdPPY5IaltyJs0qe1
         Sjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=E1l3XMnkGIekijM50coq7K7cEkjPsryzXW5fy04pDPI=;
        b=MBd4lTTHNqNeG0hUFS8fktUf7NaqBIH28KBJr4yJvisSVN4ALqERVbh+lnIGgOlBGw
         yWPqZ/AvHDo1svVjYNi/S0cXGPbo7ZDs70FK3ombNxd0FwKmVONTVee1PaZa2/xKh9kc
         xumd5rBer7akF6GTls5VP3YQS7e0ob3ySGnlk0ksheY+kBE3TfQXLc4Dmkg9X3R9zJur
         q7ELXyJTcUIB+wPtbr8JElHUUS2IzDiEF481jK6+tjC2uuRb4XcY813QGKiU9tgExlVO
         lxXtNrE5yd6StvPhcc5+kKVenW95RdsSNZpWFKmFesgTPFeUEjnL9ZKHLNOvuTq3JuuC
         heww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZWTHfVYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a05620a108b00b00746b2d7bccdsi4556146qkk.506.2023.05.02.03.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 03:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZWTHfVYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptn4d-0003kg-SB; Tue, 02 May 2023 06:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptn4c-0003jg-2M
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptn4Z-00088p-LH
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683022645;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=E1l3XMnkGIekijM50coq7K7cEkjPsryzXW5fy04pDPI=;
 b=ZWTHfVYvt8CSLoAAM812aRSIUoRxj6jtRhnW/qI981xdMz71lt4cDCbhLanaEc802xY+04
 rsN1hN+qm/Bn8uPl7Fhy5UgbsTk3pJwOQRmOba5nNWfOhjmFhok9dfI8wONfHjhlWZN4QB
 cVsHZnAUH9Srhi7j+K5zGT/Zv1z6HZU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-vglU6XGnOTuIK6GBVKbatw-1; Tue, 02 May 2023 06:17:22 -0400
X-MC-Unique: vglU6XGnOTuIK6GBVKbatw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1793d6363so10512245e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 03:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683022641; x=1685614641;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1l3XMnkGIekijM50coq7K7cEkjPsryzXW5fy04pDPI=;
 b=XuTLNSxBHl1kvA30F3qjGOehqcOyF5r7vqA3APjIak1rKPZJU5gGf1B09OmlEtS6mm
 dxWcLIV0k4U3DcDJagH1pJihq3b0qTtOaE4FJgJkjyU072gpL1gLiNXs445gbKuPy/Cn
 O7Ph52Qa5Vi9j9y2lQxPcQBfYkwDB7LaBCqVbN0enwtBkuILN+l7z0AFIzmzXAG+WTGB
 PBAQ/VNQTMF36y9pnL4lhFdNoDHskk5QnrV6fnCdTguycaTqkGaDmDUi5T6ZrRXG5AE/
 bbbu0jINinxOPA0ttjQ3iRWAsc2SNgcfJHvZWxwp64HSBNz0IebxeMsLenfjLliwm4Zt
 tT/g==
X-Gm-Message-State: AC+VfDzx+6CXEFmcae1DV2yCwKKYKP5SHsSXDxyz5VyJcR65rLuDDNDI
 So7an9ku4jJmWj+RpbflsB5o7qevq2zhM3cHVl6W6K0JJVk6LIMfebwlr4BOAsGcsVD1sCI6Iwg
 Yqp0ggqkyuehC
X-Received: by 2002:a7b:cb8c:0:b0:3ee:6cdf:c357 with SMTP id
 m12-20020a7bcb8c000000b003ee6cdfc357mr11126854wmi.20.1683022641202; 
 Tue, 02 May 2023 03:17:21 -0700 (PDT)
X-Received: by 2002:a7b:cb8c:0:b0:3ee:6cdf:c357 with SMTP id
 m12-20020a7bcb8c000000b003ee6cdfc357mr11126838wmi.20.1683022640901; 
 Tue, 02 May 2023 03:17:20 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 l10-20020a1c790a000000b003f32f013c3csm9766832wme.6.2023.05.02.03.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 03:17:20 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  kvm@vger.kernel.org,  Eric
 Auger <eauger@redhat.com>,  Gavin Shan <gshan@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Andrea Bolognani
 <abologna@redhat.com>
Subject: Re: [PATCH v7 1/1] arm/kvm: add support for MTE
In-Reply-To: <871qjzcdgi.fsf@redhat.com> (Cornelia Huck's message of "Tue, 02
 May 2023 11:03:25 +0200")
References: <20230428095533.21747-1-cohuck@redhat.com>
 <20230428095533.21747-2-cohuck@redhat.com>
 <87sfcj99rn.fsf@secure.mitica>
 <64915da6-4276-1603-1454-9350a44561d8@linaro.org>
 <871qjzcdgi.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 02 May 2023 12:17:17 +0200
Message-ID: <871qjzujf6.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9C7FaBKoycSG

Cornelia Huck <cohuck@redhat.com> wrote:
> On Mon, May 01 2023, Richard Henderson <richard.henderson@linaro.org> wrote:
>
>> On 4/28/23 18:50, Juan Quintela wrote:
>>> Pardon my ignorance here, but to try to help with migration.  How is
>>> this mte tag stored?
>>> - 1 array of 8bits per page of memory
>>> - 1 array of 64bits per page of memory
>>> - whatever
>>> 
>>> Lets asume that it is 1 byte per page. For the explanation it don't
>>> matter, only matters that it is an array of things that are one for each
>>> page.
>>
>> Not that it matters, as you say, but for concreteness, 1 4-bit tag per 16 bytes, packed, 
>> so 128 bytes per 4k page.
>>
>>> So my suggestion is just to send another array:
>>> 
>>> - 1 array of page addresses
>>> - 1 array of page tags that correspond to the previous one
>>> - 1 array of pages that correspond to the previous addresses
>>> 
>>> You put compatiblity marks here and there checking that you are using
>>> mte (and the same version) in both sides and you call that a day.
>>
>> Sounds reasonable.
>
> Yes, something like that sounds reasonable as an interface.

Ok.

>>> Notice that this requires the series (still not upstream but already on
>>> the list) that move the zero page detection to the multifd thread,
>>> because I am assuming that zero pages also have tags (yes, it was not a
>>> very impressive guess).
>>
>> Correct.  "Proper" zero detection would include checking the tags as well.
>> Zero tags are what you get from the kernel on a new allocation.

That was a different thing.
On precopy, we handle zero page one way and non_zero page other way.

On upstream multifd, we detect and send zero page on the migration
thread, and everything else on the migration threads.

With my patches (on list) it send both zero and non-zero pages through
multifd.  My proposal will be that we send the 128bytes/page for every
page, included zero pages.  Here I mean zero page a page that is full of
zeros, independently of the tag.

>> A page can be dirtied by changing nothing but a tag.

I hope/expect that the dirty bitmap reflects that.

>> So we cannot of course send tags "early", they must come with the data.
>> I'm not 100% sure I understood your question here.
>
> Last time MTE migration came up, we thought that we would need to go
> with an uffd extension (page + extra data) to handle the postcopy case
> properly (i.e. use some kind of array for precopy, and that interface
> extension for postcopy.) TBH, I'm not sure if multifd makes any
> difference here.

uffd is a completely different beast, and I agree with you.  I was
meaning here the precopy/multifd case.

>>> Another question, if you are using MTE, all pages have MTE, right?
>>> Or there are other exceptions?
>>
>> No such systems are built yet, so we won't know what corner cases the host system will 
>> have to cope with, but I believe as written so far all pages must have tags when MTE is 
>> enabled by KVM.
>
> Has anyone been able to access a real system with MTE? (All the systems
> where I had hoped that MTE would be available didn't have MTE in the end
> so far, so I'd be interested to hear if anybody else already got to play
> with one.) Honestly, I don't want to even try to test migration if I only
> have access to MTE on the FVP...

So here we are.

I have seen the future.  And it is very blurred. O:-)

Later, Juan.

