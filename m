Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp602366njb;
        Wed, 4 Dec 2024 16:05:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSDKv8xKzZRy8WvoaGgPa9VFDxNPAf9M4LgR7pTnXSUrqppDLGtzr/cUEsHcSYlQAAJkEq5CrMz6CRGA==@linaro.org
X-Google-Smtp-Source: AGHT+IFsn9xMH7GZuu1sxKm/uvlv5V23oEf551ZXhblPOo1C/QQi/Sjf09xMuCgN/imRy7B/JPQ/
X-Received: by 2002:a05:6214:c82:b0:6cb:d4e6:2507 with SMTP id 6a1803df08f44-6d8b738ae51mr128998006d6.22.1733357152192;
        Wed, 04 Dec 2024 16:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733357152; cv=none;
        d=google.com; s=arc-20240605;
        b=B0tm3/iPtHV1uj3pluIGsLnUdBpiNZzThK+hjbcNp2REAPiFdA9106sb8Bb9v75a0W
         GwWz3ipCkIxHviMjdEkoEmLyPAQ4Lv1F1JIkrmuepI+2p5bbcrdW2DX9lIDsMp3updN9
         t6p/UeFeFU9KAqVd95ghcGFwJB+jjywKz1Y9JmjGVWRYL+IJwo1tjlYuW+4ohfPrlNmS
         A64Iuj7d3RsvQ67ii7Lklg+zjyF5nyPLZ06PkD7faTvJrw36ky/q+7gVBzXfZctYYRV6
         7cuXv1E2On17Mw7jZjEY1RDV5MngyB/NoufbDQvXYgS8mRSSLA5OSwB1cTKqbjr8Sh+f
         Uv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wnGKNIxWhNVb5d1v6/cE6WaIjZNJE/0+BheeGVemCPs=;
        fh=A9c/x6OIIMuWG1K97H8A03xLNTj4SU9TaIvGGZ3bHmw=;
        b=ibWde112gcKH9n7OQ4mDDJtk1kHzzJ6YpRxXN7Cx5lLuk6LwaeBWKNHDMwnUz+TvVD
         c/pgDuo1kchotEGG0O4mepau7wADnF9nW5bAXxODPyckesevRgyFErCWOfZJR8SCrAD7
         yKjhs60mFlgiMP3CzAJ5mUfegWTbuc7uhKGqqXIS5JWpzxKgi6dXvaSGr01rhd1/p72n
         I8s3FtIgtC6ow2hkEvGBhjtIcliAVd2+sRO5C6QjRiY/9p/pGtHNd3bLI5Xk/+w1eUXN
         5J8JJz8bhmaUe7teR4r4jx+OXMyVQOH/t4MIDPxcywnAT+HGHePmKF/Xof9ObJGYOL0I
         gofw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnqO4WlI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8daa08178si1979876d6.268.2024.12.04.16.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 16:05:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnqO4WlI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIzNH-00083P-Sl; Wed, 04 Dec 2024 19:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIzNF-00082h-Be
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 19:05:42 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIzNA-0003Py-H9
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 19:05:41 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2689e7a941fso147877fac.3
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 16:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733357135; x=1733961935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wnGKNIxWhNVb5d1v6/cE6WaIjZNJE/0+BheeGVemCPs=;
 b=hnqO4WlIral1aOPSYI+vSxqFRTDTfp9pp92c16SuNsf4Dv33RsF5nLNstUJge+NOa5
 bYj2p/0jb2WEejgx+gKm8M/Y06vDbjeTdHmQ4Xiqc0euqCvRMnvB4FcSgigrwHrPypbn
 EltKIg8T/9NV8cD1Y9mEiZp5QivzL6seAUXlGOdQIUhuMWAyHxH/C1f8sr0065PKMOxT
 lnPNPeEqfl5x+SxWMmAK1djlnaCDPm6DjjxGgJCg2h3YiTgBGSHxCuBv3eP3GGGM1yLU
 i0Npx8Z1DD4qe3dqY0kmjMQO7aFoJLDQBAIX/TXPN+QHKMaLhBVqzI4PUHrmWNVqvM6q
 87oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733357135; x=1733961935;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wnGKNIxWhNVb5d1v6/cE6WaIjZNJE/0+BheeGVemCPs=;
 b=JdkcWaIEWNMR7vIbvDXsliCtb/kRVnPYc8xnhDmhg2XzXbZQIHTVAAa5OXism8vvpQ
 iAM1k9iW1eTiId86xZodb0wGgwHBXZtud5jKlJmrWvVhhX0NRUG9K457P5AxKQMkSpOQ
 dU9G2JlbofiubduuPcnRRUzzq2gPnbscW8HarhYUKbRSeJ01RkJUqONyCXTjeXhGcPtX
 EvTDIscOZ+b9g8kQmDEo41vjoKEusO0GdLKYkhRyAgu9qQDLt7DKzUuTq2Hj62odWKee
 sP/UwO7zsc/ru/zpa1zFDwita7YrH2s/wDPWTQgRHunlEz1QvkQuejhzXWezrI2/fqi4
 ENvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi2XHbJ062NzmilTsajHC4BbPECmSJlc2Yh0dkm2AcKa7gFdX5nHu3No9JenFapxrwuMWlKpxj4g==@nongnu.org
X-Gm-Message-State: AOJu0Yw7j/S1piyOIjzN2XNA6+QH6CU61cbueXeyvL3w0zD45+IfLECK
 DRdec4sQ76kX68H+fuqIml3cbootVIHuiu7vLXExD/wFHWsHm3gaTVX12wfqrcE=
X-Gm-Gg: ASbGncvs6Nayl3DQeM9en0I9/xCWKqy3tlY7wxN9G5XeHDsBBMEPTF514Nb0fwfQmuX
 3TXW4e6JGA6N34N8xyuJfrZA3OThcrHNmNedbKodPMcKzQ7t541kGP4cjv1D7EwFpaskmH3U1va
 Cup8ERCdWURRxTKCtamnjie22gh2gyoUQRocNy4S2i5T+HM7PuZzMi2x88tIcLGiYVUYbDkCmXq
 GctcFlQTx9rb0o7TVVpJ9hTUNnyIAS7lRq3G3RbHSTRDq5IQdwpfPAGV3G+Wzn+ggOm/dS/EOmX
 S8J9RvR46oBvczV1OIxZsuUd+1xc
X-Received: by 2002:a05:6871:3806:b0:297:2763:18d4 with SMTP id
 586e51a60fabf-29e8867576bmr6152728fac.15.1733357134747; 
 Wed, 04 Dec 2024 16:05:34 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f566d7b73sm83857fac.13.2024.12.04.16.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 16:05:34 -0800 (PST)
Message-ID: <5f95a4d0-5224-4b49-82e8-69079057eb16@linaro.org>
Date: Wed, 4 Dec 2024 18:05:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] hw/core/generic-loader: Use
 cpu_datapath_is_big_endian()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org
References: <20241204202602.58083-1-philmd@linaro.org>
 <20241204202602.58083-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241204202602.58083-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OkSD3ph3ZE03

On 12/4/24 14:26, Philippe Mathieu-Daudé wrote:
> Rather that using the binary endianness, use the vCPU one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/generic-loader.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index abdd4c08a38..7b3b5f06565 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -31,7 +31,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "exec/tswap.h"
>   #include "sysemu/dma.h"
>   #include "sysemu/reset.h"
>   #include "hw/boards.h"
> @@ -66,7 +65,6 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>   {
>       GenericLoaderState *s = GENERIC_LOADER(dev);
>       hwaddr entry;
> -    int big_endian;
>       ssize_t size = 0;
>   
>       s->set_pc = false;
> @@ -134,14 +132,13 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>           s->cpu = first_cpu;
>       }
>   
> -    big_endian = qemu_binary_is_bigendian();
> -
>       if (s->file) {
>           AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
>   
>           if (!s->force_raw) {
>               size = load_elf_as(s->file, NULL, NULL, NULL, &entry, NULL, NULL,
> -                               NULL, big_endian, 0, 0, 0, as);
> +                               NULL, cpu_datapath_is_big_endian(s->cpu),
> +                               0, 0, 0, as);
>   
>               if (size < 0) {
>                   size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,

Given that we're not verifying ehdr.e_machine from the file via the generic-loader, I see 
no point in verifying ehdr.e_ident[EI_DATA] either.

I suggest changing load_elf* big_endian parameter to elf_data, then use ELFCLASSNONE to 
skip the EI_DATA test.  This more or less mirrors the elf_machine parameter -- we use 
EM_NONE (0) to skip the e_machine test.


r~
