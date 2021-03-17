Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp855441lfg;
        Wed, 17 Mar 2021 16:33:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzISknKCm8GwkGfPT/RrviWkartQD+5MfbUqgKfei728CPHR6ofvw27DFAv5IqJb2//4g31
X-Received: by 2002:a05:620a:120d:: with SMTP id u13mr1793097qkj.248.1616024023399;
        Wed, 17 Mar 2021 16:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616024023; cv=none;
        d=google.com; s=arc-20160816;
        b=m+8+OsShts4QhWI+a6NW2A2hOBdx4YlTa+q9m4pw6B+KFL9hEr16ZjPs31DUM5WvEO
         2sin5rYIJxSFRlWl0okLh2sckwyezEm4vmu+WdSUPoXqs3JJdGJdGsw+y1xPQ+qdZ0eR
         hslkyYQWN/jgBaa7479BAmjaxu60bLoNDemJGVixViWZJzGCDpife6VK5K8OdX3hLpg2
         laBEzOnQnSNlkaPPblqD8EW4ieJsqlQg+kEmnpsCVYNIphP7gZroGy+XqRTCP9bZxtaS
         fp6vWKcmI7zytFp4n38VCRZio2z6K6H5zzL/V8XjD1NxSDs/fiyHozVvKeV4zAFzLFQB
         BrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=wDZ/n6ipsC3PKWfRqva6sPfY+Tp4bT/yJoMTCHmsHwY=;
        b=oCQfaOB6aVQuNicIOBAimeeGxdBHnlMAQLW/6tG8BytE4oOZIOfKqgJUB2sWgGGK0a
         ZX/WrWurBKcO1GoyfCcNeb0PyePMkGAlOUM7xaYXnddxLtglqLXc6K9fTba6CxzEJBTK
         un9d2yvM/FLa8Y9EdwQHDMhyKxMVpNyanZPHo/ASta+VFypRfIVOAJp6VAICX4tqAbm5
         MtGhMBbMXXJpagTH9mjt5BXZJgcqzWxxizjDxGcCL7TUt82nz8HWQB4YUxJFwsaB6Wry
         NKDtp3F6Ggnt8sCVITFe44zLqkRnhpS2TMpFCRxcXm1nlIVE5OVb9xf7I/LnkvDModY0
         CQKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=bOKm8yF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si154892qtm.338.2021.03.17.16.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 16:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=bOKm8yF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMffa-0004gF-OK
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 19:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff5-0004IX-6m
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 19:33:11 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:46994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff2-0001rH-Nm
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 19:33:10 -0400
Received: by mail-io1-xd2e.google.com with SMTP id j26so378507iog.13
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDZ/n6ipsC3PKWfRqva6sPfY+Tp4bT/yJoMTCHmsHwY=;
 b=bOKm8yF+dsH6iIpqAHRGmQGL+g1rr2QuPnIZbgcX6p2+cNIsYeBl7GWvVNA72WVhvD
 Fn5MT9zBHg8a335PQHHCGHmQbbQO3YcEG1HseopMeAyW3Ad+4YJ1jDATdRtLNkE5mTle
 INwqmNwI7Rh1jnbO1xc0A0Z/j2SlZNYV66lv5gT+hz2yOpkGWfNtrAH6qVrr5u3hE3xd
 ohe45Um43LC2P+r41W5HgSyIrVrD37B99BBelqBANvkzTxcLKUYgX9VeWWxOHaW2/l6O
 P35Jz/hTgMMqxrSnGwVedL/n8OyVZQqOOTZtT52SJhVVDRr+/AQTEZNsyfrADmpIHN68
 B/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDZ/n6ipsC3PKWfRqva6sPfY+Tp4bT/yJoMTCHmsHwY=;
 b=M0knZdYgKn5WUlp3CJtJqF4NDDjI9g01xYVLmyFoytuCuholA2v8Y88BuH8RNIKDgO
 l7BBlZsij7i/w09+zlZFSW8AKt3SHO3NRob5W6iNu59OhNs2+l835h/gPJ6S5B510Zn5
 KAUbu2BKhi87E2kw3+0FcS4v2oN9m5OVen0rzQ16rFzlTijrRIjLlXfCJRNXSk+LfH6a
 2aMZmgj8IAoAev7zTGDEq2VVj2Y4A/d0kn0tJlYvixEEwtDaeQ2DuBffyQoAmSJLgrLj
 IizpCSP5esSgvpFul1O2hWwz+KDEysuJNHprhd9+TTyooIzfys4lLqiJYdalHmOvApaC
 Haqw==
X-Gm-Message-State: AOAM531phGPkBRx/yRgKt0YN78exw6lRUt0ieVeuzZZQtnrxZddhi3lx
 L8Aj5f4mJiYtRxZI7spZ6m0BDw==
X-Received: by 2002:a02:9986:: with SMTP id a6mr4903004jal.46.1616023986903;
 Wed, 17 Mar 2021 16:33:06 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k12sm235183ios.2.2021.03.17.16.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 16:33:06 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 0/4] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Wed, 17 Mar 2021 17:32:57 -0600
Message-Id: <20210317233301.4130-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2e.google.com
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
X-TUID: IThTq0CCkaNm

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.

Changes from v4 to v5:

o Split changes to cputlb.c and exec_all.c into a separate commit.
o Return a bool from tlb_flush_page_bits_locked to indicate if a full
 flush has been done.
o Update flush_page_range_bits_* to exit early when a full flush has
 been done.
o Run tb_flush_jmp_cache in a separate loop.
o Don't check for 2 regimes for cases where we know there's only one.


Rebecca Cran (4):
  accel/tcg: Add TLB invalidation support for ranges of addresses
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 130 ++++++-
 include/exec/exec-all.h |  45 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 369 ++++++++++++++++++++
 5 files changed, 552 insertions(+), 3 deletions(-)

-- 
2.26.2

