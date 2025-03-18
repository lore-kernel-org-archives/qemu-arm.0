Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3099592njb;
        Tue, 18 Mar 2025 10:42:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0iXbKUKFpIdKezM+QfCSgKncLg6NFx0lKktS2iiEWBLuJCgIQzB8ZRcJri9mAvCtCsvomNTH3b0x/GA==@linaro.org
X-Received: by 2002:a05:600c:1986:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43d41af7144mr88745e9.9.1742319754565;
        Tue, 18 Mar 2025 10:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742319754; cv=none;
        d=google.com; s=arc-20240605;
        b=WLZzrLqtx9RQuL5l4dmKL8LJlC0TOatOFz8Iqm1DYuUIUDoC0hbDIK3I+Jc9qGIDy7
         BxFv2l8OLej/Zryo+f5Vk9dFhOQEqkrHSjlAr5IF0GPgOLAq1pp7t8dF8rLnvMYzrxnQ
         LNmZZQ5oWqX+65LYIR0p9keE1MkgXNt1qp/xFUeKQ+KEPSWnQpVZJBbSRm3fLVpZR5tN
         l+GA7bZtpdgMhDCARmh+fe/pawKLJ/3jVYfdBEEs+b/l2CvLdh9suni1tHRHYmvZlUwH
         6bd1D2AQ/IZ68FnfWgW/i79q0HJOY/FgGwVAWkVyGzYs9deqKLrAP9ngGgbhuPaPk2Jj
         4Dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=17SVMOF/Nhdsp+4dVpqTL9OX4gq5t4F3wmy4D//jp7U=;
        fh=v3NkGEL7KUpsrBkB05befBedvWtVvoGvnQsPnoSYD+s=;
        b=c4aQ4FA54CYXL6amBCENKHM6krTkTw9d3SkyuUblZdQH3ALQVtChBFXFnkUjDv25Ag
         fKVHPHbd2ESWo485PbdzqfUfLIBPxvnIdhX4EpD3+RyERqKaiHwUvzOmkhKtdmyWeeiC
         seDr7mfYt7dredHXuxmTj1gCLCsTzBYynecAfRX3bzrh28+cPbVuN8rxav2jhxE80L2t
         hGA0DlIgQCwQJFQXQf0cphoKOnuqVaZ9dkNoNdvhi6L4XGagii+LxTaHEm7u2GQKcpzM
         hSnlaZQMmCb/Baqcvx/Z67IaVMdR20dYHTrsXNMhejPcsc3ConxDXgZO6/eQ4nRJJbhT
         1RWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MOLnjtcc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d1fe553b7sor35455145e9.2.2025.03.18.10.42.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 10:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MOLnjtcc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742319754; x=1742924554; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17SVMOF/Nhdsp+4dVpqTL9OX4gq5t4F3wmy4D//jp7U=;
        b=MOLnjtccrvAAiwpgUZDq38shLqVSseNpjx7xQmY2TmLHS6RHCayz419xMD1ma7/Gbo
         H1H8jG9INFOj0k3v1vEXrivQbN97cxSWBvZBuEhSNJ7eAUbnDvR4W7JOVu47KA3GF146
         /7vL61/E7b4nDlTm1M5BRrCIknWA/5hpFn/6sJyDSZIa0jAOatc93RBmB0FhcgmkBvrZ
         XA7+cmo6F7tr22qGxArAbVDCrd4hVP8LgchbrpWf5Dg1bu7MlgP/mgBiWGtuMY3aatPC
         8nYWpq/10fYMBSKGVMNny+sMCWvhOl6Pe7tT4I29rGmRM/0G2Kum+xdP8UQ4CCKnCgQy
         IS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319754; x=1742924554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17SVMOF/Nhdsp+4dVpqTL9OX4gq5t4F3wmy4D//jp7U=;
        b=W2z1l0uzhuNSF9El3RIjbita22FvCaSM3SRpX1uVeQJKqZ1QLcYi6qm5VewxZpiepe
         X4jot0eOM5skq8ugxpanAv83dten6xDC3T7ta5qUXv1ZSJT8cOsPnfYaLbfp6w/62Pq1
         4OJnuexi+eu6xVnT2AOHBKrfdPhUksso/cHHD8tb9NFdSAXJyK3tvOa3b+8xgqSDOaJy
         /y2B0ExRwmbfzuFr0GNjESPLK59owGgFFLcBnGfys0JEGFPrTJNjoTyR3Ssopq+TmBql
         ATNeUk199YPWOCqJMu3AVN2oLnYjJNSZSa8K73NGvD7EjrnB9/wO2IR4diaT7TpRd32+
         o3/A==
X-Forwarded-Encrypted: i=1; AJvYcCUUc3worDfb5uD0leQZTu1SFeZFPo9r10GvayZBsji1hEWtxbsh1JlTYRGf+Wr3RoFZpChZ3ycjKwZy4w==@linaro.org
X-Gm-Message-State: AOJu0YzxHcTI/Qv0asGyLFcJfMl1HJCeu9QAKpPaSlZHKMhGHihH2y8j
	n2W/9D93oee4YURlIW3+dnuKAh/7WfLHjMFmQtV3C75lPO6KkpSFYFmtB9ZL2mqmNA==
X-Gm-Gg: ASbGnct/Nob5YnVvb+Qs/K3RXJGtHm/1Qut6H0HWmgFo2+wKz1z4t9UEnViVY3gB5ub
	SQXXVzE3guy1hJ7+5cQqy/w5bo2T09bN4gd66J2tOwdwLBXM7GK+QOXLTkk5Z1O/VVGQ4HEZjBQ
	WjpdH85JdvRfsOSHgebE6vfajR6zm0mzL84f8nFkBCDeP8bQP+Jj51Jags4aArj9EcfZ57y4LdM
	FcxWvk2+ux2a5ycpvv9v6TMhlC4vimy7l66oL/5UgQLdd4bvuTcMSCHHzKCMnIVg1TDs826otN0
	3sjGHByegR0rl6AkKKTDZdZ6iHokOcUXSXP470OpqKXXT/y8M7FJhcX0nlvnUxJft6qB+SeQ0h8
	dLibG4OTU71Hh
X-Google-Smtp-Source: AGHT+IHNhODWTF+JiipsrlWDdQ9MdXQw/X10v5jVQIbHnGx/mcJwin8Hy3ZzvMzwWdXdLV4Tkjm9qw==
X-Received: by 2002:a5d:6da2:0:b0:390:f394:6271 with SMTP id ffacd0b85a97d-39720966395mr18326969f8f.43.1742319753993;
        Tue, 18 Mar 2025 10:42:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm18871927f8f.62.2025.03.18.10.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 10:42:33 -0700 (PDT)
Message-ID: <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
Date: Tue, 18 Mar 2025 18:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32
 emulation
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-12-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250318045125.759259-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: fTtDAAZyD3cB

On 18/3/25 05:51, Pierrick Bouvier wrote:
> Directly condition associated calls in target/arm/helper.c for now.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h    | 8 --------
>   target/arm/helper.c | 6 ++++++
>   2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 51b6428cfec..9205cbdec43 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1222,7 +1222,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>    */
>   void arm_emulate_firmware_reset(CPUState *cpustate, int target_el);
>   
> -#ifdef TARGET_AARCH64
>   int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>   int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>   void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> @@ -1254,13 +1253,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
>   #endif
>   }
>   
> -#else
> -static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
> -static inline void aarch64_sve_change_el(CPUARMState *env, int o,
> -                                         int n, bool a)
> -{ }
> -#endif
> -
>   void aarch64_sync_32_to_64(CPUARMState *env);
>   void aarch64_sync_64_to_32(CPUARMState *env);
>   
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b46b2bffcf3..774e1ee0245 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6562,7 +6562,9 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>        */
>       new_len = sve_vqm1_for_el(env, cur_el);
>       if (new_len < old_len) {
> +#ifdef TARGET_AARCH64

What about using runtime check instead?

  if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && new_len < old_len) {

>           aarch64_sve_narrow_vq(env, new_len + 1);
> +#endif
>       }
>   }
