Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1259582ejb;
        Tue, 20 Feb 2024 04:31:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFWlCag2J+hoGr/FfJr2PcPA50/aBVnw4aXL2qVCvrQ5pw41MO+YteGfo0DXkTRh1Yvb9rgJomhL6Vg+LtxcqHIykL5vo6
X-Google-Smtp-Source: AGHT+IFCfe91gomEfLH62mBF1uJTeBcL3HJv/2UXrpknkyo/wUCBLU8T1bkCBKiYZno3WiSC3viL
X-Received: by 2002:a05:620a:a47:b0:787:262e:9a7d with SMTP id j7-20020a05620a0a4700b00787262e9a7dmr16038637qka.25.1708432293098;
        Tue, 20 Feb 2024 04:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708432293; cv=none;
        d=google.com; s=arc-20160816;
        b=spOUksfvR0SzrCVDfW9BSbYiupuNJ5yLl4ykOJ6ZAMuE85jBWqacx3Ovy408y8NYea
         Q3j1f1QQFSWwLvzuhTpt3ZVT9YLCifvU8sOUoCcRq6nm2OP0jCDwpOyc1JUTqaqA2gjy
         uHFzgxY7BSU06gQP0I2uBaExMrIiSraHc26Se79Aj1JfIQJ7jjQW4KxJQaezSXUMUkW0
         2kiIyLx1lWCDShOa9TjoomjHcf/YNwVbbqkaia72hGR9rG2kDkF/7zg1s8pjzV3NdzlB
         qKBj0c3uNZ2OC4y0Wrt2bPaBmp/VadJrYZPLUhuWr8JQ2TvCcU5MQb3ETvQw/4fFj+Y3
         8ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HIStiYXkXTcOJyvv/atc2ADxmhvcM7xyvK8iIss2cic=;
        fh=YAxCJiUDuMQzKfatS/lWwyo6fi9HaN8cTSmR4WmfOs4=;
        b=l4xozfeFTLAok35j8lESiIaZ0o07wmWHA56O8XlpddUjVisUaOWRME0gHNGDYTvbdo
         1BIkuziRvmj6L5is7P2X+8CwQF0bex/egFLNz+KXm+RS1npVJQkzuo0Jp6iAVwhlVkPJ
         lu8qdX019hX6vEQ2KKVHl/MgcsIhTFroRucNpn2kYqy3K7P7Tsk68VlmgL/zveD/z03N
         xAkVChAlLKEfCkUolmxQKRd/QqaDu46km63rpvStsB//uhMKFME2VtQ0nt3hGrdfZiJ1
         WKvgzLURPU9NsL0stUJzgq3m5/adFDeiiTVmmyPZdDQGv6WvEbiRRgn04boF1bucCBgf
         kxfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMEUh4AU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c29-20020a05620a269d00b007871fec8208si9270318qkp.477.2024.02.20.04.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Feb 2024 04:31:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XMEUh4AU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcPHN-0007rj-9P; Tue, 20 Feb 2024 07:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rcPHM-0007r8-Kr
 for qemu-arm@nongnu.org; Tue, 20 Feb 2024 07:31:20 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rcPHL-000764-2B
 for qemu-arm@nongnu.org; Tue, 20 Feb 2024 07:31:20 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-564d9b0e96dso406085a12.2
 for <qemu-arm@nongnu.org>; Tue, 20 Feb 2024 04:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708432277; x=1709037077; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HIStiYXkXTcOJyvv/atc2ADxmhvcM7xyvK8iIss2cic=;
 b=XMEUh4AUf8d9slXLuN1GiM2OtN8RBWKi4PN1Vkc9HCXI9WK/flyWdU9fQxCCfytvOz
 V06rWlGVD/TriEMtrUJPrW+urH3TCq2LC7rzHeTVzFGI9sHTQImVoCeJ+mmXHMPzeelr
 i5kIqzNf3x6K/vMHYrzm7u2jfyYgFe0MZAA5kDP+HJneb98rR9CaSft8AnwrUkIrU/gy
 UwPqmrg+un9+925kF1oD6Y9EMh722S+cZ9U2hEve4yVbTj3/a/LMXCbr1imzzvp2bbnI
 OTYBZu8+ACUSjsf0hvKHBaylRnE6esaNUrreCQaxYwuE1ke1uoJo9/4vKqbr12kJka4J
 R4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708432277; x=1709037077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HIStiYXkXTcOJyvv/atc2ADxmhvcM7xyvK8iIss2cic=;
 b=FCYpB9BxZa1EHrUBYTPhkM5P4Gd39QdexNr2OnGKzWM0lrXlmvOGNYmAAw16Ggkk7A
 4Jxzv5r9mplxaj7FYGrZWodOboH1GkqXDXdovmRYmGXm8j55H+CD/3SBGvYDva23cAYs
 eiIiEWr7IwwsULPWumK1wzttS0LCokg+gac6rsb2sr2hT332Xp63ZqLAB0qBysKnWco8
 99ArjFIAWXX7V2jU8n3h7XA/lc6JZ6yh3stjEuQrz9WXCeYhwpyBsgd6ezri4mH9kUcP
 kfruO6vHUQhvX5ZCDg65/D70FDIZN9l3r66F+YrgzNqR6XpvdQh3GWumZp7qpnXEIosU
 KAYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoiH5u6AknLloHDO1OWajlUQcfLMuTloNrcFHM5bS8nZUY8/pOoZfVp4XUrngNSIIY/nZNndsz65sUWyyrievGWIOP
X-Gm-Message-State: AOJu0YxZxUCXtD860Qw+xIHvndopSHm0bx1YK7AaV0/lWFmJGp0lw/Vv
 z8+uRXeznd1M7F1JlTCyAJ/VARrdnQZzok15kdLfbR3Kbm/p6YOg5hbW5V++60WRZ+trsF9xUus
 weKaVQoOZcZGqmmvsziBWRZVcIjbs6pVC91qcdQ==
X-Received: by 2002:a50:ed03:0:b0:564:7350:cac8 with SMTP id
 j3-20020a50ed03000000b005647350cac8mr3664227eds.15.1708432276797; Tue, 20 Feb
 2024 04:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20240220121752.490665-1-ruanjinjie@huawei.com>
 <20240220121752.490665-2-ruanjinjie@huawei.com>
In-Reply-To: <20240220121752.490665-2-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Feb 2024 12:31:05 +0000
Message-ID: <CAFEAcA8jef+ZqSaj7MOwkneuj5aLayA6MZA=-LH+VvcDuFCtZA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] target/arm: Implement FEAT_NMI to support
 Non-maskable Interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: ZDp0zTsfOysE

On Tue, 20 Feb 2024 at 12:19, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Enable Non-maskable Interrupt feature.
>
> Enable HCRX register feature to support TALLINT read/write.
>
> Add support for enable/disable NMI at qemu startup as below:
>
>         qemu-system-aarch64 -cpu cortex-a53/a57/a72/a76,nmi=[on/off]
>
> Add support for allint read/write as follow:
>
>         mrs <xt>, ALLINT        // read allint
>         msr ALLINT, <xt>        // write allint with imm
>         msr ALLINT, #<imm>      // write allint with 1 or 0

Can I ask you to break this patchset down into smaller
coherent pieces, please? When you write a commit message
that has this sort of "list of four different things the
patch does" structure, that's a sign that really it ought to
be multiple different patches that do one thing each.

Do we really need the command line option? Mostly we
don't add that for new CPU features, unless there's a
strong reason why users might need to turn it off: instead
we just implement it if the CPU type and/or the board has
the feature.

thanks
-- PMM
