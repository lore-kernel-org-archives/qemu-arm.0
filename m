Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3254373lff;
        Tue, 15 Jun 2021 12:30:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyIJ8Mj8rS4ZUpiAMpg+siSvYeE1XdpqRb+kS35wAstvecx32pbaTXuTsa5oU7e0kaW0tv
X-Received: by 2002:a5d:5988:: with SMTP id n8mr782229wri.261.1623785440639;
        Tue, 15 Jun 2021 12:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623785440; cv=none;
        d=google.com; s=arc-20160816;
        b=V41fIj6FuAOkZgB7NKKTE+dILnHSngHyp5VaOSzHNZjOCSOVpoYZNeHHnL2MVLr2KR
         JKwLYLJ7ENtu9Pfcu3UMQkwc7AmaKwJEFUXS/FY+s0LylO5GvvKOxrSDFdwsx0OseR20
         UL/sPESxUvSfymZ3C7t0mnVT7gcCdPr9jCwr4+GnbNzlu9VLJXPRSZ1meOyPsiDY5ktv
         JNenabksjmVNovR1bK3kDu7Ctogx2AaCsQ3i40PDcgqOR27mVWGv/XmnYuuVqMnh6kNg
         Re3DEqAOw1NSPonidlCvewtYYYAdFfZG7D53GxLiAJoPGu5pAwU4VA2VhdlRImtVWlur
         6Smg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=C1eohHTV0XUTMRXswyp0PNbGjOLyIuh1fCMrlfoaaGw=;
        b=dxLg+1ukgRa5XIr2glchCRq6Wf+9XAaXZvcbeRnFBbnMO65NrZ1kwNcfE7F+EbJZss
         Pw5ma0TzPOHP5Zb9NjdNBqMldD7SRJ8EcaMRsbuo3SXB/NodK8x0VtPiG8I3n1yugZmo
         liQbwNSXpjRYdtPaq+qCOcz3miSzTJYF7TDdLdbhSYQerUxzIvR8vgabAay4KqR8IuSA
         Xbl8c62xz3lTtDet5gO8sZJ1KHj2/mzNso7BEi3DHb45eMg6dGQ2pXmxoKtt56yZbMdQ
         U8RkjEAYc6QwjMAvTMrjuGBv5mxY0hz/cFFOZNQBZhjzU8A4KVNkvbNuP0qlgqHIPYkp
         KtyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=eHU6FJTL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si4499769wmm.66.2021.06.15.12.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 12:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=eHU6FJTL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltElj-0004y9-Me
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 15:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3e__IYAcKCKofOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1ltEkB-0002zj-6J
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 15:29:03 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3e__IYAcKCKofOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1ltEk9-0003Ka-QD
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 15:29:02 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 g9-20020a25ae490000b029052f9e5b7d3fso21390572ybe.4
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=C1eohHTV0XUTMRXswyp0PNbGjOLyIuh1fCMrlfoaaGw=;
 b=eHU6FJTLz8/3I0hibSpsHOCC8tTEnA+vjKrWPgZwkRlzp3qIex84dZ31hCrwbhjMbb
 VS3tozo8jnvIXvF4jezx6mVHgPnz+dRlmiR0u5ReDu+m4WloO1Q4M5YUD9g6un+2mkR5
 5pv6OdZbGZhWt6JG5E6s+gM2v1SldQpplHtxcfK6hpkaBAVx0yz8Hit9K6bGx64pUntQ
 NSGiBVJ7aJaAPs2gQDK7RfDZ/bLyaimJKZxEk2pv/7/7QuLMnaNqRdHms2VsSqnXIWEg
 6TrF2IrJW13iQzb3tRv/fDE8wKgiaXriVwybAEY0HudUgsKuWN1aJ+t2nSN8vD9xmeBJ
 oogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=C1eohHTV0XUTMRXswyp0PNbGjOLyIuh1fCMrlfoaaGw=;
 b=dM9/hgMslBl4DyaOIC98ZMoqqYE7SXEaY+t8DmrOhSLVlTCVRrDEZ7sAqVH4Z4KOal
 0jyV90Kl1D3sqZ5s5tPYIwy4EsRx95wEEAsmr0nOuN/5qPuV6FI+9MiB3LPlO379ef0X
 d4fuPkxiUrvnhjFA1262MWv8LzvfUeNaeDM6IX0Rf1YEbu8TO/2kcV7Wz1nKx2wVhIVi
 MUl/aAL9NsM9kILo+bmQ3EvUYJcEHRTK2qSZ1N/tpjS9luyqR3xzkbE0MhcxWfIZHQrm
 hyL0YFITZf3yqf9hhLsgS8Uj8gyZSRQZ8LW+bRClerqdokaXKoGQ1XNZiCUNlk6Wm8yX
 jjsw==
X-Gm-Message-State: AOAM5338FU2SFVKTKMxhUpVFbrEuH67xnA6a4vsGuLop3q0IVr4kM8i3
 1JPkoXNhdinmKTL+TitOkPCDH2sP4T4h
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:abe8:110a:b827:ef39])
 (user=venture job=sendgmr) by 2002:a25:218b:: with SMTP id
 h133mr1038915ybh.160.1623785339189; Tue, 15 Jun 2021 12:28:59 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:28:46 -0700
Message-Id: <20210615192848.1065297-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH 0/2] Updates docs/system/arm to include new bmc machines
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org, 
 clg@kaod.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3e__IYAcKCKofOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i/HX5OmOH4JD


Patrick Venture (2):
  docs/system/arm: Add quanta-q7l1-bmc reference
  docs/system/arm: Add quanta-gbs-bmc reference

 docs/system/arm/aspeed.rst  | 1 +
 docs/system/arm/nuvoton.rst | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.32.0.272.g935e593368-goog

