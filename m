Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp436320ejc;
        Fri, 13 Jan 2023 06:33:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuU5nvMXWJGJ6tuBVua0tT5mOM8dCtzHkPenhRTI3+ND/bcn4FX4uYxKmYyeFj8zjmWPyyV
X-Received: by 2002:a05:600c:4da2:b0:3d2:39dc:f50e with SMTP id v34-20020a05600c4da200b003d239dcf50emr57908129wmp.7.1673620398856;
        Fri, 13 Jan 2023 06:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673620398; cv=none;
        d=google.com; s=arc-20160816;
        b=dTju1dx7h1KKZ84zeQOquqIikvBQZFvk7YcPJRepcJrIBsFW6Hrb/CKa6ij431fnZA
         o8jmh1vkbJQKnWenZbtoCMXphyov/Fn1JSbtSN1Ltm2+M9/ffoY7zXPPqZrazxHHYzRq
         XK/zBeuGJTImVOK/MizSBycPYcBc9Pd50BqMZU3JjSQUa6tXZ21Rf3ubx/N50AXVv9Is
         S0994JUpZ8rm0+/8YHUzDlnISZLZOpQvsdnhOiMDNbE5pvmxeDTcoLamUANVYIK8ufi6
         2SlITCA+68FScV5CBksySz4QsCNZtPQ1L7T9Pj3tDC7OIxZYIGzM2llG6iZfoyFD7OUm
         n5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=cD3E44kRD9iuQuGVAMay0dJLO9VRSWvTxEAE0xawEsA=;
        b=AVZBJHEUORuxvFwI/0bvidjUwI/dDppk1cVPHX4V7gwFZoA6oxbOL1zzl6d8HwogzR
         IxvqHVCs1dAazpq2Kz4jhCk1ViL5fIsMwrtZRvD4oUnsgs5f4YIYbn8EW2wwFW75GOsM
         ZpPn0lNNhrhW07Hu/7VnnXFIR1OIMu75QXp6+Qls/9GEG42NSUKPs9y7r4DeI+Awq2B+
         0WY6miDv1y2aXkWgmKEWU0WCjl9Wo68+uG6DFgC9187ADGY2m8bGJdeGM++dUirJ3naw
         7Q0ne3LttjHaCLoFYnXK/yCv1p+7PqT7P6XehC8dKSU9E7PQgJTicmPmBQLiH+S7DXrz
         AZoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=K5MAx4WT;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=j+u7gbmB;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id n7-20020a05600c500700b003d9bd715840si17152301wmr.219.2023.01.13.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:33:18 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=K5MAx4WT;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=j+u7gbmB;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 116AE60863;
	Fri, 13 Jan 2023 14:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673620398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cD3E44kRD9iuQuGVAMay0dJLO9VRSWvTxEAE0xawEsA=;
	b=K5MAx4WTqMeeoYRk8R/h7bCGxuXH7k2S7ExSNDIr6Qz26Yw7jmhySQ4W8JDhWVQl5KZyhV
	/hkZuCkVL9AHmZmZO7RO9MHxMQiCCq4CkG33zaSUUurwkMP/xS/YZM9Cnv5sLfXt/ncf9E
	Iy6HE2rYaDE2fRooDU1sWgY8/pWTOZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673620398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cD3E44kRD9iuQuGVAMay0dJLO9VRSWvTxEAE0xawEsA=;
	b=j+u7gbmBGe6Bme6/7A8fdIlz2izYeOIoi25LO95GreYN1a71fRbKFUS9ptYAv0IVEunJGm
	YZLFYhCjzIGjm3AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA53E13913;
	Fri, 13 Jan 2023 14:33:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0evXJ61rwWMZHAAAMHmgww
	(envelope-from <cfontana@suse.de>); Fri, 13 Jan 2023 14:33:17 +0000
Message-ID: <3be55a1c-64cd-28f3-9c7f-ceb67b20c36e@suse.de>
Date: Fri, 13 Jan 2023 15:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20230113140419.4013-21-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: Ml08IIbueDcz

On 1/13/23 15:04, Fabiano Rosas wrote:
> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
> cortex-a57 as default cpu for KVM.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>

Our recommendation currently for KVM on ARM is to always use CPU="host", as named cpu models generally don't work (yet?) with KVM.

https://qemu-project.gitlab.io/qemu/system/arm/cpu-features.html

Should then "host" be the default for KVM if CONFIG_TCG=N or CONFIG_TCG=M and the TCG .so is not loaded?

Thanks,

Claudio

> ---
>  hw/arm/virt.c                  | 6 ++++++
>  tests/qtest/arm-cpu-features.c | 3 +--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ea2413a0ba..19854f4137 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -203,8 +203,10 @@ static const int a15irqmap[] = {
>  };
>  
>  static const char *valid_cpus[] = {
> +#ifdef CONFIG_TCG
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#endif
>      ARM_CPU_TYPE_NAME("cortex-a35"),
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a55"),
> @@ -3003,7 +3005,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->minimum_page_bits = 12;
>      mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
> +#ifdef CONFIG_TCG
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +#else
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
> +#endif
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>      mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8691802950..4be1415823 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -507,8 +507,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          char *error;
>  
>          assert_error(qts, "cortex-a15",
> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> -            "with KVM on this host", NULL);
> +            "The CPU type 'cortex-a15' is not a recognized ARM CPU type", NULL);
>  
>          assert_has_feature_enabled(qts, "host", "aarch64");
>  
