Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2636812njb;
        Mon, 3 Mar 2025 06:11:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXicc188dqbAw9Ioof7hfJPVnGSRFpgRQz+GHlGKQdMq11pC9+KpfnlFNf97YjGlxiUREh4tv8Rm21ayQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFkD96ifTeWz7ZtYVgqDa2dhOIy625kbheIIC+R0O7FKxZ1mnL3yZlnJpc+FEgwy9bubeDG
X-Received: by 2002:a05:622a:586:b0:474:f991:b3a5 with SMTP id d75a77b69052e-474f991b599mr9878981cf.6.1741011073395;
        Mon, 03 Mar 2025 06:11:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741011073; cv=none;
        d=google.com; s=arc-20240605;
        b=L6U17y9CEqd/O5JaRkzGfXUnOLbOv8tojqEO6Wc9hZPFVx7Qmgiw69Nq7I8xUdgKqv
         fdYPZIjx5YWAXiSO3C3WQmG8T5SOxoUwh3GIXhLJbdI6D+Uvek27BJa2dNoEHgFkRaVj
         JTU28axE2xkbvSPvL8/MowXtxurSRcKNCtq6068XODZmPANAVfzMMcCIzBw8tn/xupTi
         a3ArFJPKmXtaIJSnHkdTbGgTmezWGM7dYf/0N05zEkErt1rX53ksDQehk6SDnw5PG38p
         /XkDDyfGJB846yMKaCyQLENpx/C7sD3KmpQhVQmLENAP+OFctPWEM7WnBioIfaSoJG7l
         5DAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cIgyhJ5i2vtj1OWVRMetShaA8mHEg/S5UKs6I4/1BJg=;
        fh=dl04U/XCGOcTmKuJafuBOkDLPVWwbWIhksXAKsrmDew=;
        b=V6YWJu8x9RjNWJrVYhEr2Ob5Y/As0SU7I/aTKP3bDQvS0vS/WXrbS4nN7NC/Xyzg7y
         hdpexpnH5otvSjiAi8h8IT6aVJdv4PbA2UT4+8+NyHv/N3/cr0f36AFs3WmZ1yAKuJ0V
         Hh/Q7kyhTWRUREaHX3sYCBXPdk8g5+zVLrxmgESq+4a4p/a/U10rcIxVUFIxJuCnb5Xf
         SDmLBPhwC3I2upO6vTAIl04NmO7D1MzZBYLPRrJUEP0ELUunY/E+IVCv7TCu3dae4iZK
         1nBE6eD8n75QZcf+sbjjB7CHxsZBqdYDh3rpo8sx9U3UeWu4IdK9mPZY3EISBANYDJrS
         60Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9hrX3Qg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4746919da0dsi89897611cf.24.2025.03.03.06.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 06:11:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9hrX3Qg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp6VO-000095-BV; Mon, 03 Mar 2025 09:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6UV-0008DX-5n
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 09:10:01 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6UR-0005zQ-3N
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 09:09:53 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6ef60e500d7so36217097b3.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 06:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741010989; x=1741615789; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cIgyhJ5i2vtj1OWVRMetShaA8mHEg/S5UKs6I4/1BJg=;
 b=N9hrX3QgW2h69LdOiu8tvkPW/4nZuV28Mw68KdXp4NLJRW5T5BQQZWZH5UIZeirZJ+
 IrbQ3GFewRqWb2dJnqeuAvwSGtk8F2ttPS0AIi+mzabLQOMOQepx3XZkCS0fQEe6gQDA
 4n+BryR2S/5rpDhifTy7l/ZGi0OM8ERIoEYqIna6GCUiTy1tTqgz4WIfRbNz4le7j0ZX
 H5aJ0/FXMouZpV8tdLoWZiWptyrU5U1bVMBTKakdjUS3q7RczkLtao63J4YkGdRkLrwb
 mZwzG2xm6BCnl4pF1Z2vkJogoFDt2sYpb/PMbHx95M6qQ/sQK8aM0T2rgkZV+SZwCbfa
 oR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741010989; x=1741615789;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cIgyhJ5i2vtj1OWVRMetShaA8mHEg/S5UKs6I4/1BJg=;
 b=g1V+YOpryQfYfs/osrLv5R/zTJp9AHMlKnXvftL3HhvyMRfgIlNWN/l3C24ugwvne6
 bci28G/+vyVrNa57gcLQbRfKJi9CdNq1tXUI+37GdlaOkC0r7nEjJoiFUAcdiybEunHK
 l8SkgZ5ig00xEA/CDwqfmqSOjQMTIhzCg5hEwHwA5WK2JHSdEnHgUR3rw7hhTvjjzm3e
 ZTZn+um+kmfJsh/47LwYjI3Sh8CnusKQUFSSB5QKirst7YkG3suB48ljbY1mxZpTmz9M
 J12SfKzsQLXm1CEMMNni7lMv8ML1YWAhvcoOiBr1jScharp4qU7cxUDQPTskUuISUdv5
 G3/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwKzpOrVb3QFNlTQwzcTs1lcrCB/HkAfxmJK/R9/0p0iBP2OWHHX2BX7NRmuGYP6rfWh9+PtiDmQ==@nongnu.org
X-Gm-Message-State: AOJu0YyMjG9Z2qMi2I2rkwFd2DmHeJdp8C6G1ULCJE4cZrbL+fL4uI6m
 sF0Pu68+CxUFIUx2JOLgzM7SSS2X3RX1OGr17y3WXN7Lg9qXCUHpGfcPC2d2CnSbrx5itqroAcg
 VaeT+Nits5ptqEA9/on2j2dN/vlu1vwC1g/bhvQ==
X-Gm-Gg: ASbGncscZij1K9oOE0hXV7BQMb2Pz4rFaiBX2D0KMhiebzx3NSvpI1qLB9uG/vaw76s
 GiJHN2hSca4Ndvat+c9x18Hf4n5vH16FCqweLnISJGiCvVMBJ1U1edR+HC2PmkpKzqiN0tA8BiY
 h/s3yIysXHBKftgi2AziA4amWRkOo=
X-Received: by 2002:a05:690c:4c12:b0:6ef:7d1e:bffd with SMTP id
 00721157ae682-6fd4a17166bmr162906027b3.37.1741010988574; Mon, 03 Mar 2025
 06:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20250221031034.69822-1-jansef.jian@hj-micro.com>
In-Reply-To: <20250221031034.69822-1-jansef.jian@hj-micro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Mar 2025 14:09:37 +0000
X-Gm-Features: AQ5f1JqKGoga6YGxJGBZ1VmYHzV9G6tZXuEQEi2Vs2kLxZRYgambW39F-vcC05g
Message-ID: <CAFEAcA_tmXzG4-P-VtZZqFkrcra0t33OEm3OTCkExNFDu7LBPg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmu-common: Remove the repeated ttb field
To: JianChunfu <jansef.jian@hj-micro.com>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0723mEOaOYVj

On Fri, 21 Feb 2025 at 03:10, JianChunfu <jansef.jian@hj-micro.com> wrote:
>
> SMMUTransCfg->ttb is never used in QEMU, TT base address
> can be accessed by SMMUTransCfg->tt[i]->ttb.
>
> Signed-off-by: JianChunfu <jansef.jian@hj-micro.com>
> ---
>  include/hw/arm/smmu-common.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index d1a4a6455..e5ad55bba 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -110,7 +110,6 @@ typedef struct SMMUTransCfg {
>      /* Used by stage-1 only. */
>      bool aa64;                 /* arch64 or aarch32 translation table */
>      bool record_faults;        /* record fault events */
> -    uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */
>      int asid;
> --



Applied to target-arm.next, thanks.

-- PMM
