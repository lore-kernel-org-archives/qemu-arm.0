Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp93728lfc;
        Tue, 25 Aug 2020 11:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnfHsL8UDNmIYX1+Y2qVcHBF6dl0Twxw5J/g3GZFch+DNs3zKoxuJ+jfXd6VITAKb0RkwH
X-Received: by 2002:a25:2644:: with SMTP id m65mr16556090ybm.94.1598381071896;
        Tue, 25 Aug 2020 11:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598381071; cv=none;
        d=google.com; s=arc-20160816;
        b=bG8ct09w+Iyr0K36UbmZXaCrZdOuArgFfWGKvFIHqZHP1nEv05pAJfmJddYnIU9su6
         wK+gtVomgcWv8I7fM8QT5q2ywsQcpMVmdGLzYVcq7zF6BtwvSEUnN9ArfhJlCwIOEm5t
         xVkPXdpXC/Dyl0Z0wD7MXN+Xl7wUoLo1hT73kizPdz2iyviAz2g03IbByFcf2ff7u2Pn
         T1ktBaxQYQyXIdg0BpXjCzUHeK4RjDIsSiRZ4nefU6obLiVU46O4gtqR781H5qek7/1x
         sZOaLKXO3qBO4HS3P4v5lDhjETos7cRsdoDuemBxBTjyssm59479ULQFlRN9FGNX+ur/
         z/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dhR7qv2DXNOO7s+cWlxRYzOkGC4Qq0jTAX3k1d2vWek=;
        b=czj0Ml0nYJTjVHF9T+dbPM2XZUcOubQVMawxy+fE+G3wcqwvgKLdhawpu5bt/mg+7L
         nThEFu/ntcAr6qXHOWKRb8QvZm3zdp0K8dkhVVJbo/nDG81nSTHjTHSWnDhSGrIOS99Q
         3v25HaZcJQ95GSWVC34k4+YcR0m0+gTWkeEzwszJq10bNvT5ym1zBi3VXxt3QgvAHaV2
         U0KY7MQc7v720jHm5rIOmh67WphF4joIwWfvpIZx7BAPxThP6eEUU4AU0abEsi4z4HjX
         SKZGZOXqTg+9PIhD85sbcIzfMUy5d/MBNNjUXwf9M9cDsQHuG7SFYOBT1n3oO8Ap9q6K
         nAYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlPT7T43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62si14087937ybe.220.2020.08.25.11.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlPT7T43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdvr-0001kh-8z
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdvX-0001kQ-9U
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:44:11 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:55399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdvV-00018N-KH
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:44:10 -0400
Received: by mail-pj1-x1044.google.com with SMTP id 2so1702006pjx.5
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dhR7qv2DXNOO7s+cWlxRYzOkGC4Qq0jTAX3k1d2vWek=;
 b=YlPT7T43Pglcpj0RY5VSZy+SmoD5T6LXF9gdP2YKl2AwfcpEpOjJA5Wx7C2rMFeuAE
 6W3XgSMu8DN5SEAJ7IR+bzbUkncEBAHVSrr7Qhy+T/zxybuDOkouSuvM70RgmAn+HXx6
 ZVoGz8Hdl8YoLAfcQxH2DVgKwxmeCExBzJ+y/VZ3I0hR6WxGTcA/CQt2qDLPLHsofao8
 mtmiriTjsNqj2mKPyh1VOZb0IjCDfUwgRs+bFj3wRK/q695DluGwfDgWy4KgY6FNlsOQ
 JW3WB6uuIJiWQlO4LgSrF956E9tleeJxtVgBNOAI76JGz4wtANQWnvI5+Pp0OvSIGM4T
 bNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dhR7qv2DXNOO7s+cWlxRYzOkGC4Qq0jTAX3k1d2vWek=;
 b=QWxDMfoQAlpMJxYjudOTyGIFiKmQQ7V9i2a2iL/9QTw4iv8kEhA5GwSWbKeu1XDECI
 M05qp9qAuBhFHg6NeyFnirn0lb7V/waVxBPE6fTcLp9HUP8WDSKt2e3Nn13WBOaiGaif
 yncIFk9CMoqnIk2WuYaXubci7ug0kyoyrCJGZnL3FGDOK6ZpJsvKPd3sFL9sC5TcxfAS
 3ss2Wgkhldqx2UH5tUivDOvenV1j0Oisr4ohtheYS9COWzI6tPLFSKAfywc148/kH9hK
 ukmrMWCXRDWH+4YoU/aYptnYEkPzH9bpARtS9vDqvfP2Ne0iN2T6Kd+EeL/UrJUs8TP2
 qyZQ==
X-Gm-Message-State: AOAM5332rdrh6zhVEiBysy9DGKvEzgTSGc5urnxMmSQ7FUDfluVpf+C/
 QzAj/uWlw21B+shlUTefDp4u2Q==
X-Received: by 2002:a17:90b:198f:: with SMTP id
 mv15mr2685315pjb.57.1598381048280; 
 Tue, 25 Aug 2020 11:44:08 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id b18sm3380665pjq.3.2020.08.25.11.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:44:07 -0700 (PDT)
Subject: Re: [PATCH 11/22] target/arm: Implement VFP fp16 VLDR and VSTR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <519914e6-a9a2-8775-d5a6-30cdbb886c39@linaro.org>
Date: Tue, 25 Aug 2020 11:44:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JKKmbiLYdyDk

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement the fp16 versions of the VFP VLDR/VSTR (immediate).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp.decode          |  3 +--
>  target/arm/translate-vfp.c.inc | 35 ++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
