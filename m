Received: by 10.223.197.9 with SMTP id q9csp1117616wrf;
        Fri, 13 Oct 2017 13:36:21 -0700 (PDT)
X-Received: by 10.84.133.193 with SMTP id f59mr2423078plf.332.1507926980961;
        Fri, 13 Oct 2017 13:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507926980; cv=none;
        d=google.com; s=arc-20160816;
        b=AZzsGelA8ZfNqwiWkLjNlgF8iD4fXBb+wHsV5wjxG2IXwDCASE9Q7t0ciMK1VWOTyH
         DXp7tXviTqIbW3bGf47hDvktlEXQAaBKkPsZlrJyzBdICY6PFb44P1YQFbM0fVFDTXc2
         n1c3uq7WTwQOXHjmFP4iTG4tcP8prRBKr3kAfYpTcLL/9hJuB63I7lv3lIIJx8AYVlzK
         cGPrAxkBmJF1NtibFeJs7in09QmVFVW8i+5C24Xta9CbmHqXW37AxFbO82JEI4QILzho
         UFLyHx5IpbKAtQ17Fy72IVcosusvJJ/XH8CR4dJRRKhecqtegtKmEWcHiD8gk054+IfN
         STLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=VcBdEuA8W6lN2LzTxZRhTKOJtAxE0YUXCXmmQWue7Oo=;
        b=BZqFvTtGS0ba5L/sDduhHpczFOeluscGifbtRz6JQ4qs/luQWiry+QUTJgGWDk9nXI
         U1cfshByoDMmOYEHAzWe12up1RWepEoMOKqcLD2bpLG1r5WGBvnPcL6wcfKBmOs34r1W
         s0Wx+zSG3R5VwAIRaG9HU35OGFZ8qY2toZX3Bjam+A7QAJMUT0D7NEpLjYSHr2ue9J07
         irS6/Beb8VPdCLcpqMa6IMP19SLmcv2uegKpmmbl7vUz1u8Bb7MOyttbTgzktv8dKvZI
         bml5u7ZSiGwnV4Kcq00WYJcPewjRKFz3HMmX910LuXVpcbVPulWgxK3BNNQZjU0OeSdp
         arRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hBcvyETv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c9sor457554pge.394.2017.10.13.13.36.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2017 13:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hBcvyETv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VcBdEuA8W6lN2LzTxZRhTKOJtAxE0YUXCXmmQWue7Oo=;
        b=hBcvyETvcPybw40FOT3texlNUdBJqMNC3Uubl7aKxqOZG87IGLsqhJf1KHjLr85kd9
         EkiGRM/L2LNKm04EhFVjS9QyKlULhLEnRe4oQieRzgPLbRB5E7xNRc+vFagULCSz1GeP
         X+FjsF14U6R+W8GCVrNfnwnbDrc7KTcCEqyRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VcBdEuA8W6lN2LzTxZRhTKOJtAxE0YUXCXmmQWue7Oo=;
        b=um8uIHIG95utSapdYgh51Wz9D4szwngn4pU7zsP3f8MLKFLwSgON89eLrK5CQspz3F
         MSk5WDhN2TMzlSxSl4YDMww9n4gYEjb9V7ZpkkibV3s65t5CT0Y20Te1Onwh0ujdW/TO
         6AJImPCKJy70rWjCWUGdybp14SyRoVgZcHK2UoBVqCZL6y0mk7tVhw9BxB/MKh2gTlMk
         f1NaL1exZIux5IqW9MA1aeiXxHymnBMofGzx4nzCAIJ8XXAH0+bqW7iTTgAGwsVirK69
         xIzxZAa/RTHo4nbKD4RiKMVtZPfwDf4OU19JQAFl0QPY+BMZiu7CmwYeU4Z/G/DJ5Gog
         xu3g==
X-Gm-Message-State: AMCzsaUsbrW0f1dlvI7AvLvJNO1tE4JUlyjdcdFHUmZHaEKelsPNdEe+
	PWXNArX2cJrbWyiq+IxXCT4kd7XT
X-Google-Smtp-Source: AOwi7QCRqYYdOrIM3frlIcR6tSH2vU2B3AuK0ssik8A6X2kWfTzyQ54sUvZMbePvY6xyMu4EG56wxQ==
X-Received: by 10.101.93.2 with SMTP id e2mr2192537pgr.302.1507926980485;
        Fri, 13 Oct 2017 13:36:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id p70sm4056799pfk.130.2017.10.13.13.36.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 13:36:19 -0700 (PDT)
Subject: Re: [RFC PATCH 01/30] linux-user/main: support dfilter
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e56fd3c5-da79-16b0-4f20-ccda7e22dc4c@linaro.org>
Date: Fri, 13 Oct 2017 13:36:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ODEZFHEdNTJ3

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/main.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
