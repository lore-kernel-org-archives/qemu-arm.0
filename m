Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2193051lfb;
        Sat, 24 Apr 2021 06:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3gSQ0giGJY2vJhPfdQG2AtbAwLZbhF4X15Tt6psEhZXZAzTUOCFrJpQapVAGR8SvO35bD
X-Received: by 2002:a05:651c:205:: with SMTP id y5mr5846282ljn.301.1619269459675;
        Sat, 24 Apr 2021 06:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619269459; cv=none;
        d=google.com; s=arc-20160816;
        b=U1rSZaOm5fWcwvP6Z/zSr7eIXTtY/tBhldO5XcodGZFd6qwt6yQfnNxnjdnZx05FI3
         FuNCZJDg0l6g8uYUalDdSCgKfr74rA9zK3GVhOruc9uQLkA2i7eh+y2CTFO5KP0qJnK+
         XO1D75J07XsPGZyF9FNgOsR/w4hoyO4Lx2P/4i4nvcLPF85WwqlSdVlQmHCU9rFziALc
         d42GIWdveZXAhZgGSRyf1LEXRI124hJbZtXu7es5y87DSwmkfwJSRGqHTPJYyHGgkjLp
         u0RqYzmmRoTNcRVDmd9OL2z8r5LaapQEV0xikjucEHr2ZT3pq3CEz/ZXYYGqK/OKYReZ
         9zSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=c1881A5K6c8/RSyKMo0b9gkByTRkw7m1yPMznn7UeZo=;
        b=IC+ZO6jVxx4Okawu1r950xN+YnzFKBm8PDVDD+BOCkkw2qZ4lfI0d+/Jvmshy9Ao2U
         4J5JkSjH8Lrksbtm8nEXOiGGQZxMNfN5IVA25uJweb/3w7q4agNHgNaBhTklQoULKDCG
         6oS2zja1G/CZHqtAuRxqWk97ml0x/lntdqlAy4YdUmZ5aoF6Lqx9tQeUty4/QXJ8NT3K
         kt/1/ho+wUkMdj9pz2fdO+nNK8mqj0t4Hl3upJDmtJbTwfBM8RGCnWVMPvNEyxbvpq2g
         I61S8ze8+x1n0RBHxzOqZ91kr+HvGKyV9s+f+JI3Q/7LPquu7mciY4k9DBpYgB0mi5XR
         VABg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dLj0ly8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si9317415lfe.522.2021.04.24.06.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Apr 2021 06:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dLj0ly8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1laHxK-0007rW-NV
	for alex.bennee@linaro.org; Sat, 24 Apr 2021 09:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laHx2-0007rL-OQ; Sat, 24 Apr 2021 09:04:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laHwz-00005e-SH; Sat, 24 Apr 2021 09:04:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k14so1195318wrv.5;
 Sat, 24 Apr 2021 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c1881A5K6c8/RSyKMo0b9gkByTRkw7m1yPMznn7UeZo=;
 b=dLj0ly8fbd/dzx8VVEiwZdjmXKwJyF88gM3dtg5267gS3n3m9uIPOCjGibEHrdd2ba
 w25DkXvkf1cFD8DYKV9ScTYhV6xchJmFnfh3EEbb5X4ng6vv+X163dTw25jfigbuJUBF
 +qgzv/vU6AOt2F48gNJHJ4to/2EBE7wHVNRj59URFDOe3BxBCeEUhvVMb7XSPwTGVTKn
 Cg1pVw0kb3qLbR3Tj3UkvHAyllLn50/fRsWdGaT54ewrn4UgIEqScKFzSzmERG8JTFOH
 bv9LKb8FPKmKUSVa/pauSiL9wAJQTtQwy1r3+w/T8CRcg8e5hLI4+NDBnYOmHacP3EOV
 Whzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c1881A5K6c8/RSyKMo0b9gkByTRkw7m1yPMznn7UeZo=;
 b=eXEClM2IQdThzQjRhHHx3m55zSB93CTXxmbmHUStgWTbvqav4U9YFIXyKTCQH2WisV
 hAM+mMtf/rmg1+Hh8rce9euweKIYGzLGoT10ONENLhzWFrkkoSnIMuLh7t8VSjhTdaIu
 tSi0sKLVlB+xIPFZGPLBIca6bpADxpXaRbA+5kT4kaxpVY1ZFy7lf3gf8wrGjKTXTzxE
 Y9Q/TMwVXOWS21/fLoaRS6QFfGtoZctAyYCfMyU07ME1JwRDPs7WikPIj2JMjcrzZ1AH
 YZayPejOIitwTgfUT3XqPzb35WNo9/JLSt3xyZMdROgY1OxwpuYzVySSBJNOZ8uo9CWc
 bOIA==
X-Gm-Message-State: AOAM533F513VkDRS9l5OOFzev8q/6zm+U5Xl5qppJQLj6emrI+wQ6QOh
 CeEpQgrMHBHBAkeOQ2IMrdk=
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr10777337wrz.201.1619269435223; 
 Sat, 24 Apr 2021 06:03:55 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n8sm12245871wmq.12.2021.04.24.06.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 06:03:54 -0700 (PDT)
Subject: Re: Cortex-R5 support for Qemu
To: Mahmoud Shirazi <m.shirazi@iasbs.ac.ir>, qemu-discuss@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
References: <1619267842258153110@iasbs.ac.ir>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc84e1e0-c343-f52e-4fa1-f2574d6015f1@amsat.org>
Date: Sat, 24 Apr 2021 15:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1619267842258153110@iasbs.ac.ir>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DEAR_SOMETHING=1.973,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fmvUhapaYTDP

Hi Mahmoud,

On 4/24/21 2:37 PM, Mahmoud Shirazi wrote:
> ​Dear Sir/Madam,
> 
> I have a question about ARM cortex-R5 and Qemu. Does Qemu support
> Cortex-R5 processor? If yes, please let me know the machine name on Qemu.

Yes, QEMU supports the Cortex-R5 and Cortex-R5F.

The machine using them is the "xlnx-zcu102".

(I note this machine is not documented in docs/system/arm/).

Regards,

Phil.
