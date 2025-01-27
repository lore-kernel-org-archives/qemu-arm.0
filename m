Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2417106njk;
        Mon, 27 Jan 2025 05:01:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMcY1b7fprIfnfuuA5+rLEHFKbtwP7S2t24r/fUc/HkV2Pgj7GqUC7GzodqtlNjCSTH9zh0nJdoTOlqA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZTicE2eMgf1IeIPMxqLc55snB8sRTwJ9A+skmhVGrjN8UnP3emIU3DecNYUr61MqVgDrz
X-Received: by 2002:a05:622a:15c8:b0:45d:8be9:b0e6 with SMTP id d75a77b69052e-46e12bdc8bemr663772001cf.43.1737982874570;
        Mon, 27 Jan 2025 05:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737982874; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0OevscR5p+T7SgcFA9XmY5WUV0iScbnT9w5p3b+rP/8MsRlNurbOAQAEJQR/d11z5
         fU4F1rKewJAjmHwcCrHYSfIvyn4xmTJjh8nNqwKzzz2G0tXItgKd1mB7k0rimPLJOlRB
         vxJL47F1oPPBKuhVogf6Zc4G78dE9AJ+lzFxvrV51/h1sDkzX9jE5eXwcdpLNArnsdeR
         PHm3ruNSocijRpZEpltyr9lumg1fCyIUvMijhnA5SOdbYg7yATTZjLgPzRIULDCh2RH1
         0eP6oDR+ghYxjxQwJNCbiTneYTz9aFggaavECxFIEX8/MTsS07iCEWjJE5ROKltFamoJ
         qFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=+uppCdlaUE5vYZ9GsQmTk8pwBMjlf8lh0kZ7iEpDIQ8=;
        fh=Sg5KqZfg4rBy4BIC5kyNbAD6LSFaosLApB8heCX00Jc=;
        b=bHX6jOydEqFlBk8ZI6l3ygMsg4vhvm3L4/2im7ItXYJLnDkNoDjq5Yic0GcHHJQHRh
         xrh7IMK98JqUPerD3e5AgAEmnULTQpdC/owfBG1W9Su7lwuMikBbqamkQWV/vON4KEvm
         0GPU74e4yC4B3JJBllmhH90sPrr/lLzE666NVzut0gyymrCAvwgnRlIHicXJyk+MNU0Y
         wK77wjFgZRhX83XLjpybJnljb/xxNegjYitEoA7t+AOPgMGF67qJtremsg00NgQ/IUMs
         r6dtfIjXWZY4iSLlxLo6b2Bh44BQQL9tRsFy4xk/xoUajFW/Ra4y1l7XSYgk/C11QH5R
         Zhsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b64fb2si107292451cf.232.2025.01.27.05.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:01:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcOjN-0000T6-8g; Mon, 27 Jan 2025 08:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tcOjK-0000Ot-0W; Mon, 27 Jan 2025 08:00:42 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tcOjI-0008RM-41; Mon, 27 Jan 2025 08:00:41 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AA7354E600E;
 Mon, 27 Jan 2025 14:00:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id ed1xDBco8JDT; Mon, 27 Jan 2025 14:00:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AA3FD4E6004; Mon, 27 Jan 2025 14:00:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A7F7274577C;
 Mon, 27 Jan 2025 14:00:31 +0100 (CET)
Date: Mon, 27 Jan 2025 14:00:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org, 
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/6] hw/loader: Clarify local variable name in
 load_elf_ram_sym()
In-Reply-To: <20250127113824.50177-4-philmd@linaro.org>
Message-ID: <6c51f4a7-ae43-fadb-cf3b-191d4b59975c@eik.bme.hu>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1921631016-1737982831=:99138"
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zeYts/Xt6WCt

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1921631016-1737982831=:99138
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 27 Jan 2025, Philippe Mathieu-Daudé wrote:
> load_elf_ram_sym() compares target_data_order versus
> host data_order. Rename 'data_order' -> 'host_data_order'
> to ease code review.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/core/loader.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index ead10fb6cb5..fc2e8f91267 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -443,7 +443,7 @@ ssize_t load_elf_ram_sym(const char *filename,
>                          int clear_lsb, int data_swab,
>                          AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
> {
> -    int fd, data_order, target_data_order, must_swab;
> +    int fd, host_data_order, target_data_order, must_swab;
>     ssize_t ret = ELF_LOAD_FAILED;
>     uint8_t e_ident[EI_NIDENT];
>
> @@ -462,11 +462,11 @@ ssize_t load_elf_ram_sym(const char *filename,
>         goto fail;
>     }
> #if HOST_BIG_ENDIAN
> -    data_order = ELFDATA2MSB;
> +    host_data_order = ELFDATA2MSB;
> #else
> -    data_order = ELFDATA2LSB;
> +    host_data_order = ELFDATA2LSB;
> #endif
> -    must_swab = data_order != e_ident[EI_DATA];
> +    must_swab = host_data_order != e_ident[EI_DATA];
>     if (big_endian) {
>         target_data_order = ELFDATA2MSB;
>     } else {
>
--3866299591-1921631016-1737982831=:99138--
