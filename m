Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6100872njd;
        Mon, 28 Apr 2025 09:49:43 -0700 (PDT)
X-Received: by 2002:a17:903:184:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22db47939aamr240996305ad.1.1745858983388;
        Mon, 28 Apr 2025 09:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745858983; cv=none;
        d=google.com; s=arc-20240605;
        b=J9bpY53e3hm7bl4/YsISJI7UiuOE4iprTZkyj9fpxnjvqcvyUTiIAQ9E820faa31+4
         kIXD0DeA+gEZBpM5xAfszAH5APzuRX6Tq8qC2N7CQePHU+4V51x9VgSIFzS4q2dgKigg
         3YdzgVyUBGqL6Wm1cqbhCh/sCrm6hW7bNplaDOkOuZQT7ni5Ao/wwmxBOaBimzPNibNm
         vwzWnGT+IDbOeDwCeOIrZyKHIWyU44KLrWeL7ILZqDi3mLqKAI6QRbuI4QgEK3cdYmoY
         OzvqXg4QlNV0gM10RT2bwB2YQrz57HCiKX9B8EkCP0i9wNEsJs+We3l1jxxjwn1iEmVo
         6E3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sh7cQbnDsin+FilFzo8AULWg/qpsyH5v+HM5HHLpILc=;
        fh=j9FrG7sAAwroZdkqoiCD7M+owrUR1dkXcZ1pHKxE6V4=;
        b=h4XwUukglB6BAYJ8rDTfB/3sUUInSgdyQpj1WWa8qNK6Fh1O+C3OT5q5ucLNfI7cUt
         1uq+GTprKqZMsKDVPCP2PPhqxH309TN3N6B/7eqCShLXFA8a9pLb4QpgwWOVZHMHt0i4
         GiVznOlHuUv8/Sgu7G5hqzOliqHA21NqSXtHe9dYg5JzDnA9omzd5VnO7/ygxthtCE+h
         vBiOESdtL5J4+95lJsK+3g7zR+t4nzly+fZq4t+lBVzTPN4e5K01aXoUAFtJI+qwvgok
         YZfa1aAoNDuj3eXAitsw9N34fDU/fed0c7bVWNTW27VHCflF0C1KfRv+kaZg8cCWVj6s
         PK/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmNgbN1t;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50e5df3sor53223885ad.5.2025.04.28.09.49.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 09:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmNgbN1t;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745858983; x=1746463783; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sh7cQbnDsin+FilFzo8AULWg/qpsyH5v+HM5HHLpILc=;
        b=gmNgbN1tNj9gOfhP+c34diIALJmekDkA2aGszDth4Qf/KWN5/s3jpLJHpSy2Mio8O1
         Moku2Vh9ThUc90VuAdjD2AxAJQ0gyFzoczAaHAmSZ3HBwoQFEokyvOi8DP0N+XAw/IDS
         04WwDAHxBEgWG+LIsvQJAHmUUtGjbALRZvyvYQuoUbrIW/9Au89+aBJVPu+Myx5Otigy
         dhMblpaRkH+a+I2UMG9ek7BWTaNdknNLJDMn+RnH+8565Z7S/e9vgKPWSSMU5PwlcQ1U
         /HpQMh7FQ6xqyJgLsTbO0rZ1LTeO5DgF417wdO5ASna++MXGjoU0E6lUd2HwlBrk4qbI
         CEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858983; x=1746463783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sh7cQbnDsin+FilFzo8AULWg/qpsyH5v+HM5HHLpILc=;
        b=WIB4/aUMj3l7XMkWrFDX3zQZg0cA4MGK50jWr8pAbxsBAD3ItatOZ5gKphTceiMKit
         IVUzljBX7s5O9/TJj+a4mpl0Cedvx2Zg84ijseJj7nNq2D5kk1MTAgTDTpCNe4PINsBD
         AiQTu/JW95WdNhM7W5yD4HXhl69RzOANXZjQbSr21yZgGpu2gtJtUd6A6slrqr/1JTP4
         0U33F54YvSg4Jog8VEWsFoo978+JJNgLKPXyzMDQeiDWtUyjMEOnEu7fXkre/RpEOSlT
         xaVQs0HxKAlorXRUnmXfLpzDRXs4pW3XPdkLXxk/hl7mUvlZB4pbFr9T8qqNqMNMfXa9
         4Lnw==
X-Gm-Message-State: AOJu0Yy7C8LZd50WFb7kDn181pnFj8hwnpB9kWKAFVizY5Hjz3W+SMUG
	JyjJnCj5+mAJM9fftSMaAZLTgR/WGxR/EkZnENBibl8hEeQDsCfNvNM3TVcim6kD1AUgz3Ioy52
	xH44=
X-Gm-Gg: ASbGnctl25DRJtm97w5xdU/DjBrlJ4lnbJsYfyBexXuUVvBfS9T6roN4XKTohvYRjSY
	oKvdCvg7Z8VpfTRt0TyIuuGGsuZ4jZCIjL59QnFFjIDdJ7TF9bXWcqb2l9zr6bfOr30/2pYmufX
	ZC/rCQcDv+7sbrEjfwkWbQ7Cy7YJg/jIAm0kwVu+6Ki34rAGGqgcDAbb0lFBR1VsShbpkEtCobe
	an/lC1Xf5EP2URneGlU3hMr/v62HqS1kA7daJCGxCrniVf+Y5EV1H+MZyQnDtSWF9VKRDEqewxJ
	/Afj41FrCN1mMkM1qfBhoCDeFTDmmAjxkBz/3QezkyaYGdQDA6Ybnw==
X-Google-Smtp-Source: AGHT+IGHlwg9mLSJvBDMQRIfpYMXU1tb+27uVBXs7dHTHUhVtfahaad1kgZAlbvPBJ+qfXSaSabtxw==
X-Received: by 2002:a17:902:eb83:b0:224:3d:2ffd with SMTP id d9443c01a7336-22db49832ddmr209233105ad.17.1745858982957;
        Mon, 28 Apr 2025 09:49:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc60c823esm53022255ad.9.2025.04.28.09.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:49:42 -0700 (PDT)
Message-ID: <ebae7cb6-c56c-4759-8363-20319686bb29@linaro.org>
Date: Mon, 28 Apr 2025 09:49:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] contrib/plugins: allow setting of instructions per
 quantum
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-6-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250428125918.449346-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: CT0QmLp1AT5H

On 4/28/25 5:59 AM, Alex Bennée wrote:
> The default is we update time every 1/10th of a second or so. However
> for some cases we might want to update time more frequently. Allow
> this to be set via the command line through the ipq argument.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/about/emulation.rst |  4 ++++
>   contrib/plugins/ips.c    | 10 +++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
>

Good idea!

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
