Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90F2C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 13:12:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfHCk-0007Ye-Fo; Thu, 02 Jul 2026 09:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHCj-0007YK-Ag
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHCh-0006MO-Te
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782997903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0dC1/xjKaSYyWxJrIi95BC+AjqyHw72eAfR+jRKz2Ik=;
 b=OE/MNgvcUwyDvKDhzsm4cN1zVLX2FeJXk6ZkcNRHAuuDIGpj04GEQjjlETm6EHZAX/OPoI
 wQkD+IUOqH8CALePTKcNvGLHa/V56HcmMvG+PrNlAYLGtkj1o9xRrZ3iQBY0TIRG9RIZl8
 1F3SqIvDgco+1ppLTwPhs9DkooW/ujc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-Wg1gEXFWMmizZAdBbSQkDA-1; Thu, 02 Jul 2026 09:11:40 -0400
X-MC-Unique: Wg1gEXFWMmizZAdBbSQkDA-1
X-Mimecast-MFC-AGG-ID: Wg1gEXFWMmizZAdBbSQkDA_1782997899
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-471c76f357aso1631066f8f.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 06:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782997899; x=1783602699;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0dC1/xjKaSYyWxJrIi95BC+AjqyHw72eAfR+jRKz2Ik=;
 b=RJhB2nDyDhuIFHG9dceUXW6k6VnJxjZ/n9Lzr+EH27c43GRMdogv1sarokzlTLx7er
 9cekU3eF2LM+Xd5EiDz7sLlnZs+SduTSTgymd9dcKzN6wgnEGXotf8nwAnP1Q7CLSQxs
 Ch4Z3Uk5wZ2I/v5EvOLg7Qr9HTFYqTFMTMJFSOWJjzEQfmVVggamgTuRdv9htAFaF+qf
 FUPtTa9wRq00O+GEZzDun9i2vKJUtjzM4anPujRhZ3ORDSfmaguEZLzLcIZsKmodmRBG
 +OB1ZfI6fcG/sAQLtX+h1m+vr1HjnJsJgkX20y44hdLM1tXK88D1OiXnfGeeP90Vwsmk
 vHcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpUW2eNntlLmY48KB3kno4QS+xwcHLT8tUMv4C485Q/uHJ1dl8G29SsP9ZZdZUIbFZSGBFfSTt+1A==@nongnu.org
X-Gm-Message-State: AOJu0YzkhO3TS3FLgfzk6hYokY4coY6KdTmjx70DHYUitEf9Beprx220
 obw3tvx78kGxInaudc7RwSSlvVNT+5G3sWsRqPZkJ+5bMSaUcM4x28wreQ1tB6TQzrEgAhjAk4Q
 FAnhfG1eU6duIYfuE1a5WeP0Yuwk3gB3EPKBTxIwVOhYy0dVwjMNrEA==
X-Gm-Gg: AfdE7clNTjd/kVMbiD8Vgx6qud4lw/YpE/LPO/0T+gtoZ8omrnEsD+ACT+6Wg0Bz5Bk
 /Ie96fG6miKNiqF5fwLqx8vAClmWUuywB/Ev2mHc6nJSoFg1RXT6E7qXfEeTRhyB6XcJA/gg874
 lJtbJCBlalGTLIS2P9rBxKPksRolcNORdM/+WPxr34jKYskqeZ5hneKH8E2YVpAITX+KCWWHJvS
 BoxVosngqK3OXKwZPTJ+WR2+XwrSoaAQQNRgRknBAH94HOJdpMjRXsyZ+UEZp7TWteaNaEAtXdS
 uy2BDxfnjNW601UMUZZmVj9VXkg3xNLlevL1ZmI0rrrk1sRODqD+LFULPYT6nyd4EV3aCTkrZp0
 WZGBXACYmOkzqrPRVjo+G7cYJfQfBgIRWKYeqdfp20HGnrEVtUlTQoSR9W6R4
X-Received: by 2002:a05:6000:27ce:b0:472:90af:e406 with SMTP id
 ffacd0b85a97d-4775a1f55c9mr7561541f8f.37.1782997898924; 
 Thu, 02 Jul 2026 06:11:38 -0700 (PDT)
X-Received: by 2002:a05:6000:27ce:b0:472:90af:e406 with SMTP id
 ffacd0b85a97d-4775a1f55c9mr7561503f8f.37.1782997898524; 
 Thu, 02 Jul 2026 06:11:38 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dba0esm8538417f8f.7.2026.07.02.06.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:11:37 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:11:36 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eauger@redhat.com>
cc: Peter Maydell <peter.maydell@linaro.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/3] arm: handle CCSIDR_EL1 as a demuxed register
In-Reply-To: <aa1f8006-4665-4fcd-b8ee-5b90cd53e953@redhat.com>
Message-ID: <d4e67daa-64b0-946f-21cd-b7e0c6a942ca@redhat.com>
References: <20260622135627.40573-1-sebott@redhat.com>
 <20260622135627.40573-3-sebott@redhat.com>
 <aa1f8006-4665-4fcd-b8ee-5b90cd53e953@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ogBnB8eKueCv4Krb158qmIgJsBgjUoRq14Cmjip6020_1782997899
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

Hey Eric,

On Mon, 29 Jun 2026, Eric Auger wrote:
> On 6/22/26 3:56 PM, Sebastian Ott wrote:
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Move handling of CCSIDR_EL1 over to the new *_IDREG_DEMUX
>> infrastructure.
>>
>> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>> ---
>>  hw/arm/virt.c                 | 23 ++++++------
>>  hw/intc/armv7m_nvic.c         |  2 +-
>>  target/arm/cpu-max.c          |  6 ++--
>>  target/arm/cpu-sysregs.h.inc  |  1 +
>>  target/arm/cpu.h              |  6 ----
>>  target/arm/cpu64.c            |  6 ++--
>>  target/arm/helper.c           |  2 +-
>>  target/arm/tcg/cpu32-system.c | 26 +++++++-------
>>  target/arm/tcg/cpu64.c        | 68 +++++++++++++++++------------------
>>  9 files changed, 68 insertions(+), 72 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d8d27f2ef6..ab2b566e69 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -307,21 +307,22 @@ void set_cpu_cache(CPUCoreCaches *cpu_cache, enum CacheType cache_type,
>>
> I think you would gain in readibility to use a local variable
> ccsdir = GET_IDREG_DEMUX(&armcpu->isar, CCSIDR_EL1, bank_index);

Indeed, thanks!
Sebastian


