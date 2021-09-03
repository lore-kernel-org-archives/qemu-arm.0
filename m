Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1650697lfb;
        Fri, 3 Sep 2021 13:43:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKf3DFdjzFmK2159WZtDctlT8lH5/Ami8fGZcwsj2N7gKJaa3/EQsNy5evYR0qNJHIs0BC
X-Received: by 2002:a5d:8b04:: with SMTP id k4mr663491ion.58.1630701820255;
        Fri, 03 Sep 2021 13:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630701820; cv=none;
        d=google.com; s=arc-20160816;
        b=rfRqddorKwYZYLNi/V7U0U2qxptfi4Ir0JtBvtwGU6oWxwtvLi8nK7Fp5X8D44YYmP
         fBzXoMstB8O6bZSLLYzXoBZuC+cOpculmiDp8BtgAFUb3DuNPiwTUCZHZlA9wENUSY/Q
         GTh1o5ZOnPOf8qxSTidLq7AZWmOSpNJ0Azr4uzToa2GakA3WOoxpshLMUmvRS7J12pPa
         iH1yG4cWQn0S0hq2WvOhic6elwqMpB1dGKnQTmaHUTZ7oD+t4zA9g2V0R3tqjLchYMVd
         fy1ZOFETGTGTEJKlkTZcK3mWCpkcrCuP0czcKpCFpKq9e2j49aOfVRLZn7SCEreSUGlt
         P7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
        b=gCcz9pqDqULTsiINcB3wHIdcs4FidP16Pn8D+2MiDhvRKhHah8RrWT4aFPP4JEt9yd
         25fdER25q8nucoTziXnd90yPdryvU/Df0RMpTFMC2QT/+dfuENjaArhHswjP9bAlFK06
         vvBxdC5Xkpjq4NSY5DbYTlaDAxxzlQmjjB3SswYbVkW02dyyd02xFPI2gMTDYUhSGk7s
         c+ksMOCXrlO2H90a+FKuh9+CZkKtRkPuEFWSBaLSn7eCFJDfHmSyUQ1yXmdZSq9yfmsD
         LfztpaNFX2wj4BU0llpzDf59JK74PE8qVnZOnqG3BfD3LGpmjCP/qdh0Gzhnpy1mcRqM
         6/1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H8ozIcix;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id v17si351404ilm.40.2021.09.03.13.43.40;
        Fri, 03 Sep 2021 13:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H8ozIcix;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350982AbhICUoj (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350971AbhICUoi (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:44:38 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C0EC061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:43:38 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x6so358247wrv.13
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
        b=H8ozIcixUveIbw9k7stg4KdS0gx7rTV2e5s41Gx6botMrAh8hYIIWhIu+AvbtT54dW
         Tl8+brbL8I6gSbmldeLB6TkvxB9mAloeVrSwAdDFUCxAz3A9ONWLJnZnRcf7/3YYCKiI
         mKw5CM9pdGmfYUyVULTwZdtG4Zo2cC0TJu5c2IH8dI7SsNAjx2c3JA5uxkgkaF3syZYO
         bS8qs1qwUmnUfdlgL3bsdR1L8kzzDcc0saGHUOJA/DshHL9WLii6vhGNcqmBnmKhwPEJ
         E/skqUuaJ6aFM7UfknaO/MQDQsX7XIC1JB3/bhICCmdu8qPCP1VV/4dZA8n9iYUOsjZI
         4+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
        b=iQy8LZNeuVBgA8GcAqD3eZRzVHAe0n1fgfvfQm00h+RXDHYsnQLQ4faWHatWFkI3OL
         Rn2xO2swqE66d2cv+ZcasAR+CIbAIz3cra2OpF72QHq1g2TX2CCypEqnWAz0Vs+HCWp6
         RiYoRD9O7TFFMDenEWP+11MDWzKN6/hWW7Euz+LoQdtI5/3I3DqYq+YHPXsE7YLubv/F
         +cF4KusfXyZ89oHqouOUiYP0/W4isX8DKvVUbzk6Dk7cV14dKd8oNaD8RrAoJSqxWAqw
         FP+uvSpC/99VKNA5aFVIKPDnRBJ72Edc1TYrCvpLX3OKI9rYJF0wyGtRbLutjF91kVU6
         SH8A==
X-Gm-Message-State: AOAM530KqUzerhVb8jUNdMT2ENogEzSZQxxKvAbbJ/Irnrdrn1svwnb9
        1j8JLnoCcu6QtBkK3fZ3gCZlxHvMuqpTx+YcB+k=
X-Received: by 2002:adf:eac3:: with SMTP id o3mr939918wrn.60.1630701816896;
        Fri, 03 Sep 2021 13:43:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id d7sm274068wrs.39.2021.09.03.13.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:43:36 -0700 (PDT)
Subject: Re: [PATCH v3 23/30] target/riscv: Restrict has_work() handler to
 sysemu and TCG
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
 <20210902161543.417092-24-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56180d64-090a-1f6f-5c0a-22387c8a2af5@linaro.org>
Date:   Fri, 3 Sep 2021 22:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: O/Wb6urO8jfK

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/riscv/cpu.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
