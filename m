Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAC1CCA462
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 13:22:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHhsj-000263-JR; Fri, 16 Oct 2026 09:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHhsg-00025O-Or
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 09:21:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHhse-0007mW-KR
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 09:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792156911;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvNMJKy5hEsNmX3h2yw6AJYeXfgIvjlosnD74UtrqYM=;
 b=Skh15PCIZdaPGZcf484xyrsacEtd2KwR/FtuWtrHMGc7dPYlIwikAYivSFXtT2D0e8/a+T
 kmWMUYn+/1/NzUKjn2pHCnPwVwRijHY0mnIs0PP+HJKnaIw30NGI4NBui2TXrXuP0Ym2sZ
 +R32vMI8KswPJaFw3vwWcZf5lv3tyTs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-uwakDtHTNNGUKIYgpSAqBg-1; Fri, 16 Oct 2026 13:21:48 +0000
X-MC-Unique: uwakDtHTNNGUKIYgpSAqBg-1
X-Mimecast-MFC-AGG-ID: uwakDtHTNNGUKIYgpSAqBg_1792156908
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48e011829easo365864f8f.3
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 06:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792156907; x=1792761707;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nvNMJKy5hEsNmX3h2yw6AJYeXfgIvjlosnD74UtrqYM=;
 b=yN2KAERbzVrx38a59ADbCReco8lbreNYfVrTrqUsvfZCaMUoPFGlInDoUNoelP/h+S
 9gU6NWQPh7YhiosuU/1yy8WheyPj+xYJC4Zsd59bktFEmW9hhgxMGsoR9b+yJH7JXclV
 TvhR3X1K8Rxz1Pcj2LWG5pi5AIqPg9shiVz7HqbcKtirikxL44vKYfoJ/ze71Zpg3rqo
 KT/o1NDqTHE0i8gPTFy9AO3juX6SIhnuYRHAjshDZgmL10NkvH3yu3AgGp18COWDPmrw
 zHuGEqoPDmnDAfiyFdZL0e0mog5aihpHi6h7KchPbVqnzv+4eSHXKm5UurBr4Ch0Sd8d
 hs9g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxNIrBFu/WJrtNzi8iiFMrxCEY6cLTJCMtT82ZrfYPJ11VtKQUQsSxSOU/OiDM0GXsAGSGB17TIdQ==@nongnu.org
X-Gm-Message-State: AFq9FYLjfv1UFF37zDTdTSWWu4reabXjbSoGSw4HPsyOc7UeVyufgYHb
 4n6CPeSkM1CvjHGWwaeEhRk5o7wREFjJUzKhmALY2TpVR3z7TQ0t2bBQhNRk1n9KmLkR1qriVP9
 IOqX22EmDnA6aJcpZYDJzdUVDx1RaHaUWlhH/wD7GZCh/BVduj+Nn9A==
X-Gm-Gg: AYBFou3pxe9DkuTp0icjEthwpFjzDlX5aSzKri6iUDcILdmNlMlbWT9BMXXu41L/WXt
 XhTtPy8J9M1NEhYX5j5E7Av3j+tGsXyRe4woDFAp4R5f1RyuBF/UTxeV13s1v6kro0Rbzd6MTPC
 cfqWxVQzikfUHUNawR0PyKXpsL8OH79xPN4EEByEinbZeRHTuclheILj40J7bjktFDZ9b4k1MMO
 eHGbYvKfccQetsRCXeRw/6q2aaMyqiLdaHFqcmg8o2W7TVet4lBuSx+ZpVjN/69tCXAP2cIuKuz
 GbWtT6/XQabgoRsR/4/j6bGPl1H7hBPv08WY21FzOUKg7GXY2cdKI+Ig669kmMACbLM7jU9+KDM
 N11y+KhxAPZ+b6OWx/woJrVlvp8wm/g9dUaG6IeZP5e575TVW
X-Received: by 2002:a05:6000:4b15:b0:48d:fbee:3dec with SMTP id
 ffacd0b85a97d-48dfbee3fa9mr5402028f8f.29.1792156907541; 
 Fri, 16 Oct 2026 06:21:47 -0700 (PDT)
X-Received: by 2002:a05:6000:4b15:b0:48d:fbee:3dec with SMTP id
 ffacd0b85a97d-48dfbee3fa9mr5401985f8f.29.1792156907098; 
 Fri, 16 Oct 2026 06:21:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfe4d2321sm5067555f8f.19.2026.10.16.06.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 06:21:46 -0700 (PDT)
Message-ID: <4c9d85b0-4dac-40f8-8541-d79bb3670f12@redhat.com>
Date: Fri, 16 Oct 2026 15:21:44 +0200
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
X-Mimecast-MFC-PROC-ID: DDzsKlkcJZr0nMqDQVy-BbK_5ce0UeN8h316mRRxvSs_1792156908
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Khushit,

On 9/21/26 2:32 PM, Khushit Shah wrote:
> Implement query-cpu-props-info for ARM64/KVM by creating and finalizing
> a temporary "host" CPU object and then walking its QOM properties.
>
> For numeric SYSREG_ properties, report the host-supported value ranges
> computed by kvm_arm_field_get_supported_values(). For boolean
> properties, report false as always supported and true as supported when
I am not sure false shall be always permitted. for instance iirc
aarch64=off requires a special KVM capability which is not tested here.

it is worth to emphasize those are the theoretical values that can be
easily guessed, this does not check cross feature consistency which can
only be tested when applying the values at KVM level I guess. So let's
do not pretend that this is fully reliable. I think the only way to
double check the chosen values is to do a full expansion for this models
featuring the new values
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
Thanks

Eric


