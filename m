Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp874840njb;
        Wed, 8 Jan 2025 06:18:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB4e6ScJMtTOT+Kh8LBTrwhqgOiA8HuSIJ+IpnbSOzfnxhH0La994f1S+qTfxJc+HLPMOv
X-Received: by 2002:a05:6a00:139b:b0:727:3c37:d5f9 with SMTP id d2e1a72fcca58-72d22017c48mr4733361b3a.26.1736345885742;
        Wed, 08 Jan 2025 06:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736345885; cv=none;
        d=google.com; s=arc-20240605;
        b=dg8tdDZez3RvgwgIg3dMGpmi3yJPJ9cDWiJzXcqG3NogYWb42sWFG+S4RIXr0rgOTD
         bD3SFu9MTrKLMR1yOg0FpGLBiTAG/nvEuLEBwsbVDLhUMzDzREGtwCrOL+n8gxv+Sh2l
         Qw64Yd3oiFxTggVukBEpTpKPH63RYm2hpMNU2AePTqnhptSixDqATp9hZKQhbefcTD3x
         u45U1O7qP5TZBD2io6xiTdJuzYDeMCgxT9nZohwGTf8HVGu/gJ4YUnFkR3EMBNQsKJB2
         TNVWlgMNj2rB/IAywF0qDfNQRYLIPd7kCa6jZti9aJfaitHG/TNFOj+HsSTvMwSL5kif
         0Jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=hK4LrgKn65rt4FxRBXkhzcS4+wwIGd9OIjYn7nxkKJA=;
        fh=etlUlT9YTuxLNCn9a37I+Y2rZfaCHvtJEafpa9OIIos=;
        b=I1rZjv8UKPrykzIckw9ztOEBm0EKEz2nt1Zcnf3pBEP3TNBp8okYcNr+Mqj/kmYl39
         50ibwDoYXcbB8jswPTVv5uJQF1Vy1PI9K/fVvE/YiAgdfcxrWByvTK1cMgauzoNQ7ZqN
         a/UNQuu7dmr99HeOboCeZDJ0ivnItJ5kLNVJNx/i2TT7qAXSJrVDvI/gilq4bEDTrTS0
         97V2wEdy3sA/MY+9xjVSxYPW95rlKn8GUHBoXe4/F6VpoUVR/h8cg1EVTmsacmW29bFH
         tPZZwwOMo2U8VQ9gdocZW17RNpw/7RnE2NRh01/8esrdJOd9MTguennMkcy/UwrrhPhg
         mK/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hfGu9DcA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72d0fcde8cdsi5056551b3a.335.2025.01.08.06.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hfGu9DcA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736345884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hK4LrgKn65rt4FxRBXkhzcS4+wwIGd9OIjYn7nxkKJA=;
	b=hfGu9DcADP5O6MeJD2h4lzzoRHtlXCvplN67uM2c4WGYWnuq3lQ64xVUPBr8CRWxgFjPgx
	F+Jmn5RJrzfA60sAUSGoaJp8ud67zLYKvJLKeriCw27B6M5IsLebobpmdUmTQ3i9LHUAKg
	pE2viCRJiLrZrYlGefefJnN1r6poR+Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-fXt3U22xM0-wB6Q58eqwug-1; Wed, 08 Jan 2025 09:18:03 -0500
X-MC-Unique: fXt3U22xM0-wB6Q58eqwug-1
X-Mimecast-MFC-AGG-ID: fXt3U22xM0-wB6Q58eqwug
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f274f1f9so2666247785a.3
        for <alex.bennee@linaro.org>; Wed, 08 Jan 2025 06:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345883; x=1736950683;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hK4LrgKn65rt4FxRBXkhzcS4+wwIGd9OIjYn7nxkKJA=;
        b=paJv0MaHaj5qRqgqzc+laYuVZAySSnqNR5Kh/k6aWsBtwMW3gyQ8RioIboUIZ1H5i9
         NOdCDSWprACO96mXyW+Huzkuspah3RjdH7I9aEptkgpkVnd9U4d64AbLCpddcIJ59Lsu
         de+CLvYTnBhCy6y4ZpZCNBYq7rIkLslCDBr6u8h6aBChg/1Xy3nqxugP6Nn3X7hURB4u
         RCfo+gASllcl69RkWqkckNYa90KYZbsFu7ewnHQcfk/GAaW2eO0lNBxub2Nzuk+ghSRp
         SUKNR5lOS1A0K2++wJAocuurZ8G638/MK+SP0ZSp5eFTi10d4eAz+plWLayLSGdrUVay
         MPJA==
X-Gm-Message-State: AOJu0YxWXVkenc0k3wcg+ipyX4UhhF1yu176WAEvdXMjIbhHAdJO0e8D
	JK6K/wMDRTDQiEFoUyMGv2cLEnxEa4UBo504C46BoGN8cQGI/gZLiIBjLRRutDW+hTgrRbMCJWE
	B7SG35Sb4OcH+HFlwZ0aEFJxmfGZSj7orGdbBPvPADCyylL9557wQlln3LXEkgbzBdhREbhPZMB
	YObX0Dui/cbh7L4vY3lQcKikYzByAs/1rvJg==
X-Gm-Gg: ASbGncujIgkcVMaCqdH8YAcpHIyNYM4uhHg2tfvlFEruVVtcV/Sf3Pvr5LjKFHSaQ0y
	PAMy9Xtrdr4g2Jf8K/Eg4oJoAPqSNrJsWNdTyJRwdsMud+ZSw+0nBQ+DL+Rd6DZywTb2UjOpi6f
	s35XcpaY56uSpU8ipYGbaWX2Lks/HFmZuSklpKugNEUEm1hGoMKpmH+Tu8jAqFetR5BkgoEpOiG
	tCDSkXpAlfEwhSYAd6m9IuzGSU6cjzCQm3WivhmJxLnscUFGMIs3zPR9DJsF9Rtp38ELVw3VY5s
	1LUmDg==
X-Received: by 2002:a05:620a:40c2:b0:7b6:d089:2757 with SMTP id af79cd13be357-7bcd977ebb5mr421006385a.35.1736345883157;
        Wed, 08 Jan 2025 06:18:03 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:7b6:d089:2757 with SMTP id af79cd13be357-7bcd977ebb5mr420995785a.35.1736345882470;
        Wed, 08 Jan 2025 06:18:02 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2bc86asm1680338485a.16.2025.01.08.06.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:18:02 -0800 (PST)
Message-ID: <57364176-49ca-4fd4-a935-133066abdfeb@redhat.com>
Date: Wed, 8 Jan 2025 15:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] tests/functional: extend test_aarch64_virt with
 vulkan test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
 <20250108121054.1126164-24-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250108121054.1126164-24-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dtXbtkqGmxvl7pirZHXDHmkDzT_O9i_oTu2PzlqnW_o_1736345883
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5B3C6jB5CGQA

On 08/01/2025 13.10, Alex Bennée wrote:
> Now that we have virtio-gpu Vulkan support, let's add a test for it.
> Currently this is using images build by buildroot:
> 
>    https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.html
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
