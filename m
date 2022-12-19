Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3905845ejb;
        Mon, 19 Dec 2022 15:58:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsGfHybx4oFs21znqDm7u/GzJV0IaiXQdC0cSBpOO4dx+3N22E2oC+wqA2uRZ5TmRg+jZY6
X-Received: by 2002:a05:622a:5a91:b0:3a9:86dd:3c67 with SMTP id fz17-20020a05622a5a9100b003a986dd3c67mr9319910qtb.3.1671494335461;
        Mon, 19 Dec 2022 15:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671494335; cv=none;
        d=google.com; s=arc-20160816;
        b=UhAQie0VQHexB9pxv3qwiioCKFhguQKHN4cqkcm5i0IodfkVuZ/nSW1p4vwOAF298Q
         MVDAtikCTsY4ithTY/6yq6faqg6DWSzakZnbbXY6ICSe86RhSBiPiH1y7qjBzqvpSBBk
         U2Jfm3USxhv+5IRDWJw8jAiyditdn4fWgFu+cuUHsoiONJA3F6iIfG5XpZtUTiOS9Wax
         IBH/3YmzSIdGJqODThioaY9z30tiu0+IxR6xfEN73E4/DPXhO9na1TQnf/RGJvpJltGZ
         Mi4ad1K1dSFqdiPR9zYIZghHU1+hr8oOVLdyRMrEYl3XuzX260TxeSU13nJL7j0qoa2a
         0mDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=t+k/NhiFIh+gR8/EesxpWW635Fq7o7eqjFkNqGQtSx0=;
        b=DXNyy/tAXGspH7mKHVQ6wVUW7MY72HZiua72yl2xQBoeVnvUXE/xDMtwv9oefGAdK0
         9qd7mn9K1MyIZMKM//9+lJufzvC7K51LfnCiyDcqK4mfu/ClkSjJNYlycAyJqjn02cy9
         nrGLzPYhN/gT/N4DBL2UQyTyVHu6j50RFn7RPIPAs09GaW429P7Iy3xPkTifGBExor5l
         0XWhk7lTk69J3BotY67TvroM+PBPzav3OibUuoCjNDtLVKPfeaZMcR0D+2sh5Der+b86
         kTj54VQ9e2fA6OlGDfg8brpWIOlP9L8mFysyOxEPVUNrzIXweIZzRR0AnwWKr/P/WZRj
         pJtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BaQp0eIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x205-20020a3763d6000000b006fa18244b2esi4473688qkb.116.2022.12.19.15.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 15:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BaQp0eIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7Q1z-0001cd-9p; Mon, 19 Dec 2022 18:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q1w-0001bn-Si
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 18:58:48 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q1t-0004Ek-Nf
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 18:58:48 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so10432122pjd.5
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 15:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t+k/NhiFIh+gR8/EesxpWW635Fq7o7eqjFkNqGQtSx0=;
 b=BaQp0eIOIytJFN6F4AL01tXQirX+vitI/HnJP7Nv5rCE5xvPjuVffvNtdqnYkF64zM
 Z6GQzB7SLn6pOfNRXUqDjGLDRxFeZI9T8EM+2bfbiJkqamfWobzIWcya91PTX7VP0dXv
 j9SPgjnUgnroqbUhLNhhlYPYKFLbVoq2XrWQLXEbwJqADEVReut3eftWXOj5OK00XbE0
 fqVwl32ZMQx084NobrEp6QEdtCJTDJEknE3R3Ktih6d7nMYEcdsyQsXS1C6BmJ0xHI3J
 95PEy2uvuvZKUFb8ekeGdpiyY71FDskDMbZ22s9ZcXaGV+w1IUPRw7XnLqknYA5Q7al0
 TK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t+k/NhiFIh+gR8/EesxpWW635Fq7o7eqjFkNqGQtSx0=;
 b=ZnEMgHCCM9CCABYRqZSY7HyxxDIKwZs9GMfl9yiMk1JfNhmR1/CKywtEXp1SH85F0v
 DTP/5VQdMJcOkbQ6VveO8aI+TUmDdBGFDhMPCH330h4wG5PszXjPSld9uTHLgt1DkTjy
 VYHSEBLEIjDjVTV5hYo0GVMaJXrQdTNT+9iolkejYjlGWAjOsUei2EENZ2BycMYVXF2q
 tECh1KOrlTPmyVUVHoDnBYUwhqT14jsAe33u3u+R9AKCeZ5T2NSuVbZC/YYvQqbwnyY+
 Ld5BGgxLEjmCkeLMSDtFBetqiLRoa3KYYyX9zxnyAftA/ppy5a5quSPtWbEcWqqjqNww
 QUEQ==
X-Gm-Message-State: ANoB5pkmg6AHGiLMsnQ/MngOpmhwbSYQ256xvDunIJqrkGid3jxXmaOB
 SWQrTx+Z9N8c3DCFGMNYmTcbZw==
X-Received: by 2002:a17:902:7890:b0:188:fc0c:cdb1 with SMTP id
 q16-20020a170902789000b00188fc0ccdb1mr42551696pll.16.1671494324351; 
 Mon, 19 Dec 2022 15:58:44 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b0018980f14940sm7748687plg.178.2022.12.19.15.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 15:58:43 -0800 (PST)
Message-ID: <37aa5893-765e-99bc-e4e7-ff0d4197d9c7@linaro.org>
Date: Mon, 19 Dec 2022 15:58:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] target/mips: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219211034.70491-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219211034.70491-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-TUID: vY8X+uVuoU4n

On 12/19/22 13:10, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Extract the QMP functions from cpu.c (which is always compiled) to
> the new 'sysemu/monitor.c' unit (which is only compiled when system
> emulation is selected).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/mips/cpu.c              | 29 -------------------------
>   target/mips/sysemu/meson.build |  1 +
>   target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++++++++++++++++++
>   3 files changed, 40 insertions(+), 29 deletions(-)
>   create mode 100644 target/mips/sysemu/monitor.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
