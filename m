Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2853167njc;
        Tue, 5 Nov 2024 06:19:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlCPkBvIcYvxpBDiAd5yhhORDRfO3UGr/7NgEvjrTNNy7veN2eqziZwj/24CwsYexlo+UJItcRb7Yr+w==@linaro.org
X-Google-Smtp-Source: AGHT+IG+RXCxOVKCuAO5ph+HRr3uU0msGk2aDNG/fIeJXXpVeK4xA9q5QRAAWdaasW9G5qtDk2eU
X-Received: by 2002:a05:6358:d398:b0:1c5:e393:f60f with SMTP id e5c5f4694b2df-1c5f99fe2e7mr631669555d.18.1730816379076;
        Tue, 05 Nov 2024 06:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730816379; cv=none;
        d=google.com; s=arc-20240605;
        b=bG6yPfwnX+Nlzu/bAY+tyf+FL225ZZr3ce6fL1CqCv41Zo5C3nIa6ASEABhvNEeuE9
         b2SFZ0eBwQrmJUAksUV3OpAr27lGbLEqlROTJtxTb8jWH70Jv8WhhGaRSZZSYhJgQpMN
         Tlor1t2WKUfjGphZ1P8XyMOLhT2uX1+rHeaup+2LwjhjgOJjy69bxRnxI5jqXFN/pwjF
         R3Sh3wsxsevEvOexcAPI8/cH42iCgp71yWC6dh8eIn/vuRCx6YAEyuUxg5OMMsnYYnzq
         GbP7IUlEuRH1wn2UewlVAyJl0+skRwSkBDzZQz1fsxm0Mj1jLltC2XQceSxugtEFwpaE
         hgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=N2nlu233cwqrEjQLxq1CdJEMNFrjZAKLO6cV72d2YWg=;
        fh=/mJRGurPLyh5tKl16yVC40nmmjr7TzdSFVENd7iQ8h8=;
        b=akQGHdrtTRLrXyugDMTUBnAdSwUQRUT6yuVYcPyZ5E8V16lnby2tM8iIngp7WNxCiW
         lOne3JTemLBoM3avu0hksMT0llPk1qeXQOH5RoDwPpsiWa/6USFv7RZnrtdX7nN5wPMs
         YesyGyt4BE743Rdjjol2tJjp6lfFBJOHRofrRZK5EXrL5hpTmngaQQdBlzDo/AeFTNlN
         /xJChUv8GOuvNE83DLlEl9S1Zj7L4Mwcg7mMcrne9CkkaZaZVPnkFIIYP36e0h54Z665
         VYE8MxbOGd9iOPmeJP7jsMt8yNKm2iKGJA3P5eM/4NwdoT5y4VH23teRML0XhGhJBFew
         c3NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D8HoX8pw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-855dad5316asi2626263241.36.2024.11.05.06.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 06:19:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D8HoX8pw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8KOd-0002mO-Lk; Tue, 05 Nov 2024 09:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1t8KOb-0002lk-QZ
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 09:19:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1t8KOY-0004QM-EL
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 09:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730816336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N2nlu233cwqrEjQLxq1CdJEMNFrjZAKLO6cV72d2YWg=;
 b=D8HoX8pwdtBydw7T+8uFc031NviqwjP9L/DhZjN1wmaiW1D38flpwXqasE1KL1S3OHAcrQ
 BbPZBZ8+dnw4kLhLgpko8xu1a9e/sLdo09x6Nf703XZ8VGb+lW1kJYMGqvj6BpsJzl8hY+
 vF6tBHoLC/9Hrm+Fa+D5mbm0ROAZTUs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-Cv7IbE1_N52s8bLZPLcz7g-1; Tue, 05 Nov 2024 09:18:55 -0500
X-MC-Unique: Cv7IbE1_N52s8bLZPLcz7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-431518ae047so36018085e9.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 06:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730816334; x=1731421134;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N2nlu233cwqrEjQLxq1CdJEMNFrjZAKLO6cV72d2YWg=;
 b=ZvvgGCkp0uSAhKqbe43Mk6OOTKX6bLBKjM/zs6gyLXohtGr9rmovTJLreqQ8O5hQ7s
 PQtZxTPakuThI+SUJbk3pE4zXTEcfz/Il20K75N/SDbfxFYzNmk9sj+MdWvik+0R9HJw
 3uuizJOosiKvJqEKqHcDu8AECzp0AirOSHESWvBu9ktw3/jn1sGIO5AeTHtGLt50TW6s
 QWfc6c1uipoMxsSKwibgCvYwePdLK2XXcSkPYu9AumW5s7BFQkAsHFycLT1FBn6lUJ0C
 ecS9n8LZ6ndMbGTzKNeQmRyOUZzFq6efX9O/zM2/HiyH1xGp9swp/m2iM4nHdVzFE4yc
 cFjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/Y5HQcCEdBdxb5vsbiRjY3fmZ1dbXyB7frKcUAs54EecOzAGoQkjis0IiHKlJS5Szfh1v2sGnvQ==@nongnu.org
X-Gm-Message-State: AOJu0YyDteT+3M9PylbPeOD2f7im0WU41121TOBfTNrWzTAGhH56dqMo
 hFwwup01QG6LMXlHD4wuZem5uIGyEvuvXRAX8Z/K3pYi38i7oDxcM98jNWvanec737nh/v0fbDj
 J07bPdCN2sLb5GSvjj7V2PcpgumCBeB3HwDanbxoinUJ8kKAufA==
X-Received: by 2002:a05:600c:3b93:b0:42f:84ec:3e0 with SMTP id
 5b1f17b1804b1-43282ffedf3mr140804125e9.9.1730816334323; 
 Tue, 05 Nov 2024 06:18:54 -0800 (PST)
X-Received: by 2002:a05:600c:3b93:b0:42f:84ec:3e0 with SMTP id
 5b1f17b1804b1-43282ffedf3mr140803915e9.9.1730816333934; 
 Tue, 05 Nov 2024 06:18:53 -0800 (PST)
Received: from [192.168.10.28] ([151.49.226.83])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4327d6983c2sm195472605e9.42.2024.11.05.06.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 06:18:53 -0800 (PST)
Message-ID: <eae65cf8-af71-4b6d-8bfb-b22224f8496b@redhat.com>
Date: Tue, 5 Nov 2024 15:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] hw/net/xilinx_ethlite: Only expect big-endian
 accesses
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-13-philmd@linaro.org>
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
In-Reply-To: <20241105130431.22564-13-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cEjSOKYjL+cH

On 11/5/24 14:04, Philippe Mathieu-Daudé wrote:
> The Xilinx 'ethlite' device was added in commit b43848a100
> ("xilinx: Add ethlite emulation"), being only built back
> then for a big-endian MicroBlaze target (see commit 72b675caac
> "microblaze: Hook into the build-system").
> 
> I/O endianness access was then clarified in commit d48751ed4f
> ("xilinx-ethlite: Simplify byteswapping to/from brams"). Here
> the 'fix' was to use tswap32(). Since the machine was built as
> big-endian target, tswap32() use means the fix was for a little
> endian host. While the datasheet (reference added in file header)
> is not precise about it, we interpret such change as the device
> expects accesses in big-endian order. Besides, this is what other
> Xilinx/MicroBlaze devices use (see the 3 previous commits).
> 
> Correct the MemoryRegionOps endianness. Add a 'access-little-endian'
> property, so if the bus access expect little-endian order we swap
> the values. Replace the tswap32() calls accordingly.
> 
> Set the property on the single machine using this device.

I don't understand.  This machine type is little-endian only and 
expecting inverted accesses, isn't it?  Therefore, all that you need is

> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_BIG_ENDIAN,

And removing the tswap altogether.  The big-endian petalogix board will 
start getting "correct" values (not swapped anymore).  That's a feature, 
not a bug.

Paolo

