Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp830289njc;
        Sat, 14 Jun 2025 05:59:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUU8wpYm/KI1uKhVdrQ1EVGwJiQHvwcvKY1mC/DRG2kviv68Kwc7hqAPAU/a8+fpmbVWHf6us27zr0xtQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGEIqHN53StSknFvaaTm6beqBPCFgUFWoWVbuj0Nn83LZn/ycWm2zyzDNuPdwNnV9sD0WP0
X-Received: by 2002:a05:620a:4112:b0:7d3:a66d:4f3c with SMTP id af79cd13be357-7d3c6c088ccmr566601885a.7.1749905992897;
        Sat, 14 Jun 2025 05:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749905992; cv=none;
        d=google.com; s=arc-20240605;
        b=Dnyyx306Z4cwSKLfJzcmB92TPNmUxcFIPFXY2exPdEmQb4u+zu9lmJU9TRv5shc+j+
         ZtU0554BBRzhMx9iMrkyFtQmNn9jHygaCoRBGOBiFhrmmT05i/jW21fyogXlyiroO1FF
         vUSbXcv282EI0r2jzmbkmFh2gb4f8jOqkldxs5aNdR0xcVgjdDrGbigz1Q/Y0x9cUchh
         mo3egppqAh/OjnJs/Q7s2BCE4th253zxYHyeez+CclYj1BodLXbCt0ynP0IfCvoYSOAM
         j1jnVvyVKUpj4T4ka7WBM++aEiI0FIpRfXoE5hQvH64m6etlaJRi9aIQxtLcawl/HqXV
         NpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6UKP7Hrw7Tru7DBer6Hkp4mb3hJm8kVN+Z9oWhuo8hU=;
        fh=rIumtKNKXmXe7uFP2GZ6cHOcv4abO42E7afWYFjUFtM=;
        b=fHJ48QPETmfkT7wjOiiWQ5B7LEMXogBTPNk4zBpW8cjdjJdHkpBzf4vlIOG8unXIsX
         2D1Uz+93GPnrMIJwl2jFHPdIMY8P8UfRMoJKFciVRc4Sq32TL/jPE4CGkiGOnLu8LGPx
         0X8aiUlz38q868j+3j5ZRLVECaWsMyL616pWJTV3HZTg0nAohc2Yb7QI0As7uvUdY9Ji
         5Kq8isTrrFOaNuJpydJ3TSMEuNlF9tWIN8KPjoOKgHrxb31Hj3qWgi/Iqd9ChtKWuvHP
         m5rBhzuhmwTODNqcLrrA+qcd23LR2bg9Cc2TwlMLGDf2kH30J6fy7ALRMo+VYuUdfyQ4
         qKsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sean.taipei header.s=2021Q3 header.b="9/+o/iwm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=sean.taipei
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dc29f8si585146085a.114.2025.06.14.05.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Jun 2025 05:59:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sean.taipei header.s=2021Q3 header.b="9/+o/iwm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=sean.taipei
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQQU6-0007cG-0P; Sat, 14 Jun 2025 08:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@sean.taipei>)
 id 1uQQTy-0007by-6s; Sat, 14 Jun 2025 08:59:38 -0400
Received: from mail.sean.taipei ([128.199.207.102] helo=sean.taipei)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@sean.taipei>)
 id 1uQQTv-0006Py-O9; Sat, 14 Jun 2025 08:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sean.taipei;
 s=2021Q3; t=1749905971;
 bh=d4cYSZfaPzfHe8s9eJDdGllyY2pTNhhcb47WbT7nNZk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=9/+o/iwmwXs2JSd7ZDEcquxr+EKXijIJChlknQIC75Ca5JMNPjrrAfoRMF7NwKivj
 rIce6mJTbWO7VUPZIAlnAfj91cKrX23zdYUdhWNHGHtXwvBwYFaOGvGCv5xWj34o0t
 S8LHmHCPuMlKFW7WzVxtDLSCyZ63CAmAH9SKK5FcOUzCapLiFBN+19Hb7pYX51ydv0
 JjLuxGYYzi+x4iVdb8KpOBfz5c8s6JgGLwr7LeIvWtYbtGr8ORLdl/nt/FfFI0DiVy
 JhKB4VVkVtoUE/i2cKHFOJ1qWIb8TKf5WoN2RC3eOr+XQ9+K3yC8N+BekFO8lNAM14
 xbkVLgN4AaPWg==
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by sean.taipei (Postfix) with ESMTPSA id D13CB6355;
 Sat, 14 Jun 2025 20:59:31 +0800 (CST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-711756ae8c9so5850167b3.3; 
 Sat, 14 Jun 2025 05:59:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3EKBMrEgw7hMo7ZkQpb9TX8Fx7tkAcUsb6EWSBLEogy1L/5FUwY0HH1CiF+71AI/lSESAh1nhNg==@nongnu.org
X-Gm-Message-State: AOJu0YyezuMSEqTXRZxVmXYGl52VYdV18WLmH6iJNAtnKx/+vgdn8OH0
 L6IVvgEsXGAi/suzLK3zcEK/OUVQL8DU03tSDDKyvPYLoa2azhrFo6mZV56CZWAtY6ou1pCzO6X
 mtL4ODgAknTyfNwSN+yXnG15j0UCUM2I=
X-Received: by 2002:a05:690c:630a:b0:70d:f420:7ab4 with SMTP id
 00721157ae682-7117545758bmr40382367b3.29.1749905966846; Sat, 14 Jun 2025
 05:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250613.qemu.patch@sean.taipei>
 <20250613.qemu.patch.05@sean.taipei>
 <3aa8de03-911e-4906-a0c5-5b8ea269ad28@kaod.org>
In-Reply-To: <3aa8de03-911e-4906-a0c5-5b8ea269ad28@kaod.org>
From: Sean Wei <me@sean.taipei>
Date: Sat, 14 Jun 2025 08:58:50 -0400
X-Gmail-Original-Message-ID: <CAGvOXg_VK0+DA_OHy0oWGC4QuL6icFd7yabLKeRzQMc8OpU-rA@mail.gmail.com>
X-Gm-Features: AX0GCFvnZBRVh2FkSeAuh9DH9hIL6J0bW_SXB6nBB0mjrV595eA0Cg3I5V_OBho
Message-ID: <CAGvOXg_VK0+DA_OHy0oWGC4QuL6icFd7yabLKeRzQMc8OpU-rA@mail.gmail.com>
Subject: Re: [PATCH 05/12] include/hw: replace FSF postal address with
 licenses URL
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=128.199.207.102; envelope-from=me@sean.taipei;
 helo=sean.taipei
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LYdpQylFZkJ+

Hi C=C3=A9dric,

Thank you for the quick review and for suggesting the SPDX approach.

On Sat, Jun 14, 2025 at 1:36=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> Instead,  I would remove the license boiler plate and add :
>
>    SPDX-License-Identifier: GPL-2.0-or-later
>

Before we respin the patch, could you please confirm the scope below?


1. For the two headers currently under review
   (aspeed_i2c.h and aspeed_timer.h)

   I will drop the multi-line GPL boiler-plate and replace it
   with SPDX line, while keeping the copyright statements.


2. For the other ASPEED-maintained files

       hw/*/*aspeed*
       include/hw/*/*aspeed*
       tests/*/*aspeed*

   Would you prefer to convert them as well? If so, I'd prefer to
   send a dedicated patch series after this one.


3. Replacement rule:

   * multi-line GPL boiler-plate
     -> replace with SPDX

   * existing short two-line notice
       This code is licensed under the GPL version 2 or later.
       See the COPYING file in the top-level directory.
     -> leave unchanged

   Is that correct?


4. If we do the wider sweep,
   should MIT-licensed ASPEED files also be updated by replacing
   their boiler-plate with SPDX identifier in the same patch series?


Please let me know what works best for you and I will send v2 accordingly.

Thanks again for the guidance,
Sean Wei
