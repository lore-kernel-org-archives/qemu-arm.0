Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1340308dlb;
        Thu, 9 Jan 2025 03:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVt2XnrUMOYP7LtswDFyHeIpyfT5UtL6qacvaQPBYdolUF+q+vIGKU2jAWR/1EWDSOA2KPDca9q/HgewQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEXq3Uu9ASMg85mX5fvg2XJd6Bt6v3mdYiarXbeamWv5O483TIIwqL+bOuOJ9yG2E0ZfiVz
X-Received: by 2002:ac8:5fcd:0:b0:45d:9357:1cca with SMTP id d75a77b69052e-46c7108ece2mr98359511cf.14.1736422966348;
        Thu, 09 Jan 2025 03:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736422966; cv=none;
        d=google.com; s=arc-20240605;
        b=lpFLdLzYbedsLDpDCW9xeuCZSBZRgoq4Vt6XKoyDnwthufkhOAsxlSl6Mh3NKOjgew
         ll6737c5EemVStLh7fuh/4aKoWiVGRMmBzHhGnTQKIGPFLRmNOkwQuIjfakB51GZ07i+
         OhpwE2XilNfsADi1dMG5ZdXOCQLyaDEBsgN+qMN9Sqsr2OQ3Ci7s2WF68//60qmzuA2o
         7M2Z2Vv752Bb0+wdJ07RBzJmgkvkG8rl2+eQTBf3JLH0O9cTYQVMI5WsL5QFKNwOXwNX
         yi0Ab/NT9GfoER8wv6/XlOZ3eOIcwozhWO61wWhKcaGVNufh3fb9KRt3Y7qays2ykWgp
         GLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wXf7IS/afLeHFGkC0UTrCG3iLIpudW2/Rye2ONP/Go4=;
        fh=PhZdc6kXS8r4XtDbEzHAQFgMxiKU5ckPf/82db3Lbw0=;
        b=ibuTx6FOkCp6YWYOGV432Oo60T9YZgyabHQZ+jiKSattGM7su/PTzmZH9Q2atdEtBM
         Fh6+F/zy0wnw2RpAtpjKxzod4WocBIpE/z3lHrKMRjM6trr5Nl8rNp20dEtD8zJy7Azg
         Baw4OQ6ml8aKbYqd7nmycZGAMU4nA0VNe0+GvglYA56d33vfF2OJlKc6sxs54kGLuKlv
         WCU0HpyBCxDD8Qg9i7ERo3chLmWZ+8bS/EN1P5fFBqdXOgwOcIL19tZsNudEapgjR+G6
         XVLTnYG52qBs7qnHtah7V9YUW++2ElNPTCySpNf2RLIFKoGRS3HQts5yiAI7UApYnjnr
         p0ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bI+msno/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3e680efbsi389873421cf.63.2025.01.09.03.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 03:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bI+msno/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tVqvl-0004kZ-2L; Thu, 09 Jan 2025 06:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVqvb-0004jx-Ev
 for qemu-devel@nongnu.org; Thu, 09 Jan 2025 06:42:21 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVqvY-0000Pt-6u
 for qemu-devel@nongnu.org; Thu, 09 Jan 2025 06:42:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso9095455e9.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2025 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736422934; x=1737027734; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wXf7IS/afLeHFGkC0UTrCG3iLIpudW2/Rye2ONP/Go4=;
 b=bI+msno/NlqPVBZ+1I6hY/ZKdCCR5UAtwOzl4+HJT8DK98Hz4Bc6vwFEzQSTNIB4dk
 J/omMZwCBvq64YBQfCtCDRlUfUemyDpFkY0ThFg5CCfFzGW3YmUaEaalCSfik7KL+OH6
 Bm3EkFCEmbetwt7kAZIGRwFHZ/LCrYWX0/72fjACyIaH1RQrn/jjRWhh3SsnS7t6WvcA
 EOovbsglpyZS3Cy80wKA6T4IBBINfSlPAZJUL5JmzAqsnZJh8t5H+Wc54QZ1pxhGxXUU
 zEIn89ChqCT+Z4a/AwRKlHX7uwEkocsSNhNg2CyZiXsmzs188y/NPcfOl51gdLngDveK
 MwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736422934; x=1737027734;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wXf7IS/afLeHFGkC0UTrCG3iLIpudW2/Rye2ONP/Go4=;
 b=D/DniJakwNxicEJ1TJhbocvBw9wq5J8n3nazEG25eYAmdb5fzcsdMHanIVYeMsEZLp
 8PVJR/MKgtTgJW72hSJ8//evSKitPynTndSUNlT2Z04YJcm4EQFhu79gvfDpjblwb5hL
 f1I79fOqqMRMhAFcR7i2KAW0h8pbw2vSbYV4XAs2YqMtmnAq46iR2gHTDBBzzNuBQOdL
 ZFonVfjChysTRP8CBfFL5eum+jsvssrX9k3bM6mjgla9/a4XHw+psudoApoueYTrfoE6
 hVCE6auG4x4dOinaprprjl86fxLqCGNvtyJ2lCgyP6bz9ebYtbmOmrYo6R0i0CL4NeO6
 ycIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsCsPdHHHjsGz+cxCqaA2Wra7JWqoEMomtjGgrqAhvtKYMwxYgkDZlr4ZpbEdYC6LhpqVOrwvv4CLJ@nongnu.org
X-Gm-Message-State: AOJu0Yz/W97xurep7I5+FLwAkzqKECNjLSwMOnxS1vC0TKXUebAODi8Y
 t2GFKgrbyMkK9D5XtGGkQOWldWQ+W7LFlmQrAtw1DqU0VsQ1+fgXpEA8CqAwMT8=
X-Gm-Gg: ASbGncvKODtNCs8U7w9o3D3UTZ+6Udrd0HtzyEzs2T0M5EYmrYKY9OtQYuc6d4jOy9e
 yb0xmFfkovtVmZhsN/ntmMogrNWg1AjpufPKNC93FTkRBrU3Lwgv7g3Gak2SJ1UJUqf/18OLzux
 Fm0ijoPQQsbOA8g6qKPHSL6EFr4yLLr7WALTsCw36fwDc11DEzKkg3T0K5L6DZSQk5ys2BgECZW
 j/fOIpvoAb1ImE4BY3TVawZFVhVcT8/W9xLdgIFkq8GdVDVZtwWF14gv0a50MVBxN1dKmt9Vyaq
 gr+M8IQqUWihXC26vBU6FltA
X-Received: by 2002:a05:600c:3ca4:b0:434:a10f:9b with SMTP id
 5b1f17b1804b1-436e26ab2a2mr61886355e9.14.1736422934573; 
 Thu, 09 Jan 2025 03:42:14 -0800 (PST)
Received: from [192.168.69.102] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8116sm1586982f8f.79.2025.01.09.03.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:42:14 -0800 (PST)
Message-ID: <136927b1-76f4-40ca-8ecd-a2c5d8576160@linaro.org>
Date: Thu, 9 Jan 2025 12:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] hw/char/imx_serial: Turn some DPRINTF() statements
 into trace events
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-10-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250108092538.11474-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SEVv0tArMSlF

On 8/1/25 10:25, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/char/imx_serial.c | 58 +++++++++++++++++++++++++++++---------------
>   hw/char/trace-events |  5 ++++
>   2 files changed, 44 insertions(+), 19 deletions(-)


> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 59e1f734a7..4c6d401b4b 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -52,6 +52,11 @@ escc_sunkbd_event_out(int ch) "Translated keycode 0x%2.2x"
>   escc_kbd_command(int val) "Command %d"
>   escc_sunmouse_event(int dx, int dy, int buttons_state) "dx=%d dy=%d buttons=0x%01x"
>   
> +# imx_serial.c
> +imx_serial_read(const char *chrname, uint64_t addr, uint64_t value) "%s:[0x%03" PRIu64 "] -> 0x%08" PRIu64
> +imx_serial_write(const char *chrname, uint64_t addr, uint64_t value) "%s:[0x%03" PRIu64 "] <- 0x%08" PRIu64
> +imx_serial_put_data(const char *chrname, uint32_t value) "%s: 0x%" PRIu32

0x%08" PRIx64 and 0x%" PRIx32.

With that changed:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

