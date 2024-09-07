Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp314668njb;
        Fri, 6 Sep 2024 22:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkXfISQsANl28FeYw1v/kC6RTtQ8UNKd9sdseyy7gVlbhKCHwGwp7utigOcJvji/3Eck3l6//80XmpLA==@linaro.org
X-Received: by 2002:a05:6512:33cb:b0:52f:cffd:39f9 with SMTP id 2adb3069b0e04-536587aab2amr3137179e87.24.1725687761638;
        Fri, 06 Sep 2024 22:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725687761; cv=none;
        d=google.com; s=arc-20160816;
        b=JGQCeEEQv1p/GFhruOYmgFOW1vdp5a+8EHbLCXJBfttjiksJx2Hh+CmLcWtyc0aSvt
         rR9koIn9yYf2h9UBRsz+wiyXxXXGVgLYiG7HTReMKDXxjxipOpG9feHe5DPC1T+zlS9K
         p37W1CL8NVXpN/yviJzmA1d5hPr3yhQcnPEscFL2xGXrN+HDaCDipiPJ1STEtO6uveeQ
         HBnXnAhYe/Q34jYwxHMASeu9E6ffu3uoub+HKxhszGKTRI8KjL5MS5+Rx00ADY9baszj
         G9+mruUovIGJUKdPbccP/byElkINzSCtXY8UlBcLdoNAfy4Ks7HjWzEL9OIDNc6j1/1W
         Otcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KFjm31zxVUtyMnrBstriW1QpXq5N5Ttm/vOf+zHfiyI=;
        fh=srCde6Ean1PG6is7GbesSJV86NgWqukcFje6UgXyPDY=;
        b=IkfmKaCs7TTYoJ7ONDjdKJWoQqi4HTXAMRYpVVV+MIJaPy9gBNwxGqEGVGl8nPqx7H
         OtKMVIIpdNh4EP/d2cFngP8PfmWin3G6QvmbTslS7HdJkp57nUhn5mdTBt4mr4mCe/U9
         MlGv3xzyNVumKuXthQRLkuSimjUNxyR7GiV8iTzPxjtFUFQWE/Il77rNjYokXlJgT/fB
         Q7OV1GB4U6UuyIIHCX7IV7dWOZWFsqJxkcMOx9sLj/j7eidFuARrASaYrEud4wiiTqeD
         AA2+cHipWUs0d7BDKRT+qaP9Bf4rlZXgMu6ELkDiEaR7LLsmtjytR7ITRcojp36NjElO
         wxuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i7b6tM2D;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5365f8e63dcsor77769e87.29.2024.09.06.22.42.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Sep 2024 22:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i7b6tM2D;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725687761; x=1726292561; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFjm31zxVUtyMnrBstriW1QpXq5N5Ttm/vOf+zHfiyI=;
        b=i7b6tM2D8lrBHcpdCbxJD3gQc2CjLMsILq9wnPtzEL4T6VONjdq1yi3/m0zLKQK9yu
         1Mir5U0G7EIullSQJOEojCZcue119OaoH2Em23eNbyHJVdfL9sYpE6+VF2M+n2t8llza
         MFsuF2HbmdVegLxRvtp11FbnRbjTQvoYD8GnUwLoP1072FJiCz7w/28tD0xE6rcBKfSE
         6GPlqfxSRl+dsq0my0IsEoEw/v8NEd8X02yOezYtdYIQNGV91tDlICKzsL29Ce55nCbo
         B3QhSfNNNmrtKMpLkboh1SJGGbIV1qHEEwDyQGJpGwj4no8L7KxSBvs1R5ZZF6GZHCfJ
         yOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725687761; x=1726292561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFjm31zxVUtyMnrBstriW1QpXq5N5Ttm/vOf+zHfiyI=;
        b=t8QZrZzeMFcxyHW/f5vJFeZ8kG0DMS6GqcFig6siK03k7lxUzpMjDHqFbK1Z/ibRGV
         qN73WwLFP6UaIxfJJe8E5ecGQsbKX8kRBzmZhJQCyu3gMSYXW1NI54dVH8/Wu/8OzbQ/
         ghg+sySoFgKxr1lhVFAWEJcHgHoP3VgEwqzIfrGXrk1cMQskjNJtD1d9WakPyjDX90Ut
         nym4COYNjgTjGBTRs+ZfypPwVpxNHR9x8kwa40zDTLWgZbVr/R358Tjhp1m761lc7Xl3
         WVqsbhQod5a1oiIMWy1Ef4F5Eqb+ImF1BEUWonNhQC2r6c5bBxkwRBCZi2cw5opznwze
         j/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXeh248CIW7JuGCDb1+SKHJtUIaZXRZMQnM1pHvXIq/f4g0oePVHhoC3VFG3D4N9yOdIZ54bP0Wl2gAtg==@linaro.org
X-Gm-Message-State: AOJu0YwmquXVUuSikb0XOioJwksiKZzED8g5nXIaQoozvTiEBrx2RgV6
	3M5asRhCx7gff2pKUisk+tXOAYuj+u+vw1YDbpLdb1hoQnZ02byavbkWJRrvveejd7GeEtEhWW/
	7l7A5fg==
X-Google-Smtp-Source: AGHT+IG4szxEuFEnj1JbmFqSaixYx8jYJ6hjM2N7d7136XMPwQj+BkVf1PCau+asWQDA+KIkKixyJQ==
X-Received: by 2002:a05:6512:1092:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-536587ef18amr2653625e87.42.1725687760640;
        Fri, 06 Sep 2024 22:42:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.197.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25979fa3sm30595166b.71.2024.09.06.22.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 22:42:40 -0700 (PDT)
Message-ID: <4bc83012-3b9c-4b99-8b6b-65f041652540@linaro.org>
Date: Sat, 7 Sep 2024 07:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/16] hw/char/pl011: Implement TX (async) FIFO to
 avoid blocking the main loop
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: m2aIhwP2q8Us

Hi Peter,

On 19/7/24 20:10, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (16):

>    hw/char/pl011: Remove unused 'readbuff' field
>    hw/char/pl011: Move pl011_put_fifo() earlier
>    hw/char/pl011: Move pl011_loopback_enabled|tx() around
>    hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
>    hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
>    hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
>    hw/char/pl011: Warn when using disabled transmitter

>    hw/char/pl011: Rename RX FIFO methods


If you don't mind I'll queue the reviewed 2-8 & 11 to ease my workflow,
before respining the next version.

Thanks,

Phil.
