Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2781068njj;
        Mon, 5 May 2025 16:27:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0Wk3SQjip6WsbF72NZ/37TOUz+4ze0K0w7Rp3g2O2fEMi9EB7kVK9GV+QXRXcK3Vvj/VCuJX9Nlejag==@linaro.org
X-Received: by 2002:a05:6a21:3397:b0:1fe:90c5:7cf4 with SMTP id adf61e73a8af0-2117015b58fmr1712977637.19.1746487643082;
        Mon, 05 May 2025 16:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487643; cv=none;
        d=google.com; s=arc-20240605;
        b=A+nHwS7MbrCdkBdX1hSNlewCi00MrOO9aLDI7fPswP3sj0/sBNWjxA0KlS82kZUKOc
         NT8HVzm3juqyR4W7pijuQKtYp4N/KajuRlJU05jlPxqN5AK0rI7fT8Ppjxiyf16Ft+VM
         NuMG1sBQ2UV3j0Q2LngBj5AE+tmul45bvPa5jiHOwdxRfDg1UPRkXwgShAyOM7F4bwtB
         x0ct2Bz4tbSgQm06HFY8VCq31Mxm5mB4dbJ8gzybBPSjKRy1TVWYDImkA6b3lZd0q7Fu
         B2ZuWUxn/K3F5NDUsDf7t/c9mY/sP6fdCSolzPCYE3T2nhhx3yYoc6Ymjc7LTUJG0FBu
         GVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DColEmLeOznk74rz9KqevCsTLWb7uFfsWuQwws4WyvU=;
        fh=CzvJrex2dgFggKa07dreEksgsA/bUGZHecfFw0ScKB8=;
        b=Xi1uQYybWp7cz3qyHN00524F0ZuKi+zgfI3hQ6UMI1oQ9LRp1Yz9kSQNnO+qudyMLU
         tIImXCsXGL2KiTck5yOty53OYytVLkURjA4rzxGdGcOSrjf/DwqpXTQaIEh0qwzjx8sP
         +AYBOQ5RZNyWdTuEcJm/bETT1UAgt6FBMwuKZySVKJMNiE4wP5MlM8+S1uYjrL0RD46V
         fQs772jT/wnQA3xl9L7cnBvs3aMp0KJUsWDh7iCpiBg+CJfs1CD0JnV/uaPZr94/Jed1
         MkPtypYbQOHHMXb220Hy3bfw2WN35N4Ua/O8oNjTfzK7eMu+3Aroxr6qzU1iJPyzKNiZ
         dFEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEH00Wij;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d664c1csor4548531a12.5.2025.05.05.16.27.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:27:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEH00Wij;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487642; x=1747092442; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DColEmLeOznk74rz9KqevCsTLWb7uFfsWuQwws4WyvU=;
        b=dEH00WijDbY1QcZWgc39P1N4q/Mw94cJdoiDltZWg205uHyCdftXhMFFZ2/eMs4kfS
         nSh0qvWZk3vrOoTPMs52DexUlvrGcM8Fjy+AuxsHePKVE5jP39QuB1hM2VD3bsOD3peO
         LNABVEPLRDjHI/6siakEi6QAivQYZV7ZeStVTP2eCJkYr2B6Lg55lSqIbybAf5hX1Pyh
         OCh3RYJMZQ/H7h6+DyKH51FlNQoJaay6ct95CNvomLXHhQdI7glceFDPgF4CLPibZoWU
         Wp6Ddz4dpybDCo8UVjUZftsiMG8SrWHOZTuOLCzIS1DAP09TNZyFenGlXe2DEitkPcd3
         dv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487642; x=1747092442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DColEmLeOznk74rz9KqevCsTLWb7uFfsWuQwws4WyvU=;
        b=c/NxHDFQvv8BAGi4Hb6ctlVhrWO4GP3SQwUnB1VsBwWuNM49zrOnRilHFK3gFKLJx7
         OKHx66uXLB8kzf1TCWdduK4OsjeOa/vXUsz5DMLF25+5Rb5W4PTzUVr6ICCdKm9T42i1
         tl6qtVULkIGDkFZyvz/9moe+dWU7DnNljJjQ7xI6faHAJjD6fBT0ZolaJabuVgFG1a7/
         ipXkt68U0qe59jaPUSHpmQCtuPp76QobNta3JrxR1qXzd0NtHf5y24S3Z+26JnYItGrg
         oHVDfaYQNg4QtF1T0LkqjyJDwhdYPUPcmP4CcD/KNFFwXP8vjJ14N3GP3nejyouYHFMb
         7VPA==
X-Forwarded-Encrypted: i=1; AJvYcCUueP/st0Op1/LmaSmBUoVJ01m3bnrFSmkGWxUMw7H/Y/DYbd9Dn7TaOs0lAB6U1fcoBeQ6rbYFeZU5YQ==@linaro.org
X-Gm-Message-State: AOJu0Yw008/QWFBScTpDgZ8gKTycE/WfgDqfBdXsqxEZajeHl9UtPYkT
	9vpZlZLFpvQnRCurqiB6NDH3WFgKIGFXLmd8yO6tAujESA1ZIvBUu8gWy57G5LuzrA==
X-Gm-Gg: ASbGncv4oMxw3Adf+ehEQYxaFAf03K7SwZxlaoXkoYE1d6PQJPXrDOA+ljcyPvQsubn
	RXSD2YctbnP/gSrRBXQmz2mJOiwFjnIKqbxual1I8JtmJS+mLmi6mZKeVtky5r6B+5ml75K2dC6
	JMlLyMEWtIlvw+QO+thE3E4bXSM9Rtvsj/Q+FrxduxY5lKT5rAiIl0/Of8ewWQVKlOUjpauN9kO
	Wni+SAd+aeMnvv61YTt3PFbTSpjsAyjOcjfY6FIxCDnEgZfbwcQdV8XiwGK/gowPi/YAnmRi8mP
	fH+quPkWXvp2QtgKg+3NNaqEEc5B3IV+FRAS48RAuJaiU7WRn3XY5g==
X-Google-Smtp-Source: AGHT+IFgstfeaoCNVrbCHdFFeS0ZpKEX0NF2KwZsdipdG+8jwM/CES45trboYz2SF8VajkqqYc5+hw==
X-Received: by 2002:a17:90b:544e:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-30a7bb28833mr2046495a91.14.1746487642685;
        Mon, 05 May 2025 16:27:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f920sm9649121a91.8.2025.05.05.16.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 16:27:22 -0700 (PDT)
Message-ID: <c009277c-4777-4a80-94ed-922f40147700@linaro.org>
Date: Mon, 5 May 2025 16:27:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/50] single-binary: compile target/arm twice
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, anjo@rev.ng,
 Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: aECdbL6lLo+m

Patches left for review:

- [PATCH v6 04/50] meson: apply target config for picking files from 
libsystem and libuser
- [PATCH v6 41/50] target/arm/tcg/vec_internal: use forward declaration 
for CPUARMState
- [PATCH v6 42/50] target/arm/tcg/crypto_helper: compile file once
- [PATCH v6 47/50] target/arm/helper: restrict define_tlb_insn_regs to 
system target
- [PATCH v6 50/50] target/arm/tcg/vfp_helper: compile file twice 
(system, user)

Regards,
Pierrick
