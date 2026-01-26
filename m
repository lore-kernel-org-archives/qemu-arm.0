Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF7FD19502
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 18:45:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkRaM-0006ra-Vy; Mon, 26 Jan 2026 13:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkRaG-0006jw-8h
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 13:45:08 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkRaE-0003rm-H4
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 13:45:07 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7947072d0f6so5366987b3.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 10:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769453105; cv=none;
 d=google.com; s=arc-20240605;
 b=bhRlY21/CcRG2ilWM1PlfL2ytYgKwE8ICkhpx3R2FlsVs1XQFeFJ6MVns38tIdB8tC
 bieC3sRKu/WLIqlN+cPZ036LcA9cHmz+3Or2zMH2SDVz+Xkn0tATc93/CWjTbrfub+wW
 6HeWehCatRMV/XGnSAplUAxoXFlzoBWGb8O3wOQWa+AhBZLWfIDuqjYqx7RM97oShVOH
 RjvB6ut6MsDd9MMQMl2kFg3af+x7skhFntKlAe2zNKI0S77XorbrMvUTQY3kshEfAfqZ
 7JR3HnzEpitzx+PRFg0sDaKeBJa7eiWBwF7/t2NzqI90mTPLghgO3xi7h2+j+vbYdnXn
 nqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dx8DOA5ERXO6I9VP5BJw659kgsNsvOpRIe4S1zXDoWo=;
 fh=i0Br/oy1jURvd1sjCGW2OA9ThCo58GEi+jDHd9jRW/Y=;
 b=k20msUorYzZyJ5SrYKUPqG3YTI40pzej/HZDep1KSi+XPmMhkK1qDIUoH0VlCrkXyi
 nRobXDe+7uVS70DTJTVhY8T8dG2IvJzfFmFXGPOtm4I5tpBlYeGuMbYSeUR/OVD+nqZI
 TGuHmrriiXIHpIByIOnHtNgYMdJxmq2BHKEeHsapBILz2xqzJ3xo3rkuf/NOu1q4Uc4a
 dLNQXrSE216P0bzRFvk5/pur+UtigcTH+Ao1BE/pvV050D2uhs2qH+eCApyfBCgXEQUk
 ciKT8PmMQdEQIlf0GaSk/7Ynv3DWMYUYzHgEEAqH/SAdqD9OvlHyFLDci1gJ4Cvoe9Wq
 Xsyg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769453105; x=1770057905; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dx8DOA5ERXO6I9VP5BJw659kgsNsvOpRIe4S1zXDoWo=;
 b=AKt9K80xsckd8mbaA29yKTk4tDPv6PowH45bK3kzh7pkPAZERtdrv+d0/FFV/U6nRZ
 McAoOEwj+vH9bUouihEAOqdDJQ7ufKmRkrQI2YIkeMnp2ETA/3gtn+kVeZFfkH+SOpIq
 XOYwIDHC1qOzpmIAvBjMln1L5z7/cbdZOZVfZ4XLUsofgqYjOEqORHzhhSzaiOz1Yjpx
 Ad99n64VRxAYOVW1kFlV5UTG97xh0sHiRmYKc9vgi2boMEiXXEwDml5cIsZBrfsapaBt
 u/T5YOU8m+dq4M00hDnXTWT+dD/oC7VROmQ6BkGyDOE15zq/76ZvX29YgyBkWS3pgEoy
 mu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769453105; x=1770057905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dx8DOA5ERXO6I9VP5BJw659kgsNsvOpRIe4S1zXDoWo=;
 b=KcfqcS+UbXrBlWW7vzXLeE3q/s+1qEz7ff+faFgMksz3+gpEqXnWc5Zlcoz3gbWaOo
 RZ7YEfn41VT+yEg1SOmqIesYSeWO3Nl4DrXNmElCHNREzjVPOUTMpOQbBwu/XAa+eHtd
 tlRlTaFFypvI5mALRFgKiaLFwqRT7B+aRDxDeX78ZMSChtthGfjWipTgKOn228H9mEZR
 x8v68xE4zB3iGX/a+2dJhR9jjNzqRNJJvOD275hn7ll3+nvDqrV5PxkjQUeaZopOMK3T
 u943msh+cQxA6MCS3Tk3geavONKRPZ0NnxZzLNU8wDOGLsVlnZZlzM+Mmo35AbO57XeE
 i6lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOZt3IaUaeY2bzhtrJmx8SDfJIUzrQwQR95m4D4U0z6wzgr2I1Kqdu94xz/GVgfbehWg8UAX6z7A==@nongnu.org
X-Gm-Message-State: AOJu0YzSKwYNgm4qcUJOjRzertWepEs83vB8miVa/LxDd0d0JsnrS0BM
 XRzqd/2OAEXicJJ1OsjCEMN3uE7jGS3m1OZM5E/xHBjTaP0VOpI788OzrPvDEqWTLvuK7q79Gjx
 yp2KiJTWNozKA8H4++Tunyo0S2+GdFaeN3yoS5E8m5Q==
X-Gm-Gg: AZuq6aJ4hPcW99nuTgnhpDn+iPQlNDj8lk+eCtabQMaDtL5l/VscDlXQcedi/+mNdOu
 2TAvuUY5YDGmYSSCqkbcde0CvJmp6FqzXLmZ5W4/j3slz/7bbCrYq1pdignS2ufHncJgIWk6TGV
 YPtF8mvnrKaOkP1i5sSrDR8gzeNrBtc0PIC9265JPpZ83FRXOBIpRacNkliyW+nxMBqLp4dmojo
 135TcpiwnY0s2D0q1ITA3Mvr2JPOh5ziF4HwhI0C2QSlQ0FmShgg+Q1sD8YeJy1JZrWSg==
X-Received: by 2002:a05:690c:e04f:b0:78c:6a2b:c6aa with SMTP id
 00721157ae682-7945a9cf7ddmr37881357b3.58.1769453105232; Mon, 26 Jan 2026
 10:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20260126141820.719492-1-clg@redhat.com>
 <CAFEAcA8xQmUa7DyR7+Nw255e_DW=uzZ-gQT5G6cd-uuWgQBaUg@mail.gmail.com>
 <e8a6032d-cf06-46e5-a7d5-c2e9b8d248ef@redhat.com>
 <CAEEWBQPci_=gDhJS8m7erJeYu7C4-eioD0ks=_WReFQiOVDNiw@mail.gmail.com>
In-Reply-To: <CAEEWBQPci_=gDhJS8m7erJeYu7C4-eioD0ks=_WReFQiOVDNiw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jan 2026 18:44:52 +0000
X-Gm-Features: AZwV_QjoFp7D_MD2apweAR6D1b3Ck-4VL7EoNOpKkUR3QmTn1xijnS34oYHcsJY
Message-ID: <CAFEAcA_7y9uAznaY+PAA9LpMOG3NSiNKFoQXdfvZKyrsms+C8Q@mail.gmail.com>
Subject: Re: [PATCH] hw/adc: Fix out-of-bounds write in Aspeed ADC model
To: Elhrj Saad <saadelhrj@gmail.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Mon, 26 Jan 2026 at 18:22, Elhrj Saad <saadelhrj@gmail.com> wrote:
> Is there any possibility of making an exception and assigning
> a CVE for the issue ?? (It's my first ever found vulnerability :)

Hi; this is not a security vulnerability according to QEMU's
security policy, which you can find here:
https://www.qemu.org/docs/master/system/security.html

The board that uses this device is not one usable under
the "virtualization" use case, and so we do not consider
that bugs in it are security issues. So it's not a
"vulnerability", just a normal bug, and we would not
issue a CVE for it.

thanks
-- PMM

