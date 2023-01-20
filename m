Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp966601ejc;
        Fri, 20 Jan 2023 02:11:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtbHUSBo2SMFzGXsOq7iwRbSuVQw+nG98vtnWbHVyo9qn/K1kAKpcFvb8S27l9PSnEXTVoT
X-Received: by 2002:ac8:4f13:0:b0:3a8:d1d:f510 with SMTP id b19-20020ac84f13000000b003a80d1df510mr16713904qte.35.1674209509977;
        Fri, 20 Jan 2023 02:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674209509; cv=none;
        d=google.com; s=arc-20160816;
        b=txzBSnv2pfrEFqQnsqDJZtS8HkEKv7JKfccxAAt44Pt5fmnDM1mteTnXMvfLg3/JOO
         E4k9x+J60QqZ8Dt/XKaFX7s2JrwF6HnkAkQKomlWmpOOyBJ9YhAcM5D42VwJnhGF+CO1
         q0YmwiDwuoDoqT7EwpTevU4BWfXoeI1EcXmBkVvvd9SU0GWPrf185zQePCjLqE0oT17F
         fccSvx/SIdq78f8rzlvyP5AxG19EU1FAK+0SFS7MUkk2r5torScVZx9Wp6/rTGQN2RyZ
         Ulf4rmSpxqMF3ussEI/gDCXGw0lZBbSjYuLfA9LwieYafg1Uzo/iTOoABPv+uQKoelUq
         KfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=siKr8jsLQXRBtk6ijivgWUhEYt1K6vWFUpEfft3epPA=;
        b=BPZeCScL/KxUz0ZiGOHtw5pc1/YLNlQ9bUEI8bHarR5NMEH5xSNqbsqMhv+7nPpOaA
         ZiODrWej5P4v6mOluhuGIa2yokzwU9N1fEpO+tlOuhzQ8FujcK1XiHnk7XxUC44Q3346
         tUWmkyQzwM6vMOViBPaDH8GL7REKv0cnWuHtgQZ3Tz08OPfcZpNeTf42JuKD67HLH1zk
         ppNDP42Z/rRGp39rN74RaP6ub5EOHOrqm7bNDBQfaeYOFLF5CevmGu0idlStouAinmrW
         Z7ErFPLclmun1rKw07o6kbny3C0rKRClvXLePe06Af3A5CXBz/17PNKmc/3X0sfxrSzr
         PPUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fcpxjdO9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d20-20020ac851d4000000b0035d4338467csi15466121qtn.230.2023.01.20.02.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:11:49 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fcpxjdO9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674209509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siKr8jsLQXRBtk6ijivgWUhEYt1K6vWFUpEfft3epPA=;
	b=fcpxjdO931hwNezliHLXLaXt8HM/pmfl9MuzSIZAZQWa7Dv4QbXG/hsy74zj9VxyLWYdBd
	CkqIBijsnnKudzyN4aqQoEKbFrSyojjMtfMiM/5bY6/0xi/lFKwGeaYt1IOdL1mifMDZxq
	3kWgw0CEvT9wctOCj1AkTDyANyHBt84=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-_rP2OTdAMAa1YvJ2d-xHaA-1; Fri, 20 Jan 2023 05:11:45 -0500
X-MC-Unique: _rP2OTdAMAa1YvJ2d-xHaA-1
Received: by mail-qk1-f199.google.com with SMTP id ay34-20020a05620a17a200b00704bd9922c4so3147188qkb.12
        for <alex.bennee@linaro.org>; Fri, 20 Jan 2023 02:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=siKr8jsLQXRBtk6ijivgWUhEYt1K6vWFUpEfft3epPA=;
        b=FmUZvBhK+2Li+ys+r7unLgcpY+sHfXSiCgBR1FnLfExXfCV6x/Qn9doCFaj0J19s69
         2rW1s6TMqBCuw2SAznOy6gQLrgdZhaux8dMLRB+doQAHr+4Bt4i8zgJ1eEvvZqhljlAP
         DDvfzfnU5v3+BiT1Nd4YZGTg9Q0t61OaIeaFxRn6pqUDXFT2hErD66qEzx+URUQQAtjW
         4ohMdS7a5YYL0kuWZ8YzLsH//2rglg+Aobf5vgZNObzp2ThIQsApIeBB2bNhRfM1LByn
         RxcYNmjb6F1eWTA2bNhI2ReoYeVDwazsppgDLs2qUUl2XEZJE5ALA6lrdw45dVaeECtJ
         vA3w==
X-Gm-Message-State: AFqh2krOFBqhWM2n+w+nKAm+TvPeHn7K/7bknrgFKrislZzIu4A04jT1
	78tQenbRXdLdtC+zNt1LqtM814qUtfzO5diIXDLmCPUZhJ9hfmXIClsV2IW2KjpV8yZwwDj0gIm
	wO1MY8ae+WdsTPe7S
X-Received: by 2002:a05:6214:2f0e:b0:532:2112:69fc with SMTP id od14-20020a0562142f0e00b00532211269fcmr23913478qvb.0.1674209505120;
        Fri, 20 Jan 2023 02:11:45 -0800 (PST)
X-Received: by 2002:a05:6214:2f0e:b0:532:2112:69fc with SMTP id od14-20020a0562142f0e00b00532211269fcmr23913461qvb.0.1674209504847;
        Fri, 20 Jan 2023 02:11:44 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de. [109.43.177.118])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05620a319a00b00706a1551408sm6383741qkb.4.2023.01.20.02.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:11:44 -0800 (PST)
Message-ID: <0aaf43fc-d8d4-7e48-d71e-818d917fad59@redhat.com>
Date: Fri, 20 Jan 2023 11:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 04/15] tests/qtest: arm-cpu-features: Match tests
 to required accelerators
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119135424.5417-5-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: VMkdbOu5k4aM

On 19/01/2023 14.54, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/arm-cpu-features.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 4ff2014bea..1555b0bab8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -21,7 +21,7 @@
>   #define SVE_MAX_VQ 16
>   
>   #define MACHINE     "-machine virt,gic-version=max -accel tcg "
> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
>   #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>                       "  'arguments': { 'type': 'full', "
>   #define QUERY_TAIL  "}}"
> @@ -613,31 +613,39 @@ int main(int argc, char **argv)
>   {
>       g_test_init(&argc, &argv, NULL);
>   
> -    qtest_add_data_func("/arm/query-cpu-model-expansion",
> -                        NULL, test_query_cpu_model_expansion);
> +    if (qtest_has_accel("tcg")) {
> +        qtest_add_data_func("/arm/query-cpu-model-expansion",
> +                            NULL, test_query_cpu_model_expansion);
> +    }
> +
> +    if (!g_str_equal(qtest_get_arch(), "aarch64")) {
> +        goto out;
> +    }
>   
>       /*
>        * For now we only run KVM specific tests with AArch64 QEMU in
>        * order avoid attempting to run an AArch32 QEMU with KVM on
>        * AArch64 hosts. That won't work and isn't easy to detect.
>        */
> -    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
> +    if (qtest_has_accel("kvm")) {
>           /*
>            * This tests target the 'host' CPU type, so register it only if
>            * KVM is available.
>            */
>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>                               NULL, test_query_cpu_model_expansion_kvm);
> +
> +        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> +                            NULL, sve_tests_sve_off_kvm);
>       }
>   
> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +    if (qtest_has_accel("tcg")) {
>           qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
>                               NULL, sve_tests_sve_max_vq_8);
>           qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
>                               NULL, sve_tests_sve_off);
> -        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> -                            NULL, sve_tests_sve_off_kvm);
>       }
>   
> +out:
>       return g_test_run();
>   }

Acked-by: Thomas Huth <thuth@redhat.com>
