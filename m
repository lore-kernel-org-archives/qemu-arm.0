Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5290193njc;
        Fri, 22 Nov 2024 02:42:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyP/ws/gFA1vwfn7K4I0tQ4pUpZQZo+9P4sfQErXq32N70SeIiY63TIgwgaNqLrVk2dAK2
X-Received: by 2002:a05:6902:c07:b0:e38:ba98:47d9 with SMTP id 3f1490d57ef6-e38f8b31f6emr2432931276.14.1732272178545;
        Fri, 22 Nov 2024 02:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732272178; cv=none;
        d=google.com; s=arc-20240605;
        b=HFxkoYtKP/2pM8CO1GjNNaHUW4VWk+dotBV5QphxFt7T4sUYcd8l4Lndn18q7VPu7G
         wgDs2iBN7KTdKECu/f4fNVu6JNxM1BiNsbOi8jQMCKnJfR/mL3DS9uIRPANkFPnS5HOc
         B/IKuoZcms5lLOlgaZPmgk/hHy8qDhXIEvIuNayb8U33MsBTCcp0qz7vXCs1DRWqkWdb
         Zh+7TCO/2DfnAvu+oehWJ7jOclifdBUcyMfjRfJky9GFD8bn2a5GETOBF/aADouw7mMc
         k97ED6DVAkneXlz7BTn5dK7aBWlf9lorriRYXE/5zCo2deDJeA+ON0PaFaoz9KA6S6dT
         nJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=XDWhG09b1M3YkmeGaVzPHcfpA+rK0S/xUV9V5wCqu7U=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=Ny7Sy7NWni35AEJTZFgnQLocejZlKcojwGCayrNV03nec+UD3jf43XJrTJkfZ7Opwz
         +aROTrfEQ9vhx/ZguChupFZWnvj3YQhdVz1zyS1VF5SSEVu2QhzhXAgFoEms8LyQoWP5
         eMNFOrQAu5lkxSgU7imn2uuCURp4PcY80luZH5CveMPQb9IYTbiewynuD5jyJ81m0U+I
         rt/3PvXQKIjJL0bjVGcXZfXygy3IIvoqwxJ/kNLkti4k0f7hIb+bo1CD4vTe9vUePxMl
         1F3Mul2higZ+DVm+z58bB8Sa8nT0HeMGtQ4cxeKCtdqQyzdZTxETKXxFzyKt0vjv81J/
         5/TA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=huiWNFgq;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c4a5410si18869821cf.630.2024.11.22.02.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:42:58 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=huiWNFgq;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732272178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XDWhG09b1M3YkmeGaVzPHcfpA+rK0S/xUV9V5wCqu7U=;
	b=huiWNFgqPd73wxY30pn9343hHZmrOYJ7bPfsG2rDs6p0kjf1N1/L8eoMrHIkE2oMMSnwWF
	QruO4SHOy9a7/p7+fkzlBHgGwLUOtDUc7S3m+hCU/EwqAAIj7ke8rKTOocJHT5Kg8ZHPmL
	2NeGUwMK4TssbfrpVtvSRpi4McbKa/g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-lEgA4jgKPo2YnyFn_0AtcQ-1; Fri, 22 Nov 2024 05:42:57 -0500
X-MC-Unique: lEgA4jgKPo2YnyFn_0AtcQ-1
X-Mimecast-MFC-AGG-ID: lEgA4jgKPo2YnyFn_0AtcQ
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-460b46cf23cso24307211cf.3
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732272177; x=1732876977;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDWhG09b1M3YkmeGaVzPHcfpA+rK0S/xUV9V5wCqu7U=;
        b=dRxWDq+zM2blVltZr7+1Enq248EJWrxeaOqGMgk8PprA6IjHIMB3kzlAsyWVJe/wed
         3VFsw9sXr8zuKhioJn639oLwBfbKogt0i308buZEjbaiOi6QSCX75hixHeMc13/5CcOA
         AoECC1fQNQb4sZAT6pr3Y3IqPlgP+7vIXcrEQSvmlsfRw8sJlceKIueBkpEThPaLFtHi
         oPRosCKMfBNma4++Z3g73R7wnupECRkHGC0tL7+/dL2jlzduyHFBdfF4PKaZne0EDIVE
         JOr2nRZVd6cifa1/HhfNvFhj+ZTmJzRovp1COmGUjoDBeUfze3s6R/7cJqbfq+dkkCy7
         jUEg==
X-Gm-Message-State: AOJu0Yy7AVY6EFH3M3p8a+39BtybTir7uF90DsENSUuDpXAJXIfRV6Xz
	k4SyDFmWKxZ/1ZNfyC78kGE8jj9K9462rMIDdkigcFPcjR3pw+Kqz/0NY+oyKcnSH1/Roa2oNh6
	B1oGhezZXpiNTxD5cYGfy/LMafuW+O0EHU3Ntu/OTrvYfSMoVcXBK86PLI9OdcV7DqlKy+15RsL
	f+U3pKlio2mDy79ntamGvnlbuxK1cRBnGNszAx
X-Gm-Gg: ASbGnct/U2AYl4G58eGqnlcSemI2QKRoOZqat8j9TvY/AIdQoAZq/Tk1aJwK8PjESml
	1wkApUyNgVKf+pFuwMeujt55NX8y2UDn3dntgcyKKhUYusfubmJag4lCmM0OuT+fY1pNGwzW3T3
	C/5QT7IM0iJpK6UpBOIofngbTLD3lLEwNsvhcY+S4WYbxotQrgxpvrXwYAnAws6q8O16JIkJvWE
	LiRc0tyPfgtVGpaoSJdFTMK1Dyn27l6A+ubhCZTY989tb0CKOFzA7JLaST7vyMScDPCgphyN50=
X-Received: by 2002:a05:622a:90c:b0:463:5344:b9a3 with SMTP id d75a77b69052e-4653d5ae3e9mr29142501cf.25.1732272176722;
        Fri, 22 Nov 2024 02:42:56 -0800 (PST)
X-Received: by 2002:a05:622a:90c:b0:463:5344:b9a3 with SMTP id d75a77b69052e-4653d5ae3e9mr29142021cf.25.1732272176399;
        Fri, 22 Nov 2024 02:42:56 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b51416cd4bsm72572385a.117.2024.11.22.02.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:42:55 -0800 (PST)
Message-ID: <bcce6104-9021-4fef-9ea6-a260bddbaf17@redhat.com>
Date: Fri, 22 Nov 2024 11:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/39] tests/functional: update the ppc32 tuxrun tests
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
 <20241121165806.476008-29-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-29-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B9bvjBWCwugiCzt1p4eE3V3-iVCaZZB-y63JrXfhuNk_1732272177
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x95XpdJdbw3f

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_ppc_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
