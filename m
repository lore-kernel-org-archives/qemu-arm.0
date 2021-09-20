Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1929159lfp;
        Mon, 20 Sep 2021 03:12:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/mnJCsSR8hAEAN1rTzd476PQn4YLkQaNV+1x6yce4lNJUIeEkOb6ajerht2UiBuKYmjdv
X-Received: by 2002:a05:6830:12d7:: with SMTP id a23mr19871454otq.102.1632132747854;
        Mon, 20 Sep 2021 03:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632132747; cv=none;
        d=google.com; s=arc-20160816;
        b=pnYAKmI64jtTXCpKkiXs/YAFEQ3VhY8SBq8edZ77zjYZtLDLs7GHNY2gJTQuCE7Uke
         fmLSywRVLxappcSb4K0lMJSGYI+29tHaXjwuI03k5uSDSlbbqCWHDwdBmCFADVgpc0PV
         Lzz5O/4r6Ndbe+TqEY2UgahKw5AKM6l5tI5L/L8LPiy3XkjcabAtZMEvDSPo3EYamyoS
         3eWzdukKiRc/CK33HZGFmTeHN8ioBCYq2kQYd51Xv/sBYqSjxFrsNvo5iSxf20X105Ba
         KnDQVqu+JRsEDLwjs2yZFbYaYvmYdiUhCHvsyeQcGdTIoQuDnQrHI7Ogx1GgpfOLXdo8
         T7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AWfNgHzJqScLiNg+Y3WSNI0s/hxR2pfb5B0L6Uyrzo8=;
        b=VHgLnF4f8dF4mXl2ig4SdWz8PmoATmnN+Ck0Jf4wXs1aLWR8wg91VwRsgHpseC922C
         /W6q+PpPm6mOjgA0qzQkWtIprYbcPedog4LzT3VzzghxugzveqIiSa8zEydxV1/wqwR8
         4X2z7lEivqCPMVpkDcDEOd/Fwa6QYzZLDydpV+h09t1eQKXvMwciGjQkFJhVikT0ShRI
         OFhYw9yvfFmyVrcjDLZ8qomO+hj9Lb6EaAKdyIufViezYvyOpKkwxS/CoUVwDyvUEYBy
         +L7pZ1rcRPDDvSgsoOCR7STQwCSB5I2fB+EeqXg4KkoB3CVIjiShaVUnxkkPBEzALmGn
         KmXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vFNzSg37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l132si3372013oia.1.2021.09.20.03.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 03:12:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vFNzSg37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSGHj-0001wC-51
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 06:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSGHN-0001vr-Ek
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 06:12:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSGHM-0006Ln-2M
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 06:12:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id i23so28051432wrb.2
 for <qemu-arm@nongnu.org>; Mon, 20 Sep 2021 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AWfNgHzJqScLiNg+Y3WSNI0s/hxR2pfb5B0L6Uyrzo8=;
 b=vFNzSg37633yE27Pr1KnKHloC3H5XPHlPtkTq+F9KRRsGrhbpqwp0uvcpWlsUsd6re
 DHilHp8BZn910WusUFiWj0vVpvjckP2vZC7HkPDBR3AsmKQt3lx1wXrmCD7iQQ6Ghxfl
 MrCFco9J92032mG4kgoBToFk1afABnqcLP0uIhmyOctbYxQtZJY7QfBhNufcpIU8QwbD
 jkOF04x6fhesDUTmdf/x0+f/jeGkYYGIRQpK3U6VDcbsiHLF5ZMX481p16AzM9aDASFd
 jewU3YnWkNvHmZ7gdOsnsYrk2cz72xRX3dcQK4HtiJEoq5JpZcSOawJtWxIfCrfEeSMI
 mNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AWfNgHzJqScLiNg+Y3WSNI0s/hxR2pfb5B0L6Uyrzo8=;
 b=O4YRLg0Ji12bjB4CN0CtG1BHD9wdJ363RtVqCiVdXCFwZsFl9cOAVe5tC5c2Z/+ewe
 a/VdxiSKitO/3RxsXvyjHmEU8+D8nft71QPFrEw0h7iDs9/JSYykXVHYA87gSPT1tF+P
 NwxhH46GyCwW9ry47sBp0LCH19Ah3PprOUraEflkoU3ReO40L4sB039Qacb7yzUhLmy6
 G+YOc6JTAGFb77SI+zH3Sg94MYEuUC8IsD4uXh0o8Dfh7pfAW4rP/LrRXVnewBawIozz
 bNV8lLcW1+jF5/k+3KAkNwL5Ck22xNxRebniJ/OQ1G+xhaMtn8zgMvmeaWNwZlPBtXtJ
 AFqg==
X-Gm-Message-State: AOAM531Nioy6m8slJqbQ8eEE1de156bYnqjyZcI6jQQEObBDfxpJxPxQ
 SOlV73NY7cL6vRz0sl99BwKrbHNnisDhH6DOJ3yaLw==
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr28522527wmo.21.1632132722320; 
 Mon, 20 Sep 2021 03:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 11:11:10 +0100
Message-ID: <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3/jtla+lva7l

On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
>
> This patch set implements a fully functional version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests. I am not aware of any limitations specific to
> Hypervisor.framework apart from:
>
>   - gdbstub debugging (breakpoints)
>   - missing GICv3 support
>   - Windows will not work due to UDEF SMC implementation
>
> To use hvf support, please make sure to run -M virt,highmem=off to fit
> in M1's physical address space limits and use -cpu host.

Applied to target-arm.next, thanks (with the unnecessary #include
in patch 6 removed).

-- PMM
