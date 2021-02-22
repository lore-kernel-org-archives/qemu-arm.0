Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1835889lfc;
        Mon, 22 Feb 2021 07:37:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJIYiBBD6QH4ESrcq7ij+WJ/DSxmnQQroeI8RINfuq11fpeL2wRzie+H5XkpSUcIVPRbFx
X-Received: by 2002:a02:714f:: with SMTP id n15mr21234963jaf.6.1614008262922;
        Mon, 22 Feb 2021 07:37:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614008262; cv=none;
        d=google.com; s=arc-20160816;
        b=qHQpxKx4B7w9fyplhr2tU1w8JdGZT4ErLg6wDCIh8snFcW313QWQ0Ropl1RJ0FqXbQ
         HjaqqC9cx/FvOxmxcmh4+AgLSchf8+FlyzwyIMO+e5SVgL1hJo/c9gLOhSCd43LhA56Z
         hehd5+FKBMGgrARikQqF4Nl7IrI6ITgY/oq9fduZ2KKMYhwsi9l8gUple81YCG/IJUTW
         rCMYBSD65LbH8gND0fGnxLPLSmkdau3TdOjyhrHqkEELPawT1Q9pJZcirOvvFu6yzsV0
         UrgotJDR8pUaTNQWmLP7wpr9tIjslVFlE+lZX+JZ+6mby+EoaicumoXvQ5YxsHhkjXTP
         5fuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=wyBas48ZELzJVZiXTdRF/v2cojCIAy9JbUfyh8ucTAY=;
        b=pgmWmtxI5jgpreaUVsg9cuTwLTS96yWkuP7hOqJ1/J7+0b5xwBG4YTXm4RGdNubHxL
         bg9m3HabxMsPeykH6gfuYK/kBL1vjSPK87wW07wSi1x1dm5ke/MlY+Isn41w0xFG8UkH
         ACulm1fkOh0sMJSTESCVLbIXTKbEMAzCaFNjk3galU83fyijICPrsUtWiE7/q+AZfLqv
         FrHT07+P7ZBiMD+BFnizwgSzHWVxXTa1hq9uF9aBtF73QHWx05PEZedi+eoStBmuzCnD
         wCezEWolUEk0DQbEMwd9o0BaLgBcUNr29qoZX+BuED8+Tn4npZIGmDvXu0+pGCjZaG68
         ZLRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RKvLX3DW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w24si15936526jah.69.2021.02.22.07.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 07:37:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RKvLX3DW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEDHK-0004A9-7m
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 10:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEDEs-0003QD-FS; Mon, 22 Feb 2021 10:35:12 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEDEo-0002Xy-T3; Mon, 22 Feb 2021 10:35:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so30145524ejc.1;
 Mon, 22 Feb 2021 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wyBas48ZELzJVZiXTdRF/v2cojCIAy9JbUfyh8ucTAY=;
 b=RKvLX3DWqFvwnhGOOmzlzuTpF4Blyh9XtnlYQ/6h09/Q9zCqvRb9Ec1KeCnl7Et+AZ
 Z+uMJUz42MeXyiuqeJ4STXOQMjtM2xPLmtrFwSSwoVP/1rwULRivAWoMKw/q/OGnT/G3
 vPn8npH2AHYLND5NUyMxIm+68VZoJCDoBy0cLf+E7fWSW4XqCjI9KIe7N0a+88y6uk0D
 pn+vX0aYVvxnbqN3Im12kWVhnwyD/eYxySx5/8MMPDdlGICHBdmBOFc0OJK/DUF6vCIS
 gt3PYNoSTC8PVvE68R3mAuYPQtJhN9yyoHD1b9vqi7N1upMvwFw45P5uVewUiWxz2qLH
 2EOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wyBas48ZELzJVZiXTdRF/v2cojCIAy9JbUfyh8ucTAY=;
 b=kcgsv/ITlry6cABTVO90vnj8IXfOsVACQ1wm6bUrOzMc2YSAA1aQ1eJGkMsgxVJEll
 wUUqbHKGLjXJe0dWJnJoviBkjOnO4GKvSegedzk0NCxfTMPkcOiIRy/mKFmZCvVJ7y76
 BnVN2y+8AaoVbLTCfs8jRC99rcwe34ML993iZZvPX4M3Qmy/pi6qjb2K/9HrVzg+x0pX
 Dr6dYuPYKZbn0ikKNw4btdcvF2wyEBEaUQDK0kPIwcfR3/89Y8aLtH7taa7XCHFmPQsv
 AnHPL758UkYXzhhvzkzExFnURbkGQI64Bdb4fVcnzLYsEKFIW0qCIboyr1qRApcUQg24
 3CzA==
X-Gm-Message-State: AOAM530c/E/zT51kTOBuoSaAhZmUrxeJhqMdLp++XOk0qymmYz3ciQrk
 hy9655jp0MmZqpdETCAEzwBOKUx+rHo=
X-Received: by 2002:a17:907:7667:: with SMTP id
 kk7mr9538172ejc.92.1614008102862; 
 Mon, 22 Feb 2021 07:35:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ga5sm10801504ejb.114.2021.02.22.07.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 07:35:02 -0800 (PST)
Subject: Re: tests: n810 arm failing
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
Message-ID: <cbf28177-bf94-2452-1c66-2f99a8f3dbf0@amsat.org>
Date: Mon, 22 Feb 2021 16:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4cavc7JuIWyD

On 2/21/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The n810 arm test failed on latest master:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1045015424/artifacts/browse/build/tests/results/latest/test-results/26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810/
...
>     raise RuntimeError("Test interrupted by SIGTERM")
> 16:03:49 ERROR| RuntimeError: Test interrupted by SIGTERM
> 16:03:49 ERROR| ERROR
> 26-tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810 ->
> RuntimeError: Test interrupted by SIGTERM
> 16:03:49 INFO |
> Runner error occurred: Timeout reached

What we are missing here is we got a timeout ^
but return an error, so the debug.log is not shown:

> Original status: ERROR

...
> "tests/venv/lib/python3.7/site-packages/avocado/plugins/runner.py", line
> 77, in sigterm_handler\n    raise RuntimeError("Test interrupted by
> SIGTERM")\nRuntimeError: Test interrupted by SIGTERM\n', 'timeout': 90,
> 'whiteboard': '', 'phase': 'FINISHED', 'class_name': 'N8x0Machine',
> 'job_logdir': 'tests/results/job-2021-02-21T16.00-e662b93',
> 'job_unique_id': 'e662b936b3c04ad082359ee970534ac7ae7ec3bc', 'params': []}
