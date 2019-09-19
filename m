Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1568504wrp;
        Thu, 19 Sep 2019 15:12:16 -0700 (PDT)
X-Received: by 2002:a63:1c56:: with SMTP id c22mr11270971pgm.231.1568931136540;
        Thu, 19 Sep 2019 15:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568931136; cv=none;
        d=google.com; s=arc-20160816;
        b=yX6i2jBRyssqIZLyWUFFekmotISdEB98PqwiMUwaFNpqC5bQMfXGGDUrEbJ3NI+9KG
         5uoxeY1BQNmfAdyEC7domD+EoAKd2bP6ghXKQyENFuNzfWwy7i3TgxcFLIcvpuxRzY43
         I2qIzgO7YHVlLK95PnmavyAWPE66gw0lN6KHFjDW6Hii95ZK4KbII4rp5UsUZtqu/AaI
         Hfvo826NwfiETbPT/hZw5Hhvz4sboG/FtpAxFTbxaJ7WoK7PF/tDbqM+0bOQdVx0aa9b
         /4iEHPwUobmNQb/0CaUMmsYVyS8J+3xOL7ySgoI97KMEBMrO6vBia+2gdEjYnyFzqTFH
         5iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=cE4trpSnP98fjNTUopWYGw+YfZEOE4CvcAUadDHzEes=;
        b=0yBF6YYYJvgO+cn3GaA6vCGm+Zl4A3J1NSlQJ8kWoZX0FsxZfEzjICleWv/E+4Pp5x
         7U1cRhuHylcQ9vHlzyAVSW/cnF3P/oDn37qoiFca4unY1tTrPL2ZkWCjzXA9z9xqfW4x
         CxSmOD9r1JJFiOeAzzLy62cT/81kcNl78VMNryIj89/7/CifBOypSBZt36qwYXtjFBzG
         UEfpQwXQIPOuYxbXsCjgnWisIP6Mo1KYyqq/PmoXJz0A3hd21HAdhj8FPt+jDNbUSYgL
         3Qi3HyLwTVfz44vR1Zr7lYafL070YWE6scAF/qoTLZSWwDcCb7YYJjif6pTBSzn2SfKn
         tSzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlK4c6aV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t21sor9155679pjr.18.2019.09.19.15.12.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Sep 2019 15:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlK4c6aV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cE4trpSnP98fjNTUopWYGw+YfZEOE4CvcAUadDHzEes=;
        b=MlK4c6aVjeglSr/xpmgQ6JIuzgz+Z4V+H56whSYZEaHvipFm0mguHr9Dfb1bNNmfK9
         yIsohYOPRW5uZnQv+ETNBStxVT5xowsKXBmsqvG4v7D20Fp8lMl6iZNWKSgubvI/LZy0
         iFKvpkPRiu57FbVyCi0NMPGkV21LhKP/eZmF3BLdaxKAzxffy8pAd8E7JoJM5byWYlSm
         i10ZETXDh9jj5Yx9H88WNqkjlvm0guJQMbvnmERYk0gIyKr6jRbW2DmbtsSMKJxzrsnn
         yXomh4couWMq7bUysYpaF2mwJMwBLH4JwOcvjkk5iU/DSugtfp4NRK8yzJD7rsSYrgzS
         lgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cE4trpSnP98fjNTUopWYGw+YfZEOE4CvcAUadDHzEes=;
        b=FhbBPymBqKcGA9X3qEJKe31sSbUxjEBWlnGqqfoD9sO8/vd6aYU5p6inFB5RGN+/jd
         pnXWbcgR8bmxGZPUxx6DXRhnJbUJvDNkAOXqB8T/Dpe26aZtNt4vvmRrxw3L7TSDetsm
         IMwMxxyfZlauDrifrm+yL3DpmtBWWey6db/WZrIa6Sht+cr4etr/Xkh1waENP9QXmLVA
         gfvdLjvo2VxkI9vxDAdk3IgyzAOCpQtNK5Cgttvd8W2+2pkjoGAWqDYtxBKztZOGauoP
         juJ3OQEAoIaEmZQvI3dCLqKQ9WmYeIMnrWAmEJBLQiSRP75XovmzEklECpj0Md1+ydhf
         OW7w==
X-Gm-Message-State: APjAAAUWDG8ahOomOlUF4HOLjHdaQ2DUUhqcG3HNHlF85RrFcLwO4lVH
	8eb14vWIH1jMHH8WK4PggQy9LUzh
X-Google-Smtp-Source: APXvYqwraMz9vRG0HWEBwssdpewypSRiyKx4fv8k3E1dOW/GDbOvHQIYn80AaxZB32Q9NnU495skvQ==
X-Received: by 2002:a17:90a:778c:: with SMTP id v12mr137167pjk.109.1568931136022;
        Thu, 19 Sep 2019 15:12:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id 129sm12502083pfd.173.2019.09.19.15.12.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 15:12:15 -0700 (PDT)
Subject: Re: [PATCH v2 14/16] configure: preserve PKG_CONFIG for subdir builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <241355ac-cea3-2eb5-392a-13ea1aaf62ac@linaro.org>
Date: Thu, 19 Sep 2019 15:12:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919171015.12681-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: c401CpVcAbEA

On 9/19/19 10:10 AM, Alex Bennée wrote:
> The slirp sub-module complains about not being able to find the glib
> library on cross-compiles because it is using the default pkg-config
> tool (which isn't installed in our cross-build docker images).
> Preserve PKG_CONFIG in our host config and pass it down to slirp.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
