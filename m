Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B5ECA1016
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 12:57:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwgrl-0003iJ-Q1; Thu, 11 Sep 2025 08:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwgrj-0003ht-LX
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 08:57:31 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwgrh-0005S7-7K
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 08:57:31 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-72267c05050so5781747b3.3
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757595443; x=1758200243; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nrMvlFAtacgAgXHusVpcx56VY587MfF7pKVl7Oa1UHU=;
 b=apRGTx0OcvzGkKe2vc/9qq27yupbfs7npCVfgJOitXPrf0Mw9qAIJ553w08sC0PWeP
 5hfrRJvP/JwQwlMlXP5JjpmzsSW9si76A0m7A/a4Gb+svWPW2NKYdGP1bEGKtMOINiqy
 SsfOIwhhtZoZ+OFlLJYFpvg9KGEdFvQCYhn3hPBPL3MWwa0p8jOBdGiIMVAhRwQcBsJq
 qH2BSBNNzgxIC9NEVE2ty+FYsjaq79cHfhDmhdUCo1mfwWWZoPJnHNAnVoYD3ERYVTmc
 RZ0wgGIoBnubKqUs3tLtGAHP4rzgJ+kqdFapz9/f1HHaI7kyUZsaEZBuIvnXjKlYaHm9
 0+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595443; x=1758200243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nrMvlFAtacgAgXHusVpcx56VY587MfF7pKVl7Oa1UHU=;
 b=Oh1zmY+pQ1OWuhDYtyyuXzLgmX+ZiZohgHYtqb/dbanCIQzJ2KfXRfzDgDd93CNcp8
 p50gsxtBeuNe3NHvzViw4iXSzA+050+HGD5+FtfTIMJfPUXF36P+DbkBReIPWnry4M2g
 gFhODZ7qw8OyK9VOCKYPdM4edXcT6/coE4t32i8SaKfQ4WzskDUGGLdSth225mEYWtKH
 eb7XRNo9KSu0K4kGzdqPQsdOoag+9rA1Fkv3aPF/bqxujipnY61uEsIibXgWVM4jrnHd
 nbs/mdPGIBFkgnQPzyYslT1JQPRvMh75omASW9Q62qlHyWgVO65PAgrzAcHsIuRaR9fr
 OlvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCitN+LirDdbjHlwU+7tyT7My0G8KRrLonKMA2ixWFHBQbSptOJrMtdBOGDXJuLqMfdPlluR2N4A==@nongnu.org
X-Gm-Message-State: AOJu0YwX1epWgLS65yEhfKFIjOcoGRZvWkrWo+86zST0eK73ME+9EQDb
 kd3vqyzEBFNzMGi3OBt9EbiuRCzc20fAKSWanRXfM0EFEFEQFzt4Z/LBBPe1LHvphn64EOTlx/5
 ymUE6olR6LpQQ3VqgA8P23DNv438xlPflwvNzd1ilRA==
X-Gm-Gg: ASbGncvQGQeSgAGvxhzYJrmHbDXjGV9V+Kby1sZqPzHkqLWZfLqSfueXDTeeksIg5Of
 XoePCgbIE+w7OkhJzCWx8iIXR0DMi1SyEeE1QxdqZoLX1tGDNw5NW3bzD9yKIyh9GPM0knHYl5j
 J9TzMb2bVcp/GloTOso6QYy9qn1JzgOWcUlcS98rQjGHaqYOy8LdH0/Xw96rjOINM0nLvPz1y3x
 BTwJuDDI5d383Fb6rY=
X-Google-Smtp-Source: AGHT+IHFoF92n/fML93Q5474RgNlv5KF0c+gBTlhvMyra0HW749FLkOCk4ixhUJs5l4Pix/04PTMrW1dYx3KOmdFy9Q=
X-Received: by 2002:a05:690c:30b:b0:71a:183e:bfc0 with SMTP id
 00721157ae682-727f2bcbd01mr158063247b3.9.1757595443317; Thu, 11 Sep 2025
 05:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250902200818.43305-1-osama.abdelkader@gmail.com>
In-Reply-To: <20250902200818.43305-1-osama.abdelkader@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 13:57:11 +0100
X-Gm-Features: Ac12FXy1ILZVf-cGjTf-P24rH1t1Zhg87-iTIimkpTv9AGPDF4vKHULx7O5vGEk
Message-ID: <CAFEAcA_tEhEnt8hKoyO=MA9Y3DNfhaN=n0q9TmT=9-5O=uG+dQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/raspi4b: remove redundant check in
 raspi_add_memory_node
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: alex.bennee@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Tue, 2 Sept 2025 at 21:08, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> The if (acells == 0 || scells == 0) check is redundant in
> raspi_add_memory_node, since it is already checked in the call
> chain, arm_load_dtb. Also the return value of the function is
> not checked/used so it's removed.
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>



Applied to target-arm.next, thanks.

-- PMM

