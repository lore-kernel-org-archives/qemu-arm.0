Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEE9D19504
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 16:48:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkPkx-0006b6-0L; Mon, 26 Jan 2026 11:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkPkv-0006aW-Gc
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 11:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkPkt-0005y4-05
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 11:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769446077;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4JJxw5Uj0KabqMP1o/sPXTQgNu7eDbYVTZdjb2pQp0=;
 b=X0347ax0/56/hiyHdPReeMEC0XKp/PYz3a9GS1MvbOFYKf5hhWuh5a/1h3Ave3FQPoKQ5m
 zSuammskkFZWLvXz6j7rE/cz6neAGnbkXd6TNpYPhtcu4RN+pieLVnsMkse23GUoYFlcx7
 zkW30sCNreFisIrMj4pQKS+zcMkrnTc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219--qXfqGAZPzy9UxZXGsQZ5w-1; Mon, 26 Jan 2026 11:47:55 -0500
X-MC-Unique: -qXfqGAZPzy9UxZXGsQZ5w-1
X-Mimecast-MFC-AGG-ID: -qXfqGAZPzy9UxZXGsQZ5w_1769446075
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4803a72daaeso35672855e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 08:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769446074; x=1770050874;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4JJxw5Uj0KabqMP1o/sPXTQgNu7eDbYVTZdjb2pQp0=;
 b=aOKp5GFjSE/Rjj9/N8QZtL2NQz3Mw401pWgDaMN+9wya8yqoRkad4DXctZwyI6M/y2
 dBKm1kSq0MUeCP/lNhe7mio67OtcILNTQdec4HlrdaN61Fb2bzgWf6whWnXXBqXGDX2r
 liBSdpwKxdpF8T4QFES8tdzyXbVwQ/P8Lm0+IvJ96mZUAVrc9QEmlwawuf7/7pDEEQ7Z
 39K4eJngpME/RR7+GYmv+AOfCakwZEWqPHEvKJoWRQf/fJWAPv86n1Z0blwJhPm2xJ3q
 Qbhwtf/Tsoo7/EgsymgFeHm/HDv99i9mhask4lfbpiJ5vU1PepGn/bWoLeAWdD4GklIa
 hF1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkqN/Pop9UxhX5F0evFW+7QNATKe7UPKfgpC+XZSHkyt72AIIbINVaalmj30PxBBY48Rf2qnZObw==@nongnu.org
X-Gm-Message-State: AOJu0Yzvf/pR6+HNxS+pd/PG4YEu2cs7qi564RxRhFNfIUbT1fKvCox0
 UwE2N1jUbpnZVaUcFSVHTgFe0ly1BhAMJwN72k/1XpgobfhrCe648CtmI6bJbt6Q/QGqlpsGVy5
 H5ZiFqpOmWVzOMSYo01OKN29Gg/+1WmOY/yFpjSul5nftsfF5InDxfQ==
X-Gm-Gg: AZuq6aIcqwccwsFa4y7KkhjGEJztPXHforWq/5x7/EvPtV7xckx97xm42vw/JSuehxo
 9ra90+NSgaJEylvmf7EWk3iSfXRBs0aqXh5dgmGzyf6kewVrI9Vmr2z6FUHn2V6erm8QcSXBF7X
 069SWrwREY4/3riLeHIejKZjyVHN/G9WfSur5KJ3JWKUmW4yS/no6WQsfo91Cc93AAP+lDrxUUT
 YbO4jzPVhuec+F9hMjOAv2Z3EVXOzdCSFcNjJKp1+0PGaIOZkziI3XNWmdL8OgE4Ijv+37n608C
 y6ywyr/ui/YRcHphYeZmC3cVVyLIjEQY8lRzMlXsM7Xxa8g5la3ViOJmfcXCyHRfRph6EzX103t
 kyB8OJTiM2Gel8X+1yhjzcnlQ/G962dZhjgkXzwcoekDAupZFH8ktLOP83Q==
X-Received: by 2002:a05:600c:4e50:b0:47e:e051:79ee with SMTP id
 5b1f17b1804b1-4805cd08fb5mr87018475e9.3.1769446074527; 
 Mon, 26 Jan 2026 08:47:54 -0800 (PST)
X-Received: by 2002:a05:600c:4e50:b0:47e:e051:79ee with SMTP id
 5b1f17b1804b1-4805cd08fb5mr87017995e9.3.1769446074006; 
 Mon, 26 Jan 2026 08:47:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c40e04sm525295e9.13.2026.01.26.08.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 08:47:53 -0800 (PST)
Message-ID: <bb66eabd-c4ba-4585-a408-4f3f1a0f9f69@redhat.com>
Date: Mon, 26 Jan 2026 17:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] hw/arm/virt: Introduce framework to aggregate
 hidden-regs and safe-missing-regs
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org,
 oliver.upton@linux.dev, gshan@redhat.com, ddutile@redhat.com,
 peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
References: <20260121074834.1900677-1-eric.auger@redhat.com>
 <20260121074834.1900677-11-eric.auger@redhat.com>
 <1d622049-4b20-a12e-61d2-847c3a83869f@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1d622049-4b20-a12e-61d2-847c3a83869f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yRRBLfAvNUZViRy_4nPii61auMGilawDeY0LXcS3KyM_1769446075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Hi Sebastian,

On 1/23/26 6:28 PM, Sebastian Ott wrote:
> On Wed, 21 Jan 2026, Eric Auger wrote:
>> Currently if a virt_machine_<n>_options() sets a TYPE_ARM_CPU
>> x-mig-hidden-regs or x-mig-safe-missing-regs array property, another
>> one cannot overwrite it or extend it. We end up with a core dump:
>>
>> qemu-system-aarch64: can't apply global
>> arm-cpu.x-mig-safe-missing-regs=0x603000000013c103,
>> 0x603000000013c512, 0x603000000013c513: array size property
>> x-mig-safe-missing-regs may not be set more than once
>> Aborted (core dumped)
>>
>> In practice we would like an easy way to register regs that belong
>> to either of those categories and allow aggregation of those.
>>
>> We introduce arm_virt_compat_register_safe_missing_reg() and
>> arm_virt_compat_register_hidden_reg() which populate GLists of
>> int64_t. After all virt_machine_<n>_options have been called and
>> have registered their regs, the GList are converted into the
>> associated array property value and the GlobalProperties are set.
>>
> [...]
>> +static char *get_prop_value_from_reg_qlist(QList *l)
>> +{
>> +    size_t size = qlist_size(l);
>> +    GString *s = g_string_new("");
>> +    QListEntry *item;
>> +    int i = 0;
>> +    QNum *qi;
>> +
>> +    if (!size) {
>> +        return NULL;
>
> Do we need to free s here (or allocate later) or is there some RAII magic
> involed? 

yes I can move the init below the above check
>
>> +    }
>> +    QLIST_FOREACH_ENTRY(l, item) {
>> +        qi = qobject_to(QNum, qlist_entry_obj(item));
>> +        int64_t regidx;
>> +
>> +        qnum_get_try_int(qi, &regidx);
>> +        if (i++ > 0) {
>> +            g_string_append(s, ", ");
>> +        }
>> +        g_string_append_printf(s, "%" G_GINT64_FORMAT, regidx);
>> +    }
>> +    return g_string_free(s, false);
>> +}
>
> Reviewed-by: Sebastian Ott <sebott@redhat.com> 
Thanks!

Eric


