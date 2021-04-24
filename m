Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2520337lfb;
        Sat, 24 Apr 2021 15:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiB6QvfWKsfwOj310Y7KA6LAnnDxZgdnLHyZvbuT966l36n3RvFopRjel5LGaO251dgfhD
X-Received: by 2002:a05:6e02:1c49:: with SMTP id d9mr7518806ilg.95.1619303941342;
        Sat, 24 Apr 2021 15:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619303941; cv=none;
        d=google.com; s=arc-20160816;
        b=AjsGqpj0xwznkN6U3hGCPF6r9hDKJS7TXUr9bgaHGCTxJ0mu1eLrZmvT/ldOPC5WxC
         KYExTgcuHWSVy8V5DUFecMzhz3I8bailVu7AuJTU5r6M2ByGDzKGivDV9imJ9bd2xnOB
         U0WuCDvpqoh3fa6bG8IKeq2z1ei1sLWlCTzjuVl1X6hHwSPA5Ven/VzRcVD2mZClkaPE
         yOmok543TFV3fHYy/lI2ct/bkNYuHmayEiC0ljwAL8tnf9sFm51CuUS7OsQg77jznr/+
         Sc9Fwgr9L0+Vzr1p9Yg+JV2NZEBGi9uWbfEq0m3aac3itWUhrzPJhWs6dChWt0Bt+bJw
         CJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JyOjC4hnuqpZs4dLJ2oDGWTASNQw4MiSTPeP8nSRLU8=;
        b=Wo11OduJN3lwPc5lAp/QwZJprBU3CR9Pq99za9rSZUFrh/zICX+zUE1JQPkcDwHx56
         EcnkLEWgx3JM6mlC5g8vVf/pjhDSS0d6CRkHhvHXF/9vZGwQgNOnsohNFY4kmEN3qFYh
         8D5755FpQv652B1YuA8xc13+VpXeGgPuByRCbqSNkdVIAALXyz5GybvYsjWsq+sDuiGs
         ZSK1oVoKlNuAFHlYkbZZDtzzbLEmO7wBtKv+Jn/BuPmgWeyVLmeRdD7fri/TCVTmWAst
         3/KD3YrqsRVPE9YU/XbnRXlVapdoN1C1n+qbhbRag4Ca17ZdgA+XKZnN+g2j2lk612tB
         tmLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZB1D2ugf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26si10856487ioj.65.2021.04.24.15.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Apr 2021 15:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZB1D2ugf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1laQvU-0000y5-Na
	for alex.bennee@linaro.org; Sat, 24 Apr 2021 18:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laQvF-0000fP-0i
 for qemu-arm@nongnu.org; Sat, 24 Apr 2021 18:38:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laQvC-0008Fw-8y
 for qemu-arm@nongnu.org; Sat, 24 Apr 2021 18:38:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id p17so1085445plf.12
 for <qemu-arm@nongnu.org>; Sat, 24 Apr 2021 15:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JyOjC4hnuqpZs4dLJ2oDGWTASNQw4MiSTPeP8nSRLU8=;
 b=ZB1D2ugfow0fItNEc7bImTRx+1Q+f2e6jSr7re6hY0M7UGta0SgjISmDiXFuJ0oODA
 YUM/r7FVGrKESZYKNjf8piVmNOmehyx9QIwx5g8vZVMozpprWGrZ7zsI+Ql9RrYwhFKF
 bHoygcNwK5VARpQdT0pvmey8kRMFWVYl1i5u90IeUEoNpycu2G4Lo0thDJXhNSofG//t
 ZgTBFRwKAqcn8phHevDpOpDzNfdXyQlNY6o8wnWC7dPYqn2DubgdcGpbufCuoCHzZzlg
 QkisPeFSTkQqK2RRc5zF4N5rHwIZcISzuWBFcEXrUfb4N2Wv2QUcD0Bvz7xYe4OT9Uld
 e2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JyOjC4hnuqpZs4dLJ2oDGWTASNQw4MiSTPeP8nSRLU8=;
 b=FbZq6XyC47l/cUUYlkZDbaMBr2EVrojRmGFxe8sGv1NkkNshe+Mxy9jXMuwGq6Rce0
 AgvJR3GbSaBS6VLYgxkYWnW244zhOfI8/CMcWcdsjqQ1l0CL78NkG/qQ8vJKSDXbv1CZ
 UVUiPp5iyIzDvzDSCnnxy0QBRZTXf+oTT7De0JxgkQjM4TAu3MRzAb7kxy/HC0NrQ/EA
 quwlgpCb4CfknTlciI2GZ+G/vRq0L6GLXhYll/fYsA3izTyRBIJizrV6wmLu90NCbCHT
 olMSBzLb5wvoyYQ+RFk4KjIkpIwrc7iMknyoisVf6iHiHbNP0Zs7eXAuetePXCrafXY3
 Lfng==
X-Gm-Message-State: AOAM531vm7QPgeaQ3H9EvbMgRzaNG055JBJICQmw+yMW64s2PzQneTYD
 lgz08jhA9+lg0E9pF08Wk1XVGw==
X-Received: by 2002:a17:90b:1b0d:: with SMTP id
 nu13mr12905976pjb.149.1619303920738; 
 Sat, 24 Apr 2021 15:38:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id ne22sm10848393pjb.5.2021.04.24.15.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 15:38:40 -0700 (PDT)
Subject: Re: [PATCH 0/3] hw: Restrict PCMCIA to ARM target
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210424222057.3434459-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <951882f8-c12b-fffd-44f6-9697c52b8de0@linaro.org>
Date: Sat, 24 Apr 2021 15:38:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424222057.3434459-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c+gOLH9I//6j

On 4/24/21 3:20 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig
>    hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
>    hw/pcmcia: Do not register PCMCIA type if not required

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
