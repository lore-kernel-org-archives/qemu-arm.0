Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1607229lfb;
        Tue, 22 Mar 2022 07:58:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGnRQAHG6uCQHgZZHjPEfjPmBNGDr8jHYlYrO7uqpHXrXSGi/dMt4+8vfDUR5s8qVdZqQf
X-Received: by 2002:a05:622a:1315:b0:2e2:2952:11b8 with SMTP id v21-20020a05622a131500b002e2295211b8mr1011760qtk.244.1647961127722;
        Tue, 22 Mar 2022 07:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647961127; cv=none;
        d=google.com; s=arc-20160816;
        b=lREwdvYhxgpBDKnznREXRuUGVBbqXxCfu1aDXy6Y9auXv/zW63S8RA7KAPpMuHsHve
         3RFVKMpg72w1Tc2cGS4qon2DvLK753lLioD6t7bfI1dn0P8MH10aY6924ulx3JBTxaHU
         eFkj5qRbUHY+j04iOE+IkFUvi+tWygDllSsdq5aNyQaj22Bvcg7ekI51gW69KT0Rmjt9
         JghFhotC18VNOQkMZzKAfd0mdWuHAKFL9O6B92645d3GlqKA/UJnF4vKyWpiOHeZUNxq
         m/AZvykE0p9SDBqhfRDcn5sv+yl8emMXaqKkr3pu7wkdTyZAnu9duwpS2IYvX2T4bd2/
         plxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=HLzo9QcSnalNkQ7QlQrfCuIheR8vLZRH/gf27axdlBA=;
        b=rBcNc4tAaNBdOOlQMViqlg0tab0nOVOcTan/WIT0welsx0ToL7VcVpeEIF9TCVGHN4
         ZYeRVEoJT5nY0TweFS+ek1b0HHwsIglSZA40rmdS1vibQuM40Ifnvl05h6koMBtRIlFV
         P1WPMzUyXMFtis/nbop2NywzgfNTY/zm6mj4uVOusMA0QVnPW1wZLEf7BA2PE1gVDYjL
         WaIOhsQNc28wp12SPBDfrBrGIm3GbKZ48YtzziSz6HZzWwl15FpFDQ4LqaAzSMUpSYk6
         O3U/qF6LXvDw3Rse4Gx/lxwR9JLJbdCABRsFI8s8hJEU11J12IWGDf8AoKBB7/Fgf0Ar
         aumQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cCYWGm1H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020a056214070600b00440e46a7c22si2968742qvz.192.2022.03.22.07.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Mar 2022 07:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cCYWGm1H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWfyB-0005sV-8M
	for alex.bennee@linaro.org; Tue, 22 Mar 2022 10:58:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWfxt-0005rH-4W
 for qemu-arm@nongnu.org; Tue, 22 Mar 2022 10:58:29 -0400
Received: from [2607:f8b0:4864:20::1034] (port=56011
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWfxq-0002P5-Vv
 for qemu-arm@nongnu.org; Tue, 22 Mar 2022 10:58:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id jx9so2005403pjb.5
 for <qemu-arm@nongnu.org>; Tue, 22 Mar 2022 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=HLzo9QcSnalNkQ7QlQrfCuIheR8vLZRH/gf27axdlBA=;
 b=cCYWGm1HLfwwUiG2/wHPp08XdWYypJNVABtZ4dzzf0x3lY/D58BcMksBZqxE19Eic+
 sXzdLH5aPLKueXc3AG7x77UWCzl3pW8c3BNdVXmCT0M55JBcwfPznxr5J9bIY8zMdZSi
 hAHOYHEtLN0uDLB1lL7ALB38YDQ8j0jCp7+CbmpXmRJJ5NJ69MpuSbhRODOlg0vLOWyF
 pgSH/75jhFFigM0IIu3nKm7xZ4c65XVgjjjICpRzmL43VkIqQUN63gQYggpuccJMkqcK
 Aa/75TmrLqrLoIMSLWurRZLSkKaCOKKyCgWzvc1D2pzhi58K0L0tZ8/JPFiK5qXlFasV
 HeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HLzo9QcSnalNkQ7QlQrfCuIheR8vLZRH/gf27axdlBA=;
 b=Bm9PQrjoSazAukUE98HhXJ7xypMQyEwrifT5gscHpIEwc2sDgxplMaBl9inAzpA1Mh
 v8kH/p+HZg9pXV5WGM7MoTF3tON0BZNHy2d3DN8oiCmp+ODX9fJ7Gi7cqrafqSsCllNx
 KI/NMSTbot0WZoTSCS6T7gJrL1QgyKteo3fvlQxvbIs483S6SP3qgxivRFJSDoUevbM9
 JScM+fFr+MP/JK1tnEy2wL11J9oK67BUNpW5AoK5FNwOyQZmIPPd2Xj0q/s2+icnSChz
 ybW7MjwAFFxn7wXHQIin+fCVB84ZlJa8kLgVYTNH/0CEOh01R4YmmRu6mv2c+FlYvinH
 9iPw==
X-Gm-Message-State: AOAM530hvJKSkxtnz/xAqjMNI58UFctuUlVHa0nOi/hDFY5ACu0gaNNq
 QC/d0UgOrPQYH4s8TcEjGxS9bg==
X-Received: by 2002:a17:903:204a:b0:153:a38b:977e with SMTP id
 q10-20020a170903204a00b00153a38b977emr18582817pla.126.1647961104782; 
 Tue, 22 Mar 2022 07:58:24 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a056a00188f00b004f7675962d5sm26276229pfh.175.2022.03.22.07.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:58:24 -0700 (PDT)
Message-ID: <dab530d9-53d2-3d7d-c9ac-44906ba9b386@linaro.org>
Date: Tue, 22 Mar 2022 07:58:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.0] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220322102824.3474956-1-peter.maydell@linaro.org>
 <afdadedc-1d35-068b-ccde-12897f9bea34@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <afdadedc-1d35-068b-ccde-12897f9bea34@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E2VnC/+jhmOm

On 3/22/22 03:38, Philippe Mathieu-Daudé wrote:
> On 22/3/22 11:28, Peter Maydell wrote:
>> In commit 84d43d2e82da we rearranged the logging of errors in
>> process_mapc(), and inadvertently dropped the trailing newlines
>> from the log messages. Restore them.
>>
>> Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/intc/arm_gicv3_its.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
>> index b96b874afdf..d9c741f5fdd 100644
>> --- a/hw/intc/arm_gicv3_its.c
>> +++ b/hw/intc/arm_gicv3_its.c
>> @@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t 
>> *cmdpkt)
>>       trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
>>       if (icid >= s->ct.num_entries) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d\n", icid);
> 
> (pre-existing: "%u" format, since icid is uint32_t)

Worse than that: 0x%d is going to be *very* misleading.
Should fix to 0x%x right away.


r~
