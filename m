Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp362401ejb;
        Thu, 5 Jan 2023 06:52:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtOA4QotaI8V6/dhxE7sCqxISuX6jRLAEU1zjfB5O9d9tN0fI6JnS33keic5MY3rwELo3B9
X-Received: by 2002:a05:622a:488a:b0:3a5:c553:fa4c with SMTP id fc10-20020a05622a488a00b003a5c553fa4cmr82431511qtb.65.1672930334698;
        Thu, 05 Jan 2023 06:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672930334; cv=none;
        d=google.com; s=arc-20160816;
        b=vCx77V+SDBlEqPVJdS93oQRnH2WJwQB1yHa+DdHb/Tb/LPDbyFtkMJRROJYKGA4kGR
         iMYE4zd028hk1Ksm1R3aPeT/kxRVoJhDPr8KTSbMqnmBYcAryHZc/mHkc1EhCabDuGfn
         LMdPLFy9VIvp+RK93ZZ5Mdq7MmL5EqupxvC+EgMrkNsC3Y3dhJMTbP5vm8kLyPZm72n4
         akny/xXKdeMwxfEck0qxRDLa3RH4P9NbaLos7X2Iy1eKmkemjCakV2Qt/XjwJfScOo6m
         I3vkdV8inIcZaqktaZLv4NW/M6xBQ2fX+ug0BUF32z/aiG2HpGLhJa8WLuokakYaR+j4
         OfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FEarg2VHJ+R5bcoqyqDmFAEa9tpdqelS+4OgQZRQ0CM=;
        b=tOBkVKPslZyPuyWb1GCd8iaW562hvo0TQqgPMeJBubZdXyulD05qFTvMRTduMrKfro
         A9AhrzHAzF2euZ0qC+co3Bw9qOYq6I2vA3fyBPYciKn3Sftl+qFbRC/cHJ2kolXwhBWm
         caZREAy8kwp1IIrTTxI33QGsHl/DRJ1oOIcKBVbAYS10kWtog2F+lsPHVzCiXWGLa5JO
         uOwyGhHvWUevpWMQYdyaTHx0rD5iINyuM7cumdxD59CQO2AmDNOwD9MGRS2NIzaCrh7l
         u7ZaSigoaw4juzqVFOdhQctcnfGQpN6IZYBNVlITZOxZE12W6H0uDR51t3m9ksPVH1JN
         7IMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PdTrxdbI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb9-20020a05622a1b0900b003a7fd832135si19618794qtb.316.2023.01.05.06.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 06:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PdTrxdbI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRb8-0004xi-Qe; Thu, 05 Jan 2023 09:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRb6-0004xH-UW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:52:00 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRb5-00089c-DF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:52:00 -0500
Received: by mail-pg1-x52d.google.com with SMTP id d10so24636887pgm.13
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 06:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FEarg2VHJ+R5bcoqyqDmFAEa9tpdqelS+4OgQZRQ0CM=;
 b=PdTrxdbIm86LOlyBh39Q1wIY6BMLKa3mW+xc+ZYF+VrYjm7pTOn+0VkKbDdk8c0jO8
 dn93O2ejFzIcq32d6Ejjctoik3oRmaQc2nIGBNiLJrEBl+6oeDBQok9ZRHMiwdmIeN/P
 QgrAji/KblKsITh7T/li9tfVhDhsHPtpUnUrmjGVr9CX6tAGumAy1cseX4En0ei1ilGg
 yAH9U7iapg0YmzYooOQbYWP0ec/7xUmOk+hL6vEzeKpQWgwNXG02deTE0WOlrxU1Wuzm
 begGJW1qlyfrMrDrjgLJhqDUCUilN/c8VDVmZTGJL2zsD4i9wyNbixk1EiObCp6goMUN
 45og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FEarg2VHJ+R5bcoqyqDmFAEa9tpdqelS+4OgQZRQ0CM=;
 b=uIxMH7GlysZfQLeNnq7bI4V6tENz+wNP4v6n2fECP5/G82U/oPbwq6lJPD4YadWQcz
 Xc/26hsWN0yZlC3Vb/P4v7Hzd01iLP/jpx1CSaRZHcPTMYJWdLICmkydpO6BJ2iR+wML
 PyAmjwdB75oY6NeE4vmpywM2Ir8gGbWHSdExyckBdspk46xhiIx1+XJ7/fq8rGPJ+htM
 qtO4R/Ok7mReOsFGek9OtukIhIPfFWzYlAzvmctyxcB1uLS83KmHIHQFSXHtOpHqvlfe
 1AKFNzGTZ0YSDmCLTvUQoGEGiMIOmmBuHl7NaIHLkyLdbuRbmvCwUz8K0k17l4EbBazm
 R0RA==
X-Gm-Message-State: AFqh2koDspgPNo4hpeNH0A4jYfXW+MADXkerLVlPM+jtAo5W9z6buQZ3
 XDppjPhIcda5iORYdY9BRVT0VBK3GU6n9bhDDZlMGw==
X-Received: by 2002:a62:3245:0:b0:582:a212:d922 with SMTP id
 y66-20020a623245000000b00582a212d922mr768138pfy.3.1672930316689; Thu, 05 Jan
 2023 06:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20221216214924.4711-1-philmd@linaro.org>
In-Reply-To: <20221216214924.4711-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 14:51:45 +0000
Message-ID: <CAFEAcA8Ks6ukN4ihQEG+wt4yMVh6-D0+NySKZoQ0qMQ7simjQQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/smmu-common: Avoid using inlined functions
 with external linkage
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WYj4kqQNgMg8

On Fri, 16 Dec 2022 at 21:49, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Avoid inlined functions with external linkage,
> convert 'inline' header to 'static inline' in source.
>
> Supersedes: <20221208161152.28976-1-philmd@linaro.org>
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr() scope
>   hw/arm/smmu-common: Avoid using inlined functions with external
>     linkage



Applied to target-arm.next, thanks.

-- PMM
