Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2126103lfc;
        Sun, 15 Mar 2020 13:18:43 -0700 (PDT)
X-Received: by 2002:a17:90a:840a:: with SMTP id j10mr21146833pjn.37.1584303523168;
        Sun, 15 Mar 2020 13:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584303523; cv=none;
        d=google.com; s=arc-20160816;
        b=0bcNm8XdnuxaebIVJk0SGlevJ7RQv2aISItLjQL7Vngkagk/5tODOiWGh0XWP66Wj6
         VcOxRlEMME8WcnuQVX4JP/1VBk2W0O++CPgrcKt8ngl2KCnspnqxUs7g3H1xisPmfzxo
         zIV/VtDw7+BWi6bV38Wc1RKJluGMZA3yJoydcxPQqc76hmBDaOWHdodG/3dWMyAswu4T
         QkrE5JhMKStcKf4M/5G2IZKAswtCLNO3qmq10AECoBk2SEYy2uHIbOITahrr7OscTT9u
         qv4UOXIzTaWS4cgxTSGDtUR4KdwCP9wuRa7cebMrXzyhO2euKXmz8x/iqYlfdZMj1PaN
         WfLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=tPwZ4NakikcOwfVAMZAy1h09eFvA6fIiEKchL4XH/+c=;
        b=fk05PHtM0Z9JBWCiXc6LGmuN9pODvP3qlvx5glF3sSR7Sa91Lk9nogcq9N/+2BIO2H
         fu3/NKeuEtgDhAN8ozwXFdRJEIj0wzKOrfHjxBUBfYywEsEW9ceO22Arj4l/lNpgft2e
         7d4WUUyLCOXWhE5w2qjcCtwTFx7dxcPQPatyzPUZTrqssiInN4YDmSElzsN5XV0lPw3d
         D6D0hxHPcLkspKOJb26OUZ4uzeb06Rckh+Ow74yXO014YbaiCUjRPn1OAwp2IHClY0Ow
         JUtwUVXLTHeV3bwlLH0U+qPdz48b/1Uz3wdIFiTWGcWeQgDLgRPGC3dBavHYAGi/IBFB
         29ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EnV4etuk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c19sor19178561plo.34.2020.03.15.13.18.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EnV4etuk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tPwZ4NakikcOwfVAMZAy1h09eFvA6fIiEKchL4XH/+c=;
        b=EnV4etukqVd7OmLP+BhkKk8weN8D0vlQZVmEMHx2UrDW+rZucpSJSrh/XBSneukxxn
         ir1riOfWIyVKivQ5ia64PwezK8pVNUAOOJl0Ab1j3JfmoQPCZ/QlwV1YF/mbKh+AmXQy
         QIw4e49PD/gktjD1GyL35NWim+pYdKnFYkeG5CxPUJi7scrnCgsm63oIxM6SoHkKaAD9
         Wkjh/bu8C4kfTTbl99s/kRehq2dhw6EYlJhuiL2luKb3Vi8GOeVuwKkgA68kjJAiMyD1
         gIaMReDynxRKdvNGF6jGWa0Tnt43WiO4yFRKckt6XOeg1ENqOifVdbuU+gasgRZzlpOI
         waag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tPwZ4NakikcOwfVAMZAy1h09eFvA6fIiEKchL4XH/+c=;
        b=E5R2+BNkPfLE+qG/6VeL7akUiMSdRzRzLcMSQPo0cpn7rG5LKUp8QTkdvzZi63IUfF
         wUUphz7z7eUNSP3cGA8mc3x9xfngodgSXeIvY+GgLur2Xm4pC7j0ZG9ivvfqi57tb6DU
         Dm0D6oIA0qlMLIckkfC2ahZWI5e0UqS9n58CI3dYFDpEXSeda9uLhctihXnZ9+6bk++S
         EZ7mPh8wmiw1e+Pm20Yo9LNME4nsuZ/VXTlxFExkqiYBorJP6637NG+Or5foX9cWeJEd
         f1UeudJnpswMelY662y7wK13x/0Sx18UtF7tw78APwK/L9DkYWnX6BFOSNY6Nh05/NgE
         U9hQ==
X-Gm-Message-State: ANhLgQ3ER03dUDcFrfPR5goRgji6PJ3hLIEPboITQRt20Cii4Q1bcF3L
	/8HOy3qE6LWYhKnhYJU41jH454Jy
X-Google-Smtp-Source: ADFU+vvoMqGceWF21tpQ/ru1JYPityst91oYzA5zXFpXLbhVxqkhKFjGKFGAdvC8Uj0oaFXbnNX6eg==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr23984325plt.27.1584303522679;
        Sun, 15 Mar 2020 13:18:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id k5sm17444826pju.29.2020.03.15.13.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:18:42 -0700 (PDT)
Subject: Re: [PATCH 07/14] target/riscv/cpu: Restrict CPU migration to
 system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-8-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ffd75cb7-4b80-f098-59e2-7c24f0e03288@linaro.org>
Date: Sun, 15 Mar 2020 13:18:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0JZk5VKWTg32

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/riscv/cpu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
