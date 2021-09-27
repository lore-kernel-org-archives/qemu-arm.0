Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3645892lfp;
        Mon, 27 Sep 2021 01:49:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXwWHwKzYkiGYl2I7YUg3g/HfbwSdBZJ2cgBpr5rYqw34dWRRTOkgVyU1edbpmyhtXsjAg
X-Received: by 2002:a25:db49:: with SMTP id g70mr919522ybf.341.1632732580248;
        Mon, 27 Sep 2021 01:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632732580; cv=none;
        d=google.com; s=arc-20160816;
        b=MYLOuM3X0hpEB9MxkNpK/CxPgMY2NRa+dvmUWnAjcJKIjkOh3cWAMWxEuOpHy6iC6v
         TW/5PQ9//VtxV9U8afVI5PQrlOk3ypwhLmQnSw1gQo6dsPwEGvMAqm44EXoyNq+xs6Ly
         n8pae/fGWmilTfKFUUuQQNoYLn9Bt+WGp2edFPFzvOxa8elmFQImvsikRqIkakXsEeTS
         ExtVSKrc9uOhEsCgZdT0dNovHZ/fGaqnMbZtj6+3VMeZkaYRPjNZ2q4mKHQCSOzjBO/H
         9nNaKEj9qv8QJBV3410OTEX0CYkt324hb3zJjeoLxcLfE7GgtIhsiBAu+x3OJd56YAxC
         vqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdxaTro+RZTeSKxUQRkCRNrXlwy7a5EMBAZasV++LjE=;
        b=DnlABod/OwsiJWtkwjOMC246Sk+P4rybgmxdT0vBnz/kxI2YY5RZ/sivmyWGpJK+jI
         Lm9QP0tle1+LTEf2bcZ8cApckctFsi8tba2h4yODeNEljmwTigEJeSevuN7yHUqMJuib
         qvb82Pj7jL22oBlftVXOjcum+9CYTvN0tnX9uo7JJWuPIDtV8Lzg3oJOKt+FZgxLiwAU
         5B9bJC3QZqi+MlK8FAr3coBBSsyTe8N+2oF7HGEWF2rI9vWWQClxhzQgtoicKyxZG41z
         R4xlFOwNuhJ8pYoyg2Z75DfPgQHxdzTIUDpA2nR02XgSIh7D9K97B+fLKACZk2V6dwJ8
         fELA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bWNvBp8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si19632439ybt.14.2021.09.27.01.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 01:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bWNvBp8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUmKR-0007nc-IH
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 04:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmJo-0007iH-Cr
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 04:49:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmJj-0000na-Be
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 04:48:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so50197517wrb.3
 for <qemu-arm@nongnu.org>; Mon, 27 Sep 2021 01:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdxaTro+RZTeSKxUQRkCRNrXlwy7a5EMBAZasV++LjE=;
 b=bWNvBp8HbGODeNPqnwJ8g2FcnRFC8/E7nweywJZEgS6tV5QtV5wtGvCBXv5KT1c/KM
 rM2ovWB3SkGp5sec0IbIMWSAYVpkMUMGPfcMh3ddJYY4qwDgj/lS2dP326Rl1yffYAWl
 FWdkiZ8cmf7ChUn2fA7/ogmXZIfZaR6bzCQ9+Tc2odo+1ZGzYbg09Sf7V/uZ88mqthFx
 61pA3vCQ2viWmZMh5TKdIC6ZABAWyOyqXtXkluBOfB+G36Vexv9q/7RrNrIVk8LUOUGe
 taUngwcDjH8TTEBh4MbZUDaIsmF5BEiaqocEIl/Lj55peOcc4DTfTvMfnhsmrBQQSHAo
 MXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdxaTro+RZTeSKxUQRkCRNrXlwy7a5EMBAZasV++LjE=;
 b=w4/5UsHTDy1Z+N5R0ORe9Wb+5QVMoHBHBJKoPF6C3a/5IDQU4f4ABZRwbyDagAHfQI
 xyRO/dM6svj1DTDCDVgr1u6dK6L4JfmYl8so31nhfejjpob2N1hQSpUfRHKOdHkuC9KE
 RacMkCSIWa+4znVVsfPrNHo3KJT0sMM7HSeP2SMEiOvgYcM5xZX4gCkIhCrfkv5S7MKB
 2ui82Q1ZxK6tJHNroMtlmG7ThSNsvxn714LwjXsj2NJxgJXwckF2dS1rOzB0MGjMizO4
 G6BPkyRfzdqvW1s1V5pn13TI9r1JU43eVr90KyM83zpZVVAac1b/f0wIG//uQPlilIG1
 LiAg==
X-Gm-Message-State: AOAM532rQxXbtA/UXyH+jGb/OTaLyojAyRMJiCghK8VtsdiesUNZblGf
 xsl3MojutJ9YZtCSbpRuEX24XNQPTLo2Bc2xtdZ8Dg==
X-Received: by 2002:adf:eac5:: with SMTP id o5mr17765454wrn.275.1632732533597; 
 Mon, 27 Sep 2021 01:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
In-Reply-To: <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 09:48:00 +0100
Message-ID: <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: QB3cnzDytmlN

On Sun, 26 Sept 2021 at 19:55, Simon Glass <sjg@chromium.org> wrote:
> In the case of U-Boot at least, it uses the devicetree for
> configuration (it is a boot loader, so there is no user space to
> provide configuration). So the current setup is not sufficient to boot
> it correctly in all cases. On the other hand, the 'virt' feature is
> very useful for testing U-Boot, so it would be great to be able to
> support this.

So what is missing in the QEMU-provided DTB that it needs?

thanks
-- PMM
