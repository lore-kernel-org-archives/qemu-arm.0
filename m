Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp192720ejv;
        Thu, 11 Apr 2024 14:29:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWizyWfjpn2WGFIHeyF4D4JiIN0VbnkCxQR9sYDmi7NtWaOg5pHUcsWTBND64L+CJDdUcxCt/QHdjN5QcNUHlx4Nyl2bBmE
X-Google-Smtp-Source: AGHT+IFzMH3gTbKAfC84eOeC3UBVI0FLHE7x6uxNstWql6lw39tkMylqUCQCm4mO4xEU97hI7pMP
X-Received: by 2002:a05:6102:160b:b0:479:d2ff:7cfb with SMTP id cu11-20020a056102160b00b00479d2ff7cfbmr1514707vsb.24.1712870984026;
        Thu, 11 Apr 2024 14:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712870984; cv=none;
        d=google.com; s=arc-20160816;
        b=j4pjQ9TSRjqKDJ5Odx6LU0/9VQ+WEYWSW0WDhxN0FUld6+cJyVDYhVJG3HEDMEWNxN
         RLsBY3R8Bhbr2Q75ghzuIkf7g5Jj7rc8MGPWHp8L/PSEP2vAo5RdaVAGhgi5MH5jkdg4
         ytjeXxa4Tskl/0mczK65Okq9jDO4BPxptim4h7VdR91gXytWOV+ygiHw4yObG9erlhun
         J3yQq1vDheypMuSt7Vjdc9L/yCxp30Q/G8LUlYfAn4g4JnFJqpD7O8ywL7MA9YQ+WFy9
         gMJhnYDdv4QlLtZ7wNRNT3AkGwHAGxgW1SAt7ZWmx0UTZbc2fyNMnYlpoCCSp5IxHWhN
         UiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RJsOI0kIFMfF7NmBE+13vGuAmxuOp2z6y46qcjNHHPk=;
        fh=aqNfezqI6mKS740ew9uAQrL37KbAAzYqJmkow4Dtht8=;
        b=Kup6jHgRgDbSUUsEo6FgZpjvFNKgkBxbd0Sz0WZlX4/7dxJ/GsBEqpJbJaQLCdb1UR
         PJt4Sz6xEdo4gNaRkD770pbQRrwuUd8u1Bzl2UjVkQp6qHUphOZUQk7SYUMVIFUCUACT
         zJj0Ht30FWCIrEUe79r7IJab5XZUVFWDWq1GE1UN/tWoEaryHTLxIb3tcjxWt2QpEPZK
         YIf4JrlC9MVxP70aAmP1Ja2sOWoPDavQmEyyc7ISmn7LmoKzdPR375PFj2EvyUgLAjkX
         Ci3U1BRpD8FOdX8uqs3KmVcGkpuYcQaEOwOoSy0/6Xmke0WZQyIhJ81W1vRDDZMQrdhN
         eTKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZbGXft0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05622a054b00b004366417eca1si2051337qtx.136.2024.04.11.14.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 14:29:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZbGXft0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1yz-0000Nx-Kv; Thu, 11 Apr 2024 17:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1yv-0000N9-Eh
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:29:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1ys-00032y-Lz
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:29:16 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6ecf406551aso263949b3a.2
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712870953; x=1713475753; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RJsOI0kIFMfF7NmBE+13vGuAmxuOp2z6y46qcjNHHPk=;
 b=ZbGXft0XBJJKD/16Q/s7gT42W6dexpergWdI9QURiEz5pP2OclhCyYWGvYOxn7RWBL
 tA+eKm7oVeSKybFmpqT8lBEGQ+QaBHr+1IXR9hCBZZci7W5V6zFVIGqgovBROVO1MNUN
 PfoXxVjQ9Hv0upjLiejyjrH7Hiix8MFj1qv20xPagVcbiULegM/XHyiAfgSnmkiegLlg
 FrmFPK3L5cLCkoodTTVoWZxQAl+qW0QblUCzmDP66IwQJdSzoiudKUgIDDTk+BulD+6T
 O+ffUrYU9BbhqXsSkFxZQ4firf/aCORy0PKRp5oBJkHRZIfHMuam7ETwLHFWPzw32QQn
 p1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870953; x=1713475753;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJsOI0kIFMfF7NmBE+13vGuAmxuOp2z6y46qcjNHHPk=;
 b=qXU2fgiZ+6pIJyq/v2tPTlP9ValEniO6X/U+RmxV0ypy4QjmXWXxw6m6sUMgZS/g3H
 OX5ju7S9IzQttgiaNoLgeNYJtebd6TfxQmY3c3wF2N9ys5c9xq1nFKuv1EuX5A0s6xaY
 fvlYjtst6WF8tz3+IirjvqxX/B+0AWllbDDmoPJwx333KoMiSWNfKWtQudAE5vjKMlnS
 idSss8M6SVm3mfCVFKVmUFWVMruUwMmMR9IlqpfkFckTq9+6XJ25bOa0kuNKQLV2jaE0
 0jYvGqFc0JiYbhcl1OxCURUXBiPjzsFq9+OomvGfd1OMupNlE058tT3H9uhqFnBT3R+6
 oIEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyjypLXM5/Tj/Rwyt72HG9uXNYb2Yr7SjPgE0GHdi11leJgz2ll/7Cpx+6bNepWBS8TC8u3yzf55hJcsKkHYQdCcen
X-Gm-Message-State: AOJu0YzxzTiWMKtVlCuhHkA0Yv01SxOkAmk53O9x0HilvUJ/c7Uf7BmX
 Yk5q81G6fPistLiyZKBAbJvLLfDALldeu2gpg6/rlscDXF8yf5k++l6IApvrK7k=
X-Received: by 2002:a05:6a00:2314:b0:6ec:cec1:8fe3 with SMTP id
 h20-20020a056a00231400b006eccec18fe3mr1135997pfh.11.1712870952893; 
 Thu, 11 Apr 2024 14:29:12 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 cb22-20020a056a02071600b005f034b4d123sm1312682pgb.24.2024.04.11.14.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 14:29:12 -0700 (PDT)
Message-ID: <9dbb14fc-fec9-486c-b480-86a6c5f3f84e@linaro.org>
Date: Thu, 11 Apr 2024 14:29:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] hw/riscv/virt: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411104340.6617-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: p+mSemh6rN5s

On 4/11/24 03:43, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/riscv/virt.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d171e74f7b..b3fede1207 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1619,7 +1619,7 @@ static char *virt_get_aia_guests(Object *obj, Error **errp)
>       RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
>       char val[32];
>   
> -    sprintf(val, "%d", s->aia_guests);
> +    snprintf(val, sizeof(val), "%d", s->aia_guests);
>       return g_strdup(val);
>   }

g_strdup_printf.

> @@ -1785,7 +1785,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       object_class_property_add_str(oc, "aia-guests",
>                                     virt_get_aia_guests,
>                                     virt_set_aia_guests);
> -    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
> +    snprintf(str, sizeof(str),
> +                 "Set number of guest MMIO pages for AIA IMSIC. Valid value "
>                    "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
>       object_class_property_set_description(oc, "aia-guests", str);
>       object_class_property_add(oc, "acpi", "OnOffAuto",

Ok.


r~
