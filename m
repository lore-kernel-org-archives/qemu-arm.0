Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCA1C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 13:03:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiAsI-0007F1-6c; Fri, 10 Jul 2026 09:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wiArO-00068q-JT
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:01:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wiArL-000636-5h
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783688498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yrNmqM1rUndTJ0w8K8WVuBrkzlm+ae3LiH8cPhp8Mo=;
 b=PGiACDRBjM9kUVvLGTXJ60UkjRTRaVw0TUx0y+NOL2pCkrE3vDDkPXqeEN6Lii9jmoIsw3
 evXb9/hKnITiOnt/hPRvd0v745Ffw1xT+1CRDnb9u8YU0U9Z/sM/Vj9LoO+Rs/6Iv8UeKg
 YZ8T+Q3SHEzy1odO5osy4cXIbbu1zug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-Vda-6MdMOeW1PNYrAKzQBQ-1; Fri, 10 Jul 2026 09:01:36 -0400
X-MC-Unique: Vda-6MdMOeW1PNYrAKzQBQ-1
X-Mimecast-MFC-AGG-ID: Vda-6MdMOeW1PNYrAKzQBQ_1783688496
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-475b0b4e8d5so898603f8f.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 06:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783688495; x=1784293295;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8yrNmqM1rUndTJ0w8K8WVuBrkzlm+ae3LiH8cPhp8Mo=;
 b=S26tWuzxi+dsKHo70XzQgwmkAEjRVIvp0AQ4eEPRyQWXnbJ5mGkayHsW84DlIl1QZZ
 9P6nEcjknGnlZNFNuI3uuDVQf0dmExs25wy1vZb0yLMmBEzomFjoxIKVh5TivYbnQgN/
 F1bQn45LbSlmWo3XVu+RvoyxPOW9JrCNOu905ajTs8CnQphahXy37szQcxFfrDuOeOR7
 8jhU9pINWnB7SOB0vqDAgrvXn/3lcIyeHI4HWzIh2tDxSOapFFuMm8BSleq+RB2q8ymg
 yrA6oOC2ghCF56hs3flAehLpPCwY2+MKmb8yqmC/VmzCLMDeD9vBz4HHA+JWOPwULm04
 8BJg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrs89IhqIyOghd/UjfDus97e0210D/s4jxDv4NYlpKjVQMzt9h3EWO2JtAlMyvhBrxDoh4N5WcnWQ==@nongnu.org
X-Gm-Message-State: AOJu0YzocqqVoAuBBTcOfxDwacCuXtDmn5R7Pg6gSu5HVm4RzcxcTUHF
 8eEzXu/HmXGVRHtlDvUtdpPg+6aZ3OrxEqlrYsXXiaCOpSLwyoppgdsL+PgVXkLeTUDMtmm8+V7
 McLByMq079J0LviYoaxBElvqNOT5CBW3mFHcx5D0vb5ANwvKjo3TRyQ==
X-Gm-Gg: AfdE7cl1zQLdQgj/a9pNiokUwan3WiPpNwGRpylmy40aQ84oudggMiblP+ioeWXntP6
 WWPboCUvepCHFH5RoK0bv6bURXs75cpj69jHxaEQC77uoS6bfZdbl6flju74iwEWFJ7eeoaTHDE
 sioWy2ZLH7V1/Agx8IKM4FMg4h+c3FK2TXF0dPWiZ6Mt4O7fFqT1e2NjmxU11TLBW+Y25R3ZEVG
 UVq6m73PQLg3K1PWv7OF/VhxqsarB1x+f/841c6cT4gEtZJqGIxYbFmM4eXwkUzabb3qlX5HpO9
 iDqzw7TsquXOcdYSVP4BLCABZNX0Q1il2PO3/mChdpfMeFobbTGFrMRHXIJgctHzGd4hZaYbmgs
 bMm0akvpECMHkLY1vXk6DQMlvYVdJx0vhBGiQLKFEA6Ja7JEuRZ/Mj6JBAV99
X-Received: by 2002:a05:6000:1861:b0:47d:edb2:a4ab with SMTP id
 ffacd0b85a97d-47df07670c6mr12539004f8f.43.1783688488233; 
 Fri, 10 Jul 2026 06:01:28 -0700 (PDT)
X-Received: by 2002:a05:6000:1861:b0:47d:edb2:a4ab with SMTP id
 ffacd0b85a97d-47df07670c6mr12538420f8f.43.1783688482704; 
 Fri, 10 Jul 2026 06:01:22 -0700 (PDT)
Received: from rh (p200300f6af371400309b667846b924fb.dip0.t-ipconnect.de.
 [2003:f6:af37:1400:309b:6678:46b9:24fb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e6ccsm60023847f8f.5.2026.07.10.06.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:01:22 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:01:20 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eauger@redhat.com>
cc: Peter Maydell <peter.maydell@linaro.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/3] arm/kvm: get demuxed ID registers from kvm
In-Reply-To: <7ab742c2-2354-4316-a727-a56175a321b9@redhat.com>
Message-ID: <0a463fde-b206-cafb-8625-e03bb5d1ce58@redhat.com>
References: <20260702133606.34529-1-sebott@redhat.com>
 <20260702133606.34529-4-sebott@redhat.com>
 <7ab742c2-2354-4316-a727-a56175a321b9@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VmI3zxfzkD6x4OCv5ZZtujawKsORna3u82zFgQfXdm0_1783688496
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hej Eric,

On Tue, 7 Jul 2026, Eric Auger wrote:
> On 7/2/26 3:36 PM, Sebastian Ott wrote:
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> We now have the infrastructure in place to handle demuxed ID registers
>> from kvm. Use it to get the values that kvm emulates for CCSIDR_EL1.
>
> I wonder whether that patch is needed at this point. Were previous
> ccsidr[i] initialized from KVM before? What is the actual motivation to
> read them in this series. Doesn't it bring the risk to expose new values
> to the guest?
>
> For instance, in [RFC PATCH v6 11/17] arm/kvm: Initialize all writable
> ID registers from host, I generalized the initialization of all writable
> id regs and I noticed that the new initialization of CLIDR from KVM
> broke the execution (which is not the case for the CCSIDR because I did
> it a try) because CLIDR was previously uninitialized and null.

The issue is holes in arm64_id_regs[] and we stumble over that in
get_host_cpu_idregs(). Maybe we could skip the demuxed regs when we
iterate over that array.

Sebastian


