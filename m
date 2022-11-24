Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp5085628ejx;
        Thu, 24 Nov 2022 05:47:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6/xjAaxFkmG8W7nrCkDduYnzZnOb7sTwUriUl0Qd9DWOPjiwUNuGcaV+n5AjbUyXy/IQ6F
X-Received: by 2002:a37:ace:0:b0:6fa:9e9f:8f9c with SMTP id 197-20020a370ace000000b006fa9e9f8f9cmr29383043qkk.694.1669297664884;
        Thu, 24 Nov 2022 05:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669297664; cv=none;
        d=google.com; s=arc-20160816;
        b=Rtt6ELmoYAa4C+sivHCFnbQyf0ywPiY69fzOmiQHx38unMMDJvIJ/jvaWH5PEti0rk
         axFfGMViXbkikDyfJOs77DCiLAuQm102oX2qb7XTMgVWms/7IXv/ckacilCEg1avHezK
         Yxl1dE4TY7Xb9Gf9FVe4j4mi3R1gcQYZkCWm2dehViOszr2Ez22kuRklsO4PC0JB2rlU
         mDVItCKzgzQwUXWuiA68Yo8eYqE018SVT2EPJzarWYQdx+tRmG9F5kpAcWAeZgUDRAOW
         29KIBoMgYtpIFRMMNxmekIWKUVYs9GwkJBF0xi/e9uXdqfqzgd+wrqXZiQyScgM5LP7i
         hWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8AaT/GhGTjy8ESIpRFvBoR67Yyx+6akM558wY5Ap6vc=;
        b=n9V6HKQ9NpQoWMWcMXB3X/IL/vi/xLUyaVz5P1ahiVokpVNiTn/o/yoyuHTE/MbkYh
         hoXBKNjLfXeFOYV9nH/0n2EzwQ1gwgIig6iVTW4uoYZlfRI/ubEqZ6VT9K2ngwB42/mE
         /a+1a7k0cZGWk3wjNCRAjSWc4lkxEltNG7R3oYBVcckjgRlURf3IQXTmoj3V+JigXL4m
         u7myL56VyUYVDKClWd/buKxwAU+8HoJ6LbarUpEnggfKTgujrKMix/y93kxspR3yy9mU
         qqQWD536bbEbGwTFjwoWEQt5TtjaNS2f+gQs11f+AKc4gO9csoP2RHk3oJ7ZJasSFoSX
         OExw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qnEG7HzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q66-20020a378e45000000b006ec621e9ba4si678992qkd.127.2022.11.24.05.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 05:47:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qnEG7HzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyCYq-0007Of-IK; Thu, 24 Nov 2022 08:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyCYo-0007NX-L3
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 08:46:38 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyCYl-00088w-LJ
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 08:46:38 -0500
Received: by mail-wr1-x432.google.com with SMTP id bs21so2559640wrb.4
 for <qemu-arm@nongnu.org>; Thu, 24 Nov 2022 05:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8AaT/GhGTjy8ESIpRFvBoR67Yyx+6akM558wY5Ap6vc=;
 b=qnEG7HzEcwBr+Y4oc5y2Ue9OQ6iDoub//yLy0DYbfxPeHnMiJEJoOcnVhPZniXpTbu
 aEVUZuGtekJuzfe+hQzAnWZkqkXXx4H0c9pJDMnKhdRCxaGxoa+7w7VCUJ6It6HClidH
 PkFQPtw6MykPjgewZMgiXVMRjeLa9I/6Ab+3boGu8MIF4My4Za+yILFEzvrjm4pGXC2+
 ya5nksM/lZZxol0z2uriBhL+XIM+1NjhYZ1O8oqhJ3PIDhuMXA0+44lp1Xc1zGUpkS5V
 nIG8y5YBrLtCiUyFd6jkCPACSp/Dq9HgPrATThR+gMpVfUb3djUUOo9OXFdQlRC8zxW7
 y+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8AaT/GhGTjy8ESIpRFvBoR67Yyx+6akM558wY5Ap6vc=;
 b=PbcGw4tRff3LlmFAXSA6XdRZqpK+5KYb5MMVxOTtzQ42vNYiizdNl/WmqCutT94zFB
 AoO8I1uveLbMuLhq6fctjTm9IknmODW8L5ensN69nkaW9Qb/cGuBEom8bxfO033f5HtP
 wIwtoaDMHgV7v3RgbotF04qpAUX3HLDWrhZYll+pexh1TZSJFprz47H1TSr8Sda9Kj/u
 5mS4qCe3kl+VclNuMRN+zk9KL6R/DWgK6CWOLvuJH3yT+o6M2UvxJBPBIb9svsm4n0Nj
 NHcJVVJEfSs08jjTW5H7oIhEhN3aGFLU9X4+WvzXx6wFc06Lr0IW/0yvpmgtm9E9urQ7
 +pgg==
X-Gm-Message-State: ANoB5pnzO2WQmhydhsUpFFeGLjxF5J+LhfrqrLbwvRuRE5UgiI84QNln
 nv5I0rk8T3WQY3yl0Rn7wB1Hag==
X-Received: by 2002:a5d:4568:0:b0:241:e8b0:cdcc with SMTP id
 a8-20020a5d4568000000b00241e8b0cdccmr6197800wrc.581.1669297593585; 
 Thu, 24 Nov 2022 05:46:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a12-20020adfe5cc000000b0022cc3e67fc5sm1340878wrn.65.2022.11.24.05.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 05:46:32 -0800 (PST)
Message-ID: <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
Date: Thu, 24 Nov 2022 14:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: DVIh5xi25SKO

On 24/11/22 12:50, Peter Maydell wrote:
> This patchset converts the TYPE_CPU base class and most subclasses
> to use 3-phase reset. (The exception is s390, which is doing
> something a bit odd with its reset, so the conversion there isn't
> going to be simple like these others. So I'll do that one
> separately.)
> 
> The rationale here is that we should be able to get rid of
> all the remaining uses of device_class_set_parent_reset()
> and remove/simplify some of the transitional code that's
> currently bridging between "legacy" reset and 3-phase reset.
> 
> NB: even with this series, it's not possible to usefully do
> anything requiring 3-phase reset of a CPU yet, because all
> CPU objects get ad-hoc reset by some code somewhere doing
> a cpu_reset() call on them, which will just do all 3 phases
> in order. I would like to try to address that eventually,
> but it's not trivial.
> 
> thanks
> -- PMM
> 
> Peter Maydell (19):
>    hw/core/cpu-common: Convert TYPE_CPU class to 3-phase reset
>    target/arm: Convert to 3-phase reset
>    target/avr: Convert to 3-phase reset
>    target/cris: Convert to 3-phase reset
>    target/hexagon: Convert to 3-phase reset
>    target/i386: Convert to 3-phase reset
>    target/loongarch: Convert to 3-phase reset
>    target/m68k: Convert to 3-phase reset
>    target/microblaze: Convert to 3-phase reset
>    target/mips: Convert to 3-phase reset
>    target/nios2: Convert to 3-phase reset
>    target/openrisc: Convert to 3-phase reset
>    target/ppc: Convert to 3-phase reset
>    target/riscv: Convert to 3-phase reset
>    target/rx: Convert to 3-phase reset
>    target/sh4: Convert to 3-phase reset
>    target/sparc: Convert to 3-phase reset
>    target/tricore: Convert to 3-phase reset
>    target/xtensa: Convert to 3-phase reset

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

