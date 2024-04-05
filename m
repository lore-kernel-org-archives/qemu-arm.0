Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp1019537eju;
        Fri, 5 Apr 2024 07:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWntIcEWu/adnSgxPu6jF7jinRqbCHwYa4ZWwyhKuUQ9tr8Esazz1Y40+vLtSPrNJuoKJ5HPKY5j0qsiLPF83rNXr704vhq
X-Google-Smtp-Source: AGHT+IGpYlNcAXqA2qnkwYIwgcs40htwtz5egIhXVq2o0sIcboNEh0UPyEQivyt/202GpVoxHn7J
X-Received: by 2002:a54:440a:0:b0:3c3:de07:3bdf with SMTP id k10-20020a54440a000000b003c3de073bdfmr1579442oiw.1.1712327193548;
        Fri, 05 Apr 2024 07:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712327193; cv=none;
        d=google.com; s=arc-20160816;
        b=xj2W59+DhBTDYWUJMenO+KHSN4ElCVhQvG7/jf/H5rwqgBiwv+LOO1Qx+tUeN6PqOq
         B9Wmi2jKGNq7TsiLzbHv3cfU2F/qFB1NHI7WygnfMs4qTUetuONAHuOVIh8W5DDPYPBP
         3q4swgFUKzi8zBTT41OwEQfx3f8pnE1s6JGAOhVLlOEPjcW38zHwfKK8Cvog786YfzGZ
         3wkseGU2YSdlSxv+ZFaG2a7hqis5xnYudfeI6CD9nCL3DelzwXvSI2gLufOXHesScKQk
         yu+GEnEh+ZDo3QQvGhBa6mDEAgQ2ATJOTFRdKUMriWNqzA85ItWhT3XWNRuVwPSWhX0Y
         Trgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9PMmZywclbaQRQPNoqGbY1UiA7EhTJ4HLYg86Zcitgk=;
        fh=uyDFJC3RTrSs/k/TMNkX1G+WYB1UWXuCJ6BoP2B/vzI=;
        b=MxIPVou/O1CPfM5ZyQWgmy5UaYNyStt9OtDS9AGAx9+a5PRxuCakp8TmJJSggB5MhL
         h6B2fGLp/r+a0mkv8hLSd+CqCQ7I8jItZEfLMRM2sBZw0OyH+csM9vuniQJcr1mfckDZ
         dKBhH0ouLa2X6tje0VZklZwTokIDKI8VCfULeeWeDVrOLvqSLsyA3FnvkwCNUiS++Ix8
         kplcta++2iGVJflKKQ0HUu2slZCxaVxOrUcQjqtiUXaMWPdWGzcJg1FkC6bjtaquBbwc
         ZQmnXU9NTi4DianT68V8bewhrgL+q1gTSQ+JuzvrdyDnSyUB3xhpjhSWYX948Ea729x3
         YxPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdGdyHS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a05622a121000b00432e9c57318si1853826qtx.390.2024.04.05.07.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 07:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdGdyHS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rskWR-0005Yb-6a; Fri, 05 Apr 2024 10:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rskWO-0005Xl-VA
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 10:26:25 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rskWL-0006fK-RE
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 10:26:23 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-516d756eb74so359262e87.3
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712327178; x=1712931978; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PMmZywclbaQRQPNoqGbY1UiA7EhTJ4HLYg86Zcitgk=;
 b=pdGdyHS5805tQbGghB4zCJAj7Z3IGCd6WJ6uZoJIqFDP0FcNxLryKh3J6gwVWn2Lb5
 4RPU5BDcilndE+DZGDiAXxsxAnTgyZiKuDviCgj07rDstFb5JIE65GyAxmU1CrSQ4T4z
 Z3blO5nJ+s6fY7u939zks7szWysX6qnRAh+CrvW6kOGEpk1YpiKzxCWObgB9xh7x8C/h
 WLuq00uVIs/Ktiz3AaRZHGx76gvOeJ38cytFJ6ZbMZKw2KiNw0ao99rghv2OIiJ1Z0cw
 KSRln4KXwFmdGORx7T6ebXGDtyvbbRlZ3XuAONhl26r8roqgP/6D5S7dpeNMS+0i88TO
 lbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712327178; x=1712931978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PMmZywclbaQRQPNoqGbY1UiA7EhTJ4HLYg86Zcitgk=;
 b=c8TZVB5UnCn2PngPV1URC7h+4G5WlZumeLQwSCrRgtaGxkuJe9MHOiPgw8rLdELd5w
 7ecHtXloFio8yATT+Ixuo3QLLRIGRsmuFb6bbFcdtAuwxCDf3ynWbK/1LuY1018gGSND
 QtctbY9waG9NS8g/NUvvGpUQaPxenu17YKNzP7AzN5ArvBsPzNKtcV6gV+YJHKQw88xs
 ziKshu5m8HdYFQu60Zm25tQ8aMYNp4/A6ev0w/8keGwt2dzNUFa/EDYW6DKG/lXSiNJt
 txMFHCVfMV42cSbYEZJ9Fd7LL17YzYnpB7fNofuySPmjo2AqnJZcxdL3nINpUvVOeoqc
 D4Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDpLSkWPUpBMDSlRJ6qg/fVefarnBeQjTUd3/sFgd7iVcxtQCAqyEk2aSKzz2n3H6lcjOshLMbSQi/DfwRolZpgaGV
X-Gm-Message-State: AOJu0YycXtODhQP+FnhHF7gui7tfL5sWwYs+J5I2Ywbb8SPrWzFTEoB5
 iH0KJaxQaOzlwHjsXV8J56jGnFK6lAlm3PCkiR5KT1hi8Q5EdAh2kLJLZNM4WNt+3bNJw/qpWsG
 xScvZuKt9lRnUITTepaprVLuqDLoBG8geGRqpYA==
X-Received: by 2002:a05:6512:3e17:b0:516:c764:b3e7 with SMTP id
 i23-20020a0565123e1700b00516c764b3e7mr1483708lfv.9.1712327178219; Fri, 05 Apr
 2024 07:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240329174402.60382-1-arnaud.minier@telecom-paris.fr>
 <20240329174402.60382-6-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240329174402.60382-6-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Apr 2024 15:26:07 +0100
Message-ID: <CAFEAcA8RhS_wMs-89YkKQq6Rc2FOX2VFZNG7Vcm7OKkbs2DgZQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] tests/qtest: Add tests for the STM32L4x5 USART
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: LBZngqH68YhQ

On Fri, 29 Mar 2024 at 17:45, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Test:
> - read/write from/to the usart registers
> - send/receive a character/string over the serial port
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
