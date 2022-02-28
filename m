Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1737846lfq;
        Mon, 28 Feb 2022 04:14:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycHXHKZf937oYi58wk+JeVmbqKA3s9TK+qyEKEQAWbP7lyw4D/dDvEu3Je6JtbXGQ+1nD1
X-Received: by 2002:a17:907:366:b0:6ba:fff6:4fc7 with SMTP id rs6-20020a170907036600b006bafff64fc7mr14854190ejb.756.1646050485307;
        Mon, 28 Feb 2022 04:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646050485; cv=none;
        d=google.com; s=arc-20160816;
        b=T3061OT48D1SKfln99JztXz2/P49WlZTnxpkOJyOevQSJAenYP7slGCgYNkVVUyxMY
         sf/c2WbUlVwMrMu8A8A2iYGwpVZxvWeNcPlx1UU6OBxhHkOJAxiHBuIoqR+2JdDaAkxC
         TXraCNvQjhDyRXQfJU2IACc0+U7L92pL8aulLWzeqtdVX7OD7GHar9LLLb+KRoRTIbAJ
         ZLXLBqo3WOOkkJlcsBlaJNDg6CO8D5oYT9UzfiXHKR7wrqVSjQ4EBrN9oD2ItmdXi/7O
         hdsy3Lu1tyFHJp8Q9nHOeuJpG67/WqfpaNFcO6fikukCIiRHXEMSf7DqoaIRG+nIUAdX
         Bqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HlrdONhRTLurLKVwR3T1jmK87zvMpD2wIIxKDX1GFA0=;
        b=kHYHEbFrberF5sMfP7jw2kfrx3b/MnhyEQPChuCDeba1H86DgWgu8bwUqnWAWKsLJ5
         L468R9kpFkCzzWFl2M5ADhTvPndLbXpERbGAHMMoxT+zP4MGVCXE2Y6IyUu61j4P0kL3
         McjqvtE2wB8t0IfYvf+NoSqLM71PMg+oZEsCmq0FfUnnvN3an/7OIKQygl2+wdtPOOzo
         SAP0tBuArdP2MyGcBuBXCAmc+56KoCShOkzstfl1o3zY32fzOJAw5q4endXU/rX/Q/MR
         7zjNOVnf2qvWYwLFzFZW/tA5sGHRgGuWL14zhUwTS0PsMhi9+Xtesd38LX0sKQEFSCqR
         Hm/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I/ixrc0n";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l18-20020a1709067d5200b006cce1485e30si5848928ejp.151.2022.02.28.04.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 04:14:45 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I/ixrc0n";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646050484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HlrdONhRTLurLKVwR3T1jmK87zvMpD2wIIxKDX1GFA0=;
	b=I/ixrc0nK13mC8QIsxYfLveZHUt1IiTBNWCTbCfrfuLCXt87qYgihpA8URB4tk8EdBl2io
	j9LkrTP+XOuvhHFkCp0geBgduYXpiasvbnVxoywyrtNa8hVOwInccn3I1mNbgBEF/5Gjzc
	RnbKecteesNmfmRtqJ1lYFDsfAdKaC8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-1K3aOBioNEGjlMr8TLQjKw-1; Mon, 28 Feb 2022 07:14:43 -0500
X-MC-Unique: 1K3aOBioNEGjlMr8TLQjKw-1
Received: by mail-wr1-f70.google.com with SMTP id v17-20020adfa1d1000000b001ed9d151569so1985584wrv.21
        for <alex.bennee@linaro.org>; Mon, 28 Feb 2022 04:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HlrdONhRTLurLKVwR3T1jmK87zvMpD2wIIxKDX1GFA0=;
        b=rGtvYlkD1QXYxBASq8rCRQqlxWjFvG0d0HoTbf1p7eXDqgZ5OHws1RCPqSAeNfnzOw
         qUBnrYKeKwiBPmcNst5N7LrFkBYzKl2XfcFYYuMlwGlFX2CAC16j74evofx6CL4qErn9
         ANT9a2/XLMRlmo52GLcpe7ELd4sNTKJ/vbhMXTBJY0CMByeNlPdFAhSqdsClbC4DjzBe
         KQanU+jZA8CbD9i6LzxlB6BYNtvXqjJcAcCEuJ5P6D9dxkc7D7g2SRNbBEBX/2gicDNU
         Z5rG1HzCSgu/p68Fw7khSFZi2wrxChTSX4nuFrawNTvGVVdnjxFC3JP+f4ZRYw3r/Pyg
         2SPg==
X-Gm-Message-State: AOAM530a6OkqtyiwNyt1F9iUxSTQaBX2egNWoOPLgPkAVQp4TuOec9yA
	liu+O2FJ8aL+dDdIeggZXNDRBx4933RsrczD056BsO0tSaMZw7AaHZNLrGG3QCIIhbst/adAXGf
	XkJP4QP+IrWxBtIyU
X-Received: by 2002:a05:600c:1e03:b0:381:4134:35ca with SMTP id ay3-20020a05600c1e0300b00381413435camr10394419wmb.145.1646050481830;
        Mon, 28 Feb 2022 04:14:41 -0800 (PST)
X-Received: by 2002:a05:600c:1e03:b0:381:4134:35ca with SMTP id ay3-20020a05600c1e0300b00381413435camr10394376wmb.145.1646050481601;
        Mon, 28 Feb 2022 04:14:41 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id m11-20020adff38b000000b001ef879a5930sm6939538wro.61.2022.02.28.04.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 04:14:41 -0800 (PST)
Message-ID: <4e007cd7-1952-42fd-cd60-b29a745ede6a@redhat.com>
Date: Mon, 28 Feb 2022 13:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/9] Avocado tests: improve documentation on tag filtering
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Halil Pasic <pasic@linux.ibm.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Farman <farman@linux.ibm.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-8-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220225210156.2032055-8-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +0e++GZFJNx6

On 25/02/2022 22.01, Cleber Rosa wrote:
> It's possible to filter based on a combination of criteria.  This adds
> examples to the documentation.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   docs/devel/testing.rst | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 92d40cdd19..f5b6e07b5c 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -936,6 +936,28 @@ in the current directory, tagged as "quick", run:
>   
>     avocado run -t quick .
>   
> +To run tests with a given value for a given tag, such as having the
> +``accel`` tag set to ``kvm``, run:
> +
> +.. code::
> +
> +  avocado run -t accel:kvm .
> +
> +Multiple mandatory conditions can also be given.  To run only tests
> +with ``arch`` set to ``x86_64`` and ``accell`` set to ``kvm``, run:

s/accell/accel/

> +
> +.. code::
> +
> +  avocado run -t arch:x86_64,accel:kvm .
> +
> +It's also possible to exclude tests that contain a given value for a

Just a matter of taste, I guess, but I'd prefer "It is" instead of "It's" in 
the documentation.

> +tag.  To list all tests that do *not* have ``arch`` set to ``x86_64``,
> +run:
> +
> +.. code::
> +
> +  avocado run -t arch:-x86_64 .
> +
>   The ``avocado_qemu.Test`` base test class
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

With at least "accell" fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>
