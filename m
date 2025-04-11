Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp307533njc;
        Fri, 11 Apr 2025 02:07:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCY5d5CNurJCezZoIXgSIO3vpAIxjQCEX6dOyfqAb4mVT0biD/tlMz8RdPNkGAGZxRpq6OiKmLdtp+yA==@linaro.org
X-Google-Smtp-Source: AGHT+IGiYPo3luYpXK4lnBNcK7KpW24PdHMEhsv+Lgi919MObdRXcw+FEXL6A5r+gbT1d7YOCdQr
X-Received: by 2002:a05:690c:6907:b0:6ef:6f24:d093 with SMTP id 00721157ae682-7055998ec9dmr36742167b3.6.1744362474514;
        Fri, 11 Apr 2025 02:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744362474; cv=none;
        d=google.com; s=arc-20240605;
        b=VkDWay2WqKftjFn0DY68Hd3LSOEhQoLXjULLAsRVLimG24sO0npvyxxu0L9JgnhFu2
         k7/DoeY+BLCOBvJMq2d4DQhLusG6Ei3dh0dm0TkYS/wVdpZh019pxnlJj9oClvcemVKx
         CW/dkyPUZrhDW1Kl1xNcXgPFreEBWnQZS2J0/QlKLPZ2+DXfSe5fRJmKureC3ujT75Hs
         nQsy6Fys0CR28yl71eHfl9PmqLL1E8SpuYt6VzkgK2i2v5pZ7oOhx8n65nPRIcszzUxG
         GfQRqeEVNsGVk7EnD2LwUGIpFiifnvLpICfdOM2hMafQInJRUF7jRNCdI+f86UbI8E6B
         Uf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=wit5nAM4wkpguINE5v7fffgRXaaImNpdDDK3jmum1PA=;
        fh=WTPorfeN8yysqI9+UYLoddPAUHa1dTEMOX5uSPqtf40=;
        b=Sp+kHH717FYTkyyapBxt+zkt9af1Imy5exPTXkmN+Wskp3bIwyCI3EVNXhByd6ojtN
         nUdjcfrJo+S3wZF+SpHEBR6L7rGi6cSuH06hvIdkhzlCe1IxnVKA9Y6ayoIXtN00K+NN
         eafT98VYL2AsFQtdgYcYVOgmyMtr8yU8Igo4xZ2Hk/3YecYAnAd8BYVSHNcZEuFJ8jHy
         AQ0QTizUjCn8ND8HgU5u+8GekqHnZh/k6HplNzjdbRqJlMvBiTxoBxikxSmapA6tfpkE
         LXFUpegMo4tRGZdGpUWHCGX70o65iMnvPkv9unF8FtyWTrHIXKZkmSEqv5VmwHa2Twa1
         3B2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FJqxLBox;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-7053e130b9bsi61719797b3.138.2025.04.11.02.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FJqxLBox;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744362474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wit5nAM4wkpguINE5v7fffgRXaaImNpdDDK3jmum1PA=;
	b=FJqxLBoxDeD0UDIyqMnFzAWuFoLaaPtFJw1VIuoYBKOvhcP+zhrecxwlgrvGwf0lk5srFu
	jzjWhtcYQJnoQWuegjFoFGsMrXGUFjba0e2F4Db0e4b3aBwzfBfvIFvLv3KNpNwFLXThn3
	8nHbFzlYM4hKuH+LtUwssTfmiRwoSsY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-POUa75FHNhqWsjFPI4ctFg-1; Fri, 11 Apr 2025 05:07:49 -0400
X-MC-Unique: POUa75FHNhqWsjFPI4ctFg-1
X-Mimecast-MFC-AGG-ID: POUa75FHNhqWsjFPI4ctFg_1744362469
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so125765966b.1
        for <alex.bennee@linaro.org>; Fri, 11 Apr 2025 02:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362468; x=1744967268;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wit5nAM4wkpguINE5v7fffgRXaaImNpdDDK3jmum1PA=;
        b=YACOUMadflHfIVReRCFNxxvf1m1bK2x99amWIs4dVqHiPu7OPQQb8/0gMuBx/4RJIH
         8BGASI7SxqO0GWa1SFgXYF+Oacy68htJB22uCX5FMdtdKNPz64g2gQSqH7/wd1TOJMsV
         KlKFyI8ydsmleJTKJKxcURGgEaQZvbS44Mduo1NFASLu5MiYmsR3B9yjCmNXjvXYrS6G
         D87NGHGsUlIpdAh2pdHvy66fFpMYK/S7zmXft0AxzveveT7YsvKi0jpgfiTGe5FBzgBg
         4Fimezu5dx/3gedCLvEDzcc4wCWXSsp6LruzwPCYEcT+NmyVSnYV/l6Q61AmwyaU18cw
         OOog==
X-Forwarded-Encrypted: i=1; AJvYcCXKK/hIu4y4r/paxU7DxOYg13BOIo/2qU11Bqd1/KAUCrdenl7+6CUXBzlvrf6oaY9aVz5v/hFmQ4zXqA==@linaro.org
X-Gm-Message-State: AOJu0YwXX85o3TdjcCMkXqbQXSqVZHHQJ3yjM9ZzaTMkB9Qz3emb44Jp
	pnkvw62T5q19z18OfiJq82oSPYQF/xZfVDT2EtU+Ub5aruVG3Tt8ixhP/qnntDVEUp/ZOUe4rYg
	8tTovN2NK1c9pgS7UWxXlkhFUyNry77b80ZSdMbXLWvMVRrnGnD87mQ==
X-Gm-Gg: ASbGncsKyt9imn5QDjoLqwE3co2dG6TdZVN/hnc2HRq0466tRyP+r3qauOiuC1OcWun
	Xx2nt95SwhGaF2FFu26FDmV6L59DJxwoJCJofPmSlJhC8q0SmlCLIaMUF8AMzIeb+oIiJxqBpX1
	UktLqmTz48mGH+emrZgUscHrVlIyXZq6l0AQqAuTnsvCIpenH0kheBptTDJE7ZkI3/s6CVU3zuK
	UxzAfQ7DlB7/8gvRysgD6HXIZiC83x9dKsTPXJ6ZOndsGl3m9ugdq1wfo0+NZ4CDhAms43XZ/AU
	W8RKm0CZcPwWyjQ01iBz
X-Received: by 2002:a17:907:cd0e:b0:ac3:4373:e8bf with SMTP id a640c23a62f3a-acad3439f51mr160070666b.10.1744362468564;
        Fri, 11 Apr 2025 02:07:48 -0700 (PDT)
X-Received: by 2002:a17:907:cd0e:b0:ac3:4373:e8bf with SMTP id a640c23a62f3a-acad3439f51mr160067066b.10.1744362468117;
        Fri, 11 Apr 2025 02:07:48 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.136.235] ([176.206.103.255])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acaa1cb4204sm410087866b.116.2025.04.11.02.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:07:47 -0700 (PDT)
Message-ID: <26951ab5-cc40-465c-88d2-d70e98bae3f6@redhat.com>
Date: Fri, 11 Apr 2025 11:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora>
 <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
 <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
 <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
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
In-Reply-To: <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y2EOmg49z3pjlq_yVRmfOlGwtPN1HvjkpL30TOqHQ6w_1744362469
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IRbTdf7v/7Jk

On 4/10/25 15:13, Kohei Tokunaga wrote:
> > The biggest problem I'm seeing is we no longer support 64-bit guests on
> > 32-bit hosts, and don't plan to revert that.
> 
> Yes, so the sixth patch ("[PATCH 06/10] include/exec: Allow using 64bit
> guest addresses on emscripten") should be considered as a temporary
> workaround, enabled only for Emsripten builds. It will be removed once
> wasm64 gains broader support and is adopted in the Wasm backend.

Maybe there's a way though. Currently we don't support 64-bit guests on 
32-bit hosts, but more precisely we don't support 64-bit guests with 
32-bit host word size.


The wasm TCG backend is able to compile with 64-bit words:

+#define TCG_TARGET_HAS_div_i64          1
+#define TCG_TARGET_HAS_rem_i64          1
etc.

and if x32 was a thing it would as well.  In fact the changes in patch 
6/10 are not a full revert, and the "#ifdef EMSCRIPTEN" could be changed to

#if HOST_LONG_BITS >= TARGET_LONG_BITS
... use uintptr_t
#else
... use uint64_t
#endif

Paolo
