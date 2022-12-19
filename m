Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3906341ejb;
        Mon, 19 Dec 2022 15:59:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4XXvpEYt33l8OjToA9QtP3kamRALdOGcOeNHRXAehnjThxJjCa+SuvsRCkAhoug8ulDw0t
X-Received: by 2002:a05:6214:1872:b0:4c7:cf4:f424 with SMTP id eh18-20020a056214187200b004c70cf4f424mr49110611qvb.35.1671494399004;
        Mon, 19 Dec 2022 15:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671494398; cv=none;
        d=google.com; s=arc-20160816;
        b=x7x3N8BP1sbYD85gdA2wygWKtIpBiSqYHbDDhmKtUuL2PvNR8sYHPqRShhICtInnS3
         acZgLD8NUCd5+GC/JwL2KxIlLgXuk/8eg4XL79gOgm+cttKorqMi+qXMLevXba89vzvZ
         M2hiBzTZgFVPT+NLUD/MZCEvL3TuXWSwGKoB5KulMvJz8eLVuICVn5k++IlszO47ZKsJ
         OV5VcNUYZo6wiXq5r7fsOI/+D5sAeFn47SGxz23PYG6APIo0GmyyKgjNr09QibKc4K+W
         2QYISJ42/qPFKQ9v2G+B332yFOnbaGmeCvJnw0f3ybbG4rjPmhMLeQZ+6zMylfg2SKK5
         AJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p12dna6la/ZrjbjsGV+3pNrOH4aMS2qAiukyG+mK6Es=;
        b=obu0tbei3DuQ+m0KEf2sYYFEJhG5Blx40uWTyMZyJntuCtEupdwB/iReFU0E03AMTw
         36gAeSnMAEFEwW5KHN39mkQuMK+gUQMzhsgebqZaLtqhaTypq4asJUgKSQe0DNDHZVsC
         MrtHTDGchD9g/9kKzVP1qk8EW1VefJTYGrqbrXFNO18+khfaNspo/vLXWQT6IUlJ9BaJ
         7/qzRwDENUs04dPcah19zqeNozcuor9RUaOrD8+1y5X/x8T9M6dq3WsUThXe9pWTDD8e
         aGit6GX24WrHEmwrBB6Dt2pqfMdHpQguseyCQau5qNO1Z4k3wsVKt+zKmtytGy0fwcIq
         X25g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LI0wQAa2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if10-20020a0562141c4a00b004bba84b68f0si4572465qvb.131.2022.12.19.15.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 15:59:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LI0wQAa2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7Q2o-0002di-K6; Mon, 19 Dec 2022 18:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q2n-0002cs-5R
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 18:59:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q2l-0004Ir-JW
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 18:59:40 -0500
Received: by mail-pj1-x102d.google.com with SMTP id fy4so10759216pjb.0
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 15:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p12dna6la/ZrjbjsGV+3pNrOH4aMS2qAiukyG+mK6Es=;
 b=LI0wQAa2CB5cxZxTFcikKBnwumbK0QqfILI2RV6LHnNz73Pqzx4Vis4EFWWJpxYknG
 W+gDCqSi84Ij9ymmr+npnrD/Pm5/jytJiQC9nWhxMPaLVe85vtmQRU19MvxAipVif5QQ
 QLMnV+GILpqpvTPUXjllAYIZomXn8tsDWS/hZRXrXAYWovewkS0US93jc5dO8ZHT03zK
 XUT6Tcf25Bt7sZVP96R+KeWZlSUeGktqWwccH3jdYTJGA3WhpHE2KcrCuVSCJRS/U6c6
 b765OOOk5Y4Fxw7HyMT00g38GgqrA7Ea7u/MlQEg7xvfGDNCzJfC8KhGl6nQd9Qd8g2R
 gCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p12dna6la/ZrjbjsGV+3pNrOH4aMS2qAiukyG+mK6Es=;
 b=C4tKNw6z4GMVPeKasM4MfUUFCTipS363v1LYB90v5aWVaudOY6DHyG+nDS28coC9iG
 43joBai0brtPdTYUTgMqOIRhpnT+BgunUHOWfGtDFarwnCNLPSPujd8k9o61veyATvZm
 kEXFStTxVqSkeV+zyUnON5ImKcxmZw1Dm8T5qTiwMXBA5p8CquoM7u0x2NXoVq4i2+xL
 bTqKJQyAWfBT5F9vz6Rihlngy5B+ClFMf+NQe/rto/qH/pIDp253m41CWx4WdB52digO
 aHpVMBv3s1eflqopKv7K9WUyzt4WSlpLHvL9LzNYxiecNv6uXYbh2lJfr1nBnoV+PVK3
 csRw==
X-Gm-Message-State: AFqh2kqZj2xbU1ENyN31S9ODPBC6VYxaLn1JccdplaGUacvZxyYbiuMZ
 5XZbPjwT9VfYowlG+iaW/9e8rw==
X-Received: by 2002:a17:902:b781:b0:191:117e:25d with SMTP id
 e1-20020a170902b78100b00191117e025dmr10322071pls.19.1671494377843; 
 Mon, 19 Dec 2022 15:59:37 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 ix6-20020a170902f80600b00190cabbe35fsm7760135plb.98.2022.12.19.15.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 15:59:37 -0800 (PST)
Message-ID: <b1a814ff-c3d8-51f2-d0d0-d67dc53ac415@linaro.org>
Date: Mon, 19 Dec 2022 15:59:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] target/ppc: Restrict 'qapi-commands-machine.h' to
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
 <20221219211034.70491-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219211034.70491-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: nA9Uux/aq77I

On 12/19/22 13:10, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Move the QMP functions from cpu_init.c (which is always compiled) to
> monitor.c (which is only compiled when system-emulation is selected).
> Note ppc_cpu_class_by_name() is used by both file units, so we expose
> its prototype in "cpu-qom.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/ppc/cpu-qom.h  |  2 ++
>   target/ppc/cpu_init.c | 48 +----------------------------------------
>   target/ppc/monitor.c  | 50 ++++++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 52 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
