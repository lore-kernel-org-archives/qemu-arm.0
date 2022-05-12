Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp287176lfj;
        Thu, 12 May 2022 02:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCC8oNmfSJraeerjq/pCnrrsymdLtvOsK+uGwcvMOEPyjMqa26WZhKM3nwQhQoBM2jrdxQ
X-Received: by 2002:a05:620a:4084:b0:6a0:4561:399f with SMTP id f4-20020a05620a408400b006a04561399fmr21823005qko.569.1652348654717;
        Thu, 12 May 2022 02:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652348654; cv=none;
        d=google.com; s=arc-20160816;
        b=JhGlDWLCHRP+rB4RWTpmc4zH36DUMhxE3wTWgKl3C38izDNe99v++1i4nA6AjEJm7s
         mveYjlmtgxL3p3Yu6B9A/ad905D//JdcGEiiXdN3LkrI6VKj4dJ74KG86t6J+ifI5B5M
         p0GMSL0xNe0y6Yq9Q7w+Ve7CxnFThYcDE96a+1J+o3h5Zk3uUZdv+onrtj+SLjz2mwxm
         QU0vIU2nkFqR14gUE2dIvuQFXxwSVEqvFwxnkgly370PVa/xY+pHLhM9Yb6ec4aQPhll
         zW6fmbznGBjICx3dS2KPnHcby4bj2Eh2W7m4DcTipD3kwvYxE244fj+wygGQha2K7HhS
         mJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=M2Vy5VttRP5azgXjlwp/Ysbk2gFxTinyeN3lLDqNCeY=;
        b=i22VvFqLIAbrNETJDPQKBm9v2fmo6yNDpzIiirJwjA8pUe/+18dX8mj0G1jbIGPGrj
         iXu0gNM4oG9uM3otTJvqb+RgTJKJiN/8j52JorafAXMV7OkhTaT/F9yGZB+Qh2tlEANw
         GqTwggIo9QNe2vFyDXrJbRyNFYtMSsidO5UQd2Hp34J6RWAAhNKukyqRS3QnmTYNyjoM
         xKb+pCt8xcaDItV9nvke1G6WUdj/Vam3+/PGn3MF501Gh8tvg1eOgl0O6JWxBOm91Av8
         /EmeEc5hH52OOsxXMwdn8exCszhp+jbEyTwA02zJChgUmPru+g/kx6yOeHMO63X+ikCA
         wYWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wEODipZP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05622a050700b002f3e2226beasi2880796qtx.234.2022.05.12.02.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 02:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wEODipZP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1np5Mk-0006tK-6R
	for alex.bennee@linaro.org; Thu, 12 May 2022 05:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1np4iX-0003Sf-1E
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:02:41 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1np4iV-0002hL-As
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:02:40 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f863469afbso49023447b3.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M2Vy5VttRP5azgXjlwp/Ysbk2gFxTinyeN3lLDqNCeY=;
 b=wEODipZP/YLI3JGOqJBSUBG1Oh/o98/9bRJJSeUg9Cd5sS7MeshUBB1ufVaVt7zQ0A
 R9dfBf6jQjOiL9FJ7f2GEj7eDnHaFSJbI07w3yWcf7pEN5T+F6q8b1PqrW1c961+B8Bx
 aDLPimJAqV4zLB55zkK54mcKM9yxJtvNdDHyowzBSkCpj5WmIWthYw1K/DUENOIB059K
 lYBW4oQr7J97I713Jjrk3m3VkVA7FrxjwoCgGIZyovhZZybKAZcfW2OAKRnE5kAW8XUI
 1OjGVnIdh0maJuDV9lMj/T+HbvftMIMGKzyxDgt/tY6w9UcQvf7dTTRqtza3fqyEYI2r
 ZBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M2Vy5VttRP5azgXjlwp/Ysbk2gFxTinyeN3lLDqNCeY=;
 b=UkgQoIvlXG36Wsf8f5LDSuWrVDKxHmFVFSGFPT7jpYGgP6jJAcD5/q6aVvr5qmpDn6
 oV8UEBfg7PVLhBugZ7vrUvoIHYbZcoYWSedN6p24JTxgk+Obo5ncTfTt7WPzKfQjbfx+
 2tEBvToOZjxKSiCZGJupxtfpWQMsHZSvq7c/NUkhT8RtWLckDmik1PwU9dkICzGRb29Q
 FRVIshtvPrSgw746rUS8T8KkkMHstfpGe7G5XpdIrMQM/hKDC8yt5uU8yht3WHGvySFf
 hE1m/wV3MiECmCpfNWmAvk1juVv/LruQ1r0+9R+4yV5VL2uEj+QkO96dWpuh1ZVcB/nc
 dKNw==
X-Gm-Message-State: AOAM530tJrIJUz8AMrh1gNI2rfDHamN/OLGDvpCbyyW+KxXa+yrjmgyU
 R6ZZsS3HWSZ9VVY+ItCw/WQsFQjSTIAD0XGEc458kQ==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr30449764ywb.257.1652346158201; Thu, 12
 May 2022 02:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
 <b27e80a2-56e3-8197-a1a6-0b62e3f20c5a@linaro.org>
In-Reply-To: <b27e80a2-56e3-8197-a1a6-0b62e3f20c5a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 10:02:27 +0100
Message-ID: <CAFEAcA9-MxU48vDGD90B5fUP_Dnzc0VVdnPinecF_F1J9HPsbA@mail.gmail.com>
Subject: Re: [PATCH 0/5] gicv3: Use right number of prio bits for the CPU
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8dl4Qf0Zkdmr

On Sat, 7 May 2022 at 12:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/6/22 11:21, Peter Maydell wrote:
> > This patchset fills in an odd inconsistency in our GICv3 emulation
> > that I noticed while I was doing the GICv4 work. At the moment we
> > allow the CPU to specify the number of bits of virtual priority
> > (via the ARMCPU::gic_vpribits field), but we always use 8 bits of
> > physical priority, even though to my knowledge no real Arm CPU
> > hardware has that many.
> >
> > This series makes the GICv3 emulation use a runtime-configurable
> > number of physical priority bits, and sets it to match the number
> > used by the various CPUs we implement (which is 5 for all the
> > Cortex-Axx CPUs we emulate). Because changing the number of
> > priority bits is a migration compatibility break, we use a compat
> > property to keep the number of priority bits at 8 for older
> > versions of the virt board.
> >
> > There is one TODO left in this series, which is that I don't know
> > the right value to use for the A64FX, so I've guessed that it
> > is 5, like all the Arm implementations.
> >
> > Patch 1 is an independent bugfix; patch 5 is cleanup.
> >
> > thanks
> > -- PMM
> >
> > Peter Maydell (5):
> >    hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
> >    hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
> >    hw/intc/arm_gicv3: Support configurable number of physical priority
> >      bits
> >    hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
> >    hw/intc/arm_gicv3: Provide ich_num_aprs()
> >
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; I've applied this to target-arm.next, with the 'TODO' note
for the A64FX removed, with the "retain local variable" tweak in
the last patch made, and with "cpu->gic_pribits = 5" statements added
for the new cortex-a76 and neoverse-n1 CPU types (confirmed correct
via their TRMs).

-- PMM
