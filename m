Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp4349220dll;
        Thu, 21 Nov 2024 11:07:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdmhWWwyoL+XVNqau0fCa5I4b1FHk01D1lUZpOBXoPm5vafbD0HDja9TcvZt0tyDPc2KTk
X-Received: by 2002:a05:622a:1ba8:b0:45f:885:fd37 with SMTP id d75a77b69052e-4653d576f8emr1885221cf.12.1732216053194;
        Thu, 21 Nov 2024 11:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732216053; cv=none;
        d=google.com; s=arc-20240605;
        b=XdB9YSnDLGwlOPKKh8q1i4+zh30xgsdLZBMjAYgovGhLa1AW0IDMvTVO93w19RXwW2
         Cm5UoDrQ3n3B2awXxs+jCPXYljl9QlJA6VbR02fN2v47YtANMDxLuwLfU6ULDSmwhU7q
         xIgf0sMktGTFMCZILrNr5Tn5hmdsuTz9j5vFtNheXWKXl0BNEwCsUtwC/NOCRIDnWlex
         aayNmIaotiHcCNb7my8c3vtaweIcRUHffwp2i3zLpxcti20YY8VElTDfhEEjKpcJlnYO
         8igP4vzbTa25fBASZJ9oW4n3n390ZpPVWidWFM7EIS+hV1bIY3JD1b3WNWBGcpJsth36
         pBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=6HnTTX2x3OAGO1JYFH5rKkwCGYup3u65ReQ1R5rAqhk=;
        fh=3ZIpeD8qIEMa900j4P6H4idDomKYC42bwM8vcp12P/Q=;
        b=SCJid1H3bjX67ZujnbQkeHPnAoEGaeCVLfVFTIAM09pSUM1sOvmj26b5Z3rN9BDzpU
         acIN5PAoqc2kun9+4efh/BlsJRYSVo0Lv/CrG69tDGaG770i25Vesnop6Ic0gijghRPZ
         hoOuj57nqEdX1IgeVnLQUq4ldcGp2RQYETbHqW6vjAwOh0qJ9MoGlEiAaMEUNG5Egm+3
         gUlp9gbg4P6J6ZIS51KejCAjyhvbo3fJQeGbzwjhZAvCjDXjWABj2QI63hCCsrkcq3iO
         vvs3bgbEcRiMKX/skezYKsOzEBidhS7HPfrWmyr9mwKxjihTSIlrNKFIsrNcJReAU9np
         TxpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d8iBU43M;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c3d5d51si3694391cf.107.2024.11.21.11.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:07:33 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d8iBU43M;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732216052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6HnTTX2x3OAGO1JYFH5rKkwCGYup3u65ReQ1R5rAqhk=;
	b=d8iBU43MdQlggi+n6+uGql+r3ATwzPFh8El/SRv6e7AIPxjIVsLHwoVNCPCfWucXEjRU22
	sEcaxKNda2kIdfy1j+3a8KWuWDvhaU5KhEzygVbiXr5CKPtmQpYZ5QyW0Vx0dbr8eCtQ7+
	yCddTWj+t9jGkJuNXX0CPLGy8JPQywY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-48hnvQ90M9u3K6qbGGDEdA-1; Thu, 21 Nov 2024 14:07:31 -0500
X-MC-Unique: 48hnvQ90M9u3K6qbGGDEdA-1
X-Mimecast-MFC-AGG-ID: 48hnvQ90M9u3K6qbGGDEdA
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2fb5035169dso10212431fa.3
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 11:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732216050; x=1732820850;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HnTTX2x3OAGO1JYFH5rKkwCGYup3u65ReQ1R5rAqhk=;
        b=HpUzR6n7fBRb7a8YQ+EpFnoKsAPm08O+s4DHYDlZO/hH9Qj6cLWgRLMoB2oZS1AR+Y
         9seQUhuHosnOWddygaIrrvVIhrL7qP1wUQKTBXsFs8PHXTG9aZiiM+cQ3AMagItpi3Ie
         selvhdlmQ9y2VEmkcTU7vdHWtC1R54wJ4aOKUG+eDYTKKIWV4fvo7OmdWkQGz93GFMst
         R2eGqBihixF+/trWX7AJdbndWYxsvOq+lXewz6MpCn0KI+R+8i3UCFeTV4pvQq9IbpGk
         GOV5LN6DyP6cRfDUDzCmV+YdOtCcagUqi4+IhjV+JBbddG0GEKmonlkRe6l3eQimGcQK
         3IjA==
X-Gm-Message-State: AOJu0YyxOrNQbw0i4hxWMKTEWcjlU3BlVdXJNHcY0PYvIGKO7EOfP+sF
	QV8UJB7kVkjl5X4ZeCLWax7K6KZwa6X9szQRmQLr29ChqPvaxxNW+LYfILao+tLxfKWVe4gdaCw
	7oweG7/n8uY8GDErDZf3LAPIXSJLfrgw9DxJWfoiFoDQYQOJjcd5w/VYclWfbiSWpC/VLhugXqc
	5fm60R3C/+TX4czbOJ0a28zqg27ETXf5tDag==
X-Gm-Gg: ASbGncuFnd8bkxNY28ky/d0HtqDYIe1TkXws5zq98YTP/kkQSm1REsuSWq3d3OirN42
	b+QiAdxiz1Cn9U3G7g+Fcu7QlliKDVgYhVaLew6Y+gk6iwsfJd1JFChSXXCIF0L9KugbHxruRp7
	voare64k1jcGehsCT48U2fsCs++eLI/mEQkE6OUe2+gdGXUkPz6llyFJkeLQdopwHowyjgBxWIt
	0+6CR6qVz4xbh2jyZunBJKL4HzFjjM7zyqB0NCi2zwhOxqM5HbTioohyF09bUmcNSEhfZpc8uqc
	bO8=
X-Received: by 2002:a2e:bc02:0:b0:2fb:51a:d2a with SMTP id 38308e7fff4ca-2ff8db311ccmr69166971fa.12.1732216050081;
        Thu, 21 Nov 2024 11:07:30 -0800 (PST)
X-Received: by 2002:a2e:bc02:0:b0:2fb:51a:d2a with SMTP id 38308e7fff4ca-2ff8db311ccmr69166311fa.12.1732216049498;
        Thu, 21 Nov 2024 11:07:29 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57bca2sm4186566b.143.2024.11.21.11.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:07:29 -0800 (PST)
Message-ID: <b2ba9b36-5971-4107-a6af-85b90ad18225@redhat.com>
Date: Thu, 21 Nov 2024 20:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/39] tests/functional: add a m68k tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-24-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-24-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6WRaAHyOPjmfEu0PTbZRJM5bu1HFlgwMSEkThZBWNpA_1732216050
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: z7PMQPHbO1xc

On 21/11/2024 17.57, Alex Bennée wrote:
> We didn't have this before and as it exercises the m68k virt platform
> it seems worth adding. We don't wait for the shutdown because QEMU
> will auto-exit on the shutdown.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/meson.build         |  1 +
>   tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>   create mode 100644 tests/functional/test_m68k_tuxrun.py

Nice!
Reviewed-by: Thomas Huth <thuth@redhat.com>
