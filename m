Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3162475lfm;
        Mon, 13 Jul 2020 03:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz2TZUS6nZe0nTibXA9NbqFTMdEh1wtMVuh4TSFYoOqkWPuZ02QpsnBMdyXNz06AwsraW0
X-Received: by 2002:a25:24b:: with SMTP id 72mr73664067ybc.12.1594637394930;
        Mon, 13 Jul 2020 03:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594637394; cv=none;
        d=google.com; s=arc-20160816;
        b=euzc86OLLvbRLcC3XZXkZ78SpbiZpv6f7r2E+qiHt9mzHmEpeQpGv9u2pDfk/PJOd3
         42xIiI+ps/6l5OFwzCSUpdcIr1ZdOpRn/FoBm08p5FtT6gGqM8BZlD9R1leLaNxlJKme
         ek1h/tCvUvVnsPa4YQ02fXp3QeJaOcMO4Gg/mUYn7aOcWiynepaCOujcwlb9PdQynzZV
         X12fR1vYdfIFVDhXOrUENsSEBzLSd0ZgA0G4ZNq1mTN2uzAwNA5ZUVoFBuWOSLP1bjjY
         XEpL0GEhFJ0XLrV2xsleX0osrB48mEpc1Iph86XrT3E7WdN/HJTWqwECN156yN1x0b8U
         KiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qyfulBN7tvoM1TB0fyltT8mEXlDdTpFUm/IpHlk7F0A=;
        b=vWrFv2J62MPmemx2QWeS46bxYo6qLKIfqAl//ilXo/hbyi6Yr1NebmW1nEqvT0KvPQ
         S+N8lXNwN1WAnUDs2g6gPtU5IFg36TCxg3fhke4FfKucWDaoCuLRWurL7Do8cyc9zbEw
         L0KegptSwtJapcg0azW3iJDyCXPOTKbf9XFLwqu2ZDbWEprNa0eM++4hvGs5taOPsmfF
         6dOVfJ6ksiyl5JnmpV+SDkU1qiMvk5Qy0foTVIpzuvWZr4FPkmfjxOos7eCbAgsG8O8K
         0E4Y8LMrH2s2FwdB2XntEmRF43o71eGvqZ2WAnpEtRtS6Oy46M6lhw5EL1bpISj+Ygqy
         E2JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="GPy/r4pw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c84si1193126yba.7.2020.07.13.03.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 03:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="GPy/r4pw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juw1x-00044y-9y
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 06:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1juw1p-00044Y-PH; Mon, 13 Jul 2020 06:49:45 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1juw1o-0002sL-Ee; Mon, 13 Jul 2020 06:49:45 -0400
Received: by mail-ej1-x641.google.com with SMTP id lx13so16389569ejb.4;
 Mon, 13 Jul 2020 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qyfulBN7tvoM1TB0fyltT8mEXlDdTpFUm/IpHlk7F0A=;
 b=GPy/r4pwLV6ci8+bI8Dl78EfwzuxUOm/1GL6tf9v7rhqQAH65BIIhSdrgAjiplz7cv
 K6Vg6lD/VAJzwslFiTSLub4/e9gYZYDUJpeFFrI+mM+oiynsxCFxvLZGurUBwFhn7upt
 9MXvNPXImMAm9VjKTbbNN6vjJSOrlg8WTOuQdFaZOPPcoSBsODAARO2cnJfE0kfPLRA0
 nfyzwoFUgtnhFeMyKq02oGjw9of89Ud+JCeblnSDp8mXvCa9u0DxO7pkns9/+ms2BNUT
 gYuFGQpAqYniZJtZHKOmWcbURhLmpd9r+AsdkaQGjiNZOW9+83ZBABRQHWgRjWNmSXB3
 TLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qyfulBN7tvoM1TB0fyltT8mEXlDdTpFUm/IpHlk7F0A=;
 b=nRdALRRRG/ORtrWhrSSAsGcUOq0UrhK6VW2rlb9OqIIho4L7QOu5TGRyJCFA4I+Tso
 W5xuLipUn3HezIbne4v7+yzPCYXAbnqY7KWX5DcxoFDpe+iQhVvr/f+C4eM91ypyuHyT
 65lIUQPo8j+2X2KnrKc4WlFbizra9ME2h4BDEJUNbyqrEJ6rL24FnFOSGWryTpDqHm9+
 vdyp5lAbDLrq+dKFBc25je9MKTN4OAE6CJZdxz/Bi5NUQIrreaZMDmMKpDUa03yuGqER
 dPrDcLkwun8DPk0VlzBm+KHloNG7NybQhETxeWCty2n7hoSgXLDvmD9mWEE6mTym8eIC
 NxQw==
X-Gm-Message-State: AOAM532Bb/nfMLDbCEfBPj/4NENsKMV5UDODkea8hG0ETxznudrH6kt9
 QTzZY08VNa73plWDZbzJQ8bBkTk5MNs=
X-Received: by 2002:a17:906:a84d:: with SMTP id
 dx13mr64907213ejb.246.1594637382437; 
 Mon, 13 Jul 2020 03:49:42 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id u5sm9321472ejz.15.2020.07.13.03.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 03:49:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/arm/palm.c: Detabify
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200628214230.2592-1-peter.maydell@linaro.org>
 <20200628214230.2592-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4a786e25-fa1e-7268-1287-8cce8f367589@amsat.org>
Date: Mon, 13 Jul 2020 12:49:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200628214230.2592-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WPgXRPUFujpk

On 6/28/20 11:42 PM, Peter Maydell wrote:
> Remove hard-tabs from palm.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/palm.c | 64 +++++++++++++++++++++++++--------------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)

Using 'git-diff -w':
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
