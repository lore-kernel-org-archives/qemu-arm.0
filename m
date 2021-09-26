Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3166302lfp;
        Sun, 26 Sep 2021 11:49:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3r/hN1Y8Zh9xNPX5G/1NVxT1IPkT+weLwl3w6eGIWrx+zTqutjR4FlIXG7iF4272SDd30
X-Received: by 2002:a05:6e02:194c:: with SMTP id x12mr15711627ilu.128.1632682143326;
        Sun, 26 Sep 2021 11:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632682143; cv=none;
        d=google.com; s=arc-20160816;
        b=rHOnDQH7UXw5R0jNI7eGPkZs2VgQHrZIheB9YQAr/OdRmN0fzESq9fPeu5Hza271H2
         pFT+KTKvwFZbc674JYdg7qn84qpCKJhthmEaoIzP0xTg8rky03HvxxMaKmlOAhgnRseL
         THU864HdlLQJe1sOek52gc+lS/mBgTIyL4MuUGI2+X4O2drPtKym5dUvVCPnhtjBT6WQ
         YIYsopPCrRigcXTF86zVqQKgkPKOxv5DmRwFK6SiWzHKg38dTwuaOEMwrQMIx7X6qz0B
         9b1cdV5uuDh85G4+tPiD4bORjnCGAadfKqMp3qCf/eSLmUQ/mmWhyafWQNG6C3vZkmfU
         tfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=smG6Hs6KVAAO9oEtyeGcrgMH5h/PVsQD3rFwHkMpVmg=;
        b=pPEAI7iJS225HjRiHUmvDMWj2XPbZP5Z9ZEDuB7u7edgq6VWnoLfUkx3nSVFr9m/3v
         e5DvG+koXz2RMXqwLiOLEX3uD4I7hg8PtP3lnRkeTyJW+LAN314Z7lT8NWcXCxgUVu9f
         8b/ZZgxgTgzJzDdWz++b1tcO964nhthAOu4hHDDYmfAz0B/w2z/71kqeNweSq5iVJbj3
         Kbktg8qOSxNsGL9P/p/+timZGqxoNVMUA0/MtjhfumkBfNCfLis3sHjdKgmb/Cu89qqq
         k9sNLEw44wMBajaVEAGM+tN9vqP+QQXvFWJO4GAew7PGHutsOFSNOCxuibzE/5v7nNe+
         zkHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y9I1OTxG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si13883161ilq.119.2021.09.26.11.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 11:49:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y9I1OTxG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUZCw-0005IE-Ms
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 14:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUZBX-000332-Kd
 for qemu-arm@nongnu.org; Sun, 26 Sep 2021 14:47:35 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUZBU-0007aB-TI
 for qemu-arm@nongnu.org; Sun, 26 Sep 2021 14:47:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id d6so45184971wrc.11
 for <qemu-arm@nongnu.org>; Sun, 26 Sep 2021 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=smG6Hs6KVAAO9oEtyeGcrgMH5h/PVsQD3rFwHkMpVmg=;
 b=y9I1OTxGg/No1Lq4ov0AAI8kGMD6T96FoEKgU+WaNHw17npZCFzTJLEMmv/IdhfY3C
 R+v8FpBJmkR6GL93p/gKSXCNwe+5NOeeBOIzzy6F0O8emdqB74oSVIOLuHQSmBvJb2xW
 Jrgj1U8AF7l4g3cKkiivNcB3ZvdR9j/uV6yBpQmv0HeCYD+mBFely04b7hTQkgHbI+uQ
 sGeiz7JzEWgWu7ve6iJGIYZIzuqPsNB8qjtMpnmnE81umVzGS1qNxSbVfNYTXDhxsM3Q
 4HWVp677ykUdts25UwExucGINj7Sx0nF8FBznU7YzKIvNZZ21uJwwAB+Q/Q7QTBxhVBI
 8T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=smG6Hs6KVAAO9oEtyeGcrgMH5h/PVsQD3rFwHkMpVmg=;
 b=jiPQvJfm+GNtlt/7BQF1/u3epFRZcVn4lq4vMmfzKsn94wZm8aNu2GrI9v8eS9Wyx+
 9EAp93Zot+kErCy8VCeLVECGOP4f/df2mUPSTCy2l2ApY+JC6hKlpAqvFEnPugO+hv9Z
 2YiXOI/IsOPhxgWy5dRJfKJN6y9Jlpwbxo9y2waVUKa8Y2OPaB2zo4x6Inn7ficaCZ5D
 OU3t+mWLhIzgZ5UAh5CKOoMEYKQrMzfmJOseO3bD5il4lkJ8b22/Ff36dN76J144bX27
 GKE65BH4n2uK+/gvNkoQRt5T1rT9KFbhLOQUKlq2pGeQY3/ZuS3op2nJrKWNYHJisiWW
 URBg==
X-Gm-Message-State: AOAM533elD6t+XwZrx9S9UnmIF6fr8Vcgbjw086ibeBIMP2XJgw1l03X
 DL7IeljY+UuHZwMh1u2hhl3dua/7Gw5LtT/eTYwLNw==
X-Received: by 2002:a05:600c:1988:: with SMTP id
 t8mr6106699wmq.21.1632682051443; 
 Sun, 26 Sep 2021 11:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
In-Reply-To: <20210926183410.256484-1-sjg@chromium.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 26 Sep 2021 19:46:38 +0100
Message-ID: <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9D9ahqXH/7y/

On Sun, 26 Sept 2021 at 19:34, Simon Glass <sjg@chromium.org> wrote:
>
> At present qemu creates a device tree automatically with the 'virt' generic
> virtual platform. This is very convenient in most cases but there is not
> much control over what is generated.
>
> Add a way to provide a device tree binary file with additional properties
> to add before booting. This provides flexibility for situations where
> Linux needs some tweak to operate correctly. It also allows configuration
> information to be passed to U-Boot, supporting verified boot, for example.

So, I'm strongly inclined to say "nope" here. The device
tree virt generates is supposed to entirely describe the
virtual hardware we pass to the guest. If a guest doesn't
work with that, then either we're generating bogus dtb info
or the guest is not handling the dtb we pass it, and one
or the other should be fixed.

thanks
-- PMM
