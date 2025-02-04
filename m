Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp301245njb;
        Tue, 4 Feb 2025 07:52:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFZAEQsteIlGSjjjwfoB4kRm0Jb6tZihYGLpGRbFS0i79ydbekK4c5XKHh3coTZyC0ZAY0QfmFHjhcCw==@linaro.org
X-Google-Smtp-Source: AGHT+IGaG1vbJbkbIM89lsGkNFNwmVFQIozg3zWa18gcwpovhtytKg2tSU5n9GojQphAn4wjRF0f
X-Received: by 2002:a05:620a:2551:b0:7b6:d710:2282 with SMTP id af79cd13be357-7bffcda112emr4180847085a.49.1738684350600;
        Tue, 04 Feb 2025 07:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738684350; cv=none;
        d=google.com; s=arc-20240605;
        b=F+A+tJ6dDs1TanytLSVoMpUqb8Q7SmfFwMHzFI0TMbUXo+pjphvmjAn/L+J+jPiD0z
         VaZFKt4alUa8EFEuJF+dqI9ElJMwiGqLSKHmQKdWTBDTYExxuJfvv1vX35dyimxxChTi
         KjH7CkQ15NHx+A2+FtUx0YLL6/KqMdRpOYAVLOfXb7J3HrHGQPE+OxPj89S/p4i2JtCS
         HrMyTlBit2wueETwaxCQqPa/PYkYn8xYhUCkEJ8Qk9YyGiJGzxWpZ3UPxCgWw1rmwx18
         BWMi+IZaf0TXn4ptl5ZDb7wk4OzD8UMtBikv1ns2zIO2xYflTVBTHZiYWdv0/hgq1+6U
         aVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Aiz8cM2JVtiJdskRflZqDB5iL8/Yg+UJF02tsi5pGro=;
        fh=bkCr8YGdZKa/VjP8PkZkMrIQTAu9pr3e90RwzsW5UvU=;
        b=ZoodGPs48wnK5KAAAWa5n/VJpzh317fJAmtfhAPV0ptmHoANAAh8TDy20rQ4GI8dmF
         bAp/Q+7SJX74Ax7HLy6/JfgU1lSOElnid4nVMvvDh3yfLC+qlwEGcXCRbLjjBIuKhVOv
         /DCsSOitpU7UqHAaQxHEk3/5owIC7ucDBqZfgycnCMTqySpV7LTFVDnfGYFF8fugnukl
         ct6zdm9QDgiG0hOElnaFlzNhi01uS40DmmRPTyV0piyxnbWJ7B/hn+plfBjMMvOuA+FA
         /pTIt3qbpSJHzy2blWOvbKzekCzPMzlAyn+sbrf9soL/uM65bMo8eBwQ3LmYhCaw1TV0
         EQ5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qX9GEsfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbfd2b1si297188985a.484.2025.02.04.07.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 07:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qX9GEsfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfLDm-0007nI-V0; Tue, 04 Feb 2025 10:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLD8-0007NH-PS
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 10:51:47 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLD5-00005s-Ul
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 10:51:37 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e53c9035003so5119055276.2
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 07:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738684292; x=1739289092; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Aiz8cM2JVtiJdskRflZqDB5iL8/Yg+UJF02tsi5pGro=;
 b=qX9GEsfEnzeq6KPT/P9jwhj6SH+IWgVXbgLpyp5yk8FQq4nzh3Azqkrpbk+JB5PmDm
 XAJO0Z8oQNQbjC8hHnWfKW8I1BeIglVTL76TvUCU+wn29axalTq4Q2rvvNRS4wcr34c1
 4+1W2Nyrr5BMZagMH7MlyaoxDLpyBDrEkhlYndFkc/ehNPvcaOtA8pUqj/etPk5f9MZj
 MhuPoB+nMs9Lrf2U4erdfxEDA9FQof4Z7OL+8jvuOAjDVFZuLu/PgPMiego4OS0yJ04w
 g4wQAxSJIewUhHSE2Ak+7ogHidyOPbyggv8VsEzPJut77kKIyzQOANu3mn5mo7fmzAzX
 4xpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738684292; x=1739289092;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Aiz8cM2JVtiJdskRflZqDB5iL8/Yg+UJF02tsi5pGro=;
 b=OcmFsHGiXjdUOtBGEokh5fuGxHgo+J9iZnmcMTa0CJL5nmwM4zT3zvbplJYN9ZqaDL
 07dYzmcJZ4VgQWTjwpbanZ1QMEcqm8w0oz9vJ+Tqo0KPX6cxsxxIffO6aSfdODIiwEQz
 hZuENTGT3BAjfFoFvhx+VakFx7OwwHri+hn3o4cagOYUY8EQKdZp7HIEC5EeHIwsN2nV
 4azp2tGv6NZiu9Zoo+XNuBZ23Cbt4LxGEqTTAeGx+pMh9O1GwLQ2od34CpLtnXXNiYwM
 g2Vw7duS+PX2FRxfX8K9mwbu7vhcIGpfCSbhwSshYD0Zc56jZ8dYsV0g33H9LH1H/2EF
 tzqQ==
X-Gm-Message-State: AOJu0Yyz+SFpWM9qGsEjg7La7ZXRyjbAK9E6I08/UGXKHfgPjwPhSjru
 OTzPotTJNB2SPMkQKnUebWy6AUwy3SSr9mi8ul9HWKisQ8fWavwh5hTkzrBCIh7vb3T/ShNWuSx
 WYb4IIrK+plzx97/OR7oA14vGW95a7iCmCbe1qQ==
X-Gm-Gg: ASbGnct2XWgYGX4zXj26xzvDes5u6g6b86rE9dlL4V5/EUCfGnSkd+HFX/ga5kqIQIv
 5thUcynb5LyO+Kx5ru6rFA3jncAcVkQpi4hI8kTgVd/1q5phw3dd1aRr1wKvxV2hjgqEjwwCGEQ
 ==
X-Received: by 2002:a05:6902:2742:b0:e5b:149c:d8d6 with SMTP id
 3f1490d57ef6-e5b149cd9d0mr2459529276.0.1738684292474; Tue, 04 Feb 2025
 07:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-10-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-10-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:51:21 +0000
X-Gm-Features: AWEUYZnMHclWGEgJ0GTYI0grNY_8QSAsMTVTPFUC7t3LHoJ52QK8LFSmeunB7vE
Message-ID: <CAFEAcA8rmyf1GqPxz-3ed5GEzfpHkYCPQx1qf+5KDavnV+QFig@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] hw/misc: Store DRAM size in NPCM8XX GCR Module
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: 10E2IV/ieGva

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM8XX boot block stores the DRAM size in SCRPAD_B register in GCR
> module. Since we don't simulate a detailed memory controller, we
> need to store this information directly similar to the NPCM7XX's
> INCTR3 register.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/misc/npcm_gcr.c         | 24 ++++++++++++++++++++++++
>  include/hw/misc/npcm_gcr.h |  1 +
>  2 files changed, 25 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
