Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp6437821lfa;
        Thu, 22 Oct 2020 03:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+i1QSAQHRT0w1g10oWi6bCluJ9/Mg4527C3oEnCoYrelJIeAJtTSg3o46KVqu/nsyq0OD
X-Received: by 2002:a5b:64e:: with SMTP id o14mr2384798ybq.376.1603361862764;
        Thu, 22 Oct 2020 03:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603361862; cv=none;
        d=google.com; s=arc-20160816;
        b=nHln9PFiPNBKQ4rUjIg2p6UcYRCrCZmBPp4+OyqR9fdWIbyvycJRsdDuLlL0lKqX7h
         NSyHYtr7nMoe9xmd+NzSFZOygY7JrF8MWDbL0yRxHlIOMPi67ERN1DiPdHXOmQWQfxb+
         c/ANHYiUlqBGXVYB5MP9vwoFtWtPHx96zicQzFPCtrLafjDfSGknmrCqXuGJVQkGHekd
         KZ9BGWKeMdcUk2Y/VubJeBGmXtD/uX3jyYm/fmuMqWb7MZqkgA7LTJI8RsWBdKDWdItz
         aRExLKTUc5ofDer7s4uKk/zNY7ZheW43PqLTpyj9CckP6gOCIwT8DZIoKLiQ7Kj6GZDM
         rdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QFzLAVFg71xZHtSAhr5mU3I4yr1lHCqIqwegSIR+/hk=;
        b=Nye1v4//1KzL+2/Vn1uv2FlZNf0bE9erHTHt7U/g1mCQJx3RWxFyMh0HnjduURKeFp
         cwvHiu3XGnxEZZD2DrFPMxwMRwtDPkVdyQM6jlb5MWabVD9G6Y+pngbgXxy3WkhX0PaU
         EEiINwU6He60IAjp8f1QxAhKUo4pyvGK76DA6CZrYo2Lu6Kl56wUZ+/p2hGUm4WEBAP7
         nR737HhEmPZx/N1uLdr8ZGoEuZ+UIfLVuFlVywNdLKVycUiREH2McyWxi8JDlUl1Evku
         p7uI2p9tfrGoHaab7IKiBJj6ZS6El0k/2eZctxQCrAxJY3b+4GcII/w9+7h9ow+FF31p
         SfEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JGto292y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13si805129ybt.78.2020.10.22.03.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 03:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JGto292y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVXfC-00018F-6S
	for alex.bennee@linaro.org; Thu, 22 Oct 2020 06:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kVXf4-000181-Nw
 for qemu-arm@nongnu.org; Thu, 22 Oct 2020 06:17:34 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:40205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kVXf2-00059X-2A
 for qemu-arm@nongnu.org; Thu, 22 Oct 2020 06:17:34 -0400
Received: by mail-ed1-x542.google.com with SMTP id p13so1192274edi.7
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2020 03:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QFzLAVFg71xZHtSAhr5mU3I4yr1lHCqIqwegSIR+/hk=;
 b=JGto292y6CONsksTla2UU+VEPc0yCVPSh90VoPmL3P5LTtz/QxWGxFWlOMas6sKtIk
 CpdULVVrPcFlHWznOOTlAVTw0Zcv8Ezyy0cw0PDjy5Z30SqGSDVrlGFZ0zoGbKiR1+hL
 7PhjdMb65qg34gewnBh/0YTSBNvUrhB/gCKXQWbZQ+p2O12czyBryffiG3UH2YfB1Nss
 Y/JXTz6trwN0nkDgqWdMpg2Hgt6u4xY6v1V8DkXXV5pESSI3RQa2+srV45GGcPJCrzCi
 S9k4qge6E3qKWy07bf4E6Q4UUHCJwvdsS+iOOx4ju5jsySDvkOrNhSEyOoBwUVXI/jmV
 GUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QFzLAVFg71xZHtSAhr5mU3I4yr1lHCqIqwegSIR+/hk=;
 b=TdqPf0pH+LU9TpoeFq3tjkiTxWVykNVd0Nw+AClSk6aNgwLP8kf02u54T4NTtbwutJ
 UkUu2bAyzIUy/gg56u0w2S3CyI92+DwMK9PlZY0v3qV/m4uDQarvea8Kap5TaG3b9q9x
 n0Wit/aJCQHYpcb0auTcC/EdSPB+ofe4y5zKQsG9IS30mPHNurUmkMN3a5GX/FWOVOfB
 GDDM2nLPrB0NB4HVXDT/vyMZUsrC2k91CIHIGu+KfVUmQEK2PalPPyz2fA5NRGNgkWQ7
 z7CQ9LkNidHtvx3sOOSegG94azetli7wCAxoqGt4gg0P1iPg+X+K3oDXZkyKWy1bBp84
 Wk4g==
X-Gm-Message-State: AOAM533byY+cHHoR+VAYBGUP/MldKu57OI7kSB/EPVtIEi/sJA19/5p6
 sh5RHsRZ9l8I7thMunLPqXGLNkrJTXsYw4a7RUPLPg==
X-Received: by 2002:a05:6402:4c6:: with SMTP id
 n6mr262427edw.204.1603361850220; 
 Thu, 22 Oct 2020 03:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Oct 2020 11:17:19 +0100
Message-ID: <CAFEAcA9n3T5MrBp2RbOQGWBptV5ObCssF00ygK8TDieP+V1Srg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Add support for pvpanic mmio device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w2c/3sZSysPo

On Thu, 22 Oct 2020 at 09:25, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> The patchset was assembled from chuncks from some old patches from 2018 [1]
> which were left unmerged and some additions from me. Surprisingly their Linux
> kernel counterpart were merged (so the pvpanic driver from the kernel supports
> mmio).
>
> I have seen the discussions about moving the pvpanic to PCI [1]. Those patches
> were sent but nothing happened. Also they are not trivial and require major
> modifications at the driver level also. Given the fact that we already have
> mmio driver support for pvpanic in the Linux kernel, I have sent these patches
> to ask again the maintainers if this can be merged.

I'm afraid the answer is still the same. You need to provide
a convincing argument for why this needs to be an MMIO
device rather than a PCI device. I really don't want to
add MMIO devices to the virt board if I can avoid it,
because they're all extra code and potential extra
security boundary attack surface. PCI devices are guest
probeable and user-pluggable so they're almost always
nicer to use than MMIO.

thanks
-- PMM
