Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4692428lfg;
        Tue, 16 Mar 2021 08:49:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJkHbmLwa/ILuby0dxE2vlSsSJxbin6I35K9JMGWFaeXajhp5C+/4fgHrVtrN283WwYa6f
X-Received: by 2002:a67:d393:: with SMTP id b19mr18946046vsj.60.1615909778724;
        Tue, 16 Mar 2021 08:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615909778; cv=none;
        d=google.com; s=arc-20160816;
        b=J736hftpNMxV9nYcRt9U9zFGgYemJq4x59pRJD7HycAAKyFj+ZmQ7+rGoGcyAwONYq
         r+Fv4+kHnJkuzamsldTtto6L8Pe5CQL1zMeaFTd7yDZSuL+V/dYlFnd0Pw6tVI74kTsd
         3Z7zXi6Yl9w1Ma5bYU71BtWK0h+OlFs0FCtfpNWv+58hK3Hf9cD2Q5eFxjj5Znrqb4Da
         67oI+IixnogNHZYd8M9f+n5gnoE6i4vmSCYDFwnZab0qNmH6zbwVPokgUOAqrlZeWoVf
         Mz/6rmidccadVSDKVV8jH1ltJVafpIIOfws3/43+8qQg4iRFZ/X0e9IlVJt2iJtAUv4W
         E3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MvBFYuvOaRvinAAgfRP1olrcM4Mwc8lV5D6aXGNtK6s=;
        b=TdsEKKwOmNaQL/hm3QDt/Y0AnKBCMRP7cC48FENqVkny/gDrOPAVmd1Glnm8/0rRbp
         JlLCI+5L+RJFNSak2Fu65sDIgWWEYlD3lgywsu7LSTkQtZgdTgzzK671+f9kgii8i7IB
         6Fg3HcKqZXA3KLQ2XtkW0xQn5/HetOaCnxiU2DTsrRTTqmX0tFu5xB5Rl+Xb+JGbYV3M
         gkapbA8y7rRzDqK+oZir2X7Q0V+1V5pneTxtX1SPPa7WYhl81IAaKb4IvR7EhAUTkoeP
         qaOu4jR+rFM+U8/H5OQShnFDkKKtAXX6LmD+St2MuJkW2sPP8Qz9SxR2tQShFe23w0t0
         hXnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=024jXR7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si2840611vsi.122.2021.03.16.08.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 08:49:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=024jXR7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMBwv-0007wh-Sh
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 11:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwh-0007uw-PE
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 11:49:23 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:41318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwf-0002N5-Ni
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 11:49:23 -0400
Received: by mail-qk1-x72b.google.com with SMTP id x10so35674219qkm.8
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvBFYuvOaRvinAAgfRP1olrcM4Mwc8lV5D6aXGNtK6s=;
 b=024jXR7WYGYP7PGBHgYit+7loC0NhzZ6phJnkwW/sGBDlaRtRvla3HSWffQyICLq6D
 tV/y/bIMWGaBD0MavQ+kAssR0APBp86qsMJxEy6rv5zp609POMwtxRDM7/5EbzbASpnZ
 KAnIQp4Qd50A9/acVEQ5vRu0osQxumAqblLuXBdC4VYMy7uL4doF8PvMtL4X1iwpwSRl
 GJTqenprixjIzgy9c1t4vxoOdTSvzr012F+wfz/eaL+Ug2CPGH00sANdUC3jGs9rOBcN
 09SdV6jtYm8ZuckTYmJPM1OdF52AXHthVmv0EqAVDUMed0o/WPZqUt1wjpDIR3zH/Cc5
 qlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvBFYuvOaRvinAAgfRP1olrcM4Mwc8lV5D6aXGNtK6s=;
 b=SpUF64wkh2hf4HNMdjSKCYWpyMdb+IIZUTXZEPVLKWOv2z8C2FkpPYeW1PS4Q7Gi/O
 4Id/4+WZRNq+GnNjeRVqwScODj497vT5D5H+a7+OKSjer5zKxGBWw+iD8XecpecN2a3N
 otTDiTQ8uRBeum8wnVWVp/o8jl3RWz6BqUq2f39K06zctFV0gV/nPdlJsOAuigtxImKz
 18tqc88h0fuBUSYi3TCQy91JfRJ+18D9SI1nnjcBQ/0+7J1EDX8IU/8e68hG9lV9XaAq
 +gCchRhMWOyFaJte5qo74A9YUmCAm6+7HAy784GM+nOqEH77ZP9sET2li8DKZ9zfnwdM
 IAew==
X-Gm-Message-State: AOAM530nWlQ+FOSFXqwmK2TwO7jiiCYY3wAMUUP9KFNQOQC4Uz+XQExp
 m5ym17U1NkPL9PtzYKLujyyntw==
X-Received: by 2002:a05:620a:2f8:: with SMTP id
 a24mr266310qko.124.1615909760839; 
 Tue, 16 Mar 2021 08:49:20 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id n5sm14855623qkp.133.2021.03.16.08.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 08:49:20 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 0/3] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Tue, 16 Mar 2021 09:49:07 -0600
Message-Id: <20210316154910.25804-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jEw9BZXua/YL

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.

Changes from v3 to v4:

o Adapted code from the existing flush_page_bits_* functions to support
  flushing a range of addresses.
o Changed the API from num_pages to length.
o Removed the exception generation from tlbi_aa64_range_get_num_pages.
o The addr is no longer passed into tlbi_aa64_range_get_num_pages.
o Other changes based on feedback.

Rebecca Cran (3):
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 135 +++++++
 include/exec/exec-all.h |  45 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 393 ++++++++++++++++++++
 5 files changed, 584 insertions(+)

-- 
2.26.2

