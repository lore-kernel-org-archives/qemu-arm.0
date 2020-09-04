Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2329573qvk;
        Fri, 4 Sep 2020 08:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztPp7VrMZvQnHu2jknliSYdSgJmymO2UCjw3KdPytUcS3m6oK6FS0plCYRTDil1M4RG8nd
X-Received: by 2002:a25:e0d5:: with SMTP id x204mr11272396ybg.57.1599234134559;
        Fri, 04 Sep 2020 08:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234134; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZqIBuj/FEccE72ZhvEKICCYQXf+ej82N4ijCt/lA94LM/toflBk4rwwwafDBTieIF
         S8X7N6FnHlWsemBET1OOE7M7YdKET3mg+tfsAEAIeQN8tCDdLsnLjoSQy64AfmSONb0/
         rIqRWFHQ6nN5Wb6f4q/pBIcWgd3GwMOiMOMriGjJiImOU1OpTn1xKbJYd+tICCHxqKpZ
         HoAZaAf1xILGO8qUFZgec05KVliG1RCZKhK0VI4qLCkI2HsCx1nF+nN01AAwVmIPnlib
         amhw1xXsKjnAjILi7O0qBt+puo0BpPgXQKJxCXblfibltdomtcqx2EFNQrroSdsg3une
         2F8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ijN8C9uYRScuOtrUptbu5atVjFcf+AwMoQAbhDGOgh4=;
        b=HS1pqckwIrO4bYh2JYShMwKdu501fIIG3kDQouyiYfHTPh2xCNnb3qHQU08P8QuB/V
         f+UWnaCgIztbFno5gSafLya/bCJcGZkRGa4/eA9ZOPGT0TVeYRJ7uzGazQa5L3Tq19rz
         sG35bl3pn3KKT0IsCBsSZ5DNMlYXMxOTUcI+88Ns1mLaxDTg9IuwZgKtEKKQKhy+vRMs
         g+7WvIGpMN2uCUaDb9BdMRkfZwo2mqY75kqLRJAOQrhCzUMqLulsJK9t5NiNjKKJy9Y5
         aj4xUOmNd8M0JRSaswUFOUr9DQj5NURmGPzJbwkQOY++4z/xMy48M5L5JQrHfTCICu4X
         0zZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jcAflwNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25si7455491ybj.387.2020.09.04.08.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jcAflwNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDqw-0005Ji-2X
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kEDqk-0005I6-Cv
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:42:02 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kEDqi-0006vm-Sy
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:42:02 -0400
Received: by mail-wm1-x341.google.com with SMTP id c19so7770186wmd.1
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijN8C9uYRScuOtrUptbu5atVjFcf+AwMoQAbhDGOgh4=;
 b=jcAflwNmVZ5Z45l/259WzmZ4HAmPVLnoGp3Gh9y06vAkWAkeX37goO6UkyWF6Fz3qk
 du+ycr++JLmX5UWxi0xwHZALYnGZBXTDFn0F/imhevaRMWijlSV76IJHb/L5Fa3mf6DS
 9RHnfYcc4OxBS7OPaTPbeCZs4FV4NFF6BNLFbMRa96v4Hr8e+0xv+/04y6rOWvOLpaSb
 Alw7QJlixYS3kQt+s8pKbiIuKW6hcu4UOtNPDHinesEg//cjOx2lzYDJ31GX+jzYUTG/
 uv08Q15+/PeP2QUJMaKBuW987kbT+hN3n/S/AJ7ziVRq7YkhsXwevAUvQkzI4CfH3ffe
 6U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijN8C9uYRScuOtrUptbu5atVjFcf+AwMoQAbhDGOgh4=;
 b=pfQzUcYZacqHATzZSTKaNoLXYRCsb8gF9mKbIOSxS0daUoe8Lg1CI/D66CH8jZAd3w
 T2HCK6PRdLEieCBhXLC2wH/qGQ4hgP0YA1csEMclgkpvXyp/koV+IgaerhXAWOyokhBT
 zgxppenT/tuwsO01PlxT2Zd/AnCDcaceYhNrg+PVW1jdKeaNeTnKk/PsZ5ApTfXmc/fi
 m2cvqxB4NLQGNjqZQfOk7EMLO6mA84ENdqZjfedaF9hXjrGxAwlY5cCEITCXyIgTYuWN
 gJpDqzbDBFq74PLjIuBAYpx/pJxosQ/BPJoJMZeGkLFtT4nLkFgWjSaHoHoj7XCOMqBs
 Tq8g==
X-Gm-Message-State: AOAM5309uaxe6uMNyryd07Pi55NNgLnj41EbXPV8aDjY/MNKJD7IEkqk
 T38+viziMp593ZRcYF2xDruPONQreznO51Hz
X-Received: by 2002:a1c:105:: with SMTP id 5mr8676359wmb.83.1599234118890;
 Fri, 04 Sep 2020 08:41:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f14sm12723743wrv.72.2020.09.04.08.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:41:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove KVM support for 32-bit Arm hosts
Date: Fri,  4 Sep 2020 16:41:54 +0100
Message-Id: <20200904154156.31943-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vv5ID/DUNlg5

This patchset drops the support for KVM on 32-bit Arm hosts,
which we deprecated for the 5.0 release.

To repeat the rationale from the deprecation note: the Linux
kernel dropped support for 32-bit Arm KVM hosts in 5.7.
    
Running 32-bit guests on a 64-bit Arm host remains supported.

I split this into two patches, one which does the
fundamental removal of the kvm32.c code, and one which
tidies up some now-unreachable bits of code or #ifdeffery.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Remove KVM support for 32-bit Arm hosts
  target/arm: Remove no-longer-reachable 32-bit KVM code

 docs/system/deprecated.rst |  16 +-
 configure                  |   2 +-
 target/arm/kvm-consts.h    |   7 -
 target/arm/kvm_arm.h       |   6 -
 target/arm/cpu.c           | 100 +++----
 target/arm/kvm.c           |   7 -
 target/arm/kvm32.c         | 595 -------------------------------------
 target/arm/meson.build     |   5 +-
 8 files changed, 56 insertions(+), 682 deletions(-)
 delete mode 100644 target/arm/kvm32.c

-- 
2.20.1

