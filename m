Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6053181ejc;
        Tue, 7 Mar 2023 07:03:04 -0800 (PST)
X-Received: by 2002:a05:600c:1d9b:b0:3e2:201a:5bce with SMTP id p27-20020a05600c1d9b00b003e2201a5bcemr12815670wms.40.1678201384099;
        Tue, 07 Mar 2023 07:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678201384; cv=none;
        d=google.com; s=arc-20160816;
        b=UmIycY13RHGOU1iKruKVWt2WRsQyOzU3avcIQ4Vi7QiNzNfa85IA+v25ZgxWVFDI68
         fAimso5b1VUevb2/ZmxMYe2oCx52dTsalKoiCvhhW+EIRbHO/3g8LPp6IwtJpyoMdEHm
         dWzsiYf1Xq4LtvwuUHurUIYE3/+fpaWTVYkVRtNKESQrX/Wo09q4YswI3uXTeIXlQXYx
         AyWCSuQ/FkhvEF3FqNjeqMU+PZDMsihh8skzfjr+IXPlVTi2M0rDIb5smQo4ILprp7xf
         Fi1MkrcUCKKR0uz2U84TVU/0dMprWWGzRPoZmV32TuVHAiSiiJs8A6vQvocYURLr6b0y
         cpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HFfba+K4r7ferdfMYP6XjD63fq5PDf401VC8iHOuze0=;
        b=dey05ue1dd/MMQTiHOO5RJshhNGkFxrtcaKuovgdo5dMbbyTX9B1544F2EOkwMzhHz
         71IBNrBiC+qPWX4Z0AnhkkMXEbEKGg+k1XE4Tn36K3Hk7EC7sw2mm+m1RFzQ36z21aAn
         xpGSYumuECWRUxDEbqFkaUY7K2VvyfntpFEBVydkg8E1CV8G7QAVXUg+E/cGp2RZIJc3
         5Az7kQSZQyH8m3jyQVvO8DuTecLwTQdRmEm29N6fsKZwkPnwdrJRt72ylNy3eUJ2luDv
         bwcoQzlu0ffVP0GnKmHYTz80GOwgkQwYVHMn/TEvv56/QSds8hXF8As1geFjaVt/Vgvy
         Pn7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0YQeGCU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o9-20020a05600c510900b003d9ae6cfd40sor4472847wms.0.2023.03.07.07.03.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Mar 2023 07:03:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0YQeGCU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678201383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFfba+K4r7ferdfMYP6XjD63fq5PDf401VC8iHOuze0=;
        b=b0YQeGCUdvnKlpfykroqtYtHmJyDOLeFvXBv6dXmXgL5aormy+eXRviJYYbsZz+wI2
         ndJmLoqIVyowC9IKHjLJG0EHIKhUaRyFI8CQWXv++ynMaoe+ID+m5+AAHP8NhtuR8jaJ
         4fUZ1WhYb2Rd2GkNnoVlj731CtMJYztM6FSqkxmXE2FyfatoZ5Yafhr3jvRQOc0Ecmur
         3FhbWEZcmTqdwYJqSyvkvIqMma04fAKa/U6t1Kwr+g4qVxL0FpOlqOpI+DsGluA+ZDkG
         pQ4TQ7QLWuieIWJGiowdIGNtp0gPSa9ligbcHaM/sc18y6IP/0xo6dRgAER0+T3QRb2v
         vmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678201383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFfba+K4r7ferdfMYP6XjD63fq5PDf401VC8iHOuze0=;
        b=N0htVzsWKkt8qzWJwmcXtXzZ4SBpxzONrsJectV0ZqV9MkezdpPfud9ynMAN01kcaz
         akeYnso/k4jIqgHTRYWsdeali+IvIP7T20MU4dblVpAgZNXX5STvtckEn6K2WwV0Impj
         gmF3v62QJhCtVc5G3N9LXdI26OZ4ZHkiZJN1hlayEbEnfnv5ncn91EAJ3Uhg5gM6/WWr
         SOHpdonPwnrQDW6ppWYb6w2ilhZWVOrShmWtpvw9gRgunFG89hceTSB4kEUFWL47qMRF
         qoXlcmTkbuVNytGR4NawH1aWkRtDAD/2W2s3dAVES8uecciUhKTWgS6rtpLWB0IUXtSI
         1Aew==
X-Gm-Message-State: AO0yUKWT5LkOhlEL1SaoR2cWVzIY/Y4h5DP9oaZrEC/j+mRvTKQG7dLm
	eJP4rhfPguN0Xt04HWj0/qAOC2iZltkwU44fJaEcHQ==
X-Google-Smtp-Source: AK7set9HaK9qp3jb4rpYqy8vNYNuJZcvBX0hZ5IaTsrt9gL0b3iugcy2TvXgystA8yQf6fopcx00CQ==
X-Received: by 2002:a05:600c:524d:b0:3eb:38a2:2bbc with SMTP id fc13-20020a05600c524d00b003eb38a22bbcmr12377282wmb.7.1678201383413;
        Tue, 07 Mar 2023 07:03:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.248.175] (131.red-95-127-34.staticip.rima-tde.net. [95.127.34.131])
        by smtp.gmail.com with ESMTPSA id n18-20020adfe352000000b002c567881dbcsm12755381wrj.48.2023.03.07.07.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 07:03:02 -0800 (PST)
Message-ID: <c6a149f7-6137-5a17-7ccb-2951dfc3a49d@linaro.org>
Date: Tue, 7 Mar 2023 16:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/5] tests/avocado: update AArch64 tests to Alpine 3.17.2
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 "open list:Virt" <qemu-arm@nongnu.org>
References: <20230307143819.510186-1-alex.bennee@linaro.org>
 <20230307143819.510186-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307143819.510186-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nB/z0TNYuEVy

On 7/3/23 15:38, Alex Bennée wrote:
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> 
> To test Alpine boot on SBSA-Ref target we need Alpine Linux
> 'standard' image as 'virt' one lacks kernel modules.
> 
> So to minimalize Avocado cache I move test to 'standard' image.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Message-Id: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_virt.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
