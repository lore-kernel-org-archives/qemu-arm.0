Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp675077ejb;
        Thu, 14 Sep 2023 10:21:11 -0700 (PDT)
X-Received: by 2002:a05:6512:201b:b0:4f9:586b:dba1 with SMTP id a27-20020a056512201b00b004f9586bdba1mr4281058lfb.4.1694712071429;
        Thu, 14 Sep 2023 10:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694712071; cv=none;
        d=google.com; s=arc-20160816;
        b=SiPm8Ukt1Law1luAdxPD7cfLF6IIkf/V+Jt9jT61deVL+0eG6aYU59YYCC9dzUIvnL
         FGRTCg35a2AXuVsOYO53pX7tMFg63a4XSVFL011PG8vYZi0G5tA/5KhL0RhAUKM4Q/Vt
         UdRgpVh7TMiIbNZLhZObgYqdegYwY2zwaAEDIUGOFfhzx692AEZM/Y/juIcF3VGvm5eF
         0RCg0UEJjMHUVavHP7/o4XUrtDVYsc3Zozf+t0cLf9p0U1fRucFMlX3EyGMw6+40x3DN
         68owMTqX5JRsp3MC24ezl47ZJDYLwIHj8uPIX73JFEZOFa+iuqG0Jh4MrrglVjEqF9Js
         ptrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YaZwKKFNBvaScjwndwG7Qbor/60HG7c3Yvxm6lplfXc=;
        fh=+z0qn/otis1aDxhoGjF+uAghRFReP4mgUAPyYkbWBfk=;
        b=qhiQPTCYfpmPxhuIWta/BKC3N8y9A2qmftgt51iBzL1c8zDNWtk2PbXqpG5zK7aEks
         iZRAkIlGJ9vSgJWdXsHzk7G+/PnrFAaVGurBHGr6OdiB+TGqavpw97II/ZKyeqFUWz88
         FKSY5KTAqdbQ6EafUUTnblmch0c7U2e5envfzGfLn2+BFXIFIFyquFlwwv4c26xVd3LT
         hNqHnCvpFMOMULih/qaMPch0zABi2rveAe2nGV0lMKw2ydE0kXn9QOeBPaZLeIzNSVcZ
         beNui6eJO2+oBd8GNF1jwCfkG+u7OxkLIJ+2UJd4anFNFPZO4W0VCk3TJO+9Iru2tJGT
         nNRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lf8CCYXe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u4-20020ac25bc4000000b004ffa28f0c05sor725847lfn.4.2023.09.14.10.21.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Sep 2023 10:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lf8CCYXe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694712071; x=1695316871; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaZwKKFNBvaScjwndwG7Qbor/60HG7c3Yvxm6lplfXc=;
        b=Lf8CCYXe0obFObnNZBHIae7Q2qfhSGA0AehnCqs3/5XD+wyrFg3d89Pqb0nhi2+dxl
         J3lhoD1T8nVjQ9F+k2nvObw40gMmXugYYH71EcjxVukSauLYAYcUVRYxMmqxWv2i4thG
         /qXrG9tLOd90147K8dwt1/pV05ziTYczDvw3I7zMCXGinLgCa01BtWD5m2/3PLoJisDk
         hBJfSy4WycR7zOtRQAnW9RChwXOEX/RlAIm+SELeE7DaKDm5J59LoOxHUhbTgbDz/26A
         NiXPjMp0+HO95dMn2r4thH75ULbgkcmDP6lCWrMcHpWa2upNP72oiP2a4jP97pmFQJLJ
         9aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694712071; x=1695316871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaZwKKFNBvaScjwndwG7Qbor/60HG7c3Yvxm6lplfXc=;
        b=g749+E2slRrqGOrqBBZA1M4oAZEqROQbCtR4tHXR1vzjfCayW2LDQrPSOC/oJJ9hGN
         BoWU/klQRngGPwsuqvWdiZx0ciJGZ0VBlPTuyfXHQAOhZwQ6OCSRHYTeyyu8WzCCXmpT
         37hDb1VQhRCJ98Igsh2VxfMxZwRnnXmtMMJHaD3WbzeF2zSEKOSW4wKqiRaGxBP54No7
         8ZzRxb6zxJGgmgEwsMFFb9+7lqe0IzSzEMKP9EP+vaI7P2c9ldAt0ACeMwWM4aw2c0jq
         JTsVoah0GVUthr5fw1Vp+S34JJ03+V/i3coc30PJmPnnuDLmBQS18U1BtEE0cAvmqUzl
         H+BA==
X-Gm-Message-State: AOJu0YyVXtVC0+ohqXyLBWdHxTRi8uOd34G2sxPaL5mruWVId1Q9SSHC
	3RuqHuSU7J2OF1xhFfsxHGqMdMIAyMB8mtyGagFx9A==
X-Google-Smtp-Source: AGHT+IEnI5WIX+XU6f1bfZhrN2yN9bOj0UHNTm8jQPZZw+9/j9kwj5pYdeq9vZfnDy73k2Fgp6T4eA==
X-Received: by 2002:a05:6512:3d0e:b0:500:9ab8:b790 with SMTP id d14-20020a0565123d0e00b005009ab8b790mr5725765lfv.60.1694712070211;
        Thu, 14 Sep 2023 10:21:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-223-129.abo.bbox.fr. [176.131.223.129])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709060acf00b0098d2d219649sm1285399ejf.174.2023.09.14.10.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 10:21:09 -0700 (PDT)
Message-ID: <b707a129-5881-430d-708f-00687ae724ca@linaro.org>
Date: Thu, 14 Sep 2023 19:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 2/9] gitlab: fix typo/spelling in comments
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230914155422.426639-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PMeJFEZhw2D1

On 14/9/23 17:54, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/base.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
