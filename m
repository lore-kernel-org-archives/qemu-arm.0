Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1543514lfj;
        Tue, 3 May 2022 09:52:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVT7+1bUu1S5FH0GKGRocn+xb8N848c9mP7zgO0c47U86e1QAibsCyIrwVgpmcGh3T3ync
X-Received: by 2002:ac8:57d1:0:b0:2f3:b340:1e2e with SMTP id w17-20020ac857d1000000b002f3b3401e2emr1629485qta.52.1651596764829;
        Tue, 03 May 2022 09:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651596764; cv=none;
        d=google.com; s=arc-20160816;
        b=tCCnlr8CQ5POgYfueosQwQHh1t68+NJdCdmX3Prw48mMhl+eLFwAHce9WI84dJ9jZk
         dogHPpaXYht2xGgz+6WrPoNwN1QTcAx52rRAY4nGhubnMw+71a0Ok0dHpgvMlUjk64as
         i7R8rWS/hgtOHEj0WvXa3i5Wya7bNKlBkA5gCbZKyC7zPFZkzxnl2rzhnGCbImiXaXIO
         x2XET6ZvaOcb8NofGj+XQD46iCcuBChGtkFsLXfikOhDppK/4GNhzU4PxN8yp3hW2iei
         SnA1pZ44tvHO26Z0YtiheH8njZVn7haZQt/yXcKpGeLjqwvJks3CxXr/fwU11j823+cN
         9KsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fcnhCr/E96zXHTPF83KUB0kJu3XBEfU5kspnumlccpw=;
        b=qNsxo4CLLrLs6PJO1Bb9Ah9MXN1yQpz0vBwOgQdcBXkm+7jD+4YB57Z6g6u+ihmXkL
         I7V85eh5zk8aH/PhmRvnEr+qzqtyb9id9H/LlfBvVSNVve5+1YWbxU6AEzCyTSDjpz7w
         fs+Svq8Ool4HaYf+5smCJMS0YJp0BSO8fg5nXUvbz28zRFaXDO/H9EMZhjcIvbdsT9wv
         mA+9+QMNR7mlQ42plaoCq0OsoD9fj6TIqx5UYpb+owRBHKwbTcjP4jAwWMvu9oLr7oJg
         aDQPrLegrqX2+ASn6tEkLV48Oty240tWIFo4a1ZvEYCnP+500g1IlH8HjGyT06CeTt3+
         cvsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MumZue3c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf12-20020a0562142a4c00b0045a87bf9ba5si4396218qvb.173.2022.05.03.09.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MumZue3c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvlU-0005gu-9u
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvjF-0003LY-63
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:50:25 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvjD-0005ya-HR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:50:24 -0400
Received: by mail-yb1-xb34.google.com with SMTP id w187so32100478ybe.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fcnhCr/E96zXHTPF83KUB0kJu3XBEfU5kspnumlccpw=;
 b=MumZue3ctR6gj7uyJgT8BbTQhFDHmzc3Gej869wdjzK+lQFzAWhYPWbdB2wLAZRSLi
 27OWvYco67LBdkUYkQchVh7+LkCWtWQ9nFRsmex1Bym+7x6esCnZxrk5eOx03LfoelUH
 g6msrnLvmQA/hyVtqGV8E0Jv8vWMG0A1hHq9WF31zI8ZDYVZfm6n5UfHc0UsmcB4XnQG
 lzq90LhJ2FRvUh5dmGOUu4K9Grfl70ff2AahIYUu74gJ8bCVcP2kOjRCbUJMldeToNWn
 V1m9XdnhLJ8ZYVSN0I3WZYGZlUhs3Tg3/0yvNd/vc5wpmUZkGBaxBNoElU5aU5jKtVW0
 N2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fcnhCr/E96zXHTPF83KUB0kJu3XBEfU5kspnumlccpw=;
 b=vAgKkHNOBFC+CvX9Psj48lyzhmjuyl6w5S+sc1gmkMqwtL4q7RX0gwXLVCmQelo4hv
 jetePB3BbUrO/6TW9MWfgpTneXey3MSZhvOc+rn675T6osulXpGlG7VdKIzRowi+8D5b
 LT9pbW8imrQBE2PfvYfb/ldD7RdhzEsRXX2JtUUSWN5/tXBvYJTFQF8TDx5gDknVkthm
 yndz3jdgp0copgsy9Loa6UXPvGP+oJf2en7c7Zo5oG2P2bT45IBw9ukw3zcxAdpJE7bz
 t8UVAyr/U/UO3aJfzK02FEp8FjYP/vO1NtMq4Jw+0Zzc11m7jqFHG+Ey7zAqiIfvD9HZ
 a9Rw==
X-Gm-Message-State: AOAM531pigdd5W8eHdBD1CxrLEEmgm8zdvGoVAZcVFGDbJKJhi1NfYV2
 TKnXPa3YsmtrJCFs/pBGi36p4Xm/dRZAO6mB/d5TUA==
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr14192082yba.193.1651596622384; Tue, 03
 May 2022 09:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-21-richard.henderson@linaro.org>
 <CAFEAcA_i_+MrxapQ821zWBwO7QKs2k=06xQRs9s6ojRB2CyxsA@mail.gmail.com>
 <731de8d2-2a39-862a-39fa-d208d9836364@linaro.org>
In-Reply-To: <731de8d2-2a39-862a-39fa-d208d9836364@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:50:11 +0100
Message-ID: <CAFEAcA_-ts5cRCyk03T4JEMS-5kRf2iJcOEOpgkZoerjVjR1fw@mail.gmail.com>
Subject: Re: [PATCH v4 20/45] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G/fqawaCz9jm

On Tue, 3 May 2022 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/3/22 09:34, Peter Maydell wrote:
> > "set CONST on the cpreg" is what the code does, but it's not
> > what the architecture wants. In particular, if the EL2 cpreg defines
> > a non-zero resetvalue then the EL3-no-EL2 CPU will get a
> > "reads as constant that value" rather than "reads as zero".
> > CNTHCTL_EL2 and MDCR_EL2 are examples of this.
>
> Ah, I'd missed those.  I guess I need a third bit to indicate keeping the resetvalue, for
> e.g. VPIDR_EL2, which is why the code is written the way it is.

Or you could just treat VPIDR_EL2 as a special case and keep
the cpreginfo we have for it for the el3-no-el2 case.

thanks
-- PMM
