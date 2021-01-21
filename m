Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp256252lfb;
        Thu, 21 Jan 2021 13:32:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwPzg150qTBz4gYJTRy3+6dHrX/P7llmT6XbdB9XXoB7BNnsKGWN9KH1XJcWASEpGbHACX
X-Received: by 2002:a25:2606:: with SMTP id m6mr2005370ybm.213.1611264746720;
        Thu, 21 Jan 2021 13:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611264746; cv=none;
        d=google.com; s=arc-20160816;
        b=pWRaitIj9zSWl3isboR5QEwX9KgXWNR4kWqXYq3PaLV8OWy7lHceezSEsOeEnmr/Ci
         deotqB0Y0Zd6dMn8qQBaStU/5C5EAFVGwSajPE6AmJSSmKe7ueefG+DG6U1jqKEB+zUI
         Fn/lX2qc+Zl0C1g3PaiN/VJy/9Ohl4Sn8Zui4D2SOoYI+saXzN+1FIvPhHwRCGqOoa6j
         1Flozlk7zQKnEh0Em7+jC2qMu9Ff8m612uBufTrBXiCX70FfqZGNuukWupBO1N9YbuZp
         hKKT2AlS/Stvn1+5pIHU4fjElkGIW7JmJl9TE/9zbJcj8WMzMX6rF2UY2MzknaHjAgeV
         5fDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sXZlqrgkOFwHCKdSvPskOVNqifgwnVfhLMXVsd1Xjlo=;
        b=RWAwcFqPcIopHNPxsogGRvrrdr1+erm/d61tET+nDk/BsMswbqyKtVlh9HrxjKWj3P
         +DoO/oCXSFAnsKMQxqJFR01ffA7ojHLFuBX5Fi9x+MPi5TY2bfCXbTnPOOa2Q6e7z6K1
         xXN288MdNpO7UBpN1uc9dnNZbAP8nb9wLNGK3/CAeIAhQMbZ0j4lSasLaQOcm+k2h0Mk
         w6QaPFkYs5nw2Gkohv24eHEgvyys/k1/8w4V+mY8Ce2B0IumTpT6vtsPeP2+OrAzeIRF
         GYE/k0AxZEqea7+DydDAOESa75VC9hsxLJBSG6hkviIiY8JxtcuXm2vxbCBPiRBbW96J
         f6pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rOuJsSGU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j126si5689714ybb.41.2021.01.21.13.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 13:32:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rOuJsSGU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2hZ4-0000Ai-1J
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 16:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hXK-0007sQ-GV; Thu, 21 Jan 2021 16:30:38 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2hXJ-0002iJ-2U; Thu, 21 Jan 2021 16:30:38 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so4746196ejc.1;
 Thu, 21 Jan 2021 13:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sXZlqrgkOFwHCKdSvPskOVNqifgwnVfhLMXVsd1Xjlo=;
 b=rOuJsSGUcsHdMzADX0+UsSdjO2T7uDb81yV5kL1YK6t9K+el0uT6swta1LOSa5zBbz
 lRmp68Xl/0H+9kVFtCeU9BEy3Or3guUnqF1eOQslL50RQr6nlOivdF8QUiUrg2Zsbhgw
 +9TOHXTUa0IsFz0UcPA3XcuKSc7ROg7g5D/y7m3stvBUZmI+W20b9MuWJqg7KY+u/YZG
 BZgsIQAzK0yBaU3i7Z9LeH+ovGRGeVadr10PnpN6JjqCDq/E3h263Wa6JqN8PML1LkEf
 LvYUm/vLABqNLuRRhhvoxNZjsyuQlwkXe+gWJ3n2jYox9rLUnkOedW08HmrrKwCTl0Ys
 AjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sXZlqrgkOFwHCKdSvPskOVNqifgwnVfhLMXVsd1Xjlo=;
 b=uZxaOM9toYu8h07gOIeB6hOItkeLoy3F9PeSl47YYT7ea6clzIFoZkVX/gWMu1c+2u
 akUP0uVH/1ejc9qPsJb+0MwPicqnW2xmYUBOeiWcMqHuN0FXiU58DBC/csB6rudU125q
 3iOxPU12V7XNZtKLaBcyJlEADhlgYp4/Pz9sFUAiYNJ+niUM+JdNodUqaxYWY5XhyZEi
 BSmA0+FxDqXEHRHXmwd6WtGmOxihgDL5XIO0c0HlfAajqGBVItVMJDFzlfHVCNijUzM3
 POivgQqQ7zsrXCwiyoOF7Pd8cpQi51tAQ4SBfCzaQS7KO9qcxIMOXm4lj3+VGGZB/g1F
 avpA==
X-Gm-Message-State: AOAM5324rkdS/pXdV60jAvqP7QTFdiEGOKBFvk903O7WJaWhu7IMjCQ3
 4EgjrU3P25mlUk41ZDIwhKQ=
X-Received: by 2002:a17:907:d27:: with SMTP id
 gn39mr911811ejc.152.1611264635467; 
 Thu, 21 Jan 2021 13:30:35 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i26sm3482324eds.55.2021.01.21.13.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 13:30:34 -0800 (PST)
Subject: Re: [PATCH 14/25] hw/arm/mps2-tz: Create and connect ARMSSE Clocks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-15-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14467f6f-97c5-37e5-2371-118af184ca41@amsat.org>
Date: Thu, 21 Jan 2021 22:30:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
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
X-TUID: Znr8CVANs716

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Create and connect the two clocks needed by the ARMSSE.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

