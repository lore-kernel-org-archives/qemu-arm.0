Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp175218ejv;
        Thu, 11 Apr 2024 13:47:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWum1n6E9agAldGYUOuU+A7WLdaoQIUq5eybJTYwygeP/QPHOKgPl9hEHU9UbwmJAbTwB6xgojsUlzh8oGrPjysmrf6yMN4
X-Google-Smtp-Source: AGHT+IENz02CrPbJJI85TSuBxQRWx2P3Tg1AEp1OMrogZMCLMdcJMSo5c5yOI8T2p3rsZg6bVk6E
X-Received: by 2002:a05:620a:2909:b0:78e:c9b1:5623 with SMTP id m9-20020a05620a290900b0078ec9b15623mr1233024qkp.8.1712868450343;
        Thu, 11 Apr 2024 13:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712868450; cv=none;
        d=google.com; s=arc-20160816;
        b=H2r9blEXCU6BTzU/75gu9nBuCkUo0nj+fKkTNigaYkwVTAV9Mm3/xnlkJKTlMLz5ML
         OCZ9mNitD2ZOJdDNQ+jSYgLe/3i9mn+nLY5lLJV54sf9s5L5qBXfL9jb/A2OlA5kUtoU
         Yw4iGu6oZSCXjM9DgafLfD8U8Ox4+FB1sYehWI8ylku+gssHRUPDzRLDQynzlB0VNx0M
         J+l0OhpABWhLZuQpzmVJAlGaZYecvnDP+j3RBUJVwLdrdLMBFtEfQNEl0m9by7pQlnEo
         RaE3JRsG5vdw+x0OoUu4DpImPet1wn85UNKDwmRVbkd8ir55PSuQEzDOvC2vHlOyxdu7
         35pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+M45onNHGQcvvgN8G4lgCvuExfwR1VsOeMySRdzxe4U=;
        fh=5ybTy8Q7o0uFtZQuZuxp15zTMu6EnVcUndrPtaBa2P8=;
        b=DPz7EV69yOfgtW/nZY2gwS2DyHQTjqAp2JNHuNHYKvoU48splbxgWQYns2HCzLCYlx
         TrcnqDU+phvx+I6218G0D567sZQI8PlTc4zFuEQP8Xxdk/NhcHFQctYxngU08RZkfszG
         g0LhyjDFX/hN1yDC4pe0R75flhCcNnz85GKPYGwnZg5BcGH2x6AIazGbvhn6cM+8Omwo
         rlyOSB66LDtWTaLayvYgbmRsJ/UbV/8tworPxtpVJ2eCdpqTkkOAu7BgDr8dhf/0sS0i
         2N15B9tmghj1pRtaOaFpQs9DB+MmCH/+v+9FcNrUC5/cYNzQXXYERc7XnV7fsH5ShSrz
         JwRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=px6fC3zc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26-20020a05620a0c1a00b0078dba304ed7si2246169qki.423.2024.04.11.13.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 13:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=px6fC3zc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1KM-0005hK-QK; Thu, 11 Apr 2024 16:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1KK-0005gv-Ax
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:47:20 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1KI-0004dw-7y
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:47:20 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6ecf8ebff50so172445b3a.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 13:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712868436; x=1713473236; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+M45onNHGQcvvgN8G4lgCvuExfwR1VsOeMySRdzxe4U=;
 b=px6fC3zc1jOPLwdU0gvC7z6RxELV9DloEwy42OCxlOXnjGpDtCxkoAcTAqXAiaVh5G
 qzFqYjK0oSj50bFnhgL/wHS2OgIqSsarniCf2v9FEVY6GBs6CwJVpaMLGgoGUqazoS8i
 HtnK69vsfEAW788FLnrHL4pzUduR57PqaJ+6Vv6kkgmNy099LeX4RhSmK4eyi8Us7zGt
 7YsNqMpfCIWOyAV3r+mwRoujXWsaZcptlp3KYCzgAsCK03mNJH8I/t2VqnNUUH9NVWap
 kx1H7tm/8NheTGYbetBarJZ9sDN2zXKJH+46egbiJYNPSFiBYspJiEKg4xxsxfoRVI7n
 Kg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712868436; x=1713473236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+M45onNHGQcvvgN8G4lgCvuExfwR1VsOeMySRdzxe4U=;
 b=RyEvm8wtuWW/HHb5X8gLNrM3qxoFBo2OznMsXJ39MuoD8Xr2Ztr18f513Q86mwJknm
 8E7lMjj2o28J78cT6XTH4EKLkdILLKSSpzmaka0T/YvUKm+cI4pgOK1PxAohEY05Uzuf
 DrNapYNf7dOjqT/nKwQ9PJEWZXTDf0YGK8QFg6hGc/MU/Hl/G/i9aifKcdNmWmCylFCH
 sk/LWSqmrhC7TTbkxKqXqUFLaS+Az1ayR5OwSRRmu1SJiHIlhjv7uXiVwAbY2GYenEJ4
 ni4faG3FDvFi/1LZjwqsURaKDSA9wtDxIazigHuwmxsfFy7stnGDrcygO0mNtPgh18+r
 zLXw==
X-Gm-Message-State: AOJu0Yz1WiofU8sbYW89QR3Kmwx7K2kSv6sbar6SKUNrLMGm27agfz8q
 f0MKmJyrzQ+x2eL+QG1qR/7PliM17iWqP9CG/lPVU7zbduATNxDOjTm+/e65klY=
X-Received: by 2002:a05:6a00:3904:b0:6ed:e1c:1038 with SMTP id
 fh4-20020a056a00390400b006ed0e1c1038mr940224pfb.7.1712868435629; 
 Thu, 11 Apr 2024 13:47:15 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056a00198400b006ed59172d2fsm1587712pfl.87.2024.04.11.13.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:47:15 -0700 (PDT)
Message-ID: <0a396055-1d20-423d-8635-72289b583982@linaro.org>
Date: Thu, 11 Apr 2024 13:47:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] util/hexdump: Have qemu_hexdump_line() return
 heap allocated buffer
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411101550.99392-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: TcAszEVhhM6U

On 4/11/24 03:15, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/cutils.h  | 10 +++++++---
>   hw/virtio/vhost-vdpa.c |  5 +++--
>   util/hexdump.c         | 12 ++++++++----
>   3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 70ca4b876b..e8d6b86098 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -254,18 +254,22 @@ int parse_debug_env(const char *name, int max, int initial);
>   
>   /**
>    * qemu_hexdump_line:
> - * @line: Buffer to be filled by the hexadecimal/ASCII dump
>    * @bufptr: Buffer to dump
>    * @offset: Offset within @bufptr to start the dump
>    * @len: Length of the bytes do dump
>    * @ascii: Replace non-ASCII characters by the dot symbol
>    *
>    * Hexdump a line of a byte buffer into a hexadecimal/ASCII buffer
> + *
> + * The caller must use g_free() to free the returned data when it is
> + * no longer required.
> + *
> + * Returns: Hexadecimal/ASCII dump
>    */
>   #define QEMU_HEXDUMP_LINE_BYTES 16 /* Number of bytes to dump */
>   #define QEMU_HEXDUMP_LINE_LEN 75   /* Number of characters in line */
> -void qemu_hexdump_line(char *line, const void *bufptr, unsigned offset,
> -                       unsigned int len, bool ascii);
> +char *qemu_hexdump_line(const void *bufptr, unsigned offset,
> +                        unsigned int len, bool ascii);
>   
>   /*
>    * Hexdump a buffer to a file. An optional string prefix is added to every line
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index cf7cfa3f16..e61af86d9d 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -942,12 +942,13 @@ static void vhost_vdpa_dump_config(struct vhost_dev *dev, const uint8_t *config,
>                                      uint32_t config_len)
>   {
>       int ofs, len;
> -    char line[QEMU_HEXDUMP_LINE_LEN];
> +    char *line;
>   
>       for (ofs = 0; ofs < config_len; ofs += 16) {
>           len = config_len - ofs;
> -        qemu_hexdump_line(line, config, ofs, len, false);
> +        line = qemu_hexdump_line(config, ofs, len, false);
>           trace_vhost_vdpa_dump_config(dev, line);
> +        g_free(line);
>       }
>   }
>   
> diff --git a/util/hexdump.c b/util/hexdump.c
> index 469083d8c0..b6f70e93bb 100644
> --- a/util/hexdump.c
> +++ b/util/hexdump.c
> @@ -16,9 +16,10 @@
>   #include "qemu/osdep.h"
>   #include "qemu/cutils.h"
>   
> -void qemu_hexdump_line(char *line, const void *bufptr, unsigned offset,
> -                       unsigned int len, bool ascii)
> +char *qemu_hexdump_line(const void *bufptr, unsigned offset,
> +                        unsigned int len, bool ascii)
>   {
> +    char linebuf[QEMU_HEXDUMP_LINE_BYTES], *line = linebuf;
>       const char *buf = bufptr;
>       int i, c;
>   
> @@ -48,18 +49,21 @@ void qemu_hexdump_line(char *line, const void *bufptr, unsigned offset,
>           }
>       }
>       *line = '\0';
> +
> +    return g_strdup(linebuf);
>   }
>   
>   void qemu_hexdump(FILE *fp, const char *prefix,
>                     const void *bufptr, size_t size)
>   {
>       unsigned int ofs, len;
> -    char line[QEMU_HEXDUMP_LINE_LEN];
> +    char *line;
>   
>       for (ofs = 0; ofs < size; ofs += QEMU_HEXDUMP_LINE_BYTES) {
>           len = size - ofs;
> -        qemu_hexdump_line(line, bufptr, ofs, len, true);
> +        line = qemu_hexdump_line(bufptr, ofs, len, true);
>           fprintf(fp, "%s: %s\n", prefix, line);
> +        g_free(line);
>       }
>   
>   }

Not especially efficient, re-allocating for each line.

How about

GString *qemu_hexdump_line(GString *str, buf, offset, len, ascii)
{
     if (str) {
         g_string_truncate(str, 0);
     } else {
         str = g_string_sized_new(QEMU_HEXDUMP_LINE_LEN);
     }
     ...
     return str;
}

void qemu_hexdump(FILE *fp, ...)
{
     g_autoptr(GString) str = g_string_sized_new(QEMU_HEXDUMP_LINE_LEN);

     for (...) {
         qemu_hexdump_line(str, ...);
         fprintf(fp, "%s: %s\n", prefix, str->str);
     }
}

So that we reuse the one allocation across the whole loop.

r~
