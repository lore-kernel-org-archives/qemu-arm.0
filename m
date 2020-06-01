Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3547996lfc;
        Mon, 1 Jun 2020 16:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze2w5gPTPcrVLyYf3TukBjQUOLEYIuS3orSfRmb8eD/cu1FHKkhXg4eHEzY2auVR1s6WXJ
X-Received: by 2002:a25:ddc7:: with SMTP id u190mr23226969ybg.499.1591054822732;
        Mon, 01 Jun 2020 16:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591054822; cv=none;
        d=google.com; s=arc-20160816;
        b=u7GcoRoytSxBqSM2SYTPSsT5trw8c6KZyQ4w63P8rj1oPnIT5MQl9eTDX1P4o9AH+4
         Y/7LaPGaAAmPyA19buRRtyBu0oZSq6W8Li4Ap9LqJcD51V2YyURdNMiCsj3xGsgGmN6t
         oFkGBKx//v6whDXJxRAOnzeI9dlHBYKS6QUy5rWREW78exU/NEAMNveeh9qyrnt2/28Q
         ErjjeJQqMj6N0V7QXuvzogwzX5GX8umm6FDcthdjEXpsXLqk4bhMzYBgqb8SVpmeJ+7K
         DBOTRUjwfScxWT7x5fefsRBT6PRIb6vINB9Dvy18O9DtKMOyzEifgU5TzrCGEgySoYlc
         6RFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=utp8UPhvpVOjKQDHheJJZxOdw9rN2rKIwvixqFfY6I0=;
        b=JkLghbW3g8G+uatwkyox/+P4rnWQuWWmTsHLWuXKsgeNLP3kgt1u08x20VX+0jXEHv
         qXTLRsX1DBnbtnESg5WTLWRLIHY08CqEI/kMoftr0ZEG1AJnrwjl+HOHgiXjYlVwUX1f
         ri7YVFwQ8VBYa4c+IIMs0bFRIEYbibSuLARL4PkolLrtbMz/h5G1gNI87DwjtDeAVY0x
         M+Qp91UiTe84KSE3MFoTqCBhL+RO3kjW3IB7MT+7Gxd7lcnN4cuyv/eQwcbM53wUhmGz
         IMZbtYqK7dVHZw5cxd22IudFMsg8PEtadBOtJONy9Fbhxh2/Ev4E71KKtwfEkANZA+xQ
         G6Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xTG7Mc8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si702962ybk.323.2020.06.01.16.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xTG7Mc8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfu2Y-0006JF-4d
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftz6-0002FQ-OI
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:36:48 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftz5-0005nN-U5
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:36:48 -0400
Received: by mail-pf1-x444.google.com with SMTP id h185so3167802pfg.2
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=utp8UPhvpVOjKQDHheJJZxOdw9rN2rKIwvixqFfY6I0=;
 b=xTG7Mc8Ke+P7C8o56JElmLFbH18twbQfttKAc5G/dIXmkm2onWlNspWFfvusLOTgLg
 pTRDJq/tgRyR7y8JuLP6CZFE2Egd7bg09ZKOeD396awq3y3Wt4q7J+Liinm2BBOuvUrx
 PPw+rh9aMrrdNIj2zKTtH0aArySoR9V7wv0LwGc+yun4GQvO89nczwsvBnve0Xlf9HLH
 7jA8bUorURzKagLbFYICNCER7T+CBwhJkzcywpFi0y9NCCGAjDZRm5Uhst8GI6Mk+SKq
 qe0DI8YoF1wc321Lg2a7uLv3QwcS6piwxXYRRqVkl86ZgCgMmu7bDWT6NTv4v2CVRdQd
 XsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=utp8UPhvpVOjKQDHheJJZxOdw9rN2rKIwvixqFfY6I0=;
 b=K0qu61oS5dvUmNoxOiNXewmPdgbENZBsfHKY4kxSAkCJwuxMpGRjFuXf8LqNPXcc90
 yPyKI1KYwUgL/HVUSHHII9eJSRnPWH/i1xxAiAWFluQk387CZG7y7IoxCkiHuGBW1UI5
 Qz6qhoeuznBJOZlW3tdhbtgaR1U7uw9mX/BOKiczKPFwHeqvN+EFMqyKTDAZpoBXb7zP
 WEP/KcrRY9yzUpES1Hs6e2OOY000WnpvY9QTTLMHiNbsjJzcB9KiwBPIAXP4UKxjrq/Q
 vj7ZanIRqSkvX9FWyra2fmRiuzu5cUbD7BUvBfGqolp19QXWGXHNgpjCy1gEk92U2FBp
 /TpQ==
X-Gm-Message-State: AOAM5324HfaQbghOjfyT3E29KXxSG7Nf/kR8IW+XeLkI8+kz1zvQfNCt
 vBZ3lrOymXHvbMQFya1lKhKVyh2MZX0=
X-Received: by 2002:aa7:8c53:: with SMTP id e19mr22646004pfd.264.1591054606599; 
 Mon, 01 Jun 2020 16:36:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id k7sm452101pga.87.2020.06.01.16.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:45 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] hw/pci-host: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2aa683fc-ff9d-17ed-a35f-f177bb5c9e77@linaro.org>
Date: Mon, 1 Jun 2020 16:36:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9vzXe+8U9H+v

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci-host/i440fx.c    | 3 ++-
>  hw/pci-host/q35.c       | 2 +-
>  hw/pci-host/versatile.c | 5 +++--
>  3 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

