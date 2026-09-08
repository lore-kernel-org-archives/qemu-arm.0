Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA37DC79FA1
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 10:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3tRl-0006Vm-MB; Tue, 08 Sep 2026 06:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tRj-0006VF-G8
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 06:53:00 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tRg-0007v9-G3
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 06:52:58 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-86b03b75fecso65850947b3.0
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 03:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788864775; cv=none;
 d=google.com; s=arc-20260327;
 b=eyvXclb9kOib+QPMa/QVIdzuDu0m2bL9m518jkmlxycBHupT56v6Ib7KpaocQV5UrK
 VE3MPDF5KbFqW3idmql8HBWqH61rMf7uT8M/qyyrjQaryMfo9WxP1A/JfvzHvLXSZT/G
 Xk/EDifDjOGQfIuEOs5VCugsSAKKoRjhc/he5XQokUC+ipbmlEMrCGnKfv4t28Ueqwr8
 8P366+DIZV3K7BdGuE5a7madWfzIB7OPGhzgzPWywg+knz7w+8sTxLHmfE8NmTXnfL5q
 uOkB9tNAos5lVIdKSGMPpyaQvP9hmql9JNPUDTwIuhAuuLN8MSXdEO+mScADWfzdInA8
 xrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1J8vxuDXqLCYZZyMA7TT7r1/xNlq1o3om5nwLugTks8=;
 fh=/SKZvX/0wFQVOnziYKemce3YiaRw5S9BmXxTWEaDmsk=;
 b=P3abmxiapTG/j30+HtSdzJEkamhR1VzfW3MBS9s7mZRxOpUg5ga2vdQtiFXl4fE8P5
 C0LYShc5QcI/2gUcrGBfZs0/OMIT8EJTdeow3UKFCSNLst36fIEG/CtW7v3nbol0KLJp
 gWd2JLuEQwjzQMkGWuGqVtNFONxwjheYOKpH2WECMVRAwfEERm2rrcHulXrzvVm8yl57
 IzXyr9VPBO1oN7m1KrLBnnbxXFFAQ985DXQdCll09QJyXijy4fQ+8zsOovQpd0LbSD4x
 YADH11pG0gilQulMmrbotERtrjS9vQEgqrjYkA4HUbCBjeTOdIxYqNySdYAXmo+K0Gxv
 bt5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788864775; x=1789469575; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1J8vxuDXqLCYZZyMA7TT7r1/xNlq1o3om5nwLugTks8=;
 b=WGzARZg56lUX6zayMPz3u5dFEcw4LLAQ4X1h1BN0naGpmiGWxtJkyntiYGUDKWewrM
 n8cfU2w96vF8XqUax9iMvcKeADvuUUHmECq9DBpZPgjPB6nSYJ4IBmxAQ88BOF72EuAu
 QG8+BK9qgdqFdK4+b1XWuE0vgSeTZ7T6v7lHLZpbuIaAeSdD6LHcNA5OqZRVBTK+ihDk
 2EQVlmzu6ulKIdXsNnUaVotudCeaq4Ocd+wNYtssrOLqsvwO40woQRKx8VfMwlDYqh7w
 ArkWbgaIy7LQ7I0z/SRLdKS82dGB7EWT05mJgdqiJz3roQM77IWHi5b+FZlftwDp9uWB
 wzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788864775; x=1789469575;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1J8vxuDXqLCYZZyMA7TT7r1/xNlq1o3om5nwLugTks8=;
 b=LmJ2sycoFQ8akOtcwFz1Cq4e14SfqVZzoa1BgPcmo5z22bPg/e4iV7aAhT44kWVkoa
 quqaP4E7+bodDZNSruDE8huz6UdgM2tofT+sf9d7CpDdZCHh/cHoMokQatwm9NXFm9yP
 RJjd29A2NXNAOKxZq7ABnHuObE1UqQwTJiAA1PnCYPWa9U6MfKWRDI2UPsiHw5MLkUoF
 BJXcoTfcE9WzYVOZ321qJtgRwZ2MXAkrqSN/HLDRScrxaUtzgigqbRZu8yWcZw68oS3X
 +NoZmLDTzou/1baRzXtxJOsACu7e6Nqm5wJxGb5h7VeZcHua/kxyN0JmmgfNoJiBo7JH
 D3Ew==
X-Forwarded-Encrypted: i=1;
 AKwUvBxEy6a1ibJ5Q3r/6ByNI5osCpj5sLicUtFW+r2zMHU/No0YX9T923bYHAaJw2equowWEcZ6kh2ZQw==@nongnu.org
X-Gm-Message-State: AFuF++n8+gama9JO2swPUwQ8ID5w9v00FbMn5lXUQUHoFicvnDBqTyyq
 r2jFjk3WtiePuGCPSWWnOd+2bUu1KM8pE4WoyO/xk+ygbXyq06VSn5X804+XbJ89Th3rO/zMVHZ
 Y6zYID8bZDel3i79aega4iyRu1x4dp1wHwwCvNgeX8w==
X-Gm-Gg: AYBFou39RjYMNtpmEwBi4MUk1pUQKuDu/+TEGstjAAlpEzI1yjKoyEwN784KZEC5VVm
 cLM6qbs/PphN5hoZCTKLPjSyEcc6yhZ6CbHT6FjDCcwmBQ3+PD7HraQBhjLvHoJWrburJPeo/GM
 9G+P/PlOVMgnR3DvlMORjTs0cPfzeyKiEiDOcXoL91XOw85L5FVZOTtK6HC3yTdlWNQaUnEpIq2
 zAyVr2e0tsRE8GZfFFJGsI04qaCxDC5C9DovGjJEEMJz77Co4qXM9hQbTuR80j7yA2h1XDVa//u
 dkc8Jqy489nG1Nl8bQJL9d0yXUYje4RbBWwaFOCsCW6OnntLGxC4Avfhk8V5wr+hQlXNnYiXYu2
 krkhaF0UybUHjTaXBKsFQ1kDEOk+N
X-Received: by 2002:a05:690e:12c7:b0:66b:300b:e95d with SMTP id
 956f58d0204a3-66fb5b2190bmr7753144d50.50.1788864774856; Tue, 08 Sep 2026
 03:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260831081709.77725-1-guobin@linux.alibaba.com>
In-Reply-To: <20260831081709.77725-1-guobin@linux.alibaba.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 11:52:42 +0100
X-Gm-Features: AcwNN1UHDdNqB3wZGi8w9Eo6D3c4n-sqm2lzOe75ZmJG0Ix4a2aCCW-u2jtv1yE
Message-ID: <CAFEAcA-SGEY4+fhFTVTcRVieqh_eTQWAcRzOAQLas_oPnZ31aA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/bcm2835_ic: reject out-of-range FIQ source values
To: Bin Guo <guobin@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, philmd@mailo.com, farosas@suse.de, 
 lvivier@redhat.com, pbonzini@redhat.com, qemu-arm@nongnu.org
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

On Mon, 31 Aug 2026 at 09:17, Bin Guo <guobin@linux.alibaba.com> wrote:
>
> The FIQ_CONTROL register accepts a 7-bit source selector, but only
> sources 0..71 (64 GPU + 8 ARM IRQs) exist.  Values 96..127 cause
> bcm2835_ic_update() to call extract32(arm_irq_level, start, 1) with
> start >= 32, which trips the assertion in bitops.h and aborts QEMU.
>
> Reject writes that select a non-existent source and log a guest error,
> so that a malicious or buggy guest cannot kill the emulator.
>
> Add a qtest that verifies both valid and out-of-range FIQ source
> selections on raspi3b.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4368
> Signed-off-by: Bin Guo <guobin@linux.alibaba.com>



Applied to target-arm.next, thanks.

-- PMM

