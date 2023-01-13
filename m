Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp427464ejc;
        Fri, 13 Jan 2023 06:22:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsjZPaOBAhgx865MaNQc/nt4x8qlF54Y7M+MO2VNQqmMgZdr9imEiRL2iiJ4RZwb5+OE522
X-Received: by 2002:a25:e00d:0:b0:6f5:7d1b:b86e with SMTP id x13-20020a25e00d000000b006f57d1bb86emr9339903ybg.0.1673619738383;
        Fri, 13 Jan 2023 06:22:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673619738; cv=none;
        d=google.com; s=arc-20160816;
        b=Ay/5DFs2uL3GYGBF0I7D2fekPNeO7zNEiPOQkzdV7cbIRQQ8VASWwtdFrnv+xZb4Cx
         47EKI6jXtiYwpaoCUmqu03srkCk/hu13rAtc3d7ZrUi+Eu8wZG2bnqyyL801FVQ8PhUi
         e5kt62o3xjkhUhE9s4/AmpNvf53I5ZcdQ/pxvvW85DQEgtsvolK7PIom+bZ/fS05eCRo
         yec8ClKJPrzv86UWe2g4u7+Vn6jMgoQc7OV77iuKCMknDDXfD8dah16sd79wxUrCBqPo
         sxJ8/e6cz5/942xzSuZN44atzd08Aby2PC9BHNNhagQsmAy4cFHZaPy0qbZFZC8JBfOs
         RHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lp2RZ1DNWGnPOCNuTdafHAOiadCqKFsfZ5OfEbcFHeA=;
        b=F/Rk0b2befxDQXtpuciR4tdGQAiolxlW4N9JZKTj9upyB0Sb+cOJJ0ZGWt9EG4bHXh
         PULnHlkFRumOieIufNWhVJgG7aIkxCo4hKqd99PvAhaLlLWucjndO2lLMaEgIaBaK2xT
         u/87qK8jm0s1ZH0aCqJwkrjOFOfsv4vxfCytzuIbWFxKAuZzQrlfP3zrDvjq2AuEXGgk
         7Tl7r2ROCZs6+MsdLHObAXPdAJJLmwjoPHctmw5Cmr3yiHke0DVIKXrME8Zmm/1BHcpl
         s9shhuBgjlSIfUbivNyOb8LJkLA1XEDN7IT2siiIBok+1QCGIur5a1iUJaGIww9jjIZU
         Repg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bHbAAzmv;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x7-20020a254a07000000b00758b79d43aasi20370629yba.61.2023.01.13.06.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:22:18 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bHbAAzmv;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673619737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lp2RZ1DNWGnPOCNuTdafHAOiadCqKFsfZ5OfEbcFHeA=;
	b=bHbAAzmvZMLNhaKx2AkT3Mfnj8pJySYAuHlql+NBzgnsD6sLCVeMvLRxpSaGg1qvEyemTH
	F+9EU8Dln8wDwA6a5z4j03JdeczwgJT15Kx2pAI26gb6FRiVLgeWDW6CBhzFoAJJMEWa+z
	LZtRY79I0baVVz2H9BziSJ6PN2b4EEo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-YCGrcr1wMC6AQv-Lu9uSCA-1; Fri, 13 Jan 2023 09:22:16 -0500
X-MC-Unique: YCGrcr1wMC6AQv-Lu9uSCA-1
Received: by mail-wr1-f69.google.com with SMTP id y5-20020adfc7c5000000b002bc02b72d2dso3491929wrg.19
        for <alex.bennee@linaro.org>; Fri, 13 Jan 2023 06:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lp2RZ1DNWGnPOCNuTdafHAOiadCqKFsfZ5OfEbcFHeA=;
        b=PqXjVjEHC3ZbY1sOdJDyrutT6z85g5VCJ8F19XCQngpqKyRf03PmPS8SKQUWbKBHyS
         YEQxYxRn8f19lTNRa2+YdYoJOJx9vssfUJVFPWVsGBNb0t5nE4XVDpZp45r8QfwG0xTn
         NNKPQCcd83nnYbJE0s2qvwNtucXis8W0kRDMAb0V6NVe9LehOCjJkOBg47OA8yN39NnZ
         RHZcDbqHgaqEK8PfjldDww7n4Ab79UMxPzFha16vt7NzPer3VTV963fn05KSsKNOe6yi
         XHB7kSX3pOP0A7UfTxDBk8hMYioXgii13/r0hQByS1UdKekgcB/ntBXeyzxjIUGdR5f4
         hv0Q==
X-Gm-Message-State: AFqh2kp2IuqNOEpTk6x6LwhdpOek2Ta2+0dXVVHrCLHWgV+F19OuEY7+
	MFRSGLkrDDgDvtWAJ9p0AGjRuVGn63Gx1EjVhEC0ZikWtERbBIZxRak5vJKDOYCK3NeGv+Z4RNq
	bQbpO8rwIbhRAe/M8
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id l40-20020a05600c1d2800b003d21d51246emr61861523wms.9.1673619735691;
        Fri, 13 Jan 2023 06:22:15 -0800 (PST)
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id l40-20020a05600c1d2800b003d21d51246emr61861501wms.9.1673619735500;
        Fri, 13 Jan 2023 06:22:15 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-39.web.vodafone.de. [109.43.177.39])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003d1f2c3e571sm33110641wmq.33.2023.01.13.06.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:22:14 -0800 (PST)
Message-ID: <81895ce0-ce46-bdff-9865-0721dd4accf1@redhat.com>
Date: Fri, 13 Jan 2023 15:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230113140419.4013-22-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: cAlwKY5LQRam

On 13/01/2023 15.04, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 4be1415823..9a052e41fc 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
>       qobject_unref(resp);
>   }
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
>   static uint64_t resp_get_sve_vls(QDict *resp)
>   {
>       QDict *props;
> @@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>   {
>       QTestState *qts;
>   
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support disabled in this build");
> +        return;
> +    }

Could you please use qtest_has_accel("tcg") instead? ... that's what we use 
in other spots in the qtests for checking for valid accelerators already.

  Thanks,
   Thomas
