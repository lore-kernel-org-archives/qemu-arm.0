Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3730040njc;
        Sun, 25 May 2025 08:25:52 -0700 (PDT)
X-Received: by 2002:a05:6000:26c9:b0:3a3:75fa:a0d5 with SMTP id ffacd0b85a97d-3a4cb49b20emr4780566f8f.38.1748186752706;
        Sun, 25 May 2025 08:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748186752; cv=none;
        d=google.com; s=arc-20240605;
        b=JNrLqO5OX1CqJw8yeLHeyk0CyNss0VEs6arUccGqyqoNxUWjAYiSO3qc8Mj1L4sLGU
         EztBTBDs7PTTHSj3cGIXcK4TIcLF2bapd8OQqo3Vlx8fiI9XqSxlHyYlnpKqgVRf3KZL
         884sSbaOHeJiT8W704FZcO+yjHYM50H553evqNruxTVo7Ro7nkejcZNJzLFxa0w0T/lt
         ulxfkDw+gslLh/i0zb2dhqPj/SzqKHwf1g/ZL1U4IOzRQ61VjSuHMC/aTtyextyqwBib
         A5WLNxrP1E6lTsPl56adE+73/cteDlmZPR9lCOGroWq9pR+ToddUBy1mpi+ykxLhzG1t
         mFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8EsB4KKwhn+6yAx76oOErDAK4JdgouXBDYZw6xCXzeg=;
        fh=N62IQikGiF2BMpey1ihzlbKZ7kCt1T5I8KVf+K2RViM=;
        b=a0r3pqIgrhsEZWBccCUebIMtGAxEHTlaFByS72Ct2AkVO3Mpb6fws/l1PyfNfnQhR1
         RJ5l4Beskjx1waVtVMIfTwEnGfyNG9vTY96TJESnzr6/J856kR6KNQkjWu93MKpm+oSy
         3GI7fhobcrGfJsvrS1iYT7tlyIo5lY3EzJMTWRPvikivbi8lW5NKAwCN5PfAF8sUHNv+
         W31xFUgReCz9gVB8ND9tBUfzumburVm3na5050x8GTlfSl2E8q3+VpwZdeIPqHGh+a/s
         FxXsNfFJf4Rn2CGiaBElgnf3WZAGsIhnVNXznka0GsZ2fmnTb1FnTC6QNtQk1igspYQp
         1j0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZnBZKdql;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a35ca1e576sor6485205f8f.0.2025.05.25.08.25.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 08:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZnBZKdql;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748186752; x=1748791552; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EsB4KKwhn+6yAx76oOErDAK4JdgouXBDYZw6xCXzeg=;
        b=ZnBZKdqll4Ot62JdENORc23RpAuCKysyF4/nQ/+2qa4wg5TSRnqxjCR8YdyyupLps3
         vKcl8W1nz3tioTcL2UoUEx4+CkiAVlC7gPykHbah65NEkwI4Ht7hXYzGEew16Xf4C94G
         vu8HmYThvExwcTIZ19godV8Ja3T0HN5egjFbqGqf6j8JfW9oG6jf0HmfJqIBfPepSTMr
         L9bph2lBKY2pRI/7dzxhzo2H59fzF3nZF+V02FQsQpoE4kh/km3pJDG8MrTheMVjRjL7
         VBfu7uGsnyuUMy2sb5UDClNQmfRqTUYWF9Kdii4xDoFTubsqKcvE3MYckjhYD9l/E0mP
         C+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748186752; x=1748791552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EsB4KKwhn+6yAx76oOErDAK4JdgouXBDYZw6xCXzeg=;
        b=Znfl9KRc39qxLktnYTMCWniRonzMLh4sjZgPIMNJobpQ7dUAW/ryZRJCdCQC7b8MEv
         tuCq3f6+tUgf7aRca54cU0xdds33xYBNGHPmY050EihJCut6reXMhROw/B66FHfyyCPq
         wNCfzxCEbpZG70ymeHVfYFOy4aLbS43VQdp0tt1gox1T86gFqZrlkFVmdpoysjfkbomM
         7MNYPeGx5fV+GZVfYC3Ngri4MWKcv/2iIq7Al0Mt2COHa3ZaykU6QhiIAm4NSBV53wVz
         2PqHWaH+Oo8lvjXRGaA5sB6/Mbmvt7/MhIQ8WMh9YLrdHv39+6PvgzSRmhAFU7tss6/D
         uuzA==
X-Gm-Message-State: AOJu0YzHDGveEkDTpGmu+7HZ7owQbWYzlIg06dAghGQ2NU6Nss86J0ND
	BzGD2ehua29nuf9b4+M5Hza2s+DGMv1IkalZssEF79dPVV5B1IdzolMh4dwO4Uoj/1xMrq4ULs6
	wq+Mn70k=
X-Gm-Gg: ASbGncs0ZuWgGmmGdxithieS+a9y3vVCCLJswida/pZTx6n3a8XN4UMCmSG332I1dz+
	Or03l8LG3Eil+twhN8yaZd2NvNCq+m+y/dwUY4XJs7yxCLnPuv8ihDJmSLwCn5qUhG/a3CsBzXc
	8bHuDvIKrgbD8ReHHp1SoYuTH0uJISs/rju57fIxkVJDOSDcZ6d3UXhQPGzPHmFy5+D3eR8qpmB
	aiSEeJwLgjj+gTVl/OpIq2v5auzDWwQNXPfAE8VPrOc/naiYHad7Nf22k3ifJenSkJy480OvNFy
	fWvmuJ2B+DJ79WMAtBUsytjMHZZ2cmaZQj1LzIrDlc9blW29R6Zjec9V3vOcllXcGpLYFqYsNe4
	JF63Et2nYdkP/7MYH43nifXUUuUw=
X-Google-Smtp-Source: AGHT+IFsOS88kQlU14Pm7ldF6CT5PMpUZVS7c5u/xFuefZKk9eMiOixR9+YAX4YqEkTGlcIuX516gg==
X-Received: by 2002:adf:f7d2:0:b0:3a4:cefe:4193 with SMTP id ffacd0b85a97d-3a4cefe4dbfmr3349399f8f.58.1748186751714;
        Sun, 25 May 2025 08:25:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.132.0.213] (17.red-95-127-33.staticip.rima-tde.net. [95.127.33.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cd0cf5c0sm4927892f8f.12.2025.05.25.08.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 08:25:51 -0700 (PDT)
Message-ID: <b916fe83-180b-48d6-815f-da556b8e42fd@linaro.org>
Date: Sun, 25 May 2025 17:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/20] gdbstub: Implement qGDBServerVersion packet
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>,
 Patryk 'patryk4815' Sondej <patryk.sondej@gmail.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-20-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250521164250.135776-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8OKDta0VLMb2

On 21/5/25 17:42, Alex Bennée wrote:
> From: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
> 
> This commit adds support for the `qGDBServerVersion` packet to the qemu
> gdbstub  which could be used by clients to detect the QEMU version
> (and, e.g., use a workaround for known bugs).
> 
> This packet is not documented/standarized by GDB but it was implemented
> by LLDB gdbstub [0] and is helpful for projects like Pwndbg [1].
> 
> This has been implemented by Patryk, who I included in Co-authored-by
> and who asked me to send the patch.
> 
> [0] https://lldb.llvm.org/resources/lldbgdbremote.html#qgdbserverversion
> [1] https://github.com/pwndbg/pwndbg/issues/2648
> 
> Co-authored-by: Patryk 'patryk4815' Sondej <patryk.sondej@gmail.com>
> Signed-off-by: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
> Message-Id: <20250403191340.53343-1-dominik.b.czarnota@gmail.com>
> [AJB: fix include, checkpatch linewrap]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 6023c80d25..def0b7e877 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -28,6 +28,7 @@
>   #include "qemu/cutils.h"
>   #include "qemu/module.h"
>   #include "qemu/error-report.h"
> +#include "qemu/target-info.h"
>   #include "trace.h"
>   #include "exec/gdbstub.h"
>   #include "gdbstub/commands.h"
> @@ -1597,6 +1598,18 @@ static void handle_query_threads(GArray *params, void *user_ctx)
>       gdbserver_state.query_cpu = gdb_next_attached_cpu(gdbserver_state.query_cpu);
>   }
>   
> +static void handle_query_gdb_server_version(GArray *params, void *user_ctx)
> +{
> +#if defined(CONFIG_USER_ONLY)
> +    g_string_printf(gdbserver_state.str_buf, "name:qemu-%s;version:%s;",
> +                    target_name(), QEMU_VERSION);
> +#else
> +    g_string_printf(gdbserver_state.str_buf, "name:qemu-system-%s;version:%s;",
> +                    target_name(), QEMU_VERSION);
> +#endif

g_string_printf() isn't really justified, we usually call
g_string_append().

> +    gdb_put_strbuf();
> +}
