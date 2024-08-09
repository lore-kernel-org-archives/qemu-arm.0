Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp768485njc;
        Thu, 8 Aug 2024 23:34:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVMkPGlw00md4RoaifaexNFFtlvS5813UNHwQdvztezJxjQXKnxubbYeWDrrwNg0xGYtiApQ/Tw5bb2l8KoKBkBYheA4Hi
X-Google-Smtp-Source: AGHT+IGGEkthgiwPTp2cZ1zGLeeyk2D7hR/KUHrSuic8wzSDYDB5Mre4PjIoFr7TyX1LUdGVp+FC
X-Received: by 2002:a05:6214:3d87:b0:6bb:ab23:cb62 with SMTP id 6a1803df08f44-6bd78b4b781mr8168876d6.0.1723185266562;
        Thu, 08 Aug 2024 23:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723185266; cv=none;
        d=google.com; s=arc-20160816;
        b=L08hLWo19/TOJrymsXOALDPolUDlX57lwLCBXMp+ZHztYj+weywwTg0+z3aapt6Phe
         ItuJAhuBl1MvPDPlMbe4h1P80rebQFw7BEcScpz2GrwPTk8XWpvc4wB8dQGKCVZfVOK+
         ZvKUTCReVwl6t9V2nkoYDkSG/ULWiKjYuxCeEWBGWtUQoR2zdfrV2XDVAU81q/Oxo4nj
         VlvD2Zd0PUxRvvmow9+A+banQHNNCIvTXUflH3bRBw1hFruRP1YnL5XuphBfe/h++mwW
         BXIGF63IkNuStxuE/Cmv7vgPWKsZ1LRb439c/50B0z00gnjNU0BU+zKYp4JGvGNg3m1M
         9l2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=aWhjt7X4MTowtjf59Y/8PYwbiF6bpWk82d01GesD3eU=;
        fh=HgowoNZ1+z0322qSgl4TpzD5TwZX3oZ7vE661BqXB5w=;
        b=SmUgeaKhqSXvVOe/nHvZw3XDGu9RUtNw5lmELG+PrbGqmdtjEJdZjdcHYLGsO2vT+s
         0jnDMwvEmA/18KbFa28mzxOv99u8EUM30fwutoya+BANZ5LQ6DSHbo6bGEXIVaqgT9D9
         ZGt+M+BZSbfYnWqfzMzDTXll+5LeyrmqOLaYw+dSHtISDLnx9FF5mvbzWWqxPUGyTPbU
         hKaHFT6wDrDskFxbzZK+AWuU5wgpI5EVQjFXTHvDV9gDiSdH8kJiioO48GGqVCGuEEsu
         iO8DuCXhgOfRV6fbtH1LgWUYO+XTLqTu2jPrQc/wkcZiQbL+1aj/LouokNKvbRzqm1D5
         cgPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AOKInpUI;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8eed58si61467296d6.332.2024.08.08.23.34.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 23:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AOKInpUI;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723185266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aWhjt7X4MTowtjf59Y/8PYwbiF6bpWk82d01GesD3eU=;
	b=AOKInpUIhzskCRoYoqPfc5xIYA6LlzqHOhVQQUD5BnwAbJultCfsP3D/XHHspl/N0SZl43
	z2pAAeNK70q3Wmh+791UFEyFt0oYa/1RPIEGzLWMAOkbQnZXuBJxLZjmTdkhckez2OI9/1
	QjuedPh8hddnalNXFHRHXuuN66PCXfM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-uURHAX6WOmiDRReoGOmUtg-1; Fri, 09 Aug 2024 02:34:24 -0400
X-MC-Unique: uURHAX6WOmiDRReoGOmUtg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7ac41d26e7so242416766b.0
        for <alex.bennee@linaro.org>; Thu, 08 Aug 2024 23:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723185263; x=1723790063;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWhjt7X4MTowtjf59Y/8PYwbiF6bpWk82d01GesD3eU=;
        b=BMqMOUqbfUrEkz2V+E5r92mw4g4P3ya9/bfZ0SHiMhviyCJ/eaGCMWeLdCMG9Ma5kb
         wcpGVuyFhk+TVcqs+YRTTq14SFjIF0BDD6KzjGHPsyJ2ucKVc2mWqnQ0EX3POaV79qwS
         1q80V1IzKoiBZJJ4nN5Aeuocodi8MXreMYXQlLLh1qc8+mNstio+mxSWodVMl57rrOk7
         TKiqR+M/nU6U0cuXtlvq5/24tp62IVVZFmZpo80y11sNJnKhKtii7/5Ia1IEstj50G0e
         kpe7ID6fSrrMpgjDzAVV9/lxf+uKyXIYAkHXq0pHHWmiRfkxLyJkAnFJvc7xA+t8ycNe
         9P+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrSiRbHljKXAo955MVyYxv+uzdjLBSkor7SRc+KBSxWJ9vmMyEmZuEaLsOGm+NKdSeONfnLsvBFsQUmdXogOMWYTQ2ip4G
X-Gm-Message-State: AOJu0YxacfUiyWReigmg6aHZFlaLY1aAdyqQmfBRGynTB9BMVOCjMe4I
	gu8sUGVvln6ARbYtoGPx2ZCgYROVhzgZMSrZfilhR9Hj1ikUyn3Ayl56UWFi6IhqBlHlt9OIPpQ
	kxP6ESFe3zcBB/TJ9Hc3IcTtfRXz/gm+YzdTPs5lMAAozHmdIOgOqkQ==
X-Received: by 2002:a17:907:7ba1:b0:a7a:8284:c8d6 with SMTP id a640c23a62f3a-a80ab958547mr40030966b.24.1723185262887;
        Thu, 08 Aug 2024 23:34:22 -0700 (PDT)
X-Received: by 2002:a17:907:7ba1:b0:a7a:8284:c8d6 with SMTP id a640c23a62f3a-a80ab958547mr40028566b.24.1723185262324;
        Thu, 08 Aug 2024 23:34:22 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.3] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d437dfsm818340966b.133.2024.08.08.23.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 23:34:21 -0700 (PDT)
Message-ID: <96cc6b27-751c-4420-b661-871a09aaf316@redhat.com>
Date: Fri, 9 Aug 2024 08:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/23] scripts: add script to generate C header files
 from SVD XML files
To: John Snow <jsnow@redhat.com>, Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com,
 alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com,
 philmd@linaro.org, crosa@redhat.com, bleal@redhat.com
References: <20240805201719.2345596-1-tavip@google.com>
 <20240805201719.2345596-4-tavip@google.com>
 <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
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
In-Reply-To: <CAFn=p-abeXP+dUtp_gwH3dcD5DT-sTAFg=udVugrzcU1r8fXpA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 202Kw5lwAT0V

On 8/8/24 23:56, John Snow wrote:
> I haven't read the rest of this series; I'm chiming in solely from the 
> build/python maintainer angle. Do we *always* need pysvd, no matter how 
> QEMU was configured? Adding it to the meson line here is a very big hammer.

In general I'd agree, though for a 7.5 kB package with no other 
dependencies I'm willing to make an exception.

The alternative would be pretty complex:

- check if pysvd is installed in the host

- check if a machine type that needs pysvd is enabled, defaulting to y 
or n depending on the previous step and --enable-download

- use that to decide between doing nothing, installing pysvd or erroring out

- pass the availability of pysvd to Kconfig

- use that to make the final determination on whether to enable those 
machine types that use pysvd

This is quite obviously overengineered compared to the alternative.

Another possibility is to ship the generated file, skip regeneration if 
pysvd is not installed (on the host), and not touch pythondeps.toml at 
all.  Whether shipping a generated file is acceptable should be decided 
by Peter as ARM maintainer, personally I would go the way that Octavian 
is going already and I'm mentioning the rest only for completeness and 
education.

However...

> We also need to provide a way for pysvd to be available offline; some 
> packages are available via distro libs and if this package is available 
> for every distro we officially support, that's sufficient (but requires 
> updates to our various docker and VM test configuration files to add the 
> new dependency). Otherwise, like we do for meson, we need to vendor the 
> wheel in the tree so offline tarball builds will continue to work.
> 
> It looks like pysvd is a pure python package with no dependencies, so it 
> should be OK to vendor it in qemu.git/python/wheels/ - look at 
> qemu.git/python/scripts/vendor.py and consider updating and running this 
> script.

... this is indeed correct.  It's not hard and it helps building on 
older distros.  Future versions of Debian or Fedora might package pysvd, 
but right now it's not included anywhere 
(https://repology.org/project/python:pysvd/history).

> That said, you might be the first person I've seen outside of Paolo and 
> I to brave mucking around with the python build venv. You deserve a 
> bravery sticker :)

It's not that bad, come on. :)  But yeah, I'm positively surprised by 
the effort to include pysvd in the virtual environment, and any 
suggestions to improve the documentation and discoverability of the venv 
setup are welcome.  I'm curious whether you figured it out yourself or 
found https://www.qemu.org/docs/master/devel/build-system.html.

One thing I heard from others is that pythondeps.toml looks "too much 
like" a fringe standard Python feature that no one has heard about.  In 
some sense that's a great compliment, but I can see how it can be a bit 
disconcerting.

Paolo
