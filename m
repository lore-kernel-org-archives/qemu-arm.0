Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1902157ejt;
        Tue, 28 Nov 2023 06:03:58 -0800 (PST)
X-Received: by 2002:a05:6870:2187:b0:1fa:3009:cac8 with SMTP id l7-20020a056870218700b001fa3009cac8mr12842968oae.38.1701180237963;
        Tue, 28 Nov 2023 06:03:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701180237; cv=none;
        d=google.com; s=arc-20160816;
        b=sAhyriMH+mw250Kps03f66Knjl6IpmWeaeSwGqVDFEEXU7fta8khqnETflMyACyFLv
         fghZdZF88XZFfLSvBjVutmsKGLTVPU3TQQhesPLDYcAcx4tsI0Q1gUuHWec6LXVe35tX
         NkPNHzHrLkTF2nh4M2pwhA/U79KVcHh2wGwxwqeE4A4aoo8j9RrK2QpS+Tcmiz9juKh3
         agysdJtCZLPicP3BMrx96hr/oEo1ABTgAHbU66lHJli4lcdK/zG/+SwHlDpERmH/bRBI
         nKW9NBRIeLHk3IrUqRgmRWUyoLnjPjkH/BKDw9/ArAViXITljCqPOi8MzQ6GCqHFfpl0
         3DPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VszYBxoqXTIGGEIvHjDkqIOwAC2hoq8cI38JTHQJpkM=;
        fh=j47SlpSDusZ2mmWrSbVW2DB7/ZZUDU/502C3FK4P+uA=;
        b=haGeZwutQp83AvLY+WgrnBm1PEC8OOWA2QEeKtoLo7W3wB2bOABYNHtGYenP27hinm
         FDht1nzO8LTxZH8mTcDBAzRXG9U4QRbOfw6bLxRt1OPPtVEZTUTf7gFivHVg33YENyBq
         47xMblbsn95uektfdPWZrOwGbbM4K05/YE4zThkYUSe+yZhU9h2caQeAXKP31zg+nn2U
         3SAmXHDlKe4YTcY4vxnmdOJY6UvslAOjaNDBXqYlsfQc9YttL0Vtw9xPqd8BswobxGhA
         oKcc/q+ZU7mWMscw97OxhhK8yvfNhTF/7B8ROhjDVJZeQbNlPXDTp6jTyUItJ11xsLpV
         Wpug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rYKtaVj7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id zh29-20020a0568716b9d00b001f48d16ea22sor4051687oab.4.2023.11.28.06.03.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 06:03:57 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rYKtaVj7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701180237; x=1701785037; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VszYBxoqXTIGGEIvHjDkqIOwAC2hoq8cI38JTHQJpkM=;
        b=rYKtaVj7oXHeTZFlLCYgn8NaMOFSn8Azsy4jsBNpk1ReFKeFDSDX8y/G4TAT1V7yOL
         1rVW5RCnGoOS2eAwEM6duRUquBMSJtTZSBQ7OP6guw8tQg+sh0hlhb7HxCowG8OopQJX
         13pNtUe2Ty1ePmGugoQCKZdtOdywg+/D0Y2gp31bv+ekRYrAxz+y6wQkmRUW08Brb4Yx
         yu8aRz0ndtg8txMySDaqjz3dkw8YpzgJR5BjllXSfsXI9zgjQKAC4tL5WijsVawCZsVR
         dI3Gd5UDNdcJ/+UzAFRVWa6SHRA3b/UlMQbDom00TOVuY5tvTdZmq02AptNnY/BZ0iRr
         94QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180237; x=1701785037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VszYBxoqXTIGGEIvHjDkqIOwAC2hoq8cI38JTHQJpkM=;
        b=LnTEy8WjHdR5t2sS7gpes1RqDYfmyCTIKAi9lkhwkYfuR9BhcNDpGn+fJKXtR5ypCu
         M6fyB8btlQT24QsI40Tgr7kh645PGEHWKsSwmnlu8Zro95DcrHkf65F6k6ekdqf93w53
         tKykNk+BWBmA/QNm05xTk3ZefkeR8w+I5VONDjUnYoABqCHkV13aGAebUkSBeF+LZrJ9
         /+Sh87T1+jgO8DPjgs7wb4dlzLBRKahpjhEmrVPp0b7HIxDuARNxGMffseOCSffyWCDE
         q01GxHM9rqZl4NdUokZI2YCLmXR3P3rsQ5N15+7TPeafXSsRfXoRbeEIkagyawjKnjgt
         Q8WA==
X-Gm-Message-State: AOJu0YzlkrS00NjLdYCqgFUgqyEf2EliQaDt8fdrwmxSMA0y5MbLgN5l
	NwFVDG1uVB5O91H8jSvCS+TyXsIe
X-Google-Smtp-Source: AGHT+IF7aUWlaUUDP3lwCOSjx2MW11BgZyMoTF+VnG6tOT83Nc2MqepU5kbtYtuRHV4oFmlWsJGaag==
X-Received: by 2002:a05:6871:29c:b0:1fa:136f:5758 with SMTP id i28-20020a056871029c00b001fa136f5758mr16754943oae.44.1701180237509;
        Tue, 28 Nov 2023 06:03:57 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id ny13-20020a056871750d00b001fa1350df8esm2068309oac.2.2023.11.28.06.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:03:57 -0800 (PST)
Message-ID: <6de3ee23-cd69-49cd-a31a-fe00a4249e31@linaro.org>
Date: Tue, 28 Nov 2023 08:03:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 07/11] hw/arm/bcm2836: Simplify access to
 'start-powered-off' property
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231122183048.17150-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VVTw4+M2RsYH

On 11/22/23 12:30, Philippe Mathieu-Daudé wrote:
> All ARM CPUs have the 'start-powered-off' property since commit
> 5de164304a ("arm: Allow secondary KVM CPUs to be booted via PSCI").
> 
> Note: since commit c1b701587e ("target/arm: Move start-powered-off
> property to generic CPUState"), all CPUs for all targets have it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
