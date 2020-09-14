Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1869689lfq;
        Sun, 13 Sep 2020 18:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB1jwDA5tRx9A6EMpQntEr7XTfKqRT9KMwzDF1IY5GKsjFy1QY9ngDkX6lK+d/VlTl6MA6
X-Received: by 2002:a5b:f4d:: with SMTP id y13mr5928504ybr.480.1600047964619;
        Sun, 13 Sep 2020 18:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600047964; cv=none;
        d=google.com; s=arc-20160816;
        b=w6Nj6rzVcfpAdVuCV46xHPWi4sIVNyomIlPJSR6brCYF5hoWNu/dzhrpLnDKOT0QyM
         LY+mCQdaY9rVrTSxBUekOuMWMaWcE2chz8IA7rnacbuWLD0KHQtLu3PrMil88sn2oIeg
         xX7OXitMgTUBgT0/ToZN/XaTlDRpFd/QRcwpXt3VPluZgxGvpsFCgXxDlhqN5E3q2VEH
         ZYs/jx2kuw7ziaOh5rJyYmFNd7pr+KHTL1a9juetDmljLP0QFD/YddA1JQ+LDZY7cdMK
         lFIiDNYIeucjDHo+EfAomeOMnyTYhZG+RwRNYusb/Q0HAARQxEQ5E+n4xO8k99TB9XlC
         pMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3LihhM1ePbr3F1AZDzpEqifVn3GiR/199hCi1SIAod4=;
        b=kgHyaaD++vAzTVtMboWLJS6NjVwYqwd34eSsGWglnwncDpuKeIh/D+/EnxYA2ooGbW
         7Qxv2giuP6w1VU/MYrt5pmyrCQ08YakAsYgK3r4RfWiP7o1h46MNaJACMmUvmjHLryas
         YVm9RgVdhF7sWQo22sOpH56iVG/W01IJshrCr0yh9U747ehEWstr1rz93h1icBA+4fZY
         vzWOux/Ij8/LKXbzmSDnu/Yg0b2TWq3xT1g8BaKEclJbvW2c02mpwVlSwTYlVgzYdoNL
         Bb9/qKCjwJDnvuSOCvZEbI8tgfvG+Fw02ctnX7lkhK7sdK9CbwHaUgu2kVQcmqEYN6+p
         O69w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBiP++UZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h132si9053054ybg.268.2020.09.13.18.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Sep 2020 18:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FBiP++UZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kHdZE-0006d9-2H
	for alex.bennee@linaro.org; Sun, 13 Sep 2020 21:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHdZ6-0006cn-Oe
 for qemu-arm@nongnu.org; Sun, 13 Sep 2020 21:45:56 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHdZ5-00074N-3I
 for qemu-arm@nongnu.org; Sun, 13 Sep 2020 21:45:56 -0400
Received: by mail-pg1-x544.google.com with SMTP id 67so10215672pgd.12
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2020 18:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3LihhM1ePbr3F1AZDzpEqifVn3GiR/199hCi1SIAod4=;
 b=FBiP++UZ/My1B9muJqSXiYqcloB6NFqrowYZwv+GClONf/vSby0HNyvBd2tVb/D8Gz
 auTp74kZdr7QT5VM7xvJSw6lKO2sj+WGuvmo/HjX954DCUDo+Vl4hiCBiXqpH7Qm7/YB
 xPW2BWfcJYrHxHQ/W2iccUSiagGRRSFsxOhcuYawoZgprmeGiSwfPtWSxSc4ZBvlaUAL
 ig34pkwfwPPO8ZX+7wSxYg9NbdPju1xeiNwdOOz5yUXwXoYoAsBvHRD/hszVzSu8ayHf
 Oumyu3LyIKcO1uOyWKZDTIlABY/0P5w5bFmwARXLWFIoORCIvvajSaSDJ7K7OMr+27MP
 Fx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3LihhM1ePbr3F1AZDzpEqifVn3GiR/199hCi1SIAod4=;
 b=q9GpSoh2hq/PlZa7ooEwqnL1H4CRrQ4x48qGe8sBRXJ31A/jZKs429JcAZ0dtLwdGR
 NH724ynWp0QIkyRjjg/VoMgpzMa6dCxi5/JivKH5xqGZ5uiJuYgU6Yi9Mgpdo12OyQAS
 NvvyDovG/osoXcYuec9lLm/D820aPIlYvpNOabfDHBGCp46qSaWzT+MmqOTV6IxqH/JN
 YzO/MmrvQa/QQktRRsTyhDKGB+XW3okiNus2fmKigttwal55d2d19+CjqWvxqWuYQXlJ
 UXyOFpd5hakjkDtUBT/yvvRJT7OHgFehQb5FLiCwhmNrgBlo7WBnw78C6x+nlfuKf86p
 Usqg==
X-Gm-Message-State: AOAM533mj5jLlEX7/Od3r5wkHmaqiPrMaXrJuEIvrTyRYp36MbXQyrPZ
 +vNknId80//SnyoHUKY07ff7Qw==
X-Received: by 2002:a17:902:b583:b029:d1:c807:da44 with SMTP id
 a3-20020a170902b583b02900d1c807da44mr2673096pls.15.1600047953482; 
 Sun, 13 Sep 2020 18:45:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u10sm8411250pfn.122.2020.09.13.18.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 18:45:52 -0700 (PDT)
Subject: Re: [PATCH v6 2/7] hw/misc/led: Allow connecting from GPIO output
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200912134041.946260-1-f4bug@amsat.org>
 <20200912134041.946260-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d33781e5-58a7-f94e-a2bc-8c2eb763f2ec@linaro.org>
Date: Sun, 13 Sep 2020 18:45:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200912134041.946260-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Et5zcNHy1Yqi

On 9/12/20 6:40 AM, Philippe Mathieu-Daudé wrote:
> Some devices expose GPIO lines.
> 
> Add a GPIO qdev input to our LED device, so we can
> connect a GPIO output using qdev_connect_gpio_out().
> 
> When used with GPIOs, the intensity can only be either
> minium or maximum. This depends of the polarity of the
> GPIO (which can be inverted).
> Declare the GpioPolarity type to model the polarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/led.h  | 10 ++++++++++
>  include/hw/qdev-core.h | 16 ++++++++++++++++
>  hw/misc/led.c          | 17 ++++++++++++++++-
>  3 files changed, 42 insertions(+), 1 deletion(-)
git-submodule-update
