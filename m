Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5988405njd;
        Mon, 28 Apr 2025 07:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIo4Gjcy73325YDY9PtOHVrUvQe10ACiRfB17a3RxG2oKt65k1CP0QaDAy6UOGxA57uds3
X-Received: by 2002:a17:903:28d:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22dbf5dcd8bmr155923805ad.20.1745848926705;
        Mon, 28 Apr 2025 07:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745848926; cv=none;
        d=google.com; s=arc-20240605;
        b=cC8Jji4fNZDIOSK2O3n8vLvlvccepqKvcmFxdTKRE74XaiuXxkI2qsOsXkmo9giEBY
         0sq/OgducVJSfohKb8sZgHhx3fp4mlpYb1+LnsP3Am9G86bBJTODIuNMavQQ+Ce/UHAO
         MXrouBc/6U5v3KEtnITlz1byevxy5xSDHOYFekvNvGCx/QfH4phOhU7HLgOJIy99yvEv
         R9iqkChK77+c3Q2k6WPhdKeOBLV8pcBwhZM9yQ0InCwydn6ef/r9AJYHmds1ApDXdFj9
         LTKJUBcuUOP/SLOp6ricTLby8wUMclFVQAZfZZlGdRRvE1LL67UjPFbp2lSGEr1N4O5l
         ps2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=oVDaO+qTXn+ujDK2ncQx+yn7CcEGLmLQc2GUBGf+VUE=;
        fh=jf2lbwziKaTy6ue9vQ8Pipxc7vUxBSFDf+GMsIxsvzo=;
        b=OWv9squROLfaMtkjHR3DtzFantlHH5sYbZ5vbwP8ZkwJfoWNM/kqBPUzlBqmwt0SGA
         +gc1ld051Y7zccJS5ndT6q6Wet2nl2TOJENtpT2i1p1GgXlFN5PuHBhK5bG2LjHnGl0+
         N4stgbFjsV36hsl1UokS1QM292F4Kv1upEmXSf/cb1fVWV4EmHYbRZzpbXNVTEk1eALy
         Y3m9bNZpM8TprqexK52E+FKRxr0sv1HyefQa579NxvjeN+B//jE+McmVpww8DlpvcsaX
         6JXzb3/3+N5Z4xotYLUFgyK3nONjRt9qkzqYdA106Injm7iP9RU4GuiYJdX246KPNXmc
         bVvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iuyHFhrP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4f824b9e003si7962946173.82.2025.04.28.07.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iuyHFhrP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745848925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oVDaO+qTXn+ujDK2ncQx+yn7CcEGLmLQc2GUBGf+VUE=;
	b=iuyHFhrPbNNwNWI2SdHB9AmvJEIfhZPapHMA+OHOL/0Ww3AdujcuWOBB2hvumzBkzO3v2U
	gneSU5BjXXAqqOkVLkKnGITiDnPv+3XTtNg/bqB3Bj8SQIM0XjztUMUEsL140r0JGkaqjA
	ZbkbGdWSlcPkuTBj99vbWg8kawcdp8w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-sCq5knYdM8CNhAvIHvvYbA-1; Mon, 28 Apr 2025 10:02:02 -0400
X-MC-Unique: sCq5knYdM8CNhAvIHvvYbA-1
X-Mimecast-MFC-AGG-ID: sCq5knYdM8CNhAvIHvvYbA_1745848921
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb98b5b0bdso433981566b.1
        for <alex.bennee@linaro.org>; Mon, 28 Apr 2025 07:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848921; x=1746453721;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVDaO+qTXn+ujDK2ncQx+yn7CcEGLmLQc2GUBGf+VUE=;
        b=VSpmwhIdoKhf6mHz3QCUP4Pgobrv4cf1s1qB72nxySubTaXjsFaytehvCWr4bW9dPh
         IOc07A78aILTA3duivikEeo5rjdj9zgL6EbaCBzAzp1RLqGep3aOkWaSadKTnyIvxpyX
         Q59vkNRP7O+1Q3LuFZhRzBa+LCVgxSEgkgzT1/LDpwz4LmWqLtWLXSBQVmPm+OgllgQw
         Tc44r5kaFuy8Sfu6FDSuII7ygL2Tp0ZdX8enJIYJaH1ZbaNow3gCy0xSD2ZCnngK1Zsk
         n+1LJS2PhiO9AUZEqtC7R9LPDhuTZO4rU9L1/vE9LtfLV6qfSK3FByZ+c2zIZc2mi9He
         qPAA==
X-Gm-Message-State: AOJu0Yza/n9po1qbL/16lIAqmUxeOHDgZzmN9lvPl12mARigwBlLDcOE
	lEPolRom8LNeQcBseyCVIkBrdrgbWcpqwvNp2xr6Y9EnS4FViuP1AH+xAsrJWexwf93qaI99mQ5
	3WNEE86MlTvPcPEVbWcc35taWDjw3b1I2eeMlW4voaoK4KXM8DbA4IAEzxnfa1MFLn7hC/8v1w4
	uIzG1FqJRyzhSHPSVBpYFJz4Tyw/jiX4ZXkObY
X-Gm-Gg: ASbGncs4liFVrg7JfQNWwTQuWN8/ra/tajVn/HDJ6vslMGHFbhEyb/m5pKScj6MOJah
	qbhSUNF4B8GCJJP/N1rzhlt2N8ObLVvZFoc26GhZfidAE6Y4WV+XtyPXYiJTJmiiQyK2d9jpHE+
	6qOw/sFgGcG369Tx+XNV6yR3XUIIjigydO9kqHEth6ufq4LTASUMG+DwqPqPB0DwsuXQmOoZ+m/
	HGVr886Ok8qUoRu054blGxky3Ux+YCPkURdGlqcV8KELeCsG3KdgpSwb7eSQpx5eNXZgFQy+xWb
	HRUMY78MR7cVFWlSHDtwtyTyqOM+T0IR1qNpffCdZP1Inw==
X-Received: by 2002:a17:907:3ea3:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-ace7111e569mr1044835566b.29.1745848920620;
        Mon, 28 Apr 2025 07:02:00 -0700 (PDT)
X-Received: by 2002:a17:907:3ea3:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-ace7111e569mr1044825466b.29.1745848919721;
        Mon, 28 Apr 2025 07:01:59 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-43-178-177.web.vodafone.de. [109.43.178.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafec7sm626447466b.165.2025.04.28.07.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:01:59 -0700 (PDT)
Message-ID: <294fd9b9-6880-477f-a2b4-773f1e5274c8@redhat.com>
Date: Mon, 28 Apr 2025 16:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] gitlab: disable debug info on CI builds
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250428125918.449346-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QLDQsxczymmo8_dTeVILrGsC-bD4Rbsk7E3nj_Q71kQ_1745848921
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7inDrrxZekUT

On 28/04/2025 14.59, Alex Bennée wrote:
> Our default build enables debug info which adds hugely to the size of
> the builds as well as the size of cached objects. Disable debug info
> across the board to save space and reduce pressure on the CI system.
> We still have a number of builds which explicitly enable debug and
> related extra asserts like --enable-debug-tcg.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index d4f145fdb5..d9e69c3237 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -24,6 +24,7 @@
>       - ccache --zero-stats
>       - section_start configure "Running configure"
>       - ../configure --enable-werror --disable-docs --enable-fdt=system
> +          --disable-debug-info

Do we have any jobs that might show stack traces in the console output ? 
build-oss-fuzz comes to my mind, but that uses a separate script, so we 
should be fine there?

So assuming there are no other jobs around that might need it:

Reviewed-by: Thomas Huth <thuth@redhat.com>
