Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1851719wrg;
        Thu, 23 May 2019 08:12:50 -0700 (PDT)
X-Received: by 2002:a67:cd8e:: with SMTP id r14mr34411024vsl.28.1558624370474;
        Thu, 23 May 2019 08:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558624370; cv=none;
        d=google.com; s=arc-20160816;
        b=voW/amH2YJhEGh/MHz1Fyfjy0YlS3hL1zFtlKo9/FY6LxNvr3JL3Xy0l4y7E/FoFfP
         LP0l6wVaBSTJKcRtOSns2hLXbsj52enfUAaL1mFO0LIfZH7kiQ3wW7ZBoU0io91cItPY
         CVkg5bJr8xM3xwMtDoVevBWXE+OHQm/f92MhYjaY4MDYDITlwFbRqpbQx2yXv24WBwhQ
         6eceap/4IVSXShiQ4AsRLfEXOGRXFbTPpI6IxtMZi0D+BmpmZsVOuRmpXKCazekCFlwq
         3C0R3VPKBelXXJWMGi5LbaHdNpEuI95enGM5mf2zR2NYBFLZtjKBWlMeRHjpBs3kKWAp
         Ypxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=QNQKpv2CPlGI9NxgyqLnOGzLix5RD0rVAppORD+LUIE=;
        b=jy6xgW/3ZZVI8uGdnbSuKB98CZdObrGarDdqPkzkULnnAcf+7XAfo5Z5xaZxJGqrGv
         3J58SZyBsi1bGXzwLd8av05A8n4kZWwo+HQ10VYlu49IZvOSYEeG2Wxm41tL94DKNfOx
         lBg2XERJQ6rbRFvPsTEdzG45+PpR8ImHSHHtzCizzAFTQbksWiHc1CeZTVEeuhxYOKyw
         8W2rlbxUTlXu+KgjIAuaFmNd40pB8obZcNlnM6ex96pAKVE3dhKz4fqxTPwscExTFJgU
         VwcZ0AJ1/VdTOEMGJPbtEaJp0KFK5YEYHMSiEAQ4ZYTvim3bZxoRXulEpl1MS4MlrqPB
         pVLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsvkUwyd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n66sor8971755vkc.43.2019.05.23.08.12.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 08:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsvkUwyd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QNQKpv2CPlGI9NxgyqLnOGzLix5RD0rVAppORD+LUIE=;
        b=CsvkUwydNuPhla8uuhy1+uX1TPpYxfzKB56xJv/2mHBFUJHjQd6zUBr8mDvVGPbARm
         +NPWnS79w0KyDvp4/FYY4n9K3AEDU7LjWLCucIOqMZACEifuB3+vDEk4uz29gM2GgsL6
         Hv1+R1X07byI3F6mSqcLp5p35uJDFXCiSIJmuoo/+r+jZl8DDoNks4pE4Ar96B2IfUHU
         QY4fNcmx80a7KGs0o3ONyt88tW3ZTYflFutCKfGwdJzEp3Wvrj6b85ijq2R1Ec2uCjjp
         UxpkRYWrd8ck4pwz8jdlcnolr7rBdGz1F78dDxP/ZDoeEGJMKra/0d6c1tp2+kjZ2VbJ
         1l5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QNQKpv2CPlGI9NxgyqLnOGzLix5RD0rVAppORD+LUIE=;
        b=owhRpm69+FsUZUQeMYtwlTKqCWV6v6+jAtoC9ipOz/i6oappp+HK1bQ+oks9Belage
         85PRVx/v/nfRCfChHGL3rvfGRv5Nuu04U9TsUW0x9O67T3vCMBtE8fD5UsH6fjsM2lF/
         9PtnFO7AgrNVacbsfefowrNF5vgEPrEf68M/y160kZTgaYPXJ4WXdb77TbI43snZulQl
         bcfQVO/1qDz0tUnSH++/MJztPfiGhrEwxayeFTr9e+V3T+JkeRdNlPtUPZoalN9tBgIu
         YQAj0Hg8Wcy/N4H+2bwEb6rIxSnK6tMOKiQPlauvw/fXh1GbJPdE+ueRMt/YV3GfFHl1
         1mUw==
X-Gm-Message-State: APjAAAX0riHez421OV3qu1oIYXND+Geud4kOCI1mZ5WQabpFns3mTBsz
	cbJ6aP8QX+AfsWSJbXGRZeUA9nxe
X-Google-Smtp-Source: APXvYqzWGkHUG0Grl78bAvYjrDbidLqxMD1YAiVKp3KJ5Db4/JGTEFV8e40Qs+PDU/sog4cDa+8P9Q==
X-Received: by 2002:a1f:c2c1:: with SMTP id s184mr1944645vkf.65.1558624370062;
        Thu, 23 May 2019 08:12:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] (ip-173-130-215-183.orldfl.spcsdns.net. [173.130.215.183])
        by smtp.gmail.com with ESMTPSA id e19sm2927405vsc.24.2019.05.23.08.12.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 08:12:49 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 02/28] semihosting: introduce
 CONFIG_SEMIHOSTING
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Chris Wulff <crwulff@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <14e1cffb-9912-6752-1dc1-566ff86197a5@linaro.org>
Date: Thu, 23 May 2019 11:12:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 89Y5J2dR1Z3p

On 5/23/19 6:25 AM, Alex Bennée wrote:
> There isn't much point building semihosting for platforms that don't
> support it. Introduce a new symbol and enable it only for the softmmu
> targets that need it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  default-configs/arm-softmmu.mak         |  1 +
>  default-configs/lm32-softmmu.mak        |  2 +
>  default-configs/m68k-softmmu.mak        |  2 +
>  default-configs/mips-softmmu-common.mak |  1 +
>  default-configs/nios2-softmmu.mak       |  2 +
>  default-configs/xtensa-softmmu.mak      |  2 +
>  hw/Kconfig                              |  1 +
>  hw/semihosting/Kconfig                  |  3 ++
>  hw/semihosting/Makefile.objs            |  2 +-
>  stubs/Makefile.objs                     |  1 +
>  stubs/semihost.c                        | 66 +++++++++++++++++++++++++
>  11 files changed, 82 insertions(+), 1 deletion(-)
>  create mode 100644 hw/semihosting/Kconfig
>  create mode 100644 stubs/semihost.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
