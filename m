Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3188160wrq;
        Sun, 24 Jun 2018 16:04:28 -0700 (PDT)
X-Received: by 2002:a65:554b:: with SMTP id t11-v6mr8777754pgr.130.1529881468055;
        Sun, 24 Jun 2018 16:04:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529881468; cv=none;
        d=google.com; s=arc-20160816;
        b=Pq7sEXbjabrgUPui0GleVKSmEkSWvbM/B3UfTFNuVYFCr924SMmXpcIjOPFK5bfKLO
         tuYdustI9Vy3LlVjO8xxD5yx7JczOKoBLm5hzH8yWDYrgRbPq521uQw1j58ET0jvinpq
         0yHWtNpmNq0DuUc8osm3m5Wv/sUOl3o/2mvQm7814MxdhwFv+7RUh0uvTjbj985fFiJb
         REKnanUYzqZuaPqXHgjecM6UHcLtblXF/xVXhD89r0VeD0FnQ+BLwYUFtkUV+2AYXi3W
         bxZB9sn/Uan0QG/2zl+C+KrH+Vg+pDl3McumYx4h1sD+zfSgNwiL1ZfyWcuegjsQeFwh
         MVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Bvu9j/MlQo1Mv9gDrLkjGowzF9TAWUE/bpnFVqlw5XM=;
        b=e4QAkWpQhK4cwXHatAk7HmE/HdBacmOlYNlrO5/LN7AiQTG8H2PnrgZNRyRLiKfwX8
         R93t/XJkhrUS4VV+jy9B2Ph6PMoAGDMtWfHpudQuuegLzvElTj83QLDA2tyv6oymPgYm
         UFbyEv9G9s3cWwFN4xA1aDD/oTwaWwfAixNXBtQ5xO3C2Hd+V13zkmf7TB+xSv4zBj3R
         5vZlMhtzF3UgF8Gu60GTMyJEDGOe/a1gKO1Ze/7jDjJR9g0YkCnE1xuXORBs/ke0dV0j
         /fkq3mHYXwRiEAVhEw9YO/3LZHBOEfjKfKYnx4HMLPrnPRZtsVAMojFP98IeEmyIDGeK
         SSGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SgXgKOiC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 97-v6sor3998143plm.6.2018.06.24.16.04.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 24 Jun 2018 16:04:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SgXgKOiC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bvu9j/MlQo1Mv9gDrLkjGowzF9TAWUE/bpnFVqlw5XM=;
        b=SgXgKOiChZX3b5LBsgvXnWOTLqAY+SJNGAQw18s4w2+3O8ZW+wRGck+ULSEJUsGcM9
         ZQNvFEE+CYaNKDnZEIFm0LgKvYk8n5ZDRAj1yex8WM/RJS4kExBYTwsHqhKE83W69Wrw
         8JTX7ZkfB0CqFFM1kJJ2VUGlakjq+ydNgxmlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bvu9j/MlQo1Mv9gDrLkjGowzF9TAWUE/bpnFVqlw5XM=;
        b=d7LU3aKcY5heGM2b2vFTiWVobuKzl7mLx62kgIT64wDodeRx8x6jTHLpyV8hKfzSq1
         eRsOXP9rWMsnMFQR72Wr2pSDrFt0q/txqMJK87CnzfqQVz5YXrod27lrOAagUdfST7+U
         HpU1L7qglxQaAqf0Pn0pHAhBHhyXKEl4nJvhVAgcdJf75Lq9bpWol5QWi1pVk4WMsIG/
         yi8h9epEWKewpQXQgxPau8c5ur8y7EkCPBWFk3hOnXrGWKNG/+SASGCzqkddrBgRj9tj
         fR8jUBuPgRrFsj0ZR1m194LL48PPl2diDxubrfzSNXK+xHFgeNqjjC1+iMu0kJHhYo9r
         VnbQ==
X-Gm-Message-State: APt69E01gUj834XZCmTqFXcpQfSROh5amNcCs3/L6OoXk+X3OjKNhIzb
	K5nxuFVmMBl5hbn7g8HXbNIsQ6fl
X-Google-Smtp-Source: ADUXVKJU0s+8Q0/yQYgKIjSuU+PFmZVP0duMiF745jan9yYTDaSysEH4Hgb3/64G9W0bxW3QM36ZxA==
X-Received: by 2002:a17:902:ab8e:: with SMTP id f14-v6mr10203102plr.5.1529881467625;
        Sun, 24 Jun 2018 16:04:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id m12-v6sm16308587pgp.88.2018.06.24.16.04.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jun 2018 16:04:26 -0700 (PDT)
Subject: Re: [RISU PATCH v4 22/22] risu_reginfo_aarch64: handle variable VQ
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180622141205.16306-1-alex.bennee@linaro.org>
 <20180622141205.16306-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bc3f6e61-fe81-4666-28ff-c7889b289ffc@linaro.org>
Date: Sun, 24 Jun 2018 16:04:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622141205.16306-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: YmnBr4tA4bxk

On 06/22/2018 07:12 AM, Alex Bennée wrote:
> This involves parsing the command line parameter and calling the
> kernel to set the VQ limit. We also add dumping of the register state
> in the main register dump.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risu_reginfo_aarch64.c | 38 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
