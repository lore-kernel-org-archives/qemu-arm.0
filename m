Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA8ACA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 15:21:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBDAN-0007zV-3N; Mon, 28 Sep 2026 11:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBDAH-0007yh-0O
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xBDAF-0002Zd-H3
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790608869;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lfyQe5YfS2fsAUZ3PMujSKCnEKbPILudt9YglQ0qNCA=;
 b=OQyZxNpwnW/guNdkMW7Wezp8eqlgBksjxIeS28jOBWJT1DopBojd0e6QfzasWHIa5fOieK
 PF5QOhINoS/DQSghHa/ZXI5xj9EMddxLD0jg+4ey20PRywLg1yWYnmA11CgePS+lFIOAyx
 Xz2oc/mM2QzECWR2pabcYzBQjSuBCCM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-Wkx9JJ2bPnqOyJEYFzM3VA-1; Mon, 28 Sep 2026 11:21:07 -0400
X-MC-Unique: Wkx9JJ2bPnqOyJEYFzM3VA-1
X-Mimecast-MFC-AGG-ID: Wkx9JJ2bPnqOyJEYFzM3VA_1790608867
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4888945a74fso2348777f8f.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 08:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790608867; x=1791213667;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lfyQe5YfS2fsAUZ3PMujSKCnEKbPILudt9YglQ0qNCA=;
 b=SKLeRc0Plo7rqqtjkYmn9L5Y147WECyKGw57ywmytM2a7NzQ3DQfdHo1NiUFQFoeZR
 gv6UsZOmRBSH9AytV8thx5NbCqqE6J2f1Oah3t6QUsAEF1XpWY/e2dQ0XYq7l+d/BXjD
 +eX59GWSet8QxKuBKL0TFuXPIQsPYAFJAMTE20YWTJ+Wp0Y4X3VHHT5Cj0NSc3Rnj4y9
 72C796MuBFaNMVzRsmLJsQSPOktH88wpWQlCq5Rwh2IKcQMn8eQESdq3T2hwMK0ltj3D
 Z5UicNH4qs+qJCkqz+VtDHV0+AdVALPR9NCQoNqozzZ55FbAhIFoDbW6R/X9t5tofIdu
 1tYQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxE5rPI2+OxJlZT0ll7bO/J+5oSgcdLaphaY8db6g6ZI5b6TsKWu6ur3yzptVQPtL/qi9COUckjtQ==@nongnu.org
X-Gm-Message-State: AFuF++l+fZbRu7xJT5NJme+32zvPgon+2P9cTKrnBrIWjSND4ymdelSM
 hRl1rBxVYnuGrwSmhFQ+TxgshnjTlG5P9WCkcoVIDizQpR3zd5EuD2PpQvTMkyQSGkTUiay7eDV
 b+ERf8dP2nvRa4XmYi0FahfSjeRhhXK/UsHXpCwh5S4leVb4aeHdrmA==
X-Gm-Gg: AYBFou2Y6X1Z9cv4TV7jkxrswz2YGH35DN3gHMgevwNyqx+0JBHZQFH0KeucNb5UbiQ
 oNUdKEhVtsnbC+iKZzIdIDEeVMQZm5ZS1QKB0DZB8phDjyqxUXdjWmeH5aOqY/Ep8wbQRWl+nCp
 mMfThhDVxdPP4gUyGyY5OIovzX0D+UF4pCaEKwDk81WVk1qk9WIWUSfLr0uya5WPJSH+27NlcLW
 s3pRIXBDAcVfUfv8as48V93dpwQCgaS2i034dJXg11+Th5+JvLbbv62ikjdx/dE4KVjxKrbamFn
 YsnA5EO1SUK5g/rinvc5DM5TJwa0r3Jd3oaiPc6vz9qRbYDRG+6gOEv7lZO3GvRsDidmN/pT6I4
 ZWinPlyvckAoxDV0/7ws6QoWuEqhR7b1DKpjRd9mj1VLf7ngT
X-Received: by 2002:a05:600d:6409:20b0:49f:f099:6f8c with SMTP id
 5b1f17b1804b1-49ff0996fd6mr120575465e9.9.1790608866505; 
 Mon, 28 Sep 2026 08:21:06 -0700 (PDT)
X-Received: by 2002:a05:600d:6409:20b0:49f:f099:6f8c with SMTP id
 5b1f17b1804b1-49ff0996fd6mr120574815e9.9.1790608865959; 
 Mon, 28 Sep 2026 08:21:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a30bcdbsm27793547f8f.2.2026.09.28.08.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 08:21:05 -0700 (PDT)
Message-ID: <598d5c80-7b03-41cd-b708-6f833c1e9b08@redhat.com>
Date: Mon, 28 Sep 2026 17:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/26] target/arm/kvm: Introduce
 kvm_arm_expose_idreg_properties
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@oss.qualcomm.com" <philmd@oss.qualcomm.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260916144721.751810-1-eric.auger@redhat.com>
 <20260916144721.751810-14-eric.auger@redhat.com>
 <67EB28E9-F8CE-4BE1-8712-88583DEFF24E@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <67EB28E9-F8CE-4BE1-8712-88583DEFF24E@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fV3l40hHq-YN0Xlooy5grM8kzIGkTGbESK5LJZdPXZM_1790608867
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.238,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
On 9/24/26 8:26 AM, Khushit Shah wrote:
>
>> On 16 Sep 2026, at 8:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> +
>> +/*
>> + * decode_idreg_writemap: Generate props for writable fields
>> + *
>> + * @obj: CPU object
>> + * @reg: description of the sysreg
>> + */
>> +static int
>> +decode_idreg_writemap(Object *obj, ARM64SysReg *reg)
>> +{
>> +    uint64_t map = reg->writable_mask;
>> +    int i = ctz64(map);
>> +    int nb_sysreg_props = 0;
>> +
>> +    while (map) {
>> +        ARM64SysRegField *field = get_field(i, reg);
>> +        int lower, upper;
>> +        char *prop_name;
>> +        uint64_t field_mask;
>> +
>> +        if (!field) {
>> +            warn_report("%s bit %d of %s is writable but no named field "
>> +                        "in target/arm/cpu-idregs.h.inc",
>> +                        __func__, i, reg->name);
>> +            map =  map & ~BIT_ULL(i);
>> +            i = ctz64(map);
>> +            continue;
>> +        }
>> +        lower = field->shift;
>> +        upper = field->shift + field->length - 1;
>> +        prop_name = g_strdup_printf("SYSREG_%s_%s", reg->name, field->name);
>> +        trace_decode_idreg_writemap(field->name, lower, upper, prop_name);
>> +        object_property_add(obj, prop_name, "uint64",
>> +                            get_sysreg_prop, set_sysreg_prop, NULL, field);
>> +        g_free(prop_name);
>> +        nb_sysreg_props++;
>> +
>> +        field_mask = MAKE_64BIT_MASK(lower, field->length);
>> +        map = map & ~field_mask;
>> +        i = ctz64(map);
>> +    }
>> +    trace_nb_sysreg_props(reg->name, nb_sysreg_props);
>> +    return 0;
>> +}
>> +
> We can try field based handling, it is more elegant.
> - for each field, check if not RES and writable.
As discussed I now enumerate all the fields instead of decoding the
writbale bitmask. But I still do some sanity checks on the consumed
writable bitmask:
- check the field is fully writable
- check if, after enumerating all fields I still have some writable bits.
The above cases would highlight some inconsistencies between KVM outputs
and qemu architecture description. I think it is worth.

Thanks

Eric
>
> <Though I will argue that all fields should be present not just writable :)>
>
>
>


