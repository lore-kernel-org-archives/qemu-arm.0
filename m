Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2598412lfm;
        Sun, 21 Jun 2020 14:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEgk4EitNxpGT+F/cq8LXwAPd1/DwXdnqqz/jVyUcXDY7cByb7bnG24UOldRdkNP9uD3qa
X-Received: by 2002:a25:dcd1:: with SMTP id y200mr22585671ybe.263.1592773272251;
        Sun, 21 Jun 2020 14:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592773272; cv=none;
        d=google.com; s=arc-20160816;
        b=yDZTQC0YP0e2fjC+cV4jz6RxUmvrIPue4PC5gpe5yEpmlRZyqEmYiUDFQLa9kB/K4c
         bXQBEsGd8VKmEHlrHV6GYEAA7mDlJbF9tF+8u0VUXDVUGpKgzjRt2BSYAmxu7LHfY7IP
         q/stla09kyHpnD1nW8nGzzREmpCVcSZsVmapd4qMdOWW3au16prh4fcZwl1f7w8wqxGk
         YcLW/mAljmd7S0GdJ5AqsdbojZAXWp+ZwIuQKrNPNm5BDuQRlZAo6v5S0eHFJ7C2ZbRn
         66NSzGQ7pamNhA28cpSaeg9SqPuDCEyNXbRKsIw9CpPa2Slv8+Ym4+sDwI24ksjhjD75
         9HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3aYNK/Y55ZyftD/IVlFhDOk199toe1I7JokUnTmEw7M=;
        b=CdyCnYozco2O3Y6LDQXsAUrwZqRk49HUMpFD+5XwgbjP0UKRl1b60uBgF44v8DH6Yf
         fdWk5FU+t+r1b2zeBQp1K94aGhte6DwB/U3b2F5C1j6QoOmYOhtPvuYR+HLNig/jaDpo
         hE1WrD6RwP4K5dkwtxiRjATqSOIyh7MUJKY5Fzeic2zBZyG/wS/p75oECTy+YBlyb3Z+
         8ctKk+F8Ijav0Yo2i0OBwYjs0reYQhiWbAhismExJRmHqNLTyUJqi83VCwEvNiT75Bhe
         K4+VACCB1P6Gqgc7CjrzP7E7+yG79T4ON+W40TxiVwHrAU9F4N8wbKW8VXBR7PsobYOW
         DDcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y3z9YAqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si12077455yba.318.2020.06.21.14.01.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 14:01:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y3z9YAqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jn75T-0001S2-HY
	for alex.bennee@linaro.org; Sun, 21 Jun 2020 17:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn74w-0001Rl-5B
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 17:00:38 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:50485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn74s-000585-Sv
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 17:00:37 -0400
Received: by mail-pj1-x1043.google.com with SMTP id jz3so7082997pjb.0
 for <qemu-arm@nongnu.org>; Sun, 21 Jun 2020 14:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3aYNK/Y55ZyftD/IVlFhDOk199toe1I7JokUnTmEw7M=;
 b=Y3z9YAqwNq74fKHe5zFD7+MbpqcY0sDzWer687Ta1lyh94KhInX6HLFmHf7UwqpGvO
 sa17Fjksxe6vpcQ+1LkLpuHDMFE7pQ728YCfP1PX1t7a4JPXziXwMVSp/JJYl213AlGm
 R43AYAnDhvPk3ERI27ou1r/2zGuq7KUcZH8WjdfbZwX1vWKTpU1l2/jvh/Cmno/057JF
 QFgWHQx0S5K6YvdaNmmNewfP9SsNSHxDw24bY/DuIoJDWD6Fyksuuz5B3vKvhZEPU03+
 lg4eLMhnK/cQa32bOqjfyXRvUrdqHV6XJcFZ5sdricJG0cCsktdQlQAJRR7qgWyiAs8s
 Id0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3aYNK/Y55ZyftD/IVlFhDOk199toe1I7JokUnTmEw7M=;
 b=GNobklMFGUn6SdTYBFgIHWbf5l60FCTbajh46nIRgIYTbn/PROamRrJlcjxvIh05Ep
 QaYEpfoCPfaxxJ+GLDU+cGFcZ9FpMpHuz8x7z2qdv51Okso0tw8p/bkm+UABrj0GlzY8
 DPLe7lh6CPwYr//Hx9NVhrYdpWr85EcD+HK/iAjDMKvJgzKRA4BBRo1T6/zIAJVu7xLK
 3fkfUtcewBZoL88uh3CMuyC0zaV/DdRSb6+tiWnZ2exZOxeJr9o/L/EfQGBWqmeU8ydi
 DTlGEzAljsUoaZsUVQu6f8rjGs3/oYpFz9G11A2cuMuXaWqNfHyQouIYelOU5lEGt0xH
 71YQ==
X-Gm-Message-State: AOAM5338D/0cMyOLA7bWfK9HMoTw0gabR5KyIeddJGhqW5gZVLO4VUzS
 qLziWD3ju/W2x5rT8jr2r+9vNA==
X-Received: by 2002:a17:902:7c16:: with SMTP id
 x22mr16763125pll.66.1592773233274; 
 Sun, 21 Jun 2020 14:00:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id gm11sm11364698pjb.9.2020.06.21.14.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jun 2020 14:00:32 -0700 (PDT)
Subject: Re: [PATCH v3 5/7] hw/misc/mps2-fpgaio: Use the LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <754c5ed3-9882-9261-80b4-f9e39ace170b@linaro.org>
Date: Sun, 21 Jun 2020 14:00:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620230719.32139-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BfEsPk2Dk8qO

On 6/20/20 4:07 PM, Philippe Mathieu-Daudé wrote:
> +    DeviceState *led[2];

Perhaps better as LEDState?  And perhaps return that from create_led.


r~
