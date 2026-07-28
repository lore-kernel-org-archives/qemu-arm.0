Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA0EC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojqJ-0000tg-3H; Tue, 28 Jul 2026 11:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojq0-0000bn-7U
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:35:27 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojpx-0002DS-Vy
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:35:23 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c1c52d920b8so542720766b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252920; cv=none;
 d=google.com; s=arc-20260327;
 b=HGEJkphi+vUO3SDdZWCtuuKy2O6BdwN+uwP4G2UySdOjJ0I9i1Fm7wv34aVbBjRgu/
 8SQtckJrM0+cduVBNZ8y2Vvfj7gc1aAFV5u2SeYj7sp4H5eDQUjJ84jT+K2FmNRjD/Qg
 oAM3DiUr1pNCYJxwywSQq6zcOH0UtCAZiPEVJ+glKhjLuk7zVLuacUJhbNNtkVa+A5x3
 /F+HjHkEUP6mc7lKwicZwzN7CpPwUKKvhrp4P3yZ5EaxHcaEBno6HYgw9Vy7Wxx5XYMc
 18x/SrbtyfNYmVzqxdCQ9ENIG/urKN52Gz9lQtj5WgJEnc6eFgNARExuIYUyhm70s8//
 +nNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wmDaRjjFYiXRbYC5+ygckLhGTWH98b6KM6Tx22x/QdQ=;
 fh=j7mdMGZaVlnT7TO4XKw6bDtLQqd3tKOoWKcjqCo0v4U=;
 b=XCRM/33YlUoJe14B/7M7+FOYzZU9EhuX0GzLJx42OA7rN+7nrW88JaEXiGh6DGFjUj
 AmZAU33QhT6dAgpQSsFdcj0F9uTxQNHkr1gxnp9RSsjH4IGHhH7pzPhztm029tjqQZGj
 If0TRQyoxldEPJFehusnCq9neqNWfJNr2cs34EcYxSvesKrL2eVQqakvqU7GImtEcbAp
 0y/j4qD+mme3Dlj5HY6F9h3F/aaCJozJN8HBa2SbvxuCS7L+CjUZFOoA1QRXVfuJRydY
 pDFZrO/EBX9dRQSJW1SzXubzyTfISqSsvaMgj4FYCmVvi8vUwq1P3Ij/H7N5K7IhF2nv
 8E5Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252920; x=1785857720; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wmDaRjjFYiXRbYC5+ygckLhGTWH98b6KM6Tx22x/QdQ=;
 b=R2QRlWKnnOTDcGEQm8QGI1GGDCm/9OKKH/eJYqHpwIZd1Iw6Q/IcE+T/o03SJXqQX9
 N2DGdf9//SCiiAhpYBTwlZ/LSM6cdRemWWUEQNSx+LHFzN9DjswbbuyKeHod0aUkH5uW
 koonaLbmUPHe8O5j+/+KP5lyJWhVOV/tfc7F5zYhotdk2tuNKVMIeEjxPsn3usnBdRLG
 MgaokDYSewDKFMZTJeu8NsXh5qhAAybbAJH8HO6ns7SIUn73nhnZ14wyezRj4Nf1ElJn
 VuObpE1RMlRtrY1GIC+Ts+dlqI2fm7X3MA7ahObKbvXYNHtWkdwGEeSdkjtkbRgpwSDw
 K8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252920; x=1785857720;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wmDaRjjFYiXRbYC5+ygckLhGTWH98b6KM6Tx22x/QdQ=;
 b=JukbcwaI56Klfe93ErRFTtNQJxG144o2YPGnmY39E3poIkKrRLkzr/qnFCItm7ewpS
 zpKsgp7VEziqP+Yw0FOV0e1HKIoJfGxOJYncKLAFuo1uKxtWxronndMLWKVfS9OWT1Dd
 gkIsqppgujqTjLvRiD9Eprq1BCA1uJTwdjP1iH7pkAbuDkC6hIRxHUc9VWSkyBizKGbz
 roFNDRaTQVxb3REzlGNysEPRCa3m+7yl9ozXvvD+0ThYORObshA1sEsWSGNISmbX2Hz/
 WLoRpa1SGwZ0P1O4SCLxWzR5ZaD/cJZjDmxn+PSHGgrwxyOWQfFob58lWAceZehR4oIQ
 NrMA==
X-Forwarded-Encrypted: i=1;
 AHgh+RprwxPxSHqboFyPIVmRDR8PQQ+dZmYbClhdidPZScmRJLfz1sVKeozw2L2fs8N685pKRcnDBlb6uw==@nongnu.org
X-Gm-Message-State: AOJu0YzEaT7uw1rL/Oy8f6lNrwBJleDlnz8ru3uE6Ffq4wAkR8q5U9nC
 7R07Le3Zhq1qkJrxn6/il82qE5za8BwCHbXJ4NmhBzksXci+MsUme/wJNZ/Hsgbq4/buLc+eCb4
 40rpZZu6Pcy6Lx46lGNV7C4r+OcvA6mBM2WdtwrmtnQ==
X-Gm-Gg: AR+sD12AN8dHjFby/spw3Bc6gO0/KZyEH1CqOnDTBMceef/h2nm+SPSqiS5yMIGNuH1
 WflvZLrGP+HonAnwMVIUKIjB6sqrrKZ0v9Z50Pu0rKMonmkl+9dJpMwNU6032hezfK4M5tj4g0d
 aP64EeSSBdEap484aQtgbRmSBt0DTS06DBHH9x1aUsaPItizxRIT/bP+8b9tiyUk4ZSEsIdsr68
 bSTetcqnFCmuievKUXQk+5BcLvBUZ6qkcKiCoDszpxzZBKM+G7igdrwZXfJPJe4fv6s8C/e/6Q3
 kQ8xBQivhK9AjR13kbEtBccFr9KjxKAq/ULW+7NecoyfaQ==
X-Received: by 2002:a17:907:d1a:b0:c1f:32e4:737a with SMTP id
 a640c23a62f3a-c1f727c12b6mr149757266b.61.1785252920099; Tue, 28 Jul 2026
 08:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-13-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:35:07 +0100
X-Gm-Features: AUfX_mw3fFhXFODduhtS0TnuAOIPDjRvsytMtoskzaUdjCWnp90-Z8cmTbfFkMQ
Message-ID: <CAFEAcA_cVofohosCefxKtVQNzGN_NmL1G4c+dF5kRJ7A65Qd3A@mail.gmail.com>
Subject: Re: [PATCH 12/20] target/arm: Rename isar_feature_aa64_sve_sha3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Tue, 21 Jul 2026 at 19:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from isar_feature_aa64_sve2_sha3 to match
> the feature name: FEAT_SVE_SHA3.
>
> Reorg trans_RAX1 to use TRANS_FEAT_STREAMING_IF.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

