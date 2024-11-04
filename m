Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2081812njc;
        Mon, 4 Nov 2024 04:59:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwWEgpBzo7eD8AZda9Wqghuyq1A8zNgJMJhQ4SvtbWrP1F2AuK+m1fczNCbwr0W8NiB3BoALaPUkWtjA==@linaro.org
X-Google-Smtp-Source: AGHT+IGTo6gItm3q6hf11KhExp7RZvbavz/y7ZuAqgkcIss8n5q3gr1wHoiu5uBPSi0TBNE04PoT
X-Received: by 2002:a05:6214:598b:b0:6cb:99db:bdd5 with SMTP id 6a1803df08f44-6d35c1996e3mr185380546d6.39.1730725189551;
        Mon, 04 Nov 2024 04:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730725189; cv=none;
        d=google.com; s=arc-20240605;
        b=fFVyDW4bPbB7N8tbG8NR6ov6/w9mF7DofIWEyFBl5Wy6WNc3vbpwX6xiJo4lY2FWv2
         LMJnvtIRFphLTT7H64Qmp9bKDH0DWeb6Or+9i7dLxSchfuiJZnMIawLvO0pHaqC/Fqlc
         9HAvYSNIdhiHh+U1caOs/BWnk/OarkBi4K5sCHwAuY59pGp99OkIdVkwhp7G+w71gvHM
         2rKztYUheVuXYc+tP6EqR9VGNEudAMaZwJajQZaH2aV96tr2qEh5IFpvJMkxqlsb4xsV
         rMQeCj+InqcI6qPnAPpRo2TxqAxqZkjMdL1v8OZevfV92CTQXzNYeesITMGpscG9fuKP
         R3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=usraR9Sgjvrl3oPL/nuvCEg/Bb2HrMmnGGynllF0mp8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=CmuDtWHlFT5HKyyH7SCG9kYcX8SyXlPJyxYCpx6vHnCbY0BQNrvVullj20Ba9y+BkD
         Cth/U7bRX94KI3E16ukDITcy0r4rD4zwG25sUeTH23BrhOYaXj01twpV0BCJHAEbBCil
         +H5bCgoxHf/JgcU0YYw4NSnwVmqebyGbFAXuCsIg1iv734SOqJ6CGzegyjZNoPx80j/J
         Kh/ehcmiIrqpUAUCq8gy10UC6WztezfKtKb+8KnUQPot54FEA2DIMDYXxIavXdGLjJjm
         PY6i9yCt3FkzTVr6wcVtK+ajHE+xcm5SO77bDeqdJIy/RxjVY58RXbYUtwZhFjZ9iHr+
         TEWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X845xrSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417f3cdsi106838796d6.359.2024.11.04.04.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 04:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X845xrSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7wg6-0005xg-1O; Mon, 04 Nov 2024 07:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t7wg4-0005xI-G7
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 07:59:28 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t7wg2-0004k5-N9
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 07:59:28 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ceccffadfdso1757894a12.2
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 04:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730725165; x=1731329965; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=usraR9Sgjvrl3oPL/nuvCEg/Bb2HrMmnGGynllF0mp8=;
 b=X845xrSQ+cSQXnxrF4XGTzqkzMHt3PWis88CK85ljW0jlmsBh9dnaeK1y3eh3EkzFO
 GwHETMnVs4/qAOF77OLJYRP4Ar9B3f8NMDQWRsogxpoJ01NzDdG7Ust/EI3jT9l1oXuV
 +VMfsJUdUnGCA+YvCVYJrrjmDXgfdNBOGtHAtuSex4uDKVvY8C4rGGicHCyt59aifyXs
 bTBY1VQu5jQH5KrENDBml9cEoWvntOTOer+VB4dbEdRGN67+FQTrh8kYkkecOktFpvpb
 Cp+4tzOLf0cL7H00onxlgQePnHiZNIWAs+azcslIPr+DTEqNHdvj0FhKKivwmQqHvxms
 ZQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730725165; x=1731329965;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=usraR9Sgjvrl3oPL/nuvCEg/Bb2HrMmnGGynllF0mp8=;
 b=hctTP4fRQQIOjtvJFV1Vbex9vLdnlwtab6AdQ2g0bbNw37tkt34HPvQTpat9zM1MOy
 KkT0nUbTwuJ6ctEoXL4PlxbYyCzrQeikfu6w4tpQKfTBmtUYRctR1wVhfOLrvnOElc5p
 DcQHLPRN0My0z76JACS+/Dh4nwidHO4X00tGI/IeRBvGFQXTgs72JRiNyiUgqEgergxk
 oGL9+eOzQgVMpOAsVsd4Y8yc4LHNt6Eu1tvVf5ay2vnZSn4Y9YqibrkkzPZA8y9lDbpR
 2UhYt6USWo977xMPMGBRwxl9ykGL+vXQQ3xFBD3z22X7HGU2hWn5EkbLAdpUID+UinUX
 KglA==
X-Gm-Message-State: AOJu0YyYjLYPyaYWAwwiwCjvIS0rwzhnafHWgd6tDjN2DKqV8GRqNO1Y
 EJ4HHDXFqEs0tJhbwWRDi7DAFgHmu3qSpvMFSKZ4B5hPMFqEitPF2Hk8WOUdcFAaT2rGUCR0UJB
 OBO/3pVY9z+RMr0lr9A596RHZjSWDB73o+cPOIBNnVJ4v/Hkh
X-Received: by 2002:a05:6402:2708:b0:5ca:da2:b2ca with SMTP id
 4fb4d7f45d1cf-5cea96894e1mr12916774a12.19.1730725163502; Mon, 04 Nov 2024
 04:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20241101142845.1712482-1-peter.maydell@linaro.org>
In-Reply-To: <20241101142845.1712482-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 12:59:12 +0000
Message-ID: <CAFEAcA8Uhj+HN0ieYetOwFEkfTb2p_71dp-A2bpc2m=nz2sHXg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix EL3 AArch32 MMU index usage (again)
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: utVVbC3ePfQR

On Fri, 1 Nov 2024 at 14:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 4c2c0474693229 I tried to fix a problem with our
> usage of MMU indexes when EL3 is AArch32. The problem we're
> trying to fix is:
>
>     Architecturally, when EL3 is AArch32, all Secure code runs under the
>     Secure PL1&0 translation regime:
>      * code at EL3, which might be Mon, or SVC, or any of the
>        other privileged modes (PL1)
>      * code at EL0 (Secure PL0)
>
>     This is different from when EL3 is AArch64, in which case EL3 is its
>     own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
>     have their own regime.
>
>     We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
>     do anything special about Secure PL0, which meant it used the same
>     ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
>     where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
>     controlling register when in Secure PL0, which meant we were
>     spuriously generating alignment faults because we were looking at the
>     wrong SCTLR control bits.
>
>     The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
>     we wouldn't honour the PAN bit for Secure PL1, because there's no
>     equivalent _PAN mmu index for it.
>
> The "spurious alignment faults" part is
> https://gitlab.com/qemu-project/qemu/-/issues/2326
>
> Commit 4c2c047469322 tried to fix this using what I described in the
> commit message as a "more complicated approach", but didn't get it
> right in several ways. Full detail in the commit message of patch 1,
> but the major visible problem was that regime_el() would return 1
> even when the CPU was in Monitor mode; this meant that page table
> walks in Monitor mode would look at the wrong SCTLR, TCR, etc and
> would generally fault when they should not.
>
> Rather than trying to fix up the multiple problems with the complicated
> approach, this series first reverts that commit and then fixes the
> initial problem with the idea that commit 4c2c047469322 describes
> as "the most straightforward" approach: we add new MMU indexes
> EL30_0 and EL30_3_PAN, and use the EL3 index as EL30_3. These then
> correspond to "Secure PL1&0 at PL0", "Secure PL1&0 at PL1", and
> "Secure PL1&0 at PL1 with PAN", and parallel the NonSecure use
> of EL10_0, EL10_1_PAN and EL10_1.

The submitter tells me that this also fixes
https://gitlab.com/qemu-project/qemu/-/issues/2588
(a different variety of "misbehaviour in Secure Monitor mode").

-- PMM
