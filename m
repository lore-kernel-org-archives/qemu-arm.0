Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7720190njd;
        Wed, 9 Apr 2025 06:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/Af27pMALaH/Enl23TjyXwz01QtRWp725EhZDyxZ6c5+JccK9KrUBe7qOA29E6yK7R6JD
X-Received: by 2002:a05:690c:60c7:b0:6ef:57ad:9d6e with SMTP id 00721157ae682-70538816743mr53186657b3.15.1744205721002;
        Wed, 09 Apr 2025 06:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744205720; cv=none;
        d=google.com; s=arc-20240605;
        b=eOQhh9EWbz4XlFRuh3oqbsRMViIVhCOoiycuxOUISn3W64I8H6KNvF96xXE1RqxNCr
         05JbT70Sks8hUikUubV9Q58W6FgGDdQ6pLfz3ZV1Suj5EdmLxkr8hmQtT9E9RTCYzWNx
         fAsFxhBe9RvevIxidnFpKLQVHdrDYThlRK9C2a0JODEnMM8L9ythTfe23WUYC53J9TvX
         7/Nhdktzl8LHxuFAJtFQTzqiy4ICxf12lP2zvtGP8xN0+ZOysFU5ijKnmuoS5c0M2y9t
         eOkUuedwIWxzjlHNwWR2e9bdJ2sbexqfK29++tKC5KYOaF8y7ZaNzL4FEH9Jc+Ar1pzV
         yTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=1TMoOKh1qF7O83Nj4d6TCIOVoyS54jKotwsf9ZbPvoA=;
        fh=il79Cl/g+2VHFwcnjQL5i94RGv7izKT2/8O/GiHWbOs=;
        b=hwv6vfz2SUZ2aWW+h0xXtCCMENUmiBDkvA8Zjj2jMsVhqQB7uzRMApFDk5nTnfgxaK
         JIfULxl3nrdRNfXMaZEi7RIA4/uUSLLQvPmb9S4iu8PCaCZDoFi8MfCARUgZF98X8tkW
         Qo+k1Sx0mlSBldsUAv3ZrzyU0NvKDUIxEbgLpvfJyoZrNO69cQ9ILA+mpfDUb3QJ7IoU
         clmfrfXzyxl6mzK5jLgsZJSioxrWOn+DYy2jMU3xo2DIchwhgHT4RVDH7UYq1km94Yo1
         X7Llva7SPhcFUdJIZz4csdqtdkIhjBeYlGHSf580ovXMlkntRBGoB7yvMduoin6HjOtx
         vbcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ReG7Mit0;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-7053e34a4cdsi18857027b3.320.2025.04.09.06.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 06:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ReG7Mit0;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744205720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1TMoOKh1qF7O83Nj4d6TCIOVoyS54jKotwsf9ZbPvoA=;
	b=ReG7Mit0AwYjuZPIhwue8ux8iefDFUynIY2Z36NEJ3ti3cikYOuY9szh/tSTUxN5k9IMJ2
	OMr4CfjeQIYK0eMLhOHZfMga82KpKoY1auWUNOwaYl64XgPmcRo11oeq4bH58jdosuTjeX
	3tTL4YnSI4t5+ZnT0Pu17EODvnivkJQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-JC_UDwqMNOGwDv75lgq35Q-1; Wed, 09 Apr 2025 09:35:19 -0400
X-MC-Unique: JC_UDwqMNOGwDv75lgq35Q-1
X-Mimecast-MFC-AGG-ID: JC_UDwqMNOGwDv75lgq35Q_1744205718
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so35231905e9.0
        for <alex.bennee@linaro.org>; Wed, 09 Apr 2025 06:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744205718; x=1744810518;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TMoOKh1qF7O83Nj4d6TCIOVoyS54jKotwsf9ZbPvoA=;
        b=ldGvaopIS2KNHiv/lYMZ//VbbbZRYMwGNYrxUVvyGzCaVu3imOMB+rh2Y+BNavWPRM
         X2liUU0hNfEPEdTvZ3WeUEvJ6nUcqkd6iYUfen2n27zhW+W09JiIR3BvYzMa47x0qt8q
         hPsP6f/N/fg0SNfBipTYwBQsmkMozcDACvwYnu0orC4z0l5wv1v6ega9lDumZKNEhXjf
         EJMVqYWR8ndh6YlGB7JtaG6cI43BZSXYXJjv7EsFdq2x0wEtkzGZE/i0dz8rY/BO6d28
         BI7qCBPgtt4gZRidPIJvDc3w+VgoRl6m3O4eCse2dB8R2m2Q7nN140FXxPSvVJQ8TcTS
         Uaag==
X-Gm-Message-State: AOJu0YzfWxrrW3zTFeDFpEcc0N6YUDwq/kuokFL8EYmlbq91zPU0YbYO
	88sI4cbIlXFpptCFXb54dM+9uI+8Xi+S+ruv2ChCyVnNDc9wbvwe7dQ49/PsVxAqyygMtXAPHAR
	K7PqKCQziR+Pm560Jw6JG42nKnpvfQs9r2fbYUYnniPwr2TyavQkwMw==
X-Gm-Gg: ASbGncsqHQKM3JdiWbKGMgsf1j+LKWElw9+6usqnd8mKdmz/1WR0G+gUxMGpHpSm1ga
	1ByliC9L6kqNje0qnWui3bzsL+fxPD/jZlMdVNg7tUr0joevvN+FIf7K25wp/8UTqOGs7tklTUp
	6v+Lc0mBJsf+euYzVPyEdaGa6Lzq/WbgByrpuAIUfKefLPVut9w/Cq6WZgIHYmK8P+kMBBMRi26
	UTaIypA/4gxRMRs2C70Fk4aOCjlGP1PPTSjm80H7KgqJprx4VhYZX9m8dRMUFOVX6nsxK0xrACJ
	eiWuUM8KL4+ytcvaKQ==
X-Received: by 2002:a05:600c:1f16:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f1fe01880mr25224435e9.13.1744205718163;
        Wed, 09 Apr 2025 06:35:18 -0700 (PDT)
X-Received: by 2002:a05:600c:1f16:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f1fe01880mr25224085e9.13.1744205717804;
        Wed, 09 Apr 2025 06:35:17 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.48] ([176.206.110.254])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d8938b5e7sm1703373f8f.55.2025.04.09.06.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 06:35:17 -0700 (PDT)
Message-ID: <671805c9-f802-412b-998e-ba83719f1e72@redhat.com>
Date: Wed, 9 Apr 2025 15:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] meson: Add wasm build in build scripts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
 <e0dcc4e6-1e8e-468f-83e5-36ffb014eeef@linaro.org>
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
In-Reply-To: <e0dcc4e6-1e8e-468f-83e5-36ffb014eeef@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AsI8cdymOVbTZMDeoi-zEqvLwZUGXK1kPGijy8Qmyrg_1744205718
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /TJVAUClkFBE

On 4/9/25 12:55, Philippe Mathieu-Daudé wrote:
> Cc'ing Pierrick
> 
> On 7/4/25 16:45, Kohei Tokunaga wrote:
>> has_int128_type is set to false on emscripten as of now to avoid errors by
>> libffi.

What is the error here?  How hard would it be to test for it?

>> And tests aren't integrated with Wasm execution environment as of
>> now so this commit disables tests.

Perhaps it would be enough to add

[binaries]
exe_wrapper = 'node'

to the emscripten.txt file?

>> +[built-in options]
>> +c_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
>> +cpp_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
>> +objc_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
>> +c_link_args = ['-Wno-unused-command-line-argument','-g','-O3','- 
>> pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','- 
>> sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','- 
>> sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','- 
>> sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
>> +cpp_link_args = ['-Wno-unused-command-line-argument','-g','-O3','- 
>> pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','- 
>> sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','- 
>> sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','- 
>> sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']

At least -g -O3 -pthread should not be necessary.

For -Wno-unused-command-line-argument what are the warnings/errors that 
you are getting?

>> +elif host_os == 'emscripten'
>> +  supported_backends += ['fiber']

Can you rename the backend to 'wasm' since the 'windows' backend also 
uses an API called Fibers?

Otherwise the changes look good.

Paolo
