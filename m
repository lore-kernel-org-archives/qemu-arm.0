Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6877ECD98CE
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:08:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZM1h-000224-5n; Tue, 16 Jun 2026 01:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZM1X-000215-NK
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZM1W-0005iD-59
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781586459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMf+7nOvXxJ1YOS6cY2m1xAw88ArXEKf8kJ0h9MZvYY=;
 b=LMY0ENNwgiriFhYxaCfgOn8BYLscWRX71iuQQixjabVksn4PE20r8ggS2SJyPTegq245d8
 oioey+k3phIQ/RS3XWY2X9JDOlSJwn5GWsV811v2pNtL/rv2qhudcQTdryckO9w/za2sS7
 GE+r6KVLRRt+2MgxyFj/efV/wSeJqbw=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-LqiPSS_UMcmSqGMfvbB3fg-1; Tue, 16 Jun 2026 01:07:37 -0400
X-MC-Unique: LqiPSS_UMcmSqGMfvbB3fg-1
X-Mimecast-MFC-AGG-ID: LqiPSS_UMcmSqGMfvbB3fg_1781586457
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-307625ee07fso14530536eec.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781586456; x=1782191256;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zMf+7nOvXxJ1YOS6cY2m1xAw88ArXEKf8kJ0h9MZvYY=;
 b=by7N/sl9hdPhueMwExvuAgGyJ8R2I2R/Y1fAfw22Cg2lO/+0uw0jNxloLtBePdCsWL
 Ymh8/zaRpSmM+WC2q8zLxn3gnlB5iIoeARMBCFeQlR/LhKGdq51HFTVa7Jj4RYoSIzub
 zCQ+2Yl+maOYNLykxPLN9IdG8lwTW28ZMuGYZnVI4HHPZ2xfrUZLOe2C2rnkcPNdZ2Rh
 8RsEBC7UgdEzYNsVSjFqzzQrlRKQnyFvFVy37hE65WtnGhCrm8nCroVq3zFbONi1cSk8
 RdEq3082sktv3LFztLJtP3a3wdwiwNSiDYFXVFSO+aQYF7Fzy/T0q7/pWgdeV6ehJSRJ
 PzEw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Tp9eaClKgg6Nb5/l8FGM3kX3FTpFOf4ZSCujM0ALnNJgsmIw/U2Wflwy3MB9bB+TvZFwqkqmWZA==@nongnu.org
X-Gm-Message-State: AOJu0YxT2ojAoOvEnDLU3fqyJbgXtfSBhinQNZa2qbWZw2lKIkduwZW4
 9KJcCoCzpAj0ISpIOIpM5uij+A3CLfKxgksKqLy27JRzRE48uWgudHJ4EhnGnR9F/rWlajCuM+x
 rsd4Gy8S5JSDQBsOZMeqZrATiVzJWhWRQsTy2pesb8VAP3z63m2eKrQ==
X-Gm-Gg: Acq92OG4tDDWVNuvAz+MEHLe1dY5YT1JF85lpawzRCpOZzT91DUZP3bWX/GPikTEUj2
 0v0uVmfjx2Acf9NBFQx40G38CiRe8XL5GDEy5YUIw+cq5OaLR/T0wVXLzAbAlQrcgst7DvU4JFi
 NL6A3wO89czAUnzZn00dOmmUN5p1GZqON0XD/fmXhQb0ijXia7XdHIO0Gd8eItmcww9aMatHHTF
 DcaGSU6K8aDNRWalKhX9sMfC0FwDHb2yGwZczT0tYxuiuMx0+OaNyjkRj8uG4vFemUbKLQ/NDRM
 tp3r5G6veJ/BV3AMoOiWiIwVHIflyzeiEkHJu28bUjNLg+p6+LFI9+mFQzqzz6UENzvkyfwzcre
 0G5SHpWxU7mG0c1OaFVZ+rnZWN2DQU13yJGLfeyfEJlb2UAEFaE6G4NQz/hFLDhZ4
X-Received: by 2002:a05:7300:e78a:b0:307:3a6c:ecf4 with SMTP id
 5a478bee46e88-3081ff9598amr10151686eec.9.1781586456493; 
 Mon, 15 Jun 2026 22:07:36 -0700 (PDT)
X-Received: by 2002:a05:7300:e78a:b0:307:3a6c:ecf4 with SMTP id
 5a478bee46e88-3081ff9598amr10151652eec.9.1781586455802; 
 Mon, 15 Jun 2026 22:07:35 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3081e91fb97sm18446590eec.14.2026.06.15.22.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 22:07:35 -0700 (PDT)
Message-ID: <081a9e18-6504-4a13-a3c6-47e94be63f7c@redhat.com>
Date: Tue, 16 Jun 2026 15:07:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <20260615224658-mutt-send-email-mst@kernel.org>
 <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
 <20260616005429-mutt-send-email-mst@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260616005429-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jd0K4pjYLWJSiX1l6PCN3SQL3JAiU3eV_s-VxKMNmss_1781586457
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/16/26 2:59 PM, Michael S. Tsirkin wrote:
> On Mon, Jun 15, 2026 at 09:48:00PM -0700, Richard Henderson wrote:
>> On 6/15/26 21:23, Michael S. Tsirkin wrote:
>>> B. Also on x86, I do not see why we should not use memcpy for large
>>> accesses if we can. Better perf.
>>
>> We have an example where memcpy writes to the same location 3 times.
>> This is not appropriate for any host.
>>
>>
>> r~
> 
> Ah, checked libc and sure enough, it does it. E.g. it uses 2 overlapping SSE
> stores to do a 17 byte write. Not sure how we get 3 but whatevs.
> 
> 
> But just to clarify, I am talking about DMA accesses, that are not
> initiated by the VCPU.  I am not so sure we care about multiple stores
> in this instance? Do we? We do care about speed, for sure.
> 

In current implementation, qemu_ram_copy/move are differentiated on x86
and other architectures. Do we need to unify the implementations (qemu_ram_copy/move)
on all architectures to avoid using memcpy() and memmove()?

Maybe it's time for me to post (v3) for a new round of discussions.

Thanks,
Gavin



