Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2782425njb;
        Mon, 3 Mar 2025 09:52:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzZzXLMpivFkkL11GhFZmDzfymss0OJADWzk6zrn77wlDPfuWu0rO9ku9t4PSoVqpnko8/0SlEQmcJcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH1VbDVx9hbFLR++7mrgqa6yu9D6yeJCcqM2jdMI+EAvishp0RG/eqYhHhcgyfaskFT2rza
X-Received: by 2002:ac8:5956:0:b0:472:6ce:5d14 with SMTP id d75a77b69052e-474fbc99eb3mr2427531cf.14.1741024341594;
        Mon, 03 Mar 2025 09:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741024341; cv=none;
        d=google.com; s=arc-20240605;
        b=SbpHvYaWebBS8lDl0gv8NST4W1lHDLfnJVRym3dorOtOaK3Yn6vuA7j8nBLNqwWZgB
         zgwiFnOiNSTpLkDnF/mrarODqsYp1NVeP5qjhU0AWPGasB2uveif4zO7puSLwYF1kpLD
         cOIoSBXPMabe+xQdIX6U91tKLob6PtSKGgqFEm39uiXFx55KUoRSgX4Dmyzl3tVCiwOF
         fQ2iLO8fNKlbyQhkJ3jCUfR+xhXQ4ymxH/RhHgdlLAqnKbupCe1clGzyQ4ICbO4FMOAq
         8Engrs11bqFTRRsv+e9ggN7Vv7jh5j7/5s8DZzso+B4sHei5Y5HhZhj507bdqMClC+Ej
         dRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KicCcYq2UjveTCard+1fZS3y1dRe4jB0t9s67fyte/A=;
        fh=lMnQRVfb53mL5b1r0BHWFlxuO3fNjWndj+U4Co2r/kw=;
        b=kT6EnCa2lsFiGV9IdEpl9+SHPmxa/nEhnBxVqSNXQPQurG6ogeKREnBhdvdfV5UdpY
         byID99ecIQiY70JkkUgsdP3yyL+vlo6To1wd/XLJQeoMYaHcKS+930KOF8lCYTxRpsst
         Cghr/q2vQr2HIJ6MswfatKS2c5pAfthe8NYUB+Gp5YVXEZxVOe/HSYyyex2lR/cxf95u
         srlqh62K6FB5IB9lFIqpujs21o3cCg6cu7pXYXGjFx/z8OQQ5FqBnk1h2GXIXPRvQQDT
         JLn0swf+b6V3bkLjsIi8CyLOvBoJIZUDeptUfejvotfTVG6VHwd+YOTs6DczN0svHRDZ
         IBog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciPZivcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474f60eb6desi9978081cf.490.2025.03.03.09.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 09:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ciPZivcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp9xd-0001Qg-O3; Mon, 03 Mar 2025 12:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp9xZ-0001Po-0l
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 12:52:10 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp9xW-00007X-1d
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 12:52:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-390ec7c2d40so3082736f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741024323; x=1741629123; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KicCcYq2UjveTCard+1fZS3y1dRe4jB0t9s67fyte/A=;
 b=ciPZivczLbHN4nYeJyPHgb33oNZtBkwKFJ4hW3GqMlHQXAEN9PzV48W7lNhw4UmQYJ
 KaNtbhZ+rEwAGsOVheDjpt+U477I8FYbBR5wBkY8ebxxnQ26TPxL6476qDjVTm32OVj6
 9/GoCT6K2R/1slwcCmj/9Sj+I4kQWvcscvU9qLEbVZPmny/MtEDNL7pCFdTSrGT9vTDt
 nprp11FX72H/qy5ubk59biMPUdRPG5/tdRLN2HjCtIUGaPUOc4y6418ERCa+DSZpM6ss
 uBQD5EpY2EwRdFaAHUA+UmOC3tGEoUVi+HbwLlkqJeY48+nG/tHQ3y+4L9kG6HWk89vR
 p4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741024323; x=1741629123;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KicCcYq2UjveTCard+1fZS3y1dRe4jB0t9s67fyte/A=;
 b=OCM1GzHX2uYZVcgepVtQML9Mo9+q/f7z7TM52x0UHM/w6Vctawmjx9pZ0MlgZe6G9i
 hvN+MSPrZO+Xe1rvfgSry4rlH0HgR68ZcYkMrZ9XZq0E8L+oFbWJVwR9YGXgrLjJUapa
 RvdsGBAalKwPr2atWXRda1vfPoWKVExYY5c2uARsfSjvXJGyfNX+lyOxBTX71ZyYF89k
 U8V/vgHhvmwzlZXUMo9QZAeNhHSdFqqtW50ndmXBd15t4EMxAdWo4IGCvYuCa+Joxw2r
 wmXrYsip9wFAlRjay9+wvGq/kOo/WnOwmCUWroxLKDT6fObfUwNauA42tANOVAiNsAql
 wy3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Z3Z8HpWjx6jQYKSmpJiw/mZsXUt6I+VefNbLpNoasb90UEXpxHK1bfSUq6qMh9DSwozckv8zAQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz5gRGzDtf7FE696I+PU/wWDVRwB8ubF3liVILilmiqvy7XT4Rs
 nXnj3qWlD9qvLXzdd7n9pxGv7Vw3FWm2TJY+dyLJ2P3Cc9fNu55ppoYabXRNnzc=
X-Gm-Gg: ASbGncsl5u4TeqTwTxFpvd8xmvscIo874MPTdkS32SxqJnVYiobCM3+ZSAV1JWuY7mG
 Rx6Q78ZlhgIuIduMHtaq5I0neM0IynX+UGHcUmTXIZBR3DVm6jdeCGXYVfOhahtpcJDWmlNmivx
 EwlWIroi8pHl9tlK0nM+wSCUr5Q5cdgPMszHcAx5cKojKvFl6VS3mZ6vOhPFAq94ICE+2spj3vF
 kDrLNfK1PwFj5/QQWe5AxFlb83PtipSeIk7Exs/fBPFD9xh6LdM5Xzy3u7LG4S1ji2HOp+OReBj
 fKDGyT9NlQ6Ka1NnPJ66BbeMld1fZ2oBMS7PRkbqacoGFPFSHR2HYVK2ieMNJqELrznCkaONyuv
 69XMXgYipo758
X-Received: by 2002:a05:6000:401f:b0:38d:d664:67d8 with SMTP id
 ffacd0b85a97d-390ec7c6738mr13564263f8f.11.1741024323384; 
 Mon, 03 Mar 2025 09:52:03 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b73703f83sm169668265e9.13.2025.03.03.09.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 09:52:02 -0800 (PST)
Message-ID: <d97172e5-b8ae-4852-ae2b-b430cca53288@linaro.org>
Date: Mon, 3 Mar 2025 18:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 03/11] hw: Add vmapple subdir
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Alexander Graf
 <graf@amazon.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250112210056.16658-1-phil@philjordan.eu>
 <20250112210056.16658-4-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250112210056.16658-4-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zS0ib1/MlZD6

On 12/1/25 22:00, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> We will introduce a number of devices that are specific to the vmapple
> target machine. To keep them all tidily together, let's put them into
> a single target directory.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS             | 7 +++++++
>   hw/Kconfig              | 1 +
>   hw/meson.build          | 1 +
>   hw/vmapple/Kconfig      | 1 +
>   hw/vmapple/meson.build  | 0
>   hw/vmapple/trace-events | 2 ++
>   hw/vmapple/trace.h      | 1 +
>   meson.build             | 1 +
>   8 files changed, 14 insertions(+)
>   create mode 100644 hw/vmapple/Kconfig
>   create mode 100644 hw/vmapple/meson.build
>   create mode 100644 hw/vmapple/trace-events
>   create mode 100644 hw/vmapple/trace.h


> diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
> new file mode 100644
> index 0000000000..8b13789179
> --- /dev/null
> +++ b/hw/vmapple/Kconfig
> @@ -0,0 +1 @@
> +
> diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
> new file mode 100644
> index 0000000000..9ccc579048
> --- /dev/null
> +++ b/hw/vmapple/trace-events
> @@ -0,0 +1,2 @@
> +# See docs/devel/tracing.rst for syntax documentation.
> +
> diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
> new file mode 100644
> index 0000000000..572adbefe0
> --- /dev/null
> +++ b/hw/vmapple/trace.h
> @@ -0,0 +1 @@
> +#include "trace/trace-hw_vmapple.h"
> diff --git a/meson.build b/meson.build
> index d06f59095c..812ef33550 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3588,6 +3588,7 @@ if have_system
>       'hw/usb',
>       'hw/vfio',
>       'hw/virtio',
> +    'hw/vmapple',
>       'hw/watchdog',
>       'hw/xen',
>       'hw/gpio',

Alex, Phil, we now mandate a SPDX tag. Due to the license used in
vmapple.c in this patch, are you OK with me squashing here:

-- >8 --
diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
index 572adbefe04..d099d5ecd9e 100644
--- a/hw/vmapple/trace.h
+++ b/hw/vmapple/trace.h
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
index 8b137891791..315c06b689c 100644
--- a/hw/vmapple/Kconfig
+++ b/hw/vmapple/Kconfig
@@ -1 +1 @@
-
+# SPDX-License-Identifier: GPL-2.0-or-later
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
index e69de29bb2d..315c06b689c 100644
--- a/hw/vmapple/meson.build
+++ b/hw/vmapple/meson.build
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
index 9ccc5790487..21125794121 100644
--- a/hw/vmapple/trace-events
+++ b/hw/vmapple/trace-events
@@ -2 +2 @@
-
+# SPDX-License-Identifier: GPL-2.0-or-later
---

?

