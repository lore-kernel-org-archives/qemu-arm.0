Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3228649lfg;
        Sun, 28 Feb 2021 19:51:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhSpluyT38TJ4foBFncb6NMxJDhI1/TMj+CDQ4L/8hYzo75i3l/qzBR1FMcTVMngndhYRu
X-Received: by 2002:a02:ce8d:: with SMTP id y13mr12085574jaq.29.1614570684749;
        Sun, 28 Feb 2021 19:51:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614570684; cv=none;
        d=google.com; s=arc-20160816;
        b=mporcjBNgZ4cTtkEDoRsBKmwdMimqFH6N3YFilmxoX9lQZ6VIlODEPwuyaVQuKGxqA
         8wyipktq53LJgQQEnlD/pvy+UpM3LwTASujaLRnbqXPGb4apq6J+GkLw+S7EGutq0Tu5
         UFKiKqCmoks6VEBWk2aIBvgctbgu9kFJO3LFSZm95wMvfibuuegGQlUfNOi94HDpbTwX
         z27YpQAPAnZxJQh2MhJ8lGw8ITXXPu+Nw5By6iTGkIgzSPlaKp0qy+wiLtXOcM8ZIdpz
         GE8ZVj0K5b8aLvOSC3bkNfiiipqGrInepVSVLJgTOo5BQVrXd5my+MI5cqdY8Y4avQSY
         ERXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CMgho6Lx0VG0Xe2KWf/8U1e85degQBAppXy34xmLOpM=;
        b=lvTWL47KYTgWggxZ2lCkNiX62N8Yi2aDx+pCfoEWB62gCQY2oph5rpUwxkPHh11rMf
         IY/3eLkfGvoFM3ugJEi0XmO+MTSpa/Y0tCa6zkd6jnRNRjR8g1Zv4YtXddntDq3crPZ1
         eKUuCkF6/Rwi7H+YOsdyGWsFVPBlopIpzLZKvmjhLEWZva8sCsB529p4zc7DikeV6rsJ
         rGwjEwIeIIjRNTTpZqYmbsEj3Uxza394p8RBVv8eLfEodyPh/ON275txUxXdi97fb44v
         rUCc+5j7Ol/H99qnconOaBwx9sRqcdYwpIjcGR7Xq0syog+hYa7JisbnFOHScLMRunRk
         GbOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6TZNuiF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j26si14237128ioo.95.2021.02.28.19.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 19:51:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6TZNuiF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGZae-0004eO-3g
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 22:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZaX-0004eA-5c
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:51:17 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZaV-000156-AW
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:51:16 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s7so1847046plg.5
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 19:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CMgho6Lx0VG0Xe2KWf/8U1e85degQBAppXy34xmLOpM=;
 b=e6TZNuiFLw+y6jM8ji8JBmt2fgmGBPAWBpfrINz5CpsmxO056EEte5UzdfZbLtSNcV
 Vvpw4l4q025bZBhuq0UGCAexv17vg+N3qsV0Kg6oPs95biiHNCNanj6KbdHmMlumDpUY
 VCMWjRp+XHwDazxQ7yljKERuqVuprPdqQ6olaPUK1w9KHDmG+KSF+b3smeoQBoV3zsIg
 T8Ffk6rSfntOzI0GuWQa2mZzfB92i3eI7Sgn7+gV1BeCsC55lbipziga7fQQQiCHCQWf
 iO88v51EWTXghHlT0Im4XkjVbcl9iso9As9Kj/8nv/PgPqgL2/Ye0QlMv3r3TWnjnMSX
 J/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CMgho6Lx0VG0Xe2KWf/8U1e85degQBAppXy34xmLOpM=;
 b=OMLMZHlzxoAD6AuxZbKh28vC7IMXsu0a/oogdv/CBzp9/2MnMwjmQQe+FxPCTVFyKO
 YZdMrBJEiFs8ZphUzS1pj8WoJ6v9fNZplYYtuNJezLbBGDnHRR5GTGbPuQuOYAa6mrOC
 NNgB1WmeofctTZFtILlIYsRDEnh+zi1x9IPT4q0YbVbIE9UhdLKPB2cTYIvgOrm97zSV
 XHKLIu/6nEJRPsr68qivU8lq3L15glW2gyhSE6+/widk2wAYKtPKmQ9SlUB51pxK8wpe
 4eVRnCNWjMtGnZlKvXPoXUp5xqUJUft0U5V739s0OeogkkAP0QLVTzf2e9A4N8Q/pFEu
 pUMg==
X-Gm-Message-State: AOAM532VEz9zIYg2YisAy6+CG9n1kUhcyJjLlQlOLBCVInAAGi/sCfHN
 1cvZJPHU15VoAxVwGPMEH3RnGg==
X-Received: by 2002:a17:903:30cd:b029:e4:93b5:3547 with SMTP id
 s13-20020a17090330cdb02900e493b53547mr7073414plc.53.1614570673787; 
 Sun, 28 Feb 2021 19:51:13 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id k16sm8611557pfp.161.2021.02.28.19.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:51:13 -0800 (PST)
Subject: Re: [PATCH v2 12/24] hw/arm/mps2-tz: Allow PPCPortInfo structures to
 specify device interrupts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <601fc757-eee9-723b-bad9-d8c28213faca@linaro.org>
Date: Sun, 28 Feb 2021 19:51:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0MY2kKd3drZk

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The mps2-tz code uses PPCPortInfo data structures to define what
> devices are present and how they are wired up.  Currently we use
> these to specify device types and addresses, but hard-code the
> interrupt line wiring in each make_* helper function.  This works for
> the two boards we have at the moment, but the AN524 has some devices
> with different interrupt assignments.
> 
> This commit adds the framework to allow PPCPortInfo structures to
> specify interrupt numbers.  We add an array of interrupt numbers to
> the PPCPortInfo struct, and pass it through to the make_* helpers.
> The following commit will change the make_* helpers over to using the
> framework.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 36 ++++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

