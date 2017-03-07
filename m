Received: by 10.25.0.147 with SMTP id 141csp1944509lfa;
        Tue, 7 Mar 2017 09:53:33 -0800 (PST)
X-Received: by 10.237.40.2 with SMTP id r2mr2173762qtd.74.1488909213500;
        Tue, 07 Mar 2017 09:53:33 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id l45si646868qtf.37.2017.03.07.09.53.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Mar 2017 09:53:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id o135so3003850qke.2;
        Tue, 07 Mar 2017 09:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=2l3sPQuUqfugFl/raul3w/jMdGoB3Py3pq5b1PDORZg=;
        b=XxF6nF1C2ijoiix9MxBjR/7jQ2eptrpdNVujfl6OGq4vNRlT3S4KAaOTb4haLmvLAJ
         9ddoitZn59WzrWbBgmeI0YYunn+vYjKtYbXy9nwxl428Vzx7/5BmGsWmtmc2toPZw9Aj
         DGDPUm3jX60pAu7FjsX0wNcbdEIF4F1jDcY9l/Y91QZhmBBfuJLD4ofh2j7/GPkdcLD4
         twnvp44hY/OEIuP1gFPdxN7h1gVKQhBrD0zImcxHf0ugQGjPgU4oCFjvoIAmZGSS2CV6
         Blv2oSJw1Nw9bANibp8ovRg1injavc1cUc/yEK5xs0sVLI3XQqb3oIxVO8E5ACPo3Nv0
         Yjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=2l3sPQuUqfugFl/raul3w/jMdGoB3Py3pq5b1PDORZg=;
        b=FoDJ9hPyZHFPGGNpgJ1KczLv0IJK/8kUgUJ9uqT6HqQkxQ8iEfGVtfgozirqZLq/WG
         Qt6xOlzInhGeWnhy/lrCoVAojm654hkmma/auLz7etekbzanw/bGIpM1aWmRbvGbbMeP
         nq0KSH3HiaIFErN4nyQYvAaB2JpkfxrMYjtUJKJrCJzOsYboxCKQ3yVaIFxH+0ItHFW7
         9G711Si5moz0jaE7kKipBSQ0QYhpZzpa96V82xjG8of7qtiJGn6tDBshNPQEXAO1cZg8
         aKo/FPfzHOu4ZJSqZo+o0cZu1eFr+YUJuYj3TKwqQiCxOQU5OQiu/6cJZhF2csSTcRS8
         uO6w==
X-Gm-Message-State: AMke39lccmEiCKZExQ6bg2w9VnOxRe62U3Vo7V6ycYf0cwf5IXf7bsc33ke5SWe2F1YvOg==
X-Received: by 10.237.42.109 with SMTP id k42mr2115876qtf.52.1488909213000;
        Tue, 07 Mar 2017 09:53:33 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id s22sm462621qts.10.2017.03.07.09.53.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Mar 2017 09:53:32 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v3 11/11] hw/intc/arm_gic: modernise the
 DPRINTF
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, rth@twiddle.net, pbonzini@redhat.com
References: <20170307155054.5833-1-alex.bennee@linaro.org>
 <20170307155054.5833-12-alex.bennee@linaro.org>
Cc: mttcg@listserver.greensocs.com, nikunj@linux.vnet.ibm.com,
 a.rigo@virtualopensystems.com, qemu-devel@nongnu.org, cota@braap.org,
 "open list:ARM cores" <qemu-arm@nongnu.org>, bobby.prani@gmail.com,
 fred.konrad@greensocs.com
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f46089b3-d794-5d86-b623-92f131693b5e@amsat.org>
Date: Tue, 7 Mar 2017 14:53:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170307155054.5833-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /16jZS3NWxuW

On 03/07/2017 12:50 PM, Alex Bennée wrote:
> While I was debugging the icount issues I realised a bunch of the
> messages look quite similar. I've fixed this by including __func__ in
> the debug print. At the same time I move the a modern if (GATE) style
> printf which ensures the compiler can check for format string errors
> even if the code gets optimised away in the non-DEBUG_GIC case.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/arm_gic.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 8e5a9d8a3e..b305d9032a 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -26,15 +26,20 @@
>  #include "qemu/log.h"
>  #include "trace.h"
>
> -//#define DEBUG_GIC
> +/* #define DEBUG_GIC */
>
>  #ifdef DEBUG_GIC
> -#define DPRINTF(fmt, ...) \
> -do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS__); } while (0)
> +#define DEBUG_GIC_GATE 1
>  #else
> -#define DPRINTF(fmt, ...) do {} while(0)
> +#define DEBUG_GIC_GATE 0
>  #endif
>
> +#define DPRINTF(fmt, ...) do {                                          \
> +        if (DEBUG_GIC_GATE) {                                           \
> +            fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__);      \
> +        }                                                               \
> +    } while (0)
> +
>  static const uint8_t gic_id_11mpcore[] = {
>      0x00, 0x00, 0x00, 0x00, 0x90, 0x13, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
>  };
>
