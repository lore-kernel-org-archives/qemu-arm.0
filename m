Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE03EC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 08:49:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjCMC-0000l1-31; Mon, 13 Jul 2026 04:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCMA-0000kl-QE
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:49:42 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCM9-0003ht-Dn
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:49:42 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-6611669cd16so3774114d50.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 01:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783932580; cv=none;
 d=google.com; s=arc-20260327;
 b=UbCY8E/4FUfVHr6BwE2ZOha9y+OUz8R02uZL/5v6tdAzD9nSo7GybKhRK64SEWClHx
 nu6SIXQ4QAp7FIpDgMghyRw6WWiJZx2wYfc9A6OpudPy+yHkadg8HiSpMrLVhStQ4xHG
 Tdejf3f5CHSEv5QRjCfnbyr8ozAO3AhYQocePJbTrQD4dqgE8rDzxm/Ck7sKjDjRBlMt
 wCi7JNkOrgmCWOA4dD/Y6qm2OFKK078ZH/BAM3zbBZlzuevgStXI+h+xZsixArE/4dmI
 4Dt5nNnkj2YVI3YXjslDumQq+GOphn7FF4w3519aG9avQ3UY8pz+fw2DGGDA4ilPVAVX
 AmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=M/8W/JUMsMobF5NRloR2RDhN7mm5htf1q6nP/rPjY68=;
 fh=4MwjRwZjHfz5FFiQxrGhswnCSuJcibDgfqHPG1vaKiI=;
 b=FIvFm5eAHrF2Y1ykH/X4V8vPlx8TUGbTcuUBBekUig4vopbBu5rq1WA845CNW9GSZ9
 VH0WfoEPHPtxwAZnIV62GNihhj4fHbFFWYb442k3lfh28i5w/NUMb/e+ZK4rLHBNuv0N
 ZhAfj3eWQRC/yNNBZ6+1EiPvpH1pFD5ntz8YAcBsF+Q9KvfgpZ76DflOyw5vDLJkmEei
 0Qmg0FPidWIi5Jxu+4QtW0S5C1Tvis1Uzl+O/jjxfFdsMdDhn+3ld8am8VJlf9071Odp
 nZvfLZGgnsLcZsHQHCE+GtbHO50gzqbPSPWouM2kYYhESiwqb7br8E4UVrHPHXBS4cJa
 avuQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783932580; x=1784537380; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=M/8W/JUMsMobF5NRloR2RDhN7mm5htf1q6nP/rPjY68=;
 b=fmL74Yqm4AeEnvmLTop42YzC5N5c7S03D/4QZXXzDPEV0EMPVdHKHXuk2RKddeAKJD
 nmKyWL/2nBo149aFdTEKdLVmrpo4ig+KQZBf2uAU058PCmncktHmYkB9nRU12SE0XJR9
 ojE1rYKl1N1C5OqTb/4otUDmIJpTcbZd9KvMPrddy1VNPtxNbHdFVb3q2p18uk/DKuec
 NWzaAA42ILoXfzSTumP8G55XN2Tni7dXvpFd0yt/WWRwNlt5f4fMuZ3nTtR0joBShg+y
 sONIQlwi/3AHn+4+Un9rQgb176U/tWvU9GEgDXPPRNiqbj28GUSub+xYgoxFTeHxiaMU
 aF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783932580; x=1784537380;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=M/8W/JUMsMobF5NRloR2RDhN7mm5htf1q6nP/rPjY68=;
 b=WjzlsWnTLMiUVZgoWPzoGfP7KZSdT/oL/+1xnR0Q6OeKpwKI6spSU9v3QyHEgAldsk
 cDr1smdectFdse2YjygyMMTjPKeoCA0JnoRUr6gqhG4TNpQSFeE87MQLMHAGe0BhWWga
 uK8cc7SoMjNnDuly0EMOZoC3vxtBmpxyvOX8xzxbRNA5KZNmAeXwVDizy9QNMlZYjiD5
 b3/t9VKdFBIY/xuKTBGe0pzIa7TCPl7nLOfpDWbL+JC42c7Ju/TiMXSNn8gSs0I0RyZC
 ZuU3xrCYNl+5yKBQZRQHIYAs3p8telBU4YF8Rvo5FFkjQn+7+lAZmM29kpZi2wDZQUdM
 b8xQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrNrEhq5ZYVTibDBXZ5Amzpqd/bDDtASpUJR5m7k8fJNjHouSKfGiEZcVRKhj0XcFO8J0txnpnf7A==@nongnu.org
X-Gm-Message-State: AOJu0Yyut1uqRmNALlPnOlK1U1KVkWUfUrMspEutDxLQ8THoNDvGTijT
 u8MezmO1SuurXXF3Ay2/DwMhH/NUiaiAAm471AkW0TXIUO34FOkxCZ9o2nUs8EFGkjxAxFIz1gH
 m53bWOMCjzNvMedlQyO6criAxCMagsweRbj0R5UrjBw==
X-Gm-Gg: AfdE7cmwoizoD12BjAF8goMBY/dKECZn0wFteGzoubhu15KJGgFKtnAEp0QvxVSLMe5
 AQSjBTUg0uBGhvJlhQ7fiZ0KNz3Ao2cNcOpawXhNtVqWoNGcjk7snpYVXX3wIAO3fcIzOAK8HJP
 qCx9zR2qDMc1OKri1AFhqY+3LH0KhjpgL7MSne88u7pp19NJQOiHTwO8tGhUkJ66akTfQbA+Bjd
 F0eD7prmwYLVDkkMwy78b5rRgVVQXSDW/n5M032bhWKodMlmG43o27XhLg4S+dX1xeCi1a+8l1U
 M0Bmi1lpBtCPU7XdmxfybUWDiBMRPZQp/cxtthIOgjDKx/8oWbZrwWyq
X-Received: by 2002:a05:690e:13cc:b0:667:e412:6ad8 with SMTP id
 956f58d0204a3-667e4127ef0mr3630485d50.21.1783932579865; Mon, 13 Jul 2026
 01:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260708145841.3032079-1-alex.bennee@linaro.org>
In-Reply-To: <20260708145841.3032079-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 09:49:28 +0100
X-Gm-Features: AVVi8Cf0t1dxuKJ8UMjkrJXcAevWTHy-6yn8Qf0UtlRnJcXCbMwTbFD1h2erv-k
Message-ID: <CAFEAcA-yyCYS5VDWf9z=iHPv3pQ29JO0vdFmjMew3TvBQEhK3g@mail.gmail.com>
Subject: Re: [PATCH 0/8] More Arm FEAT_FOO documentation updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Wed, 8 Jul 2026 at 15:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> While reviewing the latest Arm ARM (M.c) I found a few more feature
> names that have been added for old existing features or we forgot to
> update in our emulation list.
>
> These are all documentation updates so should be good for merging
> during softfreeze.
>
> Alex.
>



Applied to target-arm.next, thanks.

-- PMM

