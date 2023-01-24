Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3799667ejc;
        Tue, 24 Jan 2023 08:48:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdiet6GiT3AtlX7sAvmho3J7k+lFQy4RtncHuEYmS60KqfF/CGlXHdpIiadv9l05zL6rky
X-Received: by 2002:a05:6214:cb:b0:532:3b95:5186 with SMTP id f11-20020a05621400cb00b005323b955186mr40598984qvs.44.1674578895860;
        Tue, 24 Jan 2023 08:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674578895; cv=none;
        d=google.com; s=arc-20160816;
        b=m4wWAFW3nuDEv6ApqcEEnEvjsMIGLGk8uK1PG1gbz4QDnaoM7Nbvq07ITAJ2DehDCa
         1isyCYHblah83TLS8vmd25bGXEDR9s/NxGBQA3RETqivrL1JaUtw11ZgL5BuqKNW0gjQ
         XWMtvQW6TIj8uR4MWuuGmFSrO5paY8oP+Y9sBGauqHVnkYThrYrTlbg/8U99gcyouwzL
         T/ZOvl6CC/+MBTB446h4V87wll7Fb5hzBW+qpkvijI+3wVYUscTNnHg/TYULIDyJS0zX
         hP4bGOWBtGEY4fOsV+6aNTQ+vwYzDPa/LMycIcCbzzJSSp4odnLbh6sqawI0ShA47vV5
         5fkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=l5UFNlo87HYCjRuV0v9OXAtBOngBlaZT5HNlM8zZwF0=;
        b=hr5KvE0BTRgezOEsd7q2eP8mJN9QhHxuzeV0DOE9ErWXKQaMpLpKNSltOI6BMkrntu
         6SGbngdKJo2UjRBDT1xpQzhxYcz6rH2p+BKU7q+xjUTYBjAGz9pq6DSd85vsHJJPHOqh
         lRn0RdMktBSm7KONTQdOx+J1SwAXUwhM3KVE3Z8gtbrjj6G6jf81pI+gTNgCs0L8Ejs8
         0tMp9MnO6HoxjtP6zE0m+aKrtFmPW66+xiD4ZNPLF8W/VmXpeLiTfHjsCOMlIOEZRJQN
         0jmzzjL33DPKhTnVG0ZW266XEpI6Mv15pUV7oTLuEVWWF4onL3ivwu/W1l8i2dMj9TcT
         T8Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLrVGuya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw13-20020a0562140a0d00b0053534f8d1e7si1837259qvb.188.2023.01.24.08.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 08:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLrVGuya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKMSb-0001Aa-A7; Tue, 24 Jan 2023 11:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKMSS-00014F-RX
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 11:47:46 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKMSO-0000me-FE
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 11:47:40 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 k10-20020a17090a590a00b0022ba875a1a4so12194486pji.3
 for <qemu-arm@nongnu.org>; Tue, 24 Jan 2023 08:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l5UFNlo87HYCjRuV0v9OXAtBOngBlaZT5HNlM8zZwF0=;
 b=gLrVGuyaltCyCMKe1qJSROQt32Rt00/lMr7h56SHQ4SkqM1wR5EfTzar9HhiugwJnT
 0e46JZ+ptaBW8V5wQI3Ve2yrqf6unM8nxzqh43nYO5VBccitk8z5PER3m8OTJ000mQL0
 5rIT9SSyPbs97MF0+L5dSXj7lhg6N2CUHX3toPUrEAGEtzOmPuLUtQFMl/pLZO7z6GA3
 osKM8uYtWgJyMSOZcHE/+RAg0hzwtcB/QcZV+/ZPvMMoVHc/mfLP87I2GxqzrQ+ZJMQI
 bX1vcuj4qbvemFaI3ioxipFZ2CKMMSRggxahQA1bVNQQpIEkSSrXy99DbcVUKikIOQYn
 iH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5UFNlo87HYCjRuV0v9OXAtBOngBlaZT5HNlM8zZwF0=;
 b=ff4+SsVceUpZ4FG2Hd2EEnxMfLRbjaNvax8EjQBktO+EXrIbLQp5FOFQVXN/ZCID85
 1vQntMWQrz7qKmMyceM+oreGXGlhgwGV7HJNuhaQTNMk5S+UOp9kOZ78OcZzxc2Qkjgr
 0Gxicsmqk/yAYUcI95rMhWRD4UvFs4goWbmtV8mE2eeWTL8Rmv4t7pJnN+Bn66P+TvqZ
 na3fHAcI64l0ZkbxVVOxGzL1oMam6aeipPh0WJ8dBOZiELG20MFvVpL4k3MXR7CsadBR
 jxPkmeJsf+DECRf1D467qgqnQE/3DkHwMfRF5rELricdckfBKj7lnkFkCxGtov+A66aq
 NEVg==
X-Gm-Message-State: AO0yUKUyRvL2ntSfmFbbYVIHa1mC1KPo5Wuf/TpY789CedH/3c2zhvY3
 Gcg1Pg4DdlxFWERqWG3RaqwRYSyKFqHlQjNk/KrrDQ==
X-Received: by 2002:a17:90a:8a0b:b0:22b:e329:7262 with SMTP id
 w11-20020a17090a8a0b00b0022be3297262mr726866pjn.221.1674578854781; Tue, 24
 Jan 2023 08:47:34 -0800 (PST)
MIME-Version: 1.0
References: <20221223090107.98888-1-agraf@csgraf.de>
In-Reply-To: <20221223090107.98888-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2023 16:47:23 +0000
Message-ID: <CAFEAcA8Mk_E7e5dYZoC3qzm4DV2Brdqj4Of_VkaxDfe4wSV-ug@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: h9cZE+/xaYwf

On Fri, 23 Dec 2022 at 09:01, Alexander Graf <agraf@csgraf.de> wrote:
>
> The finalize_gic_version() function tries to determine which GIC version
> the current accelerator / host combination supports. During the initial
> HVF porting efforts, I didn't realize that I also had to touch this
> function. Then Zenghui brought up this function as reply to my HVF GICv3
> enablement patch - and boy it is a mess.
>
> This patch set cleans up all of the GIC finalization so that we can
> easily plug HVF in and also hopefully will have a better time extending
> it in the future. As second step, it explicitly adds HVF support and
> fails loudly for any unsupported accelerators.
>
> Alex
>
> v1 -> v2:
>
>   - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
>   - Include TCG header for tcg_enabled()
>
> v2 -> v3:
>
>   - Fix comment
>   - Flip kvm-enabled logic for host around
>
> Alexander Graf (2):
>   hw/arm/virt: Consolidate GIC finalize logic
>   hw/arm/virt: Make accels in GIC finalize logic explicit

Since AIUI these patches depend on "hvf: arm: Add support for GICv3",
would you mind including these when you respin that one (ie make
a series-of-3-patches)? That way I don't need to keep this series
on my to-review queue just because it's blocked on another patch :-)

thanks
-- PMM
