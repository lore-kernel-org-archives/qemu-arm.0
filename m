Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1631729lfb;
        Fri, 3 Sep 2021 13:15:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs3rrrSX7Y+6trmilf+UEVKqGxaMrPuHR7KMnV8Zs4fxWTRTFSlx2CzryG8MB1v/yghBMu
X-Received: by 2002:a5d:850f:: with SMTP id q15mr582650ion.118.1630700103464;
        Fri, 03 Sep 2021 13:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630700103; cv=none;
        d=google.com; s=arc-20160816;
        b=LRjoJe30eif3p/h7W+UDkxBBjGGO3JLG40lgtLPXt3yhKAfmOleB9UqKScs+sEeNuQ
         RHgFcG7PMUP9NDqJNZTj5hiY8iKXkA1w3SzU29CCjAB45kEEHg6wF6pHc7pQ6k5z3brp
         dpKCSFrFZFkIwTPWEQwxGEAXKeJpZS4DMapDmy3FbpVpmMek9c3L2oQvbylRS2QAb68S
         +F5XufLJ0f9hQItIYLkSo9O2dIrYzoI7QPfyqrdgAJokYb0clF6gpS0cnsTLjGPzmiM7
         nlFgZbbonofqMR8mkKEpz1rk/sqQ8huxE1BXBh1XysdP8HyceRXlxAu/Nnkacj6lXnYU
         NMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=4eHHYFkoRaMsvUTt4qW8qWzKOCRjBx/Npk4Tb094AvQ=;
        b=HGvITtrbBveWuZHKcWz9Vg8LU6+B2FZwn+TS1MlEQV1ZpzE9P0xSRmZ3SnSAAAlFNT
         28PywxGMSBEz1JGdFUgiHvYpCIKiysWBxiXTfr+GpUa+JPf2GsX/9Q3PEPZkm5jPyTX5
         RoYso2sQXSv1qsM2uJs+JfeRLJc+VOEDVHvcOWHda2CoSZo8d9aMK7Sx5mQP7760g/m9
         qPvOliLZL83KGFTYqf8YYlDYnn3UIxkIeAdVc/S7Hlf5dTuKPRRQ4AWYYwSQ2K/iE0N8
         My99cR1KWW0z3pTYNl2nS6j1HwPDaIjko0r01lRoZ576zIT/DylJUpNfqfwzqYs7C49e
         RU3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cLO22hnY;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id h14si267554ile.129.2021.09.03.13.15.03;
        Fri, 03 Sep 2021 13:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cLO22hnY;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350427AbhICUQC (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239368AbhICUQB (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:16:01 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E03CC061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:15:01 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u16so311863wrn.5
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4eHHYFkoRaMsvUTt4qW8qWzKOCRjBx/Npk4Tb094AvQ=;
        b=cLO22hnYLpEg/1RD0FCiO3YdVJ9j79J1/7mkf4AG2YXIXe2aFGD359ZxjySxf7C/iF
         tzfinMqq37GvKuJlfgORv3JQsLRcmYumsBYo2QPaZMoawXGhFMbSYBGnHCvKL0IbQik1
         45MV1RijIs6tVAHVpo7wuxRVTGnn6P3tAg9pOxmHYSpWbVd9DiYxU9bQGzq/RI9TejCi
         IuFmIe0QtC8F7fLOeMyaxPg7y3lcT3EAD/GnAD/B9pA4KX7M04jhATDZ7A8/fr7gbEdx
         fOoED7iAFaPcN+AM1JnCIYtXX45hgsKvOLuQ5XpA+AqILLfo9hIxUKs545+6dSzo6DRU
         0nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4eHHYFkoRaMsvUTt4qW8qWzKOCRjBx/Npk4Tb094AvQ=;
        b=um8y1ZRglK4cgkjPdwf2qB9XLxEqEPaxyj9+PZ34j8BUV8vWyhEDD8G5pI7PZzZOsm
         8L6AMTABYBraIqZ+1J98aK4o0vG1T8xX3OyVfk45tI0dMqvnNyi+zK6UbAcKkxSzay7Y
         YOGf2NnvuA8ip7aZ4H4c6EJ06BLZDJMPDPZD58LyNyfh8Ii7YdzMY33BwXrnmfacjhBV
         SBpQ0BUupMUFWMmUmYh0bj7wEa/2/4YADOrD0cad1ije5JrNdjP+ewl1Q3G1Sb8sPNHD
         mbJhye1iB9jl+kN38HTFFsxV7oKm0ucbGdDRMR0/7Sp5ArhasQsxNHJFr0remjbwDmkW
         mvog==
X-Gm-Message-State: AOAM530fVnStTe7xlLlSXbAeEpLD/0ji8fMZwjRmgomsANQEaOSUsIkX
        eeA1mLaWHsKS90F8AX85iBJcpYGiZuDzhbbjJbQ=
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr814056wrc.12.1630700099566;
        Fri, 03 Sep 2021 13:14:59 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id l124sm343991wml.8.2021.09.03.13.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:14:59 -0700 (PDT)
Subject: Re: [PATCH v3 04/30] sysemu: Introduce AccelOpsClass::has_work()
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org
Cc:     Bin Meng <bin.meng@windriver.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
        Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
        Anthony Perard <anthony.perard@citrix.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Chris Wulff <crwulff@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Cameron Esfahani <dirty@apple.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paul Durrant <paul@xen.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alistair Francis <alistair.francis@wdc.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Claudio Fontana <cfontana@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stafford Horne <shorne@gmail.com>,
        Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-5-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d97a0dbf-842c-5d90-e4d9-c2faa5d618cc@linaro.org>
Date:   Fri, 3 Sep 2021 22:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: CWl5dwfMF+14

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Introduce an accelerator-specific has_work() handler.
> Eventually call it from cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/accel-ops.h | 5 +++++
>   softmmu/cpus.c             | 3 +++
>   2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
