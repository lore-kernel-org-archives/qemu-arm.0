Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2701854lff;
        Tue, 3 Aug 2021 09:39:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7y307wldtSzIsPwb3NhEVvM0cZVBZ9u3t9Iw37DMtCndMqJE3uM29AN1UydHf6osphTjA
X-Received: by 2002:a1f:1f10:: with SMTP id f16mr2095342vkf.25.1628008792397;
        Tue, 03 Aug 2021 09:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628008792; cv=none;
        d=google.com; s=arc-20160816;
        b=JBeblZ4MWdIWscEmX3UodV42xUOXMVjQ54oDd2TvxP44eOlYHqj1fXA5M1iE5jqBct
         zyvRx2QXthLhqJgPyX+P4tDXeQa3CrXmiseIBoL0Mz29SGA7mRDqi1S6gl/hs6I/ucSB
         5+Dr1eJ6xNepb3TqroLFcLLzCyPPeQYRSI6nJElz1IRivdAGqlnSUJnfPRYsTCVHxwuN
         9UMuQMdJe5ggH66dlcWLU/MML6SgNL3ZJGpfGe634a0itBNEd1MZkFYYgXXTYaaT9XuW
         gtq4f6rKk/xyxiihRFXeFQkCwG/Yqe+v31g3hefKvYdp8dKr8h0mIrvNSAODYoOuE90L
         8Dbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=mQ7bK7+sKq3F9+DQvIqgIXSNNsyVsO+4TuhwVfhuGdM=;
        b=k9eav42WS7VgjopjRvfVzgpED/ryeGTYfp8uQe2nRmNhzlm9u12bQFBpVWLRyoj3pp
         AcOYWqx8NtAU9RR97yUUi0aB+M9t4HZSDbuJzqT6fCU6WTqIinhkM5SZhGIwYOa4b1P9
         acCQusTOUM8tKys97gXHpjtwXEicT3mOAcAgVvRiXDgvSztd3OCWncsp9kL4GuhDe+1N
         TD5ZxqkyE9p/lgt+A/ymKfwDfcLY/JoQCJfbidGYVPcuOwLm7zvo325L4No+MllmpMJS
         YR9XQ1v0jEBFbphZUCXnHCbzE/KVDC6dtC+dXr73sa9W/CQeNoQKydQqQEhsvNHNxTG7
         qmgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="k/Ob+Nzm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si5942173uan.14.2021.08.03.09.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Aug 2021 09:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="k/Ob+Nzm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAxSJ-0000oY-IL
	for alex.bennee@linaro.org; Tue, 03 Aug 2021 12:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RnEJYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mAxS7-0000nQ-4S
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 12:39:39 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:50761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RnEJYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mAxS4-0003Cu-Il
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 12:39:38 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id
 v18-20020a0cdd920000b0290344e08aac15so4893378qvk.17
 for <qemu-arm@nongnu.org>; Tue, 03 Aug 2021 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=mQ7bK7+sKq3F9+DQvIqgIXSNNsyVsO+4TuhwVfhuGdM=;
 b=k/Ob+NzmcKC+tsTKuZUMdymjdcTQaNHUM4u3HKdLjOATt1yULJHMqHf+feON6deyJr
 6wnZ19BYJdX3vlBoKsb4cXY1EKWUIssMOCvcwp9Cg3CQj11rweGDqiOTh8nyn8ZJ2+FU
 KUSEUTRn8IpcOaFPE3pKmqNwGZkg3fBEiGOTdUHdqdLDXFpA/yd3fVCYdUUQhseqOVdx
 DheguMMR4ucZyznkG4lVV6+cktXufPBCXKYjhxSJpZNo3ziTHq3IyHbCFeXLzdF+Jyjy
 QnJLfXgnZEkKG1XhiOL0xor4PgVEdqx0z43EpzIWgB4A/GWaF3Z3x6YGB27MmlCcMBe6
 6Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=mQ7bK7+sKq3F9+DQvIqgIXSNNsyVsO+4TuhwVfhuGdM=;
 b=Ayf6f3/asSTIVIhE3UcGxsa4P4ZNjZpxNyzwGw14oynrfJMl12rQlTKIycanZ+DXsn
 f/okzkM8cy1Cqe4VRlYGlFyqLRJQleC+9tY3ObMZS+/3lWVPmN3tSZ6ZQN+kbXjPPfLD
 BJYn+9Ip0L2R7oqK48ffBxXJKhLNPV4Y+wV4QdCivBEIPRfP5Mlq1NB0A2kywzILENtL
 LC7FIoVNIBBuX7+hO7JYz6mJEU7cfh02j5GuKZi3jAmAl1WYb94eaX5yIA/jFto6EBbV
 B6AWckMxoHv5/k6+hZpVSTgUpY9IhXPQha45XlLLrEvkbwJh5NHdOTXmZeUlrtODb18Q
 bciQ==
X-Gm-Message-State: AOAM530nW8vcBW61iWOVwjzn97Pvz2jcyDTQWLfmGmlOfXjJl8+izRpr
 uawg7G5MZJKYJbkMeg3TI7a+u6uxFw==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:2481:: with SMTP id
 gi1mr22195907qvb.35.1628008774974; Tue, 03 Aug 2021 09:39:34 -0700 (PDT)
Date: Tue,  3 Aug 2021 16:39:12 +0000
Message-Id: <20210803163913.1302164-1-stmao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v3 0/1] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, venture@google.com, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3RnEJYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
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
X-TUID: pbdmSZsl1txv

This patch implements the remote I2C device.
The remote I2C device allows an external I2C device to communicate with the I2C controller in QEMU through the remote I2C protocol.
Users no longer have to directly modify QEMU to add new I2C devices and can instead implement the emulated device externally and connect it to the remote I2C device.

Previous work by Wolfram Sang (https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough) was referenced.
It shares the similar idea of redirecting the actual I2C device functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
The work by Sang mainly utilizes file descriptors while ours utilizes character devices, which offers better support for emulated devices.
The work by Sang is not meant to offer full I2C device support; it only implements the receive functionality.
Our work implements full support for I2C devices: send, recv, and event (match_and_add is not applicable for external devices).

v1 -> v2
    fixed terminology errors in the description comments.

v2 -> v3
    corrected patch set emailing errors.

Shengtan Mao (1):
  hw/i2c: add remote I2C device

 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/meson.build            |   1 +
 hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
 6 files changed, 340 insertions(+)
 create mode 100644 hw/i2c/remote-i2c.c
 create mode 100644 tests/qtest/remote-i2c-test.c

-- 
2.32.0.554.ge1b32706d8-goog

