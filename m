Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5543209ejc;
        Tue, 28 Feb 2023 01:15:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/hGZU5V8VZpl2QjliM24laK7QIb1CQjx/Csa8jLM6kYmHq5OjGHlW6Mki04cs/1hl63Hfz
X-Received: by 2002:ad4:5c4d:0:b0:56e:a07b:f4df with SMTP id a13-20020ad45c4d000000b0056ea07bf4dfmr4728730qva.13.1677575704110;
        Tue, 28 Feb 2023 01:15:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677575704; cv=none;
        d=google.com; s=arc-20160816;
        b=Lnz6dJHN6rkLGkZBAHCLidDWXRb/Oh8mZpgPqXlN+RS5UqQ+zN0ULiVbNTM66Mrdkn
         rNgbXr/STMRYIFDmqrpJtg3cRLLIFmZuiw6vpmFGYQXvE1WlYpChBv/V94UfxRMgPZZt
         DczwX4h0NKDdZ3lFaJBSMhrJtPf+s2kE5489SdzUunB0b9Kk0q+Rz+fZ4/AJCi6Xyx/m
         vYNBvRZjKqN1i1ybejB5YDuXEpj4ic6mkqgIfjR88JgwcVVtNS+ne2DwNpCLv02dYaII
         2eoerS1Tmxm68SXt1h3rty5QIF+06kIaDvktxJhiu6VJ+HmGbxr3GaNtB3RbUGL3v80I
         uBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NtPWLZOeXu1C5NyaeaHanhZFNS29T87n43afAPxa5So=;
        b=n5QMOf1D1BirCoLyyhO+1RaMs1VBwRRijtqzqEmQDqv4/jRzTmmUOQUtg8pQNFMdyp
         pfAxeYHlYwwXGE/PgoFL37Mhr8khMLhWjcasUlvm5MjscGEWrYPYAjOdd6IAtL/L0nJI
         fLY99qRIZKoMYV47NKsW/bH9wCUEAZ8qlQaH4H4oyaU+stbUdnyL6JBtu6+xstcVJpOQ
         eHFCo2tRT6qI3jZNpA7WH5vUF8uRla52cfdVO5YnJGmpAfCjH1WEKmKIaqZQ/di2LOcF
         QAwMtenFoN5aQEgl0C320k798CAnOiCxyTyJATkssyPY17VO3PUQopN9KDjxC+ncz4SH
         gRnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b1EHtkKe;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r1-20020a0ccc01000000b0056ea051a8edsi8271597qvk.323.2023.02.28.01.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 01:15:04 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b1EHtkKe;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677575703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtPWLZOeXu1C5NyaeaHanhZFNS29T87n43afAPxa5So=;
	b=b1EHtkKewBQGQrwT6i/DLlXlPp+8vM/NNTWbCKr6euw2lrh/23jpf+P82xYOGeGFpvikec
	lBoXTo3tpw5dQpMJqlGJoaA/zO+fcT2TcyeMpBTH1JJYsAeBY0jcv+0zLMHJjvuzXXtUWo
	APrzI/IlDuQRmgP1+BP7m3gAp8UuAY4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-ODN5MLm6NGmVM2eKh2LfqQ-1; Tue, 28 Feb 2023 04:15:02 -0500
X-MC-Unique: ODN5MLm6NGmVM2eKh2LfqQ-1
Received: by mail-qt1-f199.google.com with SMTP id w16-20020ac843d0000000b003bfe50a4105so1307476qtn.10
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 01:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtPWLZOeXu1C5NyaeaHanhZFNS29T87n43afAPxa5So=;
        b=UHynyi/aStvi/U3pUSLjHRkMXhnBKJzoDdbFGaSPJxuZxS4CoP6iOC3YvGhV8jCR5r
         hc5wpwZ0IrM6DsgQfzjZymw5k3X3Y5s3SecXM9V1CwFJwdJQE0GiPDkkI4cvpSEP6j4s
         xJTaopSaAkGV3HoU37wcrlSGhRxhlTOED/2PQ7rtQW2FWjxaREmKNPzg79K+bSzJoBMp
         YaC5uKEYxNXx4DMaTNOgVO2/e/ck1jHXBrhgJ5zwFv6a/N7E75255WPwM2686BrjnvpY
         G54V9PLPC+ynLGyHNQmQrSMpaPj3IAMSzt4ljlgTRmry0NUo4LVSRIJPHJU4HsgHFFO4
         iHgw==
X-Gm-Message-State: AO0yUKUNFTPgB9EmihgwzMxXo/SVeDoIeJkBaBHEfVzoDaLxjrs77k+X
	1iNSlQVX/wrQsHZtHtyIylm7o2nMlNRtJRGS8pW/cHEi5fkHUuFsu7TxbMb9q7HeCHgpie+LfV9
	nVrXrWcrCHqNHBYjh
X-Received: by 2002:a05:622a:1aa0:b0:3bf:e4da:2367 with SMTP id s32-20020a05622a1aa000b003bfe4da2367mr4024640qtc.3.1677575701892;
        Tue, 28 Feb 2023 01:15:01 -0800 (PST)
X-Received: by 2002:a05:622a:1aa0:b0:3bf:e4da:2367 with SMTP id s32-20020a05622a1aa000b003bfe4da2367mr4024622qtc.3.1677575701703;
        Tue, 28 Feb 2023 01:15:01 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de. [109.43.177.75])
        by smtp.gmail.com with ESMTPSA id y24-20020ac87058000000b003b0766cd169sm6367904qtm.2.2023.02.28.01.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 01:15:01 -0800 (PST)
Message-ID: <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
Date: Tue, 28 Feb 2023 10:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org> <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228040115-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ONyjcQt1xNXL

On 28/02/2023 10.03, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
>> On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
>>> On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
>>>> On 27/02/2023 21.12, Michael S. Tsirkin wrote:
>>>>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>>>>> I feel like we should have separate deprecation entries for the
>>>>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>>>>> although they're related they are independant features with
>>>>>> differing impact. eg removing qemu-system-i386 affects all
>>>>>> host architectures, not merely 32-bit x86 host, so I think we
>>>>>> can explain the impact more clearly if we separate them.
>>>>>
>>>>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>>>>> a superset.
>>>>>
>>>>> Removing support for building on 32 bit systems seems like a pity - it's
>>>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>>>> and the maintainance overhead is quite small.
>>>>
>>>> Note: We're talking about 32-bit *x86* hosts here. Do you really think that
>>>> someone is still using QEMU usermode emulation
>>>> to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
>>>
>>> I don't know - why x86 specifically? One can build a 32 bit binary on any host.
>>> I think 32 bit x86 environments are just more common in the cloud.
>>
>> Can you point to anything that backs up that assertion. Clouds I've
>> seen always give you a 64-bit environment, and many OS no longer
>> even ship 32-bit installable media.
> 
> Sorry about being unclear. I meant that it seems easier to run CI in the
> cloud in a 32 bit x64 environment than get a 32 bit ARM environment.

It's still doable ... but for how much longer? We're currently depending on 
Fedora, but they also slowly drop more and more support for this 
environment, see e.g.:

  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_dropping/

  Thomas
