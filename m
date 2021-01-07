Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp237282lfq;
        Thu, 7 Jan 2021 04:02:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtyzaElQHLyoTK5jJ9FQdxBMhTpb/BmKNLowwM8rvWeaEyGKiAQcyZcu3MHN/ZxQwA76Wk
X-Received: by 2002:a25:ef46:: with SMTP id w6mr12782924ybm.458.1610020971984;
        Thu, 07 Jan 2021 04:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610020971; cv=none;
        d=google.com; s=arc-20160816;
        b=VJjjRnHEStN5n92wNs80s6nutDCXI9BNe4ggvd6l+pnhUqkGjCYDMa1MjeKERnMf8v
         g4M6ItJedztfwbMpSYY0DZHaYzvFmi08f+MBPkfKL9XgLSwpvJGfzaAhN7ZV0MC2wNwi
         6uR+hzLBik5nP/b19OHcgycSqumbfKKW2Hh3BtlhamB3DtD6uoDl8YmKRf/DMjm6/3vh
         0Sui+S04FLN0BPx2bqEJiYkhhq+z+9Eepyp5Cob3gZGCOKB1bTPqOj72ITac+emY6yr9
         GxC6P2CYed+EZiYEdclhYLehXju8SVq7+qhiBwY0heKhi+BaVBEK1xLGMs8BlqaliNY5
         DZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/JxDxDkvmOFXNJNBLofXY5rmgmrH3nOwnc03kHQz7I=;
        b=jMlTdfUgdJuLznRPorrlz52Xc7elKrabLNTrKTXa8D7mz5SG9iIOuxV59LdpbH3i60
         +tbFTctsOXSnJ09i3vS1s9QUzledXFHr1Dnm3fi6cAomU/80tAye3XM64xaDraSCU/ew
         QThU05WNKoUdWIHJUyyvGTRKPqil+NGgiFJN0R4lcZJ9UoEA3vNy2pV7M03dX3vKynIi
         eYwL1IU3QbKInm7wj2DXgjVOktFabF3ShsbXrZrUj9UVoVjpgS9d43p0lQe76Shxzgni
         c90tJTSTmA90yWNCUJHomhk2GW/YQbUZFfA6CEexAHQrGUgnejsjIvyRWKdhsCQmBl5K
         mUmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=icUfLfvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si6457228ybm.261.2021.01.07.04.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 04:02:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=icUfLfvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxU0B-0004SU-EG
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 07:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxTzz-0004SE-9J
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 07:02:39 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxTzx-0003sf-J3
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 07:02:38 -0500
Received: by mail-ej1-x632.google.com with SMTP id t16so9232477ejf.13
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 04:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B/JxDxDkvmOFXNJNBLofXY5rmgmrH3nOwnc03kHQz7I=;
 b=icUfLfvA1tgW3CEvXdy6hOZssccXsrya/F4RnQvFk82MvQlseOleQzmIugP65taCaF
 J8mk6wuWCGljfqECbQ8OAYvbUrW4Gi7kqRhhAH6rBRMnslEG2PHPssWiQLINZriZczPy
 4BGeQVWn8J+e0BIXCz51c6OMIMTnUqV1+lBOZhqd3glsVxx1VwY6+uTinByk2IbqfJHi
 NLC2x2WsIWfhrIy7zw1dg+6peHlEgmCBIHONN+1OFHh1CcAMdj1Hge25i5T16yQivoLg
 SPVkbmWNh4eg/WxCKGJyHUFg9C8h6d8/mMdU+VeVm3zxrtgx9Has4jIp8mCw92OyxunM
 SHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/JxDxDkvmOFXNJNBLofXY5rmgmrH3nOwnc03kHQz7I=;
 b=N/1A+nKz679WxW4qg8alisPOR8ZdoR4tMSU/NkMR0T6jpkbJy0VjQf1nHxUQ4a5s+x
 w8rTU4E1rOfqL0YKTcnt4JYVt8nYe2tuSJJmt7DpDim+bJ77B3pqRTFM4RxvYS3qajCs
 0cZy/psM18ul/8GZp6/70AAGQjduWEEw631obe7eaGMOUpRtrVh9tuuegCCa/XvOF6Ap
 +D08WqixfmMMrwMyIOBlMz9QfJBG2C5GtQITiBkWfnDvtxYrJ5kG7kd1cKH8dfBHAeG5
 k24tWUxjNTXB7zy7mPWja/Ek9zicH+zVB1oMeJVBGwnQ7+hAOTHcIGS+ghQ7aPiorQUH
 N+gQ==
X-Gm-Message-State: AOAM533WTQ9Y/MATnQm2za0uGSSCOYTgUWYm2Nnb/WB8ckXQb+teSz88
 rUXd34+e4QJVbk6UeIRbg8Ep80+lKcOG9Yk1LtTCtA==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr6120369ejr.482.1610020955980; 
 Thu, 07 Jan 2021 04:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
In-Reply-To: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 12:02:24 +0000
Message-ID: <CAFEAcA8HDAWqQtGuc6XQNP5o1SbXpp4D+98pyHr3Td2a03ZVpQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] intc/arm_gic: Fix gic_irq_signaling_enabled() for
 vCPUs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ILeyTHBiKT9f

On Mon, 14 Dec 2020 at 22:21, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> Found this while debugging an issue with lockups during boot of
> Linux on Xen.
>
> In the particular setup, I'm running without EL3 firmware so group0
> interrupts are disabled on the physical interface and enabled on the
> virtual interface.
>
> Looks like we're checking the wrong CPU_CTLR reg for vCPUs. This fixes
> the problem on my side.




Applied to target-arm.next, thanks.

-- PMM
