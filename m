Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814D1D358F5
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 10:26:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlPC5-00087W-Dr; Thu, 29 Jan 2026 05:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vlPC1-000879-FA
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 05:24:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vlPBz-0008KW-9L
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 05:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769682242;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6BCgQ9RaennusT58hZUOY/v+T+ILD2ha1SdxShoZ4g=;
 b=IgHPImAGiKCpWDxsXPJ1HkUf8qYPwRi+UQjXCxilobbDUoxCLWWg0qTIcArhEBP/SZmMtk
 MD0cpGdJzvcRadPfdDvA4ny2al1pLCBEfCjIqujk+4dIxoABId37eyOHG4QXPGITU2jbsB
 9CLYQW+smmICstTVoaoA3v9vD8Mi+iw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-z4dr40vLMsmp73s1ym-8Mg-1; Thu, 29 Jan 2026 05:24:01 -0500
X-MC-Unique: z4dr40vLMsmp73s1ym-8Mg-1
X-Mimecast-MFC-AGG-ID: z4dr40vLMsmp73s1ym-8Mg_1769682240
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42fb1c2c403so609610f8f.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 02:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769682240; x=1770287040;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6BCgQ9RaennusT58hZUOY/v+T+ILD2ha1SdxShoZ4g=;
 b=fSl5WkjsURDIxUZlM0Thy/PJLYZjYu1iRyqasxqIVee/IRkg1B1OzsyHZeGSa0Ysc2
 /2wdjDF7//fF7PHxjvK+5SsZ6o1pMBC6q2CE55KcyE//HX7LKRnx180UiZNCvkzMKbtC
 Cl1Sz8V+f0kiMaVyckDbIjXOGYWs5e/OOzXcvnaHkg+++F/8ZISN21FCONbuCI26zMlO
 H6cmvvT69yH+saf4Kh1m6XTSb4qXpigkIZ64NUjguC4s0pCaYAh0uZgTP/C30+bXtK5S
 OJZcRp1ru5Ih5aI4V9GslPV8toNlf1iTNskNkaSdq13b/sVq0jId1a07R0oSmttIfeWS
 tb0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl/XVim32Ani9DBqcWiJe0CnDX1A7uIAU3Oc74Pp3Z+Bv8tY6WA22+u9TwFWreyOglajFaxwdeuw==@nongnu.org
X-Gm-Message-State: AOJu0Yx1qGSYy9BOfzsFVaKnBDMJfLcAEFbT/1d5Iok3G9DRE7IjWlST
 7Dv4j48U2ltO4ARy5TmSUqAituBsAd2GxcrShYp4aJnjRJIrUmcwo16/E46cKtHK566Bz0XjlLg
 3Odox4NQ1WG4BgFVzo6Gk+BFtGwEyAYWj5g6Yd+kjoNMGDdwonZFEXA==
X-Gm-Gg: AZuq6aJxMWBJTlyk+rUKOeuJoog7DY2XscjQp7UafDeT5QYgAHKN0gq5dOMr3g/SHnT
 frNxymXEt9dg6XmCIiBmOsZ7UzJrQD9P7WXFSWXDi+34jdKfDJDyDakKGNt3+ZzL04pm/QDSEID
 Wbs5djeOJ0/0SdC61f62sVsUGoaV9NYTsT1aa6xoipissxF4XQs33g6Vea4f3A/tTkb3q8eUWuh
 0/TT9/kAX27P5hxSxN/239f5aNt9N6rzkYrWfS7eH82O7EL3tNbcrdSW+K3PFzMIAGi5JT/h71u
 fDoHk4Nj/rGNTw4O2RQb7gbCJm5GGmH+qPcaYSXuJXtzWbgyvw2bqdkQ/lvzIzlTe7xTMJtCg75
 9QIF37l/G3iyDPGqX31ipXHbHHoTnJXKdPIy80ZfmCxmP3cdExhghFN4HEw==
X-Received: by 2002:a05:6000:401e:b0:42f:b3b9:874d with SMTP id
 ffacd0b85a97d-435dd0b0443mr10955754f8f.37.1769682239926; 
 Thu, 29 Jan 2026 02:23:59 -0800 (PST)
X-Received: by 2002:a05:6000:401e:b0:42f:b3b9:874d with SMTP id
 ffacd0b85a97d-435dd0b0443mr10955721f8f.37.1769682239439; 
 Thu, 29 Jan 2026 02:23:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e490esm13152766f8f.9.2026.01.29.02.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 02:23:58 -0800 (PST)
Message-ID: <e81c78de-f175-42b2-a19a-e1a9df6f3752@redhat.com>
Date: Thu, 29 Jan 2026 11:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/11] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>, maz@kernel.org,
 oliver.upton@linux.dev, gshan@redhat.com, ddutile@redhat.com,
 peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
References: <20260126165445.3033335-1-eric.auger@redhat.com>
 <02feaa00-2188-8265-4a65-63fe40270093@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <02feaa00-2188-8265-4a65-63fe40270093@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DKL5rIlo0QAIFduqDAGsxfdpME8GzFF3r0CAGr16JJk_1769682240
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



On 1/27/26 5:52 PM, Sebastian Ott wrote:
> On Mon, 26 Jan 2026, Eric Auger wrote:
>
>> When migrating ARM guests accross same machines with different host
>> kernels we are likely to encounter failures such as:
>>
>> "failed to load cpu:cpreg_vmstate_array_len"
>>
>> This is due to the fact KVM exposes a different number of registers
>> to qemu on source and destination. When trying to migrate a bigger
>> register set to a smaller one, qemu cannot save the CPU state.
>>
>> For example, recently we faced such kind of situations with:
>> - unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
>>  register from v6.16 onwards. Causes backward migration failure.
>> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>>  from v6.13 onwards. Causes forward migration failure.
>>
>> This situation is really problematic for distributions which want to
>> guarantee forward and backward migration of a given machine type
>> between different releases.
>>
>> While the series mainly targets KVM acceleration, this problem
>> also exists with TCG. For instance some registers may be exposed
>> while they shouldn't. Then it is tricky to fix that situation
>> without breaking forward migration. An example was provided by
>> Peter: 4f2b82f60 ("target/arm: Reinstate bogus AArch32 DBGDTRTX
>> register for migration compat).
>>
>> This series introduces 2 CPU array properties that list
>> - the CPU registers to hide from the exposes sysregs (aims
>>  at removing registers from the destination)
>> - The CPU registers that may not exist but which can be found
>>  in the incoming migration stream (aims at ignoring extra
>>  registers in the incoming state)
>>
>> An example is given to illustrate how those props
>> could be used to apply compats for machine types supposed to "see" the
>> same register set accross various host kernels.
>>
>> Mitigation of DBGDTRTX issue would be achieved by setting
>> x-mig-safe-missing-regs=0x40200000200e0298 which matches
>> AArch32 DBGDTRTX register index.
>>
>> The first patch improves the tracing so that we can quickly detect
>> which registers do not match between the incoming stream and the
>> exposed sysregs
>>
>
> I gave these a spin - works as advertised, no issues found.
> Tested-by: Sebastian Ott <sebott@redhat.com> 

Thanks!

Eric


