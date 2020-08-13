Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp493831lfy;
        Thu, 13 Aug 2020 05:56:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCyDT7tr7Gaun9oorU+bALzWcxUchSZGoDGhXskoIwy+zK23NIhZLLJpzJsxGh+3T6xgj+
X-Received: by 2002:a25:32c6:: with SMTP id y189mr6550716yby.352.1597323391009;
        Thu, 13 Aug 2020 05:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597323391; cv=none;
        d=google.com; s=arc-20160816;
        b=OfZNOlduQU6/Xm4v8OGW0mhd7ZE+t6DBoX8CtZuGgLWU4btKZsiBAUpyEdRTBYincj
         W7R693Ndv21cP/oJJFvioTozwlx7sFhLxvyR4OUSLlLJU0N59OlL28VuBL+HqbzeZz52
         eSpBrgQQtnm5TyhyE2w/zY9Gn0VX74MGm0Eh2lux/tKUZ0rqT2lW3Qr45WicC+KGTZPW
         cvrkBJsgEJFQt2gAD/+67iZwFYHF3YdvxuD48u+VeEtWqQDehgBHkRet3EZau2Ukgs6u
         1dsbHFiHTQfDVWTfNEhVPWjpQib8QfplfTIbmgdI15buCJP7/gAjKuPR52APhR6Q2f77
         flRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=t/TnqbXhNdsOww0JThDbjZ9iE+V0EXwwbrcxTGAe91c=;
        b=I3wM3CFpVqiE3Bhr8froV5vlKiQX4LpkZrAlcGwTpzouUDQ4injwnLYvQE71O6EANi
         F4ztRk5bsgT1aOTPwTTZflqJ72NCxm02/lBuzYlMZoo0adrn8reL4xuBQq/heVsaBFK8
         mECXka/xyFdt6CMJaSqvhhwv+uWpuFO2c7JKxOMnJS+a00c0LOd/6EOBiMU9f7/TqPLf
         TX5dQ5cmMP2gfynBGmXd6AGNdLITU8GfsEZl1s/I8gS/+XgZRo/am+6bQKuNK+C1+/KQ
         kaWPELTMwo+6KAoQtvmFlUMEmAG/7RznQYf8ra6ohPGjTFbY0I/1Yw5lb/3PPTW+9IVz
         Ijcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XlMx8GPd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r189si5417747ybc.256.2020.08.13.05.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 05:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XlMx8GPd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6CmU-0004BR-Bb
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 08:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6CmL-00049q-JO
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 08:56:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27988
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6CmK-00072d-3Q
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 08:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597323379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t/TnqbXhNdsOww0JThDbjZ9iE+V0EXwwbrcxTGAe91c=;
 b=XlMx8GPd3F4O78wrjyW0zjOOffODkl9aYTq5zHiFDwjPw6m3gib7t6n7uzh0I+keyDm7Kv
 jgQ9TzAWoxCgA2j8kYxhTWjfdY4EtgEVIdOVmJncEGZnsf8MjcKGDTlY0+YyFC7yyXtwUo
 wL8nDoBCvR5mo3A8M1XA25uoKIiRsxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-N6k44IzyMwm3NyjZHZinWQ-1; Thu, 13 Aug 2020 08:56:15 -0400
X-MC-Unique: N6k44IzyMwm3NyjZHZinWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BA7C425CB;
 Thu, 13 Aug 2020 12:56:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E3160C11;
 Thu, 13 Aug 2020 12:56:05 +0000 (UTC)
Date: Thu, 13 Aug 2020 14:56:02 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [RFC 7/9] target/arm: Add CPU features to
 query-cpu-model-expansion
Message-ID: <20200813125602.drapo7wyzg57k3jy@kamzik.brq.redhat.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-8-liangpeng10@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813102657.2588720-8-liangpeng10@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SpNk9Eng+gb/

On Thu, Aug 13, 2020 at 06:26:55PM +0800, Peng Liang wrote:
> Add CPU features to the result of query-cpu-model-expansion so that
> other applications (such as libvirt) can know the supported CPU
> features.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>  target/arm/cpu.c     | 41 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h     |  2 ++
>  target/arm/monitor.c |  2 ++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 3fc54cb3a4..0f620e8afe 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -25,6 +25,8 @@
>  #include "qemu/module.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qom/qom-qobject.h"
>  #include "cpu.h"
>  #include "internals.h"
>  #include "exec/exec-all.h"
> @@ -1515,6 +1517,45 @@ static const CPUFeatureDep feature_dependencies[] = {
>      },
>  };
>  
> +static char *strtolower(char *src)
> +{
> +    char *start = src;
> +
> +    for (; *src; ++src) {
> +        *src = tolower(*src);
> +    }
> +
> +    return start;
> +}

Shouldn't need this. The CPU property names should already be lowercase.

> +
> +void arm_cpu_features_to_dict(ARMCPU *cpu, QDict *features)
> +{
> +    Object *obj = OBJECT(cpu);
> +    const char *name;
> +    ObjectProperty *prop;
> +    bool is_32bit = !arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(cpu_features); ++i) {
> +        if (is_32bit != cpu_features[i].is_32bit) {
> +            continue;
> +        }
> +
> +        name = cpu_features[i].name;
> +        prop = object_property_find(obj, name, NULL);
> +        if (prop) {
> +            QObject *value;
> +            g_autofree char *tmp;
> +
> +            assert(prop->get);
> +            value = object_property_get_qobject(obj, name, &error_abort);
> +            tmp = strtolower(g_strdup(name));
> +
> +            qdict_put_obj(features, tmp, value);
> +        }
> +    }
> +}
> +
>  static void arm_cpu_get_bit_prop(Object *obj, Visitor *v, const char *name,
>                                   void *opaque, Error **errp)
>  {
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5d8074d03b..da68b7f8f4 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3933,4 +3933,6 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
>  #define cpu_isar_feature(name, cpu) \
>      ({ ARMCPU *cpu_ = (cpu); isar_feature_##name(&cpu_->isar); })
>  
> +void arm_cpu_features_to_dict(ARMCPU *cpu, QDict *features);
> +
>  #endif
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index ba6e01abd0..f8eb29efec 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -225,6 +225,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>          }
>      }
>  
> +    arm_cpu_features_to_dict(ARM_CPU(obj), qdict_out);

Since nobody is looking for these features in qdict_in, then none
of these features can be changed by QMP user. How does the QMP
user probe whether or not the feature will work when enabled?

Thanks,
drew

> +
>      if (!qdict_size(qdict_out)) {
>          qobject_unref(qdict_out);
>      } else {
> -- 
> 2.18.4
> 

