Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1655733njc;
        Wed, 21 May 2025 23:29:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:854:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-742a98ac52emr30333856b3a.15.1747895353172;
        Wed, 21 May 2025 23:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747895353; cv=none;
        d=google.com; s=arc-20240605;
        b=Zj1/aAhqezzoVh2L2sf+YEdbaXuU4TkQ+uaO1KiC+1j8SgqIVJk8n812x/m0MFQ1dm
         pa/NB1fspDFZUxDzMgKwPyzplSp+2b7jse7NFjZSlnQIsx+93X1hdeabazwwf35LmmYg
         n0v3pIs6ZksktbNquj9TeIEmK1h8EC852xrDXbfBOkd6qh446o05SDMVSiI5TLV3Roj0
         qVqNO6iRMaBQN5MMqYr3N6rjFvZQVkpfS8MbmvrAEz2nnnfaPEeN45gu6qttFe1PLHka
         w5hATS8t+f3a4Ew3KEBWRzum8QpSXrh7gdY3WsvKYDQVYu0cAyBx3yDilrFNrrVLcF5N
         8wYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=X7wJaoojbNMJ4yW0rFuO9RrN4Wd9IZN5FjfpVj1pWuw=;
        fh=ZcLhvplTtSkz3Hi+EIlTJWPkxDl1ZbFPIHUbazlapxk=;
        b=i3+eP1g8wqPPYEtivXRffxVKK+NiV7zicBYB6WhfD+yuQP9UpffU8UX+m8qnAMQ/pO
         tcd0211T+Ydx5Zcn5Z1Ojeyv8FRwk9FZjyy7LSpRvzaTa1hFFR0mUAwyYhK2yqO81ICC
         KGBOJrHtOQ+ayt4QeOzpw+BpjlJLypnJLW48fE0oTIqIfubitPSo1yjk8zfbHXcoF404
         yiadKaBknOP56aMCOAsHqN6Q2C4cbI70njBunuVc1kmGb61HTSQkjsA4+HQwvLfeI8o+
         dN4bwZHMdoui679un8jTo9bOltA3hn6zWgtAdUlQmi/c1mfH1pwq7lX8y1RBADFUtc5h
         tiSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Ux4blz7W;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742a982d7cdsor10440738b3a.6.2025.05.21.23.29.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 23:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Ux4blz7W;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747895352; x=1748500152; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7wJaoojbNMJ4yW0rFuO9RrN4Wd9IZN5FjfpVj1pWuw=;
        b=Ux4blz7WfJ0FI1RFGhic5y+JHXiAzj7+eBENcvwH2KL9Yy3zhXLG/MCq8Dfz36xJBJ
         NBTyVD3Qiru8L8bRG+mWpkjuxuJe22odrn2nknEsWd8fv754RogUTNmU3EVhNkq8ls9u
         ApZ1BNvdTKj5IYDp4PLLIuXYfcXSzXpuaCqH3kxrajeqiOyn3INbS18qfZIbq9pu9R2J
         pNcN82CbouOIfweSCpfAHoPjiDTCyXNJSoJ2IuyjjQwtUwIUE18WU98zO5J0JLtrzJj+
         +7W7leMAFBYACYZWGOnCXNUt9Rdu1Bq9ROaHxirhjdfPF7q3WQK6T5Kkyefc3GQ7tPQM
         Xpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747895352; x=1748500152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7wJaoojbNMJ4yW0rFuO9RrN4Wd9IZN5FjfpVj1pWuw=;
        b=P9E3iAzRVu7TsVoN/dNtkeR4tdZFU/Doa98V8UBE4fCJKPHGj8i6xzx8wqubuCr269
         cVFLNuIoDf31YURrO3fUebgKq8nS8//mNaHlqImogqWbAR5ChzN8u3oOOoHoBw5t818W
         JzGYDhalresmDRh+gjaj9bO9IWYtKRsIMVu5BaFJKqWelaNFFz5LuCRCacEKU92duAME
         IU8UTVRSqrhGsOgf/3Def7c1C3AcNch9fe5bfCv1M/LTFql0tgYE0jK7DGHrb+i7ca1C
         Qy5xpDNNWEPj4cUwOqe3iQd5++uSLt2ABha5l3Gws6y8bPV3Qa+q8oZHqYdDNCG9jh/C
         17DQ==
X-Gm-Message-State: AOJu0YwPJ06IPewECAPhwlu26n+193yl13swXC6ZyIfddzsoD9dNUiXx
	4lIsoIp5nwEe8jrCo71mKoAdztXaBSKSE/gI1+GuvwhBXSC7p00HtlMr/BJ3dNZPyEgcQN0VNU6
	j8wJ4
X-Gm-Gg: ASbGnctyBJKH20IPXxCJPTzDmaQDBbKO6PVaeQ5TSqH83pL4RN1S1WfeCwiwUYTmqDi
	v3e3DG5UIL8EoqSgnGWe2vPUYBDQTvkhXZ30v0fN9F5LneybWWrkgtxzd2vmKnojGbSSseGp35K
	bBvQ7cv8DGpXz1FTJ6eHwMkNdBL9NhD0S/5J8jgBWhOcBl92QhX9jkpHGqJLdeOm3Q0hpj1oL0j
	0WoymK8YVNA/3Jd2AgxoUgYY3bE8+9cRi8Caozq3bZZcLJKXuk6ZXSLMG2hs0He5/5ShIlnboF0
	eYsRw8tarCEkScC+Nacw5iLv4APHWDNAUveLmn0BTLxqKiwC1PZvg+OuKlAQJA==
X-Google-Smtp-Source: AGHT+IE1HJ96JVinrS9Y5I3LAC6A8WMBYeeLwC5abBhLV9ZVlcJcqNt+jIGZmR3nLyMsxzttAVOfFw==
X-Received: by 2002:a05:6a00:ab87:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-742a98d427dmr30701216b3a.20.1747895352477;
        Wed, 21 May 2025 23:29:12 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b9basm10545596b3a.49.2025.05.21.23.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 23:29:12 -0700 (PDT)
Message-ID: <0e6cb7af-37eb-4e8d-b342-ecfcdb639f10@daynix.com>
Date: Thu, 22 May 2025 15:29:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/20] gdbstub: Implement qGDBServerVersion packet
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>,
 Patryk 'patryk4815' Sondej <patryk.sondej@gmail.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-20-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9SsyCdBrBJvy

On 2025/05/22 1:42, Alex Bennée wrote:
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

I sugguest passing "qemu" as the name property.

I guess LLDB developers chose to explicitly have the key-value pair 
syntax so that users can have one unified logic for parsing and avoid 
the mess of HTTP's User-Agent; there is a proposal for Web that 
introduces key-value pairs in a similar manner:
https://developer.chrome.com/docs/privacy-security/user-agent-client-hints

If we embed more information like to the name property, users will need 
to have an additional logic to know if it's QEMU or to know other 
information. Instead, we can emit:
name:qemu;version:10.0.50;

and we can use something like follows if we want to tell more:
name:qemu;version:10.0.50;qemu-mode:system;qemu-target:hexagon;
