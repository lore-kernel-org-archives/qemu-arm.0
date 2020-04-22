Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp127541lfm;
        Tue, 21 Apr 2020 19:56:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZeJ/m1rztY3DemsWzRyDQXUYpURe8sK7mntwp1qqjRO2zsCImTRrYhcwcVgfjxUnUiOfA
X-Received: by 2002:aed:2142:: with SMTP id 60mr24806876qtc.177.1587524186126;
        Tue, 21 Apr 2020 19:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587524186; cv=none;
        d=google.com; s=arc-20160816;
        b=BepnIrMlP1D4ibPW0tuB7YcY7wcRbv2L8y3uElfvDTQtJdPNh2lk/4LU1z+O8HodvB
         aoWFR/7SFZ2w3n//fVRHM3NxnxJs6piYwd3ETzOQCoioRQgBaNs5lsMuulfILSWPNzvs
         vtQQvZj9PRahDXKQUrxTkzhAXw2wIXptxpH5jStpxYy7aLDD6m7qkhvBscTcXwizOQHe
         JfChtINUDVtsI5hF9qpVKEE5RYWN2SoZ5vr5EDjZLF5+PUaNtWlNQTz1MOh1Du7YpgcS
         qWspASltGV/M0ICyaf77+N4iloPqs6YKHfZDvPayjJ5BChdnGzRCVEnnzkBcaGr/L548
         oLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=czzqj7vu5BMsF7L+JiAZg+a4gqFb+cpUNZ+P9HRtzjU=;
        b=mJa1IKYwjavJiOZi8CZqiGaYfnJlsuMiqvAqul1Sx99rtSJeVYe+vzgOR8+irWuq5S
         BetH75VzOA53bM/3XBrZbG5ScVBUEEFYi91L2Ujxce/qfz3R4i6IR+YodVhH5+5FO6/6
         9n15d5LDq0mINpzE856j8otwI292r5fo/D4JemMpzX6pdY3P9KXQQM1DA5OYp0e4487Y
         HwUki/h9agE1EGmvFY1cWVydO4K3XATH8RQkaPO/UdcQwfi9GVwAiKDJFodBV9spUiI4
         kkeKAUOXItAQBhzHiaOdXfH/8S9YT5IkcjRP/sa4CHKg2vryJkL7H4qc9y6l/yD9JLVG
         0CxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ETbNO1iP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si2386430qte.159.2020.04.21.19.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 19:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ETbNO1iP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR5Yn-0001pS-J8
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 22:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR5Yd-0001oD-Cs
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 22:56:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR5YR-0007fX-F1
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 22:56:15 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR5YR-0007WK-31
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 22:56:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id z6so332097plk.10
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 19:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=czzqj7vu5BMsF7L+JiAZg+a4gqFb+cpUNZ+P9HRtzjU=;
 b=ETbNO1iPLwlbb7wgP1fsDn9PJID6/CR3RHfZvjPFCgP2bC9T1rF0Se2MksIZcCJt1/
 OKN81CxC5cjKWVECMYIrmJ4Nb40VzWP0Ctui7PHHKWdiJAgEscCOloKrBdvidZQuncq1
 D5F3xSVbufg9lGJLSBJc7I1jcZy7T1RUQwETltR3uXMpuRr1oCTXqkozU8s3PHUKYJ0e
 d1XdLZBsLsr1TQJbrxG9ArbDdcO40dGtCiAaNYBvu3nAYIae+RTBUdIP1PT0tWKkp2ru
 nsGXUQd8Swxe4MQKRQcqAIIZSbnMtdn3zRYU1Lez3m98uPkEFXIvz87X+YE6xcDYSRbK
 nptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=czzqj7vu5BMsF7L+JiAZg+a4gqFb+cpUNZ+P9HRtzjU=;
 b=UyK+wr4Uekf3ODKeSsUxGscg3Kkm17iz1FPulXPtFeV4GMYWj4hUby3oAApS+jLdnM
 SbLAcNMMb48EzE2TPJtywa9cbhG+4NnpVp4kJeKeRIxB5V2b6gYb3/NOLOf7jzA8AUOq
 7PQgHqWt8L+iWCk93JM4ni4i2LTkuTRaSfktIJbJ9OuC9vIBoPE0yxhovoCP06Jvm61Z
 pju7AZ7UIiCwpbcfyLcrkY5zRHkmOXbETfAziBYv2mklFbwD97FT3YiqwmZZpjlfdkNn
 RRpkvQAnBKAw41mdz6MoAiTpqk1yX9cdJKNDRSkkA9sI+YQ/1SQv/5IMv9G51eshHYvx
 3khg==
X-Gm-Message-State: AGi0PuYrMilMEJXxGh2/yBa+cPGFg6rm0hfifIu2lpkOOMKs37WiqXdY
 Tj9Bi+r8cdluvWC7icRLib1+Ag==
X-Received: by 2002:a17:902:7c97:: with SMTP id
 y23mr216555pll.231.1587524160911; 
 Tue, 21 Apr 2020 19:56:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l22sm3533250pjq.15.2020.04.21.19.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 19:56:00 -0700 (PDT)
Subject: Re: [PATCH for-5.1 00/31] target/arm: SVE2, part 1
To: LIU Zhiwei <liuzwnan@163.com>, qemu-devel@nongnu.org
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <eb7eea48-ecb8-f64d-83cd-66463a61d5a6@163.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13d106bc-19ef-2be4-eb44-dc49fb5f1271@linaro.org>
Date: Tue, 21 Apr 2020 19:55:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <eb7eea48-ecb8-f64d-83cd-66463a61d5a6@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::636
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4RILJfeTGZ69

On 4/21/20 7:51 PM, LIU Zhiwei wrote:
> I find BF16 is included in the ISA.  Will you extend  the softfpu in this patch
> set?

I will do that eventually, but probably not part of the first full SVE2 patch set.

There are several optional extensions to SVE2, of which BF16 is one.  But BF16
also requires changes to the normal FPU as well, and Arm requires SVE and FPU
be in sync.


r~
