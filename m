Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B59FCD4851
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:04:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnWG-0006rc-NK; Fri, 15 May 2026 04:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnWC-0006qO-R4
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:03:37 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnWB-0001K5-Ag
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:03:36 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-651b4d09141so1455209d50.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778832214; cv=none;
 d=google.com; s=arc-20240605;
 b=loCasrKkPgdMKo6UZqbKKqPMYtU5GsplvDc4vWLcuc6F+1GBYvwGDfk/skegnKBBHR
 0DHrSDYesULwyOPjzWMcwSp+WepENbPmn+GIaIjgkCssWWfrKiJzI/ozWHoADp7lIJG1
 KE9iJY7cn/1Kk/+Zhz0fzTv0XoQYPoeDxLyzIlZ4xIb5CdondvxGEH2Zc/vElFSSczX7
 JctPiCIdIMJKF8wQbSl3yYj9tRXpXsWgSZHVcz+aTph0rinQIy0RFc55knU2aiIiLZ4Y
 T5xBxb3FRG5YNcOnaIa1kjLQy+ajrE+B8SmD7ULdjPvt4GMgERiKmUbawsxb+e2NYJq3
 heew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SCOyY7KDaMTThO3yLBJAEUbRwbm8BDSIF39YqyrR2Qo=;
 fh=szV9ueHHpfDKA+H06WiyBCFdQDzNC7EMJlOpzek7KtM=;
 b=kvokKOcEhUUxAvCSc5OFFcbEsL74Ar6c/a3yVi+GM+h5xSvS1mZTZK+qrnmfgIGJmD
 w2dTEwg1aDY9x+WJALHdTnM5a5ljBSu2IyV+elJdjdKLnwNhotxCrt6sFTS9XDfBvjfb
 nPo1oLrL0/+4RAQ36olrAwwSi8YrIHay0ORAlOcoQYqj/5HRWuY3UIDj5hxuoyMe4Ne+
 yabOANGxD+7gbUidL8acuwLgsoSSqYFkDT930T1d/R66wvPLOQGN3vQhfLG+uCJzo2r/
 FUgNvzUXDQnYNu8I1ATG8paRnfy/sm6WmKprhw9Gcc71HsQZj8s1jT8xZH8/BnisWkvo
 ivSA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778832214; x=1779437014; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCOyY7KDaMTThO3yLBJAEUbRwbm8BDSIF39YqyrR2Qo=;
 b=OD7QfoFkqwYTZx4cumwTTgeZ4aswjC7+3arD4OYkNk3FnUG5HRH8HgRck0g5iY8Mud
 XJz5JAiDQ1tRLPpXTPmICofQWcYjU+1Nvs/st75Ph/SyLucSuy7TAz3bR++ox0A4iC7a
 UMlgfUNIPgNQg529PV2kaQJIJ9fxI+nEN6nTJkSLSmc1UEzJEEsu3eUpMQgnKjiKPzk5
 jLA6r8hQuuTrlNrUZEB1Z7G/KELWpk0uJP80I/KewdBIRPNadK6IISZRyFp9/LH0cOR2
 S0e7NRIUuXeydJnFHUyPAOunNcBmYjMHvgOxkAcr/KeL492oJ7VTXz5zFXFtAdAWkG5Z
 Ghxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778832214; x=1779437014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SCOyY7KDaMTThO3yLBJAEUbRwbm8BDSIF39YqyrR2Qo=;
 b=eVQGgrQjdnI8ICycKGnIn3TzwAnEIG/k4PC557qzOCEYR1UidYd+7rOjBXUeaqPNC6
 rfn+dDproJFkn0LUktXRc485v51VNvfEQVlCez6CBiSblmsDd4kZzP2C2vTj19JCrGDK
 C/dMq+ppkLaVMYG3zvqU9rl9s7jVRBMhSa7xvVzrh9+7eJikNi0DCMumIZRcJeJJsmUK
 slhSzpTe7uYxt9ieoj5v2vtq9DXNvntPJdpUnOcYxkShgeK4wfs0brKMmQLYBPs9iyf4
 v+o3LyfEc9dyogjq/QQmIHZ4ayAEHRZE3Y77Bz2Uew8io6jufAeKqSczk5Np2xZ8qLcu
 Shbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9VMjsP482rbKIc6edvkSWtipjYgLHfm/ae6R1LvWm39BR+kG837UH26IHmn1DHdL17XfUSvHM1+A==@nongnu.org
X-Gm-Message-State: AOJu0YxyVEKKJDIT9ePoPOZGvNSFxvy5pmgRzcYUSJqYQ+uSxxKL0G4N
 8BuLA5hSrcdYIGqsWXXDZbjyVFRtFJ4gfl+EZamZvcSbpGi+UI89u+/12lab4WYXJdLq6r4Or6n
 aedTIpEnsrvvjWAC8BavxY/R9tO9zJm7htkgAyIUOsQ==
X-Gm-Gg: Acq92OFrsagJykcSNVyH1fJcPF0Fu9ZM+5EYxv4EmlhPlEgHKKQ9eqSgu+z35QJOCfZ
 AELag3DDy8gMxA1HdQvWuN3oyBifHEtQWEl2fzFw8sT6CdzmIucR8PbBVkE5PLmh6tMlqKu7XPH
 R29IWdypjhFxvNShSFLXOd9n8MoMCNzw5eqJ9eD0Ot7SeV4WWGwkrCY6OD/KpuOKiUCuu4cONSI
 s84NvSDIdsdfeDeFFncNJa0eXycSJsLFeZUeEGbuu1s497lm/L6TKeMcrf/nd7uby/+JqxWlmNL
 vjAkeJ1p5elPzE6nHHcJtHjUOjq+ihZ4bw5Vd6OW7p0o88UWpnev5L98tmPi0u4uUVc=
X-Received: by 2002:a05:690e:150e:b0:65c:6220:5fd0 with SMTP id
 956f58d0204a3-65e214cf2f5mr2180435d50.8.1778832214063; Fri, 15 May 2026
 01:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
In-Reply-To: <20260513105517.146706-1-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:03:21 +0100
X-Gm-Features: AVHnY4IJGLtaKUKAAqETlMmv1N4v9lLsbYwbkqdBmbc9eYz-wD_Pxb5rfpoCaxg
Message-ID: <CAFEAcA8KnmAONjnrzYRjeC5sFO+QLhgjgUx0n1apVk7CirzSxw@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] hw/arm: add Beckhoff CX7200 board
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 13 May 2026 at 11:55, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
>
> Hi,
>
> Beckhoff has build a board, called CX7200, based on the Xilinx Zynq A9
> platform. This commit series adds the Beckhoff CX7200 as new board varian=
t to
> QEMU.
>
> The emulation is able to successfully boot an CX7200 image. The image inc=
ludes
> some self tests executed on every boot. Only the cache self test fails du=
e to
> QEMU emulating the cache as always being coherent. The self tests include=
 f.e.:

I reviewed some of these patches in v5, and they haven't changed
in v6, but you haven't carried across the Reviewed-by tags.
Could you make sure you do that for any further respins, please?
it makes it easier to see what still needs to be reviewed and what's new.

For this version, I'll reply with the tags for the relevant patches.

thanks
-- PMM

