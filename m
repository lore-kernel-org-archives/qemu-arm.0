Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp356131lfq;
        Fri, 15 Jan 2021 07:25:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2UL4tDEASux9Qr+qY7UI8KcOG25PCmOG0R8FJCgTH4+baT78Ahg2hTR18KqMV6agbNQoB
X-Received: by 2002:a25:ce8f:: with SMTP id x137mr18628347ybe.439.1610724301736;
        Fri, 15 Jan 2021 07:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610724301; cv=none;
        d=google.com; s=arc-20160816;
        b=fjUeM4vK+ZBBUvPcksK+13zjHOCW+8gFgFy0ioxDurl15HHxuelwYxHI4/mSEBPMY9
         is8OmVXgocMqe7NOOHmyz5tcogGO9QeT8VTbIBDqsb/3CKiopEuTqPdPOxIDxmPOxEIj
         ssnh82szObWQKFD8sy9TgI88tCjQyqwMdgtOFV+KNTbJISTqVwiuljUcOce+LbJ6dpR9
         wWCSHk2LIBC91YSJbGRwHgFAGDIzwQgby19VF6cB48EZ9ucd2huFEnlGiFHc4fF67U7Z
         7sAfdFUnKGPsYp/QDJxh3xamoOXAlugb0tz+Nqo1K5ii5kovzaC54YB09aGt/XFgcpZ3
         kS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LLfoZnEhqqH7tIuWTVkeS30vFx9Vz628e63bkWRf8xg=;
        b=tKDQY6jk5BivM3mfcxIQs49ObEM29jAmeWH4+VYN/v1Q0M/KYiawj0LpfF2rDKx92H
         YZV+nk33t02HV7ah4tSzs2U+h6BsSMSixQQWi+5lHms+czD9RCjnURLsxFOebIKMmb5m
         cuEnnzBpmSJ4l5mVVBRxD0MJpggCXBAAmk7ULc36JykZCScz29lAJOSPCz2JAQyapp65
         VRGr2CvisKPsrqf/NR9t7H+z48evr4ShXg1pwG577IkUdOwf6tGuhPuzP1O9fE6X6/Pu
         gdbCFyqI8i2sR/0m9qxuaj/JeWQkQcNturYA9vqf1F5G9sBBAZKkM/hAERVWxuPW/i5G
         XBfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=llbJ2qKb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si9116586ybn.141.2021.01.15.07.25.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 07:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=llbJ2qKb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0QyD-0007pq-5H
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 10:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0Qxw-0007pP-8d; Fri, 15 Jan 2021 10:24:47 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0Qxu-0006cJ-Nl; Fri, 15 Jan 2021 10:24:44 -0500
Received: by mail-ej1-x632.google.com with SMTP id 6so13832475ejz.5;
 Fri, 15 Jan 2021 07:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LLfoZnEhqqH7tIuWTVkeS30vFx9Vz628e63bkWRf8xg=;
 b=llbJ2qKbIK7yx4NVf7/owD+CTGOrA1BHQYdKlXcZZIoPL3Do4Pn5Q+H+O4Gd7+GbzN
 pFDzs0D2RXrXPmoUQz2MRXIg4HZaeI1HF6HX39yZn54VmWbVP68R5Zc4wKjNRMavu1pd
 o7m5sQZ53va0zEJQcjGT184Tp8RB920kKYOWQ9h12uoPEOBhtnvRJ7LKmD06UUAsOpDf
 VaWtRyXRzO1D8GQjcs4D88Xnx76pFUtI/gTfFRup0E2TvlDuYFJFcozGSC0njd3d6i6I
 5JiUWnc7FQDCBRXmpnfrRYyObPqaz6hQhbBekF3QJ/5QeYq0WFtnYqyxjAbRmvUlotSc
 +l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LLfoZnEhqqH7tIuWTVkeS30vFx9Vz628e63bkWRf8xg=;
 b=omyVknqv6OQ0HJY7C0IudS0z0C9dvA491BDY5rWCimZ2t9ByF8K0zXsQEkF2zw/rNR
 XtF3pD/p5ZwTQcNqeny+qYnafX78S80JcRpw+BeDbNM1FI8GkMwjBFc499muE+RCkYeA
 IYZjzV4+rRHBPqgFYBHYwO+6nafLNuyK2wc6WOeq/0uXXar5QcpJL74FSWrMQtOX90te
 5V7ZwEurvCFH7xbSqZxhCLS+PKBE6zEYTKVyGorc7G1CZ1oIXVpw4H3FcvKFtlRXADsk
 l3JqJYlvsUPEbCl1Lt2Fd3gpZ6CSL84k436CSdaxQEOUsoJwPWPxRKbnGijjPdC1q3iG
 9n2g==
X-Gm-Message-State: AOAM533SSisR/G+It8xG9eDbf8IpAaex6yLGtRcrywnGDlcjtu1H+wGv
 uBYpKIX79olzKbSLNH33X/s=
X-Received: by 2002:a17:906:ce51:: with SMTP id
 se17mr9059210ejb.314.1610724280497; 
 Fri, 15 Jan 2021 07:24:40 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q20sm3701495eju.1.2021.01.15.07.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 07:24:39 -0800 (PST)
Subject: Re: [RFC PATCH v6 04/11] hw/ssi: imx_spi: Reduce 'change_mask'
 variable scope
To: quintela@redhat.com
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-5-f4bug@amsat.org> <87im81gdig.fsf@secure.mitica>
 <875z41gd8c.fsf@secure.mitica>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <21102f76-d7b1-0b98-ad66-d8d76348aaef@amsat.org>
Date: Fri, 15 Jan 2021 16:24:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <875z41gd8c.fsf@secure.mitica>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJy0PDvs750H

On 1/13/21 2:47 PM, Juan Quintela wrote:
> Juan Quintela <quintela@redhat.com> wrote:
>> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> I think this one is wrong.
> 
> Wrong is a strong word.  I mean that it changes behaviour and the commit
> message don't talk about changing behaviour.

Indeed. Well I'll simply drop this patch as it is not essential.

Thanks for reviewing the series!

Phil.
