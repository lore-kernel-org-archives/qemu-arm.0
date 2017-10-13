Received: by 10.223.197.9 with SMTP id q9csp1122967wrf;
        Fri, 13 Oct 2017 13:44:59 -0700 (PDT)
X-Received: by 10.159.211.4 with SMTP id bc4mr2458064plb.160.1507927499723;
        Fri, 13 Oct 2017 13:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507927499; cv=none;
        d=google.com; s=arc-20160816;
        b=pbE+fRa6VXpR092ll/on0hJ18joh7OFuAc51HWqPDdT4y0ZoHL/mBjsB83rRmMtXgv
         ZEvfOMd8fZWc3I5VH1qJ/iJ7PqeENC59sLFMNEaQ9RD978DXlJGJRcr3h2nkMToCuWzT
         uWzEwmis/poEhCeJ3248m6jGQBvZS2CV/fsHRSGd9Z5kVf/EQUxWgKIUgKCqHnkgB63k
         8bVspwPYh8BCadf8TEkRBUAlfBHaNIKzdiVIu/kdbGxqsqRoZZI5jBNsvbYeiZSCAR/Y
         W1hKTZehyKU79VZcl4pu2d033hTfCSG3qPbevdsZuhFXNLytUKjYKsFv/hAa/c45QEVM
         ZZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=ZsF/+vCqut8TQ/Tdx4ZNyR5jl0/gdJPob9LGAJLCG/A=;
        b=db7BlstWGA9OM1zRO2DmbCTuh6ZlltiNiOtIrFAGRfN3GXQFaaZKWKon1O/m6nJxs8
         3seZ/VZgG9m3Y6NW+WQfnRT/hiTL5UlXy9QK/CA2GYvN5ErV6QiV1AS5MHzl96PZ0PlP
         BADgdlokN2hiJlsHhLBhFV9RyseiLDK7uRs9XLA+1Sy5PdSTR1X6QzqPoXOhV/Zw7Uu0
         TyFpECHgN/NX2oXvNYSiorv+GipHMLzTTae8Yd679UwAgAERiRK7RguV1J/+sS1/1zwK
         SOo+ZQhMxIetvOIv0eYdgV/9njiklvMIw46Mvp+8WiTXjiJuKBOxR94vUM+HKm4pIEui
         rAsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S0qhCSjQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k7sor492043pgq.297.2017.10.13.13.44.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2017 13:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S0qhCSjQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZsF/+vCqut8TQ/Tdx4ZNyR5jl0/gdJPob9LGAJLCG/A=;
        b=S0qhCSjQH1EWQS6CnZomSNF3DVyB79uu+L8H35HdEL9XRgQ/p+ZbOKa/hiMCB3rwRc
         mfEHaZ7TXHeC1OL7Rf90wBWDCq4sXDNWuFgeSFHIKtIsj1YIOqEVnxniX/pgOUuRXCeZ
         E0lY070q+Q3qLGCnNCtxamh/WlgFT26puLNYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZsF/+vCqut8TQ/Tdx4ZNyR5jl0/gdJPob9LGAJLCG/A=;
        b=KurFHU6J7+qliyBRoz2HcEkTansB14Pk/SnIimLLZS2AedkWraERJ2tvccluQOmb7K
         AuOXWk2ZWDu+d6E2aHBs58u/J+M4i9mKJMEpIGvzmiZp3V7+K3bxjcHgaIANK+c7QvKo
         oDLxEQCMyEqieOX0bcu6XF+UATWxYFKsGoFjijU7PCZqN9Eof2w4KZrEK8f2AoPlxOZw
         ROXK+FbJ7hSIZCZ3ZVqTNRsmhJ3OBo2gZlDLp5wNJvkQ4SbNSUvIKl+xNw/SdtQUBW+7
         LrEvQBi/ejL7Ug0sU2KLrd5bPE/+y4ggXhR78ibzHxPuUh31xDohw80tYiKXPgvYJ26K
         hK5w==
X-Gm-Message-State: AMCzsaUSy9Jfz3ss2E/I1hM7JdRHCvIJCmXNZxbf2ZhfVUqOVt2t0RHe
	bio+JXInmysPvRmGjeuHoyg7YZ8q
X-Google-Smtp-Source: AOwi7QAsVxcFuiMThDWoQNOUhzkmQrsfh94qulyGw/vj3+dXccggGxsDyzNDAfRknm3o1MPjxM6B3g==
X-Received: by 10.101.68.133 with SMTP id l5mr2275176pgq.332.1507927499386;
        Fri, 13 Oct 2017 13:44:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id u6sm4561584pgo.9.2017.10.13.13.44.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 13:44:58 -0700 (PDT)
Subject: Re: [RFC PATCH 04/30] target/arm/cpu.h: update comment for
 half-precision values
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2af1e040-d3ac-ae97-c794-aa598923e605@linaro.org>
Date: Fri, 13 Oct 2017 13:44:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: h9wfTELhA5RH

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
