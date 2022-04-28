Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1594249lfu;
        Thu, 28 Apr 2022 02:29:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqi6L9OtoYWtcwIe+cCmGzjQnTNKS9mo4Po8dGD1lnbuzSkbpSuGpj4MpB6WyuetI1qBzv
X-Received: by 2002:a05:622a:1a11:b0:2f3:643b:a61c with SMTP id f17-20020a05622a1a1100b002f3643ba61cmr15898034qtb.260.1651138159151;
        Thu, 28 Apr 2022 02:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651138159; cv=none;
        d=google.com; s=arc-20160816;
        b=g04rqcA2AYd7ljBPPzXANBbrEQEOM950/VqNp+9y9urTFo3F5ceK5GfuaG81FVeOlR
         ip4/KNSWmNV/U0I38X93gjeqxW1swvNdXJEZygPv22SJ+1nwD++T+3nliwvjgp6Z5YL4
         KYNaiNTNkV83urvs0UFmBrZHhFulrcbmesDI+rfq24Sa4HJV2ysaA9Q9ouUuXKsBNT8O
         9uNwWR9hu5O44z2ZWCvxnCNfVYcOe9CjeTHQyy6jS7co67cnehUKw8EWYVKMcPRKs72Q
         tXx6+O/N3jc4qJOzOg715Ylmd1L1uko0DRLAjAokIAjpJq16z6LuB4ViD2FK+RCAvsH4
         zKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7pyirAlfLpBd8K7GIh76DwxUgUVrNZyNC7mYGF35zU=;
        b=SRSAaLCjpENs4zIjTZwbsL++rc/ONGNM/2qQ81nFoewcRFLc3Vo29W2lPvA4XK36sE
         tWQelkbHz7+oUuh5Ut7dQwZJAq3RcH0ifXAuz5oia7UWVVPRNDBTVE8+7gve1siVAdbM
         jfqU3uJ+YdisJMo5LK4uMt3/dfAy2AzVInY6aUqqI4UVzz5mEc0X76UpAsLFT7Sad5vY
         a0wixMz3P6/EvZS3V2s9joequkgczIOWSLTAidQH2ztvu1JZFz9qeB/GPpmBZvTFopcl
         TwPGfo1MC8smVX9SEz0QIRGHOeB4ZjGb6TKwA+yuo+yCo3ttAT1Jw0mVwDgUzMYMd12v
         61pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yqGFR9li;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0562140da200b004563ae5f358si1552136qvh.291.2022.04.28.02.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yqGFR9li;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0Sc-0003G3-Ih
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0QR-0002Up-7x
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:27:03 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0QP-00058d-Gx
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:27:02 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7c57ee6feso46178067b3.2
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M7pyirAlfLpBd8K7GIh76DwxUgUVrNZyNC7mYGF35zU=;
 b=yqGFR9liL/bWhiVh1+wtzqa9aH0sUq+5lqpXTk2bMRA+/RIr/QSb1p+kcCDnMxWpM2
 GZMkZmFsPIWTOnd+BKjOZ73IN6UIB2euBLQy2rmjGGlHF7Rtt8iT5OZ7ppIPjerfhXjG
 gzalzAil2Fy+s3BEd434ytMwjlrKjKL4/0Axaav7pF+sFP5p8qhjiN7C9lvpzy8MZzma
 fT6cQJl739ebj4bn4gdVTTEfRzzjv4V9tvBhFZMXKSbJ3ut9vFOLKfza2SeZQMXIzGw1
 cvepSuO2KiW9bdGlCTWZNazUbI6v7EHmyXWSCEQ4SxOs9CLbHSZzhAGgqQDU3Oad3kZH
 qYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M7pyirAlfLpBd8K7GIh76DwxUgUVrNZyNC7mYGF35zU=;
 b=5DgcREMo2JYG91t+ywGg9uAeK/Eo4bKFEjEJbxSPKzSxLzhr3CA3Gl0PL71REhJAHS
 PdbhdDnRDzDvJBbYY2GJT/UyUbrZ9mtt+nOIw+yrm1MroKN3fkOEYe0GAT9l4YKsZmsd
 S8NJyO5wHVTi65pbvpl+6UPldECss+LrlQS6N2nnDaiGGWvyENEhl55sCxXTwYzL1OrF
 wO0r6emyRrhV/55EJkO+Y4v2x44Q8l96kQ9oWGOyYH3WPurA8kFODmBff0fP+M2bcKTV
 Yu0TpdRP99giJBoiItpIYB9x9G16tlhwYNqze5vdD7QcRiazdh6wmRtHnG3jCZrIFk3D
 n1JA==
X-Gm-Message-State: AOAM533W1kp2f1ZWPZt3acTwtuGKJRDK6B2G9wXJolK4PmQ3zs8TJ/HA
 Cj1831vK7zrg0bZOZSMUnyb4f+aR6KDJQToJAd9b+A==
X-Received: by 2002:a0d:db4a:0:b0:2f8:3968:e808 with SMTP id
 d71-20020a0ddb4a000000b002f83968e808mr9103306ywe.455.1651138020161; Thu, 28
 Apr 2022 02:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
 <20220426160422.2353158-4-peter.maydell@linaro.org>
 <4cd9121f-6c9f-f461-836f-a4b1ba8fedcd@redhat.com>
In-Reply-To: <4cd9121f-6c9f-f461-836f-a4b1ba8fedcd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:26:49 +0100
Message-ID: <CAFEAcA9jzRuJJAXUckjD4L+LB6-UXBO2WDET2Y2YYQBBr62MLw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2
To: eric.auger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CPpCm/skhfee

On Thu, 28 Apr 2022 at 09:37, Eric Auger <eric.auger@redhat.com> wrote:
> On 4/26/22 18:04, Peter Maydell wrote:
> >  TLB invalidation correctly removes all TLB entries matching
> > the specified address or address range (unless the guest specifies the
> > leaf level explicitly, in which case it gets what it asked for). So we
> "
>
> unless the guest specifies the
> leaf level explicitly, in which case it gets what it asked for
>
> "
> This is the less obvious part as the spec says:
>
> "A TLB invalidation operation removes all matching TLB entries even if
> overlapping entries exist for a given
> address."
>
> I failed to find further precisions about the range invalidation & BBML.

If the invalidate says "level 2" then a TLB entry that wasn't
put in at level 2 doesn't match the TLB invalidate request and so
isn't removed (whether it overlaps a matching one at the same
address or not). This is defined as part of the behaviour of TLB
invalidates which specify a TTL, eg on page 142.

An implementation which did something like "find the first entry
that matches the address, then notice that it doesn't match
the specified TTL, so ignore it and do nothing" wouldn't be
correct. But "invalidate all the entries which match for
both address and TTL and ignore the ones which don't match
on TTL" is fine.

> If you are confident about this, it looks good to me.
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks.

-- PMM
