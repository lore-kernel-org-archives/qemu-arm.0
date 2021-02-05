Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2106332lfo;
        Fri, 5 Feb 2021 07:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR7w1RNl2045L881MSWHZ7cP4KMp1R4kDGPdMG3qjWTheWK8wE5uDQZlkFuGW3IlPztptr
X-Received: by 2002:a25:ba08:: with SMTP id t8mr7157508ybg.316.1612538913873;
        Fri, 05 Feb 2021 07:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612538913; cv=none;
        d=google.com; s=arc-20160816;
        b=Dragrr+LZkavr8PgY7FbBp9DZW0/Jxxx2hJuwh51fLEeqgmmqkb1EAYFkwawLNsNny
         2CF4gNSyM6p74y6HX6E3PrwOUb0UQrYVbS7BrV+8LglO9OGPWoQvedBT/ep7cUeGsWEd
         TnrixSKEdmYfn/dxSCK4LLQ/X78p1JMC03kS1rmT6E10EC1HxUnDvEjhgfNjG5EtGUHh
         dPFefqLvwaVOnEaj/8eH6elWYDboCcOyCTIxmHAA8kCptG/QYbTCuClEljK15fha4H97
         yzKEh/RmxXNNoQxi1pJCAVw4j95xAaBR58HylFOrq3vAO/xcVnoGDR3cAA8/k99ZRefQ
         NjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=K0Ds7ZZK9fwS3VMmIYWHYAwwawmZc5Y1jd+Sf3GIklA=;
        b=dyDhZpgkJ/ysdcAOu1jOdbm8hV5/ZxyV0I7gN1RKC06snPEXVrRprfar6Gisb89r+M
         wAJkXI/4JRcIxMjzz+ctYRxcapsKjcLD6ZyPV79vYkyZ9m00sOlVQMCU8mbHxEpN6dmu
         XPO2wSeDXohAvy+Nga/y2decWMLyqnuemv8ohPTlpAzMKdYutuf/flzZtTKb67PnsO72
         QZT+6Vhg9ChWwc1OQM2e2g2YLMaefUBkZVRGS0C7kKCMakk7QIfhkzvF/7s5eA83xdb/
         elWpaOU+9IU+cY8O0rz2aDs6zCNQhLq5I7X4F8lw3acfCfPq+/H4Vlz04EsMrspryM2i
         /BIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Hhs/i7S9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n71si8545338ybn.278.2021.02.05.07.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:28:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Hhs/i7S9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8329-0000m5-7T
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l831r-0000kA-8W
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l831o-0004j9-0f
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612538890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0Ds7ZZK9fwS3VMmIYWHYAwwawmZc5Y1jd+Sf3GIklA=;
 b=Hhs/i7S9tq+nzNF/ZQnPf6mNb/wn+zVw13s44F5C3DXkBD5JEo9mmYsitUrBsEQgzgdzB3
 PlEEPthYGFPIzCrEu88D+G6n/mMqkkzCj0N6aPESl1i8BhqCdyZHVoUnts38RhrGVloEVa
 v+QKLQF/m2SBzVG+xiEUoRP9KvWEE8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-PjeAto4gO_G6C9E9z8gEuQ-1; Fri, 05 Feb 2021 10:28:07 -0500
X-MC-Unique: PjeAto4gO_G6C9E9z8gEuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A39F0100AA27;
 Fri,  5 Feb 2021 15:28:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF1F360C5F;
 Fri,  5 Feb 2021 15:28:02 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:27:59 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 9/9] tests/qtest/arm-cpu-features: Restrict TCG-only
 tests
Message-ID: <20210205152759.5vqfnpvelqbydwnu@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-10-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-10-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kS78yBDmLH2a

On Fri, Feb 05, 2021 at 03:43:45PM +0100, Philippe Mathieu-Daudé wrote:
> Some tests explicitly request the TCG accelerator. As these
> tests will obviously fails if TCG is not present, disable
> them in such case.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> 
> RFC because of the TODO.
> 
> Roman posted a series to have a QMP command to query enabled
> accelerators.
> ---
>  tests/qtest/arm-cpu-features.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index c59c3cb002b..c6e86282b66 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -20,7 +20,7 @@
>   */
>  #define SVE_MAX_VQ 16
>  
> -#define MACHINE     "-machine virt,gic-version=max -accel tcg "
> +#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
>  #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "

Should probably also drop the TCG fallback from MACHINE_KVM when
TCG is not present and then find another way to confirm KVM is
present in the kvm tests prior to calling qtest_init().

>  #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>                      "  'arguments': { 'type': 'full', "
> @@ -41,6 +41,16 @@ static bool kvm_enabled(QTestState *qts)
>      return enabled;
>  }
>  
> +static bool tcg_enabled(QTestState *qts)
> +{
> +    /* TODO: Implement QMP query-accel? */
> +#ifdef CONFIG_TCG
> +    return true;
> +#else
> +    return false;
> +#endif /* CONFIG_TCG */
> +}
> +
>  static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>  {
>      return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
> @@ -352,7 +362,12 @@ static void sve_tests_sve_max_vq_8(const void *data)
>  {
>      QTestState *qts;
>  
> -    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
> +    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");

Won't this fail when TCG isn't present? If so, then the test will
either have already aborted or at least qts can't be passed to
tcg_enabled().

> +
> +    if (!tcg_enabled(qts)) {
> +        qtest_quit(qts);
> +        return;
> +    }
>  
>      assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
>  
> @@ -387,7 +402,12 @@ static void sve_tests_sve_off(const void *data)
>  {
>      QTestState *qts;
>  
> -    qts = qtest_init(MACHINE "-cpu max,sve=off");
> +    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
> +
> +    if (!tcg_enabled(qts)) {
> +        qtest_quit(qts);
> +        return;
> +    }
>  
>      /* SVE is off, so the map should be empty. */
>      assert_sve_vls(qts, "max", 0, NULL);
> @@ -443,7 +463,12 @@ static void test_query_cpu_model_expansion(const void *data)
>  {
>      QTestState *qts;
>  
> -    qts = qtest_init(MACHINE "-cpu max");
> +    qts = qtest_init(MACHINE_TCG "-cpu max");
> +
> +    if (!tcg_enabled(qts)) {
> +        qtest_quit(qts);
> +        return;
> +    }
>  
>      /* Test common query-cpu-model-expansion input validation */
>      assert_type_full(qts);
> -- 
> 2.26.2
>

Thanks,
drew 

