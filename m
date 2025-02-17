Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp197597njb;
        Mon, 17 Feb 2025 09:43:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSPYp8xI23d7H+mpqPMHYri5AW0o/8GFgzVtJjOLPynHaL07wICItbcHJwuY/sSAJ+tBRfxS7GHtDDJg==@linaro.org
X-Google-Smtp-Source: AGHT+IFaovEIufduI5sB1/euYULR/eAClsiGqKrTe/NT26+XKqwQ5K5vjtOkMJ5rtX4EocV9zOIN
X-Received: by 2002:a05:620a:2985:b0:7c0:7a0b:3722 with SMTP id af79cd13be357-7c08a9b2f05mr1182479685a.20.1739814190667;
        Mon, 17 Feb 2025 09:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739814190; cv=none;
        d=google.com; s=arc-20240605;
        b=WvjoxasjBdUueIBGjaHHNixG3m9GNNvn10fTRkoRtvXas9YiknZhxePqufBJ5FI+WL
         oxo8ydaWkiMGfb9Iy209BSgvTjIAv5lVJSmPA2l5ArCqQzIO6M2f0eA+yCqk25sA43zl
         3iuqKLmpzYJBxwPZE8h3nSirVvOyTxB6qWJmyO5XM9552dwKklJc0/Mlt6bt0IgWd6gK
         g0rVT9UWNZ08hKxUmE9qdjpGRG9pfr/ptIqiEYEB7a7APirOHreoX/Y+RbL1OqpGQhdD
         LpbYKXCwzOpAyb5nmmRBbTZKG8Jiu7KSDe4fWzFgPGSgstiJSe9MNZ5sNY0KY/WWyGrY
         OZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Kbj9ZpABHxzJoglYG0rKlqkNfqUb/eFtc0o/zMlWoRY=;
        fh=Nc2r3p9AP5vDPF18de2Ib7Pty1N1+4W7g06PLolHY8Y=;
        b=jH3aJDfAS/2umyDS35BX3vk7OEQxlchi8d3xtyF8wyjyvMZff6Ig7YhjWkhNOzSsZC
         ZhEkiZZOyrZoBF8RGUe+HAGnp/cr0vXldeT4LFUfA6PMYSrKFdjVShITdIItgxc9KAhZ
         HKC7VHw4HOQvA68HTyfCWTC5fJdPNtRy/D+ayjcv5QZxr8UeWYlks1nbrlO6bw48BN6l
         3iikAl9M+eUDkhsC3Obmw+D+jevtuIM6c+ajS4MejlTm7vEGJ+MftIqDNVSbobQASXXo
         3TnDVPXD2rsBOD3eERWS9260WJ+pV4PJ+EkA5uzyYo7uSAMjB8tLozJc4ogR/bknWgrs
         o5Yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hgk4i0UQ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c09f9a1682si216635985a.246.2025.02.17.09.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hgk4i0UQ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739814190;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kbj9ZpABHxzJoglYG0rKlqkNfqUb/eFtc0o/zMlWoRY=;
	b=hgk4i0UQ9zJBlarh7PiEbTuIaX4AjXrMOp64OtcN3COPNiKVWMCDQGmD/CJrpQGaYF5tfS
	CdFiG2Iy29dkVZUbpU3mMF7e6/cpWO6p/K7treRcvf8KG9IPDeILHcRXbVAhCydtRrcHk6
	igx+H/zaDKKA8wZLLQewQ9GqMM95+G4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-CNdrxgCmO2GfvcHWnSumnA-1; Mon, 17 Feb 2025 12:43:09 -0500
X-MC-Unique: CNdrxgCmO2GfvcHWnSumnA-1
X-Mimecast-MFC-AGG-ID: CNdrxgCmO2GfvcHWnSumnA_1739814188
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f20b530dfso4861785f8f.3
        for <alex.bennee@linaro.org>; Mon, 17 Feb 2025 09:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739814188; x=1740418988;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kbj9ZpABHxzJoglYG0rKlqkNfqUb/eFtc0o/zMlWoRY=;
        b=FxDh5x8y4IgsEnehxsCA9l59MrXI89jkqkJcND2RNY+hOse3aAQHTc8GeB/U92RgON
         tuLijsUKuxyidEB5tmvMyBX4VCvwJTS0CTH2XJt5opr4behcTDHnyJxVzR2QPIiRngr3
         kdZmd9PLJiB8ahVQsn5nauye6wq/KX6Dw3AjTTfjETbhIP48k4f6/bDxBBpaVig1Sofj
         H1aV+RLaL0Wfv1LFqqlP/eTJ75ThS0tl0o6ePz3VCSlfX23/1Sj3j92ZaFcA5ANlKqn0
         ryC8/LdAsxAZ1vJNMvY722RHPRs+ZtJIphiy/oOPkrGfuZ5UtxwwmczlO+Mune56v5r3
         wbjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzf6QExUzA/YbLHyeQJ76s1pByWtcNQVnOir/eIOlKPahi/lSoSfJxYUY+Woh75TeomVd+zQY6z1CakQ==@linaro.org
X-Gm-Message-State: AOJu0YzJRn0Vra+cgCqGk4vW602gzXKiK5qZ2t5dhgrmA2/Iu/8KV0YJ
	PcTXKwjPvWBiQGWqmwqQNvVFecjDXJK9ihQef+JyWiyXpH4Sz8hpPTnGzgKzU9V8I1PNklqI4By
	158NZxaaHEStD6kGBf6R1Jjnk5OUzsc0QltFXlBrWuzhDv6/zAJG+PA==
X-Gm-Gg: ASbGnctu5FCozqaUcawmgDUHiPr3O0ebR/rVs0upjivWg4tz2GGqGDgoNnw9H1UVS6t
	5/rpjJxnq79Y/xUdkQcWc1Hqy158N8pEYK4ewUqv//kqp5aVwcP94/vubjNDXj+nyiq+EN7iFIO
	IUbpKK5bvyHhsQtnqAhQx43oYYkzm9CcVkSc14WdyxyPbvRUH5Tj/mnp0rQYp6PmLhLlyz/Ve09
	VE2Ms2OrmZ0itBBTCNkhbRIIzIV0ToUcMQhpFruktlSj6vCo1ipbqyhT1U4mLcp2yQbO29KV2EN
	pLlS0aD8E02EDBnobmYFlcYDMK7efhZEkAJXWiJi+t+hsEdWyi7j
X-Received: by 2002:a5d:44d1:0:b0:38f:2176:45a0 with SMTP id ffacd0b85a97d-38f33f511edmr8659837f8f.33.1739814187843;
        Mon, 17 Feb 2025 09:43:07 -0800 (PST)
X-Received: by 2002:a5d:44d1:0:b0:38f:2176:45a0 with SMTP id ffacd0b85a97d-38f33f511edmr8659813f8f.33.1739814187445;
        Mon, 17 Feb 2025 09:43:07 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm12967828f8f.68.2025.02.17.09.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 09:43:06 -0800 (PST)
Message-ID: <ff481ffd-545f-4d0c-b53a-3cf9e0f8f388@redhat.com>
Date: Mon, 17 Feb 2025 18:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 2/3] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, sebott@redhat.com, maz@kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
References: <20250217163732.3718617-1-kchamart@redhat.com>
 <20250217163732.3718617-3-kchamart@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250217163732.3718617-3-kchamart@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eop9IGnDTgkztRyLqMnpq1_fJWBuvIAiKcmaXagALoA_1739814188
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: j22GpP2/6JRP

Hi Kashyap,


On 2/17/25 5:37 PM, Kashyap Chamarthy wrote:
> PAuth (Pointer Authentication), a security feature in software, is
> relevant for both KVM and QEMU.  Relect this fact into the docs:
>
>   - For KVM, `pauth` is a binary, "on" vs "off" option.  The host CPU
>     will choose the cryptographic algorithm.
>
>   - For TCG, however, along with `pauth`, a couple of properties can be
>     controlled -- they're are related to cryptographic algorithm choice.
>
> Thanks to Peter Maydell and Marc Zyngier for explaining more about PAuth
> on IRC (#qemu, OFTC).
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
> v2: address Marc Zyngier's comments:
>     https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg03451.html
> ---
>  docs/system/arm/cpu-features.rst | 46 +++++++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index a596316384..94d260b573 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -204,11 +204,49 @@ the list of KVM vCPU features and their descriptions.
>    the guest scheduler behavior and/or be exposed to the guest
>    userspace.
>  
> -TCG vCPU Features
> -=================
> +"PAuth" (Pointer Authentication)
> +================================
> +
> +PAuth (Pointer Authentication) is a security feature in software that
> +was introduced in Armv8.3-A.  It aims to protect against ROP
> +(return-oriented programming) attacks.
> +
> +KVM
> +---
> +
> +``pauth``
> +
> +  Enable or disable ``FEAT_Pauth``.  No other properties can be
> +  controlled.
> +
> +  The host CPU will define the PAC (pointer authentication
> +  code) cryptographic algorithm.
> +
> +  There are different "levels" of PAuth support.  The host CPU
> +  definition will define that level (e.g. PAuth, EPAC, PAuth2, FPAC,
> +  FPACCOMBINE, etc).  Refer to the Arm architecture extension documents
> +  for details about the description of these features.
> +
> +Live migration and PAuth
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The level of PAuth support depends on which Arm architecture a given CPU
> +supports (e.g. Armv8.3 vs. Armv8.6).  This gradation in PAuth support
> +has implications for live migration.  For example, to be able to
> +live-migrate from host-A (with Armv8.3) to host-B (with Arm v8.6):
> +
> +  - the source and destination hosts must "agree" on (a) the PAC
> +    signature algorithm, and (b) all the sub-features of PAuth; or
> +
> +  - the alternative (and less desirable) option is to turn off PAuth
> +    off on both source and destination — this is generally not
> +    recommended, as PAuth is a security feature.
> +
> +TCG
> +---
>  
> -TCG vCPU features are CPU features that are specific to TCG.
> -Below is the list of TCG vCPU features and their descriptions.

The resulting header layout seems weird to me.
Initially we had at top level (assuming ===):

KVM vCPU Features
TCG vCPU Features
SVE CPU Properties
SME CPU Properties
RME CPU Properties

and now

TCG vCPU Features has somehow disappeared giving the impression that
there are none.

SME and RME and TCG only if am not wrong while PAUTH and SVE are both
KVM and TCG

Maybe we shall
- rename KVM vCPU Features -> KVM only vCPU Features
- Add a TCG only vCPU features including both SME and RME ones
- introduce a top level KVM and TCG vCPU features with below:
PAUTH, SVE, detailing potential different semantic for both KVM and TCG mode

Also while we are at it, we may use vCPU everywhere instead of CPU (SVE
CPU Properties) and just skip CPU if it lays within the KVM and TCG vCPU
Features

Thanks

Eric




> +For TCG, along with ``pauth``, it is possible to control a few other
> +properties of PAuth:
>  
>  ``pauth``
>    Enable or disable ``FEAT_Pauth`` entirely.
