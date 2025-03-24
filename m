Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2115523njc;
        Mon, 24 Mar 2025 10:39:40 -0700 (PDT)
X-Received: by 2002:a17:902:c94f:b0:224:f12:3734 with SMTP id d9443c01a7336-22780da454emr197152195ad.30.1742837980226;
        Mon, 24 Mar 2025 10:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742837980; cv=none;
        d=google.com; s=arc-20240605;
        b=APpUnWwJMoZsayPOgSff5Pxk5zOFKvKlSmFU2Wet9MfOMUXqcDi1ofDOK5c/aDbZVw
         A8/9E7RuH0dnwHsTFBiEDn/Hgu3xBV1guKh/z6g1vAjBQTgOhWHI6eOMg7O0kB4YywB2
         oUuvPXbJFEJMnaFiJMzypaBN5fsW8Eefxde6k3amnoaX2t6qw6H6CbdzGjSHprphuJGI
         2XimRn+XN92JDksg6ZJFuJ1QJ+sKgp/egWeFaAsrRjnlA0Tiu5YQnWcdWvOELQsLQHVZ
         xG41BZp6D95ewZkIwLtv62NxWeZ0eeEsf/9WmlRHByhszB3u5kEbZZfy+okkT8tMv6wD
         8bEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=H43yI9IHhRzM5/JIECZmk2z56+LmKwxWdeivbsQ6qQs=;
        fh=ovdbSbF25NqXHN8+ozjnsnyIjY+LS/trBWPh5LBor84=;
        b=bRx20u4OkggozCo1PbZXgimXEE3UYNGK3dHi1QqZA2VyXLeORrFp/g0NA/F0RooLEt
         pDSWFnlauI78Xl6BRhnhLD2YiOQp3NzlOd5EelF4dIVAOwHMwmOVzq0XuNDJnVY9CvQf
         zNVIVWNq/Z5TjxGFeWpP6Wv7B/YI1PwiGCzc+CSQt6JCY45MkFQToZ7K/hAtlr9nuhch
         2k32ObXxJMRoSvJ7rmrAskntV0HD69YLdJcO/ykHk+q7wT5M4F32SY/CV3IK/qx3hcK9
         Mu+T6dmNlkXbnGSkXZKsYk1alBPJD6yFI2W5nYaZ8Aix+bv2D9Hyqcnyv8jY1QiwZx1L
         V9uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+JpiX09;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f42e53sor70955025ad.9.2025.03.24.10.39.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 10:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+JpiX09;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742837980; x=1743442780; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H43yI9IHhRzM5/JIECZmk2z56+LmKwxWdeivbsQ6qQs=;
        b=i+JpiX099z0tKknB/hs1IgQ/yULMBKL5jr4CzNMMVvTdm6gmJtWyr8iFkhm1tUs6s/
         rKSkcQv+MzDZGz/IZWq2s0/cJ2jRkxHpcIKYG28Pn6sl1CG7QHN+61YNvIu8aBOPAvc7
         JfzV56tX/5x5+02RwTZRLnwlK25wZ17Ibx+vdlnqRMFe16sPN3g1wg9FWX8LDKE8siy/
         LpzgSAzkWBSCn4OS/5JI1H0iWGQEPo3GPI1gYfA7jHy7E7Ds1kskNdiZTr9FxLZ1ruKB
         nZzsTwIDilDR3iyVnBwoUf1tb0yIKXYgOdRqbqRQ3hBv7eKZXhf5AilO2t4kx4wPdNXC
         RAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837980; x=1743442780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H43yI9IHhRzM5/JIECZmk2z56+LmKwxWdeivbsQ6qQs=;
        b=VHe572na6lUjYKggw0j27ieBPVJEUa7OLtgHvLegdI3sjwovzEtZcOuSNF7OvGq21t
         C3FOfJo1vMgN5LtaJEGLoinrAZz4jPwi6fl/7Ivk+ymwmkAPUraH3YIcw4ypYVjL41z+
         Xc4xxjU7GX8VmGNAMTY10jaAngndBIfW8nnotrvHA3JEBgvJmdAXYgJc3vaPW7iOA3qu
         bC8miKU8Vbi7RrebLFgj84s072vTys6wuSVNNWZiYI+Lzu/Ongf23A9o8vxa4vezj4Pl
         OKDRjX+DnAQ1oXOcY7ZimBQX9eh4YB/jS1uzy/q/CN4weecxGvF4fXalknoH3cqMLPgo
         4n3g==
X-Gm-Message-State: AOJu0YyMfaKr0GP/F4B8DlagSaXfoUJmLjARX3YkZk9i+zQfWIjvHB5c
	jtZ2NkkaRTgdGuamPv3UP8ilXt8pKvuuRUQuEcIB0tZiNATC0yXm5rnXxgWAQLTcZ+DiOQbIFzc
	gF0g=
X-Gm-Gg: ASbGncumrmRnUAwBsSqbk4cZYTetw3sYZuCnr56P1Z8DnJyLhuXQQRGAC19qz3lAzWn
	CqXhG30zLdSJZfqEhxJW0ZODRRxGC9nxooaOdJ+Igx7yjvga1bci64HyQUBvm7aVIWpkhKVc/zV
	RtL6QEvI6Xi8Ro8kmwEDGRDLCClLkFmjJ8+/FkN9Znsd0mwoiW2J0a79XM84zzXm++ZPeUaP88j
	Dko0aFEPp6mT5OIcTbyvdauOKZlD3NT0oXpwubbImjwE9myyKRiGELfvx9EjG7aEQ8lfdf6Lz2O
	XJbhsqlfHXMpKd/t9CF8Nn1oxgFQquyMk8xGu+mWYZDw/A7MKNwksd63MWL/srt3WEt4L0UoSS7
	ly8Ibb+td
X-Google-Smtp-Source: AGHT+IH8lAKoVdlOynhDu7hqnflXSip281umj4ONmUseLhuiajVc4y9nG1IVEf1R+iCMHJMGZW+15w==
X-Received: by 2002:a17:902:d58b:b0:215:6e01:ad07 with SMTP id d9443c01a7336-22780c551d0mr196360325ad.6.1742837979623;
        Mon, 24 Mar 2025 10:39:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811baf19sm74400125ad.149.2025.03.24.10.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 10:39:39 -0700 (PDT)
Message-ID: <c99b4b18-2222-4868-9e2d-78305e530663@linaro.org>
Date: Mon, 24 Mar 2025 10:39:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] target/ppc: convert gdbstub to new helpers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-10-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250324102142.67022-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: QTn/Wo+peYPy

On 3/24/25 03:21, Alex Bennée wrote:
> +    #ifdef TARGET_BIG_ENDIAN
> +    MemOp end = MO_BE;
> +    #else
> +    MemOp end = MO_LE;
> +    #endif
> +#endif

That's what MO_TE is for.

> +/*
> + * Helpers copied from helpers.h just for handling target_ulong values
> + * from gdbstub's GByteArray based on what the build config is. This
> + * will need fixing for single-binary.
> + */
> +
> +#if TARGET_LONG_BITS == 64
> +#define ldtul_p(addr) ldq_p(addr)
> +#define gdb_get_regl_value(m, b, v) gdb_get_reg64_value(m, b, v)
> +#else
> +#define ldtul_p(addr) ldl_p(addr)
> +#define gdb_get_regl_value(m, b, v) gdb_get_reg32_value(m, b, v)
> +#endif

Surely you're not intending to replicate this in any target that can have multiple sizes? 
This is not an improvement.


r~
