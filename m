Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91ECCAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 15:42:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1o6c-0003rw-PC; Thu, 25 Sep 2025 11:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1o6X-0003qy-7W
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 11:41:57 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1o6P-0004rZ-7V
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 11:41:56 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-71d6051afbfso11051317b3.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758814903; x=1759419703; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tvWNGS/s1fVPZX1n0yonShFn4S8GuldVD8xSrjMnvXA=;
 b=PCGDmdQY68SJ27UXQRuhWjnyfiDHEa/oeiuiWfjJly2Tvlt0hPkC0UEXI+K7tsk8El
 4XeqNxzTNAW8YqwjMIqHve/wLieAbdvrQ/LKLruop89wCxYj4ycH8EgBTAQ5lS32WkGx
 e5lEU0YUHBXwaoKnMFkJEwHTViWCfWUPuWf7oRH7Qd8gHw1aOyBr/+V4weVbn7IqWbJV
 4Zpkt4x1VGqx5r6JtAQZfbtD1ta93fTO7DnSbzy7dI0Qb0Uf6EZ4XY+ABksrF6RgpFaU
 BZWPcOAEG7QQhuSMMiqTQEJnRym3EQalAsWMtR24LCUP1TLdWJhbWV2q18nEFMbt6M8H
 qM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758814903; x=1759419703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tvWNGS/s1fVPZX1n0yonShFn4S8GuldVD8xSrjMnvXA=;
 b=qfDIe+Bn46fE0fCwva4lp+8OGIFnGIQhjrO81Iey/DX2G+R29oIyETSMYXDb9n1nSE
 EjOSmwn7BtCHP8hDL7J379X/7bWykAU5GbQMicjE/iH3CvwcYc61ot1u1/B/lko8g6yj
 SzPayT/yAUN39j+nzlfXVf40aD/n2S08MpedgLAomXthxup8kVVRaGQG2Y+OAEUZiZoZ
 b/rqx4R8lLVN2XdAy0sPmLVWuU7FjjUy9drdO1xA85npru4svtL0kW9UWxjG1iPkacu7
 G+/iUJKDQtVVsfavxaFzqyCtGQ9/djXZ7GSzk4CNTz7rvWkMFxJmf0QtiuSXxqejurQl
 PZDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1jbdcqd8Qs7XQuhC0bHmZLuFPjfxy31Lgf6guI9ObKNjEQQ6VKrFm4Ytw9zSAolTPZ0nEREDgyw==@nongnu.org
X-Gm-Message-State: AOJu0YzuBHTDIaDjuMS4Dju+RFOvB59BDDGnhSGOFdFq7Av1gOOFWnGV
 pne5N1U1q6t7NAM/bGETd1+Cxb7ExCKT1mayxiOFxtF5qVmhyv7fmsnEqfR/cfa5YSCpOL8qXj6
 88DJJtv3fQ4Q/DEqwvOIVlIFzdTZH/S9ZSBJAPWUAqw==
X-Gm-Gg: ASbGncvDOaQni7b2qr8rB+/9Rf6NCUKmj7qokGLVp6g6UnaO+c7HWbaifniYljfHeSl
 6BVKEVC1hzdJLq+oporYEx8ZS2n1BwsVvRpYQmkjyD4iSX9uIjnr9W0IqxT5KHWp9yRqszlnuu7
 XdFaG9hX9M7ZaJkilqCmKVfni4xXylMNRLiz07bQ3iGS9vCMAVWiq4e6Whlh9aysg99mmQBHABF
 5Un6RD7
X-Google-Smtp-Source: AGHT+IGQcqi0MAvuzXquRKNN/MWKhEkZH94Bwp4Cj+quYa5IRywgMje0wToF4sMTybgKTrqUd9jPdGEPsntsj2Agns4=
X-Received: by 2002:a25:e087:0:b0:eb2:5e5c:1740 with SMTP id
 3f1490d57ef6-eb37fceb9ddmr2704333276.52.1758814903275; Thu, 25 Sep 2025
 08:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250912100059.103997-1-luc.michel@amd.com>
In-Reply-To: <20250912100059.103997-1-luc.michel@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 16:41:31 +0100
X-Gm-Features: AS18NWA8rFWinkLk4XjFqxDDBdBdJ78U74wgBPBwGapGRHSAMW6t8p3ZQ1kF2wU
Message-ID: <CAFEAcA8L-9hMZdMgvJLottXFs=ys9uNhmQk-3GFR6QtqahU9pg@mail.gmail.com>
Subject: Re: [PATCH v5 00/47] AMD Versal Gen 2 support
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 12 Sept 2025 at 11:01, Luc Michel <luc.michel@amd.com> wrote:
>
> v5:
>   - Patch 36 (xlnx-versal-crl versal2 version): replaced `return NULL'
>     with a `g_assert_not_reached()' in the versal2_decode_periph_rst
>     function. [Phil]
>   - Fixed remaining memory leaks in the Versal SoC by adding a finalize
>     function. [Peter]
>   - Patch 39 (cortex-a78ae addition):
>      - Switched to the last r0p3 revision.
>      - Removed the CBAR_RO and BACKCOMPAT_CNTFRQ features.
>      - Fixed the comments referring to TRM sections. [Peter]

Edgar: are you still reviewing this series? (I noticed you'd
left comments on patches 1-4 so wasn't sure if you were
intending to continue, or if you're done now.)

thanks
-- PMM

