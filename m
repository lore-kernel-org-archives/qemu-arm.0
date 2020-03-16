Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp488544lfe;
        Mon, 16 Mar 2020 12:55:21 -0700 (PDT)
X-Received: by 2002:a17:90a:bd96:: with SMTP id z22mr1185146pjr.172.1584388521319;
        Mon, 16 Mar 2020 12:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584388521; cv=none;
        d=google.com; s=arc-20160816;
        b=l6jvoIKBDZxvLdeau8TKWlXI9HHmBbbeT3zS0Q9dPD9U4uGMT/Tg/CJh5FGf17zmHP
         aPP4Q8ukMp/cLFXkPG0FGTDIyTuU2AEDgbxYmBAVOvRB5/YjGFc3vg459czq81UgihnS
         lzsjg90UE7KCyQzRWAt0qtPP3ojcuCtQafobnSVY6l/j1VOnwKmvWdKIQBeGpHmAN15V
         VxrUIejzUlUznMyp1Ej0jGcik/suV39jdgVWZ/f/OpEMQjxU2NuxFb3999D/YDoONC5Y
         Y5ZfiyZhejoTnLiowZz/cOsQlikyMkr9Ozklr2Un+hHwi1YMmzuDzskpd5Q3YXuDaHxI
         0pSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ov5h57WO5/+zhyBMPAFbc1OhO1yQRqCkUshvDOAUP7s=;
        b=rU9Q8k4hACiDPEUMuXthuxc4juLQsUel2cmuKtc4ANnhsy1c59I/GMyamtZmBbT7C3
         LyUP+CsUr2Ick2V/g39AqQpCUPQowxn7ALQZyqDq+szk7SjrdKlOU1i2EjSglTW+GRuT
         VZgdm+aY78SVosmxyL+TD7GwOQ43nh6/BEy2m9gHVKB1N7KZpHyYReXIbFCNBSGQsdMV
         DxZhKDzTuLVaHTqRPIsMh9jvOZTXo8M3NZtr8oTDZxzwMHc8VpEMkhiA1kD2x2wpqHGT
         1BPGqHYYLefcds3xUePygvJRxYgMo1K+BfXQiXHcDzQ1ffTVFy6+LIznQdKTncNxDsds
         leDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4ux9rXE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id cm15sor886884pjb.3.2020.03.16.12.55.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4ux9rXE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ov5h57WO5/+zhyBMPAFbc1OhO1yQRqCkUshvDOAUP7s=;
        b=r4ux9rXEn528yNo+tnFiuAEEcyAyUcAuWVSrlsR5KXwYPGjy9WVtwJXvMq9iSDTqhX
         GFwsZmtH677CVkv8ibaHzvr+GbTJ6ZT0Gb2++YP906Lg66cc1K5vUdJkbY6smfNteEFp
         U3Fi288zwkXDqzeAuc7Kvj6h5oQUBA/ppcT5f/cSWVpFzPBUkH39YqDmKypUGVVFDPQf
         z2crm4ba6pF/Dvu/mVQfK90ayT/UxGgKMFH7vwkm1IwYM7z+THVntecWhUDTWXc54WTS
         JvbSJMNWQ2jfm7TvUirNuKO0GNrwVbIZVa2ZlQ0Wv83aSTpY/wereBLXWd6TYHDqvT2h
         gKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ov5h57WO5/+zhyBMPAFbc1OhO1yQRqCkUshvDOAUP7s=;
        b=WUe5F2vEzw1THviMGTsmLC16TIHKbq/mHu4ltwg6RJ7plvdYChSP0p0gfRa4h5bccD
         suEQyVqv3gS0OReHjeOgHLaQ5kTotEEi9S6+IfzZvZCJs6shvg21G+rnyLFEhcjCKPEM
         YZXans+YoAN5jv2U2x0RbZI5uYyVuSaO9PbJD9zp07fzUeIfaMAPxyaiHu4KfDGp1n+0
         zQMC/yI6gYDy63wG7DciDCZC2J9G0Uqsgc+ijfc8PWNTJrR3UrahvRXUjy+UpuE+3Gqe
         m8KsZojItDLWNA84PuqHB3EGuxZM0gzK2dxWDaUkQ75nEgp9ktIB2SJ57Jem55vuqwRc
         YMFg==
X-Gm-Message-State: ANhLgQ3enQsu9quRwI4luMeCib6+xXSBUxHsEM0cPgqxMsyDMj1aganf
	Rumusefn3dcWuiwfXNJanYr3EjEK
X-Google-Smtp-Source: ADFU+vvyvrLaxbAe3TneK14pPHxfqzUe+6HvE8zB/G2jcYM7gSkCqhbHZm3HzszRYNwHHWJ/fR3dug==
X-Received: by 2002:a17:90a:f50b:: with SMTP id cs11mr1202297pjb.145.1584388520824;
        Mon, 16 Mar 2020 12:55:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id s98sm533513pjb.46.2020.03.16.12.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:55:20 -0700 (PDT)
Subject: Re: [PATCH v3 13/19] target/arm: Restrict ARMv7 R-profile cpus to TCG
 accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57b35f0e-cf20-14fd-7a05-82242fb84c35@linaro.org>
Date: Mon, 16 Mar 2020 12:55:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: sPdfpVtfyvzn

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> +static void arm_v7r_cpu_register_types(void)
> +{
> +    const ARMCPUInfo *info = arm_v7r_cpus;
> +
> +    while (info->name) {
> +        arm_cpu_register(info);
> +        info++;
> +    }
> +}

Likewise wrt ARRAY_SIZE, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
