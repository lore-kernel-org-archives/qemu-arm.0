Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1326923lfo;
        Mon, 7 Mar 2022 00:54:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7A/c0qKHbhjMcla4v3tXYkNi/gGPQIH6oCxLAYpjRu3k0gvEotabThZEZyO2tR5rEIinW
X-Received: by 2002:a05:620a:1a1d:b0:648:af1f:90d7 with SMTP id bk29-20020a05620a1a1d00b00648af1f90d7mr6229186qkb.340.1646643263452;
        Mon, 07 Mar 2022 00:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646643263; cv=none;
        d=google.com; s=arc-20160816;
        b=kwxT6y9cBu2V4HSU2ELCLguvw/DxOokC/xmJuXN67Z+eqOVJNvzj2jgy37w1e9cB4W
         oUuev9/bRnyqmlmKvKQeyBhyYsy9EqOZsYGmGwjI3KBZy8pNmpMvgUwmK1nUIrcC34L1
         FeiHLm2UkS1gWc80MNhLmMd0+u0DpT6JSw5Ziktrg6wkvr5l1LqfZS9uRULgtYh9TzKi
         zO7M44pM+T2mgX3agYQS9ScehnL/GUz/hhc6ge7gMub8eVUK8Ze4B3TCYRScI8M7Qvi4
         U6AiqmWnQmp+cg8v2mJ0G8A3DXOZ3GP3tRjKbq6d2nNZdwsoAw7mc7TZUKYIFWXAjf9c
         VJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=12DEsos71s7FzxClC55Kye3X3h2NxMC98zQc/5X7pS0=;
        b=GSzTsDbdsTE/filfTjadgF9C1thDYPRYh24cEdS8Hq0Zlsgpjfr/tnXEotA4A6GAjQ
         x6m9BY0fPmGRpjJdwlqbPbrQ7Tz5IHjZwFAx6ffqJmGig7lNtX+AKHEbOUcMduR349Ym
         vcCuVovAnVfOSO4h7T2iMUhpryi+okCf7n1Et4EU5VnXEVQevoa7YChvOtFeMetOgwme
         vCf1J1/7rZSyakILW8HOhn2N2RqDBAPp0C9pVvqRR436jLkzsYoLKyXIADauTE8ZRznu
         UuyHSJOF8EpHuqk4u+HmULGXts8RMrQk8uXV+wIFp0nFMd5xj5SAq3WdxRiBZmho1v4w
         SWFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LLujrvwG;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j14-20020a05621419ce00b0042c42447e5bsi4819654qvc.293.2022.03.07.00.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Mar 2022 00:54:23 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LLujrvwG;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646643263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12DEsos71s7FzxClC55Kye3X3h2NxMC98zQc/5X7pS0=;
	b=LLujrvwGyGdGVs71ZPuiFfHqAmBe+KkmFW1m1nRIhdd2P6a8GKKLuwqQSp+xCYfGwVDeMH
	fEUytKyVs6UjYvIRcxyPk/4HDITr1J2UuT1j9sncMvdOBxJN/A9LoJnYXzH9Z+r08W1nFs
	CemAt7jCQ0zWpa/jTkPjYX9lR6HtlOo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-ygjr8OFrO8WmE9NINPx_Rg-1; Mon, 07 Mar 2022 03:54:22 -0500
X-MC-Unique: ygjr8OFrO8WmE9NINPx_Rg-1
Received: by mail-wm1-f71.google.com with SMTP id v67-20020a1cac46000000b00383e71bb26fso4898774wme.1
        for <alex.bennee@linaro.org>; Mon, 07 Mar 2022 00:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=12DEsos71s7FzxClC55Kye3X3h2NxMC98zQc/5X7pS0=;
        b=Op/UgEXwKvyMPus8Sza8BGwM3rnP1VTR0rog8MRqDM71j8FZEkohN29mzDSeJV0XkJ
         pwgJAJTACEEIevDmWTzTlGsa+ThfTUnDEZkfbE8RtvJ3Y+1QXQt1Bf4y1sxxzD3Qxit/
         R4rcwMlYvQ0+PGP3nOpadizLlc+ZT0pKT7Pu32Q8SEeAG/Ouu6YCpf5oV82xFwnA25ZK
         ZOyVPaV7rJmFoc9Ax4Gb0ciroVssCHnIP7/CDQ4p6Ye+ad8XmF4jyN3b4aQllGe7ZsBP
         l6a0asLQ5Jz4QvjiNL3fSXCbpfjeg4coGX/1eJsGBWL1d0D6kucEIqBcWLhCeNYPbmFZ
         Vakg==
X-Gm-Message-State: AOAM533MKWwlnpiXUfDqTcxib82gBTIJ9WJ5dqAgAZhceXn+r/Tkt9x4
	jOvuvUYuHrPILakKHGQPu5vjlCupECBnBDZrj/DwB2RjEh1tLbI9QQPiOkvDehdIOwwpTya6Uvn
	RWpgntduy1cGHYyv6SGM1bch1zxipK+yCFD5ztXCe/tSMxHORQsrqnn5zeqH4+ZEO
X-Received: by 2002:a5d:538b:0:b0:1f1:e60b:20c2 with SMTP id d11-20020a5d538b000000b001f1e60b20c2mr5254591wrv.294.1646643260991;
        Mon, 07 Mar 2022 00:54:20 -0800 (PST)
X-Received: by 2002:a5d:538b:0:b0:1f1:e60b:20c2 with SMTP id d11-20020a5d538b000000b001f1e60b20c2mr5254574wrv.294.1646643260796;
        Mon, 07 Mar 2022 00:54:20 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id z6-20020a1cf406000000b0037c4e2d3baesm19217100wma.19.2022.03.07.00.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 00:54:20 -0800 (PST)
Message-ID: <162f6b45-8b3a-9672-2e5e-f28e867eff31@redhat.com>
Date: Mon, 7 Mar 2022 09:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PULL 13/18] tests/tcg: add vectorised sha512 versions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, peter.maydell@linaro.org
References: <20220301094715.550871-1-alex.bennee@linaro.org>
 <20220301094715.550871-14-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220301094715.550871-14-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0rJjWRh3aBxZ

On 01/03/2022 10.47, Alex Bennée wrote:
> This builds vectorised versions of sha512 to exercise the vector code:
> 
>    - aarch64 (AdvSimd)
>    - i386 (SSE)
>    - s390x (MVX)
>    - ppc64/ppc64le (power10 vectors)
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220225172021.3493923-14-alex.bennee@linaro.org>
[...]
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 1a7238b4eb..e53b599b22 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -25,3 +25,12 @@ run-gdbstub-signals-s390x: signals-s390x
>   
>   EXTRA_RUNS += run-gdbstub-signals-s390x
>   endif
> +
> +# MVX versions of sha512
> +sha512-mvx: CFLAGS=-march=z13 -mvx -O3
> +sha512-mvx: sha512.c
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
> +
> +run-sha512-mvx: QEMU_OPTS+=-cpu max
> +
> +TESTS+=sha512-mvx

When running "make check-tcg" on my s390x host, I'm now getting this error:

  TEST    sha512-mvx on s390x
qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
qemu-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
make[2]: *** [../Makefile.target:156: run-sha512-mvx] Error 10

Any ideas how to fix this?

  Thomas
