Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1739130lfm;
        Wed, 19 May 2021 11:20:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNI6pMbVcjbpDAUBBElGbySKRen0Kv2Wyykji67m4XAvDpI/RGT+upwxBgzDhHQY2ztCiz
X-Received: by 2002:a05:6638:1482:: with SMTP id j2mr262714jak.63.1621448428367;
        Wed, 19 May 2021 11:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621448428; cv=none;
        d=google.com; s=arc-20160816;
        b=hE9Z2GG0xCod9sYfQ3X1QEG1yLbM2+yHB/dP7soKfdyYub6JuhNA9brdDlJcHIsgHY
         CAcZ65gJRGDKsfZDRfTNY3/GovE3E5hHk4qmu2u4aMms/ceCSsGHmtU4YLybYoVflJKG
         18EKnFF0xr/M2++4oJQPnJMFurEMVhji2WJqPiLLg9JGUnSkMF+PT+pn5gutNCAmm7KZ
         aHhCrTG+Ju52s0MjkqXIdWIM0skitVN57Ngssd4OFQsZykm+bu6aMT764GSzAeNEciD5
         zai1IWRtYXBtzegtP0p4R8jGsW38RaWW2JJ1nr53re1m1rfWmXull1HpKkB8Dmk0oRDP
         SFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=R81AL1nRAdda4XOUzCnaK3o2srIcJR5TxYNhHV9cz7g=;
        b=SMIOx1rlV7I8LoMSbXQqMEiqCs7Uat8z9CuBo/Rgvs5PutS10ilc35TLD3zz051jBx
         QGumxZYadlDB3V/KOgoHNc+2/gzdD6J+Hi94rZCpcnFIMWYzKy9Uq+/2p0VAgZ3lcTn+
         PijLPL8WNgPXEMxyaep2eWs4UV0KoUm3y1HUStfJi+Vj31H2qHhQnroeBIIdsKKuzdtt
         UVcfOQyXBhrTBXOvqMOV+WL3nY/zuIK/1aqjZuhDNX9LlpYVJNbxorn36qf4FJK+qiqU
         mD9ypWrx13Rp4GPFE8579uUOJjcdtFUtoptdVtCfqe9z8qA2/Izb0LEFpZfLOHFV58UO
         AV8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kBCENu4L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si39558jaq.76.2021.05.19.11.20.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 11:20:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kBCENu4L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljQnz-0002YX-Ni
	for alex.bennee@linaro.org; Wed, 19 May 2021 14:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ljQe9-0004cR-RU; Wed, 19 May 2021 14:10:17 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:45788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ljQe1-0003Hv-QU; Wed, 19 May 2021 14:10:17 -0400
Received: by mail-lf1-x136.google.com with SMTP id j10so20426910lfb.12;
 Wed, 19 May 2021 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=R81AL1nRAdda4XOUzCnaK3o2srIcJR5TxYNhHV9cz7g=;
 b=kBCENu4LUJjEncZs0upFW8lmk35IoSYtauJshIY11ZadtCmQeO3DsmgKEmQzsacEnC
 792i1n5t9A+agH4MGjcXIBDGHi8czzS85vEP4IkB1ZQsWf9yVuRuG+/43PMMztRpDEKU
 J7VORYAMxjyXENmSa8DyHeZ6Znln7pP6H7KGxsqscAu+p9vV4kbEys4ymDDg3F1XUbV2
 yjsokPxWUib8RFdeaFHsxayCP+dH5yc05hTLghkD6v68nJC7YU6couUS7uoLWjLvQfRs
 rig8hzf2F0ahcE8XHDQYsUC4U+JHwhu1/Vk401ZZzwjjwbEK7zehJFEavNqQ1el99PT2
 qL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R81AL1nRAdda4XOUzCnaK3o2srIcJR5TxYNhHV9cz7g=;
 b=a/O0xbTEyATju4AqmYSjwL3UaTnIgasmZYGpkFlY5I5MmipJb1mVGcDR90jlz7yoJ1
 vYWh1pYl3oO7ciU8TGlSRezud+eBhupj45mLIvQVt4NKw5+WF6yZy+Azf3jjYJCtyira
 oL4FXj9D/koVhkkhp+pIyw0hr+M9j2E0mdPDAiBKehO1UT3j+EQU8s/DYRmDM9p1Ee8k
 vo8xhvCe4v9ghhs5Spgig0d2L0Bul5PsppGxnRaEe1FvZ2bzPPQeT5l7m1XAUH55ax94
 YdJ+viTBMtPnWvmpnaOh2o5H5BbmQJaQUk4ve3bfdz15cdDn+Yt/4bXMAZD/amr8fLOM
 +n5Q==
X-Gm-Message-State: AOAM531E0+KVHX86a67uO9oPmWNmupcLuMWVkDok8VKiXICwaqONWfrH
 dd6oMrh9ezkgYQv56evKH70=
X-Received: by 2002:a05:6512:3995:: with SMTP id
 j21mr495043lfu.356.1621447805925; 
 Wed, 19 May 2021 11:10:05 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id z11sm43769lfr.73.2021.05.19.11.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:10:05 -0700 (PDT)
Date: Wed, 19 May 2021 20:10:04 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/3] adc: Move the zynq-xadc file to the adc directories
Message-ID: <20210519181004.GG477672@toto>
References: <20210519000331.3690536-1-minyard@acm.org>
 <20210519000331.3690536-2-minyard@acm.org>
 <b08ac221-e8fa-fbc0-5dbc-158841c79405@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b08ac221-e8fa-fbc0-5dbc-158841c79405@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, minyard@acm.org,
 Corey Minyard <cminyard@mvista.com>, Titus Rwantare <titusr@google.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mIwJO1rRzblC

On Wed, May 19, 2021 at 07:57:33PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/19/21 2:03 AM, minyard@acm.org wrote:
> > From: Corey Minyard <cminyard@mvista.com>
> > 
> > It's an ADC, put it where it belongs.
> > 
> > Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> > Cc: Alistair Francis <alistair@alistair23.me>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: qemu-arm@nongnu.org
> > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > ---
> >  MAINTAINERS                          | 6 ++++--
> >  hw/adc/meson.build                   | 1 +
> >  hw/{misc => adc}/zynq-xadc.c         | 2 +-
> >  hw/arm/xilinx_zynq.c                 | 2 +-
> >  hw/misc/meson.build                  | 2 +-
> >  include/hw/{misc => adc}/zynq-xadc.h | 0
> >  6 files changed, 8 insertions(+), 5 deletions(-)
> >  rename hw/{misc => adc}/zynq-xadc.c (99%)
> >  rename include/hw/{misc => adc}/zynq-xadc.h (100%)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar
