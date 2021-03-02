Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4559405lfg;
        Tue, 2 Mar 2021 07:20:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQA587LOqUI1Kz3smG/+Pw6jDJBq0Bgo9CpMwfFlk41+EoMt+oSsHNoz1Ch//3A10rorzC
X-Received: by 2002:a92:c145:: with SMTP id b5mr17468150ilh.186.1614698426504;
        Tue, 02 Mar 2021 07:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614698426; cv=none;
        d=google.com; s=arc-20160816;
        b=mZPgHd7u3eEC96buCdn+rUI0mLDTDikQOXC41NcZJ5lZJHJppLRciltlmoKzFDcuFT
         hzkiQQWSDBT8+Y1POUE+Mw7ssvELJH4D92rIUL53ezjKA9ocbf5wy3IKD1cpVdmjQqyR
         z6zU2TSWCDBj0FSmbSuT+2rohJJvvdN+9opsR8LsAsaEBcROpmotbck5pYR1E223PiNE
         axa9O694F3xm0RuLSc2ITpmDZdiuUNnMIsC3vBJ6NoU69PwMfoKXPmOaaCBYBetOqaJb
         cknLEqJLz7KWUXgJYIuaH7rX/T/LNjQshOfKKPnipM4kGQyX/6Tjfy+fXGs4jFuNwFcl
         DG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5qBR6nAlg2de3V4VtZKmdXZn/o6EWE+GCWP3kLKcir8=;
        b=tbv18PWIuKSN3ybF62xBwQzy80F0wSA3SSST39DcBLM4EjIJQEdsYcnCutT+IprvAF
         ivslklbNNrluwzfeaybFHpjZDf5oO6KT8jV+lI7s2eH0TEWydMaHBaxLvOjIrXhKOH/K
         xYCDsi15NwUwyQjjW+bQNgbFtogVcJDOpl7c+79+EZpWwk+3aQ9Kr/9w4HJS5p2wbx/H
         zdY6mFc+uBG6Ma0NdhNNoJj0g1H5mjobSs3SZXZBDTHBU1fMNCmIu9AX04ipxctM8gdm
         DmEVkrtK2PamA8SUJIfnMB2kAh7sA9yBCHDatWfa2N2+H6f80ur5OxEpGeu3HvDvTIia
         Cidg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="t79/b9ff";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si9445696jam.70.2021.03.02.07.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 07:20:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="t79/b9ff";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH6oz-0006ep-Qg
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 10:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lH6oY-0006bv-AW; Tue, 02 Mar 2021 10:19:58 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:38938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lH6oW-0007zV-Qq; Tue, 02 Mar 2021 10:19:58 -0500
Received: by mail-lj1-x22b.google.com with SMTP id u4so24391912ljh.6;
 Tue, 02 Mar 2021 07:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5qBR6nAlg2de3V4VtZKmdXZn/o6EWE+GCWP3kLKcir8=;
 b=t79/b9ffHOD6JceI39MNNYC61SAPzhhnMn87BWeC3n9cDgEGssXa831gB/ioqE2tgl
 FMW2KtEP4vV5bQQdbOjCHD7E+6xjTjgNZ7zhC4cUlXeayC1a2oULpbSEGvXZLobeZyOE
 iJ6CUFNSxl0EBUEi+ZG95vxY24JVlI694yattcpnLQ9Lrda9I3+66VuzDjf9D+mcIAEN
 g9ERKSC9ZBfBmrIKUbYt9dofySy4+DKB5qV5PitoG5ou4w2VIcbEuwhA4oZ1TJcMcVWr
 ylIbHst6nYIED7kRnmCIeokpxYyhKII75m7amReyCZ6Mbtai0+FRpJp844SoKAd0l/EP
 2/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5qBR6nAlg2de3V4VtZKmdXZn/o6EWE+GCWP3kLKcir8=;
 b=JWfCECMatk0ffY26Yodz0L7A/7yg4scWbeTcYbzGxZPgKw7cAmJ+sgmKq7c5ywHEkQ
 V7KF7iB4t6Yz/zvL2URRWFtRHux1x9zqwv24pRAO/n4GhSk4tolkEIAWkDWGTUxeoTJA
 SXuMs9Yb2cFuN5rtPM8uew3gHqZzVgrcy79q4C/+aCJgkrifXxpBv26jHoOMc9jIMUsE
 zrH//dTkiUiN61Y1XHp0uJF58YJT3BNOLUW8+nw9E3DPQCMkrOM6ws+GVSmqrmNK+icN
 BVucMDJfp3KNE2p93NHmV7LqLxNn/2t6I2T71iFU8BgxW81oCDDTAcuSriEfdv8WrVFE
 9BSg==
X-Gm-Message-State: AOAM530Dvh/ben4FmTh4aypiRs0FBsjH4ounGAVPVLY0NPBc51i6l2zP
 l+nBjc1EDX2QMTa7Rgp3n7o=
X-Received: by 2002:a05:651c:2108:: with SMTP id
 a8mr12177466ljq.329.1614698394799; 
 Tue, 02 Mar 2021 07:19:54 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v22sm742287lfr.277.2021.03.02.07.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 07:19:54 -0800 (PST)
Date: Tue, 2 Mar 2021 16:19:53 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v6 1/5] hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA
 model
Message-ID: <20210302151953.GA477672@toto>
References: <20210301132011.8494-1-bmeng.cn@gmail.com>
 <20210301132011.8494-2-bmeng.cn@gmail.com>
 <20210302150348.GZ477672@toto>
 <CAEUhbmVeha7EOjz-q-y+cihL_TG1Afz-M4Go9eBTD0g4JcDgOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmVeha7EOjz-q-y+cihL_TG1Afz-M4Go9eBTD0g4JcDgOw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vzqb/QzNloNU

On Tue, Mar 02, 2021 at 11:16:10PM +0800, Bin Meng wrote:
> Hi Edgar,

Hi Bin,


> 
> On Tue, Mar 2, 2021 at 11:03 PM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > On Mon, Mar 01, 2021 at 09:20:07PM +0800, Bin Meng wrote:
> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >
> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this

....

> > The 3 DONE_CNT bits in R_STATUS need to be w1c so that SW can clear the counter.
> >
> >             .w1c = R_STATUS_DONE_CNT_MASK,                                    \
> >
> >
> > For reference, I'm attaching the complete diff I used to pass the testsuite:
> >
> 
> Thanks for the review and testing. We will incorporate your diff, test
> and send v7.
> 
> Should we include your SoB tag for the diff?

If you take the changes as from my example, you can include:

Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Thanks & Best regards,
Edgar
