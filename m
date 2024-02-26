Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2160974ejf;
        Mon, 26 Feb 2024 08:25:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnvPs1Y9NuO6t8ajWAwk5cyfKoX2b/3v7qiy0XKc5ycu8crzniJ6dNcBLBv7UwUxpDGNmyI6bZlbYshhJiCc6Q73Ck7beO
X-Google-Smtp-Source: AGHT+IFLaOulvryzIzMA29whsY3zL3JJ+ifn4t7LAG5JlCxCyqoJ2fEoeziBRjJpKn4Xc7f9pjCf
X-Received: by 2002:a9d:7e91:0:b0:6e4:a310:b593 with SMTP id m17-20020a9d7e91000000b006e4a310b593mr1956401otp.16.1708964707431;
        Mon, 26 Feb 2024 08:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964707; cv=none;
        d=google.com; s=arc-20160816;
        b=UsYEiKaCdncD9GU5FS/13kgezy43CwXJoOllioSxCyYt4yPho2zMi5ivQnRVELJi5Y
         BDhmxbe/1uXXm6putGjFCztzsWroPrbQjsMwcPdHH1/+izwsJK4dfJx8M4gTohbypirg
         GIto2XvVl6uRp0oAWe40XRVYFSPAB/Lk1lI2oEKW9O2lObGqEwFGEOup03ArTn0eJhgQ
         45Cgp2BCYvAfJ3pmZ7nNbZ2oTqjm6YeNE7/shVtQuwi2X2qLamluk6ejpaEVa1laeoxy
         oZQxOSDemvNoPxohBxv+x9CSy56fFeGtBHL9fHTlG8zZSD/Rd1jdm2Hb9Tu1zwBMw3qQ
         e5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QWK/x+n65Ya6ddEAD/ARo1Y0xXgsCF/MLY528U2ZJak=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=sN1Da7tEDu5XsDxaN1mfrd6WRdcwCh4oE7kb3QmQD1KzefygI1bjOJlfsFAemlLrUG
         7/SuocjC45+hVRC5fb55lPd7RG1G057+MdNnyx/FaxaTpsbPo7Spi3QAgJP7pxUCfkyT
         GoflwabzCXaDc1CyKgOsz3IOlcGMoUa9t7Ff6sMrb/Tsx+9MlgezgmIvgrImshmccPaI
         VMBcA9c8YvTBCkf2152d6I5rAyDKkcRcAwMV5aPPGAjaJ8CAL7IgDafLYryVNOVvBPJi
         QgZBm+ov5E8JHA1E2yJ/SMEQtx2OiqXuDGCHT4klCamz5fG9dm7RuYPYU/TvZZoQN4Ev
         qxFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTrsY1CS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020ac85d15000000b0042e7e274203si3674284qtx.21.2024.02.26.08.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTrsY1CS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redmn-000499-EF; Mon, 26 Feb 2024 11:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redmj-00044Q-R7
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:24:59 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redmf-0001IR-E0
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:24:57 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so4760101a12.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964692; x=1709569492; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QWK/x+n65Ya6ddEAD/ARo1Y0xXgsCF/MLY528U2ZJak=;
 b=fTrsY1CSNAv8NmP/n8mcNc/pKfZxyd7c7FzjVhrnQVRryp8T3c5frZ2k6o3tMxVFTf
 MkMmsbbHIoETEcAzQXlAYrUPs2m4g1crJehI+DSp5F9j6bUPgR+59/Kg15X7EJrOvzVk
 WFlQQvj4ND3Trl7AfJGt9DmQxluqVMICxfo1neDuHCP+twGmSM5vuXrJl6VSfbk6a3tR
 5H7OTiRJ3n7XcwSS5hs51MJzp4n7UKjLUrmyYOo7ss9xTzaKTMfTFJVnaMXz+BJ4WwZ4
 COmhSu4Nq8HHHRcr9kzFAtrxc9sJmQaku6e0f0BMfIHVJdd0Ov3q5MlR9yC0nT5YADI8
 8BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964692; x=1709569492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QWK/x+n65Ya6ddEAD/ARo1Y0xXgsCF/MLY528U2ZJak=;
 b=OsoVCM0OyxnzoF9YiSEuOA9XG8UzqBYWE2BjWD8zMxqKb1L+gyNSRb4s46R+2N3ERM
 dohiikiCU+8HMH4JQuTG6dNysBa4zvoqJD3lKzD4pdWSw/cp4bO4Ndn3j+NShpDtc6vC
 OCZj6F1lu0mVf86pNjjYevNFh3+s5P8eAeH3pWEsnUTcCX2r8wAiNbO+zsKaxxS7TFns
 opxNeV/TpCV5UmLauIDCYWx/W/g6GANY3S8FJ+zywa84+DVpewoTHrTqEtul6fy+jpe9
 2Dgd09qMfsy63CPAmcXGc6DQ1xzJb36wPExPJ4EBEElUs4HtYHr2GJ/02G6dxp1d2/qS
 hEhQ==
X-Gm-Message-State: AOJu0Yz/oOz1VZ1HiWcnuYBXuGpD6FHc4OnAklYqYzQG63boQ1mFyseO
 D/rfKrpRVhccQyaN/aQzjCE2uiZtKGhmFXS+wDVOgPQLd8Fxf1sSloIceSbRnTaROAOG5xzhXK7
 8ksBm1p4uK82R4SnSdTNNQFvtHjyaco0yL+Y9NTxarH6xEoLu
X-Received: by 2002:aa7:c419:0:b0:565:a000:ec93 with SMTP id
 j25-20020aa7c419000000b00565a000ec93mr4073136edq.20.1708964691933; Mon, 26
 Feb 2024 08:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-38-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-38-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:24:41 +0000
Message-ID: <CAFEAcA8WkH6092rugK_30O7o9fkiqX=TeHw6TJ3T=5AfG8A9yg@mail.gmail.com>
Subject: Re: [PATCH v6 37/41] Add mailbox property tests. Part 2
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: LGaisRnawMoh

On Mon, 26 Feb 2024 at 00:07, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mbox-property-test.c | 196 ++++++++++++++++++++++-
>  1 file changed, 195 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
