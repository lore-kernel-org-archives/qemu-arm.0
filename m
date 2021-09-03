Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1367610lfb;
        Fri, 3 Sep 2021 07:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTWB1yKtSNZ5usbNyvarhdQzjaUBqghpvd+a1o3E8waF3X9QUYiKiSinT+RjDfYS5my2yM
X-Received: by 2002:a92:cb52:: with SMTP id f18mr2965201ilq.120.1630680735658;
        Fri, 03 Sep 2021 07:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630680735; cv=none;
        d=google.com; s=arc-20160816;
        b=WUoa4RJkmcac5ixxOLFdPJG7BbIEyBpTKPGe8Vx70xtlm5erkQKHQQ2fe1TNqoAMDC
         rvCUvjDem+qSXW7mi6WMa9wtASQyCPrRDAwB87fZPKU0R7hGM+nYhrWo8b/GEktMArkq
         1KE8PAC/s9luPTZqp1PurmC3GRPADfLDAnNJOPMl4+dgjx48/piSB86PXRv6KWHlbcT7
         nD5qtYApiOX67eLVTXnT9Drti9WWqnRA4FpqoULYeyd6zBIgzY0SjKZiViHWo9fL+e2a
         WwGoTyilEtlVx0cIHhSeAHZL63K1b6df6fmf0ojKAsubkROEy4JzBXEFuSAsog/2ASAi
         ds4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5roshyboZ+kdsi0TGTdaUsmAx+q/9fSdGUMKEh7BkIM=;
        b=k+gUlBUtfOMDfRtHIhv9iZ05UXbWHd153S4WlIkhTEK6YtTsJhV2lrvPFO87MdpD+6
         3B0Ik91WHAsY8lwUgf3wd90XQDJJpf67oPqa+Areveh2j1zSswblAR7ch8pza1WFF+PS
         2+MS/lHdbwaoEDHXntngdO/wv2vl0jvhDqNflpYC4U5xmCZsVHd26sN0kn2sCb/tJwRM
         CMO1YpSvp0jw9sbXT1xmCVapsoIALo2CuwFAZqiEUujtiyVe4c3jdLQNFCZQpYMDw4DL
         qlruhCZEdDD9q0NL2mzfkaEvOHrLO0U8FBv4YMjI4DYtAnE4xpUVw4TllNdEup9hBJ3j
         arnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JHhKAcmY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si5721215ioo.37.2021.09.03.07.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:52:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JHhKAcmY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAYB-0005X0-1N
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAY2-0005Wl-RL
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:52:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAY0-0004qV-7D
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:52:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso3962088wms.3
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5roshyboZ+kdsi0TGTdaUsmAx+q/9fSdGUMKEh7BkIM=;
 b=JHhKAcmYF47Y4Zonh+3Ic2E52jmIY7yQ7YS/5pVoOCN0SCGL5IaVl+WYbF52f753fi
 7RdBNREcUOgEgyTi/khjpHQ98p9Ohzcmz7vGl9Ub6ruDkTgNIoivEoARo30Q2EIDHayt
 TV2lLzrhg59cCRcvO7oqToI/7jodNZS3PfET86Pn9Hrwq/zDvk4aSlVDeSW0sHL2+LOu
 /w5EB7sonBQw5xbRbxHNJroAAvifsRWC79WZvn1DQFyMnTQluRPvxr/0DemcHHAFDqcy
 E/jn74kSM+epierYJYgUU2YP/zItaC+Pzdp+82NJC6aJRPlloWb6IDlyiYgVnAb5+3cU
 c+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5roshyboZ+kdsi0TGTdaUsmAx+q/9fSdGUMKEh7BkIM=;
 b=sKJgb7wQFSFQxvODRZKSfeKVMNNLUcm0gPJ/louNBwA7up+OVciHQGOSNGJJZPAFMF
 H71Ak4+yhPalbbJcSlg7xjT78OmlZYAuJtozQhmlib82nwbnCC+DFt/IXtDoh/UaP7fp
 RKKBuv2DUsgGnx8+M8obCde0YO7Eiy7EWLn0sB6RDWPbPzu7S5qtYGK0lYe834xShJoN
 jkTpmokUsvOlzV7lVZAWzFTl/O0PPGHSrHPqseX3oW6/j9W4pwoExOS6C0TxqCcnKtXP
 Ul15iv7UYVLsH8pCXP/bdyO7NEKExf41dsd/Bmi6xxAJfN31yvojV4ytgrEziQaKHODZ
 mDeQ==
X-Gm-Message-State: AOAM533HG3/2TQlyMk3swblgVv8TOrH8FTEASi2IJMvBoapbWpykgWxA
 INHVvR3KPLSQrWpgKDAvrHINs7TKjdnndED20kxrvg==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr8696159wmj.37.1630680722660;
 Fri, 03 Sep 2021 07:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210902181642.315792-1-crauer@google.com>
In-Reply-To: <20210902181642.315792-1-crauer@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 15:51:14 +0100
Message-ID: <CAFEAcA-wG4FW_ddfpj+CH22OwGbaqjmYoi2FQdBUHdrDnfSvjA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add support for kudo-bmc board.
To: Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kKC0a7wCu0UQ

On Thu, 2 Sept 2021 at 19:17, Chris Rauer <crauer@google.com> wrote:
>
> kudo-bmc is a board supported by OpenBMC.
> https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo
>
> Tested: Booted kudo firmware.
> Signed-off-by: Chris Rauer <crauer@google.com>

> +static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
> +
> +    mc->desc = "Kudo BMC (Cortex A9)";

"Cortex-A9" should be hyphenated; see commit f548f20176c.

> +    mc->init = kudo_bmc_init;
> +    mc->default_ram_size = 1 * GiB;
> +};

-- PMM
