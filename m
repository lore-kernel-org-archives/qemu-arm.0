Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp279399lfb;
        Thu, 21 Jan 2021 14:07:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGEllhnEMrO7Bk0KLR5bbGG2QH85h2JkYnApDxRRZnRqWlXbXNSDX5F3k0p2A8LXHhoxix
X-Received: by 2002:a25:b685:: with SMTP id s5mr2095943ybj.264.1611266862381;
        Thu, 21 Jan 2021 14:07:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611266862; cv=none;
        d=google.com; s=arc-20160816;
        b=zi3eUYsbnO8oTSQMS/w59nFiLCTw+xUjzMKrxfmmbSRegUZtNDhgyFMdXHzrqqd/Lf
         eRRXNxcBEzX/CFZXTURC/z2o9e5NZgJhxg5tB0e5657oDVHt1f1YVB5FBCG8kLxV4NRz
         1VIn4dHvAbM+KK01HcNyxB788r0mGaw05oi8uzeOMbhcqnodVj7w+4XwKIN0iatgMiqO
         cFru+P4BiywZFGHPGqkWZUZRqG0nRxSQxYRzmE148kdaxfVOgSFMpd8gWs6R7mDF79sj
         p6aj87yRq4MoQHxaIsGDOtpm8AYBokopD+mIzXdEMUd67WxJDaQN5DmJOmh64NRuTKrN
         bL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ePNJAgxjaVPgOhZLR3Q/I8O50UumMpXbnpxBGQ2QcF4=;
        b=NJTzo9Nf6fr6CAfIDIoR34tH+kGQGaFUxUIJosSpwsTuCbNtV/JGl0NjpF60KLqo2M
         /dJZ5vlvcBEpTTqkvuxl1/JKralFqPF9vBsz78ltW52D/6xBklDLn7OoITWomk0hWWZw
         hw8cHAlyWcpoxjVlpjDBTbdigNBjqFqc7yTi5c0dXJ98yM34JdR2x04XL76sEwyTyWt1
         WoBXTx9nGZryat7tlss3+QRIdSGo8wbNScpPainyd13KwIAc1ILh9m/w4kk0O5/h8BjB
         XHk0KkSMM1SyNnHUE824trnKopW2MlnX3kaE5XDBLhAb/4aseUcphERb6atxrObBHbXb
         4wUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ca7ry6l6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f135si5447678yba.103.2021.01.21.14.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 14:07:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ca7ry6l6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2i7B-00041Z-Q9
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 17:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i5X-0002v5-G7; Thu, 21 Jan 2021 17:05:59 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i5U-0007I2-Fd; Thu, 21 Jan 2021 17:05:57 -0500
Received: by mail-ej1-x62e.google.com with SMTP id rv9so4806193ejb.13;
 Thu, 21 Jan 2021 14:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ePNJAgxjaVPgOhZLR3Q/I8O50UumMpXbnpxBGQ2QcF4=;
 b=ca7ry6l6abY3ogQXSglhpriwAlgojeaO8qDN/TKtGTVMptaCy5bmQYDouN/syCkt5B
 s8Fo3QiIIj+VUyotyyfWBDaT4uORx/gxXCntGdeuDByRK9vbdxipLUGgSTwsW/wn7dfn
 mZnPs08xgnnsVwFhmptrEaMXnkjQ4uIdZnnuni02Gp3UOh/5SJL9OaVJE9eHQSM66G16
 vqULV0QEOMuF2DevbR1VLS70OARJtu1fmm7pB2SX3xCw/GJ+kiOIfjeR/A4dVmLJ0X4Z
 RPSKsN8DT5uD8aL8rp5WtabKcaTnDWfTdwy2SYk25SIDJfYWwSGtvcP06ac3K68hFQYC
 cfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ePNJAgxjaVPgOhZLR3Q/I8O50UumMpXbnpxBGQ2QcF4=;
 b=Nqq8aGVsY7Qdc0Rxe3tgc2ZE8cKKgCcbaYyfpxqCdXHIfFAvysu/N3pmVNex0FNmpG
 y5EPYzbuAyGGa4ZvItbS5hJ5f3EhpLLGPDNQQzltcksXhj10gH59+GhoAA3jw2oIX73g
 lQUVqctiUM5hGvEHWBpsAwe68B73C4Z/MDaVrEHLoPi4CoVtKhOtm7ZiiiZ7f6w44U0n
 PmXhx4CJKGE0zWVEPHiDC4h2ywICbHftEAPQNcY5fPB8PvmCCQnwDeFJGolc/0RsyLIl
 gJdeIKTxaz9MX9asPZX0A3MGK6Ve+WCDTHdqbxO10CwanllK6OfpZP3O4EMA272e0tt9
 jjHA==
X-Gm-Message-State: AOAM533sIRj2/3i6WTSXmyVfVjJI45SvLv4Aik4lBhWdzgY5ZqPPL4HY
 L6rNDcrO2kh9GQVI0batvDE=
X-Received: by 2002:a17:906:a1c5:: with SMTP id
 bx5mr1059378ejb.284.1611266754789; 
 Thu, 21 Jan 2021 14:05:54 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id ke7sm2863264ejc.7.2021.01.21.14.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:05:54 -0800 (PST)
Subject: Re: [PATCH 22/25] hw/arm/armsse: Use Clock to set system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-23-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b358a1c5-add4-5646-4053-8db5ae0e0c99@amsat.org>
Date: Thu, 21 Jan 2021 23:05:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hmQdsDdwxLb

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Use the MAINCLK Clock input to set the system_clock_scale variable
> rather than using the mainclk_frq property.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> At some point we should make the SysTick take a Clock itself so
> that we can get rid of the system_clock_scale global entirely.
> (In fact we want two Clocks: one that is the CPU clock and one
> for the 'external reference clock' whose period is currently
> hardcoded at 1000ns in systick_scale()...)
> ---
>  hw/arm/armsse.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
