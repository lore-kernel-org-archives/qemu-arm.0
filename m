Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4093915lfm;
        Mon, 27 Apr 2020 06:13:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypI2Bhk1Edx4RSwZ/uLLMg7Z+Wv3gJ7M4oVZ6xTwGEl6xjLSev7IOBsdeHmXScTBKbfyZ35s
X-Received: by 2002:ac8:6043:: with SMTP id k3mr20573739qtm.99.1587993207638;
        Mon, 27 Apr 2020 06:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587993207; cv=none;
        d=google.com; s=arc-20160816;
        b=r3sLG22JGFAMAwYqNOYPY5fH40dQPHaEFtxcg5fI1+oCgk3+7hz9ySmkym/TSkdVAV
         ezzFeID+pIGRGRiitWIMQgIu+NVNDK7rCM2/vNtZJlOKWTf+glyikN4EVf0uzsnmSIRf
         rTmfBkjxhCu7L14Qp07iBXaZsTv+RS2+hKZhGaBALiTINwfpth2pBLqgdfV5fiiqnF2u
         JZIaFEZq8Jlm9y9Cekqi4AqJdTeHPIGJXxyquLL357yLZ32TngeK7xa6QUa/r5vS/mHX
         SfNksUUVwqrGEOdw3BkQs6YLqeiVogzelxdgMKiOjU5rthzk1pjESpm4lm1IxJi2QzKq
         PIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JkmF1I4n/URZA4JyIM+pngRW/xLN9zhqzG0w+jHOOfQ=;
        b=PiRqgGJ961z+yi9w0arsl1RI21MGGHBVp7lBIcYWVeDARqnPOQ8UrIUsxHW3rywbc4
         N9OUceCB64G3ZgEwtlYrfkY2RFlKMS+Jqa31bFoAPumT8CtbZIYP96sTVbIRHNgBlYsz
         TAQ3H1+Ry/7Fl16DKqVbj720bFpiiKZb7yycUvHQjONeY6F4Te1fwVgthAdQBc0EkIZJ
         3BoakuuP71DT4ftgiKEEHjTJOisehXJyMGRdX8FFSoNytlnsE2LgPaoeH02StDnNa/Op
         KSUEV2T+SHUNyM0AB93eQeF2mYXkEOioHMHWNzs4X/p1t0OTlZRVqKaucYBvNr4lZG2U
         2y4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RbcGVkxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z29si8465399qtu.170.2020.04.27.06.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 06:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RbcGVkxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT3Zf-00054z-1D
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 09:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3Z5-0004EC-Gz
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3Z4-0003XP-Qk
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:12:51 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT3Z4-0003X5-DE
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:12:50 -0400
Received: by mail-ot1-x342.google.com with SMTP id m18so25947087otq.9
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 06:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JkmF1I4n/URZA4JyIM+pngRW/xLN9zhqzG0w+jHOOfQ=;
 b=RbcGVkxaecf8F+7SKPne3Y4DqIWpLL7iGncmh39y7S+nzEQfbf8QBSMNjjWwpegZ48
 6WAnf3MJ+PgATGxwsVzO5a30YRdjo7XYXiGanJRayKG6gztyMXk5xEEp63BX/Lrs1S2U
 FOWjxR2N/DiKn9Qd5++e65qcOvz1CyeB344dvAohyoe82WIj72TIJ/p3Gy8661Bm+Kmb
 Q6qzj/hLuT0yeKWsj0W/TfJfFRhIxqbJjNItvAj72p3KaK7lyG8kBtRzLScCq7jTXMzI
 03Da6KCICi6gr5EhBxSJ8dNRxcdJbdWUivNuV4QCW/9AGq5nCLUHjm/M6La7a2s+CB5d
 h6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkmF1I4n/URZA4JyIM+pngRW/xLN9zhqzG0w+jHOOfQ=;
 b=fWELCUGAwxDkvvt93rOWou9DqJCK9WwUi5Tv4RFPViFZqjKL/JX0s2wrnkciUa/dDX
 9QFzf8bdUUnD3QZMIVu//WEZbXsqhMDDUrAZ3ruKkV+UcW+5vjJUYLv3+70rac/xJ8EN
 PI7qmmOxCYSIJDJfzDOyBj3LR0q/Ywt8vLuoZDfElCHSUfXtkv7IynpKpeui6wU1hENX
 oOIc075xqTSl/gdoSxTuHuL0jhL1Iyv2fxXiMN5NEsBZDUMdwCuoFBifOUs5BSC4ZLX9
 s4es+oYCXLU9s3536/Xaphg3k3ZivtOC7WgS1kHeHXxOgqRA2AWKe3s/+wTaz0Awnp+W
 cteg==
X-Gm-Message-State: AGi0PuYUSiyzhhxHcGqPArVqR5PueBZdu6DqX4ZnieQjByBAtBJ/uUS5
 fvAN3xJhXCd/QRMwqsKKEEaOCW9JMCMretuXaz6NLg==
X-Received: by 2002:aca:c751:: with SMTP id x78mr15798887oif.163.1587993169097; 
 Mon, 27 Apr 2020 06:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200423121114.4274-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200423121114.4274-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 14:12:37 +0100
Message-ID: <CAFEAcA-cMnC6gbhG5OTUhZX8WKSu_WKn3hkeSM=_9USmn45+rA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/arm: xlnx-zcu102: Disable unsupported FDT
 firmware nodes
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wP/HOtoeyqLN

On Thu, 23 Apr 2020 at 13:11, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> When users try direct Linux runs on the ZynqMP models without enabling
> EL3 (and using appropriate FW) they run into trouble because the
> upstream kernel device-tree has EL3 based firmware nodes by default.
> PSCI firmware nodes work because we emulate the firmware in QEMU.
>
> This series avoids that problem by disabling firmware nodes that the
> machine cannot support due to lack of EL3 or EL2 support.
>
> This means we can now (without manually editing DTBs) run the following
> in a current Linux tree:
>
> qemu-system-aarch64 -M xlnx-zcu102 -m 2G -dtb arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb -serial mon:stdio -kernel arch/arm64/boot/Image -initrd zu-rootfs.cpio.gz -append rdinit=/bin/sh
>
> Cheers,
> Edgar



Applied to target-arm.next, thanks.

-- PMM
