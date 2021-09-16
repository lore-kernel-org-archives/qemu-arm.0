Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1073513lfp;
        Thu, 16 Sep 2021 05:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhNcu/VU5JKQprj7GID8h57678gdr/ct2Y3XccjdpQGNz9+eq9Y0DGwu3dl+gJmErFbzIZ
X-Received: by 2002:a05:6638:12d0:: with SMTP id v16mr4065890jas.31.1631795152207;
        Thu, 16 Sep 2021 05:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631795152; cv=none;
        d=google.com; s=arc-20160816;
        b=cZwYF97/BcLoGJA82oj4mE6M43c3j+ofkNoIW4GxS0f164jfcPa+YFH4W+QJuzgqqE
         CkIp8Mh8NOl8b9EY+QPvfB8RwFnZ37gCLtGLAem05qnL2/J8XPLarw3E9ZsCNnP9WgsY
         d2qOLK5OENSVXY35S4NNoGpI3evrQbBPqL4Un7yAt9rrsxn/93Uw2Iy5QObmTBhD3zA1
         bITA+Yh/APa8szD1n0sRlqAtzTb6Is2Zy13eLpULdiu3BMUk7PbYaXuZ51BU6zyjAK+g
         T+tkFtHwWzy32npwSG4GaLbCHS4SaMEygIJdBnrIYg9H+uLji1sKdnrwUPXDERElF6oF
         qaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71AUUp+YrqYzna7fzXwAiwy0Kwn6P++MR152fVslebw=;
        b=lOqHMxEH7MdBRaR1cl2c1H/t9GHI4dLLhl8RKqQpHbhqIce2y9SmDNx5AsWd6mbQJD
         ENeQriDGDvjKGzxBjffUTj/mLTFDWDY5tOBa1RaR5MVcTvckVF1KomDlIOLWQZ15Xt2n
         4AkUf+TdBfHclsDdak45Qw0RtISAZ9kh0b3WCPPudBGrHB3loSUSDWYaqrDK1C1eNCsM
         FACHj3tDiz8R/tAKBHjtt0ghOZCNSVvPIQarWyhhscC213t4tUguXRW/cb7C7JeAe26T
         VOCM98MuInnK/udWpK3HQD0PAglE8NNACPyX6eed0N+Ctb9671rjv9N1+UQ94IM5KajI
         +4aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zvem2x5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si2715615iov.21.2021.09.16.05.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 05:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zvem2x5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQqSd-0006VS-LJ
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 08:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqSB-0006Tt-M5
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:25:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqSA-0004tO-0H
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:25:23 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j134-20020a1c238c000000b0030b32367649so860761wmj.3
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=71AUUp+YrqYzna7fzXwAiwy0Kwn6P++MR152fVslebw=;
 b=zvem2x5wkL9u41qQP2kjAm3R3uMZ48xNc9BVEqDLxKkKQXNvCQKwJ5XyOuxyJWGoQA
 9K/osQqSIF1De9eISoiAVCipYmCCON2ZlS7x5FbeUebAzJ5RgJga8lOANFgPsYG5YgaB
 u29bGJZBb0by6CAKcnm88GpT5z39nR1JJ082CJMgKIvgTHH4GB1wXLretU3bgmM8ke3x
 V52SiB5wcu2ohWCLakU7gf3pDoK3uiE9EP22uMCBwZmPZMGo0OP9YvoPl/jfD10EliJD
 bE0wqjVKD2VIyJ72q/exXE7kQBUSqV8Kza0ypCRMxE7fqLNfchwHVEHlSiX+XpZOVV8T
 o8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=71AUUp+YrqYzna7fzXwAiwy0Kwn6P++MR152fVslebw=;
 b=Sx6p1GtmixmJu/prAH7JaECuyUbxPwlClT/jLO3y6HN7BKLa7fvjE6gkT/f7gYDSB1
 u8FsTPox3MqJAvJbv75nm7wkfVLWudaI1z5urRJTisMf08vtnXAku2b6w/huojyzjp66
 5c/2mKw9BsOiYapyJ9sb/Piv8AIYUIQtS4ggGUwv3JjjvZ1gy46HulPmHSrwh25XHef3
 U4rsLuZVmWcb+FDEciP8s1LTmaL8ZTcx0kY/Y7iHWk3W/E0GMnyHAOZOWxXnGdIMgXGL
 Mn8wSuRnObbUwm6VdhY6EsELjKYOSoSMUp+NlxU3YnLM+YbpX6970LEHDiY9wzGhZxWM
 40BA==
X-Gm-Message-State: AOAM530HKHnVMEP9zlzmorrsXR9Y8J7wk9tsMm4DfduuOt8JYKCuh9nn
 Jts/3mwZfYnyw+owhtgusorQV+0rygVBSHO+DZv0Yg==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr801054wmi.37.1631795119786;
 Thu, 16 Sep 2021 05:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-7-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:24:28 +0100
Message-ID: <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: iD1bRD+QaO84

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
>
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
>

> +    /*
> +     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
> +     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
> +     */
> +    ahcf->reset_sctlr = 0x30100180;
> +    /* OVMF chokes on boot if SPAN is not set, so default it to on */
> +    ahcf->reset_sctlr |= 0x00800000;

Isn't that just an OVMF bug ? If you want this then you need to
convince me why this isn't just a workaround for a buggy guest.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
