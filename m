Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp65173lfk;
        Thu, 27 Jan 2022 19:11:00 -0800 (PST)
X-Received: by 2002:a17:902:a9c8:: with SMTP id b8mr6299756plr.30.1643339460325;
        Thu, 27 Jan 2022 19:11:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339460; cv=none;
        d=google.com; s=arc-20160816;
        b=nJH8hgOUuErSGt4Q21ZCHbRHSKDzeDNjmIIlsn7CNkI6Th0YmY1jF6RC3UeswuJyzr
         yOGb9y25YXIFdREGDxihXSufgngqZa/tM2l1sF/0Cvj80VRr/5W+w9XcYWZjeRYyGXNF
         Z7P7GiDr9dG3/LJ9lJNSrMq7dtnsiHJPnp73tR+94K/fPrJWHKDYutCHbBY1RaPo0cSn
         Z+g+3YRCZI5h/tr1okTzCeEr7I6VN5DwmtMTHYo+M65u8ZE9a7H701e+jeoagXqerov2
         5WBpO3E1LZhQ6SHX+Z5fPkfYhH67vGz1YTq3WMaVNHqDA0i2p5QcEDWNlFieX+Xb1UCu
         4fSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CmHD/KD952UGoY8XcHGPqqybILVSYCuEFXXcb5e8iBY=;
        b=F9TpHm+7zoi9mT1x40t0VorMjTGlHRaD0K90/GfAB6LDs/9jJyw1GUO9sIeoX3xmHe
         Pi//7PsVmo+ZFKpAFNG8sJPpnpvDn0SmRwUcwl/I2qRFuE494uE/1IzmRBGZ/NLo96zr
         tlsdd0oo6oVxYRL4S+M1oJD7dDEqTVOjlE2ABwLaQB6iVC1hzPalNPIvTsXkVQzkr5G5
         stkbSMqRLLTUzU/uhgRY2fwaLy0JvU+Jf24qKAENUdB65QSRqk2D44r8ohMXHq4ioyQ9
         XK/uryW1gplng00+17DwpMnybymXwM2VshWJrRnu3Zm7yn7d2rWa3oV8iwUVka9CW+1j
         mbSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I///97cF";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id oc17sor497619pjb.39.2022.01.27.19.11.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:11:00 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I///97cF";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CmHD/KD952UGoY8XcHGPqqybILVSYCuEFXXcb5e8iBY=;
        b=I///97cFRAuol+LVV6dA7S/5ZLqqSVx8e3NJroKjLeRNciYajY9Ck6++GcH7KnFCdp
         rR12RwHxwa03foj5Jn1TEGGTJyLb8eptWrgv2P/bRRkxyeN4wPezUYYIU9Phh6GwLMYK
         pU3fRl6p2MfUGzcvZyeE+8ASSqtw+7/OzOQlUGeQ5dsxzKY7i31u3y9jTYMhZLZsIK47
         CpbYzZlwjbRAnTQLHNq4Ad9NOb/v5yW0wgT4Fl41ye9ApJuBVTcwJ3S4RPB2WmwYKbZ3
         CPA+OSzX9nWGHXA8rh37mxeWcYidf/KfBCB/qyYV4dOxht/cWl+wTquuCvL60UOydh1/
         i19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CmHD/KD952UGoY8XcHGPqqybILVSYCuEFXXcb5e8iBY=;
        b=oS2JVjtQeV6vwskeRWrECWgTs9jDrfvk+TQzOLJnGH9P6w8Ko9vRycNuvE612ASfm5
         YUcxbKhtuqEIBVhZsZhnyOkdR/AcsXrbGcWSOExTyEAYS2mJPS1TJvnw+IpohIdjC2nf
         kZMwHGLJM96wVr7F79MTBSawtD74ArVzer+guBNVVnYXM/2JCvFo+BoVqogwJZQ4xtVZ
         pUwSZNtge4swlLalzrmlt4rIbRdd9x7OaFPrq+Gd1JhqFGFVA6CDkPQfbl+eufJekwNm
         vFexBkX9+LTDCM4DT2Ic/e66V7G0Di2MzOgg4bRviGw7olAXDWPZfAdgdnxu3FqALyxQ
         7P3A==
X-Gm-Message-State: AOAM531kucZYoabYS5k3+E+JN1xazmxCV6aM2i+sVvPO/rjMswahwPlO
	sEV78zfAnVpPezRk3t2ntSphZunk
X-Google-Smtp-Source: ABdhPJznXeTK3JKGmJ/NYZkhCraQjXjFkNkcXRdKlllM9k/1Oyzp/q1Rlqc/M9VG7J43VNLHS0cfcw==
X-Received: by 2002:a17:90a:b90b:: with SMTP id p11mr7506308pjr.189.1643339459852;
        Thu, 27 Jan 2022 19:10:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id u16sm7202805pfg.192.2022.01.27.19.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:10:59 -0800 (PST)
Message-ID: <9e38036c-12a5-09ef-61c9-932fd7e1677c@linaro.org>
Date: Fri, 28 Jan 2022 14:10:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] hw/intc/arm_gicv3_its: Add tracepoints
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lHoYgclQTfK0

On 1/23/22 05:24, Peter Maydell wrote:
> The ITS currently has no tracepoints; add a minimal set
> that allows basic monitoring of guest register accesses and
> reading of commands from the command queue.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 11 +++++++++++
>   hw/intc/trace-events    |  8 ++++++++
>   2 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
