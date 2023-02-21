Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3710668ejb;
        Tue, 21 Feb 2023 15:26:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+/qxgDLW/NfN+IQXxBozEeGWqAjY/IPCPqz+vkhcF6VfMM6ddWck8qHPKbOQjDFVK9uvlw
X-Received: by 2002:a05:622a:4ca:b0:3b8:2a6c:d1e4 with SMTP id q10-20020a05622a04ca00b003b82a6cd1e4mr10493821qtx.23.1677021978569;
        Tue, 21 Feb 2023 15:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677021978; cv=none;
        d=google.com; s=arc-20160816;
        b=MvtHYN+DSRIliQzGb1lpDyTqZjtWWUplDbIEweCh9YPNhdTXjDF9EI7tSpGbEwvPUw
         h39WX8SZcP4GnDfiRcSXmXqfzLjMlwowwJUfu96CuvEx6BJ1FnFb+w+Fzg3zAoKPkgA1
         u50PPBo0ZqPZOYRsXUAtpQY7XWCa8wRnsuzuLfKaD5sOjIkAYxF+UwUG+GpRT5ssTVlm
         b99X68mUkSs6ONORPit1nxG75ZuHxTKmx/DJYXCty4J9Bo77EZBrjbE8s6q97C5S92UQ
         B4xBglSyldfwWOhfYOVzzobD2wePDjb6SRvSiqpolK2J79Ejsdg65Ivod2zjoJvnnVlV
         Sxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=qKPE/6RO6kHdXJA591r4Zk4XEwUo19ExEpoqZcRPbRM=;
        b=bWrh5+/kh+XBNtGmEIUZea3lpJps+xMxExT3ua2eckwmJEjLa7j9yjzWqNDKbTd2jK
         nJ6JkWxvvMhrCsB3gUwd5uBSQ9KgUvd6K9J/t77Jm9FcACFIvKqi4v9D00h1l+WgO12T
         8h5cq9sjqPHlup/BeOARudUs0a4lNmDU4EynRGLH6OgVKQaD1WsWKStvIGoiOHn7nXhZ
         C4DkY2WUKP4CNCABBUJDEWN8xbeC2nL7hXDpssUjxIizJcc4Kd6H3oGpFF//jct9US5b
         LKZlurAhwU2Q7wOcTnrguPXyiPCyzuL+bxEr0dLMm0vtctNyoZz2i6bJ6tAg8m/7FVjP
         G6dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMRzhvRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05620a410b00b0073bab8ca0a2si3452072qko.120.2023.02.21.15.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMRzhvRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUc0w-00056Z-2L; Tue, 21 Feb 2023 18:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0m-00055P-M3
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:25:29 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0j-0002Y8-8d
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:25:27 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so4147631wmq.0
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 15:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qKPE/6RO6kHdXJA591r4Zk4XEwUo19ExEpoqZcRPbRM=;
 b=IMRzhvRC5AWE77mw6m/Mrc22EKHnzcKd9ZmwYOJ+J2NqPm40OHEavbiQQxTzAmgIzf
 twPSXuEauyA7aiCcA8aeHCoMW+CTFVOgigouPsEDg9Yk1jt2VckR6seMQbOLyxOMf/bC
 tOzQwonIt+0b/19lfG9K1OhBvWbX17r/AkNXSij0wmkjlNlvW7gkFA7wI1CVeRCOo1F8
 32NUxvr5yjwed8e0TuO54m5kqlMmKgUFBt1+KmcNh/H1SIv0Blzn/hDeQop3aBu7N4MW
 CiwjBU2VdwvSLkw4imKarwSJgz8WNH/6dMz9+K8cvDu0TCQdF2yhgt78/wxxj6kCyhzi
 TYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qKPE/6RO6kHdXJA591r4Zk4XEwUo19ExEpoqZcRPbRM=;
 b=R0/MZPiy3JuTCbCfbroJKQzRa8baaI4jGRPYtDAlRRn9fdabWim9RhbbKXSd4V9WBi
 tMoYZvX410wnBtbJZmGGAhDD8qyL6hm8ME7j7YPyaXtsSPhbEepyQxbTB8EANyu293Vk
 9uurQRqLFlQrYIgGNZMjKYK389zeijlOcHFfoKTAfDuHmMxiZNDB9qyR2sUySIPGlSwo
 ccoHfyYpxuetO88VMqr6M7aUXzwvGHZOspXQtdZDbHjIzTVhaxQHuQDkHGW60ewTpvC+
 s0j19s1wyXvcjlXKW0MxY974yxnpjnuqAWUM/+AAYZsRKO9kT++tq+d0y9jWmhHlLhsI
 7sXw==
X-Gm-Message-State: AO0yUKWDwMtIaaoDkuO/sC61Rlt0Sc4v1QM3onFA3bhG6fjmSBHLZfjz
 otp+3s5IkrjdsyHKU4YvZYA5Ig==
X-Received: by 2002:a05:600c:2e84:b0:3dc:59e9:9285 with SMTP id
 p4-20020a05600c2e8400b003dc59e99285mr5215909wmn.18.1677021923451; 
 Tue, 21 Feb 2023 15:25:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a05600c475200b003e220998b6bsm7180051wmo.17.2023.02.21.15.25.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] bulk: Replace assert(0) -> g_assert_not_reached()
Date: Wed, 22 Feb 2023 00:25:15 +0100
Message-Id: <20230221232520.14480-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Nd9mMy1baRvA

Save contributors to post a patch each time clang
produce a -Werror=maybe-uninitialized warning on
assert(0). Replace by g_assert_not_reached()() and
prohibit '[g_]assert(0)'. Remove NDEBUG.

Philippe Mathieu-Daudé (4):
  scripts/checkpatch.pl: Do not allow assert(0)
  bulk: Replace [g_]assert(0) -> g_assert_not_reached()
  block/vvfat: Remove pointless check of NDEBUG
  hw: Remove mentions of NDEBUG

Pierrick Bouvier (1):
  target/ppc: fix warning with clang-15

 block/vvfat.c                       |   3 -
 docs/spin/aio_notify_accept.promela |   6 +-
 docs/spin/aio_notify_bug.promela    |   6 +-
 hw/acpi/aml-build.c                 |   3 +-
 hw/arm/highbank.c                   |   2 +-
 hw/char/avr_usart.c                 |   2 +-
 hw/core/numa.c                      |   2 +-
 hw/net/i82596.c                     |   2 +-
 hw/scsi/mptsas.c                    |   2 -
 hw/virtio/virtio.c                  |   2 -
 hw/watchdog/watchdog.c              |   2 +-
 migration/migration-hmp-cmds.c      |   2 +-
 migration/postcopy-ram.c            |  21 ++----
 migration/ram.c                     |   8 +--
 qobject/qlit.c                      |   2 +-
 qobject/qnum.c                      |  12 ++--
 scripts/checkpatch.pl               |   3 +
 softmmu/rtc.c                       |   2 +-
 target/mips/sysemu/physaddr.c       |   3 +-
 target/mips/tcg/msa_helper.c        | 104 ++++++++++++++--------------
 target/ppc/dfp_helper.c             |  12 ++--
 target/ppc/mmu_helper.c             |   2 +-
 tests/qtest/ipmi-bt-test.c          |   2 +-
 tests/qtest/ipmi-kcs-test.c         |   4 +-
 tests/qtest/rtl8139-test.c          |   2 +-
 25 files changed, 96 insertions(+), 115 deletions(-)

-- 
2.38.1

