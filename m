Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2736908lfc;
        Sat, 5 Sep 2020 20:59:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTM0jRZm2JJCvWloC/NcmrkThw41JjCAPvUQz38lNG74nonP2l3EDmNr4htMp7/N6BDyAp
X-Received: by 2002:a25:ab2f:: with SMTP id u44mr19651260ybi.318.1599364745542;
        Sat, 05 Sep 2020 20:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599364745; cv=none;
        d=google.com; s=arc-20160816;
        b=NwAgJPVj5jHqukFnwLC1yE6gaiYB3LX5xtPGTUYGmJSfutPEmz18jIIghkCthhvfzb
         jyM9NQIwRKUwD6sXq/qCiOkXHMcbRWXAxxhleMoIW7KuqMfq8faeZMxi/DAM63jud3gV
         OoIi0NE4RJuIswzf+XGFvtHovbRnb3iGspfCBjGFzQIZ8/+Emm/2nSdgQQ9jtnxGGhQc
         TKaeXjewTkO0ow3RNpyBYJEvx8jSa9wY0FMU2IH3q1tDj+D8YKZa+tA7NeNeW2w9C2f/
         rA5tKxZ+L7wgG58P7zWp0Gf94I2Se3RDFFYgCVffB5GM//EXbsSeui703lIbiOih1gYz
         IIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=m2bYMEGomk8hFaxqfnpouoTbsg/xQOjjaCJvBHSA7k0=;
        b=xEW5DUtpb4ml9dFgUNKskLSMpZH/7sM22FJM48hAt4/GJY8ZzD0FeIfGsfIxIchwdh
         yMCj5vr9wXhun89+MJcUtSvxeODQYBFuQgZloz0TnPUus1nqX+A/QdI/NUJ/dUKQW9h8
         k8IBmRbhzamOgNX6vEmOAIRAmM2o0SnjEFjUCGpOSpLOXk16tTbkOMad75lNLrVj3wsl
         iKOeWEXaZVdn5hVQhUGk2AcCpkyKBOueaDNHSOZ4yUeWhsDxV5qcPVEtvBIor9q2Utbf
         dBjGVtoL2RAMGXiGRmi8GbDu4G5SDmV2lWSTBchroAYe61F0jGqpboWckIHoQ105Ke42
         tIkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zk3iZdvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n81si11794265ybb.351.2020.09.05.20.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 20:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zk3iZdvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElpY-0006z0-U1
	for alex.bennee@linaro.org; Sat, 05 Sep 2020 23:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElpQ-0006w2-CE
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:58:56 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElpN-0004wh-OT
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:58:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id 67so6356274pgd.12
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 20:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m2bYMEGomk8hFaxqfnpouoTbsg/xQOjjaCJvBHSA7k0=;
 b=Zk3iZdvBP/jhMTZhyOl8NROR0TjohTsPb7ZUme9041tL1oZbCi9N+9KpL3EjSe61yn
 z7/ZQZEDySrZjWQ0/MC0GJ16vrAUWJufpJmRbd4SRNNX7/mKi5rbqVuzmTGofz9azexA
 K0v4Xv6HjA8OVNlB57hvqsYHA1Dikbo4W3vNIiByVPrmvcymPU9jEoF1gzh1HvYWaK3H
 nnlaOBnFK5zdkx3Hn1SQcfv0j1CdfDFfyLaoqEWmutx+GDl55GR6nH2EiAzv80ZJnSO2
 uyQzepBPviTWK/ZPEnnT6QpGhHcyDEcOxbqw+2jwZkeqLuVgWE2YdTeW5EY4r2auNC2s
 QGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m2bYMEGomk8hFaxqfnpouoTbsg/xQOjjaCJvBHSA7k0=;
 b=VxC4ZLlHhWFK2ur54AhkNpfOTTCv3UlEF32QTfYpOFQrfwM4xpUJKpEtpdEJXIfoI8
 M7tgNcIXajur8Legw8iR7INmMNwTmzNChqEAyE/f1MBcpcgGfrv427YU1WZBgik1o9gz
 TusChZNjPKBd8dH697ePZ4C0dSr2vBNZlc1HS63rG9gSPD17fxZZiTqjLrO+WvgnN8fQ
 Zhz9HM9JAUUHepMKKTGLtKkQ5sl/xvlnc6fq8jUhFPPeF4rWxKotitxLKoMAU2MoJKou
 3TTvkTiEVRr9cPueRsjEHjQqv7YZLUD5bgMI94WrDrilR7YuzW9TDDlEOO4HKjUfponD
 A16Q==
X-Gm-Message-State: AOAM531yIL5vs6yd0AANXQ8mYpIn3/oQbgeQSD9LikoVIbuD1LCoNuu5
 nAN9ehGwlpXmBdPomtfES3TPOA==
X-Received: by 2002:a63:6d0d:: with SMTP id i13mr12798785pgc.372.1599364732557; 
 Sat, 05 Sep 2020 20:58:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g192sm3490029pfb.168.2020.09.05.20.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 20:58:51 -0700 (PDT)
Subject: Re: [PATCH 07/13] dma: Let dma_memory_write() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-8-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ccd69c0-79b0-d6ec-9dcb-a0df245fa9d9@linaro.org>
Date: Sat, 5 Sep 2020 20:58:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGW2Hb7sT3Wb

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> dma_memory_rw_relaxed() returns a MemTxResult type.
> Do not discard it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

