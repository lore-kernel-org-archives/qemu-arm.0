Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4848786lfa;
        Tue, 20 Oct 2020 07:36:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGOQLRS4hQ3xnH4uDVDeGjUWavfvF3JAMFGJAyd+qmzaPXr5dbS6nfyXBYHwHs8uX8iWmp
X-Received: by 2002:a25:e0cb:: with SMTP id x194mr4354107ybg.329.1603204606971;
        Tue, 20 Oct 2020 07:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603204606; cv=none;
        d=google.com; s=arc-20160816;
        b=Egb0zKMmAGJ0pf2W8dT/OX1n/Y3katxsOLg5vaH+5vBH+8TCqoTV7pQ7E22CVDqHI/
         odkk8/HQQNsLDl+9HzXJBJBlwXxzZz0laD8XnPnGogfXn2G2Q/oNdstpMHj6++wSZ8wx
         VI/4rXhHuDSA76vhr04AXXJKFdn2xUGgFhAF8EoDC6OX7C1W8435GfPsMsNu4zyt0M4E
         xcknTHrk3fQGTe0KqgqbIkOcCXh68NUNVGFmC7Oz/KfokIxnk+y8J0DYZXT68lddpHvn
         ImL2mznQ9t8nikZXW8w1DVWT38SDUiiDCzeMIzNcnJzRqgiuuspXdiqKpF9uopRtPWdY
         4DEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fZ2F8raE+nkd5CcBTlfLFBayCR2ABggzo7wSTuWas5E=;
        b=pZW/UeN27a17znVvMCQDa/C2eUzBfXCljavDVFZWGoR0QLEmpKQ6m8OiSSQvjmabP4
         rYzZkE4xcils3YbaLrTsAljXwwl96Rq0XFqS7nuhaTX2pao2wEMyjfKrT4rkc+3Saejd
         3ZBA5NlsxoOYXvHLvOk4nedINdNtQsKO9suoBB+1+BtcPIaclhxIGHVcGjS3GXuVepnG
         3fjTFHznBJOhX7TYhkLwnFac773qbrtfoHjcZxAZJ8GUzvwFCIaHC8z3L5PDK2e6ZSrz
         /m42x5h1n2JDDUajfEHaA4iaVIrxFFZzuZwagCPJimtk4vp2oGDNkarukpvdXjcxnC/w
         acNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xLPxO+eI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r128si1825090ybr.31.2020.10.20.07.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 07:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xLPxO+eI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUsko-00008d-Ap
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 10:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUshZ-0005BJ-Ga
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 10:33:25 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:37280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUshX-0000nO-Pu
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 10:33:25 -0400
Received: by mail-ed1-x542.google.com with SMTP id o18so2089431edq.4
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2020 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fZ2F8raE+nkd5CcBTlfLFBayCR2ABggzo7wSTuWas5E=;
 b=xLPxO+eIHc8AN9bd0ouILNPJ+nbTKkm6ae0752F4RM1rr9+qLUedVL33rFYEPf9UqR
 /wkHmLSaP+6xr0PNUYS0PjtsOp2H6g9ITkIubk5BD8+gAbOevsAYbGMz062jBYqWFl+Z
 4J+9TkkNWi0dQMCm42Xaeb/lMmio1hwBpFjPSKOlH2Fn7KfglyURkVPaaV49FfjftJAe
 Zs/cqmsolD9NtPZf8WAw4HOzblWNRuVvKvBNPMFVtf+DLSHHwHihM/VRF+SNLkQ38u7c
 gW50D5CkJr9zc+k63M10ODtRolQxi0FBtjmPp4De7e5CqWOy6bIEstnIJUo/oe1EiUSg
 4keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fZ2F8raE+nkd5CcBTlfLFBayCR2ABggzo7wSTuWas5E=;
 b=chvp3BLvntqzcrQrVOwknJoovqRvcMK5PD0EFv+v9AtBj3hIsBtOay3IkAcwoy7r+B
 uR5YKLuAhjcsdjNC3UNgHpF5ZfspzkmQzZzzBuz3tVgyWh8QwgKRSAD0jED8UE1yz+Pb
 hdqd16h9fqY4vPKOpug9172DflVUpURxjm+lJCq3drF5FZl8XSIuzrmOgGaZ8tgVf0gy
 0AOEAVX7FIMAVd2TWwljbIVsMgKqYIzGrzXp4Hpb6aCwK9rAfkev/NptpjL3QEZshzBF
 ixLreq+Gy39zEJ5kiL6DqL+uCNOytngdS1Yu/0FlJBZRmdIWNeLVtXGGyQgQrvPp99bj
 puOA==
X-Gm-Message-State: AOAM5330Wyuj+4vEy8t+ma3meSXkxTRl/J80H2FHTB5j+TUzdnV6ILZ3
 9TGpdjXn8YLthDDkAu8DAwst7kAMh3S166ZCoT4dKg==
X-Received: by 2002:aa7:c302:: with SMTP id l2mr3125193edq.204.1603204398469; 
 Tue, 20 Oct 2020 07:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201017180731.1165871-1-f4bug@amsat.org>
In-Reply-To: <20201017180731.1165871-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 15:33:06 +0100
Message-ID: <CAFEAcA_qoM2=L+CaaZq1kMJ=NCaZZK7J0ieTEq151DFTks7ttQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/intc/bcm283x: Trivial tracing cleanup
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s+j2NlD3wcN8

On Sat, 17 Oct 2020 at 19:07, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add trace event for IRQ from CPU/GPU,
> use definitions for IRQ numbers.
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/intc/bcm2835_ic: Trace GPU/CPU IRQ handlers
>   hw/intc/bcm2836_control: Use IRQ definitions instead of magic numbers



Applied to target-arm.next, thanks.

-- PMM
