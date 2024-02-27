Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2816438ejf;
        Tue, 27 Feb 2024 09:25:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5OSkzh2Nm+nCPNbTXszHespw/hmG6MF11eKlb2dAWjRef4mPLY/xFDrR+cX1uwIIniHHgOL5MPep5vEeMFnU2fR3YhE50
X-Google-Smtp-Source: AGHT+IHnTbKZwbVoKFopUFAOS7zHqXoncJYk0CBXZBiGdCJBAQzpJ9VA16TgCi7w7umHzfHYkGAc
X-Received: by 2002:a05:620a:1595:b0:785:c9d1:547d with SMTP id d21-20020a05620a159500b00785c9d1547dmr2561934qkk.78.1709054753951;
        Tue, 27 Feb 2024 09:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709054753; cv=none;
        d=google.com; s=arc-20160816;
        b=m6trguebtJL6sA+CuVqAkqln8wzs5nx8HVWNsetEpfsCGZJ6oSwHrodzMHJN5hnEtX
         kxA2WguJK4jBX3P5yv1DKRLhkuW1Uc/D5OTELC8RvepyEVES8DZJnM5hqUTPND1fJcHj
         0mrpGtxirw1F1cZOyQdydrOxVbWBniVf9/GVGpUZb8NAugxxO8mDxP6eZOztkGdG4lvT
         xrTfzzRc8d+jnYAvYZVZy+ZWvHd4nf2Kan8pRjpwXusk0dVR+yLxzgeXe01xlMUMpp0h
         mlQ6e1z4IHPkI+06ZTcGEXOCcXTwY8lCY+5p9TUKhYQODpZIOPIgHk3DdLdiSRci+yfd
         TnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kcxG98UeYhB/BNiA6TOJimNtm6g2wl9X2q8dfRlYshQ=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=S6UUpDnx8oXY2fpIUUHN+aRkzgk3TrYf53Nc6kjr5+KciDhpiam7UM8gTtx3ORMqWU
         HUXiWH8KiKSXt8oK8g8DQXsVybnP7wtD3a8z+/TOflU7k6hZwMoj99Iix1UPwtTqAfk5
         qzuipCCVMB3gItjsGLM8c2wTIozGqyP0zRDdleEsbxrbe+3PtD2W0EAeeX5GJDq8NVgr
         iRUJrcJpjl8faCnbym9+kwGdyf6LbIg31w5frF7cgSNHvlcJWOLYQ7jKZeb8i5UJCCY1
         cGs0/iZNYB9CSUSV5k8Anh4qtgXtxXVWgF4bIfxmvFCGgp3oova2YqrBJoNQ/uZvHXME
         4bZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rt9caXYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020a05620a401600b00787e18ad43bsi2415899qko.226.2024.02.27.09.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 09:25:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rt9caXYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rf1Cw-0000oK-7Y; Tue, 27 Feb 2024 12:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rf1Cp-0000jf-10
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 12:25:28 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rf1Cf-0001s7-QJ
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 12:25:19 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so6170843a12.1
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709054716; x=1709659516; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kcxG98UeYhB/BNiA6TOJimNtm6g2wl9X2q8dfRlYshQ=;
 b=Rt9caXYX7DmPzfQ688UXA5YBAH/b2ij+dPCt2D+phFkaQLp83Ocym5GyPq/WyNdYHE
 tUoFzLxi6b+c4UgNLyMo0kWRi6I6zAZdkT2/oUEq1F7QuN8WLpoVodaG4Uy1df1KvXXG
 MFTh1WZcnhUPoGwOZHfcYQm3E722FfMk4HIy2HVO+UZpRR2vCRgGXkrUVmUJBs3Axj7l
 Tpfx9a9mEJ5vU/n4YxNZS88MMquRu6ysD00/ijXH3h8UgtY7IvoGVpqODUXupU9Tck2G
 obW7OEsD1NvPGJZelKY4onNONB/2KodCumg4mPtQAXCCMkazJ8Bb89MCIhhh0W813kSL
 LZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709054716; x=1709659516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kcxG98UeYhB/BNiA6TOJimNtm6g2wl9X2q8dfRlYshQ=;
 b=D2GfixGWXAaHNOPEX1KWQPTJ1hP/x7gkeaVDPY429O/lvzCYUojl8/LxichL2+fhJ9
 i/n62iYoJAnQsC3d4hZY3SyIWUOkzUsChFMbFc8rWlMpIzdVw+5URfPIM2NHOwyWqhPZ
 1Wp2pkOedmtDDU7n1hV25higeVBTYVBDBWIXydSMyCqS+bI7lGJpQ3aDPslpeU4bqHag
 1qAzfsWwjU5q3fx/r4DDKuqlH0WzASRFnsR1GPqn+EkxgTinRMK8JvxmDF/S9i9Krn6+
 xwCCbRvfv3YTlQd3Gkcy0Hk0wPFhGPRmWgM/bUW69cx68euOoKSD4d6GA6QSbNFROiU5
 etiw==
X-Gm-Message-State: AOJu0Yz2w+qzpdiyGc2FR4rh5Sn4VjNlvGO1MrhJ8w4AFimM5VGaqY8r
 RtaDsq2yK+CzKVNrw+6pMT4dvcJzWVKlnfVdPdd2K4dE+qCONm9JgwDKGwrdPnrZgIsGGK5JZt0
 +UzhNflo/eb/lswQVnX4uVObvHAzzXy1naAKF3g==
X-Received: by 2002:a05:6402:5188:b0:565:965f:b0f2 with SMTP id
 q8-20020a056402518800b00565965fb0f2mr9283821edd.5.1709054715970; Tue, 27 Feb
 2024 09:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <CAFEAcA_oSeqGAPNpemhbyVkuMYtwbr-TG2QNQ7=DSZv0s0h7XA@mail.gmail.com>
In-Reply-To: <CAFEAcA_oSeqGAPNpemhbyVkuMYtwbr-TG2QNQ7=DSZv0s0h7XA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2024 17:25:04 +0000
Message-ID: <CAFEAcA8GVZNt_0w=C+jEtp7uGt_h1SLJvZM3iGJAF_+8fDwi_A@mail.gmail.com>
Subject: Re: [PATCH v6 00/41] Raspberry Pi 4B machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b2BgV8GwV1J2

On Tue, 27 Feb 2024 at 15:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 26 Feb 2024 at 00:04, Sergey Kambalin <serg.oker@gmail.com> wrote:
> >
> > Introducing Raspberry Pi 4B model.
> > It contains new BCM2838 SoC, PCIE subsystem,
> > RNG200, Thermal sensor and Genet network controller.
> >
> > It can work with recent linux kernels 6.x.x.
> > Two avocado tests was added to check that.
> >
> > Unit tests has been made as read/write operations
> > via mailbox properties.
> >
> > Genet integration test is under development.
> >
> > Every single commit
> > 1) builds without errors
> > 2) passes regression tests
> > 3) passes style check*
> > *the only exception is bcm2838-mbox-property-test.c file
> > containing heavy macros usage which cause a lot of
> > false-positives of checkpatch.pl.
>
> Hi; I had to drop the qtest patches from what I'm going to
> apply upstream, because it turns out that they don't pass
> if the host system is big-endian.

The parts of this series that I was able to take are now
in upstream git, so if you like you can rebase your
series on that.

-- PMM
