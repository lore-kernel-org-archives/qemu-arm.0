Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6547254lfc;
        Tue, 16 Feb 2021 07:14:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze1AUp5S641jYXB4SkmNCvE7wigFTt6cNK3ivcNyLqYZyWTWrGRPF96UrdxDxDn3QO/LyR
X-Received: by 2002:a25:b992:: with SMTP id r18mr31446972ybg.86.1613488460446;
        Tue, 16 Feb 2021 07:14:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613488460; cv=none;
        d=google.com; s=arc-20160816;
        b=zuSp87pCmgycItXAAmOMfTBusFRmhyPGUH5IkjVWDU4B5VMOe0i7pFnVY8EhXQ0vju
         i6My/1dUyv2O0CYOsUAdpSeJhEBVzQz/Yz12Z2lU+CHzka6Eiot5vT5btMPzkhsPxd1S
         rHBpAZBYfdtMGux5Y+j/E0NnlUl/btib4D6HS1ReEoNcp79FZFMoEGlbpa4aLFsQAB4d
         ldkLkzkccdLkjr+LLv+rm1/2SKm7o0WWXCQYsUyiNGSI47KsH/rIld8IuJPrLaKIjK7G
         XOrOoZhrjlJbuQCWLnxTj9Zz985DCh6Cn0Uk4X47xISvTknNeSsL7PttmdV4EmNW6tXy
         /Ttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9U+8kdwOD6jV5PolfEGw5egJMdW4GUNPrLCIJReKgmY=;
        b=UUpOhTXO1tecDNd5/I2ijKmqfywnudjduZCdhKPOV/2F0CAJHphkK60tncSj2TITN1
         l3ocDS71GRWVnLQ4eyulu7eDbVQSSf1AZB89DeJ9WN9WlFXjD99484wA69tHkB6j2Qfc
         TjnACHooDlQ83GfeXGywy/aXxs0NF0gpLnhTr6sy3m6ISd7e6cJhGgp6SR4dBzMkNJhj
         1UAdfjJ5eNDEqIRZYWk6MZes+qHSmbSELJgiRSxa7MGVtlMOgl3Q1P8k1hZOQTnxuA+D
         wUhEjBbUzamMdfRKC/DO5BWUEpboPD/RG6aNlB49c13RUBZG0VgTCSe9UV3dgwQnzrMa
         Xdsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kmzWtwaC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z63si1694501ybh.300.2021.02.16.07.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 07:14:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kmzWtwaC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC23P-0008Ba-GS
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 10:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC21o-00071L-ES; Tue, 16 Feb 2021 10:12:40 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC21m-0007GP-Ej; Tue, 16 Feb 2021 10:12:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id n4so10518425wrx.1;
 Tue, 16 Feb 2021 07:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9U+8kdwOD6jV5PolfEGw5egJMdW4GUNPrLCIJReKgmY=;
 b=kmzWtwaCmJSj2+CGDx65X3SMM9dCfvW7mz39dAybttoiiC8Jg3R2qtO3094YEBRqiq
 1r7gjtAHpxWv7I8XkStcofN8td6ZISxuASd1J6hAnFutkS4dEjYLvqFue1Yc94s8TALa
 IdXcQGxQmNHXJ4TUBmvFyvvB0ACl0cWc3pvOVwbsNZDJAiobHHchRba6ES6IJMjFtFeu
 EADbZLG8WljmAZ3P8I3G71jHPBIdgEBxtDdnRSvJZNYS0xIPMCsd76IWN7VKt2S4FMYG
 yMCd8s96GDFXAc7rEhqDdFgEuLtwiFH9I08hxJ5pnRZJUhNx4LrHhbl0k+9Hk0BTcro9
 HvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9U+8kdwOD6jV5PolfEGw5egJMdW4GUNPrLCIJReKgmY=;
 b=KGdkPDL6yISAbO1v35VBmQaGmN/d6K4C8MSXPnHXAnGL0/L3fOTsqjtXqWX9CNpxWH
 OEFnRy8dZBx6KRbgke/jrTH7nCdwZvoqmLJdoV5cRIO2i63Zw+V5R8WaPOZztNRK/UYB
 uGqT2Il+gzDVNnp1ItaSCLFKXbsIUzRkVfGPe5ZoNoRLSww5zsHQrS4x/X4J9xfYRGfr
 eNSP0a/2+XhlV1ObeU0iWkv7Ccq13RB9ooQ5h72LeA9BeDz8SbSCe8CrH2CIOLBzBWh0
 KZwL8R4VuwR+Kj2/82YSv7PTGH+azCGw1YMt8fH0IMjYqJAuUeYW1D9oGma12imcoXpX
 ob6A==
X-Gm-Message-State: AOAM5329dr1MswZsBf3stj3ZfIYC+MwTWlQbDD3JeH4XynXgfPzYfb8h
 UCystNm52SHssgUB5gvu9V7rOlfdCZg=
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr24389634wrw.195.1613488355876; 
 Tue, 16 Feb 2021 07:12:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm4027994wmf.15.2021.02.16.07.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:12:35 -0800 (PST)
Subject: Re: [PATCH v3 2/2] sbsa-ref: add 'max' to list of allowed cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
References: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
 <20210216150122.3830863-3-marcin.juszkiewicz@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97fdcf07-9394-fb8d-4875-9aed09ce7fa8@amsat.org>
Date: Tue, 16 Feb 2021 16:12:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150122.3830863-3-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dIW9NmqBMVT6

On 2/16/21 4:01 PM, Marcin Juszkiewicz wrote:
> Let add 'max' cpu while work goes on adding newer CPU types than
> Cortex-A72. This allows us to check SVE etc support.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Acked-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/arm/sbsa-ref.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

