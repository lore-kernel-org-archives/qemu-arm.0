Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp456894ejb;
        Thu, 5 Jan 2023 09:02:48 -0800 (PST)
X-Received: by 2002:adf:e2c6:0:b0:26d:f5d2:4efa with SMTP id d6-20020adfe2c6000000b0026df5d24efamr39815534wrj.21.1672938168226;
        Thu, 05 Jan 2023 09:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672938168; cv=none;
        d=google.com; s=arc-20160816;
        b=0Vt9WjmBhECHTd3B4LK26ZjjT1cys6NgCIEEnbRtzNeI+YmitfMERWw7gVpkPll+XE
         GAgMPeZeb+NXdfi0h5hjLhrgBbFOpu1jMEX/SFRBxURrhM3rkEI5oEts3Tg/IUqQ9Awn
         T+dN/f7WyjsV4lEFpJk9P/UXX9KsHGfBHjo+jS15hdgoj+WwXmeA++oD6OZdCLF2NIsr
         9m8sL2AJi4PRzYSRJq/6bsMPUYpzgtBBTzQXrxjHMqH1euHfMjltFFuAp/XWPcb9/rhm
         KPGjtOh01vfiZaE7w5ffWOeeukMa+u3NE/ybIUyC3tJLoVJ6WHPZyaB/gloua4NjI2TL
         kyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CcnP7aWAb4dGVBRr3hshFgzv0C2uofau7hSDirUapjg=;
        b=VPXill0XKiBOaySkXPwSAHAo4Bzle1T7yhAPlJBUReONlV876B9ZXMiUYzD5J7RUUq
         i276ALBngid7yrLkWdVu5SfKbB9wyi6HSMpF6DcQeBI8F3/6pMOMztfF0Nh7vyvturnI
         o8zi8Rb3Vz7W5y5R3RlJfq5rautd0F5HZfvkEEW2c/VCqdbammqGwoMGJ7Sy41KAl592
         SW3q0qtUBq01TXpssd5pUakgu/tINq9T22TiYf1rsDz0AqYmowxM5zCbmKHCL6A46IjS
         z4mLzAV2ju7JSJAICuviatJfW9jGSFa5vpssSQd2LP+9sj9YYRXbqunwKnzD4NlMgnyB
         NwGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBK001LK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g1-20020adfa581000000b00241c67bdc1csor13850609wrc.19.2023.01.05.09.02.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 09:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lBK001LK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CcnP7aWAb4dGVBRr3hshFgzv0C2uofau7hSDirUapjg=;
        b=lBK001LK+TB3QKxC789UxkS6/4HDozC0X2AhfpnwbaZEXshUT1C0PtryZ/xLCWMx1+
         9E3bEAIdjGIaPEsSjR6rRbofvUK6pRQJEa7j6fdyghLAtREAsZByDkG6xjFA3k0uvnO7
         4WFaFMyyfZu8fGfY1910r0jlkyUPYFDiRrkWeUkrYmaNwWExXN26uPmRV1eWvLPlV+fa
         2cGLpxHe1b4qQxbwyTSVBvmr/AEx9/45IoJUWbmtVX/nu9bWcsSVW/oLoPVXb0vbVoXN
         amboexTvz6ZKwHgjzORXcXOK14INnbj07MoxqLPov+w1zA/VApWwsWRTbd7cq4xDfUpE
         WrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CcnP7aWAb4dGVBRr3hshFgzv0C2uofau7hSDirUapjg=;
        b=GIuWz4c7L1jgF/SEPWkbuMfs3kmeidS74D/PHtm4DpqeV2E7GEnW+JkuvqzLU2R3bD
         1wc5NeKoNlAzBRSzm9ee+1Yjy5dYFrJPqLyVix3QGN44X3ag1XcItleWWUqMHwPNQTJP
         ZyfGBZxR5cFrYB/+fUyra9lY9oGmCHVBP//6m71Bxa/nRmMiIkUOxFylG4wgwAHX+J4Q
         Upbk2rtv0OIthMRJc8YEvAN+von3D3Ze5BKnMTdAtFe/BfmxXEPAyN2US4Ucq58bP+Yu
         awuMFZTXlXUJmhJL0+cgt910Py3dwD7iHH8/+oOuQSdEpbIvWy7j+v9mIvtBqLyxiGeJ
         KjMQ==
X-Gm-Message-State: AFqh2kr2H0PG7h78R8/dQKd97aZeSgv0esFISgSDrPXQz2tPNaNV3hJ7
	B4XROFQcDGCaN38sRPd4Fncjzl8lktAnLIQ79EI=
X-Google-Smtp-Source: AMrXdXuAEUHl/LgDd+1VidXYOm2Iq9N6Bi6jGDBjuqtVLdihba82r0wdEHnfaUaM12OL2tc1JHxy8g==
X-Received: by 2002:a5d:640c:0:b0:2a3:1c13:2888 with SMTP id z12-20020a5d640c000000b002a31c132888mr5691577wru.60.1672938167717;
        Thu, 05 Jan 2023 09:02:47 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id bt18-20020a056000081200b002368f6b56desm5593135wrb.18.2023.01.05.09.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:02:47 -0800 (PST)
Message-ID: <e37489ac-78c2-4930-9cff-9a172a5925c4@linaro.org>
Date: Thu, 5 Jan 2023 18:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/21] gdbstub: fix-up copyright and license files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qxxaqLq9GIOP

On 5/1/23 17:43, Alex Bennée wrote:
> When I started splitting gdbstub apart I was a little too boilerplate
> with my file headers. Fix up to carry over Fabrice's copyright and the
> LGPL license header.
> 
> Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/softmmu.c | 3 ++-
>   gdbstub/user.c    | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
