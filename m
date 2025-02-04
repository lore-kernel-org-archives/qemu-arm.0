Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp303565njb;
        Tue, 4 Feb 2025 07:56:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVy3bQHluEvDAQ2zZryfkSKZ2g7nA8wuuXIHc3SLgJGGKfekii1glHHPa41SZ6o8dOY48dh+4AvEWAzcw==@linaro.org
X-Google-Smtp-Source: AGHT+IHsTnD9focKEPYN3mNp0PVc6OqsSFjam+y8VJ3dfNZ2gMajUCglCkPcMRnI2ZkehBsu7kFJ
X-Received: by 2002:ac8:5a54:0:b0:467:6742:5633 with SMTP id d75a77b69052e-46fd0accdd1mr415589541cf.23.1738684593125;
        Tue, 04 Feb 2025 07:56:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738684593; cv=none;
        d=google.com; s=arc-20240605;
        b=I1uYYJ+RkmUrPb8ES6aV31CMIuxilm+aykGLCloAxZAFZVIFwAtyByx3+2XJbeU4QO
         R/iiNrZvyPTHg9xxfYMWXQ3B0BDfOrTiPr+StNSXWyJU8xru4jGt8C15CbJFTQ72mbCB
         ISi/Ol+UhyrPF0V+cnHBMdekwleYLb77bjk429/5Q1tqo8pKMr/JLVuU+nEutjTiF89k
         kAScLriZ/H+jivD1UHn6TEK225/9mn417DbJ9KzsW+LAagdjqhUp18/A2vG+f0VEgx7O
         H5bBnt1wwKQjASBB1NDfwTyjfyvQBw5ox0udIyH1zUva/hDePvsMooYtm3NhfT14NSzx
         lnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hpxzLRyuqBc58b/zbC0ov0qjtk3Jovv3tdauaDKO7nQ=;
        fh=AiLrYS3D4rrcvPMspUovHeRR5gc1X9R6EbqTapn4ZYM=;
        b=KMjoJqU/6mRxQTNSrQncpRo2PehlyKf2c47S+MS3ysquXWeR4VvbFUo2HSyGiEn16C
         Q/SCQI5bRCoqo57tmys6ZlxAaJSKDNII5fQY4QoxoPS6rKgganIny5vzP3o9tpY99XOM
         X2cuWxrBh5OWmQth9Ac6+jOa+fAaSS776X67kCgYBDLVPzBFVJh40n8eXRMpscuABQCE
         4qCOwPvyjHbu9fzKtXdJHOviSBaGoS+1PQXKrGUMzbH8Kq1jyq/gUO2AEIcdzlHblhs0
         hpdC0edEq8PqnqGl9+S5xjoZZc0Q0+7hPIoTJTuPEBvejQELWtpWrKlGMgO3jjhlz0BX
         ye+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SH82uleu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bae55asi32348731cf.434.2025.02.04.07.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 07:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SH82uleu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfLHo-0002Wl-Ln; Tue, 04 Feb 2025 10:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLHn-0002QJ-6L
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 10:56:27 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLHl-00026U-Kh
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 10:56:26 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e545c1e8a15so5186164276.1
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 07:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738684584; x=1739289384; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hpxzLRyuqBc58b/zbC0ov0qjtk3Jovv3tdauaDKO7nQ=;
 b=SH82uleubEN8bSG5upseMTUOkLwatMAmGedgXheogDlWhmVFakQL8ldEL3CID7xivo
 +n5nQoi2PmxRGtz2mTuqSZmO3o5FjoBQbEzhpzmHIoVzLlRKqABj25kHOjXrqSUJcUWC
 /szgJvzvDeWATYrfLvZWBCOY8KPgtQCa4wOKVYKz7DkNI48pajV3tvxwlFP58BoI1f+X
 f5aMwY5q+xzaAcAaLGOhcA6WyFpvatP0gauiLWsHmDVOUp/kg1TEMOv6QZGt/ykRvO2N
 0upIfWhXUR1BKBDJjF46gV4vIbimSugSJblRh7yb/hN3kgpix70NyWM+k4NTuB4tZa5g
 UU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738684584; x=1739289384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hpxzLRyuqBc58b/zbC0ov0qjtk3Jovv3tdauaDKO7nQ=;
 b=RW5pqp1HBSuiPkwNo6ZQjSta1LbWiKBYl5L7ZZ7W8v1SyoRuFOWmjgmqQxkwz/MNIL
 WzUAR5DyQ83euJfG1x9zB78p4qLvnErshDF2MfWSiS6biU8x96QbKDvsSjYh20yUBCUJ
 5uTtadbzQZhgruhwC6j2Aq810v5XDRjxg1thRI/eVNM7bbhuJqEmLjibxaTwJUdotjY9
 k9Nl5FaX96V1zNpTLwUOhZUuhwKBIVLo5MmeEaED/NmUC48u+/jsHQ45SwklPc/PjWrZ
 nwEqIcCcFhADCvtoIM2asF2/LwuDuyoftPz63nU6SWiwc+XMIt2XTck0To5GDWsOyXR7
 q0pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHHUAWwcWPLVHCbyFgh/j7MCIjA0YR51U2d3KEHkKc9m8BiFhY1zJUokJvvlJBUO6u2rQv1WJMDBi3@nongnu.org
X-Gm-Message-State: AOJu0Yw94Q5mIZNql1HTYVfsS348quzgv1eDcPEviNw75nvq52cmKYtx
 m+XcFd+8MiGJKhGCGEO4gQmY+RuiKQ3tUSh/8tzIyPcZBeOswWUiKFeuLRQ3Wut9H9bkGjfuub2
 n0qCzOq43sr+Wvkr2+96fgQ8slzK/ayN7KRWfomtfwKhPWElQ
X-Gm-Gg: ASbGncsIZ1FVDhAZlONKPI+Bv6aSs1GSNEw80ydbBG0/BY+qC1BBNbJhreXQntdA0zb
 1Hgydmo3VnAkaXe6EF2LrPg49MWUwxkNxIQirPjDtUeksACx/aBnPsHVH673Qxdh9qkdS+PN2QA
 ==
X-Received: by 2002:a05:6902:2002:b0:e4c:bd70:854c with SMTP id
 3f1490d57ef6-e58a4bd7ee1mr19774218276.43.1738684584549; Tue, 04 Feb 2025
 07:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-12-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-12-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:56:12 +0000
X-Gm-Features: AWEUYZm1d9zBBHPsVJHVvZ1kKx08vFVvv4UPfp5O96t1VJfJpOhMC-0Y7T13n8s
Message-ID: <CAFEAcA-iPKuqWwaB3=mHmCFghiW5Y2HATKbCdRZhYk3ejmh1CA@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] hw/misc: Rename npcm7xx_clk to npcm_clk
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uQbIg0Aq8yzl

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM7XX and NPCM8XX have a different set of CLK registers. This
> commit changes the name of the clk files to be used by both
> NPCM7XX and NPCM8XX CLK modules.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
