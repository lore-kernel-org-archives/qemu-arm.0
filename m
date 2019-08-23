Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp468417wrs;
        Fri, 23 Aug 2019 04:52:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5DVGHnByu6CGnOxdWgji1TC711APEKYltF2+po0COoGJJFEQPzyNNXMYvnO0eUDCBMaB0
X-Received: by 2002:a0c:db88:: with SMTP id m8mr3473459qvk.143.1566561152545;
        Fri, 23 Aug 2019 04:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566561152; cv=none;
        d=google.com; s=arc-20160816;
        b=ap4bqNI8OnNwnMRnSfZDebCgD6XyJO09foJO35UqERRooxBEoy1q7CWhmtwBdNunKv
         paliUAg3VAEzWwXdQowfGNGukgndYWM49nx9ZoShkAwLO7AK46/kDxpFdTqBF13X3n+b
         al1fOCbm8s/doBLxLdy/FMvMihWj4YEUddX8U/ujXxmdCcQrB8yS2QuitqfwhloFZv/O
         978SxCcT9ZA382yBvdmF1hRxzBWJUukw82852Rw14R1pNmpWLge39yPzTrOlYqXNuYIk
         Vrgb2mWdSsn4ivp7W4wSheP+XnG07hQMdHmcWgtOpFbqtEC0LBLUynCmX3wjPUs3zoB1
         Yg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NEVZyY35ydBxPQPnhIBNcI9GoxoiRc7bDiBdrglHNzY=;
        b=Kow2zwp9oyNiCDc+5vWG0dxlTMvdtLabgBBzN1G0fRSh1MGZruFP0cJjEpsy+RiwRM
         vH8yxQp70VF7INs0+Ykj31p/wzyXIzWJMta1yTxJ2FHJuF6eGawVertDLESJ9GU6lN5Q
         pBhLum2PGl9aoKCiBjeqi9zm3eyHPMnQ5XKmxC2QNYmJ+TbkEj0NK6GwEr5ViH0yQLS5
         I7B/qJYOKPP2z1WXr7Oa9c9pZLPPJujzWZqCR2OuFPcMbNi2M1iQ7G46ur9QY18hYICS
         i2zZSkdGGBvFlrw6dLcPuXo0Mj6BVTQgClrh6rOBhnE/pZtKjSCNkiFQAqmTJdKSdwoR
         5zMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zH8EApw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k56si1928045qta.210.2019.08.23.04.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 04:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zH8EApw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i187L-000162-Rf
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 07:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i187B-00015Z-O3
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 07:52:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i187A-0005oS-L1
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 07:52:21 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37134)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i187A-0005nr-Ea
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 07:52:20 -0400
Received: by mail-oi1-x244.google.com with SMTP id b25so6809380oib.4
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEVZyY35ydBxPQPnhIBNcI9GoxoiRc7bDiBdrglHNzY=;
 b=zH8EApw2L7rqCBDWDiYy3DiI2hfUA014SzG4fKnclCqzz3VafaoqQB+Jl9390lipfO
 xFxPHoWfflH7Svt6JxknckssFRBq5Jf0fLhdC4D0t/A9m+Nf1zXiCHikvLC9OPFe4Ux0
 LOCKmlbwXYZPO7ZpW9W8T7DkJIErVQPvqRq5vSL6T5l0AjCAtexUxS2NGTRaS1xjmOAQ
 2V4IN1wy22YSpQBQeHD1/BLhn789i85tebZKcQCJdV0sSnJ3vJftvxk+ksbTngBtnlRM
 Vb4Ymqs/mBEgSmiYxkRhHazuu9fc2uHTIfFk5M1p2n3N6kr9NdQSdPdDC0ecujn2FAcq
 Mw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEVZyY35ydBxPQPnhIBNcI9GoxoiRc7bDiBdrglHNzY=;
 b=sIhR5VAYFyNS9DbqCcd7rJzx7XwXV1VK6P9ZI1+n7zteNS6ek33E+aJ9kf7rYhsY3/
 MzuAXPqIRcaAghc1T2wU86sLqhjBqeOBaoRz99R16xwds3J05+bNB/eIXP0q4CfdPXJ4
 4SbDL8MO8spIl9YAZVJKgIbvW3sUdtXM3KitAnv30OdjfkWwSK7DJ+7mojniQ/N2MeAj
 Tx4xoykBFmyV9q9cMmRyDIoCsPLpbYaIvnVcrdmK8/TiH8COBnh+mVovcE46hw0d5cct
 QjDQdtpu99n+fFAZh7Y+ChHatv0sFnr4DwXw0bun5n5hxm/4vgI3hIASh10rFl1K+KuK
 Nbsw==
X-Gm-Message-State: APjAAAWQdS0Ph+6XkAJ2Z07HS2uA1j+CDO/c6SI5fK4514F4T16WYItf
 TyptpZwNDdoFGVUxtRT1+P2tiPSkmV0shEH6l1GnbQ==
X-Received: by 2002:a54:4718:: with SMTP id k24mr2733466oik.146.1566561139584; 
 Fri, 23 Aug 2019 04:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-17-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 12:52:08 +0100
Message-ID: <CAFEAcA_wTzuPfQSDQizi+GAwpLMWp-=vu4+OUCHCtbWuEMhe_Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 16/68] target/arm: Convert CLZ
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WGpyWafTn/aT

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Document our choice about the T32 CONSTRAINED UNPREDICTABLE behaviour.
> This matches the undocumented choice made by the legacy decoder.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> index 6cb9c16e2f..182f2b6725 100644
> --- a/target/arm/a32.decode
> +++ b/target/arm/a32.decode
> @@ -29,6 +29,7 @@
>  &s_rrrr          s rd rn rm ra
>  &rrrr            rd rn rm ra
>  &rrr             rd rn rm
> +&rr              rd rm
>  &r               rm
>  &msr_reg         rn r mask
>  &mrs_reg         rd r
> @@ -197,6 +198,7 @@ CRC32CW          .... 0001 0100 .... .... 0010 0100 ....      @rndm
>  %sysm            8:1 16:4
>
>  @rm              ---- .... .... .... .... .... .... rm:4      &r
> +@rdm             ---- .... .... .... rd:4 .... .... rm:4      &rr
>
>  MRS_bank         ---- 0001 0 r:1 00 .... rd:4 001. 0000 0000  &mrs_bank %sysm
>  MSR_bank         ---- 0001 0 r:1 10 .... 1111 001. 0000 rn:4  &msr_bank %sysm
> @@ -207,3 +209,5 @@ MSR_reg          ---- 0001 0 r:1 10 mask:4 1111 0000 0000 rn:4  &msr_reg
>  BX               .... 0001 0010 1111 1111 1111 0001 ....      @rm
>  BXJ              .... 0001 0010 1111 1111 1111 0010 ....      @rm
>  BLX_r            .... 0001 0010 1111 1111 1111 0011 ....      @rm
> +
> +CLZ              .... 0001 0110 1111 .... 1111 0001 ....      @rdm

Same question about ---- vs .... for the cond field.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
