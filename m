Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420B9CCA462
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 13:24:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHhuh-0002g2-0B; Fri, 16 Oct 2026 09:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHhuf-0002fk-Bh
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 09:23:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHhud-0007qI-Dd
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 09:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792157034;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SE9V4G/G/hYgWtus+HDIk8cYxijfE4z5gZCyCIy9Vw4=;
 b=PkVDstdOS301iYWVEYiaK60QDnr3IYgxRLrTxZgAnpX4DCJIaxLUn37A9Ay9HJ9lpoqCbW
 27opKFhFs0rxd1mkCmnDSE/7PfFEClzsMXr+74NIinBsW4LHOTd30jtvdBxcRCieagl34Z
 rBDoR7wPi1qDP79CcwTNEhuKUi1Cd48=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-Eea6Z524OXOmnkJTrG40iw-1; Fri, 16 Oct 2026 13:23:53 +0000
X-MC-Unique: Eea6Z524OXOmnkJTrG40iw-1
X-Mimecast-MFC-AGG-ID: Eea6Z524OXOmnkJTrG40iw_1792157032
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a1d15e7bfaso4272725e9.1
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 06:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792157032; x=1792761832;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SE9V4G/G/hYgWtus+HDIk8cYxijfE4z5gZCyCIy9Vw4=;
 b=JIhWf281mzFhsMPxSPAUAVxUU/y7uOkKrJPvIXIcdUZwUNus0EPnVYV/Qp60hF5eRz
 5BWISmSqAWLtHAUuZE25EaP1/USciJi5CqJnD85ikHV5YDjMKVv8NkRGrY3yMjrRSZRL
 Fd7dpLcKppzgFWaGIRo3VbjRKGMm6B68YoyZHI27lIa4Z7ljeK6RzhWSNXiI42pvuHEY
 huyu9OQcII7MNw7NyInXsVQizBL9Qs65fvH52Qir34eyRHfeKVKTSU32u9DKkJReIy0l
 788h6tORcpwFRXRxLQ3UcbMdIkUPN7boj/6zVrE9RDDoA+bkOWLTrR+2mAyla0Zc/Biq
 7JrQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6FUeQrTmYiKzTsF61Y9eVNJuOYqmr0WuxKbWm4tTS92pIcMA1EjtBcnBlNtdVL82iwAJsAUq8PQ==@nongnu.org
X-Gm-Message-State: AFq9FYLF2g7+M/sl12WtxZFXxesDI8glH9BJBlIMeABQBkab5kwy+Gtz
 SIINOERSAOWIfM4iwmnRYEI62wt+dLvbchUS7pKWHN1Nc2O1zG9x1J7ccV89mQLGntLBh17ul1T
 fPdciFNozRJvyvEfrRVgZxHGdwIa0taeZeFidtxS2tILx9XnEQ1fJBQ==
X-Gm-Gg: AYBFou1hYxYfQi74A4QYCbQsw4Gc6tx9g/rTAu1ciAd231LJE/eTKmQmso0q75DKmDk
 6bmVRF+EaBaIj3RwgS35dTStA/nlAqOsyykPIlRiYTSt6/zE7913vNP7zjxFQhuD3+3HP5p3bV2
 p+OvlU2SdydABK0W82WE/3eHi7cNlMyXd8C7BSeEEiZisNl8/xpwPuYQJfew2Gz05LGimbo5x+B
 8oAY2f6Jzsn6s9VIdMCNpyrIXTxaValp0AHrSBNyX8KkvwkQTZ4pQJqxZ7mOmU50BQj1Oj5/X9n
 KvveKoeFYMLvcz8aVA66JNNQYYdtmC5hWmisNpwoq6RF8IGIcevoTotagdErcRo0KEm0/G1wKB+
 fpUG1bA8nok7+D2nMkEh4f33ugW5w24od9mMl8bHPHTSJ0jM1
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id
 5b1f17b1804b1-4a1985b87f5mr280530355e9.4.1792157031830; 
 Fri, 16 Oct 2026 06:23:51 -0700 (PDT)
X-Received: by 2002:a05:600c:c113:b0:4a1:985b:83a9 with SMTP id
 5b1f17b1804b1-4a1985b87f5mr280529705e9.4.1792157031375; 
 Fri, 16 Oct 2026 06:23:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9b8b5fsm164077725e9.9.2026.10.16.06.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 06:23:50 -0700 (PDT)
Message-ID: <1dcb8628-2b99-4af1-92f4-08dcae197e82@redhat.com>
Date: Fri, 16 Oct 2026 15:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 24/25] target/arm/qmp: implement
 query-cpu-props-info for KVM
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-25-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-25-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IZCQ8hwulbS275jyamByvUzc-zgk3FvwaH4QKj36OgE_1792157032
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 9/21/26 2:32 PM, Khushit Shah wrote:
> Implement query-cpu-props-info for ARM64/KVM by creating and finalizing
> a temporary "host" CPU object and then walking its QOM properties.
side note: the new qmp command shall be documented in
docs/system/arm/cpu-features.rst

Eric
>
> For numeric SYSREG_ properties, report the host-supported value ranges
> computed by kvm_arm_field_get_supported_values(). For boolean
> properties, report false as always supported and true as supported when
> the QOM property value is true.
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  target/arm/arm-qmp-cmds.c | 84 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
> index 0940285af1..ba488d5c01 100644
> --- a/target/arm/arm-qmp-cmds.c
> +++ b/target/arm/arm-qmp-cmds.c
> @@ -84,6 +84,90 @@ static const char *cpu_model_advertised_features[] = {
>      NULL
>  };
>  
> +CpuPropertyInfoList *qmp_query_cpu_props_info(Error **errp)
> +{
> +    CpuPropertyInfoList *head = NULL;
> +    const ARMISARegisters *host_isar;
> +    ObjectPropertyIterator iter;
> +    ObjectProperty *prop;
> +    Error *err = NULL;
> +    ObjectClass *oc;
> +    Object *obj;
> +
> +    if (!kvm_enabled()) {
> +        error_setg(errp, "query-cpu-props-info requires KVM");
> +        return NULL;
> +    }
> +
> +    oc = cpu_class_by_name(TYPE_ARM_CPU, "host");
> +    if (!oc) {
> +        error_setg(errp, "The 'host' CPU type is not available");
> +        return NULL;
> +    }
> +
> +    host_isar = kvm_arm_get_host_isar();
> +
> +    /* Spin up a scratch "host" vCPU object and walk its QOM properties. */
> +    obj = object_new_with_class(oc);
> +    arm_cpu_finalize_features(ARM_CPU(obj), &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        object_unref(obj);
> +        return NULL;
> +    }
> +
> +    object_property_iter_init(&iter, obj);
> +    while ((prop = object_property_iter_next(&iter))) {
> +        CpuPropertyInfo *info;
> +
> +        if (g_str_has_prefix(prop->name, "SYSREG_")) {
> +            const ARM64SysRegField *field = prop->opaque;
> +            CpuPropertyValueRangeList *ranges = NULL;
> +            ArmFieldValueSet *vs = NULL;
> +
> +            info = g_new0(CpuPropertyInfo, 1);
> +            info->name = g_strdup(prop->name);
> +            info->type = CPU_PROPERTY_TYPE_NUMBER;
> +
> +            kvm_arm_field_get_supported_values(field, host_isar, &vs);
> +            for (size_t k = 0; k < vs->n_ranges; k++) {
> +                CpuPropertyValueRange *r = g_new0(CpuPropertyValueRange, 1);
> +                r->min = vs->ranges[k].min;
> +                r->max = vs->ranges[k].max;
> +                QAPI_LIST_PREPEND(ranges, r);
> +            }
> +            info->u.number.supported_values = ranges;
> +
> +            g_free(vs->ranges);
> +            g_free(vs);
> +        } else if (g_strv_contains(cpu_model_advertised_features, prop->name)) {
> +            bool cur = object_property_get_bool(obj, prop->name, &error_abort);
> +            boolList *values = NULL;
> +
> +            info = g_new0(CpuPropertyInfo, 1);
> +            info->name = g_strdup(prop->name);
> +            info->type = CPU_PROPERTY_TYPE_BOOLEAN;
> +
> +            /*
> +             * "off" is always supported. "on" is only supported when the
> +             * host already has the feature enabled.
> +             */
> +            QAPI_LIST_PREPEND(values, false);
> +            if (cur) {
> +                QAPI_LIST_PREPEND(values, true);
> +            }
> +            info->u.boolean.supported_values = values;
> +        } else {
> +            continue;
> +        }
> +
> +        QAPI_LIST_PREPEND(head, info);
> +    }
> +
> +    object_unref(obj);
> +    return head;
> +}
> +
>  CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>                                                       CpuModelInfo *model,
>                                                       Error **errp)


