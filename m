Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2525266ejo;
        Thu, 14 Dec 2023 10:28:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWLmQvcnY0Pz9nuRmx4vY0mzxmLjrWn36vG5hgHYYdMAczymidpcPpyPxC/kYABzMXT7AI
X-Received: by 2002:a0c:e801:0:b0:67a:b372:721c with SMTP id y1-20020a0ce801000000b0067ab372721cmr9894949qvn.34.1702578480745;
        Thu, 14 Dec 2023 10:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702578480; cv=none;
        d=google.com; s=arc-20160816;
        b=x/T6I851OToxg5kgN+Gl5bffUIaksvAxS04/pEhTO3CnFwBfbYcHjGmI57pI9jBq5I
         R/TW7ycz0lPYExXCVm6n8yOmNrd741WjoPmJq1cN5y+ZR83EH28X+0ksPmxaU6vrRPxL
         JIxRT5L21lP1TWXG/tlrqkJ5A+1pdcgveLwb8famxmLKu0HJg58WT6AYlqeYiBVkV+Se
         GJzQOKSItHRH5KVHfgIKiqDSH1rCPx7UpaidWeGdlsObJvhE1tVWu8Fn7dtgOGO2ItLZ
         TY3O/m8+08Zjz7nriofQYM8hiUPmRGna0PbZEubYSK/DY1pDEuzR/l3RM74qr9VX2ZwR
         P2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=IfFxEBJpKSzArGSrfQowGClxevW3jxANuqbEn+/nZWw=;
        fh=35b+QSHkpgGRAY7WaSrWgEvUXyq5d+QdLYGhAA0uy+A=;
        b=bw1Tb9evjeGwNU1eGx3QcxHViVGTnbvE2w1oY4yGEPU/oBfjHrCXZQ+GpZDycPGyab
         63xUwclrMtoX/irTVmXGthlNtIRkEuyF1MoVXjX39hvSsRfcGQxO79yIPsLvPTo0UYXg
         1+Xrz72uj8lNymUGl3tRfxWQhk8GnOD8xmrQZenDyDEtInOqzTs9Zi3cjaZoD4lWHvsb
         Fga5Oeyp3vcVsMkO+DrS+9Mou2nINAZ4OhLP6jdEEAVcPvd3l92tesuBhqH+TO9wouNg
         v6ZQCIoAJPTHoahE4Q9j+4w75wfVYuLX/xsEf2bnPf2+bZbXUZTZ6OEHUf4/0JsuwQh3
         b3EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eT8KJfn7;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h17-20020a0cf411000000b0067aa3bc0ecesi1543705qvl.34.2023.12.14.10.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 10:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eT8KJfn7;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702578480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IfFxEBJpKSzArGSrfQowGClxevW3jxANuqbEn+/nZWw=;
	b=eT8KJfn7hjpsoT3EjahMz8Zam0V/X5Ob2N12Ei0NHQlDyt2rxJiqH+eAjGQtKGSnNxCw/v
	QUsCnZjERwI+GuIMMlY9iGCtIaPCViy/YaoO4DFOLtbdjAbAyEpLBKyW72VYfNAV0Ey7qX
	PS+6eD2bSbrAt0VF/Aia2bvgMYDLKuY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-mZ-yYhXVNN-XWFYMvWLeCg-1; Thu, 14 Dec 2023 13:27:58 -0500
X-MC-Unique: mZ-yYhXVNN-XWFYMvWLeCg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67ab20f3073so114962726d6.0
        for <alex.bennee@linaro.org>; Thu, 14 Dec 2023 10:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702578478; x=1703183278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IfFxEBJpKSzArGSrfQowGClxevW3jxANuqbEn+/nZWw=;
        b=NPMVuPE0KlhfjKxkDoevyqiFNgyw6prntneHhMypVo18LhP+/pssrLk4PFlB0BDQPj
         NSv058lbmBuGdvpV85TpGqru1jTB9SxkO5ec5pmYBbhiXz7Dc5teMw9ae4q8gnCbbBPS
         30WzvpZBfzInX4i+2IJ6ZeHKuvQb0ljLDlAHrGLmgHu+19FWZi5P/G+sM1ITWYqznWOC
         SM5ybjRn1KlmiicV50EDFq1wqBRU32cfINZ3A3pV/9F7aBdwvQo1280d3lreB4tMFmaV
         WGO9lBXat4mG5XaZoTlZFXAN6UiVODmNHJtTdoIeR3z/YloYA0+4X5oqS2sZZs2S6D+Y
         ZnWg==
X-Gm-Message-State: AOJu0Yzlq293BZjm9KNQT/FhY4IdGxQu+TsG15/FDZ/ddd3+KMU1iRdG
	4Rfisp0fWBQ5Eqz8r9NPnTsbG1wNsoRqUyzrUisHFu+W5fC84cxiDUH5wKcmL3b40nrxQLCIp3J
	JaEQs/HZqKvIguja43HNDqqns
X-Received: by 2002:a05:6214:1ec:b0:67e:d89f:e392 with SMTP id c12-20020a05621401ec00b0067ed89fe392mr6840789qvu.11.1702578478157;
        Thu, 14 Dec 2023 10:27:58 -0800 (PST)
X-Received: by 2002:a05:6214:1ec:b0:67e:d89f:e392 with SMTP id c12-20020a05621401ec00b0067ed89fe392mr6840774qvu.11.1702578477918;
        Thu, 14 Dec 2023 10:27:57 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-144.web.vodafone.de. [109.43.178.144])
        by smtp.gmail.com with ESMTPSA id d25-20020a0caa19000000b0067a24f5b432sm1435529qvb.62.2023.12.14.10.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 10:27:57 -0800 (PST)
Message-ID: <1893d0ce-7c98-494f-b296-9b73f0c70a52@redhat.com>
Date: Thu, 14 Dec 2023 19:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/23] target/ppc/excp_helper: Avoid 'abi_ptr' in
 system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-18-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231212123401.37493-18-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mafvDhQc+ph5

On 12/12/2023 13.33, Philippe Mathieu-Daudé wrote:
> 'abi_ptr' is a user specific type. The system emulation
> equivalent is 'target_ulong'. Use it in ppc_ldl_code()
> to emphasis this is not an user emulation function.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/excp_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a42743a3e0..3d7c9bbf1a 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -142,7 +142,7 @@ static inline bool insn_need_byteswap(CPUArchState *env)
>       return !!(env->msr & ((target_ulong)1 << MSR_LE));
>   }
>   
> -static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
> +static uint32_t ppc_ldl_code(CPUArchState *env, target_ulong addr)
>   {
>       uint32_t insn = cpu_ldl_code(env, addr);
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>
