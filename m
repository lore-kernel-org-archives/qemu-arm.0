Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4751766ejc;
        Thu, 12 Jan 2023 04:46:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsL6J3DDDZkwyPBNV/dje3ni9DOdqR++iWv88A2Xj7Un2pK9g0Zma3lVa3O22YpjUZvvB9T
X-Received: by 2002:a05:6214:3401:b0:534:1ed6:3291 with SMTP id mp1-20020a056214340100b005341ed63291mr12975572qvb.46.1673527564133;
        Thu, 12 Jan 2023 04:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673527564; cv=none;
        d=google.com; s=arc-20160816;
        b=F2NzItj4g9f+PZ2cYz3qN4NC9rmNLLJ3t6mJ5iPih5IwoXYcppiTLaFjSTsZP1aPYn
         e21XRKJhdyxZceyAMm2+oEaBo0hcWaPsTvMHwLLHoOUtAcnwT/xuar8P2z9XbeTt6cpi
         gbGdQyxIqhvC/ufa7h6f8AelmJfpSQmBj8Hby4HehJxm4oSmJszyuuYOI+0Yglk2mpSJ
         DiKECppWeTFrXkgevyOezf+WI4B2eKTUCMQBoo/JTWn9BdGTCNPr3TIkThzlCTrn5ZJC
         p1v4wzIudtlzaSXhLkxhWv0jgBaPLsHv3efUF2KXaJvi4FznxUqO8wXn6gVzA0rKrvnv
         jbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7F/xXmpfa6gcNdKv8Dx8M5etMEkhCkv+n97k0/aw9zo=;
        b=1Fxqt/XewZY2Et3++nyGJJogl2fJtYCV+Qh8/RoEeJ0kdd69YVP54UYnBZDx+VwL1c
         63vC2eTVfc8SrIMGk6faYTFYetNtUYPyg/wAecIzuigFlXC/kOagxc1pi5sYF2A8EOrB
         OGk1VZuUiDFeOR+nnQCDuE9+nT/GZydVkEvbmkq+QTtv77O8xAFBLAT75pR9PIDMlxGT
         qrwCgCnaQv+4JwpGa7mu7u+xVv+HxZaxmxHvc8IZJy0RLa0VX7pXwjEK3IonVsa4CHFl
         w2eYDk2JhWj5VZ+YaEp3pqzKUd0ApvdSyUqbiSTH/cHufiHUW8TFQZhpn0rExGSy95D0
         lPmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKkPh3fQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id h6-20020a05620a13e600b00705ba9d0d85si4772197qkl.283.2023.01.12.04.46.03
        for <alex.bennee@linaro.org>;
        Thu, 12 Jan 2023 04:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKkPh3fQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFwxG-0005UB-8f; Thu, 12 Jan 2023 07:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwxD-0005Px-6Z
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:45:11 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwxA-0004FP-9H
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:45:10 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w1so17962042wrt.8
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 04:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7F/xXmpfa6gcNdKv8Dx8M5etMEkhCkv+n97k0/aw9zo=;
 b=pKkPh3fQABWAQ7P4+l/NtU6NCnuiCjSg4KzavtYgGNO/HceLoZvbyy+BRI4JSxUWA1
 gAUGpzNTvJwkD1TjeYXVJX6ou7aA96b3J/fyHJ5qeaR36/QAOyofoCLQ7dbKh5bYoWhh
 6qRr3iIlbUowyi65XpEx5XHHdL1am3fkIxS6zRidsHnmzOEMMDIjeA5Ucc9iR75Uqm34
 x9qJWlMoTiYw++QURvtQBtaatRL27Nkz+27t4rNhzsPnUZ9Pn8L3CQFEFr+pEMmGy+MQ
 pe30QT8J1XxH220dj1sf3/HiLg+AR9JigR8+jnsSq3VSi3JZtBqp3wqyrkRgQC5AC4b7
 xCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7F/xXmpfa6gcNdKv8Dx8M5etMEkhCkv+n97k0/aw9zo=;
 b=qK5BhgAOxl2s3P+P1pv2WfVmctb1cC2mNUI4BMvJvpkS7v5ExdukvderSc/NDdR6/J
 a94KNWRhahqQjvo/NlQluxFrrDiSsVWubiZvBjpzuMq3t815svVf96qeA4GUvGf9VsZ3
 MFyKTFWJH0gT4vBWs9QQ8ysq7Kc86WeV0wG9D6t6MxUunocW3bWW8qbMY8KyM1lUUJ5m
 aWXKqfTZvxdEs4e4JBlC8w5oXE+dxHRl2H9VSq9OFYNsh1gc9OBaekThAfKPHhPpIkBJ
 XZWroEDM6mXisve1EU5u20OkJDJZca/e/qFXHDPRqY836qLiHYGKXOFJGPBTuPhg20ot
 gIiA==
X-Gm-Message-State: AFqh2kr3PgwZMsWlyqOrZN5x2uxK7S5nV9LP8ak11xy3GGXHBKq8Gxiq
 QqnPmBFm73ryFpJeJGEZRyc+xg==
X-Received: by 2002:adf:e88b:0:b0:2bd:c6ce:7bef with SMTP id
 d11-20020adfe88b000000b002bdc6ce7befmr3677814wrm.26.1673527506613; 
 Thu, 12 Jan 2023 04:45:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm3476400wrm.108.2023.01.12.04.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:45:06 -0800 (PST)
Message-ID: <0b268419-a089-0a3a-5fdf-7bf107d746ae@linaro.org>
Date: Thu, 12 Jan 2023 13:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 14/33] hw/isa/piix3: Create USB controller in host
 device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-15-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-15-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: y55wiJeaMDOe

On 9/1/23 18:23, Bernhard Beschow wrote:
> The USB controller is an integral part of PIIX3 (function 2). So create
> it as part of the south bridge.
> 
> Note that the USB function is optional in QEMU. This is why it gets
> object_initialize_child()'ed in realize rather than in instance_init.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-13-shentey@gmail.com>
> ---
>   include/hw/southbridge/piix.h |  4 ++++
>   hw/i386/pc_piix.c             |  7 ++-----
>   hw/isa/piix3.c                | 17 +++++++++++++++++
>   hw/isa/Kconfig                |  1 +
>   4 files changed, 24 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

