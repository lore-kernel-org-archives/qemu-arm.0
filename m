Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1180271njb;
        Fri, 9 May 2025 08:27:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOX9wQDwxxOMKrhcelDngL/qndD0vxZbIMjfWg3XNI6699KXb7iGwPc7Bd9QVAu0JrX5kiJj+thggHFg==@linaro.org
X-Google-Smtp-Source: AGHT+IH4hyal9cIi9FTbfs6KRq1ziOQStzGFf7q0NUntlwA8W8NVS2quagSDpbxfZVBOYrNlQYyE
X-Received: by 2002:a05:620a:4487:b0:7c9:4d4d:206e with SMTP id af79cd13be357-7cd010f18edmr606673685a.6.1746804474997;
        Fri, 09 May 2025 08:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746804474; cv=none;
        d=google.com; s=arc-20240605;
        b=kQiD9xtaiZwVYxYLDxNgRjpfL6qjD3p77CF2lrQZSs2F6WX4mlQc60Ea19r951+rYZ
         Q/MSYrfZAtdHlSqn7TjfIgkPHZZWZSImjbAz0K285pw7SMeA6c2su9lF5tSrGPf5Bhu6
         z0qJEe/nO3PQtw7wZTKsIEjZq2knSvKG9o661igtHP9btS+r9V6mOnLw3CFwoQxA1rEd
         CynOVz13Nbm2G7XD0x1zUfXYP8E0Z/6hmiq1jN8mHzJdsEH7HT54r7oRSnWq0rBOZERN
         BwX/61nxYr0jkeRu0wFv1wZOAo+7Z+tfPcqU/Pb8W5ZDBaYAWB0DwyIbWZd1iO5MCCH6
         8bUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fo9OcAbrNLsD2a7f50+Dm7QG8zYmPULAcM7xDP6trQA=;
        fh=FXY2km0ss2oRZq6xYz6fU08HIb34qyzmox/BLlOb+M8=;
        b=itdZFWhouj6XifaknnMYwEhhQaR0laSmmzZw6hphzqzulRjNP6DSJj5TWiiHKT6djA
         c+NTaQs7iDLo+MQa3i4UL7/COYlwmnl0BKqt9+lR3Y2DGR/tAPUZbWfa5hHQuCqrRI/i
         a8XbKtQcZtUad5T6DQVZdB+juFAxz400LlS4/PxIboSGzDFpXkSmGmRBUwf/SCk7ihAJ
         6tIlPCGTy6mz10DPad5iER65u2eLNxL11poL7GoHVzB8lTpJkkBoXUgd8F+SFRGbYnH1
         cMMmxpf9QSLWKzw7+j4HGvG/Tkqb69RP5xOmJOdHBZwzn7m8LJKwZ96WY9XTqrf99AZ4
         4glg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BCMQ3KY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fed56bsi261132985a.460.2025.05.09.08.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 08:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BCMQ3KY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDPde-0005CR-2Z; Fri, 09 May 2025 11:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDPdb-0005Aq-Og
 for qemu-arm@nongnu.org; Fri, 09 May 2025 11:27:47 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDPdZ-0008Bp-TY
 for qemu-arm@nongnu.org; Fri, 09 May 2025 11:27:47 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e733e25bfc7so2291764276.3
 for <qemu-arm@nongnu.org>; Fri, 09 May 2025 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746804464; x=1747409264; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fo9OcAbrNLsD2a7f50+Dm7QG8zYmPULAcM7xDP6trQA=;
 b=BCMQ3KY95qESfmhEFFo7it3m9SAF1RuI+8VpRXdyrczVt6y6zGSvQErNe7SIk9dwcB
 zK5brfeuOLg6FZiwTog9ys7G097K1OSO1PprZftMlw2Djoyd08csYNY8GesfaJykViHn
 VTtH16uFH+yN9syyPc+FYSojLqsl+mLujAd+B31yrkjg4sz8jwdfmLT+vnD6wPrMrHe7
 Bqng98pdoc9iWNYych3OZano8BEv/10HbTHsWBCXLDc40dxEK2HEjW4s8aS3thy1KW7L
 CJQ3CCwfN65cn3vp/IXZ5wPtXpHM6TvfPWDQCnkafvfxLmYvqOJ8nIRugx+UkTy6pzBx
 D1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746804464; x=1747409264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fo9OcAbrNLsD2a7f50+Dm7QG8zYmPULAcM7xDP6trQA=;
 b=BDLHv3i/WH901MLr3RIsUIOvlYVSI2gBfx7tyhwQ0UaqdujnyLgRTKNLOImXX4bbY+
 RX4v7JBcRr2c41QHLPfGSeA9WR/5/tnp6ivFKTWc00TBlhvjiPSchIuXzG0CBPZkxZgm
 lGukMXD5MjKxHTSg8c75kW8ROlWCHCGDVxx1tuR67ca9o/t7vM+tW+SesRVQMJ9TFdVt
 VlIogJHhDPlyZulwB2c00bKEmOteJf6glC7DQjMlhY++6uozO44LWApBsieZQYKJBSjA
 f9dNygoa0xdnuXfoHCcA6/bTG2YXl2A71M+SLJPf30WMUYzq5aVh+WuA8JyzqiECc9P6
 cHxA==
X-Gm-Message-State: AOJu0Yx5Hlmkp3uUydeb+1e3oHeqTiIrt0Wle1FpC6Rd9qULpDE0YhJK
 VabfPjlor9s64X9Ql/jrwSEDvarTdSkIjNr8PulFia/DHVNdqXDRzfUboJ1DkH8DJOTYj7GBGtc
 02vv+7r/ee6iUAqEEF9QOSkNPTbvmTjwDNSZX+w==
X-Gm-Gg: ASbGncvVtmlYvHdqVs8HWpaQcj8gVn16jlpuIWLPKUkdRFkfJTMqq+4Ch+vR2GI+nVZ
 2gBeyZZ2JMgP6a9p3sPh8EwNVC+uZP405Y4sR7ZIDefNCiyp8Mf+gJMixY6zU0ltWdk5MFl1Rsu
 qCdZU0ICazC6MAs6X57HamklI=
X-Received: by 2002:a25:7b87:0:b0:e78:ff9f:4935 with SMTP id
 3f1490d57ef6-e78ff9f4ad8mr2627217276.34.1746804464531; Fri, 09 May 2025
 08:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250505090635.778785-1-clg@redhat.com>
 <20250505090635.778785-23-clg@redhat.com>
 <CAFEAcA8wmqAtcgfPvyMY8nujTWNCSC0DYO64aA5up-sTWCr_jA@mail.gmail.com>
 <ce9162f3-a3d3-4a76-a261-af16384ea82e@redhat.com>
In-Reply-To: <ce9162f3-a3d3-4a76-a261-af16384ea82e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 May 2025 16:27:32 +0100
X-Gm-Features: ATxdqUEF2muhkKyVPw7UZ9BWrBBl61yCtzy507J8xOQVAFZeS_ItKXuOX-STwSQ
Message-ID: <CAFEAcA-OJmmKgLrd6P-+Kb=-Zh52GL0y+vfNLrivM97T4DDDwg@mail.gmail.com>
Subject: Re: [PULL 22/23] tests/function/aspeed: Add functional test for
 ast2700fc
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Steven Lee <steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: CvPABodmxprp

On Fri, 9 May 2025 at 15:32, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
> In the ast2700fc machine and the fby35, each SoC has its own memory
> region and, since there is no need for the global system memory
> region, it's empty. But in some places, like
> rom_check_and_register_reset(), it's a problem for the flattened
> global view.

Generally speaking, board models should set things up so
that the "main" SoC for the board uses the main system memory
MR, rather than creating its own empty MR for that purpose,
I think.

But separately from that, it's weird to get into flatview_lookup
with an empty FlatView here. We called memory_region_find(),
which is a wrapper around memory_region_find_rcu(). That
function doesn't make assumptions about where the MR it's
passed is from: it walks up the tree of MRs to find the
root MR, it looks up the AddressSpace for that root MR,
and then it gets the FlatView for that AS and calls
flatview_lookup(). If the FlatView we end up with doesn't
have the MR in it, what's happened ?

-- PMM
