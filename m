Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1154301njb;
        Wed, 5 Feb 2025 13:02:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqMxVa/BDMoVE2lJfbugosP5sE6+yz4PTBWw5ljf2bQTdBa+REjGyvlJ4T1PFm0VFFBTGFEfV5+k7AMw==@linaro.org
X-Google-Smtp-Source: AGHT+IF0QvGvFY4mgROM+oQOepgaD5iokf+HjjQcTI1oAlfv5BEsp43eIyexjbXClCB/Wa3lndeI
X-Received: by 2002:a05:600c:1393:b0:434:fd01:2e5f with SMTP id 5b1f17b1804b1-4390d56f60amr35851375e9.29.1738789377739;
        Wed, 05 Feb 2025 13:02:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738789377; cv=none;
        d=google.com; s=arc-20240605;
        b=CqAew851bf7S4zxlMP8G2BWHRJsOsVxWGWcEf/uziK6io2bLJVURBH4ck8wacqT6R7
         37G/jq5iubTpxz+RQFprvI2wx4iO8BWp6YgByEV/MUxAylGr5hD64VCbvylGCOmQwdbS
         N3W5xxgqBASQrrlPHPKyDx9Po1grii9X45tcWaJRx6tqc6VEWn5XWlz0b72HdGuA6GIa
         raf6obI/Vn0LDdFs89ouTZgptqCyCMVe6OAUST39zXAA5UiN/5DSzrCg4vYUpVB3nhOY
         TyBHLL894tSB18H0VQXmL0Dg1xY7Yl+w+ajzHejOMzaroxpwYXx5PqFBu8XrV1PGEzyh
         FMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kVTTRuKxiK4eclC7iB33EPkPJ9W261XxA792rlYhJ4I=;
        fh=Uq1a4vVzK1cmwKzOvl5w8DxUohK+NfXI1ft+u9Tf6zI=;
        b=SPFYgboqZTQbGxf9zydWrqGZS2s9PlU2sw9HQJL8R+V7mF8HPWGy91gV3aKBWOXX/r
         AG9Lywkj48rVfs8RrqMzT9hIR3QLiki/k6tE9UanLVDMK3t4Hoyk0dPkvEkTXZ2Zr4DU
         aMPOsxwy6g9J2mHN5mMqbGKKWzPJo+FE4x3IzHnmKukynwET6Oe7MnolV02HgLeV5R20
         xKuIQS9W07VxLbyp1crSjLRCbw1eRfWWPcY4yoCNdoBIUkKipBiGoTTw4dGRzB/38p9/
         S4Rt8t6RFFuynxSbg3SPpDaXIisJBIKrb9UMPyD2d1zoPkDMNJAqfrWW+Ukp9hH+NVXQ
         9EJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DZ4plyuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43913ffdd72si202495e9.128.2025.02.05.13.02.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 13:02:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DZ4plyuH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfmXt-0005HC-VU; Wed, 05 Feb 2025 16:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfmXr-0005Gh-Qg
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 16:02:51 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfmXq-00039L-4M
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 16:02:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so1312195e9.1
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2025 13:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738789368; x=1739394168; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kVTTRuKxiK4eclC7iB33EPkPJ9W261XxA792rlYhJ4I=;
 b=DZ4plyuHCk4Xj6Tq6Eb5nkUNVgU4o345nLA6CSmOQ2YunmZCPjBTHb4Kv1NEZTVbER
 MGTrahrGx9CVjPigBlne/fhrSJFMsntxVmO+weADFauy3h4sUYwZQNwaT9G+qtOYTQqL
 hyrhkYFfoR/IHFC5lwmLclo4Kx2A9WxVlvfdlLLPjwNn0ozK0hql38OuMyD8zfNTyaEK
 WWb/1OZNfWcdu2x2uBvijDYxHO2fV+5kzItDFl/qrhzJIOnlJM8RezzoXqN7wNjMtH9n
 tyJVoXp+GdNWJL9rjc71/iJFa/eJibJr3yqAgB5Bywvv1W86ROK18SoB743L87ZOAvAE
 87aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738789368; x=1739394168;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kVTTRuKxiK4eclC7iB33EPkPJ9W261XxA792rlYhJ4I=;
 b=nszmfuFfoIQFK6L82MfH+OVPsHIaKFQ7aB/w/ESlpjg5+vbEaO/6QuMilGdiBLuFYE
 s7gS5e1okRFIP9h7f73TJvRgXXzDDxktdTo3kW2Veu6NC2UepLScuPVtK+NdRzfgojY3
 /kzUhMeXSdfJ2hxUnwdhGugHgNyypIyMm94nEw4IQeKxiu7BX4zx3JUnRNo/DGs/HH5w
 GpMekJRti7QesoBkDNsdG8qNguqXyU+LjlxaMU/7R0bGxVN08hExOK8oa0R89qy2Myr4
 lH/+6YFVfl/+UZOeCYHCtw9bcKrpQ2GwbDYjvWYjyOXvCOizfktceiqhIHR5z5PD49SY
 s+2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmZWiJOE72jkQGHvMLDvzqd7PuUgXtltlwCMkInS/TxcuKdRONPBd5s5pjph38o+YCavRLXeBVDw==@nongnu.org
X-Gm-Message-State: AOJu0YykfWveD0KnBrwfXU4ETpPnTID9ldu4p/5G8BcoXxeyKVeZjDSP
 NcPqE8uKcF+XuSI4x8+FQ4X8CbU+6bzY6QtDLPr5Efn735VCz57sTNwmmtMDuVI=
X-Gm-Gg: ASbGnctW/FTXJkNuX2+pqc0M0y6E284BUvhU/awh0iaiX5gkAnOKrkXOUnzl6l2p1cZ
 Y2YTOM6kZyojEjDpcMJVGute36c9H/5t4CdRjVGUSzPuJvf/0TbEA8+8eDa2qJVmAh9wx/puyF4
 VmvfQ3lSnVQKoc4hK7hGIWItoQKmJ1hdoA9pWxeh8GjYCwT1b8kMSUNHXWCP2LHdNRYoT5dbufN
 j4aLSa7f0rPNpR5LSSQwrsVWuXsp3j/oRC+dqpJA5L3DmYX/JxdP4whp41QJt8O3erSL/A8KYts
 KPsZng9gtWRcr507nsVqVLV7kARKzHKRyYBG0GluobcifgGbq11/3iYTsVI=
X-Received: by 2002:a05:600c:4fcf:b0:434:f623:9fe3 with SMTP id
 5b1f17b1804b1-4390d43f12cmr43210915e9.16.1738789368560; 
 Wed, 05 Feb 2025 13:02:48 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dac89b519sm5559913f8f.100.2025.02.05.13.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 13:02:47 -0800 (PST)
Message-ID: <64671a22-a1d3-4d76-839c-287e5cf2390b@linaro.org>
Date: Wed, 5 Feb 2025 22:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] hvf: Add facility for initialisation code prior to
 first vCPU run
To: phil@philjordan.eu, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-2-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241209203629.74436-2-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DAqseQ03UGn2

+Igor

On 9/12/24 21:36, phil@philjordan.eu wrote:
> From: Phil Dennis-Jordan <phil@philjordan.eu>
> 
> Some VM state required for fully configuring vCPUs is only available
> after all devices have been through their init phase. This extra
> function, called just before each vCPU makes its first VM entry,
> allows us to perform such architecture-specific initialisation.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
>   accel/hvf/hvf-accel-ops.c | 5 +++++
>   include/sysemu/hvf_int.h  | 1 +
>   target/arm/hvf/hvf.c      | 4 ++++
>   target/i386/hvf/hvf.c     | 4 ++++
>   4 files changed, 14 insertions(+)
> 
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index d60874d3e6..c17a9a10de 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -442,6 +442,11 @@ static void *hvf_cpu_thread_fn(void *arg)
>       cpu_thread_signal_created(cpu);
>       qemu_guest_random_seed_thread_part2(cpu->random_seed);
>   
> +    if (!cpu_can_run(cpu)) {
> +        qemu_wait_io_event(cpu);
> +    }
> +    hvf_vcpu_before_first_run(cpu);

Could this be fixed by the cpu_list_add() split?
https://lore.kernel.org/qemu-devel/20250128142152.9889-1-philmd@linaro.org/

>       do {
>           if (cpu_can_run(cpu)) {
>               r = hvf_vcpu_exec(cpu);
