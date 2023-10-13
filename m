Received: by 2002:a05:7022:2383:b0:6d:30c6:dd9e with SMTP id bz3csp1162013dlb;
        Fri, 13 Oct 2023 01:32:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb5BLR2Rr+6yU+eXym+9uRCnXHTa84HsNgpaIr2dBSjUgZGeeTaV5WHqRMo6t10r3rfmAP
X-Received: by 2002:a0c:eb07:0:b0:64f:3795:c10 with SMTP id j7-20020a0ceb07000000b0064f37950c10mr24258993qvp.10.1697185942425;
        Fri, 13 Oct 2023 01:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697185942; cv=none;
        d=google.com; s=arc-20160816;
        b=g3P96gYYTOH60LKfvLawMF0QnFFGbWKFnRDNrhGkC+N5g95BnXc7NAl6LKRz2IFJ/c
         Av+pTBsX7GlBtFWLTrbWmX4RNBVeUcD9hLmZA+qFIOVyeGmrpRrMBZKbaR2Nb2/NOER7
         uDwWb+FEZHYszoBZDV0O5duGn9zUTsU6kJ9m9wZtKQxz/Xrlx0F4+CMCCW+OF1GoqU4b
         1lGazXYmVGOqhfymYexAB2W3cJ05ygITO7XiycOk8nhtmmRXJMNXDpOi3pDldIwV3yji
         9c8qRH+k2SRVbw16Y5NR6WlBsiWK0263oK9hZG8ZyHD7wiBct8ovumHPeYuNcvVTYFtL
         xi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aJrOVDaZRMEvY7AVofKMbtOS95sXplJmJD0aoNJu15A=;
        fh=qdApGPxfdsITnJe1/SYlKx7BLZ3aE/AHbq+lRxD01E4=;
        b=rVIMQGT5tB0aajl8Nii7DPptkUqdkUPbZda5vg7HMgrBaGkUUmcmP1ngV6xWRm+GXv
         QT7wI6mkKhlEc7gbcvWZhIzO9Rg9N9tnqy1Ry4vvQ5WR/B/gWd+grjuYJ79lMFw37bRu
         UibdcqfHKABpje6W9lVg79EnfCyG+vCdbKztM1bzkpCPND5kqkzX1hq2fjWV6QpFerPU
         pTkZ4MFwA9eEEXdduySJpmbK2vx1KCWltB3fXglXqr96xg0NNnTr+YM4BsmYmsMlK7Ik
         BPSZRLpdA7SF2v9i5i+uNXNnokH5zrgHse9h81r/HRdlRTuwzDr0GCpXh/3VnByljUIY
         D9GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fXhFnoUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20-20020a0ce394000000b0066d23618499si851744qvl.8.2023.10.13.01.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fXhFnoUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrDaW-0001DY-Df; Fri, 13 Oct 2023 04:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDaR-0000kE-Lo
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:32:02 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDaQ-0006YZ-5A
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:31:59 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so304827066b.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697185916; x=1697790716; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJrOVDaZRMEvY7AVofKMbtOS95sXplJmJD0aoNJu15A=;
 b=fXhFnoUz0o2e5U4sGwMikac5ve5pM+wvcoiNAbybqvTiUoh4eWw4n7BbBYES9x55Xt
 zsJu4UF7dPfycWHLVPkl40lZZsxbss8/qG5mjHydukZFW5HeuhHA02KD/aW8TnYDaXhC
 v7dYWloPQ/KD1UNMNpKwelDXhm/mfn5WhspdkMCaeL/o9WTxYLYodYJ9dV4B05Rl8fpT
 o3s3h2ncE80gRI1DAyPm1Vm/2EUzIRBkPgODE+v2uq6IHvc3zIuRs7UnYrUoaQEXojat
 GCJ746J9+BKLZgpjOkVGeiPjKPRUMcmh2oqYz1tn3s2sZGQSOfJbOgexj6dX0m+ykFbC
 10Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697185916; x=1697790716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJrOVDaZRMEvY7AVofKMbtOS95sXplJmJD0aoNJu15A=;
 b=Zq3iKHUGqV9bMYncrcTUufF3NqyMx9xZxCxPCbiK+ZnZOWWcCEF8F6UdqQpU95BxqH
 OlqiyDSmGIzqAAHt/nuJWa/3zARXciwFsZSmZQVziIp50c3jXVGD/lINbaJdoyNuaX2D
 ufq9QclMBsVgthCaNY+4RCD6CGgoW0h00libBimRDqikSA7/A8sdNfPoTnNbjZLtt9ZB
 AQxeBjaNtBkwvUKMoIYDvu4JJ+hk9sjgGzOxT7tKMzZPnjrXHioPjfCc0Lrd/N3Jwj1D
 2tNPluPTJKkYQxZyBDvu8gLwqnnja1C9kBMkka/DSagkftm1d+KTHLVoIff7dpAOviYq
 ypaA==
X-Gm-Message-State: AOJu0YzuD8VzTsLAyG8c0n/EY8ll4rbc/403f9/2zbbEqimo3eSyVsaO
 nldg0c+Ljj3499AKr/ekxviO59IP8pCzbAfTrWVdRw==
X-Received: by 2002:a17:906:5381:b0:9ba:321b:80e1 with SMTP id
 g1-20020a170906538100b009ba321b80e1mr10193633ejo.0.1697185916235; Fri, 13 Oct
 2023 01:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <2e08cff874b2f9fc4143bdcde87ebba9b70b356c.1697183082.git.manos.pitsidianakis@linaro.org>
 <ZSj860T0LVIAzQgs@redhat.com>
In-Reply-To: <ZSj860T0LVIAzQgs@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 13 Oct 2023 11:31:40 +0300
Message-ID: <CAAjaMXYaOQVT0nnky7wy4RUxBt18-e_CSog4g=pTPFDYM0ux1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 01/78] include/qemu/compiler.h: replace
 QEMU_FALLTHROUGH with fallthrough
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: G9isIkFrQRET

On Fri, 13 Oct 2023 at 11:16, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> This patch (and all the others in the series) have a ridiculously
> large context either side of the change. It makes this horrible
> to review as it requires wading through pages of pre-existing code
> trying to spot the change.
>
> Please send patches with the default git context lines setting.

Many thanks Daniel, I had not noticed at all. Somehow that option
slipped through...

Will reroll the patch series.
