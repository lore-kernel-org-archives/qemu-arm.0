Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5158607lfm;
        Tue, 28 Apr 2020 00:51:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypKeESvrUvWmklIoXaK5YvaD33AOlzdySOSPQDb98npw5Cu0fg/SJosnvtGx994k0pSJR7rz
X-Received: by 2002:a0c:df03:: with SMTP id g3mr24222146qvl.240.1588060295900;
        Tue, 28 Apr 2020 00:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588060295; cv=none;
        d=google.com; s=arc-20160816;
        b=M4VTkPCA2561c9QmV5GG4YNbpRRJ0pikC/JaHpX8YUCCwC7klw2SLKLgWqEnuzDxaD
         CDeMdLzawduXSlyRPa39n8EHTnlwO6VK3XkYFWScsAgJZKgtsWefpjnREKn7OGWeK2Z2
         Nm6Hn4/J3slXOv3I7i24ozqG3v+t1mNKGc3wKNWc2qAvDXxIFYeJK85ksFYKI5B77Tdk
         40UT8ywG43jj2HhjnBFIqz0LbQiJBHjApFgQI41Hf6JgRx415RAafkUv7Zo0D32Izb/Y
         0p6iJlkDwnAmlGtuzn6GXpNQlbkdGhkDTfCjkGVVtKg1A5w1m0KEkRt1JkqsCUOfZpQq
         MirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=IiCmi3gnLXnh9qqh5SktG6taFgc0wMvCmCpUJaLx16Q=;
        b=Ipjh7v0nrwN84kTeQFRBZnQM73rkIu5XDZ/3DRK8xqlxKdJJcfBmbq6V+fVBjj2sPq
         DHwroGRJiqzPmUmmS7oOVMjtj02x2TsHqIKsSk6au5qjm6rkTh9VYzYP9IY9ESYkz5Ox
         08lel4fzcAHi5sLvhPUxQRafDbIPnfH7aVF+9apT9Ma/2mmyV7RInVnQo2xCqPBlzTgz
         2hbCL3wkZhQ2qhuMW8f/U0KcHENs3HKmTvkR+ZqU6CNht6qfhxjenx9nXC/ExP017xLo
         Ao3VgB9A7knvMDGluq30BYLlUURwGCMrAGbq2I5s3QfBzkcwchH6WPx9GBfkJE3xNf7L
         uwiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ij1xZWAo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si10510278qkv.265.2020.04.28.00.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 00:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ij1xZWAo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTL1j-0001Wd-3G
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 03:51:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTL04-0006iJ-EB
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 03:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTKwc-0007eR-1B
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 03:49:52 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTKwb-0007e7-I2; Tue, 28 Apr 2020 03:46:17 -0400
Received: by mail-wr1-x443.google.com with SMTP id d15so21803105wrx.3;
 Tue, 28 Apr 2020 00:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IiCmi3gnLXnh9qqh5SktG6taFgc0wMvCmCpUJaLx16Q=;
 b=ij1xZWAoThDbPF82cYrzoVl2fWa1BCrpruAPyHehHVau+19zxuC7890n77NUx2OAfV
 c9ZVY7wVT5MHljQIAQ6ymi1jjRiklJ2WBKqTc0K467AQLmHl40+B1z07p01dwcqfMUbt
 nVgIhbbbrDldObkGX5wfVCqpoEIfht7ATF4zPtin3X3g7cuOz2eB2L3IvZCxLy93hdrP
 s20abzu3OCAFx+ZtwuXPVpneX7HTBSugORfxk6DHcKIaHfOMd53Zi7WuApjlAbVzIJ0a
 fPYX32paKHq0TNoDMS+LUdFxU5mdm4QKjPBBoFIbVvp+QNUwAXAKDcbe/2tqy5tQBfig
 /y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IiCmi3gnLXnh9qqh5SktG6taFgc0wMvCmCpUJaLx16Q=;
 b=am61547DW4OywH+NuFS5mN79MlJu/olhS9344Ihd1kpSWKOz7DlqE2CCNPKhjhfnpu
 APIwtFiKON63vRArwPfggg/RuBnxu2BTcMfYmd+H6wEewhfdWtN7U08b7mv0cFxSVsWw
 gGjgPkkTODgPc26L0LiZ9rqmjWBsQw7/k6JkLF8zaLC09fg+VE/OftWFMxp3yRJqdSev
 fmBDfpJMcEX7cJ0v68np7MFCPrQIhyp1eK7sxP8nH+rseXtI29nj64qLNRHS+rxGLdiP
 cX6lI3XZG13orjsuJi5aZ2uNvCADezCatKz4sFk1uVXh+ibNXeYXCctDjQV/aKv2Mqsi
 4IMw==
X-Gm-Message-State: AGi0Pua7WWqIE9nqdNZoNUXwABDtQv5MgqKlTVNRm7Bi2AmdV1kU9yJE
 yMIr/shFH1GXtIRmjY0Kvxg=
X-Received: by 2002:adf:f884:: with SMTP id u4mr31105349wrp.171.1588059975401; 
 Tue, 28 Apr 2020 00:46:15 -0700 (PDT)
Received: from [192.168.1.39] (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id f8sm24315068wrm.14.2020.04.28.00.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 00:46:14 -0700 (PDT)
Subject: Re: [PATCH v1 02/11] hw/arm: versal: Move misplaced comment
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-3-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <96c06a2f-bda9-b74b-5f2b-818f32e2a790@amsat.org>
Date: Tue, 28 Apr 2020 09:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200427181649.26851-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::443
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/XchmcPIbUv

On 4/27/20 8:16 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Move misplaced comment.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index c73b2fe755..cc696e44c0 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -36,7 +36,6 @@ static void versal_create_apu_cpus(Versal *s)
>  
>          obj = object_new(XLNX_VERSAL_ACPU_TYPE);
>          if (!obj) {
> -            /* Secondary CPUs start in PSCI powered-down state */
>              error_report("Unable to create apu.cpu[%d] of type %s",
>                           i, XLNX_VERSAL_ACPU_TYPE);
>              exit(EXIT_FAILURE);
> @@ -49,6 +48,7 @@ static void versal_create_apu_cpus(Versal *s)
>          object_property_set_int(obj, s->cfg.psci_conduit,
>                                  "psci-conduit", &error_abort);
>          if (i) {
> +            /* Secondary CPUs start in PSCI powered-down state */
>              object_property_set_bool(obj, true,
>                                       "start-powered-off", &error_abort);
>          }
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
