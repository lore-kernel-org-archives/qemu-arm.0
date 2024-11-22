Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5274885njc;
        Fri, 22 Nov 2024 02:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE29xp18UUyB+lLLyN+gAhkWzR4blrEn5zU8kBIrOhji6dYq8YDKgfUtWfMdVWcEWXMKGjZ
X-Received: by 2002:a05:622a:311:b0:460:e9d3:e989 with SMTP id d75a77b69052e-4653d534c7emr28520391cf.8.1732270110983;
        Fri, 22 Nov 2024 02:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732270110; cv=none;
        d=google.com; s=arc-20240605;
        b=d+EBv4V+deOOUubyRDB7wH8EVcqFNAjz/djiavwCOPedDqWOKEsIXMs2IrdboREkvF
         Lgt9BQPx6JTtPSdM4uywxIglJqVs4ie8FB7+I5MjtyYFUOJLtVYUc5fCgjQ9d4rTLq9p
         950WbW1g36xf2M3XkOJJGRsXXoWAe7a6DqDeODzIktlYz+b+jppt79x0oQfpNZMsT8oi
         JNWI5aPCufAO2T8QkqhB7cBGIUE8mGbuVHAOpLvVXw0HHa4z//lVKim9sHCN9R4v0s9j
         QBmPQo6oV9xieSRoDH0iOaFdZRlBu5R0/+bVPFMNCxmWLIRbWWpRDoX445/pY4y71Az1
         wWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=CHPDOC/bhHiz0UKHdBmC9DCRRBKVAgjd27EpC81jpKs=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=PGuAMGSdabBe9UE5u5iCOEjBOSmRlVF0HQfRE0ktB8vC5IVRpYGjd31IfycsK4GA+p
         Gsp0Tun4xesBbB/wEfIy3ty4Sh7h+x6JhPOch0AKvkgE+5k+Am31DF3BlnOal33+xV9F
         NIWDYsga6g2ZJ+ouqI8oZdq5PPAmrUUR03v0w70645+RfKtGV+K4gsI9NDTwLBzu8eHY
         Uwga4LrBsLOkD+JPICo5ZuT4OTqTpxH9paOD+7er/UYSQ3SC+6gTj57HhgY63WcFWG7+
         TQSE1hvMPbx1qlWCbGPvmDGgz5ucSTpuYrsj8u2SJUt4sj2FslfLwXTN24EGxNof76HI
         3jcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C0vbc3qq;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c487410si18555391cf.403.2024.11.22.02.08.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:08:30 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C0vbc3qq;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CHPDOC/bhHiz0UKHdBmC9DCRRBKVAgjd27EpC81jpKs=;
	b=C0vbc3qq6VUjfqN1jS9b9cu3hWGjZCLcY0T6qsLjM4ZpaF/5shVHO9sGGezstGvJpkNKQO
	fnEmQWMVfaa6ywlMmyUEyfWdIUNXwzNcT4cGE+Izv22ve+ArsGOOyaiD+pO+PAKG+2kI3O
	PDLqSHyOtmTWNtVs29bzeiS7fhu31Ec=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-PMT2Nd6HNqynvdvjeuKWtQ-1; Fri, 22 Nov 2024 05:08:29 -0500
X-MC-Unique: PMT2Nd6HNqynvdvjeuKWtQ-1
X-Mimecast-MFC-AGG-ID: PMT2Nd6HNqynvdvjeuKWtQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43157e3521dso12940575e9.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270108; x=1732874908;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHPDOC/bhHiz0UKHdBmC9DCRRBKVAgjd27EpC81jpKs=;
        b=iogop4y/lloziNG/aUeZKavzr/XiP18FINiJH9MxIx7OH6nDDgoXBMU3MyRdRoJGAr
         isdJijRRArrrI3rZV0BsInBRnwGZeIZIDFjyNrMiMOKQZ0a1Lj3w6wOJgqnudffR4EMa
         TCBHpiBp+UUygay9sBfzfrkMWpfYp4lWtPy7pv2c+lJY5MY+znGzDrY9Stn7D+QIClyc
         bsSrHBvSW+5bM+1ag98JfyHSYMD4KyaYWcsvtFODVd78s76pXsEpSL9xasl22cG8J4yV
         MhQpwoxMeIipx0Tb4Y1nke785U+V6xPNCBBP2mw+cMj2vs2GlDiY0Gkb7p4NVcDxgFLb
         y73g==
X-Gm-Message-State: AOJu0Yzbh/HuJVWAu+gir8j1xcDXQ3wtwuUMKyOZ9nnLwvaXrV+8z0/0
	Utk09N+xlELw0H1BvcuAT0ot2gs58194q9rx6RICJaxRNTw5Voi152tGQISrw0HiumdutjfY4rb
	sq078HTgWp/nHemIpjbO8gLx8u97F/hpjjri0aOIaONNHniXgywl9HuBRCBaWnCD+P86m9V0fnU
	D6ezPzFSve1VDUgFOtb/aT8fjGI2a87ZQRtw==
X-Gm-Gg: ASbGncsS98sXwICtXmRLokflHL6/O7sbOS1OqbpB6XjWxmlh/+rOJl5lQZfSfvHQW7v
	447NaQqG9kV3vsMbhFrt53aIrkaHBw3XE7wrxsVswfGMqauuhUEw+m3+OBsUF8jCdBHv7DavOAh
	vxesRt1Or46FNNTTdBc8mWF2DyNebblQnviugZOIcDvo9SeHmKqOOEPgH8SXKPUD76+5rhwliNG
	+W4ZcoNkTFiaDUrEWP5RA3tdOHzS4/MXJjt3XI3f6BNcHS1qW5qyEWL8FMrT/2K7lCZ5I1YzAM=
X-Received: by 2002:a05:600c:4e91:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-433ce417b2amr16870795e9.6.1732270107823;
        Fri, 22 Nov 2024 02:08:27 -0800 (PST)
X-Received: by 2002:a05:600c:4e91:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-433ce417b2amr16870275e9.6.1732270107422;
        Fri, 22 Nov 2024 02:08:27 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde058fcsm22327135e9.3.2024.11.22.02.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:08:27 -0800 (PST)
Message-ID: <6ce03195-e015-46c8-a930-19f8b435e4be@redhat.com>
Date: Fri, 22 Nov 2024 11:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/39] tests/functional: update the mips32 tuxrun tests
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
 Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-25-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-25-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zpJigjF66j7QRcev4q6hSzbP-O-JWSOPi0B6moNfD34_1732270108
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tzhIQtq7zasJ

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.

s/upto/up to/ ?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_mips_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
