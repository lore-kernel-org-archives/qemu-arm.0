Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1715114lfb;
        Thu, 21 May 2020 09:17:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa5DKDElQukOJO15Nsoeurmt6G4di9gjRYqnWeGqYTf481INCPV9T8SXRNG7ItXhHP6mqC
X-Received: by 2002:a37:484e:: with SMTP id v75mr7612842qka.79.1590077867640;
        Thu, 21 May 2020 09:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590077867; cv=none;
        d=google.com; s=arc-20160816;
        b=DdnLUv+NptbIpOQ9jVdlBMOfc5fP9G5D3YNrQMlNh3p9nw6NRwHO6Xfwoq7eFxc+3D
         3RbnZU2vaMm6Qst1hyNruXWjl+tQgL8X8I0nrdja8xctVnB7Ek1YBZ2kqFZ4LJFrTO1E
         mt3yZw2s9+vNt24coe0WKt0j+72LRxdb4v472l8+tC7PEPCj+vNZxil/7EhaV+2ufc7+
         ehekxchiujWHdBNmULuScN2AKV2e9VEGsVR7l8RleT+H+to5x5dQRMKLz9wjLiFiOFnU
         /u3/0S38o3QE5pCdx6EGQZbRJUvezjPbeBsgfNmeZLJT5tI1Pmcy39Zf5bVivVWMOom+
         tImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2JI+Av1Ovo2Syn90E3yCfRxColS1heXQKpbmWHKc5mI=;
        b=eFZtOGqP5ICkmoy+I9zsNiq9YYmKXCJ+Cfm37bXNUDlQjBs2Y9jK4p8bx3on2gGr/3
         OJH9qBBxVsxtL2TdJqa91qJzJ911L5EqeC14dvFtI+44mCyHv1r1iaIa950VDGMfBHdD
         6ZADPLGiuxxFzLECbuaFVM4mnpdW4ZQZZlZfsoN3N6cQ0QwZUkhiJ4vu7vLDcqgwr7If
         Os4KPfdMxxVy+VTRBWH9a6R9iKRutRNg5URoYdGwOMG7J7E8+wY7tkw4tSR2FR9+KTr9
         OmF/AYAKxnCtVzbeJHHCkqkQyP967fWRJWVTaMvRYhhaXdWrE6IuwqBep5vZnWQti12Y
         HDKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qr5eVhrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o28si3742435qkj.97.2020.05.21.09.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 09:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qr5eVhrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbntD-0003Ik-1w
	for alex.bennee@linaro.org; Thu, 21 May 2020 12:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnt5-0003Hd-BR
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:17:39 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnt4-00017t-5Z
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:17:39 -0400
Received: by mail-ot1-x343.google.com with SMTP id a68so5912713otb.10
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2JI+Av1Ovo2Syn90E3yCfRxColS1heXQKpbmWHKc5mI=;
 b=qr5eVhrZKgNcCTxo2cw5TwmNixVz2X7nCMEZGMJ/Ytb7vjvxurwRnEmFDT4wBqyETl
 ikhQZHmdPuRpAdhlRus7cuhMn18mxjLMJSEiPEiYwkKPdbBcHZm90ZhKTQQFiphp9LlV
 yQE7KWXMzzRaJvf7jT9E1rRAraPPJVJ9+bzmON5cCXStzYIGe15DJyDv9VJowfiaYEV8
 L880byA2XxPvAcDx82ZToeJ3pphSz93Al6yVyPBpc75jxyaxhMIc4NcMo0DKP5SHmiqp
 j2MfUuv7skQ7Zpb3yMcW3iROgC7PoR5r2HApOLZ82g8TyMTqpwidEmpUoRt8t4Ilw3pB
 IP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2JI+Av1Ovo2Syn90E3yCfRxColS1heXQKpbmWHKc5mI=;
 b=Zk8UySNm98O4WtEeJtBl4nAuXud7NWpi99NEqtpE64QdZYzw3yoTeRURyodHDI7E/w
 LyRVx9WEuE+/7BZnf74SPeRTAbCWLE2TAatigZoIhkrxUT8IohmsSsmYMW/PX+eUBoDV
 BQ7StxYKvMUgrfUhyrdVqG5bImmzpsO/xlKDr9Us1V75aN5jVzCLDmNLlU/zsJxyQ0+j
 yAbcnfHSKWmHb2cLSASIUzI2acFKvkso+YxEhwqT2OetoCOvFfk0KCDB4XGbaEgdbbit
 99WHwZFtDfnKbuwYXDgIyZZ3qmtMh8FTBv39gpmnAopTI7VTYeqfh+xISYV0n5IkBVgK
 GLgw==
X-Gm-Message-State: AOAM531kvD5I6h2eDOyyJUKIH7MTGeu+Y5Mkvg6hNG8deHOuzhKr2pK0
 qhZT34iu7NrJ9bjhyRa5FJO4TCHUwOiWTevOmU2p/Q==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr7266133oth.221.1590077856885;
 Thu, 21 May 2020 09:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-7-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-7-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 17:17:25 +0100
Message-ID: <CAFEAcA9UampZxo-4Z=6+LKkC9HLrdGYT5AcLyiGVYvgU5VE+cA@mail.gmail.com>
Subject: Re: [PATCH 06/24] armv7m: Bury unwanted "ARM,bitband-memory" devices
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1eEqDRA4dhqy

On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrote:
>
> These devices are optional, and enabled by property "enable-bitband".
> armv7m_instance_init() creates them unconditionally, because the
> property has not been set then.  armv7m_realize() realizes them only
> when the property is true.  Works, although it leaves unrealized
> devices hanging around in the QOM composition tree.  Affects machines
> microbit, mps2-an505, mps2-an521, musca-a, and musca-b1.
>
> Bury the unwanted devices by making armv7m_realize() unparent them.
> Visible in "info qom-tree"; here's the change for microbit:
>
>      /machine (microbit-machine)
>        /microbit.twi (microbit.i2c)
>          /microbit.twi[0] (qemu:memory-region)
>        /nrf51 (nrf51-soc)
>          /armv6m (armv7m)
>            /armv7m-container[0] (qemu:memory-region)
>     -      /bitband[0] (ARM,bitband-memory)
>     -        /bitband[0] (qemu:memory-region)
>     -      /bitband[1] (ARM,bitband-memory)
>     -        /bitband[0] (qemu:memory-region)
>            /cpu (cortex-m0-arm-cpu)

What does "bury" mean here? To me it implies "they still
exist but we've stuck them in a hole somewhere and covered
them up", but the qom-tree delta suggests we've actually
really deleted them?

thanks
-- PMM
