Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp250566lfb;
        Wed, 1 Sep 2021 01:04:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgbtsCckXBz6FOypjEQ5R3DtmaVqTJpVEvfd7CxCeVulCLgEZ1Xr/9UFGE+t5/s84GtSq8
X-Received: by 2002:a05:622a:198e:: with SMTP id u14mr6875205qtc.47.1630483446716;
        Wed, 01 Sep 2021 01:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630483446; cv=none;
        d=google.com; s=arc-20160816;
        b=xHH7ZFp4ifNELSNCztyuaRTLO3ughXVI/35BjymfjEfZX8D9PTIzMN8Okct/adfEwv
         vXvyV2iVpvF14EumLXkpKIvjP1mLhqRGAERD6IVhfWJ8pYAejsbRuXPXkGilxZ/KM5ow
         sEFgt4qHYungPKTQxx98g8+68BVKBRpFoG7RP+KmX5bb4dBvTrlx6W7IL4RITHsiY45N
         IM0MJGxW8ZpjlygvJMY0bonK5sxhGWHy4qIpDONlFLI+L8QR+k/sX0FzUJ7WgRHKW7v/
         zeSkdDJ1BC09rYBCIrqPxPbrecXRAyJC6WZrcZPDoj6g2OdHZNODlph2qtugiSQ6R9rZ
         B8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDt2ROSk9hoFzPAkovRW/KplVuckM6z30AfhNKjm5tk=;
        b=nHHeJZ8LW5u5hjdGai8slKW9v7m2xOMFIHnRLfGc7fWWTBYUsYcS96zpNsuQCxnOa+
         elpgoMzeejfncyQdcRWvpzzpkk3Xh3c+sTU+2y998qB2CcT8j4MJ1uYSw8VgyEh5yB26
         fqSqGmww+QOuitlH5ZdUXJ1vxwoeyBr1U/1nzhqQDpwuUrnsF51W1y/6zoSQMF9wh/9j
         cI31oQ5XuAbufhQR88Rj/rmoP2FArVxWKXpiS8KwzU8DVVG9TG5zufFm2A8LXsuGCcuh
         tgm+McqD2F4jk/E7nSR5kFvcbKg0MVdC2rXDF46R7YHIoNx9QdW6YMLVCQRsR+l1hIBU
         QCqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vtkT2fUT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r82si12937048qke.108.2021.09.01.01.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 01:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vtkT2fUT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLLE5-0007fa-ML
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 04:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLDX-0007WO-7J
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:03:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLLDV-0000r9-8S
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:03:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso4052523wmc.5
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 01:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDt2ROSk9hoFzPAkovRW/KplVuckM6z30AfhNKjm5tk=;
 b=vtkT2fUTd/4knv/c6gAEAI9dVe1r0bBslb75gjO+VWyeMvkKfvau+txtb9zTOXkE6C
 aciRkBdZ2E5D+pS3oVo3uWOaDl9igrFBfO6TN3cYJ0DZmRWQalqjuBBtgcDNHYNYcc0R
 ux0upd2lAm9N71/TTwAOlRhJmWX6+UhNTCioFRLTe2FJujE/FvYioZn1y7i+4XCAdQ7j
 TdKFA1vl8NYYPwPGcP8zKMBSN871P3VOW3t2srkCGiAtoQpfP/HFd16dJPk0dC4Jl1Vn
 wBSOvEcGAi+d2Rne/+ZcJLYq9OgMD792pz4rBiRhI5rbaXvA0bFwWjxt24T3oT923CWG
 90vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDt2ROSk9hoFzPAkovRW/KplVuckM6z30AfhNKjm5tk=;
 b=WYDvsK0HsjlcIpF5JK+LDQCmDvAhEghwmjKWgnC9oztLBivL9RYfegSQUz9fFIKVsj
 CTeOMiHke+QV7kBxP0lozoYAZHZGYXu5HtS1j2rZZXpMnAMExJEhhSH2ev2rRRusB4+M
 up9WNuJ3C/F/y7wwG63RH2rdyujZb1eeD1l8R74lLDGQCZwl2AjwwZP7bo8CGLaH2DIT
 K7Ieyva4vS0I4B8oKAyjPzjPGwpG0p42HiFHYWgtgAIj8RpV3kxVp2TXCfxs+rnFou/F
 QCDXN982K35T5ZAa7jMN/x1KoZbZ+iyejXL2wGLAoj7Gu/YqqtZ3+ks8JaWrfLl1M3SF
 VnKQ==
X-Gm-Message-State: AOAM5309QIuxn3TS570+NDIaFCVoCAMKESYE7v4s+alj/u32unCDQVjM
 O5gPUPUsTXGXbgCGV+Ov4RLU6nmQj9IXSOHKfSqvfw==
X-Received: by 2002:a05:600c:4106:: with SMTP id
 j6mr8299483wmi.102.1630483407499; 
 Wed, 01 Sep 2021 01:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210831015426.101188-1-wangyanan55@huawei.com>
In-Reply-To: <20210831015426.101188-1-wangyanan55@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 09:02:39 +0100
Message-ID: <CAFEAcA9_DC+5gtScF1EjyqBc+Z7p-4ZtKb8k93QwRoT2gZtqqA@mail.gmail.com>
Subject: Re: [PATCH 0/1] hw: Add compat machines for 6.2
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kZLhifxr5xOD

On Tue, 31 Aug 2021 at 02:54, Yanan Wang <wangyanan55@huawei.com> wrote:
>
> This patch adds 6.2 machine types for arm/i440fx/q35/s390x/spapr,
> which is originally from [1]. Here resend it separately and hopefully
> it can get into upstream first, so that some other patches currently
> on the mail list which depend on 6.2 machine compat stuff can be
> rebased on this.

Thanks for resending this; I'm doing an arm pullreq today so I'll
put it in with that.

-- PMM
