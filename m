Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp504003lfg;
        Thu, 8 Jul 2021 09:57:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziuBwWaKyoGvCYpiCd4FXnkpbO1OJqG/7AgCjx8f+D7dGcnbZj/zrvXpp1/5VglDAPUy2g
X-Received: by 2002:ab0:5bc9:: with SMTP id z9mr27007190uae.16.1625763420267;
        Thu, 08 Jul 2021 09:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625763420; cv=none;
        d=google.com; s=arc-20160816;
        b=tqnmkkfz0T+RHELvbRfYymX6CHlqXp5H1QO1bKVe2AN7UNya0aFgSV7C6HeEovekKz
         alwOGakjoftmPI6cSktbH+ml1p+zgCvp0vVbJBp15fJIwzhTH0Uff4AxkxWhETzClwhd
         8Kfq3/hxFgg5ZhDfpO6Hz5Z1HLcwsn1JhjnSkdfHcdxe4OBCGpjF1SS9uzZoHTYPissY
         HZPI/m3wXYWVRqhAg75W3BSw8wdAYjFBTn6fqXZscEDN35sb2QE2Hy3d2zUv1PgNwHfj
         7y/55oP0y7fDUY0HGoUhFGZtELNnuRwlNRP0neSYF9E5SeP6Lv4u5a3Zi265z9ElDuYq
         lOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5kLWuL0Tj4Wxx+sgrfGzoimIIY7mOxQRdqHTGLcOp+8=;
        b=Q2qusx7sWMxXOyFnDYXE8e9P0wBO51E6govvopOVe58N1Dz56WYI7460g1dm4Ix0n3
         mDX6+yQacRtNJEUsHXDhw9XEBKewZM+KdJYjr8PrdMxSfFwbBR/BW7sRaH80BmGq/9yb
         b73zRRc4Emm4Td47ArOzRZpy/pXb6yweVhOsCnMChA/sjbUOpdotu4DtMgvOBAryJ/Er
         2CxnZz/pYFZa1QnHYP6YcIoHC4U/cWf3R3grScsqTFARrPP1QAcFrq/gymEeINz/qT+j
         JPU6zwauKdSTWgNe9dqfdWir4vHiUSILzoqDf47UXUFjck+bXMzeNYgA5O6wSczRHHs6
         jZxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Vv1k/Ns0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m62si2931399vsc.5.2021.07.08.09.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 09:57:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Vv1k/Ns0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1XKd-0003ol-JW
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 12:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Wid-0007Lq-8e
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 12:17:43 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WiY-0001jL-3a
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 12:17:42 -0400
Received: by mail-pg1-x529.google.com with SMTP id 62so6566273pgf.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5kLWuL0Tj4Wxx+sgrfGzoimIIY7mOxQRdqHTGLcOp+8=;
 b=Vv1k/Ns0nHXFC3mIL9c732XFHM1v7TV91cmfrQ8wEe62enZyHxqmksriZeaN5yYf7U
 eIYsM5n+TZgnjtP89jh70JqSIfsBLlNast2WYgTxdR9mdu3kISIiu3mPMxwQcTacjSk4
 v2R3vLHD4I0OARc0zmYEQRwhH0m/5DwnPP9G88OX+M74y+eZfFCmYa2hJdt6bM7dJHdO
 M5ZtVymxVPr/ttubrUurAUOkDpBHMcMg1/SZ5RjEMCyV+hnANUUCBcE+NlfUkmm5Kxiw
 rwShWfyNhUjrjjQfpRxJNFpVaj06+agh3kpLVceDg5ThokxirX6y0P/+yZ0L3G23ExWh
 dtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5kLWuL0Tj4Wxx+sgrfGzoimIIY7mOxQRdqHTGLcOp+8=;
 b=hy+loip+Td2n70aWkY+BSrm1FkgITg2btU35GNiEDqHC0QSs+1cDUPtjVWS8QODban
 tKPd103Z43fhO9/zxKV6vmIbkxm5DW62t8tKxU/diMrL+BAKHIIhfNYUS1lgey86jM2h
 REFQz8ctzZrzodf2LNt9E8llUH8aJ5JBDdarn7FYnKDM1gcWfIGUc5YxkMalY2A/BXcw
 mAzPWg5rfQKr15j5+3IgOLs5/VaE0exTaneW7E4JIMsvbG8fJ0oEOCTzGbr/jtDAoLM4
 CdZPKK00omPGM+60gJBtOzGJJwXVL0KSWpjwBmqXwd7NVQUnxMy3Hh9U1xDnUHuIbLAu
 TpeA==
X-Gm-Message-State: AOAM533ZMEyt5vela1fbT1BUiYi0n8M8ROIAu6jIvLxRQ/CcEPkSTMa5
 88jCTIs5MwFSG3qMwZZ+foaQQ0/P1Zfqmw==
X-Received: by 2002:a63:5156:: with SMTP id r22mr33542781pgl.264.1625761056528; 
 Thu, 08 Jul 2021 09:17:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g10sm9908263pji.10.2021.07.08.09.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:17:36 -0700 (PDT)
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
 <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
 <88562e08-3d6c-3224-5d84-67e3ffd3774b@linaro.org>
 <CAFEAcA8Xs0Ct6hDBAk-N7TVhb66dwv2EJudo83XzJ5dQn9k7VA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <589d27e5-58e5-6af2-dfd8-11130fdbc2d9@linaro.org>
Date: Thu, 8 Jul 2021 09:17:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Xs0Ct6hDBAk-N7TVhb66dwv2EJudo83XzJ5dQn9k7VA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fZg6W/OGvRV1

On 7/8/21 9:11 AM, Peter Maydell wrote:
>>> Why isn't it enough here just to set is_jmp to DISAS_NEXT ?
>>
>> You mean DISAS_TOO_MANY?  That would work, yes.
>> At the time I was just thinking of replacing one jump with another.
> 
> You've implicitly answered my question, which is that the main
> translator loop code treats DISAS_NEXT as "keep adding insns to
> the TB" :-)
> 
> It feels slightly like misuse to use DISAS_TOO_MANY, unless we
> renamed it to something like DISAS_END_TB (which is what it's
> actually doing).

Yeah, better naming would have been a good.  In this instance I think I chose an odd 
colour for the bike shed.

The problem with just DISAS_END_TB is that there are many ways to end a tb, with at least: 
(1) goto_tb next, (2) goto_ptr next, (3) exit_tb.  We wind up replicating these three 
across many of the targets, so it would be a really nice cleanup to standardize, and with 
good names.


r~

