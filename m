Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2789403lfm;
        Mon, 29 Jun 2020 01:49:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6wQoV0l1OobcgbsULpA/rJ28KWx+m6es16NWAlI3481+L7nJDF9FtIXk2RmXmJoLyWXbO
X-Received: by 2002:a25:2d24:: with SMTP id t36mr24745585ybt.426.1593420575298;
        Mon, 29 Jun 2020 01:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593420575; cv=none;
        d=google.com; s=arc-20160816;
        b=i9t2Z3qzU6PHgzjCGbi7T75L6PHuThJEaQQoV2P82NbDpxeKfQ4ba+6+pU9SvW0lAk
         BNZ4uJrOH7uHgjzVE8w/UxhcVcED3mvGc4VUVup1/xKtn4pcxw/9fhOBhNHQjiuqDM/2
         stPZrUrDOjWjnI1syyXSkhOcAEP66rTlHW4bXzGKqheNPogDkYJA7738/Bt7ntJdIjN5
         t8CHE2vgdVbV8aXS7LL7T0JsMsSIX7V6uslX/UFMQ2y4UMaQJc2A9QpFyW6D18blYMz5
         v4yKEdrR4Uw+ZqW0Oy0kROf9ubogm4AItX5SHFhKpT1YCAr08cGvUOGqdb8BUHlnXdFO
         gA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WCSzq2VykjhePinNV6eYWl2enEGW52iXVRVhf0PKJ8E=;
        b=opWk5HL+cB3DkQmRBZ4fUBecrMupcllibKRwg5cQdFu+XGi9YOkpatDszrubiVNfno
         o1sQmBBKFOyLDB2wrJI2XOvUYt6BPCfEljPMkDsstzb/2j6Gp5ye47zJGAy/LOPgcb83
         PGyHALpnoRqPvJ3rpNrafznl2EncLXrr7dgihmieNgXH5wmNBiF9KmiC3urAi11RIzAV
         v8gkYCPO2i5uPG2AwkbR1pqWJa9mv3QwCstx8n3ya/Da41TgFwDo1PMWnMOeV7DxAU8v
         6kNlgzjjMRuBm6+44/B1CTr8h9VwCEftCfWKKT0LVhB+cJISyOQJyfctFZSAZBVVbmH1
         DPeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oT9bGc1p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u126si32088772ybb.376.2020.06.29.01.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 01:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oT9bGc1p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jppTq-0003r4-Me
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 04:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jppTj-0003qo-Bn; Mon, 29 Jun 2020 04:49:27 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jppTi-00086y-1y; Mon, 29 Jun 2020 04:49:27 -0400
Received: by mail-wr1-x444.google.com with SMTP id h5so15659181wrc.7;
 Mon, 29 Jun 2020 01:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WCSzq2VykjhePinNV6eYWl2enEGW52iXVRVhf0PKJ8E=;
 b=oT9bGc1pDcKEQx85pR6AYO2VhKVuk9bl7zqG9GkpP4lTjqHkKsoRvW9rA9xbfwTPaH
 ikd2GEmjc4Is8+imtle8rgwRc25VQ+ggjY6W4vvjjki9cUCVwyhfZRupr7D6d/umkbSy
 MpJ4F0g8MZ5cVe7iPMZqd/L0LlKSUwPiWZfB89ZU2tn87kkjHG5lk2PPaw9Ezg2793fG
 96U0/7nJo9rfQn5+JMtdtlSaqBtFIdBF8eBx7yO6abKZ4fthCTyvnlE5J7NA5Z/CT6kJ
 7TgPa3UI4MxGgIx1cXOyPyu/8WXYEdnc5hqwJdYQlb1KuYPg+yQgm5s1lzQU6X9CnJbE
 U07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WCSzq2VykjhePinNV6eYWl2enEGW52iXVRVhf0PKJ8E=;
 b=CbyDJdpqY+kMPFd6qcLuKO7nPNFazAX4Bxhv5hTZRKwb7zTq8kpcZL89X4W9oDt2Ks
 XDp39eayjcH17DkrVrOZl7JsuzqSyH/zVdX1DQ8EjH+iMzvj27MA1lYOemvpd/yDxPkd
 FyzEW9IMjFpOarQ37V00b2gFyL/o3Np8bMzn8Ynije6grOzuEpRt7O54YTudNvVojRR8
 2CHnYZjyrUrtzdjoGgW5KObbAcW1CmQ7EMjLsRFNPJhu2rqNC4jws91wmiEDbqRZN5Rp
 xpugvluUi9ivMVFcSR6RtrmzTW9oCrFuBy96Gfa3kNn5G5kZDnQxNQE81b4ShBt309YJ
 1yng==
X-Gm-Message-State: AOAM531jtABUtIfwuSF8RFJfwuIKukJ4yyfu5hZfwEtRulOwhiWK5c23
 1Yc0sEUc9nnHSf2G6Ikuf5A=
X-Received: by 2002:a5d:658a:: with SMTP id q10mr11170185wru.220.1593420564164; 
 Mon, 29 Jun 2020 01:49:24 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r3sm16181629wmh.36.2020.06.29.01.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 01:49:23 -0700 (PDT)
Subject: Re: [PATCH 01/17] hw/arm/spitz: Detabify
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d9c6869e-6df4-c1cc-8078-bcfe2d5442cf@amsat.org>
Date: Mon, 29 Jun 2020 10:49:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200628142429.17111-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KnKlQDWbNxV5

On 6/28/20 4:24 PM, Peter Maydell wrote:
> The spitz board has been around a long time, and still has a fair number
> of hard-coded tab characters in it. We're about to do some work on
> this source file, so start out by expanding out the tabs.
> 
> This commit is a pure whitespace only change.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Couple of checkpatch errors due to the QUEUE_KEY macro which can
> be ignored as this is just a detabify.
> ---
>  hw/arm/spitz.c | 156 ++++++++++++++++++++++++-------------------------
>  1 file changed, 78 insertions(+), 78 deletions(-)

'git-diff -w' -> no change.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
