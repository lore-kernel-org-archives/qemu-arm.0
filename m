Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CB3CA0EE4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 15:20:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uokbq-0005nC-4b; Wed, 20 Aug 2025 11:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uokbo-0005mO-Nu
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 11:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uokbl-00061l-O6
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 11:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755703210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M2X6NjtPbVAg9FKQshCOQDOtm2t4t2ds3tBJvOKfm7s=;
 b=SieGGxSHQKvJVBuG0xbHyev2Kmcfkzt+zNyM0NKu/OJ6isTUa524AOGSN7ETqIWjDatk+5
 28Ma5+JrLya3h2dWsqh6g6ZGywn1iDlmvALQizx44LuGeUxxR97e7QR4jQI0q1mPrIO874
 v4CULnt2VM7+BcTuWggfJV3UZhmvhHI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-QSPLSpl9NmOvzlRjwloQQw-1; Wed, 20 Aug 2025 11:20:09 -0400
X-MC-Unique: QSPLSpl9NmOvzlRjwloQQw-1
X-Mimecast-MFC-AGG-ID: QSPLSpl9NmOvzlRjwloQQw_1755703208
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b10993f679so700391cf.0
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 08:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755703208; x=1756308008;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M2X6NjtPbVAg9FKQshCOQDOtm2t4t2ds3tBJvOKfm7s=;
 b=o0dfRGen9whJNGlCIQwc8+dno78Hr7VqlyUV9hWzCDT65W4pZUPhivwiSLCwSrSOWP
 Z0BZEvHjytYmfkmIgPNGCiJj1q84+nb3tCSMyY9bbOzsJXIf0uw+kbBOMCTovf4W8yp0
 B5qtOpMbolXoJaoPOe51BUwhPpXLIhpSp90SLT3J3pHU/BOAu6stYnuR7TiABg6ndC31
 ZO7oPXwM8NQ3lBfm6iYAO4K14rzwdR+kp/r1ZzL89XVyBm76F/mCqNmMrwusXzDBIhJJ
 a+1oVs32ZcId8oi4cnzVc7hFxb+HKX9DgEJ+hGXGgwgljRWu5+ixEzDAouarNFatSBdr
 EPpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz/9FUAKUqmIkNwDICj3sImuWvK6dtizUvCJPnDvkN3tXXtV2uGVVAUQrlC7O2TIODDacDfBzQzQ==@nongnu.org
X-Gm-Message-State: AOJu0YzSXZddo/HJlzRSRsjZkimFVE9IqBrkxPQwZafksoIq93sOkfiI
 yUvYDCT8T7nUAbf7AJ947VwVcQMmNb3ubWSkZS6zdf5SXdvuWQh9FIE7Rp7mtjDijnZxaBYaNCP
 sklfljsO3m56sfrN65Fvfvi79rA3xaWTbVtPNeYchd4L/J4PE6ThNIQ==
X-Gm-Gg: ASbGncvh83+GVoBDEo3dt45ICE4LdHHPVx3s9bxPvubynYDeBclJmG9mFxexvnjozSL
 +1Yv6O+yxX4yaLUhaOWQC3e1SDPpjFn9KlAYZ1eKNd/hpBOOshWmRWhjjjGACOPl1kx8GlvO97A
 69go+cJthAKpjfhFqj6guYR60fpCfewX1CljYkxdXm2RAmmpigmbC9LmWCBcShZujoqWWzW7ib+
 pNzWelGwDoLjxPKcAGsFJQ8O1vC2Wh9Vn1SftI4y6/gE+3UpwUEd0rxRN1v1X59qYRgaByNH6S7
 K1WkbiRk0Jz0Dk9lJdmOi0zbeAjHl7pbMU2FaFw7FSl7Zy7CHDuzKA2CSNGSQ0o98k1YSn5tZ2m
 c/Gg=
X-Received: by 2002:a05:622a:1e10:b0:4b0:da5c:cf70 with SMTP id
 d75a77b69052e-4b291bdd487mr36186971cf.58.1755703208172; 
 Wed, 20 Aug 2025 08:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU5vrPbrjnDQVdcKU3S4fIXM60sTV3zNcj4jmMuFtH26YgIqsjKmXLxH0GX2AP2qhCO18hGQ==
X-Received: by 2002:a05:622a:1e10:b0:4b0:da5c:cf70 with SMTP id
 d75a77b69052e-4b291bdd487mr36186571cf.58.1755703207679; 
 Wed, 20 Aug 2025 08:20:07 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-112-073.pools.arcor-ip.net.
 [47.64.112.73]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e87e04fcb1sm955992785a.23.2025.08.20.08.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 08:20:07 -0700 (PDT)
Message-ID: <4047ae2a-4dff-4565-b89e-c1e839d879b1@redhat.com>
Date: Wed, 20 Aug 2025 17:20:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] target/ppc: Fix env->quiesced migration
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabian Vogt <fvogt@suse.de>,
 Peter Xu <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>, qemu-arm <qemu-arm@nongnu.org>
References: <20250819223905.2247-1-farosas@suse.de>
 <20250819223905.2247-5-farosas@suse.de>
 <2556e0cf-ccca-4ac1-8be5-a18163f860d4@redhat.com> <87sehmvxpj.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <87sehmvxpj.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wpRPwoV4mnYKzJQS6N5NWCfSQJzch5R-oHl-kaDqZjg_1755703208
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 20/08/2025 17.07, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 20/08/2025 00.39, Fabiano Rosas wrote:
>>> The commit referenced (from QEMU 10.0) has changed the way the pseries
>>> machine marks a cpu as quiesced. Previously, the cpu->halted value
>>> from QEMU common cpu code was (incorrectly) used. With the fix, the
>>> env->quiesced variable starts being used, which improves on the
>>> original situation, but also causes a side effect after migration:
>>>
>>> The env->quiesced is set at reset and never migrated, which causes the
>>> destination QEMU to stop delivering interrupts and hang the machine.
>>>
>>> To fix the issue from this point on, start migrating the env->quiesced
>>> value.
>>>
>>> For QEMU versions < 10.0, sending the new element on the stream would
>>> cause migration to be aborted, so add the appropriate compatibility
>>> property to omit the new subsection.
>>>
>>> Independently of this patch, all migrations from QEMU versions < 10.0
>>> will result in a hang since the older QEMU never migrates
>>> env->quiesced. This is bad because it leaves machines already running
>>> on the old QEMU without a migration path into newer versions.
>>>
>>> As a workaround, clear env->quiesced in the new QEMU whenever
>>> cpu->halted is also clear. This assumes rtas_stop_self() always sets
>>> both flags at the same time. Migrations during secondaries bringup
>>> (i.e. before rtas-start-cpu) will still cause a hang, but those are
>>> early enough that requiring reboot would not be unreasonable.
>>>
>>> Note that this was tested with -cpu power9 and -machine ic-mode=xive
>>> due to another bug affecting migration of XICS guests. Tested both
>>> forward and backward migration and savevm/loadvm from 9.2 and 10.0.
>>>
>>> Reported-by: Fabian Vogt <fvogt@suse.de>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3079
>>> Fixes: fb802acdc8b ("ppc/spapr: Fix RTAS stopped state")
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>> The choice of PowerPCCPU to hold the compat property is dubious. This
>>> only affects pseries, but it seems like a layering violation to access
>>> SpaprMachine from target/ppc/, suggestions welcome.
>>> ---
>>>    hw/core/machine.c     |  1 +
>>>    target/ppc/cpu.h      |  1 +
>>>    target/ppc/cpu_init.c |  7 +++++++
>>>    target/ppc/machine.c  | 40 ++++++++++++++++++++++++++++++++++++++++
>>>    4 files changed, 49 insertions(+)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index bd47527479..ea83c0876b 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -42,6 +42,7 @@ GlobalProperty hw_compat_10_0[] = {
>>>        { "vfio-pci", "x-migration-load-config-after-iter", "off" },
>>>        { "ramfb", "use-legacy-x86-rom", "true"},
>>>        { "vfio-pci-nohotplug", "use-legacy-x86-rom", "true" },
>>> +    { "powerpc64-cpu", "rtas-stopped-state", "false" },
>>
>> This is specific to ppc, so it should not go into the generic hw_compat_* array.
>>
> 
> So arm-cpu in hw_compat_9_2 should not be there?

Right, this should get moved to the code in hw/arm/virt.c.

Same for arm-cpu in hw_compat_9_0 and for arm-gicv3-common in hw_compat_7_0.

  Thomas


