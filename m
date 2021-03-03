Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5067785lfg;
        Tue, 2 Mar 2021 21:18:10 -0800 (PST)
X-Received: by 2002:a17:90b:4b0f:: with SMTP id lx15mr7941797pjb.183.1614748689802;
        Tue, 02 Mar 2021 21:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614748689; cv=none;
        d=google.com; s=arc-20160816;
        b=CN2hX9AQiro86tG4DTUAwg5zXOFUyMFGeAiPdey3lbfLxxRtarsfKhrZCWt11YVua+
         dIHFa6o1nNsz4bzkCa5zTiEVmD/bpfyb9yy/GkCZbQKqdQ+iSNxjMtYReMUw356xWfqZ
         5o8XlR/py0ByzM9I7GPX7pH9z9zukmWNpn8x4ULr8WOZAFkPhU61GcgS+oP5KhK6c7mI
         9zMy7P245ceP0BRzrEjBeJABqZ9zo0eMf/K3EM9YueoR/ZXh6m+MQKjx4kB8klHmylyW
         l2HpVbmQ32+ZUb1btsNh+Ci0bIsAPL82FxsCeIrabmL21y4b6iMcyA1DCcFm7nyLgYB9
         ilsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4uVHlZNbZcE2Cvvdv/RWu8xEn9Wz9eUBRzWWJ/NNpuA=;
        b=RUw2u+k3Ql5MnzwBClmc36Le34F5G9Ew0etOLjBS9LGTidg2aSNdEomm+nZdVNkESx
         wzHkyhvxbQVemTtlkIyPjrd2yrND1gWLc10dhuNwz9SsKf3bP8CX0UG8xgUKXgaVDyrv
         eUA8/ZzTgg7oGzOAteJHxHxCoXvvxuGhfS99g5V/Vs/Igt/iNCOU9HKQVgiW5GzarFVF
         pOhWouoR/OMZXDCO3ofX6nZLSdKOoHSFjOblo/SWcfT9xmlwLtUe5MbrRG8aRiZ2kXUe
         VuaLgvslYm8VLLjLakHQIWe6BhP7mfdBahNlzdQlirRvhcdxunDow7BliC+WlI6qAXZC
         1o8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IzHU2gME;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s61sor2968481pjd.7.2021.03.02.21.18.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Mar 2021 21:18:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IzHU2gME;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4uVHlZNbZcE2Cvvdv/RWu8xEn9Wz9eUBRzWWJ/NNpuA=;
        b=IzHU2gMEW6+G+HK19k+gbZqm4AGTLJGQegpBwEtRhajjiHX5XIkF0gaPSWAL8oO+1v
         DWsLU+SZyjY6k+D4sPsZKwiLk6zAIpkUhfxfoMnpYNDDgSctzm13BMszfAlWnSGX32Tb
         IBMmAQ1pgzbSE7zjnViugyCwxAU6759qWbtdeiNTc6r51rmU8QnDDYzgQGfod+5zXR4j
         n4L3cGTgcnMLV7L4uxtZGmP+LQ3hItt4MiLGqEiut81yDw5wZerDIedaFOrpEMSCuL1N
         5yobfE92WuT7LkVWGP5BvKyOi082t051kAp5Vj/DJDFX8LQNq1TM7vYwzPl+ihvbRCr4
         GFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4uVHlZNbZcE2Cvvdv/RWu8xEn9Wz9eUBRzWWJ/NNpuA=;
        b=QK4S141RTkMAMlPSj7t2P1lL5uuiKJgx0ldsg3CSV6k7V46SqBExDUzvgHfXy9G6e1
         hrjnZEePT68H/pSDJLk/yw2RFHpbQ4Pba15W93xNXlTx/z7JKaFHsBppD/CCOlYsoP7D
         D1hn92e/wmPchIjIE0SrE/fXS0g5N2Mjd5qLFYp9o6tJFwV3mWWrmNopCdiKb+liMKMl
         izyEaDSSto+LnWn8BkNxEIFHW2VetLjWqnFZesmB5YWQhmyMf/5piO+DmRD2mLBdt0YU
         o70VBWj2Hwjp76+wmsT7dYGSSe/pW9xtJ6GYrMgtTLYDnxr7LVo3x5Qm88yAY4GY+B6V
         p2vg==
X-Gm-Message-State: AOAM531UL1eD+WGTzDWDYctQeaEhJR0PD1GD8E4Tgg7wMDqYa2LEHOhm
	ckBXEGlK892/y57odmvNJe1TgLYn
X-Google-Smtp-Source: ABdhPJwz+61Con5/jPcUXcTXucDezIVmIHEdMZ6biJz9zoJHDglHA31VKNet9fHJ7jd6m9TPq81DVA==
X-Received: by 2002:a17:90a:788f:: with SMTP id x15mr8335208pjk.70.1614748689249;
        Tue, 02 Mar 2021 21:18:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
        by smtp.gmail.com with ESMTPSA id q15sm5885510pje.28.2021.03.02.21.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 21:18:08 -0800 (PST)
Subject: Re: [PATCH v3 07/27] cpu: Introduce SysemuCPUOps structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Anthony Green <green@moxielogic.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Taylor Simpson <tsimpson@quicinc.com>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26555b24-cba0-3c3c-daee-142b16176fd8@linaro.org>
Date: Tue, 2 Mar 2021 21:18:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302145818.1161461-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3qiEK0X/JISU

On 3/2/21 6:57 AM, Philippe Mathieu-Daudé wrote:
> +static struct SysemuCPUOps alpha_sysemu_ops = {

const, for all of them.


r~
