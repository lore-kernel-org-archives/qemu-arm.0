Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2492877njk;
        Mon, 27 Jan 2025 06:59:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWWEz3QIuXs/L47Va4zULlZ90se99Z8oqG9XlQXl0+Xg47VtONtPCrhhXFYcY40d2Z1aUbQ2KkryRHKNg==@linaro.org
X-Google-Smtp-Source: AGHT+IE9gftC/24dbIneSkrlFvCrbllBuJox6PvHk7+9xa24715PzffJrbXR/RG9wWqDO20wWApo
X-Received: by 2002:a05:622a:15c9:b0:46c:769c:53ab with SMTP id d75a77b69052e-46e12bdd9e3mr631445961cf.47.1737989959287;
        Mon, 27 Jan 2025 06:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737989959; cv=none;
        d=google.com; s=arc-20240605;
        b=kJTWcsdqkPRydc8N/d1yop5M1HKB/FQKxiWdDuQMdds1YHSAor8HKtaeHSpUgwCgHI
         +Fmib9NcNzYIGq0NwrpFV+6ywukUFYdxFbl1LCPIaT8ETcQE0DBuAJOQTyTlVRw+sXHg
         2sFp+9dH215qflX3FLtrW9TAioIbrC9ViRy8zQvdPxtxKFzdfJ500RQWwB7TKe7w/lV6
         2Tbwnac0Fkha+8AW0BbF6vNTDeiN7L/wlh522K9bDtLPLRfr4CspSXHR8tLrhZOmrN7O
         fzvINWlmuI8ZMv9+ksSUSLYJIbpp2+KRXbh1DcgEyQzc5OOkM+CbsNElxUBM0PpILMGj
         pQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=otG791Cv9Uc5oiyVFVfRkqYTV4AwnWUeCxL+h7sBzg8=;
        fh=sKeBsO6scbVBfr8bLHkFYYYmKCg3wTwFjHH8nL+/CXU=;
        b=j8tS9RJG/NRfM4qMUyPEIUtb4qqBQdEHi93M5H3TPmVovfRDrtLMS7a9/B5hq9y4wI
         JGmU6hF5Nxxk9P3rhdvqG0Obu7HGFvC57TTpclow86IB1X/DvKaelDoVo2Fqej7LoiWr
         tadiX8PrUtdcEVckVHZEyDc1LdQmZ4TZsLUTjuqpQBVnsHp5pfCbOHZ+4VqyERSQSHt4
         H5AIbJmk2BnMaJ1MxWZLi3RBFkd75fsKeN20kvU9PdbA67j0M6Xa9m4EtL9oVh1oZvOI
         7vRDAUehqV7OCi6bp+8ImEMXvQIYz1QjHvDODXk5AGdgPp/EYec4O+QM4UDMvyuhTXTC
         A2JA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYo+m9E7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e206134b5dsi96236906d6.498.2025.01.27.06.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYo+m9E7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcQZd-0001Qr-Iz; Mon, 27 Jan 2025 09:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcQZa-0001Pd-QF
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:58:46 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcQZZ-0008GW-8h
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:58:46 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e461015fbd4so6573245276.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737989924; x=1738594724; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=otG791Cv9Uc5oiyVFVfRkqYTV4AwnWUeCxL+h7sBzg8=;
 b=LYo+m9E7t6CgC5CNHKPr3NcRbptAwmabRyxVWxTqrSb1fnOTWwtyOfSOsOH/O82S+5
 v6WmhjazZBBsXxTDPIL0E8Uxu3aqtES+HQGQbz/rsD+NQSOTAffrrNnmVv2OznxYNaYu
 b4+axFYuz63lJh+/TzW65woJO3nLQF7REWtgkiT9nb3hg8H3OLTZklf01Hj1H8LZgLn/
 IRYglUql3hW4kqqbiXVa6NVPIWeZ1aBx3EL5I3PrW9mIG0m6//Acx2LuqHQyfb/fsMqo
 jPSTWNtGDvwPT0UajhoJkMFGPemToT124qlWdseQWo0gFgr72nL/QbFmBtwi85Q1ryCj
 i9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989924; x=1738594724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=otG791Cv9Uc5oiyVFVfRkqYTV4AwnWUeCxL+h7sBzg8=;
 b=lcsskNrSTWlGqDECMxAW3QbHT3lyXInjkpKhkaP1Hw0tvY1UYMXx0MnxpG/hpgJPX1
 7NmqOg8vIbPURnKRiwJw4sfNfvV0jzy5XGzPQH3rgAwlSUuH90KZG7lqNZ2ydhM3+iAY
 sTXKH4y6LV7jxyGmtiZQGK+TVyApYNef+KWnvxVjr8/pg0Iw5hDOlS77lm+J5tbKKa0s
 4vKfegBiK2shmfRzKwg+Ld0Mbflu98mcvgadES56SFWUgccU4WU8tAOLNuMinSnEpJk0
 fNnPPIRpRytYTrW3gf6wxHIVRttcgXuUBZZTzTPRyY0h9PTc/gxpRevIpG2hX5riT/6W
 KVWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBDpxYmBC0kbfBdMLkHg42aorbqI+xSN+bzAKvHi66iOoK5GEv7Ky0aTbu8a1e6PLcdylwIAM2SA==@nongnu.org
X-Gm-Message-State: AOJu0YzJb7ObAk1GVpg78RU7BB4rbJSG60qrxNbrsomF+tGiH+w4xWWx
 8FRi+LWGhtBtgKpi0jDtD5bK4/k0th8nZtJis23DcumamcsRFDkhTW5V90E4wxYXkTBb9TPi2LF
 IGbf1R/MXqZB2lUuGl38yhsXBpvTl0p3/8fezHg==
X-Gm-Gg: ASbGnctaX2kwJIGUDMrD2kASzuZGtCCeiUfJOdjpRh3gWDnM2nn/FjcHwvZSNZ3pVWe
 +yOPiJ8Evc/5D2HVYMb/fVBgSF2INw7h8+YjNGPFMxo365qTm0fz2A6ejhhuaSFM=
X-Received: by 2002:a25:7412:0:b0:e57:cb7c:29b2 with SMTP id
 3f1490d57ef6-e57cb7c2ceamr22406663276.7.1737989924000; Mon, 27 Jan 2025
 06:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20250117191106.322363-1-kchamart@redhat.com>
 <20250117191106.322363-3-kchamart@redhat.com>
 <87sepgtp3e.wl-maz@kernel.org> <Z44R-cUz9CWMp5Gi@gezellig>
 <CAFEAcA9arxn3FLRYS4ObD=iRkX-idgCosZkoqknqTkQwYn0uTA@mail.gmail.com>
 <Z5eLpzisRtAstcxw@gezellig>
In-Reply-To: <Z5eLpzisRtAstcxw@gezellig>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:58:32 +0000
X-Gm-Features: AWEUYZlVRODFL3N8bMXxF6Rq6E1zOtlt-ZjurdPo5K8h0a5JKzlcyU2awgFbY14
Message-ID: <CAFEAcA8M5F5vELuEmcjRyU_=xEpAWFWw0oHwRe4iLX9+zLwJ1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 sebott@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ADIAUWrFDXKW

On Mon, 27 Jan 2025 at 13:35, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> On Mon, Jan 27, 2025 at 01:06:44PM +0000, Peter Maydell wrote:
> > We should probably do another fix-capitalization pass on docs/,
> > because a bunch more "ARM" uses have crept in since 6fe6d6c9a95.
>
> I can tack it to v2 of this.  I see about 22 occurrences in docs/:
>
>     $> git grep "ARM " | wc -l
>     22
>
> > (6fe6d6c9a95's commit message says that architecture names like
> > "ARMv8" retain all-caps, but I think that was my personal taste
> > creeping in -- at any rate the current Arm ARM uses "Armv8",
> > "Armv9", etc. It was right that "ARM926" etc should stay all-caps,
> > though.)
>
> Okay, so, architecture names should stick to "Armv8", etc.  (I too
> would have preferred "ARMv8", but whatever the branding says.)
>
> For all-caps: I assume you mean these should remain as-is: ARM926EJ-S,
> ARM1176JZS, ARM1176, etc.

Yes.

(We also have two instances of "ARM64" which isn't an Arm
official term at all and should maybe be "AArch64". If we
leave it as-is, I have no idea what capitalization to use
for it.)

thanks
-- PMM
