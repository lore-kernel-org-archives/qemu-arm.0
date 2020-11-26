Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1787149lfb;
        Thu, 26 Nov 2020 13:55:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOpKAQPnVR+BU1hdm64WeBF0ZP/LHqEwrxRqOHtv/saY+hN5NQcbhoJnhuIfGAw2a/GfYL
X-Received: by 2002:a25:e08c:: with SMTP id x134mr7058693ybg.309.1606427728994;
        Thu, 26 Nov 2020 13:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427728; cv=none;
        d=google.com; s=arc-20160816;
        b=CwAtFt2Hg9GNEDhxUjRfiPF5H+Fu+V1sy3oIDSdPn3CxE7QmJ8gEsLLVVWo2L9/EZN
         TghjQdGXt2OqDK6TEWW+M6bBFZjTeDy91wiINFi65KiEP6t1VAOZANRaC+R2qDvFhhn5
         Df3HQujcwNV1+VvFslpA2YgAt5HOe70lJw7zUpZIXHNjkDklu7n2YtvpuVoTE2Gewo6i
         lzBFIglQyvXX/2upFdIp+9H7/egnMN764Dgk6TNwQDEDiawM6wfDFM2IbNyWPX3KRaUW
         8+F0TuQRTjyb0VA0Zl0Aa6Piassht/IjoZvKw81f/0inqF9J4uLT6daCZUgs3RMgY5Zy
         SN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5M25w0ewa3ePAjQJgnuQczsXjkUpzvF1Uo/x6shJok=;
        b=H1LKUSlmnAARmkCyqk1QuvMcCQEEAXprJtqb7CHbyjNiiRa3OH/Lcd1pPn5z5nD+6t
         DH7Wb753cTz8c9n+xVlmNZavhhfW5FV6jBX1v7XFBtK8YM8akApllQP9rqexwy86uS0W
         OszgEyCyYzi1n6fTgda8TnjisrNTs4YSCbbzg6ZZsNFq0aIB9uHhDmTPffccjonfxovO
         cN7ulzu5Ebu6yB9gTjgrK3XRLYnLTrxG82uTZvC1GuMTbs56wP9LSE7EiNdHRIw8XJqn
         ezlHeb4bZJIcrhqk3ws4YItJNZcZiVQz4Re4jIGCOaYipz7nmBMaA7WkiNVWwkRP5EOQ
         FHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KTvY3eFP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si6584893ybg.329.2020.11.26.13.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:55:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KTvY3eFP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPEe-000793-E2
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPE8-00076D-EL
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 16:54:56 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:44151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPE6-0007En-Ot
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 16:54:56 -0500
Received: by mail-ej1-x644.google.com with SMTP id k9so4790070ejc.11
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 13:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5M25w0ewa3ePAjQJgnuQczsXjkUpzvF1Uo/x6shJok=;
 b=KTvY3eFP/jWf/+PQzri7m7ZQnG/gwnRxACRUSMcbfgf5i/wam3SqYQOgfga3WbVeMG
 YuFR4+8hhYDOLRMaxWydwI2lN63UZ62L3zbZMkovtt9Ie006kcjMsX23lX5HWYus9Snn
 wo+sMlSNM08sfFCta6jmBZUa8Tv7610cboaCDTHDQVW8g0kk3mRjbzhk/soihOdabNRv
 I6K1RXJoBw+RVIC+VkB4vyKpBQWAAgb9c9euCMPmMILSzWdPKwKVLoplRTlzgrxcXC4O
 Uk4gApOyQGNaYbMyNZL2SFlPXhaZNpdpBAQBKDmw/Aq+sFF4R+hd+YGpCkkSj7mPQwlR
 yd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5M25w0ewa3ePAjQJgnuQczsXjkUpzvF1Uo/x6shJok=;
 b=smWOXYdNXIQ/hNX2qRlw0iUCBuUHRU0pN+XLleOvvQh78KkmGvcTP42skHUL2F5VPa
 J/ETRqnxpvhR94YOlScaZDpUtEksmX808mASXwGYo24FpTggrW6uMITWJRelEKpDbBjZ
 WPVZO/QWryTT+6Z+ESYisCj9MiQCf/EaXcszZETaVGLd+5I0CFYkbhXZFUHKTcUQbINA
 BaRKxdzsO+eDyU77I23KTYuCsC0KLXYRwmLcZdlGXwh8FXkhzhEVTFqJ0d7oXwblyxk2
 QT/dOQoschbuHE4yBK7IbzVPUrmMgFuunNPbfYYdlaj7jSsEC6N20l5vJ4GQ2Pi85vug
 ChgA==
X-Gm-Message-State: AOAM532IDvrWSzmxWAEO3yy23iwzPcosWPLabSPHi013EsugtvUucHL0
 qgYbQfmPm3PzEUNIG0QBn0M7v2A32mOd+40GCP6PNg==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr4279457ejd.382.1606427693027; 
 Thu, 26 Nov 2020 13:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-9-agraf@csgraf.de>
In-Reply-To: <20201126213600.40654-9-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 21:54:41 +0000
Message-ID: <CAFEAcA95L=25QM4BTPbDV6HXLXD5zh+50WTVtrK=fKPwynV=vg@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b1D/GVVs/7o4

On Thu, 26 Nov 2020 at 21:36, Alexander Graf <agraf@csgraf.de> wrote:
> The Apple M1 only supports up to 36 bits of physical address space. That
> means we can not fit the 64bit MMIO BAR region into our address space.
>
> To fix this, let's not expose a 64bit MMIO BAR region when running on
> Apple Silicon.
>
> I have not been able to find a way to enumerate that easily, so let's
> just assume we always have that little PA space on hypervisor.framework
> systems.

If you have direct access to the host ID_AA64MMFR0_EL1 you can look
at the PARange field; otherwise start a stunt VM and look at its
ID_AA64MMFR0_EL1.PARange (this is what we do for KVM to query various
things about the VM's capabilities/ID regs).

thanks
-- PMM
