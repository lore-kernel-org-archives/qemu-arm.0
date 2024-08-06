Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1335762njb;
        Tue, 6 Aug 2024 12:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8q2cOq6Lm6W6XiMWenTXW09nmD+z3iLVO+IwQF3/vapJCQFMtnX6I3YdPgY7ow/YfNCLwuGd9Kk5FoGSpkUxv3w2uL+D/
X-Received: by 2002:a2e:914b:0:b0:2ef:2b56:36a9 with SMTP id 38308e7fff4ca-2f15aa991f9mr102620691fa.16.1722972539415;
        Tue, 06 Aug 2024 12:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722972539; cv=none;
        d=google.com; s=arc-20160816;
        b=niHZKKVDXrkkaOmGBSsc1h6GKbDj30bxM9yDNAE/+Fikyca3Vm/vGXFrhLBGnNsYGB
         CaS+Nmg4iXW0H9zR533pCXWbZ5t+YhhMePAZmI4/+X2KUVaNAmroMx48PU3qC5qcEcd1
         2vPPytiWzvi8Zv51XoWdK3VgbMEKDISRONFSdt5aJcAKeDpF82jqjTryln+NNC4oSBP6
         kU+/+/1cbIbsjJK9GxfiBbnR2+ukZfDQ+LbAGUUa6hLCqlJsPjxTrNQ7Bl1PmLFM+vcP
         18bsAI6570ql8biTEVJoQahqoL6q5+piMzmrSMTxrTG15amTqFq3WZ4dBLOp05mA1Ukb
         T6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x9ggTlFpDeO3tzm3B+faf6LESHtYJaV4u5jSKjfZQ7c=;
        fh=6Nh/cBB4dnAydbmKxKeC5R/ttwAUd8G76YuamFRabeM=;
        b=g+R4vBysnbyBXlOs6A3TRuM+Rcm2Wf/TLLsSgCqi2gIeRoXEeB3kCPFnNPIHsXBJgF
         tCpZU6IvQwJY72ISqdU8BJSO3KKvpvacLqerhp4frUmaKQol60pRRLFnJ+gyM3AkVvPa
         G1NBfHqmDJWgzz9Mt7iLuMWns8bf5XQiZDfDPgvvKd2VjbTZ12RxBdXjkdW5R9HzciFv
         AuaH2DD2luBWMsFKGKLKOgkYg84M/w8zivWSSJXtIau/CxIjdmbzH90cVif8fK2FGJRY
         +5t43FAGyBDACbC4R7E20a+lowVjh3d8xiDaUp3yE7SgBq7nTGoMZj+6kQR2evqHLU8Q
         JdDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WhT9v7Z4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-428e79e1198sor23892925e9.8.2024.08.06.12.28.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2024 12:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WhT9v7Z4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722972539; x=1723577339; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9ggTlFpDeO3tzm3B+faf6LESHtYJaV4u5jSKjfZQ7c=;
        b=WhT9v7Z4ARUAbPXIBHLa2ZjRw0mUPXPfZ85+2bJJHBPyIQnVhLOCQe3tFo+VycdMd9
         pbqZqno4Q2WQLkfW9FbChN3wRBt9yEAaIeLvrWAfzGTeQNwNo2uU9Ex8bS2v+d4dw3k4
         uD5r29d9svGyJdb4GwmZCkKdpUhdjorqpeZue1b0yaMqjgU/VWAVxAeI50V17xheZDPn
         qp6d9A2E3lT0QZcBhpbk9s6hkDEgUN0oenuA80YlhRPt8fKW69h1DFl0AsO0xdy4cYwm
         PCW0HAWxGq5UdPd1SCJ0zipSUJgbqQSFcpzpKaFw14MRSgW9vcjS3Qw4zOEeH9v6V/AT
         5TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722972539; x=1723577339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9ggTlFpDeO3tzm3B+faf6LESHtYJaV4u5jSKjfZQ7c=;
        b=nwEnK3vFBfzu/gU/dLemeH8wEU+HcKXj3t2Fc5/z0DOEGNs9Zfh5OlFUIXdtoVvlE4
         NVf7Sr9C4Dd1t3oBl2OYvVHNQNhtHR3S1oe+58cUtJp49q1ICCdhedlFRM0IO6/1Typh
         o3uJOue9lXE1lhin2f3dGo13D0zfDU8piVvJdB3bOXMye/pem+OW/HKxG2vXDlhJ16u+
         3qs2eFvFSigV07AbUM3PymxCTd5b2bBzg+jyQQ/sEEBfTdjzWSz8MwD+72bWApRKM6Yo
         qZCpvRitnizY+hiXcKdMdIEsQ86eNl9JOSYhNblyFpDgJjE1S6aLTAyrBs54HIvnfTHR
         yqzw==
X-Forwarded-Encrypted: i=1; AJvYcCU7bV3fsSI8T2sP/Nzj8Q6QelCaTwe/UzsfGdLohNdponL+pzKd4k/4b0qzElFlFE0+RKPXZrTHpa4AYAXwihmwgGDmNVDD
X-Gm-Message-State: AOJu0YxM2lEbPB2hJFycG8oq0gZTizWVsTToDluitcCl2nClILTf8815
	vnbdN0QiolMISy4XosXQRLEB2tmyW3WvtTcrNJQY24p7dWT5+hiuOWGyac0j6cXgNQ==
X-Google-Smtp-Source: AGHT+IGL95hmR91RbPW7U18cwZze82jNZRU9+smHhYyTBI74N3P45y9f5389mZP9Wnej1IeYT+r52Q==
X-Received: by 2002:a05:6000:dc1:b0:367:926a:7413 with SMTP id ffacd0b85a97d-36bbc189bc0mr8767580f8f.63.1722972538773;
        Tue, 06 Aug 2024 12:28:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-141.dsl.sta.abo.bbox.fr. [176.184.43.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bc5a6fa1csm13026553f8f.78.2024.08.06.12.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 12:28:57 -0700 (PDT)
Message-ID: <640b97b4-583c-4fa5-8ea1-be6c120aea8b@linaro.org>
Date: Tue, 6 Aug 2024 21:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] tests/avocado: apply proper skipUnless decorator
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Radoslaw Biernacki <rad@semihalf.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Beraldo Leal <bleal@redhat.com>,
 kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant
 <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>
References: <20240806173119.582857-1-crosa@redhat.com>
 <20240806173119.582857-3-crosa@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240806173119.582857-3-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rQuKw2P73Wdu

On 6/8/24 19:31, Cleber Rosa wrote:
> Commit 9b45cc993 added many cases of skipUnless for the sake of
> organizing flaky tests.  But, Python decorators *must* follow what
> they decorate, so the newlines added should *not* exist there.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/boot_linux_console.py | 1 -
>   tests/avocado/intel_iommu.py        | 1 -
>   tests/avocado/linux_initrd.py       | 1 -
>   tests/avocado/machine_aspeed.py     | 2 --
>   tests/avocado/machine_mips_malta.py | 2 --
>   tests/avocado/machine_rx_gdbsim.py  | 2 --
>   tests/avocado/reverse_debugging.py  | 4 ----
>   tests/avocado/smmu.py               | 1 -
>   8 files changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
