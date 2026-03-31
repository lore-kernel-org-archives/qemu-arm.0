Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59957FF60E7
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 08:19:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7UKA-0001Su-7k; Tue, 31 Mar 2026 04:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7UK5-0001SR-7L
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 04:19:43 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7UK3-0003TT-Rh
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 04:19:40 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6501d242e3fso3584283d50.0
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 01:19:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774945176; cv=none;
 d=google.com; s=arc-20240605;
 b=CJPrOH3WhYxn7cX/5/MP3QcZzKzIiaviNcYNC8lJTTvHT8jjwFZxu7NYf+l9G5uCla
 606yzUONdUOwWyUacRNH9T7Q0uEUYS5ZYSbsBlFCjZe53hzie09h+ph2lS83avpW6LPF
 u89RTVsu6ODc8xPXjuMf5h+g8mbPoOMLNO/H50n2LZJ5KA0KCa4w172SEZcwmwU7MKMJ
 BLuSIZW7P8FwLJsu21WuEMQ+er5sxkhckz4/laAYbaGsjtqRYUXzxVYj/57Zla2PmI+3
 MlBbdDy5PTE/0jZNNkVMw9ZtXH5+boa0ncDEwRF28Te+LtND1nosGfTZTMXH12EmaWSD
 o+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZJLhuz8Mi4qYBbJljsmWW7v/SyDPWBk4EE+2g9THPAE=;
 fh=X8pn77QmT4wMefDS9i/JxpY39IO0Eq2Pu57Zg2/oVAE=;
 b=SXEXPOpiYQZ+NHe56FoMnLMJuYh240zxV5ohLDdTSvi23bYM3s7QLd8w7zMfQ6KBXY
 x9ngfOjyl7vSnbqe0NRoTnZLvx3GHDGtVU3vZ0VObrH/hdlhSkfY/GO3mptve5d9+ZJX
 /EDkWvJHV5SGtiNEkGbrUWuvGHSlpSV5oFn46/yPy08Rxa4lvODVVBDinZOD63jXWai+
 NM6DEo7Rgt0V1aHPKHUuKFStOSGO0d6cgFQKSZdWJS37obApG6ukLtF+iOmsVfaEavnW
 N/LxSJ7OAByZu6hbfI0OTofjnz7qak1M+hftG3PiAL/IHrd7BTjMJQXhpZh3+suy4Wyu
 v97g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774945176; x=1775549976; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJLhuz8Mi4qYBbJljsmWW7v/SyDPWBk4EE+2g9THPAE=;
 b=MLtCs7X+XspjjQzZqg8YI5FovH4wijxKWemKjvqoLtybQJycSvlZWO2dUXk7OLKjjN
 hpyPirDcj1RuwkhTD2w0MBeX4xe7PAtezKnIDynU3N6qeQnypru2ZzqRvCckdahqiGyj
 lOqI7TvPOmvvJEJecESvaT/zxzl9ON6QDP1HAzKsf8LNiidWyJlSwKUTV4MseoK9YLE1
 DXyBYR0ZWZ0AC6nCxPrDKmy/bO0+VXvqYB3QMqBdWDyL5J294J+K+HYW7TI7e8x2aFfd
 JSSQWhJ3aSoO1OmJgosWoD4aP24ffn9IwoTcXPoAVJCn57SzRBLlihkwCFERwZWknXY+
 MnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774945176; x=1775549976;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJLhuz8Mi4qYBbJljsmWW7v/SyDPWBk4EE+2g9THPAE=;
 b=QpXrYj8ETGpZcDZ7v6NVlH5yaFGoOXFjqk19Ql2njO8UJLCE/LzTOwcsro6Sspe5B0
 HUVY2nxek34Il966IYGJJKMZV/Z0ibMzKP9vRvmUTo79vfGj4sI9PUQckIBrqCTUORHm
 Ne0GNFl5xS8t2Qhmfg4nITiDjkCtIOUCTNZbUO0k7A1WKPdeHaTa/E7N64wFISgK7ZYo
 izRgTX3ZVMavNdPI94rVyeK2i0Gs6fqM05sG2NsdHSXwZSfinDpU35bPHw1+PWyuAwFD
 mjoz1UUq9+FWG49zmRz152PHP+BUJ3buURW/vFwtiR6M+tiaSLHUB0X6puZa22o9kYPw
 z+4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGI02Be9vaFLbz23PWrSNukNkkcwjkQWMqXvByR6mfqp0TWp8HWVY1m/7qpXis/WJsSMtCy/SjZg==@nongnu.org
X-Gm-Message-State: AOJu0YzG6y7Sd9lnr5BcSi6k+zO72xLnBudHbp49tkmd9/5KXMa9jFcV
 awwqNVmwdHSNdsCNSF5aKLvKxsVyd2qJfFtNnPupFsf4nZgYffsr6lIvl7/DcUBPdY3RpMn/qJo
 cE3sqbNZmM1g3DN8hVeg8uOWhpVOq3Mju+f89KjZK7g==
X-Gm-Gg: ATEYQzx9vZkIpznr3kivcCtizoaZQbYq3awCtO86hr5XosOvm2EVggJjHT+7gY5ATk4
 LlCPpIMsLpmI8WbJZNa9SGDqWRAyXs+veVs3jho8vZhfVHMPVHRiWs5t4FLDFJnwkfACIt1geR1
 kCr97u1teLdNWIy6zX8J9Dmi8d++E2o+xhvxuexywFESeXR8b8ANGMbmSN0Z7J4PsUMzp4xxIA1
 vJESJvVqDZMZ2EVTQJ46Q0+nle8Vgn6L4XrQIk/HervEsrt3ZAX5LJclzlbyIqLJmivvLepW4lR
 Rd1HPIVqCctSigUlvgArCMHYhv//J3TI36ln+1Poow/vq3qheCnSPO16UJ8VhcTLy8Q=
X-Received: by 2002:a05:690e:d55:b0:64f:ff90:4d56 with SMTP id
 956f58d0204a3-64fff904dffmr13391095d50.61.1774945175877; Tue, 31 Mar 2026
 01:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260331040659.401397-1-tangtao1634@phytium.com.cn>
 <20260331040659.401397-2-tangtao1634@phytium.com.cn>
In-Reply-To: <20260331040659.401397-2-tangtao1634@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Mar 2026 09:19:23 +0100
X-Gm-Features: AQROBzCpdSc0PNi8CPN_7ZA8RISCWlS__jTbV8_4vCM12Mgnryb4Ykq9xFUFYJ0
Message-ID: <CAFEAcA-mePyVgVMUy6LDC3E=3HqCyFZVWP78=gY=h_x+_nocVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] tests/qtest: Add attrs support to qtest server memory
 commands
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 31 Mar 2026 at 05:07, Tao Tang <tangtao1634@phytium.com.cn> wrote:
>
> Extend qtest memory access commands to accept an optional attrs argument.
>
> Supported attrs:
> - secure (x86/Arm)
> - space=non-secure|secure|root|realm (Arm-only)
>
> For memory commands, parse attrs, select the corresponding AddressSpace
> with cpu_asidx_from_attrs(), and issue accesses with the matching
> MemTxAttrs.
>
> Cover scalar and bulk memory commands, including:
> - read{b,w,l,q} / write{b,w,l,q}
> - read / write
> - b64read / b64write
> - memset
>
> Also reject invalid attrs and excessive arguments, and document the new
> command forms in qtest.c, and use qtest_send_memtx_error() to return
> ERR for memory access failures.
>
> Preserve legacy no-attrs semantics for compatibility: those commands
> continue to ignore MemTxResult and return OK.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>

> @@ -510,33 +684,38 @@ static void qtest_process_command(CharFrontend *chr, gchar **words)
>                 strcmp(words[0], "writeq") == 0) {
>          uint64_t addr;
>          uint64_t value;
> +        bool has_attrs;
> +        MemTxResult result;
> +        MemTxAttrs attrs;
> +        AddressSpace *as;
>          int ret;
>
>          g_assert(words[1] && words[2]);
> +        if (words[3] && words[4]) {
> +            qtest_send(chr, "ERR too many arguments\n");
> +            return;
> +        }
>          ret = qemu_strtou64(words[1], NULL, 0, &addr);
>          g_assert(ret == 0);
>          ret = qemu_strtou64(words[2], NULL, 0, &value);
>          g_assert(ret == 0);
> +        has_attrs = words[3] != NULL;
> +        if (!has_attrs) {
> +            qtest_write_sized(first_cpu->as, addr,
> +                              MEMTXATTRS_UNSPECIFIED,
> +                              value, words[0][5]);
> +            qtest_send(chr, "OK\n");
> +            return;
> +        }

You don't need has_attrs and this if() statement at all:
you've written qtest_parse_mem_attrs() to correctly return
MEMTXATTRS_UNSPECIFIED for the "attrs argument is a NULL pointer"
case, so the codepath below will handle that correctly. Similarly
for all the other similar places below.

thanks
-- PMM

