Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4954544ejb;
        Tue, 20 Dec 2022 23:25:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvAUniDDg+QfANor54eMqBRh6K6KEL1sIIA17boG1HRb2gJ/V3hJklhHfqwyVLFGXseple+
X-Received: by 2002:a05:622a:2286:b0:3a5:f9eb:22e with SMTP id ay6-20020a05622a228600b003a5f9eb022emr803990qtb.27.1671607531053;
        Tue, 20 Dec 2022 23:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671607531; cv=none;
        d=google.com; s=arc-20160816;
        b=zWYeAtmjLH5PPtaCJknNRaFMkD1KvOqfO2ioeJHXyydk6U/rRlciVYRYmPugmgfFN6
         gzxqxkSnI7xNqjKgVonWP5KjCYIA2uQxHlehyqx0C9RwN/SKROmIaIySMdviC1J9hGSM
         sniVoqYtxjribkF+y0yT+PSxMNWY6JYUQdZjqMKUNb/yZRhW2075TC1kdGZgJYjQjq3F
         uURSoKy7o6AMXnW9IGSdvUL90ZXpvQ4+zUoQHRjjOIs3R9e+1hddO7X3J6Pmksom5ppx
         ctdbNeAtz7VWh5PFei6c5altKm+mNrNI473Z48LJtC6PLZrmPiUyrNzT+utxhF3Ei8rl
         O4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z6zZsajT9SsvaNuxvc5/OP9mHZZjarB9QJuIjloT8vg=;
        b=f9/pVLrnoDt+ha58jipPS8pv9tNzizo28ZbjScOsnN+f2691y9vaBtZULZT2d0Koh1
         G9zaXuhxEq+4Xxczc1dQp0jL18LcrCyq8zqCTnRikM38ZtKd70IHIW2g7tu5p1MC/mjO
         MtwGxkVHLw0TOTXGUlSLt6uYXNfogF+g/25ojuk3WBKGH2WRTTAtnVwaY9UEGildSkO4
         0s9s0uWS+2rGzjGcV6ttLE+WA0NO8bjxsOS9H+K5i/hw8N43i+dbQ0drrcR+5h2hLxw9
         gxP/MUDf0HfFtpzOqtMOTUPfLEzFQ33JoHUvYdwR5AWS19mF+2eMFfiqBSnCZJLjkYEX
         Wq6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vbjmfmvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24-20020ac84998000000b003a7e4ede9b6si5913199qtq.428.2022.12.20.23.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 23:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vbjmfmvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7tTO-000221-Le; Wed, 21 Dec 2022 02:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tTM-00021A-Ai
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 02:25:04 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tTJ-0000zx-Om
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 02:25:04 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ja17so10510399wmb.3
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 23:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z6zZsajT9SsvaNuxvc5/OP9mHZZjarB9QJuIjloT8vg=;
 b=vbjmfmvtfYuLOrQehvF3dG2cnnlXoYI5C0Fb9rZPocLvx/lmgwygWxF6WYh+TfqKmL
 7MAFCuer+1bhbJ0P7dGhytexDmHey52Dl/B25bOACvNYjWXGWDM1oZUc17Ova4BSp9fG
 kVqES5hkOdKryxKr8N4LYPIpzI0PsI7IKWaaohabAiGihX5tkxnHI35cim6cBtk3xyzU
 IPJL83DhlPhtwp7oiQoihVreX44twEvB8cyhYxslAW41xtWEN9q9X49wCV6qNSicZQoO
 J5IkEhLHN3XqPEO54bMejANCuIOZhUDIbkUIDPLmsTKuqAYB+BQGnVPRUPowhQ4rKfTw
 7QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6zZsajT9SsvaNuxvc5/OP9mHZZjarB9QJuIjloT8vg=;
 b=xgmM6LcwVCKouQEyJwUEzcveF14H0nB0iKSXdoKepKXeTKXLh9MNFIRvKV7IgB4s61
 lESFb7QEk7lFNLvb5rvaiXx751fdJ3pvWSWaQ2aDnqwSi/RRT96NVkvtrYzGDI3JytRv
 /oVE1uwv0kk5qs3Na/DORQhBrId3p+fBun/5KR4M9SwR+tk0DIXOYjoyzAT8ffJPUIlk
 8G8qKCHzADfxXkHW6WPuNkZCtxpMd1s4N/A0rS4CeVf2ij3jFYR2v/Pwfm1ssdrQx9yz
 RxralWM3rf+EqR3GSGWUo1d7CviAfXgQgWopCJbYDUmX6pjubdAhQCU1y7vkg3PESEsY
 AZ1Q==
X-Gm-Message-State: AFqh2kpn06de6ouOcoadse0hA3w+EBUdt52b/PEM9z0L1evXXvd++MCp
 QRD89WyEjIZQf4GlbXpR2VfE2g==
X-Received: by 2002:a05:600c:3b29:b0:3cf:d18e:528b with SMTP id
 m41-20020a05600c3b2900b003cfd18e528bmr444968wms.39.1671607500189; 
 Tue, 20 Dec 2022 23:25:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003c5571c27a1sm1720036wms.32.2022.12.20.23.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 23:24:59 -0800 (PST)
Message-ID: <12e12e2f-f69b-eb98-9b22-cb6633433c9f@linaro.org>
Date: Wed, 21 Dec 2022 08:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org
References: <20221120150550.63059-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221120150550.63059-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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
X-TUID: DMl3+bKRyKhe

On 20/11/22 16:05, Bernhard Beschow wrote:

> Bernhard Beschow (3):
>    hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>    hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>    hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific

Thanks, series queued to mips-next.

