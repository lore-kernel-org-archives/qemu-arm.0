Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5351735lfm;
        Tue, 21 Apr 2020 10:42:09 -0700 (PDT)
X-Received: by 2002:a17:90a:930c:: with SMTP id p12mr6828684pjo.64.1587490929131;
        Tue, 21 Apr 2020 10:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587490929; cv=none;
        d=google.com; s=arc-20160816;
        b=EK06GxEi0DGrngiGXLm13qSMRT1faqUr5RT9ZRf/pCosli6FKqXcDFwZF5VLde4mT4
         Gj7tzHVVl5lhSBttJ64pImfy22ukXzNYsHaNIIUYtkPQuFUoY4xt1ZFIZccg1ro+/dgJ
         ESE5fiHPXkhr0FKNBwTWeOkOixkCiUwjZk/ov1dHfWyowXPwrNqMO+TsUQntESWBkR9T
         /j9iJmkKj8gI1BB5z50KmBViObyIbNcDioKICGamOTY7GvdRrurLfPCbNnjPQ9/VBRqJ
         TChQh0v1bCzI43TRxEEnExdGDHvLO2pIxdhHDXr0bWsIa4G1elj19ho4Zb7bG7n7JzXF
         De/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=X4z+AKfq0+UWGtv24j1yk/qNn7FI9ECJ0STdJw3q7/A=;
        b=by9PFQ3thAFPxHKNepV9mnIumOZnCBNox+cscT2tMXHQqVe540zezkidVPM8q0lVWL
         DjaeVsEjSGS9qEd9j9RVOfaTNWDwnKoyHJy7xybxaDe8RzuzhjebtoGlFQ9UOmYhK9Te
         8/yn34yUYM2WWH7HR3a+PbwyjBb7yW07azmRuNvmm3zfp6ucNdZE+pm5XHVAhyXCkd4u
         ec77LlIQlbPsImytDOLDXaaF0wf71u5SvP6R2yhr195X1OoVuUcPb7hXkiPwpQTrm3Sg
         gC+7FjANTiMqmDgA4WG+h8UW/n+jgNMGKfUwKJ4qthCPfJCbQsz+xBvcE18hJqr8gN/u
         QNsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y9m4CD85;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a22sor4055816pjk.23.2020.04.21.10.42.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Apr 2020 10:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y9m4CD85;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X4z+AKfq0+UWGtv24j1yk/qNn7FI9ECJ0STdJw3q7/A=;
        b=Y9m4CD85qkEBHqmbO1B0mBiSArURI9ZbKBK3l5zKht0ufkbANdwHjELxI8PwY0vTmh
         bIh8uUkDYsZCEiXDPBWkCQFqFlKq3QmhoY1emmxflWvc4IKFawmhVP8HR2nd/d1i1O2k
         ozKxIcJCfF0S5/FGX8G6zxHvCS32Nxg35d3jqKqfSG6gud9nYeG0QgOlUvQYFx+IvqT6
         HXlOFdlNxXv2Pnl5f0pYeqkK4fgNpLQ5L/s8zD/Iv04gJOMhrnJZsv3xhmYy0w5jCtVC
         WpAZz3402lkfzVRTIDGMX0VUK5Kk82H72Rh7weZJqs8gXKM1IZr38y6I82yzOcuGwD3d
         V3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X4z+AKfq0+UWGtv24j1yk/qNn7FI9ECJ0STdJw3q7/A=;
        b=CaoaeKgxl3lJdbzuxmUVEKNaOQRf/eKad5flfcC3L/Sl+drwC1v6gZ8H9zLUQdOk+L
         4saVmr/KRfsibn8UGpw1L3+Yvvg3vQ2xPOSFkQ7gDky6yZ2TfIGJtBRv4GlG5Hh2GFIb
         ANO5BMcMJZs+1OXDbczIxImWtRsWw0GZ3kdJawVqJ9ZO0jBhkbNqn/Mpa2/fLrHDgAvP
         Z8JTz+GMjbdazT2ti/1A29zcdu3CYWL66ld1YtOa2WFt8IGPaU6v9R1RCH7ycF5Xx4io
         4MRS11ruVNAbCw6UypPyVnROWIZDy5wKwlMt9LaOxKlx3T78mvyQdcBOt9gKwph7vNRa
         NpYA==
X-Gm-Message-State: AGi0PuYK6aH701/CNPZpJa9trBnO0xfS+YCXdROKZTsAF21dadafZf92
	s3dSbfKDrpwr1aWYgpye4qlCDMf2
X-Google-Smtp-Source: APiQypIepJ0vb23WkPJq+rcMOpZSBWVyORcjmyFMw5Z4CByHFf4EGbbocnBShuDiDmqPxlUJ2LQfQg==
X-Received: by 2002:a17:90a:f418:: with SMTP id ch24mr6873878pjb.68.1587490928509;
        Tue, 21 Apr 2020 10:42:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
        by smtp.gmail.com with ESMTPSA id e66sm2930152pfa.69.2020.04.21.10.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 10:42:07 -0700 (PDT)
Subject: Re: [PATCH] tests/tcg: use EXTRA_RUNS to run gdbtests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20200420133455.25401-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96764801-30e7-ccd7-2387-643a2703d335@linaro.org>
Date: Tue, 21 Apr 2020 10:42:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420133455.25401-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: v0UA0YmdWIoy

On 4/20/20 6:34 AM, Alex Bennée wrote:
> With --enable-plugins the gdb tests confuse things somewhat as the
> plugin code attempts to enumerate tests with non-existent binaries.
> Fortunately we already have a mechanism for these extra tests that
> don't automatically include their own binaries. Use that mechanism and
> drop the unneeded .PHONY declarations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/Makefile.target   | 5 ++---
>  tests/tcg/cris/Makefile.target      | 1 +
>  tests/tcg/multiarch/Makefile.target | 5 ++---
>  3 files changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
