Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC89CD8CA7
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:49:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWt5B-0004nq-Qt; Tue, 09 Jun 2026 05:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWt58-0004mS-Rq
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:49:14 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWt57-00044D-4w
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:49:14 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-6611689dc10so2814247d50.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780998547; cv=none;
 d=google.com; s=arc-20240605;
 b=JBc476W51si8IkUvYEPSQkmsjh0Sqgpxl19m0/AlZfaDbjBXuK5sGwpaG8IYzztPeC
 OEgDl5y+gAdWKoeyYbiuSodTS45nHa+UrHCPUXfLbHNbIqRRWd1xdwWLu7M+jRX2vLwT
 RNyI42T/NVtxT4X0NFWzY0VBQ57rtrx7bEfIqF54qwKJCsPgaXLO0c+91PEi4uUFx0+Y
 ENJDxgO5KSqAPec3QPHbcSXoe1nYyQcKUzHbxTqas5lEOeC2rjvkGCYd9JO41QpQYW1R
 bgOgNIVhc8GAmha96DEvhcWu/5VaC7lBtp4Z/yc+fq517q/CCssISI7FszybJ3mcA9iI
 fwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 fh=I3ilEHSJoIKgGSm6bUXmcRINXqOf8ZuxZam7lXHerYQ=;
 b=bVA1DsAQ8+/w4Wq0j/lRLAngNPxeZj9dvtSvmbSHER1izFjSoCHwirdbGtFLbCYM6b
 DOymbml9SI4t9TpvE5xJ1NZlaV8/zXFnwRrz3FL95Y2EzxT3etTFHYPZ/FYJgq8kRYmW
 h9IZpusn2b/hu3z2kVTwg2aCdrYxdmfLzF0H0PIe0m0RamW60XtPrkuP0Tc0fN+n706O
 EiK70B5DClF+WEv5rPaNFoZEo3XI1UoFl43TA7KIGZaj3SI1xTSXawCYHo1xyhbrx6nq
 iI0VfBJNlg8d/lzDWuJpn9c3Lcpl4o5keRCyigNfwX2YZOzR9ChR7zfGGoPTJPGMaNT3
 vCug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780998547; x=1781603347; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 b=FkQGq+19Wc9qoD95uLjQYzyJ1+zHYR5JDrg+GJLXf2MltRyurSTs+S9wb/RtLB//LJ
 5sOfYegcDH3/F/ncWTG+MDf5q+VGyM4LNQRzqoX3sRPTvzLNeXY+PpURvIr2yTNtZjat
 lijhISC4dZRARmdJMTM6iydwsBazDaAxFP7R4QKjSRDgHADSx5qG6EBGB68RO9Td6ZAC
 y8TinvSlrR4aLEte4EoSaFx9yKmgKoubxy4T4oH/FAmGKpuhmop0v9MVpN2jUFJfBFQi
 GuIq4OD+09Apcx5hbhM07ztkWgazTCry9oq9ukGALJ00o9a+hlyklZau/VHJ+gNJbgO6
 +Gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780998547; x=1781603347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 b=bLE0lc5Ghh/4TPQGky2bfmrDziV2/5MGZNay3NwPrY7OFDRDMy1jmOIbgkZ1z+lZUQ
 58geDmW80Ki3fISHfpwT0+MaVN5eCSZGl3MEy7kGHxhkrtt7IokrTv1ar5OyeASBsnU2
 qBYJ3SCYoaU+RngbcAZxfqZtNpxIkiBQ3HospK+dAcieayMfwlBVWJFNNAEnpnnTJPO0
 DxZ/bWSQN2RUkpYRcf75Yc+w2J577yB2EdrQ3oP1NYfqHIUc+FM3hOV9IpnjSfXl6FwI
 9MbhtKQ7jccElC587y//28CrsH+Zw6ncd2hItAPhh0TkKPhmZlZCeIoyYiUvm9zh1tdF
 N72g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9sdioDSJYevlwZ4fXh2zjSn4pZTzbOeQSHI3xCsUVJI0zUO5YWfFn/jUEzQRHZYNMEemsJFQwuJw==@nongnu.org
X-Gm-Message-State: AOJu0YzElCgsHpzWo/Oebpj/iZiiEDor7son5yje+3pGKt9QYBAQ/2NF
 VIcBJusbtWFv+pXLY/EGU1M4KAzLuGsDdyvrvjLZwMbumrHStnXxigk8KhpgAOEJNd/IAsn+b4B
 UvCaIYYmV9k3g5FnHOvRqLMwSc69yZCfclhTO2ajmG/HscSWFIgl6
X-Gm-Gg: Acq92OGTzIeyBq3+5vFas/4ffWr6XzGBy/DH/SFVcEHnyVvfLRad3lHjs74UyRqzhe4
 Km+2ZjSQ64Lu9x7Odr/Whz8RrzPLk8VK7ZpoTe6LfEAciD2IUYGSZU38KPEdGGFINBvslk3kxXq
 pi7FdRM7ksFHhUnp1S9ptMmXGLWYeiAoON/+jUbGSFvRWLs9Ne8+nMuKNkiUSVtL7s9CG/omYZa
 x8j91zPwDSIHfUk2tOFIjWJpE/bwTc9hK4wF1kdQMswOYgrsGweOVhsh2S5wJGhXJ76kD0psU2+
 RhyTyj4Ipd+doxolKMF6mJZEjrl3+MkJXsgUAaD2KWdj7B48bEgoT/dyx/QS/RRAStGGkjCdbwq
 k+w==
X-Received: by 2002:a05:690e:144b:b0:65e:39d1:d9f4 with SMTP id
 956f58d0204a3-661073da66emr15528379d50.9.1780998547122; Tue, 09 Jun 2026
 02:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-29-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:48:55 +0100
X-Gm-Features: AVVi8CdEcFVCjn8epcsPxry4PH7gTgmDMTbHXKlO2O8UV0_tWRrO27YClIzS3gA
Message-ID: <CAFEAcA-PVFUVuZVyWQ_NEOh6byZfNef9nihRXq=NnH6XvbO_Ag@mail.gmail.com>
Subject: Re: [PATCH v9 28/45] target/arm: Enable FEAT_SME_LUTv2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

