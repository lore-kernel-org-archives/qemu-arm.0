Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp872732lfm;
        Wed, 8 Jul 2020 16:41:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLrUlD9zTWLBb4bx0qm4dE21WzYoTioV7bbk2bwu7tnrtuZxRajSjyo77tZZ+p5ZZBuPFy
X-Received: by 2002:a05:6902:4ae:: with SMTP id r14mr53395588ybs.55.1594251680785;
        Wed, 08 Jul 2020 16:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594251680; cv=none;
        d=google.com; s=arc-20160816;
        b=U5zN1eOv/l2JobBRfmNLEeIFzppbYDVf+bTFJ/WoKV3g6ReakHrbvfIlbz8oI/exZ0
         8o5+6RUgyldOaOO4hA/lS1wolu9fuFH/Xskt+3oTqjGd7/SrL6n3LeN9X+ZuV02AFhrx
         ZzJL96cTWaAuOtSU0Gwr+nGzz+5p2+FrF1uKNgjHL96WjwtQjIHaBmEAGbq96VsuM7ET
         09x0+xa80jQ31pn1/X4DJzuCpAHry1+OuuaBr5mPpIGJZY8f7m1ItDrgLASAraKo816Z
         iBxMUYGpAMCJUSX6w2H/CaOLKo5/p0Fq8gNwl+cx96FalBSbH0I5I54RObYzNS9xVUOT
         Qeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1UkOWbeQctjkd0+Ogbpvj1L/TqjRumxU2EBvZJQeXG8=;
        b=YJTrHDqKaI0ZjBbjJy/D+ucc2zioC3H23kf1jJdMFL5JRnrv/LsYJ6LiqPEVf03vK4
         +ciH+HxUuZY3GgLh1zfxtJYMlszLxJvde8kKxUJC625WuLxKiE5dvGEfb93wk5UhY7Wn
         mO6byPY2a/S0KGH/c2UQG6xQ3f9W1LjR3OxvJC1sM+D5wNikzhNyvfaoCM168/wOvvdC
         ZY11aPz1YUep6pU0eeE16JVajdlmh/BAMj26qDUFr+KCBlOBHLv/bB2QOFqWhL8X4r05
         syKx84gtXvvieMsA0+VYFikqNoEUD//62/qeejkeT9HE0ylXLoKh/GjYbSs994CsPDg7
         i/UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lb7+FHUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w137si1032638ybe.494.2020.07.08.16.41.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 16:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lb7+FHUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtJgm-0001px-72
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 19:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtJgY-0001p9-9m
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 19:41:06 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtJgW-0002q6-3B
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 19:41:06 -0400
Received: by mail-pg1-x542.google.com with SMTP id d194so90094pga.13
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1UkOWbeQctjkd0+Ogbpvj1L/TqjRumxU2EBvZJQeXG8=;
 b=lb7+FHUobW5Qq1NHHtLjA7ApGrLtrv1NcfGvuz5vU5bYN8X0vVpr3c/e4fhBXSOIpt
 2LxZPTqSIp0UXbRM3EisPeeiZriowVWNMaai+PDH1F044Z7eFKTco6hEmPUspARhgdT3
 LpHQvfPRLD6HDW+oQLDkYrqAOQNyMLxCly5Tm/MrOb2lop6W6g3In1HqTGjXNk8DAJvH
 9zj3OOD1FqUVkBOrmgcK1kBinbADFkuRYbn/ISEDi6iJ7lfHcUy0XK6WMtzFKmWG3qml
 vX+39Vi7bpxQ9fGb261Tbt5W4NZ9nRYS5UO82lqTQ0vxYE6ukRVsTM/6Z9Ci2acOGaQ9
 NyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1UkOWbeQctjkd0+Ogbpvj1L/TqjRumxU2EBvZJQeXG8=;
 b=hGz/Id/hknZMsLb9vkoGumMWGE7UgP7PKJsMMGzAxZaK9tOlv0SRrYPHzPVo7SmkM9
 t1PyNQykM20BnbuLUI+ri7jZKpRNlKONOffX1PUCzWZEbt9LyrY3KkWAkpYL8XRjAdzc
 OFT6tlV9T7wtpTf8JCIcs9RUFpdIzNJWizaFL96Q+VEGnpT1Da/KzFci9Vu4g5+cllgx
 oqztkpJjqp9Ci10r/egHPbYPCPF7DzswTdaPu/x6yNYAve+D+nmniRPbJ557FtkMcZp+
 vdfmElsFKB5ijUSGYWeNyq+SBuYvLuh3ziuuu9SCGfy7wviyxq3n+YiXhKe5n1Ve9qga
 ziTw==
X-Gm-Message-State: AOAM532ftslPMu/396FVlV8rupDaUAhK+M8N4HEW00mQjbkECV4/aJD1
 T5SAUECx5kKxJH5ckeyyGu5k+g==
X-Received: by 2002:a63:7c4d:: with SMTP id l13mr51986513pgn.12.1594251662283; 
 Wed, 08 Jul 2020 16:41:02 -0700 (PDT)
Received: from [192.168.7.121] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id k189sm762822pfd.175.2020.07.08.16.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 16:41:01 -0700 (PDT)
Subject: Re: [PATCH 7/7] hw/watchdog/wdt_aspeed: Reduce timer precision to
 micro-second
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200616075121.12837-1-f4bug@amsat.org>
 <20200616075121.12837-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a5a9f82-8646-6a11-6633-ca714b76a482@linaro.org>
Date: Wed, 8 Jul 2020 16:40:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616075121.12837-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J7tac5V164ap

On 6/16/20 12:51 AM, Philippe Mathieu-Daudé wrote:
> -        reload = muldiv64(s->regs[WDT_RELOAD_VALUE], NANOSECONDS_PER_SECOND,
> +        reload = muldiv64(s->regs[WDT_RELOAD_VALUE],
> +                          NANOSECONDS_PER_SECOND / SCALE_US,
>                            s->pclk_freq);

Similarly, I would prefer MICROSECONDS_PER_SECOND.  Though again, I don't see
what we gain from changing units.


r~
