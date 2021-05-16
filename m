Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp540279lfm;
        Sun, 16 May 2021 09:13:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBPDUd6DjwZZsplXTsP0xC/s/A0Ztr1PmRjXhSAV2kcLyy1agI+i5Vtdt+nceB+IoQR2tv
X-Received: by 2002:a05:6602:2bc3:: with SMTP id s3mr35836838iov.12.1621181590992;
        Sun, 16 May 2021 09:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621181590; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7nO9M94nih/31+5Up5tEjJogG96688hdN6qXi8MhbVmC2BewQtvN1qd8IFMk6Xgp+
         szIP0+rDQyaB0UBqC9gyLmxd380j07eCXdzoCHjVXspm0H+3voPnsVmnx7p0zErA+HGm
         1yzzBzA3gtZUXy6fHlRQBSep5vekOfXn/k1Sz0/Y8OX9eJJRxcccF75OyfDuILLBQ+Yn
         12mT0goHpCdKs3TenJMm3Ru66rnNRXxOG8ArLri52a0Ke7qKNHdQ+/I6Ii3vonwJARDU
         rhI81pRmLX8lolqh1Pugljs5ye+8QA6lD3LXfKzqr+pXlH8QCSSJRj6+yXooK6VKUdry
         8PUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XoynUOz4+iGXyLuogrv4pHtuE2PMOYr63gAjwTVd2q4=;
        b=WDMI0DyFgrzP65ydxu+ZPWnd43BijTJ/sE9jXYM56ViwGI4uBGPzoAractxe9g6MsD
         Bfg8u2JfBmJxLNJGZzcKZOyfvmnpme22VbaXuIgLDym0U7O+QKxgSJQRGXBQrR+OPRI8
         toaF4m9BdnzrS1baqqtHW3rzZeRjYs+RcRL2mVwgqCl8djUdu0CR7hW+7zFbQZNAd+iV
         zUtJzujcjgK20itqTfLBfH+lWM5hieu7hW7/Hwugf/zfAX+2slYJmv+TTo35l3326Oo2
         qfPu9TwmsCjEOYRSfRo5d1obGwE+nPBKuSWDjjZISSVVqAg08HfroL3I0s3jqhNLauxo
         hKKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BA/GkLx4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si15056289ilv.131.2021.05.16.09.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 09:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BA/GkLx4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liJOA-0000xq-89
	for alex.bennee@linaro.org; Sun, 16 May 2021 12:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJO1-0000wb-QG
 for qemu-arm@nongnu.org; Sun, 16 May 2021 12:13:01 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJO0-00057o-Av
 for qemu-arm@nongnu.org; Sun, 16 May 2021 12:13:01 -0400
Received: by mail-ej1-x62c.google.com with SMTP id u21so5551126ejo.13
 for <qemu-arm@nongnu.org>; Sun, 16 May 2021 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XoynUOz4+iGXyLuogrv4pHtuE2PMOYr63gAjwTVd2q4=;
 b=BA/GkLx4jnQQ+zgByJrsCweIkoElvRx0DRrTU3WPTN+0whSnZiS4s89bsRISrk9rIL
 /5RtoMxty21ubEqESgoCICf55UHpbTlpKhRN5Xo2mmbGX68Mm6r41LASOlApV023v/R2
 X0dBnDz5uWD427v3JCWnkdzkaikbMT6BIN0LP4N+s/ZE3xKSEMRGnjic1v2ZMTznTSG5
 SDValxT9wwatQuIWwIBOmZpnPF0Y07treflNoV4xHzQo8FrT2z4Sc5+sG6yv0YctZxFW
 1RMqGXyFSlDiGqD/7NOUUQJYxNZnDqqbjdiAbN6Jcyhj5kzmPyTY0GLN3HYSsM0JnJlC
 i3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoynUOz4+iGXyLuogrv4pHtuE2PMOYr63gAjwTVd2q4=;
 b=KR1xDde4JlWWThgBRecUP4lYiDnNQ4m5LmSZ0zjMrq3zo2d9U0c2FpmvJja7MWlobP
 nP2AbcU88dgTqeCHx5nJNi7vQE4A1mpd3sua9nhpl3Hkhudbrn3QfwfOMwx7lVbGX3oZ
 xplGNTmVDgwZUf7PGG/XvmaoitOEaqz+hzYhV5w6TSLhOro3EbKGMRsZbvJFRQNv/Fo7
 vvs8MbzY71UA/gR3anNIwLVJ7AGdxp5duBQnfb6+hfig8aBEEHwp3aP6QVdzWfnrJW/5
 paV6cnhqOOj8HWlOCyVpYHcvBHknFIUR0lKpMdvLhF2rxoxE+LTs7xqCupia2+rmgQ5R
 sH2Q==
X-Gm-Message-State: AOAM532wlB5e+OXJ7DLbVDtLQbdOLfkSyMZcll6KuzcCJkJDcwNu6xiw
 YGRCL10JmMRiAbVVA6lXHcIMmFqAjiYBEZAGSjm2+A==
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr9580474ejc.382.1621181578707; 
 Sun, 16 May 2021 09:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-12-agraf@csgraf.de>
 <CAFEAcA-021U3ehg_jnAHtako-A-GRxqwjqZWotroumUxfPhdGA@mail.gmail.com>
 <223c7fbc-3a07-e97c-04eb-ef38ec3d67fe@csgraf.de>
In-Reply-To: <223c7fbc-3a07-e97c-04eb-ef38ec3d67fe@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 May 2021 17:12:44 +0100
Message-ID: <CAFEAcA9zdJeNgeSihuXt4Cc9-yNDDE+Apkx-S8PBwnFidnxoRA@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7jOT7ghqZDF

On Sun, 16 May 2021 at 12:16, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 28.01.21 17:55, Peter Maydell wrote:
> > Nicer to follow the KVM approach of only doing this once
> > and caching the results in arm_host_cpu_features, so that
> > for a many-cores VM you don't do it once per core.
>
>
> I tend to disagree. This scales nicely with the number of cores you have
> in the system and it's blazingly fast :). I would rather like to
> optimize for simplicity here.

How does "do something once per vCPU" scale better than
"do something once when QEMU starts" ??

I would prefer to optimise for "don't be unnecessarily
different from how we do stuff with KVM", please.

thanks
-- PMM
