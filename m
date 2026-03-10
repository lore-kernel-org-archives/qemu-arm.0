Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B3AFD4F03
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 17:10:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w00bC-0001aI-1P; Tue, 10 Mar 2026 13:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w00b9-0001a3-O3
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 13:10:24 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w00b6-0003hG-Sl
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 13:10:23 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64ae2ce2fe1so12303818d50.1
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 10:10:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773162618; cv=none;
 d=google.com; s=arc-20240605;
 b=kmlakZvqcbhuiB/h8CHLLbXWMHoAMgMz6LrCmgHrMEq0H51FFxsn6PFQghuAbdTePO
 1Jqe/J6U59UbQJSt4V+DnQBIA/vOA1uUBkVJAL3DzhkX5ZZ8nqXbbyBk0S99MAM5mgxr
 CbUPkgTBFUP66XgSueXi7l9AdeIBbSnAGYnVKadkRhwTU/cGO4fhEGTTypA1YVA6UYet
 FtgtPt/yZLyzWDmWyykuMKdDLtQCLajl5qIGbvHRXxt2Xy5kh5I6GDOJ88diY5FPD4Na
 +qcHpxiRQr/WoGsQJ4Ym64e1nwPekdY65Qg87jINEYZFcJQo7yWNB+R3a2y8K19iwQUO
 a5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=74F2d2/ODVoFINZyRIcNy+nXp62lt2L48Bo/XcZTKWw=;
 fh=kF0X/25JpPkCcTgcKHuAHc/Y/gxuDzrwZTfv6+93x8k=;
 b=O7eYD7j174W6sNMwUbLmYQICrXenr2IipqxaSDw0d/bzat8ZwNfQ6gs8vnrYefprtt
 zxjMxwxudESqtFT9o8p0Qt27+GZJc/kPr/RPe0Be1N1c3WXj16NjQz4YsA96PGv/jsMq
 UKvF4VFgBw0aUd+4THNekpRYwJb2xdIcEdKLozOJWwcG+CwqVJGPrOTMYR6vPqz9+ZxS
 +Kkm2vRoJ68iaVfj8TTAnoWHlXM0M4HPvyHOq3bbbimy8OtK2uHY6g7kBpNHBeUYDjD9
 gETYHXraCKR3oqP3C9NkRsAGXSeF7Z+5ej1nv2MRaff94O0y2Sa+R3i9vYiBWeOwKH6o
 zYJQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773162618; x=1773767418; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=74F2d2/ODVoFINZyRIcNy+nXp62lt2L48Bo/XcZTKWw=;
 b=eTIDxsqOPtwQGRy/7OnJ1+zlZeGRuqe+Loe+oXvQM+7n/ui7mHkquBlsDJAq66yq6t
 ucAQFfpqnIbNnImutNoPy0fyFoU598e/5VZw8mL/JqNfI5/n14imgW+A5wWYXz6EDwO6
 Dw7OfWZLxGC+lCGi41plK0WUyEXqH5BTA+rERlCzD+qf1WPveUVZQBo4O+UrCn2nBMBr
 tgl0E/980qzetvc8AGozOi50f9s9GrOJrMIrF4elK4XF8fcP2adZqTXJhr4TzxTOjyGu
 g4jeOoNhv5bz6xlfvuijY1a+SE8viVaIx7dn+d8f0ikTtx0CyinKxOTamg8PA9gLDnTI
 Nh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773162618; x=1773767418;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74F2d2/ODVoFINZyRIcNy+nXp62lt2L48Bo/XcZTKWw=;
 b=EBDkwa6P4B3ELR0ZpndDFRfFKFK7Z/6TiSvjicZ2kMoleNzddMg9Ja/H15FThRRBlK
 Y5maiX/qnnmnYwC7nGKLrnnU16O6r9XId1TTebTVQVcJkI5dFaCv2usPO5ny4GhBmjF1
 ldyYtmW5tsQAVDh7Ht+LrB4YHJOSqEY7TmTCwx69FBi90ev4mEU0xx1KNzD3ty586cd9
 M8q17WIDSlNlLyCvTGBK5IriMKAbl4dp5DqhFa9fDr2O9Qp2JJ2nzm/3KFHvr1cH9JBR
 BxZV2t26QgDSTJ5/0dx/iia9YjZrt2MPcQz8SwovBRt5nmpCZNtWdzP+AzlvrCCC0axQ
 7Jgw==
X-Gm-Message-State: AOJu0YyCrh+v7LZ0msGrPC3R9PiE0pIeZ3FGPUbCF5HzX3beK9b10rVi
 v3Vi+R/YST+JVdCS2a4QxT4qBok0ZipWdzVVKvwiLqVEWoSdVXnkzqQxv4rEjKByEfBBdX7CfIj
 A2j1nlPl/C9G3SabyAHY22PPydoGqCfENwUiY7WP4FQ==
X-Gm-Gg: ATEYQzz2iCAp54nv7XYIHup641J/JMXfcB1d89QPuT/t8VOnxaRjnk6J/zWs5BMbyzy
 7Jwxx87mL0FU2dw24AQji5GKYorY637C1FJbDbbg7uFcpAwNOmprwCVoEEji+31Iomk3OewNf9n
 +JRHnLXqXq+fuYrTwD3BICAMx9CXA0oCnc2SMhE/U+H1EWSyG6BClFUerMpgIFbmuZ5gbqTbpQN
 ld6xYasthvk20xdS9xVg+4oYFWGF07t5T+KvuzflZbMY6VKIRYUgQKmXhQeyfSXQq5uRLuT9H1O
 NfgW8kPwof4Nf7DeEtUUYykUv6SqRPGYiHnDajaVC5U11XdWxnxY66/iXosqeV/+QH7beYwuJn9
 1Tg==
X-Received: by 2002:a05:690e:140e:b0:64c:a9a7:4655 with SMTP id
 956f58d0204a3-64d1406a5f9mr14959750d50.15.1773162618216; Tue, 10 Mar 2026
 10:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_9DDE59F8423A88DA68E378777E694AD22009@qq.com>
In-Reply-To: <tencent_9DDE59F8423A88DA68E378777E694AD22009@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2026 17:10:06 +0000
X-Gm-Features: AaiRm53LrzHkgj8PrPHcNdTvtITcLHzisPV1hNHJOqL_6xgEequgwsFTxF7vELo
Message-ID: <CAFEAcA-=PCrwEcf_cLC4b_MUX2vA4OYXDoTNRs81DpKKLLjWZQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] Fixed bugs in pl080
To: 1774596582@qq.com
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Tue, 10 Mar 2026 at 16:40, <1774596582@qq.com> wrote:
>
> From: TaoDing <1774596582@qq.com>
>
> Hi all,
> I added pl080 to arm/virt, but when I tested it with the Linux dmatest, the test results did not meet expectations.
>
> I found the following issues with pl080 in qemu:
> 1. pl080 did not generate an interrupt after data transfer, causing dmatest to timeout.
> 2. When swidth and dwidth are inconsistent, dmatest data verification failed.
> 3. When bit0 of the DMACC0LLI register is not 0, the guest crashes.
>
> The proposed solutions for the above issues are as follows:
> 1. The interrupt should be updated after pl080_run completes.
> 2. The amount of data moved by pl080 each time should be determined based on the remaining data, swidth, and dwidth.
> 3. Force next_lli to be word-aligned.
>

Hi. Thanks for this patch. Some notes:

(1) Please can you fix one thing in each patch/commit?
This has three different things which it is fixing, but it mixes
them all together which makes it harder to review.

(2) You have put all the description of the patch in to the
subject line -- this should be just a short summary of the
change, with more detail in the commit message body.

(3) Please send patches to qemu-devel, optionally cc'ing
qemu-arm, not to qemu-arm alone. Many people (and automated
tools) only read the main list.

(4) Is it possible to repro the dmatest failures with a
machine type that QEMU already creates the PL080 for
(e.g. versatilepb) ? We don't intend to add one to the virt board.

thanks
-- PMM

