Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp979738njg;
        Wed, 26 Feb 2025 07:27:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfHMLvsXDgdvXwQ7FMnAu1MvTmcZ9e1AScWiVM19HCom/GEOHgnSXGyglbzczsV/g9huh9
X-Received: by 2002:a05:6102:32cc:b0:4bb:d688:9bf8 with SMTP id ada2fe7eead31-4bfc27ed54fmr11427092137.13.1740583640590;
        Wed, 26 Feb 2025 07:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740583640; cv=none;
        d=google.com; s=arc-20240605;
        b=E3OYK+XfAbljWjeBLyw/oqxh4lX2ZFTwOkASSekKonobSpRLbHydLYUShKla3QbufN
         xyc7GtFeXcL0My+c+ckaHHtpPHBcRLZLYsDVmAmiCuHpfNfK1Gi/73xnN+QWNHJ0AXuh
         5FALo8MiPYTNfm1UzErj8Bqij1AViWpKOh2tjKRtFjwp/yEdDmvsLxkgRJ2/Ijxx/BPS
         I0ZapbMkJx7e17baPuTwNFj5ndR8hliq7FzmV2faDNyeI2fbnzEmrlk6z1BUbB04kPgi
         BOP4ZeKPT1ucUe36whmryH917A4JZdsu6ckSizwtdoefN90JYHKPBK8h3PqqENCQ9Nws
         M/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=aSLI0UBvfVpH8vcL+mFWy59gnxBebYqtXeyZbhvBsuI=;
        fh=kMuyKEDVLpXx+n9GsiCpA1spgm27ONyskfB4MRxywKY=;
        b=NwrzCB5tXBaRUGMX4vnVPCbnHw1uyOEb4d7yJWbNXdSJ5ow3O1ruVl9/iG9wOOhtvV
         MxM5XcqxrphWWOwCwLTA66aP5nOBNK5lZ5n/okadhViS2vcGp4QlvCqucsEWBOg907Jw
         N15pAuhX+b8ANae8ynLaHKeiUVHhzxzK6SSQSZMsH2EWylDESLwD5vuUXzsAMP+oOTZl
         TPYvjcAu/IQT37Lx1daXZUb3XIWy4vNNj46Rvzyo29zPQ4CndBeL6HFPeBg+zk4eswGp
         q/STTdXDqO8JUwu13TLmuSg6P+xBaDnHSF7OrdGAmxpRjBlYgMsXSNe2derIKvcvaAo9
         RZMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XZHXH8N2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c00c57d7cesi758585137.58.2025.02.26.07.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 07:27:20 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XZHXH8N2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740583640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aSLI0UBvfVpH8vcL+mFWy59gnxBebYqtXeyZbhvBsuI=;
	b=XZHXH8N2IUUMz2vVeNPGjpd9bJ7m8i9x8cbUFyfXJyaULnDYNUQHQFPHqciOHsc+paptPV
	pO34D815DNzudp8kGe9qeWITkCxOCVFUIdtrHbCePV4dNOoQUy3iR7BhXfiToCbc7Hd0dk
	g/KGGhi5+SgeiecVOviXJkeHuQfXTm8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-w8dQGYJUN7q7K80vocEj7A-1; Wed, 26 Feb 2025 10:27:16 -0500
X-MC-Unique: w8dQGYJUN7q7K80vocEj7A-1
X-Mimecast-MFC-AGG-ID: w8dQGYJUN7q7K80vocEj7A_1740583636
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso63978945e9.0
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 07:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583636; x=1741188436;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSLI0UBvfVpH8vcL+mFWy59gnxBebYqtXeyZbhvBsuI=;
        b=WR2XaAB58i1cr+6K45mDye+P7tBWWJ4sPJltBFoIl9OBESmivG2dJq2S0bQ3E+MJ5R
         2+Rtl38bibk/3RhwFk4w0TQ8mvfNaBR4g2hzGesKBHFCqccq62c0YRYNppW0vNvkyezT
         9powBbOeI/u1yF8LO1/TDDpNtctaJ3AcfEE6c56Z5DwrUASbB4PhxBeCpj3/RZx6IQ8r
         wY6q1VfD8TkS7mhVWhxhJRgi2A5j7LOQ2VEiN1YFGHJeRfcR57IfcQLI86XCKzwUvM+9
         SHpmg2lDD68plzYYZCVjsGp3WUi9BI556BRFTVdJYGpbO1tGUmRbeuRdvACAIn6KSOve
         LYBQ==
X-Gm-Message-State: AOJu0YwrULZczd3gSqOpxC4XdHyzTay1I5TNyWQVYxy4tFmDxLxw6diZ
	MtVajcpoWkggAKwBTgUYpI4yTtd9UdV0XkyKpnaPacbR8/2OjkBwx32HEA2tUhwh1l//XiTyErr
	CUf5r0QR2kDqPId2lLlbH3p3BTab1bn6qENKXUasw7W11S9tnIT/g2ulNRLIjBqCtpMmL038YOo
	1uz+7ZsAXjwXeNoTpMclZGGjz6cEWAbH81gA==
X-Gm-Gg: ASbGnct69YqvsO1/3LweGOhi1Bm4y1FZzWo+opQm77OOMB6tDoZUrolohigniGx9+D5
	uCOrBnuQxcU3DAbJWRx49e9/mLBuK6ldJCIr3DzSl9U18OBlDgFqE75QEAC0PNZ16vBYSdScTJi
	jxh3BEWJlGWK2ZiwESAcvjrVbRiXotnkfZr9vNKA8DNFrlnuCZJtxRRHLlWOJH2SDVKv0RvHCqz
	OlAkD9KA6eD/W83fcFtrwSkIGaF6RtKdql32GbMv+D+IuQ5vgc6qx0ZT7F+szoMFgYU1GpZ8ri6
	vdaIUa6n5LNpkzImXyw/jGv5t15/EHwPeeihpoKMGeen4EA=
X-Received: by 2002:a05:600c:3c9c:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-43ab0f312bcmr83710055e9.12.1740583635794;
        Wed, 26 Feb 2025 07:27:15 -0800 (PST)
X-Received: by 2002:a05:600c:3c9c:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-43ab0f312bcmr83709375e9.12.1740583635271;
        Wed, 26 Feb 2025 07:27:15 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba539466sm26658195e9.18.2025.02.26.07.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 07:27:14 -0800 (PST)
Message-ID: <354fdafb-9a09-4ac8-bfa0-86ac0e9ad01b@redhat.com>
Date: Wed, 26 Feb 2025 16:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/25] tests/functional: move aarch64 GPU test into own
 file
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
 <20250226140343.3907080-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250226140343.3907080-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SZ6RwYujy2xHNXl-_lp1TMvqBdrRhzztFtQPjhCGwE0_1740583636
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Qpo2EvHuoeiA

On 26/02/2025 15.03, Alex Bennée wrote:
> I want to expand the number of tests to cover a wide range of
> configurations. That starts with splitting off from the normal virt
> test from which it doesn't really share much code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250219150009.1662688-2-alex.bennee@linaro.org>
> ---
...
> +class Aarch64VirtGPUMachine(QemuSystemTest):
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> +    timeout = 360
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)

You could inherit your class from LinuxKernelTest instead, then you would 
get this wait_for_console_pattern() for free.

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>
