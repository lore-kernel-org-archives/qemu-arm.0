Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1011558njg;
        Wed, 26 Feb 2025 08:14:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoX559kGzZMDgFXOU9b4Ix5CpTYg9JM1TGl4qqYMjE135xfBDPvvZIBstK7fVYIbsRT4WU
X-Received: by 2002:a17:907:7f26:b0:aba:5f40:7f2e with SMTP id a640c23a62f3a-abc0de0de78mr2631334166b.45.1740586475529;
        Wed, 26 Feb 2025 08:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740586475; cv=none;
        d=google.com; s=arc-20240605;
        b=boixtHuWFH3BYEef7rYzG4+NrCQRbTc17LgBxY7tWXJafKDU5tSLJOLKP7japr1Y/S
         GC6SskFzjoJIHIxxxwhQ7eV9qO0TOV3Ft+yszga6zNYbxpZhel7b7qeuuoei31gX0bZq
         wBQ1JHG2VnH8biYC85x+UjbPVGGgSMDEd1s3XC5QDNuHDZnT9fpqzcFlTFg4VYTcflU1
         hhq/BSUmQscebUV8WH/w2oPCy1IQXAGUD4RcR97c7khjCEg5oDItRErkBZIDw88D4XIB
         B0iY8C/ErqJEDFCwHBAgP8FlmwZ7PZhCR/eqLrwZvBvBDSKnmIIWuHLF06ME5K9BFsXQ
         ywkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=e6WptTDB312s9O4jIKbscZ5uDMmB+gpUnuK5GkWtL50=;
        fh=kMuyKEDVLpXx+n9GsiCpA1spgm27ONyskfB4MRxywKY=;
        b=YCf2CKIQCpUQNHsyQY6OpycEV0DsBgLgP2x+lY+4Ge3PxMMSsobwJJZsnr9HJVM0If
         SAgQqsyT3IOQXzm+dGMquXn6Tf5TVn6zJmP2nVRrSBc77hT8sik/hHxZclkFoY1BHEJ8
         3TwjTQC4lH9Ojytjl+EoHMBYj8Y9wi0igZLuU1ufxToC6RoDVSABp/h3/GFnkSd9HR88
         g0Ta387qbtFWCBkpgQ2zWujX5MUoBZx9s9GRD2Y5t9LdQsHgf4RjixydfPmZY4pehESM
         n1YOIrqyCWZHTCSmzzU6uzcMaLbv1nKHEqbOtQ853WLxZNFcKuQpfcdsZDnIZbmIha5u
         RUXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WMDCWr22;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a640c23a62f3a-abed1bd9b2asi386757366b.41.2025.02.26.08.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WMDCWr22;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740586474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=e6WptTDB312s9O4jIKbscZ5uDMmB+gpUnuK5GkWtL50=;
	b=WMDCWr22cmFw/sv0xsYYnZATKpaOgEeTxTBPqTgRisinR4ErKpI+nPpG6gLWlfPM0BWhTd
	H1hpukkL5E/qyum4XvM1vTrVKGWNYEK1W0ckmnyqVyrs3HaHd4tBuUgdSf4TEqiOIOlHvD
	vCvEanmBjRA9YQqX43c2CUZFXTnCu5o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-A9dj-1v9PJiUsUKiCDy-kw-1; Wed, 26 Feb 2025 11:14:31 -0500
X-MC-Unique: A9dj-1v9PJiUsUKiCDy-kw-1
X-Mimecast-MFC-AGG-ID: A9dj-1v9PJiUsUKiCDy-kw_1740586470
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-438e4e9a53fso53347575e9.1
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 08:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586470; x=1741191270;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6WptTDB312s9O4jIKbscZ5uDMmB+gpUnuK5GkWtL50=;
        b=VCNfriKJ2z4qnD7beYDhRw1sC0JCxUkyWs8xD4fyYyrJg7zU9vX6+ZZW3VpPDxQmDW
         jZjdoXd4fo0/tZrL9UScLaTHwvsZ0ZGkN0f6TWJABxBFMCfAS6q8aWL5BMQpLZAQ5CBc
         p9HnRwwwezJoEWEKFTwOIo+9qEGRGh4c5XtMP6J8y5QN+B8CVfTrgcOmYjspSMFAqYhA
         Pm1Hbu2DJdS6cI+XCkqkQviY0If6UFdGQPevlVSuayZ4XfwKpMs6cMR/Sc7mFwYYdQab
         AGBaBSfLomYNtVWE+WGG0k9jQAWRb7ZDKLyHndZdqq3OiC+J0Xa+60En6sbIlYD+KR6Y
         tASw==
X-Gm-Message-State: AOJu0YzVgP9MOOXaa7Ub2CunBKaP07dxaUchVHq598gA8XQ21b8Uy8i+
	+BcLY8FdHrrhx4v5LqClyfzkn3ZxJKf+d7UtlhLu6mYhnjdWIlxvHlZaThp+7FJRzb/xAD5DjP1
	81VV4pUVIx4dzikXqER6LuoDXljpdC4tkelpqhZsdVbcVIJnojDbgv5YgTbuYZjHObsqFnlxdWC
	RLbqG2Iv9wyDusuKyvMT9UKzAAc9nuRncZcA==
X-Gm-Gg: ASbGnctCXPTADwl0J5T5Jp8J3BZyfxMaagV7wIUS6wArMDOluPgLDL/pvo4rZNAzR9A
	JCYVgaZG4EmVrd/sanWvfHtQNyxvmNdhSdtYluuzVca+RBhSMaS4OqOTzmtp2vzJy7U4BchacNM
	3LSmyykAdzJB1jAp4Y64wg+VnBoYUNlhoTVDVAT7X+p5eIPLWPMsuMM53qIS/w3G/6Qso3+GFkC
	zkMPj5LRT24oLP78Jnv3fyuQwNN3BhGZVtJi45ATCjkdQKYA9Ap0XeAHSU7Svx/ds793kS8niTG
	TAkH8NTL58CK/JlEpIPhLFJfbhMngepH95MkvktibzntX/w=
X-Received: by 2002:a05:600c:1550:b0:439:a1b8:a246 with SMTP id 5b1f17b1804b1-439aeb0d445mr162357785e9.8.1740586470006;
        Wed, 26 Feb 2025 08:14:30 -0800 (PST)
X-Received: by 2002:a05:600c:1550:b0:439:a1b8:a246 with SMTP id 5b1f17b1804b1-439aeb0d445mr162357405e9.8.1740586469609;
        Wed, 26 Feb 2025 08:14:29 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab2c4051bsm45127055e9.0.2025.02.26.08.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 08:14:29 -0800 (PST)
Message-ID: <46bd3693-6883-4a80-aa52-e7d89f752806@redhat.com>
Date: Wed, 26 Feb 2025 17:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/25] libvirt-ci: bump to latest for vulkan-tools
 (libvirt MR 525)
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250226140343.3907080-10-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MHBwMMNf4WCIZ6telSkeuAr18RkpbkJOk665BR3bD1Y_1740586470
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JtYN/x8gkl/i

On 26/02/2025 15.03, Alex Bennée wrote:
> The alpine baseline has also been updated in the meantime so we need
> to address that while we are at it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>
