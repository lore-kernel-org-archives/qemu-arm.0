Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84CBD358F5
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 10:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlPBo-00085d-AA; Thu, 29 Jan 2026 05:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vlPBj-00085D-Gk
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 05:23:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vlPBh-00089j-01
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 05:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769682223;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+dF31BLc+5Iefh/sHZTLdaspkqxg82XqhZZVy4Vnvic=;
 b=el3t1hEExcRAB8XxlK8vyKZdHxWsVhRccdOkn3cN/3TT+MsxNB8fdifKAD7YZMMyOYzLdj
 Djnf6oEAkKckHVSD29nh8DvPI5dqFXDNCYX747IgQbpOxksh89kvgM3OkP2v1MHCGT/9Uu
 +QM5YcLNkztYWl/xQuF4ojaTrvKWbsk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-NRypGABvMSOtw-ECPRJRpw-1; Thu, 29 Jan 2026 05:23:42 -0500
X-MC-Unique: NRypGABvMSOtw-ECPRJRpw-1
X-Mimecast-MFC-AGG-ID: NRypGABvMSOtw-ECPRJRpw_1769682221
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4803b4e3b9eso6091175e9.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 02:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769682221; x=1770287021;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+dF31BLc+5Iefh/sHZTLdaspkqxg82XqhZZVy4Vnvic=;
 b=oQ4YYqCL9ys0lP5E6aS+likvgr6CmPwgwsjC8NAKCyZG9332VtEXi9YRs3FReu4tX0
 LOkxjNLXpFIRj4iATDwU09Ze7yVIIYfWjMP1DZ/UqrdFNJMVEAGhRJcKqxQJm9YGdJs4
 emmEbDlN7FXeb+P1yvV122lMAKIs4/qqHmEKe7BNwKcI7uAWtZdDMi0F30qmhzgrNLrT
 mNqym8tXkbQBr5cd3xvipos5uInH6QzKSCMcFydQpgVZqluC0JPTcClBeLkc8GSjvTnf
 9/V5EpR16oJ8NnP2sFKoJqEZav7J+4V8qURgWCVfjLEmWjfldeuztuubSkDIVb45UsKf
 4iWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYodS1Kid37fdIwVy9UCifb3FiZ0dCTcuilmCXX/WSw8UjUXiaXLB/pUElRXq2l1EYAutE4s9+Sg==@nongnu.org
X-Gm-Message-State: AOJu0YyrZwfb8ySVvVlqPs87kCxGOptMhSL+ZO8iaRNW2MF4bZQV2WJC
 DewN/PUOvcDDB1GRZfeSk4D9+m+dJ4gjrckvS/8dcThWypkBtmb7Ps184mhO8dFmWlndCOosPLl
 vxaf0IpShCURSET5eBqfxcLe53uGKb1CHVB3/EJZ2i4cKHC86xox1dQ==
X-Gm-Gg: AZuq6aJUuNWactUZ4kIvxNDYh2/NTO/Zcqmo6qxN8i0wNECRtBJaVvsl7m81gksRm6g
 3ejwbwQnyr+TrJ3jD/grmNLNraAreoRZZobZlIjRNHjQoLpvq8Xc5QhgP187Y3T7qk1eSm45pPu
 P+Xa11GpA2YQWllaZ1IA6bNQ19xmX1Vg+4kKb1H3TX+J4wnknblWT9Gy1PXP8DNyo853uFaNdUM
 NgI+WO+0zA1hCgtQl7mJOQKq6cNu3TMm69LgJOhUwZvxdhO3hMCt0qbfMad7ZNI9cXfnrBA+uEc
 C08q/ROM9j6OzbUFaDp6XUgMIBOk+1JQf72ntFYh1hBeRjuC6+kKfjarUe6RhNz02SLktAYufpm
 pAHcSsFHaGCeHtxl9mRENoBpf9Pk0M18ETgmmhz0KEN3cA9hLjRzPk5irng==
X-Received: by 2002:a05:600c:350b:b0:47e:e78a:c834 with SMTP id
 5b1f17b1804b1-48069cb9257mr91774575e9.34.1769682220895; 
 Thu, 29 Jan 2026 02:23:40 -0800 (PST)
X-Received: by 2002:a05:600c:350b:b0:47e:e78a:c834 with SMTP id
 5b1f17b1804b1-48069cb9257mr91774325e9.34.1769682220463; 
 Thu, 29 Jan 2026 02:23:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5e1d0f7sm174215e9.18.2026.01.29.02.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 02:23:39 -0800 (PST)
Message-ID: <08a06bac-f497-418a-a681-cb39f731f89b@redhat.com>
Date: Thu, 29 Jan 2026 11:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] hw/arm/virt: Declare AArch32 DBGDTRTX as safe to
 ignore in incoming stream
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com,
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
References: <20260126165445.3033335-1-eric.auger@redhat.com>
 <20260126165445.3033335-9-eric.auger@redhat.com> <87wm13rn1j.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87wm13rn1j.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bge8QOvm4j3KwDSmbBS1a_hYqVRm736opB3ezv54uGw_1769682221
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Connie,

On 1/27/26 6:19 PM, Cornelia Huck wrote:
> On Mon, Jan 26 2026, Eric Auger <eric.auger@redhat.com> wrote:
>
>> With the new infrastructure in place it is now feasible to teach
>> qemu that it is safe to ignore a sysreg in the incoming migration
>> stream. So with the plan to revert commit 4f2b82f60431 ("target/arm:
>> Reinstate bogus AArch32 DBGDTRTX register for migration compat") from
>> qemu 11.0 onwards, let's add a compat in 10.2 machine options stating
>> that this reg is safe to ignore. from 11.0 onwards we will not need
>> that register anymore.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v4 -> v5:
>> - rebased on top of latest machine types (Connie)
>>
>> v3 -> v4:
>> - add a comment related to DBGDTRTX (Connie)
>> ---
>>  hw/arm/virt.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index baa4e31aac1..03d5af18f26 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -100,6 +100,15 @@ static GlobalProperty arm_virt_compat_defaults[] = {
>>  static const size_t arm_virt_compat_defaults_len =
>>      G_N_ELEMENTS(arm_virt_compat_defaults);
>>  
>> +/* Register erronously exposed on 10.2 and earlier */
>> +#define DBGDTRTX 0x40200000200e0298
>> +
>> +static GlobalProperty arm_virt_compat_10_2[] = {
>> +    { TYPE_ARM_CPU, "x-mig-safe-missing-regs", stringify(DBGDTRTX)},
>> +};
>> +static const size_t arm_virt_compat_10_2_len =
>> +    G_N_ELEMENTS(arm_virt_compat_10_2);
>> +
> Not objecting, but we had a discussion recently regarding where compat
> values for arm cpus should live:
> https://lore.kernel.org/qemu-devel/20260120122108.131708-1-thuth@redhat.com/ ff.
>
> Could this become relevant for future other versioned machine types? I'd
> assume that they just would skip the bogus reg from the start, though.
Thanks for the pointer. Effectively this could have initially lived
in hw/core/machine.c but the problem specific to this array prop is that
in any case this is not something you can aggregate and this requires
infra defined in 10/11 where you register safe missing regs and hidden
regs throgh a specific helper. Currently only one machine requires this
so I would be inclined to leave it in virt arm machine code. So this
patch is something trasncient and replaced in 10/11. Thanks Eric
>
>>  /*
>>   * This cannot be called from the virt_machine_class_init() because
>>   * TYPE_VIRT_MACHINE is abstract and mc->compat_props g_ptr_array_new()
>> @@ -3552,6 +3561,7 @@ static void virt_machine_10_2_options(MachineClass *mc)
>>  {
>>      virt_machine_11_0_options(mc);
>>      compat_props_add(mc->compat_props, hw_compat_10_2, hw_compat_10_2_len);
>> +    compat_props_add(mc->compat_props, arm_virt_compat_10_2, arm_virt_compat_10_2_len);
>>  }
>>  DEFINE_VIRT_MACHINE(10, 2)
>>  


