Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp288592lfo;
        Tue, 1 Mar 2022 16:24:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb+NSBlfSN3rHmnfPPd3BDE39+hJNXF9eGPAGEU/WPEkSZGOSVbNPkvrkGplDzNaMhEqVm
X-Received: by 2002:a25:b181:0:b0:624:3e64:f41b with SMTP id h1-20020a25b181000000b006243e64f41bmr26707415ybj.297.1646180645186;
        Tue, 01 Mar 2022 16:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646180645; cv=none;
        d=google.com; s=arc-20160816;
        b=mwlpieNlZVq1ssdBiQIyaQy9oDOIuI1j5xT6rTzvbmCuZINzYkA6ZhSQMgGFhzHk87
         LeSeyZRtf7XQRa3fofdDtU/tDXr+VvA2tX1rxEJ186pxUD9jMbFZgSC9f5BkFx6U/618
         wZXtGV6+CKnHxKGvZa3xd6HGb2+E/3GRnVgjjz/WJN1HUe6hbqy1Xrfk99OXDoMRDD+w
         bBejwBgvH18MjXTNtr8lSJ11iuLu3NgdFngbWzcH4kLn4XdY3MugNQLfm6B2kcyLQbV0
         KtWlfxzW8FiFXH2EcsFQjxX5GvF6BVjxSNi5fr4mCYDuPe2MEoNahMOqXaSF4iVzwZ1t
         OVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=ZU70MnsXx5QEKl7LGYOTM+eEtk43gFNs3SNHJdPDM74=;
        b=S/x0/R09HsA9LsFXWezqNODGIUBepz7NNZYAe2/8kBsA76RwBd19yjPankUe/SioSr
         b64gEGx9v210jafiCSnlMjMEU3nRtbDgYIr4beDqom+XroNw9utt0dVWpJKezuIY/kGm
         v8OGvITNQQfH56IahMp2ZY9wnQxv1c2IYTsRo1Y5H2F7ekA1Q/dJyEvbqEH5tletgQ4G
         rpW1OqJ69NwuPH8aVSypxqgqZIwCLRdqcPugJW/H1ZvV0qovTfP3NiewC5aCe7Jy2ylJ
         QqQZn9qMQfU52keluWZzJkmqOGf91V//7h3o7whWaz6KegE16Zo+U6w/NYb/wQhc+s12
         bynQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=qyJnG+fz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v205-20020a252fd6000000b0061d912da236si12055426ybv.41.2022.03.01.16.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 16:24:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=qyJnG+fz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPCmi-0008G7-JT
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 19:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-bgeYgYKCPwxmxywvksskpi.gsquiqy-evqrsrkry.svk@flex--titusr.bounces.google.com>)
 id 1nPCm9-0008Fj-AX
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:23:29 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=47671
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-bgeYgYKCPwxmxywvksskpi.gsquiqy-evqrsrkry.svk@flex--titusr.bounces.google.com>)
 id 1nPCm6-0002eM-8S
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:23:28 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 k10-20020a056902070a00b0062469b00335so1787ybt.14
 for <qemu-arm@nongnu.org>; Tue, 01 Mar 2022 16:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ZU70MnsXx5QEKl7LGYOTM+eEtk43gFNs3SNHJdPDM74=;
 b=qyJnG+fzhxSK6evyGEX+VUpdE1rgOCk/eOKjCPyOpxN1Y4pNj6JpHq1ih9V+cjJpS+
 kfsQu6tuc94IUIMTfGIAul3zCGweOz+2HoeqvN5z1ZtgiASkqgC1Jn8BvPpplxEbXUeA
 4SWHqL1y9vww78tFn6emGv2IupGf+1q9/XnqW7FnC5ZSv8HSYbtNmO7feuxykBTImjDi
 lw1yNh6BBIJQJSiuJpMUZmylk+n9JSqly2pxtvVanLFBkMqJX/ftz74PMHoi6geRw4Mb
 YCP4onen9wtM7NMCKarActA2Nmm7wH4mdGhY3IiFfKYUOqJpRjGVcWnTNXXhsVzLviC0
 0CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ZU70MnsXx5QEKl7LGYOTM+eEtk43gFNs3SNHJdPDM74=;
 b=mcDzTXQUI5DdC1Il9PdbHNtvZI1vBGZ5hsMmYJ2irpcAeWKT9vo2w21E+4oijSr21B
 vPuugzzqDQCFY+04RDPt9JZzBq4e2pJ+i1ZYZMGiLiwahWtGRd4Fmx98HaGwZHN8dNjx
 rz8M+1Vn6G57cKXb2rTSdt2057WE8ObjG0V08O6JquOuB+Uj+cBYAFPxWT3TmI5/rUFN
 oVab5REZpCp4wiySyubICfoepTenMeO77TffpL/xVmTxdNgQQl/j83DqkDoArc7M9tav
 XT/bMmxDziMGuwvp8gr7vwVxYAjRk1vslIDSKn4dt1SdIuBu506qXxeZ7Cx7HZNejngN
 m6GA==
X-Gm-Message-State: AOAM533oVIgbUpBnbp5u2gJsWq221LEwmNdqR/b78wyY73/xCY046jgu
 RzL9ACGY+bgptJLqU+u/w30aEgwDUqs=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a81:918b:0:b0:2d6:5636:4594 with SMTP id
 i133-20020a81918b000000b002d656364594mr27857801ywg.72.1646180601426; Tue, 01
 Mar 2022 16:23:21 -0800 (PST)
Date: Tue,  1 Mar 2022 16:22:58 -0800
Message-Id: <20220302002307.1895616-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 0/9] Fixups for PMBus and new sensors
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3-bgeYgYKCPwxmxywvksskpi.gsquiqy-evqrsrkry.svk@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: koYHgBAPYzN0

This patch series contains updates to PMBus in QEMU along with some PMBus
device models for Renesas regulators.
I have also added myself to MAINTAINERS as this code is in use daily,
where I am responsible for it.

v2:
  - split PMBus commit with updates into individual fixes
  - renamed isl_pmbus[.ch] adding _vr for voltage regulators

Shengtan Mao (1):
  hw/i2c: Added linear mode translation for pmbus devices

Titus Rwantare (8):
  hw/i2c: pmbus: add registers
  hw/i2c: pmbus: guard against out of range accesses
  hw/i2c: pmbus: add PEC unsupported warning
  hw/i2c: pmbus: refactor uint handling and update MAINTAINERS
  hw/sensor: add Intersil ISL69260 device model
  hw/sensor: add Renesas raa229004 PMBus device
  hw/sensor: add Renesas raa228000 device
  hw/sensor: rename isl_pmbus to isl_pmbus_vr

 MAINTAINERS                      |  13 +
 hw/arm/Kconfig                   |   1 +
 hw/i2c/pmbus_device.c            | 106 ++++++-
 hw/sensor/Kconfig                |   5 +
 hw/sensor/isl_pmbus_vr.c         | 279 ++++++++++++++++++
 hw/sensor/meson.build            |   1 +
 include/hw/i2c/pmbus_device.h    |  23 +-
 include/hw/sensor/isl_pmbus_vr.h |  52 ++++
 tests/qtest/isl_pmbus_vr-test.c  | 474 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 10 files changed, 944 insertions(+), 11 deletions(-)
 create mode 100644 hw/sensor/isl_pmbus_vr.c
 create mode 100644 include/hw/sensor/isl_pmbus_vr.h
 create mode 100644 tests/qtest/isl_pmbus_vr-test.c

-- 
2.35.1.616.g0bdcbb4464-goog

