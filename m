Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp327738ejo;
        Mon, 11 Dec 2023 08:36:59 -0800 (PST)
X-Received: by 2002:a2e:7013:0:b0:2c9:f9e2:7ab2 with SMTP id l19-20020a2e7013000000b002c9f9e27ab2mr1655646ljc.94.1702312619341;
        Mon, 11 Dec 2023 08:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702312619; cv=none;
        d=google.com; s=arc-20160816;
        b=TlisTD/Q4/ElgBdmQgUVwhBkgYIt4hwidjA5KNSurNmk56zRd6wFSVErunwvdiBGZQ
         Bf/4t/rplrgZDO+3H/6MMn60aAU+RfIqDEZOaPGiG0npGrxryJFmPsZgMeVrPdJDl9Wm
         A3JuajzXrBqVIlLW4WEKUAHe7EOuDiRGavKaplw/SJXI1H/6eZRBTDuqfbx1L4sS2xyg
         NEaMQ6fim54TIkU/49MR+WQlcyksxO+9CWfZBj8s/z7q/IvETxGsWa6SvI6pzNT1NZcb
         LG5IASrUO1YXeO/BV6FaV/VShREip/AohSCk3U/JYdpN1e4WRxMqZRn1nLmXO6EtmOBn
         dbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rchDbv41LmtjjKEGa4Aos/UEX+s2aj5wfo2X55D4PBs=;
        fh=LIN1c+usLVQtekpuVQpiJib5J9IPes9pLLH99qh6RZ8=;
        b=MwIj3EFRTo+Eb9usQxTW+uwBFgXf6P4J1H60bJQ9db5ILnZVZAuqAvzJhsENhbILEl
         +ExGhicsTtWq9xORi9jH1gH5fUOB5yU9ZfOEKIb4JHJXoBSRCAtZrpi5OSbfinABzIMk
         zTw7nnq//R+fzjVDA7HfKTkLmsz/0ojp5Qk9UgphWQtgC3Atm0hJI97x3ZnEHALtqdpJ
         dksCOP9yEzutJeFLZVvuEjfC/IESxXyTtzVFTVw2xU89EupPsqxLTm/TMZcyNfi0TWx6
         zBoLMsNPmfRE9pZGb7zT2PID+2iYghEhRAbjByn8iTesV1e25jlU1vx4b7RrYc8d/0a5
         880Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDPSi5hx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qx25-20020a170907b59900b00a1f8856ab82sor953659ejc.1.2023.12.11.08.36.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 08:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDPSi5hx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702312619; x=1702917419; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rchDbv41LmtjjKEGa4Aos/UEX+s2aj5wfo2X55D4PBs=;
        b=CDPSi5hxcHFp0Ga3t9COYIPWUFd+dott0MsrJ/DPtn9zPb7OIxXK9bw/XyoGMkU9o5
         2f1P7IsdLiD+HlH9erFh6MZ1xTBUTZec3xTgOghtZt36Clfzfsid/rucmeQ2+YYc0+Ym
         jPEvwqCjbveDyPnyoeLKuEZX9YRs3IlWeGj4kT+ZzsuP8xrKTKr1/i01u96thpICKTGI
         KvcQI/OZPyZToGuXK+apyIvMwQSPGcA8OOk1FPMH78krKPZ4Z5vUrF7+0tgiUm+lqFWg
         rfuSUHRsWPt+rXdxPf0Z9k3CFQzf3/kOuk281m9RvqD1RYJnIfT3KCowo0CNgRkc1Of7
         /PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312619; x=1702917419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rchDbv41LmtjjKEGa4Aos/UEX+s2aj5wfo2X55D4PBs=;
        b=BmK4EC5pbkSxKetxl0EkcNq7EkfoZ7JkuPGabnxxTK/A194cVn6eaUQ/vTgIaO4EXm
         aDfZTSLtvWFeoyaF/wjAUCWXSH08VKcpz13isOHg6IzXhdRYlhIIEZVvS+Rf+kHOPM/P
         PG27D7VF29hc0wCo0Va8vElZI+opZWjXDJojARrBGXuhgwPQXdddz0XerI68GsrcYkQV
         VpmLg876+Sct7I3FjjlLy0dEXBlgXauU8cO9pyUk8IhtAec5V3KqlRVqHI/Q79Ue6gyT
         fMpGYO4Q1iSR1Tuy9PSy//qi9J1kH4AmXRSSUUfIDJGwVROgsiS/VO9mNvfpfwoijLC8
         u7sg==
X-Gm-Message-State: AOJu0Yz5LfDpLwQaUUmHAEvylVfXJwgADAQtbc10feDXm7riGiFXaf9j
	KZTkMV3ntV7Zs6BD5C5kRQhVZQd+
X-Google-Smtp-Source: AGHT+IGRSB4xvIcdsnqjQZqKP0M8XN4p5GuuQ1IOBXp8idoQn+ocFfXv4zbe60b/rATCpyHNiOS/1g==
X-Received: by 2002:a17:906:b0c9:b0:a1f:6433:798c with SMTP id bk9-20020a170906b0c900b00a1f6433798cmr2034910ejb.106.1702312618978;
        Mon, 11 Dec 2023 08:36:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cor91-h02-176-184-30-150.dsl.sta.abo.bbox.fr. [176.184.30.150])
        by smtp.gmail.com with ESMTPSA id rd12-20020a170907a28c00b00a097c5162b0sm4995159ejc.87.2023.12.11.08.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:36:58 -0800 (PST)
Message-ID: <5377419a-88dd-4e5c-8be4-1345f6c2115b@linaro.org>
Date: Mon, 11 Dec 2023 17:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] testa/avocado: test_arm_emcraft_sf2: handle RW
 requirements for asset
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-8-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231208190911.102879-8-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xhdnvQf1l0H5

On 8/12/23 20:09, Cleber Rosa wrote:
> The asset used in the mentioned test gets truncated before it's used
> in the test.  This means that the file gets modified, and thus the
> asset's expected hash doesn't match anymore.  This causes cache misses
> and re-downloads every time the test is re-run.
> 
> Let's make a copy of the asset so that the one in the cache is
> preserved and the cache sees a hit on re-runs.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/boot_linux_console.py | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index f5c5d647a4..e2e928e703 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -414,14 +414,16 @@ def test_arm_emcraft_sf2(self):
>                      'fe371d32e50ca682391e1e70ab98c2942aeffb01/spi.bin')
>           spi_hash = '65523a1835949b6f4553be96dec1b6a38fb05501'
>           spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
> +        spi_path_rw = os.path.join(self.workdir, os.path.basename(spi_path))
> +        shutil.copy(spi_path, spi_path_rw)

This is an implementation detail. By default fetch_asset() should return
a path to a read-only artifact. We should extend it to optionally return
a writable file path, with the possibility to provide a dir/path.
