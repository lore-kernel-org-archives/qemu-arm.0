Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5438820lfg;
        Wed, 3 Mar 2021 07:17:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7r46DGjBAs4TCM/zzhXQ4rAFUtoBBB4BA2qs9n1YlTeob/g/V6tzIZ7ae+JcT2Z6GuybN
X-Received: by 2002:a5d:5043:: with SMTP id h3mr27319426wrt.120.1614784665456;
        Wed, 03 Mar 2021 07:17:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614784665; cv=none;
        d=google.com; s=arc-20160816;
        b=J9Q71J/WxhAciDZddz9vHuui5etfX06WB1IrTihZ/QAN0mqM1pHwSVAvdrjwbX/xQt
         cdRdyDnjNWzFRVqvIQShfJdgLFlOD84mLEqTcU9ABQcNGQRMmyEcRbsOco4fNXwUQIzZ
         674OnOafeTBbPSfn+/VQziV9OWVAFDrQgUpQ59kiZU7MakFBnoK6glqIvga0a7ROqDG0
         rFloDtW3PzKpJ8t+nr8N6YW2J95oV7llJxdFPmBq1jdJABv8YsWK1dAhorVvxMZ2qiyC
         EsG6bj9piRD9c9QxYhY06Wp3EEI/QctrU7kExa+piZ2BFSiwUoCEjZOjLc1IDO5QS/T6
         5b5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=funrySmDKvEvm36Y0lgsdEZ89XQMOTTdJq+LA8sAZyk=;
        b=inLq4EDmlpHWJJuxOHVlsGEn54oO3TOZ2oVvwb14quYw9Qe5ly7cHCGQyjPbREUEY9
         VH1gsrZP17N6D7WooAmcE9BuOATWpepV+yTptjMcUFommJ+hExP9pxYDaxZwbKXA3sMo
         SUw8/F22I5JiYmL7K/jFJCjU9DXQnbAVUhg8Nwj0TgvF669CCW841EAXkiFaszuowND3
         QBg8614Qq/9q0hBclXrqIh/cxj48ksBfwptM6awRXDUcVjkNPJj7fn0Uq0h/bhbsv2mB
         SFRW6BABtAd6bT8/nBAg+ejGK2J8gBfEdtonJ8AbEDonHIQ5OYnyQeRjIqREtgIbxP8Q
         P8tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.131])
        by mx.google.com with ESMTPS id s18si18826701wrt.175.2021.03.03.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 07:17:45 -0800 (PST)
Received-SPF: neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.131;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7QM9-1lrP7u2sg9-017mYC; Wed, 03 Mar 2021 16:17:31 +0100
Subject: Re: [PATCH v3 17/27] linux-user: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-18-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0872e9eb-3fe1-8f93-d863-c5f39129b03e@vivier.eu>
Date: Wed, 3 Mar 2021 16:17:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302145818.1161461-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2JXp+7ZoES5GqgV5w23yqcdKYFTwl4HOJCG7+RWaa2UvqiZtXob
 5rrmjdhCzcLXd2SVSxizLUI0RS3eKTaJ2P05JEl54+oLCgdMfspNGaD9m3PFQSbMyU8MzKv
 JmxCz6d5KvA1Jym5MA6TsQkwIMhMgntEJgFHklsLszBExX6yWYjOjVU01PWUe+XVgjUqoIY
 LWjTYX9wlaqhklCgsChqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iLRh7jT9iQM=:Emy5oafqFNjrK4s5qDN/qw
 sTTSzMwBeTDgE2DACpIdVYpiyDNTwBDPBeJI6Xufjunb10nrMrTbMz1peEfd3hMqpaV9oCsXV
 R3GP/pejjpjobaXsKR7EAPOuTh/6YC1/UkppcCZMQUB38fyhtWZEVPq22BdVe1pCUPszGIP4A
 4sxp2MpO/YgCBALDo2+rhZIarlp7/r/bBEPM2ZdC37XVGqm6l6F50omL5WqzJUtqirSymvPbl
 DJfY22ECIuALwXCbRl4zd8uXCxoUe8hGUt0eLRQqaF5tv1d/a0mNtDy/ijjUp7z3Z4C/80WST
 p2NyQO43NQEU8c60gnGjUETHmSkzE3AP9ab4n700APSKyORsfHPGg8HD4V0taEfh2QTyuk/ez
 QpiWqNvVDrTlPhv6RbqdewunI0OaEc8ivOPJ7DVuMrFcn52LalKC+BrrulCJqKH1G/Bs4li+R
 PUFEDgt0nA==
X-TUID: yQe7NLDJ4ZON

Le 02/03/2021 à 15:58, Philippe Mathieu-Daudé a écrit :
> We can not use watchpoints in user-mode emulation because we
> need the softmmu slow path to detect accesses to watchpointed
> memory. This code is expanded as empty stub in "hw/core/cpu.h"
> anyway, so we can drop it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/main.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 81f48ff54ed..d7af3ffbc22 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -200,7 +200,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
>      CPUState *new_cpu = cpu_create(cpu_type);
>      CPUArchState *new_env = new_cpu->env_ptr;
>      CPUBreakpoint *bp;
> -    CPUWatchpoint *wp;
>  
>      /* Reset non arch specific state */
>      cpu_reset(new_cpu);
> @@ -211,13 +210,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
>         Note: Once we support ptrace with hw-debug register access, make sure
>         BP_CPU break/watchpoints are handled correctly on clone. */
>      QTAILQ_INIT(&new_cpu->breakpoints);
> -    QTAILQ_INIT(&new_cpu->watchpoints);
>      QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>          cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
>      }
> -    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> -        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
> -    }
>  
>      return new_env;
>  }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
