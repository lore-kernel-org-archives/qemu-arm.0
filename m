Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7536729lff;
        Wed, 15 Jan 2020 14:31:13 -0800 (PST)
X-Received: by 2002:a17:902:7896:: with SMTP id q22mr278792pll.57.1579127473485;
        Wed, 15 Jan 2020 14:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579127473; cv=none;
        d=google.com; s=arc-20160816;
        b=rjAEFVy+1TPAdjuSjwwItWfets18yHiCIFhVEjKwKai9vifKc8+gIMfJLYeKdUSeB0
         611tyPSpi403JWlQU/V3bBJWMCZIbvLqzjt5pr1N3uNIAGNBo+ef5fi+tPqVtz6RT0yI
         ZSJ+0edK+tMtT/xtcscIZRHktjU27JlLzvLXvwzD6D0wCcuEiuPMSzVCK1cXeyUma4GC
         GjzRe7JS1Et/p0c6sbuQzyoe7A6WrjwEXTeG3EYIip3yIk+KWQNxNrdgJ+gYWekbVt3t
         hHO2PARsFzWr/YfXwODnfhayUh355541gOU1qg0um4UDWmoenTNg8DYA8lGRlhhrq3Bv
         oyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pVPBsqE8MJvYXtbTzgz0iptqaOAX+Rr+QBlHSf1JYjQ=;
        b=wxkS+GW70/kv8K7uX2ZfAvoA5o+n62Nugfpef6MwATiRp5sJwOqdnRrEgnFmdcV7KY
         zxR0LPLsxjplFTr3VlBWeXUU0r9ZXeIJf2gc+SG1hKuVVkqT3SuRMNBp2LlrCOn/kIHH
         YdM9Dgo9upRrmGnND7ATdZi8U153Qd6Gwe49WyJgh0JVARF9JseVDwnpqzXo6q1JACDn
         H9qntOJFyiYyEJX4znf2i08Y2BdMEv5yibetHRDy/HzHP0Ya9GOwIpUF7tzBFJ9hnDni
         CEeZIP6OgZ8d8DYv9ngdzOVbvDFNGPToORKHl2omme4dPJN2uQT3mg/vOwo8rFw5VHg/
         D5ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HVSjk8S6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g26sor22096404pge.37.2020.01.15.14.31.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:31:13 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HVSjk8S6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pVPBsqE8MJvYXtbTzgz0iptqaOAX+Rr+QBlHSf1JYjQ=;
        b=HVSjk8S6IlsJeApEbJtMDD2g5qytnvudBV4F+m0l09OF99q85gJQhGbfWi/rjoi0vZ
         z9QSaCKixz563Tr+nEigxdPbuCGLbSkx6NheqWFmD+IJ7BYz1L/NjWeG3uViLzMa8ETC
         5vIzIYbvV+mcuxc+dSOjs3o6HhR1E/S0HLhnb6+NAHck+D74Oy1FACgCWEitIEHG2HFA
         AIUR3GUfnlFwIF0V9pVJGd21hXhJUxHnRgfMppzjv5qvZPaWY+rh8/aVVmZkEmvm/EtG
         WH5PfcMVmZiEtjYG0/0QbZtwp8/57qdYjKd7p88NMUKEsLpZLpX2sG7WvDnE4RxvSOyo
         eFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pVPBsqE8MJvYXtbTzgz0iptqaOAX+Rr+QBlHSf1JYjQ=;
        b=G5H5cTZm4dnPEKK5x+dG0MWxT4jUlecTdUv3zmRKRwCavROyYW09Zsstc+GKQwREjS
         a93cAwVeZs6bitOZnVJjuQI+8J2pHFkaknbjsegtoThUxCkprj1PmAtlSW+UQ+vA6Bt5
         iPvXq7rPsBo1Qui+Xiix2oSq6sXz5+SIQoI6/xi+tNwwY3eyfGY1tgTL+328queek9XZ
         zzG+dle5X0P0Jrv+PLYTtPHh0vW8YxX42E4XBKW0xt+CC6XElAuToUcLGX6N0PkJPT+I
         vcGBGo7jFVLSpLbgmYqfz7fro3fZK0Vn6CK1nbMyOSjDPP6nL08FiX9JEfY03MLzqvr7
         SUtg==
X-Gm-Message-State: APjAAAW6LfZDqlwmiCwr4JrbUN5Wk+1/bFWj1PGsavWp8gctYyNME/KQ
	84mCCJ4hXvJENBvS5hHQoS9ARSmZq0kFyQ==
X-Google-Smtp-Source: APXvYqwXN1FGfCj/HRciISFsBdrvE4/WHeYaFGhcJHRr5+egvGJYfvPD5v1CV8rTkbdQZvDXWWtspA==
X-Received: by 2002:a65:5ccc:: with SMTP id b12mr35171139pgt.124.1579127472984;
        Wed, 15 Jan 2020 14:31:12 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id b15sm22846927pft.58.2020.01.15.14.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:31:12 -0800 (PST)
Subject: Re: [PATCH v5 16/22] configure: allow user to specify what gdb to use
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b0acf88-131e-5145-03ab-b33bc13a85bc@linaro.org>
Date: Wed, 15 Jan 2020 12:31:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xYT3qZR00OWB

On 1/14/20 5:09 AM, Alex Bennée wrote:
> +  --with-gdb=GBB-path      gdb to use for gdbstub tests [$gdb_bin]

s/GBB/GDB/

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
