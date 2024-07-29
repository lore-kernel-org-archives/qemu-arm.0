Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1742409njb;
        Mon, 29 Jul 2024 05:02:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDPWTXT49incPaJ/tqoMBLON8+0XcQ19Fo5xMqT5+BwqTCGUiIgoyQ2b7K9UjCJIPa9Iv1egZgrPgP3cOXfrmAsw8UCRXr
X-Received: by 2002:a05:600c:4708:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-42811e47830mr48620555e9.6.1722254525180;
        Mon, 29 Jul 2024 05:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722254525; cv=none;
        d=google.com; s=arc-20160816;
        b=BWa7Zrksi9Z8GnA7x32BvpkEJGIZfBjAsGWDZtPUNGgFTfdXQ8FeNSrq31peTRU8Hv
         ywDhaxABAxbSQUi72g2pinA8lcS4TCR35sXkM38W9RO2+oEuJMYjucyVlO5J3wxoeZly
         aXNfXwhG2LrhyGnsjOjMuDs7yNYuX2QU3bCJKSgx0QAklxlUeO6gMeZ/2P90cwcLgjfq
         KcU5PXznmWjNLTZwSdtCOTWO3o+6ejHllsbto1J/EzSEin3wLJVRt/GrkXIO/5Zr/vMZ
         TJl5LXm3XJqvjvaxzLN+Ju92r/vgwu1l5quHsk2XJClzgqKYR4/e1f1nnSNDw8sxrdEK
         JRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/qvSCEYggbJA531byaEkDr9vmqqh4tVOMW6xdeku0Eo=;
        fh=+T7if6Zhd4p0CWlCjRtIoJlwL44n+Riz013qaez6LZY=;
        b=RhCGbeDVc7wqsk7c/CICEdaMMAcQsPh+tmSDK6Pp8ab1IqtqYx+mHzJh/6/sCUzNrB
         mCX8GX8PmKjl7EujVtHSct2rY4C5wzw0IJFIqRbiZ7LWNvEGNJQsz4p5nJkZIHB+yHE9
         Tgg9imuyNNSOvRm/UUPej7567ipb5YpppEMTOAISgFcoXuvD8j2ofbPqfXFWt36a8EOj
         LiNQRvAwLz++2Zisqysdwine+x7iPLbUyBq2+b2hwYQt5pigAYlshebEjHxw/iBcGeSD
         MRTB1dpibJha/8+I2PiY9MY09jLsaExtkU18VD0JchDb74+eoFTNkQYNK+uItXbawRX7
         WVqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NTQDxZM9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4280bca3e74sor16377625e9.0.2024.07.29.05.02.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 05:02:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NTQDxZM9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722254525; x=1722859325; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/qvSCEYggbJA531byaEkDr9vmqqh4tVOMW6xdeku0Eo=;
        b=NTQDxZM93IdHi2f4Zkq4ODIoZwJQUFN185b2x831BdhhVXdZnMe3gBk4txhO/URbue
         qCeUJgflcwldd4J+jCFEpej/MLFgytTRIKwbBaw0Y4j51EvM5EAHQIieb8dZnAym2e+c
         zbJDVzcLbR/EvtV/AJ9nELzm3WalEtw7QIJ165LjWTXGiI0m7ch+rCFdoVyJuI/hVrQ5
         9O3d1VBgM7RANjh2fDYU2UVpZwrnkDoULaIkb+H2LBUXjoms0WpsjOfcQqH/s64RCv4A
         mk5njwisGPh/2NpS9XrIKpYCAlu5ZEuRtgOqU+36zfPWpdVTv8hREVHSZcAsXDnzRfDL
         kexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254525; x=1722859325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qvSCEYggbJA531byaEkDr9vmqqh4tVOMW6xdeku0Eo=;
        b=ThDL/C+5Mb5jmC8jC3LbCbapJRZ2vZmgqIH1JD/ljW93me9/kfXp7ZFk3dhqJxzZQw
         odd4h1wBEWrhasBzAicZy3m4uL0Bsf6D7Sg0FWjLMbpH4VxyXykKQbSPwrXAwHFuRlsy
         76U3wjnyU1UIM239UUE1qRVp72+pBv5zSY3mUXDa+uZBdziGvzqlec2v8z1vf9ehXETU
         WTcj3tpZbktFrLyNS53LGSSIpi4NXed7WDuHE83/ZYImIVjeSHaKH7tPaBmXR+MgyW4c
         tjqa3Y/zGLACDclzj4DnPb7bjUbAzOZaO4ZHpT+W8BrS2CyzgTGuj33w5qo77vIYy0hF
         L6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnL4MUVEvVXNpTjSATeXivBWG6RYI4/FXNIxKaI7l6OMCd9rMVD5aQy76KlYMU3xsGK1xyF8C/2ra84awKKPL4noDvUkKG
X-Gm-Message-State: AOJu0YwvTfBamwpVgP2CpQeGubC8qlDK08rkN9Sd1Piq6DnhhhOfpWac
	t4jfQ1MBg6X/cQoP9ZYZvMBKsLznFlfEXMm2lvCD1ci31/IoC0mE6vSBCD65DCfOpw==
X-Google-Smtp-Source: AGHT+IFD+mPLCP16wqONM0xiaWZbeizYtEHeoTpsypYl3tjtLRKpY7ZoR1jjLZznwWE1Gxi4xvUPLQ==
X-Received: by 2002:a05:600c:a4b:b0:424:8dbe:817d with SMTP id 5b1f17b1804b1-42811e6ab12mr51422695e9.10.1722254524621;
        Mon, 29 Jul 2024 05:02:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280f9e3721sm108545485e9.29.2024.07.29.05.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 05:02:04 -0700 (PDT)
Message-ID: <2d85304c-ccec-43d1-8806-bdf7b861543d@linaro.org>
Date: Mon, 29 Jul 2024 14:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] Bump avocado to 103.0
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-13-crosa@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240726134438.14720-13-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: JXxG2CzkLZxh

On 26/7/24 15:44, Cleber Rosa wrote:
> This bumps Avocado to latest the LTS release.
> 
> An LTS release is one that can receive bugfixes and guarantees
> stability for a much longer period and has incremental minor releases
> made.
> 
> Even though the 103.0 LTS release is pretty a rewrite of Avocado when
> compared to 88.1, the behavior of all existing tests under
> tests/avocado has been extensively tested no regression in behavior
> was found.

Does that restore feature parity for macOS developers? Because this
community has been left behind ignored for over 2 years and already
looked at alternatives for functional testing.

> Reference: https://avocado-framework.readthedocs.io/en/103.0/releases/lts/103_0.html
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   pythondeps.toml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pythondeps.toml b/pythondeps.toml
> index f6e590fdd8..175cf99241 100644
> --- a/pythondeps.toml
> +++ b/pythondeps.toml
> @@ -30,5 +30,5 @@ sphinx_rtd_theme = { accepted = ">=0.5", installed = "1.1.1" }
>   # Note that qemu.git/python/ is always implicitly installed.
>   # Prefer an LTS version when updating the accepted versions of
>   # avocado-framework, for example right now the limit is 92.x.
> -avocado-framework = { accepted = "(>=88.1, <93.0)", installed = "88.1", canary = "avocado" }
> +avocado-framework = { accepted = "(>=103.0, <104.0)", installed = "103.0", canary = "avocado" }
>   pycdlib = { accepted = ">=1.11.0" }
