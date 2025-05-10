Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1514615njb;
        Fri, 9 May 2025 21:27:25 -0700 (PDT)
X-Received: by 2002:a17:902:e843:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-22fc8b0faa4mr78930305ad.2.1746851244886;
        Fri, 09 May 2025 21:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746851244; cv=none;
        d=google.com; s=arc-20240605;
        b=LIQoDNycIbdwDiFrawgrfvGdZ4uZw7vGj9H4bpfm1KVpL/gsxzeN2tdNhRRTd9dIFV
         D7MK8alt5pr2L81qfjJpOMt/C5gIp+vhHdk9y5Y5BVCQuaWuUQ1aMBiKjn/e4arHjg9y
         n91cVMojSvIxBTdEFHralzJU4i3KMEM12QY/sXlS6m1Dg5i0/u/H1uMjq98oYv4D0hcP
         NttLY6rjakqTDH6KZmyBFn2bDqC99QMBRixlKmLWJ7vp5eYcPYJh/7wl/JCj+JJWiBV2
         g254BpIR7y/jf9W+A9ddDNc+b7XT5gPsQyqL1aoqyO5kIXJBXdsFnw2x0rObaO3mJAgz
         IqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zwaaisldWu+crKb8p3S59yyBtmj9tL5gizYgTjTvJKY=;
        fh=+6wsiH9BXHruXbeKDUE56zbUX2sOP1iVQRiULYIOS7Q=;
        b=AHlQ80mPThJ8QdBKjO9DxraVGTYiqO5dXST9OjxtXYl/1PvyMrXTu7NgfmL0e7AydL
         lIWb8aJtVhgK95Ps98bknvHxQh81Bpb7jAqZff1YPi49myMPUeYscYteLkRj+nnN9FwS
         RkVATdn2PyPCMfkG4RoAUfq0F/Nb4M762uJMuGW3Y/E8VG3nB2ev4YLAFuzmIa3ZWzmm
         7om8a0FlV4Mbje71FeGFGeI7lXq67FBUEQaAoaKa38YgHtSJReyrx0/Vk1OcECicoUuw
         x+wmBRrHQlO94a9Cu8PRK4L1N2f1/ipMoJRgsaV77hwXSSz1mDh4i/Q4h8t11AFntNy4
         Uv1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=b90FucDl;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc581fc90sor21788345ad.3.2025.05.09.21.27.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 May 2025 21:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=b90FucDl;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746851244; x=1747456044; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwaaisldWu+crKb8p3S59yyBtmj9tL5gizYgTjTvJKY=;
        b=b90FucDlgKPzSGMF7XmP937yXuo75veuk7dE50A2TLe3T9f4d8CZgNRHCh+PH3UxG6
         3AhKV2VbE5DVra0HqyVRar7budtO/IARfvGzyP3TJPmCt97kwoBkrqXINwXIbYrBintt
         tvHXtA3yOa0gcMIODOyJt2KYfw7k0eCjnReJEpmDR4rCJfmjVN4RmpZqNEUE50w+d07G
         bMWiGMUsuxIzAVY9lXd+3NRdAX3Io46gWZQOUDz5wkuyVHEx6OF8Cu0yTuRUH+PTg5Po
         p0iz0ChahiQNgeyMvFucTbxc5r0dBZQACgyiEf1dYHSF8ZHTWaS4ucPn2O/HyVH/FfPg
         KvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746851244; x=1747456044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwaaisldWu+crKb8p3S59yyBtmj9tL5gizYgTjTvJKY=;
        b=oehSZw/BRwAGdKCJLyi1Rr7/M6Vtr2Ocl8ol1CLR4M3EQo6oyKMSRendFMMdU+76ji
         1hFlqbp+oBVsx766aWyXvIA5IT+GQxOEsNaj45NCzXHsB5yF7MVaGvfeJnxs0vsz95I8
         ZB8fsLE9j+/FUN6PBAatiNClqjVMlIhaY5PanCfVQzkkp7lbgTGa/VOWvQlhWZVN0Nzx
         TGHjuz2MEUaOLZqRNhGUBowm/NQxCEIUWgqNhPUPT/ekdZsP2cxNRvARtpWZ9G6r4Mdm
         Pj6ujibCbipPBfk+azGT379Ho/BmSwP/SXQ/MKhxlv113X1xfdlFAKcVyLttzcYMoX8f
         LqPA==
X-Gm-Message-State: AOJu0YwZmIglSyOKmgPS6xzhe0axTNHF2Ll5vTFVR8hOXSZ/K8TSu+Za
	MeCzkJhJZ1SoWndrIbzgXF/nppFyuiPOzI1Re6Uc52DiMygoznAKrB8cnRthDCv2oRPSeJOTOc3
	W
X-Gm-Gg: ASbGncu15qZ3D+DrrGFXAv/L25erqRYcqd/BxlQbHkyIvExZvOuBEieeW+9+wUqMWet
	6p2Pbq/bTM23uDndSjWD6RXRcNvzJ4h8inrLquvant5v2J9cdPw2kh12ZfYKWVpia4QtZHeKHZv
	pwtXfm7xqej0B/HVJNAhxfsvfc9Qg6m97Xpbh/2U4rD49VmUy9r10kK/Pj7vuR4eVN4ujcfU0ck
	Hh9hc1FmFpqSuvQaJqajBVabHT2n0dHK2rzu4msVSgeHzZTdjSdcrHJUruogTslnzuoXR2xhTxW
	51nmCueF+ZzOkvDSHT6k/TAtV/oQ4/Upy35AldHTS2FBWlRftf6WYZGhn2Xf9g==
X-Google-Smtp-Source: AGHT+IFoRlWbA6JdbvkTaMpnDwUcpeWAAU4yZj/9ELmRDcplPGFPy+HSf/bgPqd+2CkKujxT7cAOcg==
X-Received: by 2002:a17:902:e545:b0:224:1943:c5c with SMTP id d9443c01a7336-22fc8b4109amr90049365ad.15.1746851244250;
        Fri, 09 May 2025 21:27:24 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82bfa06sm25344445ad.251.2025.05.09.21.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 21:27:23 -0700 (PDT)
Message-ID: <005c8cfc-7a46-4350-af81-46112ad5eb9f@daynix.com>
Date: Sat, 10 May 2025 13:27:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] Running with --enable-ubsan leads to a qtest
 failure
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Nabih Estefan
 <nabihestefan@google.com>, Richard Henderson <richard.henderson@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
 <20250506125715.232872-5-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250506125715.232872-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3owk/YL28zcu

I think the subject should tell what this patch does and perhaps the 
underlying problem it solves instead of the symptom. It may be nice to 
have a prefix "tests/qtest/libqos/igb:" to comply the convention.

On 2025/05/06 21:57, Alex Bennée wrote:
> From: Nabih Estefan <nabihestefan@google.com>
> 
>    ../tests/qtest/libqos/igb.c:106:5: runtime error: load of misaligned address 0x562040be8e33 for type 'uint32_t', which requires 4 byte alignment
> 
> Instead of straight casting the uint8_t array, we use use ldl_le_p and
> lduw_l_p to assure alignment is correct against uint32_t and uint16_t.

It does not assure an alignment is correct but instead performs an 
unaligned access.

> 
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> Tested-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20250429155621.2028198-1-nabihestefan@google.com>
> [AJB: fix commit message, remove unneeded casts]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/libqos/igb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
> index f40c4ec4cd..7df9272069 100644
> --- a/tests/qtest/libqos/igb.c
> +++ b/tests/qtest/libqos/igb.c
> @@ -104,10 +104,10 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
>       e1000e_macreg_write(&d->e1000e, E1000_RDT(0), 0);
>       e1000e_macreg_write(&d->e1000e, E1000_RDH(0), 0);
>       e1000e_macreg_write(&d->e1000e, E1000_RA,
> -                        le32_to_cpu(*(uint32_t *)address));
> +                        ldl_le_p(address));
>       e1000e_macreg_write(&d->e1000e, E1000_RA + 4,
>                           E1000_RAH_AV | E1000_RAH_POOL_1 |
> -                        le16_to_cpu(*(uint16_t *)(address + 4)));
> +                        lduw_le_p((address + 4)));

This line has are extra parentheses.

>   
>       /* Set supported receive descriptor mode */
>       e1000e_macreg_write(&d->e1000e,
