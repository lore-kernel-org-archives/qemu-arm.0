Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1048487ejf;
        Fri, 12 Aug 2022 03:28:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4L3CGX/s3+Swf2VclwtNLKQb9Y7ZvLtiJ11sQgXBpOxoO2jmqGVMqlPV97hQfABbi2N/FI
X-Received: by 2002:ad4:5c83:0:b0:474:7023:d59f with SMTP id o3-20020ad45c83000000b004747023d59fmr2875824qvh.75.1660300104030;
        Fri, 12 Aug 2022 03:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660300104; cv=none;
        d=google.com; s=arc-20160816;
        b=SVnHszTlHGiooSbm+MEZV4EMOg0I05e35ROFgVf9ZEhZENRt/SXvlBkl+rpMPgcdty
         IE6H1BDM3vgvSeHRFsJ8pbafZD1FUKmxfiKgYypwF7Mk6nCUhnb/5bN85veYaOzlgcIC
         Qz1Y0RY/7FKioAGL7Wm+5YWUp8VLyJDIMF8mEodDrTOIOVxA9XvI/MzQbesd3mNpEYHJ
         LvfTXzNSd6D4HNJHSVXkb84g1KXms2D732fWp9hc8GdSopWDABcG+3I5HuelSodZxex9
         4VrxB13ZZbhqFpxzrXuWDHuQAtB5fBGmTMPmD0cBD5/mU4R5KfDvcg1O11OwwNNtorw4
         4cJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+abl8N5peQYxspD7v1R9DQ+8Uy5z0WJfU4AknXzrH0o=;
        b=F81Ab3RJ44G9Fqk3oQ4qNTAPA129qblEqPfnvBtgEQ+bm3cH/ykL/e7vRkgtr4nAeT
         euECTIzkENJisH8dbP9Zf+1O40r6POIddxBRZgZirqavdMv/VciaYrdr0sHkaq9xBMcL
         FkA1Usbdi1gFpJT8T2ZvmWMo9KAVOosWu5icrXKUTfqaIJ6h+0NKVVvqyqsekI2UGXYd
         vviVLH8IYo1036PjX5aQfaBV1wt8aERZ453/wXPeFtydVhy08GkpWBrDvhN7pvRDr06O
         406EvYKCkhnoXnDMeoO3rylXQE8M9VMyC3CaADuaIm5ixrl6ivaWMsbT+Tfj/YQuZtvN
         kMWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNs56c8f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020a05620a248500b006b5e48997b1si1235944qkn.661.2022.08.12.03.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Aug 2022 03:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNs56c8f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMRtv-0004QT-Iz
	for alex.bennee@linaro.org; Fri, 12 Aug 2022 06:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRr8-0002rQ-8I
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:25:31 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:41708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRr5-00064b-4s
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:25:29 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id y127so798299yby.8
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+abl8N5peQYxspD7v1R9DQ+8Uy5z0WJfU4AknXzrH0o=;
 b=UNs56c8fFphZJjs0J6uE3/7FkE82Gx6L6MOP2tDL+a6wgI4Y+WaVI6Ckw/XFbp/tl9
 BKa5F6LV+4nhNQ7R4qQ73l7ZtzqMYotLhntFzZhiSZhXnU5TjYF7V71qXjwOxWTDhCSN
 9lqyaAWSxQTlJyLV+xWJXzacvXau7GSd/bm93IT3oaid2Tfz3LqkYbibWt+RL12Sv2Em
 e7cTT6WaeGcCElWQHm5a4WnuwzEbHqVa/zTJZ9JZnRMkzpJKvy9aOHrgJTXEo6uc3aIe
 2X2nffbHeO2TNyUrFalzfWV8UTHZA7XPgnzo3aMuVZz82zOtCFTxvOjSVW2/hnILQZJp
 tx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+abl8N5peQYxspD7v1R9DQ+8Uy5z0WJfU4AknXzrH0o=;
 b=kBku4KXJ90nswdJ6El9+IsSaq1XBNg5n3A+ieg7ZlrMdzbFR85CUPOzYIUo6KiMbVQ
 1+AYdlBbdmh874LI70ASqol8jZ94r3NHv3wdssNz/rIv4YLPb+g0xRNC91SesEMqoyjZ
 QiYUY1X8zTf1oFbO6WrtV60K/QZGd0tMn1t11qon7ilKXmQLR+vqqXptoAxXZvrxpgcO
 AK70KBCYOoQghZKjv3HJGsvsCAqETWi0fx+NUCVGrp6/QARTszi5UF9SiEPx8rw1DklR
 VimRSd3liJks8EynrYnK/uB/Rq3xieyuBklU3uXUyTC0ax0+0887zMpTPK1SNpjmh1Py
 wzWw==
X-Gm-Message-State: ACgBeo2slrxVPuvhuYLTKzzXjfkDz/ELDpbkDvqG7IjBKX3F6MTIoUBL
 PF8vMV1vecKovEjzP/VliXHgvw/yHTm1Xky+5TTpkw==
X-Received: by 2002:a5b:10:0:b0:684:2180:a637 with SMTP id
 a16-20020a5b0010000000b006842180a637mr403037ybp.85.1660299922057; 
 Fri, 12 Aug 2022 03:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220812022018.1069-1-yuzenghui@huawei.com>
In-Reply-To: <20220812022018.1069-1-yuzenghui@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 11:25:11 +0100
Message-ID: <CAFEAcA-43AE5C_2nv3oyxW4jySKXdmZBp=s6xKuw=1ddxprzJA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Present the GICR structure
 properly for GICv4
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, 
 wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: mEs8Dl9ySPkR

On Fri, 12 Aug 2022 at 03:20, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> With the introduction of the new TCG GICv4, build_madt() is badly broken
> as we do not present any GIC Redistributor structure in MADT for GICv4
> guests, so that they have no idea about where the Redistributor
> register frames are. This fixes a Linux guest crash at boot time with
> ACPI enabled and '-machine gic-version=4'.
>
> While at it, let's convert the remaining hard coded gic_version into
> enumeration VIRT_GIC_VERSION_2 for consistency.
>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Oops, I missed the ACPI side of things when I added GICv4
support :-(

Crash-on-boot seems like a bug worth fixing for rc3...



Applied to target-arm.next, thanks.

-- PMM
