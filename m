Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2635428lfq;
        Sat, 3 Oct 2020 10:51:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytMpl1bQxjELe4pIjpK/e0ra+H5l6viQ9JFpP/W4zTl+FEU1Fpee9uZU6zq4tywlHacG4z
X-Received: by 2002:a25:640f:: with SMTP id y15mr9742153ybb.59.1601747516396;
        Sat, 03 Oct 2020 10:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601747516; cv=none;
        d=google.com; s=arc-20160816;
        b=hZT0SWYsbLKwkO5Qp6Bb583PIVXp4uSUpPKpue8Ur2XhzJihnNvycNGZWVETjrM+BU
         Bs+e/465N6E+ZA42KW+KcjSgUKFPyglXLl4mN0ulxM5vZ9+SF7JGnCSpBy6IuwWn8kBA
         fyPC7R/ouDjx+fKEwaPgNSQWtnZOBzJU/708t12CN3PvhBhN6u+9CbbHzoq9oCRyFViH
         U+26XOEyR9AxMjaJuvb9POZI67BKM3uzn2qSyU8EchdQ+mi6mZegn9+HTyOyrHd7sIsG
         G1HVciBGuUds+gqGLGbzNfzHt6iemFHeg75O/25kNw7pZD/T5qhhsGQQggfdjBNpONlw
         UTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bh3lXGz4KMFoW1Duf/q+SyxiwmL7JXHKrBkWEz9YXC0=;
        b=RpsyWswRoGEXqticO4TkqTmcjlIIMtWr+QgfTRFyWXCQoNf/fAD/YoortkaoSZMBCW
         o1byPA2vQrlxLO4aAyptT+sX/k2cxKlBxVhIs6beohblj7lgZY7rBH8dyMQ/Gr1DxPnC
         zXuPZ7sUz6ziU7GqGv55G5xzyYrJ3l1LjTUCIKQdp5zzOZyDUPARyLdnqh93KCaSaaEd
         5L1ReIo4P2hY0kT/RTLFZbV13mnL4ZGHt5mWccfWkpmS+ofHw/shLi19KSB8szqEhh3A
         EJ/2mI+XPU2CfRudwdxGV1IDSwdd6S5jlw5oRLRo36Sz70I341ZCsq6hz/tdlvtY9yBn
         vXTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KvlpzcIT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si5727237ybl.164.2020.10.03.10.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Oct 2020 10:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KvlpzcIT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOlhL-0002HY-R7
	for alex.bennee@linaro.org; Sat, 03 Oct 2020 13:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOlhE-0002HN-P1; Sat, 03 Oct 2020 13:51:48 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOlhD-0004MG-5q; Sat, 03 Oct 2020 13:51:48 -0400
Received: by mail-wm1-x343.google.com with SMTP id w2so4670950wmi.1;
 Sat, 03 Oct 2020 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bh3lXGz4KMFoW1Duf/q+SyxiwmL7JXHKrBkWEz9YXC0=;
 b=KvlpzcIToroDnQ4t7I6Ag4YmxDCkIQGJDhxaxtsucHe8cwFxaI0c+9V0pRN5G3/vrd
 d2yVl8ANbvm+Nr8RFyV35ZuwJGNqxL7Gtk2LME/tB20Io16aWsG09sr/8Qbb8hT0xYQD
 fCmEuUO3OxWmmIb3P7KcdeHA5SBXlt5a5NPH7OI6jLigRx0845BkQXOoIKBnohenutQK
 KVW8jsLT3tksr3mjZ5YN9fs0EG/mSyL0YmHDpQKYr+4TSmRH2yxsxQx/X/3Xya2Ad2xE
 B+tryErz9x74egIB+1ju412Hanxu/mhWfp1L/OeE55xoXZQHY8ZTtk8ESEEXXhiPr+4u
 1gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bh3lXGz4KMFoW1Duf/q+SyxiwmL7JXHKrBkWEz9YXC0=;
 b=FZLpHy+yewe++WlpHFw0DfWZHYLYvQ04IdyUpzDvFiIj3qzKj7+NJ56dg+16zZTPpH
 UNImVJDrQu7bVIzhktJOAvazAYFohZOK8fmBeVQPQ7iOvW8YD4bR+cjG1sxHK6KInx2j
 NcnZzaQ+fERGX3nvOmBm65Z9CJaP6LWc4Lj325oUcqel2AgOGF3NemE0VOQv9OcT4v7s
 TwNaixpTx25OzAcCrve4K/yiQ9vZRpbXTxFMTmlsS3gBOwSN3nuSQ1fThdeBp2QhMB8R
 8g1jv6ad4yYuUi9HBTBAGZCtFxE/s++bsv89la3oZ1YA3XBvV23pMgUNCsrmvejlKgp3
 n0fw==
X-Gm-Message-State: AOAM533ALognGuSLfBjbHZNdAAOrLtHCA7/gn7wckNhNxa/4cAC6crgD
 Eqc65/Nib9esuAXwcGluDK4=
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr149657wmm.138.1601747505384; 
 Sat, 03 Oct 2020 10:51:45 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id f5sm5895820wmh.16.2020.10.03.10.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 10:51:44 -0700 (PDT)
Subject: Re: [PATCH v10 5/8] linux-user/elfload: Adjust iteration over phdr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201002215955.254866-1-richard.henderson@linaro.org>
 <20201002215955.254866-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5a3983a6-56a2-9803-1b3c-496af5cd01a8@amsat.org>
Date: Sat, 3 Oct 2020 19:51:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201002215955.254866-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kvZbptSopR9N

On 10/2/20 11:59 PM, Richard Henderson wrote:
> The second loop uses a loop induction variable, and the first
> does not.  Transform the first to match the second, to simplify
> a following patch moving code between them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  linux-user/elfload.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 7572a32a30..735ebfa190 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2426,17 +2426,18 @@ static void load_elf_image(const char *image_name, int image_fd,
>      loaddr = -1, hiaddr = 0;
>      info->alignment = 0;
>      for (i = 0; i < ehdr->e_phnum; ++i) {
> -        if (phdr[i].p_type == PT_LOAD) {
> -            abi_ulong a = phdr[i].p_vaddr - phdr[i].p_offset;
> +        struct elf_phdr *eppnt = phdr + i;
> +        if (eppnt->p_type == PT_LOAD) {
> +            abi_ulong a = eppnt->p_vaddr - eppnt->p_offset;
>              if (a < loaddr) {
>                  loaddr = a;
>              }
> -            a = phdr[i].p_vaddr + phdr[i].p_memsz;
> +            a = eppnt->p_vaddr + eppnt->p_memsz;
>              if (a > hiaddr) {
>                  hiaddr = a;
>              }
>              ++info->nsegs;
> -            info->alignment |= phdr[i].p_align;
> +            info->alignment |= eppnt->p_align;
>          }
>      }
>  
> 

