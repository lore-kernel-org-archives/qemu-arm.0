Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2488749njc;
        Mon, 18 Nov 2024 02:47:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjdhIg2AJ5/G1t/lwF0GPO4ctLIqvf5fzFpyyWkDWXJbU503pyaOvWSQb4nZVl1sezVGZn6iyCdOeiFA==@linaro.org
X-Google-Smtp-Source: AGHT+IHh9sAwxs7T09/IjBbidi77SO5pZ6dNz/M5i0xYwX0ssNLrUGSdBoDI9kj2Ce4BvLONn71V
X-Received: by 2002:a05:6902:2a90:b0:e38:a031:bbcf with SMTP id 3f1490d57ef6-e38a031c040mr2147454276.52.1731926830553;
        Mon, 18 Nov 2024 02:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731926830; cv=none;
        d=google.com; s=arc-20240605;
        b=WELnitTe09Pghjjrmj8XHMH8WfcyaTokw5+JxRyJOvuSHvioydf0CBa5k3sJzEvfTe
         qrR6cVWXD53Adpe4cYChpug82qNTyvLlWNqjsd6UTlsb9RMCpxJcYT/7ooHROWlZnimn
         gVOR88msMerzG8Rxqola2JKQJwowW0xwUvouMRtuyhd30xnwgp90TE8KqPBBHWNGTRlD
         nvOFIwVSCc9bBhV7OJfDMfttc++O6QEUuSAixlc7s2DBCuNI1nAQjmJSA3rUB0Gd3+0z
         eefIWKQc0Flu46+E/PXwmVs7i71wt9bAkvU4nUjYxPSObY6bRAoTs3wy0OdBijUdqDYJ
         9vmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iAnf8ZSAxSU1u3Z5PVmcw4Q59w1jFgLVgeRKEbH4LKc=;
        fh=okFLkQzRVplx+jxFnkC1b9ospSeC4YfTwbPFyZebrSs=;
        b=UMYbKSZ/LrbSXV23+jzSSaOxS5S8ou07sz6zZ0tP4m2PumTVIMWY28XqPMFEYgVCyS
         uRsb4Fnu1P/K+Wq0z8U5Akwc2XYdIS6imh2pyDfRS16b/FFWFIoC7EJZ2H3s4Kx/ldQX
         zcYHSrs4tPlH+I8RCftopCot4lyXsB94LAwZ7DupQR+YbjX4yG3H0Y8d1oGyQ1nxHPrm
         hJfEN8ea9w8cf/Blyg6Ds4s59Il3lT7vMmefZpwKyPfLmDWKyZ1z7q5JQ68y15nQt4kH
         fV5vAIj0XCJdUgpK0Rg3ZGcXnAKiDZahajkQrOImKDmRq5w7/4HG6GdupOlldarbUaKi
         OENg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiAXwnK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d40dcbd233si61375806d6.385.2024.11.18.02.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 02:47:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiAXwnK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tCzHW-0007Oc-B0; Mon, 18 Nov 2024 05:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tCzHU-0007OA-L7
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 05:46:57 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tCzHT-0003Y4-66
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 05:46:56 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aaddeso5142564a12.2
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 02:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731926813; x=1732531613; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iAnf8ZSAxSU1u3Z5PVmcw4Q59w1jFgLVgeRKEbH4LKc=;
 b=JiAXwnK5m5GEG+KqW1Y/696a9F7q9ybUjoLqoh4ohYWlzTrVKX6X+48QYDjcOJUpte
 0N9yX8zwuqu1kOK6QfllVGe6eEB1b5yYRfyobW6ytZE7Jd/fMNZrLq0RJ823z6XV+CG0
 HxPakU57zDPVPtRfipKuo1LHEKTiDRzMNxlk2KqIN0B0Qqv+xPAXo5RNhCfRsOp13Vfd
 dcX6gPojmtAGnEPkYG8MGrLxbz9ladjepKnXHaQDFftO0ssLCwie7DMuCLU8FOBKuvvP
 bvrcSpWlzEcz3T+sXgpaMh82beeCCOKYY9/pUi3zStF8mLmIncucziq7jyN9/4NWLxG2
 6PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731926813; x=1732531613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAnf8ZSAxSU1u3Z5PVmcw4Q59w1jFgLVgeRKEbH4LKc=;
 b=GYbgGiEZY13oeQBXy6u7muF8chZa/FheEBgQU90iUQ71ODqJt3YadjoHBb5iuy/qT/
 ZQ3G3jPd7COsYezlnINxLc+8cUqHm99i7QnCusV5LxUlhZwJK5880NRnZGmZK4A1x6UG
 rlOw0hAa5rvHtZvhuP7nVClGH0dDHng527Uzd5obhUUbZc1fkEh5tN8HxFD+9oiFmm4g
 Tjls0vqoBP65CVxKDf57k6CfAkeG60Ep8ruqKnJQFG54P6Hx1x2liK62WzzH5bFXGCfP
 LmH1UeGrtff4L5Eyil0roATefddN46gi786B0WTe4Ty3jKaDtXgu/stvQPYHKD4r+9t6
 k3LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg4dnz1jB7B0TVi4+RbCE53EvdHe3wgvhhQfskN0VKi3A13vKqkDuCu8vShUROOdsLLe54AFlfqw==@nongnu.org
X-Gm-Message-State: AOJu0Yxf3QbzJayE+EyWrK6CI0cDQlxMXSBqzIAmKWalwNQJq6zs26S4
 WtQeq0MX7P8bHLNg0X8KeSPo6o4ELXp7QmH5IyOZL/QNk35FVIi1EtC/Khc+bk4=
X-Received: by 2002:a05:6402:440b:b0:5cf:3d11:c798 with SMTP id
 4fb4d7f45d1cf-5cf8fd10554mr9765358a12.28.1731926813071; 
 Mon, 18 Nov 2024 02:46:53 -0800 (PST)
Received: from [192.168.69.197] ([176.187.198.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfc2677c5csm1167202a12.72.2024.11.18.02.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 02:46:52 -0800 (PST)
Message-ID: <51b12b06-1fac-45c9-bacd-094045d02c97@linaro.org>
Date: Mon, 18 Nov 2024 11:46:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: aspeed: Reorganize the "Boot options" section
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
References: <20241118090648.187720-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241118090648.187720-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wCYytUix8W2n

On 18/11/24 09:06, Cédric Le Goater wrote:
> Add subsubsections for possible boot methods and introduce a new
> section on eMMC boot support for the ast2600-evb and rainier-emmc
> machines, boot partitions assumptions and limitations.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   docs/system/arm/aspeed.rst | 99 +++++++++++++++++++++++++++++++++-----
>   1 file changed, 86 insertions(+), 13 deletions(-)

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

