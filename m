Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2424745ejc;
        Tue, 17 Jan 2023 06:33:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucog2HXOgJWrzZ1Z4YBmjV2wgT93HQSWgqFq9RDgwl9RslRPOG6FJI3fdfsmK/FXKAb2Xs
X-Received: by 2002:a05:6214:188e:b0:4c6:eca0:4870 with SMTP id cx14-20020a056214188e00b004c6eca04870mr31993184qvb.30.1673966005477;
        Tue, 17 Jan 2023 06:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673966005; cv=none;
        d=google.com; s=arc-20160816;
        b=R0S9Iswf0lN9ZQfDtQvsuLYPPrbog63daErCrNrx0rRpHE5pOIIMAngGW+m51n49zg
         sA16azFpX1NdRvV+1BiOp+J5sVu8K/G0gGTqKpHb/R+7En3B9q1ERzvyI1sy7iPgjT//
         JVVm72xpPeV5PJ1e4trB0K6lK1ijoEnN8S2JLVlcOh5Akb45Jqsw/p/mfMNOBHuzU/tT
         L5gA2bIk6284VX1Fh7oPW0zx+VijYCGCKspFFuiRaAVRoHgBVoIC8NaE9UOaR2HaarF0
         U9fgp8pKOqELcF9ACgseQa8yMkZe3quTaXCFIcIq7tLurF4AwSu57vEAE+i4Obnih+Tt
         s3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=u0t1n5svpHol5zxgdc8vfDOVHhQhYh+lhsK+P5HXtpI=;
        b=Zs8cpVlPMMOxIBXn3/m6KfR8XGu7OgVhVc17J/9SYDo6lQdKfB9q2R7VWsQmqFy6hN
         JYyqkqJabGuPk66bwTK4g+DBzi4chheFKWcq/YYA1OWoT7aFip2rQVVnf3TtLjvE5RHN
         NZWtpe3v9t1JDK81JYd+w7SNEGCDX8o++Ii28XNFz/9w7apZg5IR9kUNdygrggr1bohV
         t3LbLVmGti/7zydc69yjoHyEYmm/UEBLYf8D9UST/9uLBQtt3VTZkcEMf15XSPgyuy4J
         37qU9elgJJnQ6xFOpe/69kXnuBzI22oEgeposqYDNqvCdz9GjsfmyPCm5jGFpp33UZnv
         rofA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EBcW861v;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r11-20020a056214212b00b005342f739984si10199724qvc.407.2023.01.17.06.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:33:25 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EBcW861v;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673966005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u0t1n5svpHol5zxgdc8vfDOVHhQhYh+lhsK+P5HXtpI=;
	b=EBcW861vU/dqODIYAZSaq2GjHHwAzXcTKbSUhQUkABBvhHksBZ7f6pI9CloLiIRdU4/nWx
	obPbAtApjIV31sXEZh071JNg8J5tzxOCbGmW/K/dNQH63/8eWqSBKegzb/guQo60ta1Ize
	fidsnBY79syhGRN1U3C5vZKV9nBn9V8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-MUcXswjGMnyWw6QhfCBy6w-1; Tue, 17 Jan 2023 09:33:00 -0500
X-MC-Unique: MUcXswjGMnyWw6QhfCBy6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DB681C29D5F;
	Tue, 17 Jan 2023 14:32:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D471121315;
	Tue, 17 Jan 2023 14:32:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
In-Reply-To: <20230113140419.4013-22-farosas@suse.de>
Organization: Red Hat GmbH
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 17 Jan 2023 15:32:18 +0100
Message-ID: <87ilh58c5p.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: zPgJ10qqYF2d

On Fri, Jan 13 2023, Fabiano Rosas <farosas@suse.de> wrote:

> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 4be1415823..9a052e41fc 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
>      qobject_unref(resp);
>  }
>  
> +static bool tcg_disabled(void)
> +{
> +#ifndef CONFIG_TCG
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
>  static uint64_t resp_get_sve_vls(QDict *resp)
>  {
>      QDict *props;
> @@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>  {
>      QTestState *qts;
>  
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support disabled in this build");
> +        return;
> +    }
> +
>      qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
>  
>      assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
> @@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
>  {
>      QTestState *qts;
>  
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support is disabled in this build");
> +        return;
> +    }
> +
>      qts = qtest_init(MACHINE "-cpu max,sve=off");
>  
>      /* SVE is off, so the map should be empty. */

I'm wondering whether the invocation of tcg and kvm test cases should be
reorganized a bit. Currently, we have test cases that use MACHINE (tcg),
and test cases that use MACHINE_KVM (kvm with a fallback to
tcg). MACHINE_KVM is used either for aarch64 && kvm
(test_query_cpu_model_expansion_kvm, which tests behaviour specific to
kvm), or for aarch64 (sve_tests_sve_off_kvm, which tests behaviour that
is the same for both kvm and tcg, and therefore tests tcg twice if kvm
is not available.)

So, should we
- drop "-accel tcg" from MACHINE_KVM,
- call sve_tests_sve_off_kvm only if kvm is available, and
- call the functions you skip here conditionally on tcg being available
  instead? (not sure whether not calling should be preferred to skipping
  in general)

> @@ -429,6 +448,11 @@ static void test_query_cpu_model_expansion(const void *data)
>  {
>      QTestState *qts;
>  
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support disabled in this build");
> +        return;
> +    }
> +
>      qts = qtest_init(MACHINE "-cpu max");
>  
>      /* Test common query-cpu-model-expansion input validation */
