Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp546016njc;
        Tue, 20 May 2025 07:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr9Kb0hhkcxcNk3e3hRdqTHmbYpvJGpbU9ZuycTgxi+mf9litViCF+lxWwJL7aAEyuuBi5
X-Received: by 2002:a05:6214:2ac:b0:6f8:c621:5a0d with SMTP id 6a1803df08f44-6f8c6215d4cmr174941896d6.19.1747751569802;
        Tue, 20 May 2025 07:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747751569; cv=none;
        d=google.com; s=arc-20240605;
        b=I9bQlMdWGBAEDkvDyeXFiCx6hBLTY+/WCcVPAg5qhcpA4dmVhTki/LeN5a7gZJAyGm
         fGs2dTtoowGmD4XhdGmWPJaVrtWmGFesXhljdS11fQ5FQTfE3n/FvmeYcTSb83E0gVZd
         TiS+052fmD5CzNRAuVubSgHBJIlpWALSNP9aJ0QelCEsdcVap3ACXWf1Mom2Le7E1Y8W
         LHsaeF3+PF27zZ702SbsYa/iVWnle1tHozpgoOYoBBv5KoEDi8+rjLwtduZkkevTel9N
         AOBtAPjBKlCGwSb75pVXQx22SB+uZBfZbDln2SoaSgGbDug2ytCaBZlsmTIIR177+ox8
         DV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=eyyKewFowLGN6weCf+HOMRYql1fcCQIkABOVNAcjl/4=;
        fh=1V1RvP6TsBXNjGvdtzpmIZYZE5MFhFdFCJDUVbiAOLs=;
        b=bAQLpzXJZsZNgTeloLDVNF+xNdWNdeKR2MDotctKU5IzJB87MCxgaw/ivTXx6vgKrG
         G45eL7iyAlsGoPINZfStRmN57fjs9koMZaEHZu6Kxts4QyIr1icxT9U7wY/iZhTjhWsn
         Mwz8r0KoZF9HXy44Da4PScOR5y87WNfchmxuHlK9olVp4hvg2HpKicz8RTrZb7n5ppAU
         7B7xPAkaFmA0B4bUMcJCr2AlsetZQHVW9JD1quR5TI9b2N7cu4/I2CJszo93nkiEB9UP
         3uOaQjXKqUUNzrK3G1/Edds6j5d9o2xiebLhgaPZfvW8hXk/nwUanD3A7NTIFMpe4JGn
         ZUDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5jZRK4b;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8bc30467csi90289286d6.351.2025.05.20.07.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 07:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5jZRK4b;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747751569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eyyKewFowLGN6weCf+HOMRYql1fcCQIkABOVNAcjl/4=;
	b=N5jZRK4be3uB674rg7X+QFWSPzhx5uEsIjhVdbU0iYMrimeG7/AZjwBR799Bi4qyBUGar0
	oyb8YY17JZaelY1Uk/g+mh5DasV5tk+Ww8blCHORHFZgvIK4tKx5rB0EZt1/z75D2I63ZN
	91hAIJ9ig5LHb1jWgH+or1Qn5iRC5q4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-ImkUYg0GNyGPiBPGff-8HQ-1; Tue, 20 May 2025 10:32:48 -0400
X-MC-Unique: ImkUYg0GNyGPiBPGff-8HQ-1
X-Mimecast-MFC-AGG-ID: ImkUYg0GNyGPiBPGff-8HQ_1747751567
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-602047ace12so1233386a12.2
        for <alex.bennee@linaro.org>; Tue, 20 May 2025 07:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751567; x=1748356367;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyyKewFowLGN6weCf+HOMRYql1fcCQIkABOVNAcjl/4=;
        b=KzFqpljO6H/1/wpkgNZQu0O/FK1UY3YmIuxOz7LSpgaWNkgeoopcjjPCsM372jD9+u
         xhlZYOX3K0dgmBmvYDplzOhXggqu1GBDXxlPXNwJHZRdB0Ed7bWQ79DPjke+F14x68Fz
         fv7bmPaDSmrcdLTuNyXe/zuva125jy/xCT+n0KmXYCT0zpf8AVvoGrfgA53gdyfx/Zym
         KiOabeWZZKEuBUMVpMp71cnDCO4OCk9otpUAJ98Pbgv2uITScXrNaemJi6ixxLS+IhGi
         AKMd0WylJ7pnQCy1Bm7JykhrjMCYX8BdGPsq4FUgH9Wwe8cxeljfr0kAlwQOb4c2xfmA
         hhIg==
X-Gm-Message-State: AOJu0Ywrs7WwAR0G8bvrsmr/pxgy74o/8tuC1sBODIvFkDp56YAxS0r/
	b4Wgh4YGFk17Rv0LeLmn+Tm/adxyHxA+Mu33m7nV7/xC+V4sFRtsHD2hJUSS/VkDvKPKHv59lKK
	i53XTX8vOnwBRCk+EGWt2Vxbzd75/Nqnf5LN55SwV5FCdwHtT7K6+iaRpdQ==
X-Gm-Gg: ASbGncstCX2m7n9BuQZfJAUJbBMCPccSUa9Un1GsYJP28jTAI1K7j/x3Zau5EL7uahz
	0H5KuWYM4zNNJ8HDXOe69Ue+S0/Ve9S0W1FhVvuoP/RedYZwiYQUIk57Nht06BkVN3ZhcuD2EaZ
	abdnH7RFSY2f58Qya0YHDakiDv7ewNxjAaQdxng0brOH7beviqYJPSYJSZV1bVq4nwkhWpOImqQ
	NdDZ7wbHVEZtHezo9heXHcwBAk9V8HnihjtMY/Z2ExTsf42HTaBsCmRgfCEzZ8sJxRKMFWjMMRq
	+Oe7FFrLUamiEw==
X-Received: by 2002:a17:907:e915:b0:ad5:1e70:7150 with SMTP id a640c23a62f3a-ad52d443a03mr1562848466b.2.1747751566973;
        Tue, 20 May 2025 07:32:46 -0700 (PDT)
X-Received: by 2002:a17:907:e915:b0:ad5:1e70:7150 with SMTP id a640c23a62f3a-ad52d443a03mr1562843466b.2.1747751566513;
        Tue, 20 May 2025 07:32:46 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.81] ([151.95.46.79])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad52d278247sm732727166b.76.2025.05.20.07.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:32:45 -0700 (PDT)
Message-ID: <5d54270a-51be-4462-a02d-a12432e42be4@redhat.com>
Date: Tue, 20 May 2025 16:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/33] include/exec: Allow using 64bit guest addresses on
 emscripten
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
 <d3e7e584cf61c76952f4c9d913ba80d905c80e76.1747744132.git.ktokunaga.mail@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
 CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
 hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
 DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
 P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
 Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
 UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
 tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
 wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0j
 UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT7CwU0EEwECACMFAlRCcBICGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRB+FRAMzTZpsbceDp9IIN6BIA0Ol7MoB15E
 11kRz/ewzryFY54tQlMnd4xxfH8MTQ/mm9I482YoSwPMdcWFAKnUX6Yo30tbLiNB8hzaHeRj
 jx12K+ptqYbg+cevgOtbLAlL9kNgLLcsGqC2829jBCUTVeMSZDrzS97ole/YEez2qFpPnTV0
 VrRWClWVfYh+JfzpXmgyhbkuwUxNFk421s4Ajp3d8nPPFUGgBG5HOxzkAm7xb1cjAuJ+oi/K
 CHfkuN+fLZl/u3E/fw7vvOESApLU5o0icVXeakfSz0LsygEnekDbxPnE5af/9FEkXJD5EoYG
 SEahaEtgNrR4qsyxyAGYgZlS70vkSSYJ+iT2rrwEiDlo31MzRo6Ba2FfHBSJ7lcYdPT7bbk9
 AO3hlNMhNdUhoQv7M5HsnqZ6unvSHOKmReNaS9egAGdRN0/GPDWr9wroyJ65ZNQsHl9nXBqE
 AukZNr5oJO5vxrYiAuuTSd6UI/xFkjtkzltG3mw5ao2bBpk/V/YuePrJsnPFHG7NhizrxttB
 nTuOSCMo45pfHQ+XYd5K1+Cv/NzZFNWscm5htJ0HznY+oOsZvHTyGz3v91pn51dkRYN0otqr
 bQ4tlFFuVjArBZcapSIe6NV8C4cEiSTOwE0EVEJx7gEIAMeHcVzuv2bp9HlWDp6+RkZe+vtl
 KwAHplb/WH59j2wyG8V6i33+6MlSSJMOFnYUCCL77bucx9uImI5nX24PIlqT+zasVEEVGSRF
 m8dgkcJDB7Tps0IkNrUi4yof3B3shR+vMY3i3Ip0e41zKx0CvlAhMOo6otaHmcxr35sWq1Jk
 tLkbn3wG+fPQCVudJJECvVQ//UAthSSEklA50QtD2sBkmQ14ZryEyTHQ+E42K3j2IUmOLriF
 dNr9NvE1QGmGyIcbw2NIVEBOK/GWxkS5+dmxM2iD4Jdaf2nSn3jlHjEXoPwpMs0KZsgdU0pP
 JQzMUMwmB1wM8JxovFlPYrhNT9MAEQEAAcLBMwQYAQIACQUCVEJx7gIbDAAKCRB+FRAMzTZp
 sadRDqCctLmYICZu4GSnie4lKXl+HqlLanpVMOoFNnWs9oRP47MbE2wv8OaYh5pNR9VVgyhD
 OG0AU7oidG36OeUlrFDTfnPYYSF/mPCxHttosyt8O5kabxnIPv2URuAxDByz+iVbL+RjKaGM
 GDph56ZTswlx75nZVtIukqzLAQ5fa8OALSGum0cFi4ptZUOhDNz1onz61klD6z3MODi0sBZN
 Aj6guB2L/+2ZwElZEeRBERRd/uommlYuToAXfNRdUwrwl9gRMiA0WSyTb190zneRRDfpSK5d
 usXnM/O+kr3Dm+Ui+UioPf6wgbn3T0o6I5BhVhs4h4hWmIW7iNhPjX1iybXfmb1gAFfjtHfL
 xRUr64svXpyfJMScIQtBAm0ihWPltXkyITA92ngCmPdHa6M1hMh4RDX+Jf1fiWubzp1voAg0
 JBrdmNZSQDz0iKmSrx8xkoXYfA3bgtFN8WJH2xgFL28XnqY4M6dLhJwV3z08tPSRqYFm4NMP
 dRsn0/7oymhneL8RthIvjDDQ5ktUjMe8LtHr70OZE/TT88qvEdhiIVUogHdo4qBrk41+gGQh
 b906Dudw5YhTJFU3nC6bbF2nrLlB4C/XSiH76ZvqzV0Z/cAMBo5NF/w=
In-Reply-To: <d3e7e584cf61c76952f4c9d913ba80d905c80e76.1747744132.git.ktokunaga.mail@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a76zCVmNLLtXUcVn4NBj-saXvZYOgcuzfvpgB5vnRDU_1747751567
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: eetUk5pIrnk2

On 5/20/25 14:51, Kohei Tokunaga wrote:
>     target_kconfig = []
>     foreach sym: accelerators
> -    # Disallow 64-bit on 32-bit emulation and virtualization
> -    if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
> -      continue
> +    if host_arch != 'wasm32'
> +      # Disallow 64-bit on 32-bit emulation and virtualization
> +      if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
> +        continue
> +      endif
>       endif
>       if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
>         config_target += { sym: 'y' }

I'd prefer something like

# Detect host pointer size for the target configuration loop.
host_long_bits = cc.sizeof('void *') * 8
tcg_vaddr_bits = host_arch == 'wasm32' ? 64 : host_long_bits
...
config_host_data.set('TCG_VADDR_BITS', tcg_vaddr_bits)

Then in the target configuration loop

-    if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
+    if tcg_vaddr_bits < config_target['TARGET_LONG_BITS'].to_int()

and throughout the code you can have

#ifdef TCG_VADDR_BITS == 32
...
#else
...
#endif

instead of

#ifdef EMSCRIPTEN
...
#else
...
#endif

In fact, I think this patch would be acceptable as a separate 
submission, because it could be tested using TCI already.

Paolo
