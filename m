Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3306072ejc;
        Mon, 16 Oct 2023 09:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDCtPfojgPpkDVwunmgsR60ZHP0MK+Y+zL8s4/LPGrEairNG3Qz6ToE4wNrvShxcLUS0Lo
X-Received: by 2002:a0c:eccf:0:b0:65b:a66:3109 with SMTP id o15-20020a0ceccf000000b0065b0a663109mr39109311qvq.8.1697473895651;
        Mon, 16 Oct 2023 09:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697473895; cv=none;
        d=google.com; s=arc-20160816;
        b=lww1bTjRzU6iiQyZGPnOREaKFENGC+fZebn+lXwbheYAH1MuMSRgWCXkRBaIkBPtcf
         hyoz908wmlfZFRTrxMM+UwCPnt3WhFMqQHopJMtk0TAovNcH1oKzWFzXcmHDCpa/Wo+f
         O0nOjANc4dXaUIhCc/O6RD5pz/BUwl9+IshzovKtiA2fhjBBZFAB8l1ldAHj3bVl3CZX
         olWhRO0hgzX8Jd0p+nNU3B7QX/8Lj1tojlwoH1D96TDuYKYsU2br+rkqg9K8w88ZW9DD
         eOBouip/M2RawrSwXNcNdB226bzG1FuoPy+rwWQ3Uaz4tIall4W5ou29LgpzpBBsAkK1
         bBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UDbIkGIte7+LhCbpOIpk2uv96+Iwg/JEeOro0vOBeXw=;
        fh=j/v/ufwsVFWAxDisQ+bUJlpLZ9J2BcNZvMYjnEqO56I=;
        b=WFSbYK6p7nkNswX1wuNhozEPkxO7lDyeP0QGh8ZrpsAuU21yEZJdBzAedcxck5c1Y0
         zxCebtuu+qQjB+tLsoabflCX8gNxwpAqEHZHgQj4UiW+A4MPcVMhbIvKHsb0fdlNrqxt
         aW8uA96peDZUEVpYH4sdA/a8wWeci33/ZONsA7qsaH4758dmp1xiaznWtvElVBGA4e/J
         nGXq0hL7VLkV85ghaTnwPVBWYO4Hok82VHFqCRDoYkrfqqnO+lsbR8ljb4alliP4CjQL
         gFYak89Vc2jvKU8DQZ8qSS9cmNg70zGqSHwcklv3Mp9Dh4wm7gN91FMNISEJFRRpkdHN
         lEew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vspPJqDE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo15-20020ad45f0f000000b0065afc652036si44191qvb.71.2023.10.16.09.31.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 09:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vspPJqDE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsQUz-0004H1-WE; Mon, 16 Oct 2023 12:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQUw-0004G4-BY
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:31:20 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQUu-0001RS-9U
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:31:17 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5384975e34cso8493878a12.0
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697473875; x=1698078675; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UDbIkGIte7+LhCbpOIpk2uv96+Iwg/JEeOro0vOBeXw=;
 b=vspPJqDEtzK5fvh/PKMa1skGt+c+4mtk0/NY17Q18GHBFDiHgBzN20sSFSqT9otDAD
 k1VBHx1/gSsUjm6XMYkb4+qU4TyInFacSJL33QuZssEWQiYCyH2zmPgqxo295Cszl0W4
 6VwYDlyPuHmBLqHOIQfbKALUA623iSwBRlLemDPSP/tMI8HPxOe9IVWgWnNjULj0wAx9
 8spr1xv2bevlPqbe1FF3Y6zjM7fx7xR91U28LNEEogPbygZaGb0OfPvkXT2mPUQrdfsZ
 +G8Ua8TlAd7bWRrg60p1eaVIIKqbbhj14oG3ohyMNM6r4l/ncvmBTF59UTc5c0RUu+zu
 b3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473875; x=1698078675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UDbIkGIte7+LhCbpOIpk2uv96+Iwg/JEeOro0vOBeXw=;
 b=Wkp1lYL4A4G8PGAXRYCi0D5PfNe8+wNlFjZNON19dJz37QQ7cUZCt56ekNe/NCmnzU
 +s54/o85M7RfCuqULmeLP9aUuCucCE0S9pvxmT6VuZgwqebYfBoPzv7My6mFDFx603AR
 qKdC7TKuFRHzJRQUdUdOrM1TdQgBjt8YRRepdPx29xT2sMp1iSeSowvdwC+zuttazW34
 PxSbyHBnpV9cngu7q1eJXMYq5F3dtGDTUE6ReY/L7aV/3EMOnZFJ+HSDJuO7oax9iPy0
 FuvDCZy9z1i7DW+vVaxhwM3JTbkM9N1M6wg2rZ5IbYBCraW+u/mA0MC/WjhEDBbp7BGO
 jAKA==
X-Gm-Message-State: AOJu0YzWpMBRVVkMnjeheSsboIgJfoAHaLXRXXuv0hQ/yLpBDXBtybwy
 aeP+yCLPHgjpluG1nBQd05/MTxJJQpB93g9kx4PUpQ==
X-Received: by 2002:a05:6402:5008:b0:53d:ef29:19e8 with SMTP id
 p8-20020a056402500800b0053def2919e8mr13245468eda.12.1697473874862; Mon, 16
 Oct 2023 09:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231004055339.323833-1-tong.ho@amd.com>
In-Reply-To: <20231004055339.323833-1-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:31:04 +0100
Message-ID: <CAFEAcA8-6f7f3Ai3uahz9F06rZC1Ad-OrQGTsWo5H0oLNiXKTg@mail.gmail.com>
Subject: Re: [PATCH] xlnx-versal-efuse: hw/nvram: Remove deprecated device
 reset
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /ZYrq0UfDpus

On Wed, 4 Oct 2023 at 06:53, Tong Ho <tong.ho@amd.com> wrote:
>
> This change implements the ResettableClass interface for the device.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---
>  hw/nvram/xlnx-versal-efuse-ctrl.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
