Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp540652lfc;
        Thu, 27 Aug 2020 06:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5E6NE5WDRw7j5vo1RRy2uyZqzrMHtQ/dGIIU+36nsgJX8hoHEDwbO+RkYugPKxXeJKVWo
X-Received: by 2002:a25:4252:: with SMTP id p79mr30745107yba.229.1598533305139;
        Thu, 27 Aug 2020 06:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598533305; cv=none;
        d=google.com; s=arc-20160816;
        b=cZzGZmDLcNgmpqibxi9gJm/BOb2XDZl8sMrCZH4NduwILBuMsuC8Lb7nNoTz9XMee5
         rY6MZn0lk1BXnWX4Mmx+vknf+M6boLoghgRZMK4AeMmFcILKuvVV+Lgd1IDEutw5mGMe
         9oAyFs3fjL/eGx+BsdT3oVGWBfkY6jFkzejjAosYzVZ3nzFkeILKdAPmSLBfm689h4Wd
         xi/H9hrWSApd5JqVYoD6XPgUnRqQiDpScIeB8SoYCyc1QIJ6Zq4jaab7Fa79eyecO6Lp
         P071kevhaVE43dsRWQ8NF0LFDjXFxup//9XusdddcAYj4V8uhvLMI/xmdiSdGKO0ZtMu
         ZwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HwnMBZ0Xa2ornS7ieOgEsGB/1HJECozKOZjHwZWJ+WQ=;
        b=NCExStPq2GAumtnOq1ZtLe5OfAvhIP15lGZZe0BCglr7Hy80nTjkyV51SJejmL1nV1
         LweQwShA1L9z+jkYDrWMzL5HUJzEmYY+jV8lGvpsGAA2pQpMZsayJYtXR/W/rawkFVdP
         kBtScNcMYXuLPfFWVxusYLVJDbWzXBk75gMgitnDX+5l9oVDFLIwKqkjFIWNa+Rj2KNn
         m9Lh/vj+mmmQAiO994rWsx0ljfGjaBV2/nGj8mBykEdsb1iHaFp6M/8KetBkgK9WRohS
         LYC0UH/oxWkn5bNwea33IYs68VTwQ+Y4xcw8eZlnwEZcm+dS81Rs3mmRAXBOJKjMR4yP
         p6Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nVREqagB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si2473522ybd.409.2020.08.27.06.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 06:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nVREqagB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBHXE-0005AH-Dd
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 09:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBHWg-0004g0-73
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 09:01:10 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBHWe-0001BX-Mi
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 09:01:09 -0400
Received: by mail-ed1-x541.google.com with SMTP id q4so4845530eds.3
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2020 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HwnMBZ0Xa2ornS7ieOgEsGB/1HJECozKOZjHwZWJ+WQ=;
 b=nVREqagBqrseSpBqJHNdQ9sdHZDC2c9Kbze9ywB5xGCV5mOXxLg3lqtkj12UBtmgqm
 zl6DIeHc19ephe9YyfDslOPwTzGnBE5iFchjBmxW5q7dI8SBJJqtP7sVSZQuumd3Bnt1
 VHc5uglgaedNII0lk24xpGuzCHkZF0BGxC4ZEbLoou5GDQlBCMGhbR6WzGb0aJAA3Kod
 M7bBpMcro94Y3s9Qdp2LuT+/ma3XscGYQYI2Xr4CmJK3VgXfHIJd/GcZ52NOEo43zH2C
 +VjNDlZyEkKDbVc5vG78Hy9Twhq13mlXAWghNZdqmi2pPiMgV5T8LjGlH+u+ZqojrqiQ
 FUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HwnMBZ0Xa2ornS7ieOgEsGB/1HJECozKOZjHwZWJ+WQ=;
 b=DOcxToSFswEZel2fHtNSHy9qjDIvuyz49Sk1r+gZsQEue4IGwyk9Kx9ipSzoSf448L
 SDWMCOYHZwOmFHyisvRhW08CdSjYFXrI3tVco+TO+T2HergWU3Q+8F8k/QlSQrLyj5FZ
 mx2VPpCRq5uFpT8eONEbhiU9diWPt8Ul5y820m5m0yalOwma1vvc3VVqyj/VWwwxbR1e
 UYK+O64+IGuC3sP60Aki3A5QZA+4J6bTldwbGTXHIRyrca2x1j2SRNdoBhWsuIR9ZTAE
 1gXhl8PWta/u5and73d+p2lPGjNveXUUCwvDkM5ze13lpnGnbhJN4TpoMXadntTZc1Vy
 UHxw==
X-Gm-Message-State: AOAM5312cWsWI/ZIgaRBpTSZjT19nPrjCd2McfLbvgvm/wMNBWLbfhXo
 8fTqeXDvHeZIHLpmyV2AK2yQdf3QGkIU9RQZZJ/JyQ==
X-Received: by 2002:a50:da44:: with SMTP id a4mr20307706edk.36.1598533266069; 
 Thu, 27 Aug 2020 06:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181006.4097163-1-ehabkost@redhat.com>
In-Reply-To: <20200826181006.4097163-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 14:00:55 +0100
Message-ID: <CAFEAcA-VuODmgo=8WeFP=gEBdOr8K1HxvPN7hdp4AYHnBh6A6Q@mail.gmail.com>
Subject: Re: [PATCH] armsse: Define ARMSSEClass correctly
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CIWDOhVw7Zvb

On Wed, 26 Aug 2020 at 19:10, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> TYPE_ARM_SSE is a TYPE_SYS_BUS_DEVICE subclass, but
> ARMSSEClass::parent_class is declared as DeviceClass.

Whoops, I clearly managed to mangle the definition of this
class quite badly :-)

Applied to target-arm.next, thanks.

-- PMM
