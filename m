Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp484393lfm;
        Fri, 10 Jul 2020 02:02:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQMoJ8rA9CwMTboV4RgJ/GlOuQ3hAK8H9ARzZcSrwRSeDxAAeHrS4rAh/ZZ/wdyU1a9mW0
X-Received: by 2002:a25:8802:: with SMTP id c2mr21146023ybl.444.1594371765584;
        Fri, 10 Jul 2020 02:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594371765; cv=none;
        d=google.com; s=arc-20160816;
        b=HwxpIrn7lMAfdXXc8wQo8b8KJRfzC96nhncxkFHEaGbzLQJx3L/22M/yXe0sbLbXnF
         jKLEK8S+al9anyx01SDiODUsc7nhJwGlg35E9NPhdx18LCtjYLjinf/NWctMPUJfsTX3
         1brVp0qN0adifCQUFdIFpQKO3/kifgDBeawWjDzAO6BnCk/U3r8FTTrErjKTuHWrHJyp
         CFOUaC7yOGgXP19dmdX9P04lDERopbNoThBPAWFsoXdjG8fyplbS9Q6p8AHvGvWtkDka
         d3Tp8M8ju1u7ukr2FxJj4SYfTuJENH0CcBo1lJTuf+0KOY+IHH8EAByymc4fOxZntFOo
         nATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2q2sMMvB5ZCaxfYoolKsd+GrRnkPmJuPApQ3PnGZ3Zo=;
        b=m83ypMUPTI1i0B3N5P5SSZr1LLA+HgBxb01teBTaBvqPZDW5M5jONQPYc7dUpZnoHM
         ny4Ll1jegtlVxFdFXpHeJL9rjM9aLeWe5/351K1kHm94iMtUMb6UFiJ5eAyMvoxOmawP
         Sjt7AcV0Bclb98lccRnrOAnYs2xkNiMBaLUqhcjZewxGW3GJM05RGMXlhqcNlxE7i6Ub
         7t2ick6jjGG+4WVqGF1OSKHvocOnfp/HkMwa7tCGrU7FFdk3u6QfSyisAjy8Czr9IB47
         eR8rJzmaGQf6JMWlnSl99fgJdATObR0xnqBBrzwZ/+8yzfKCTuxqIo1SR/Bct4tsjjqs
         WZ5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Atvmp7ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si5190297yby.238.2020.07.10.02.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:02:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Atvmp7ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtovU-0005ew-Po
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtovN-0005dO-9Z
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:02:29 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtovL-000124-7u
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:02:29 -0400
Received: by mail-ot1-x341.google.com with SMTP id d4so3731415otk.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2020 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2q2sMMvB5ZCaxfYoolKsd+GrRnkPmJuPApQ3PnGZ3Zo=;
 b=Atvmp7ug7BzRIyKLMo62OOqZgBvSwEzNGWFcHC7R8RvIKCRxKLRFwNiseVM7xbRh4H
 RVUEcbctgpWoDR47cctC4lbKFyUKTcHxrar9cfnrn03Lliyjq4SEPm3V4550uEifhcyl
 c5b7uk28JGU/jCUuu22uq0DN2b87iZTgSjd/xEPrvhSFOKc+5nw19aGB29FF2EhJ5m1a
 V/WJycSDSLkn+fFGjYQBGAemROih9K1GaGLKkaXhVozoZt/zIef5D7b7gOUtzHo7vpxe
 tCAhfWJB36mJuT7RJx83eSbwENz70BKoRo7HpliuzRVvOilv8749w+Zaxjjwd5Yz7EKg
 U9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2q2sMMvB5ZCaxfYoolKsd+GrRnkPmJuPApQ3PnGZ3Zo=;
 b=JA46VuGAKJ4kBEER/dow/C91bUPAOQqHVRkiS0QB4PYg3Hdmp7Y9d/zIZrg6lYMmgd
 9VsprKKAyD67+iE36ZbYG9a0UeRnaxKkGT9G5LiO2Gmde1UXAFgGXe/JXx1QYEl4+ELs
 D7jdHEQpyGYSeXJ4kdWPSKhk3CBaFaaNMYJFl6/72hvHHfgGdE3M8SRVeD18jFefJbME
 2PVfUSY49oXrfcAKeXboUqRZ4Z5C5Yt0TR903dovrIac/8IIiZaAOGz/pDmaeImfixMW
 4EYALHMexOvolOmkYMk1sad1me2NzPdvrPdgMMtlby2drZTqJ0gfiNGsfsljEypcj3g8
 4HSg==
X-Gm-Message-State: AOAM531e2YcMbxLX54TbU4P+PJyV9tOo+0uou28VpZradUtfSpvQ2nNb
 fyF2JeE/giL507+QlRn7RMMC74jfB4dgx8uIM9NkkQ==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr50540854oto.135.1594371746037; 
 Fri, 10 Jul 2020 02:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141856.15776-1-eric.auger@redhat.com>
 <20200708141856.15776-6-eric.auger@redhat.com>
In-Reply-To: <20200708141856.15776-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 10:02:14 +0100
Message-ID: <CAFEAcA-gmQ841XqGL=sbMAPoXr9EAqH=0Gud=4daBPKKR3DpJw@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] hw/arm/smmu-common: Manage IOTLB block entries
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LIQIMdTzZa2i

On Wed, 8 Jul 2020 at 15:19, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment each entry in the IOTLB corresponds to a page sized
> mapping (4K, 16K or 64K), even if the page belongs to a mapped
> block. In case of block mapping this unefficiently consumes IOTLB
> entries.
>
> Change the value of the entry so that it reflects the actual
> mapping it belongs to (block or page start address and size).
>
> Also the level/tg of the entry is encoded in the key. In subsequent
> patches we will enable range invalidation. This latter is able
> to provide the level/tg of the entry.
>
> Encoding the level/tg directly in the key will allow to invalidate
> using g_hash_table_remove() when num_pages equals to 1.

Oh yes, and indentation looks a bit off in a couple of places:

>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova);
> +SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
> +                               uint8_t tg, uint8_t level);

here ^^


> -inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
> +static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
> +                                         gpointer user_data)

and here ^^


thanks
-- PMM
