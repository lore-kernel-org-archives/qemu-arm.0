Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp724133lfm;
        Tue, 18 May 2021 12:48:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKVPjcAOPMcmAdTVMPgOKwGEDUImPVYl/1tQu9E9h6YGyoBhCMTZaMqdw/v/LnG7mFy89H
X-Received: by 2002:a02:cf32:: with SMTP id s18mr7444240jar.31.1621367334375;
        Tue, 18 May 2021 12:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621367334; cv=none;
        d=google.com; s=arc-20160816;
        b=V5cCHc/J7lqSrOVEXDL5NKkPWWJwdmWQM/3r5Ksxy8Cr79N6YPrxz4ySv8Jdx3yuhl
         Wh7mPEkXdk8czFj3GL+wQ2Fb5hBJQsfJB7h6nUirOeCOAJD5mKRel3/3UURhwQeu3tL7
         JiSNJCr3N7L5zZjwK3TdtgburHNdRPH7eMmOMJ07veGCMxdLoON2ZkuKrFn4v3dUQ9J/
         3N7GkWMHOzIrLXYkcGh2qYrnjiTMndyD7JQGmNPMEkMT6EUN7F+SxZSDLLnm7oHsnn3+
         1zj0GjH2MFtR4ftWWNdNnuCaiBrrsepvFfTiJQ+9l7t4RqDMjshdGbb72CtdtvGv0D0+
         FAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=+e+BnVIcdXQpIo13+f1rOjuEwcuZUOaf2ae2EEV4Ap4=;
        b=WukNW4+84Vv3WhJlDJHd9GgZFxEX8jPSKGi3dfi3F4mspQ0jKRNcJMBcdoS/sEpSvE
         TMb+YcHJLNgqfmY7w5xhhlKeTzkgWunrJHmyeqG/b27kv4vwjWf4fYJI/kO84N8D3LV8
         MmZlM1SYu4spmJ9OvRV18Qaly7vD7xMuW6vI+PVEZG/u7NN5YUtgbvWLur7e2myI+SMr
         QZY+jRz7f9gc+mmgxOk0SPIqR1SwwzEClKVRhSNKmDiQJqWV8KhiblkZEI6awA4Hi28e
         nIIe1OP9L7J/+0L3HI5oC2/U8r/i67vGP5iLuOLqVAm2H5c/X/IXk8Q2hqxLwgKm0lDA
         /DuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=VcSqRCsE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w135si24876467jaw.24.2021.05.18.12.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:48:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=VcSqRCsE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj5i1-0001ZG-Mf
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZxikYAcKCjQlUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com>)
 id 1lj5av-0005iQ-PW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:33 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:52996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZxikYAcKCjQlUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com>)
 id 1lj5as-0003US-3w
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:33 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 b3-20020a05620a0cc3b02902e9d5ca06f2so7927872qkj.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+e+BnVIcdXQpIo13+f1rOjuEwcuZUOaf2ae2EEV4Ap4=;
 b=VcSqRCsE45Orz2HI/pzHoTYBruS4NsHdXSK7x0hQom0gqy0L/L6NHIgnuTSKXopTgc
 mVm1mo/RdIibRmjzSaahsLuwyAtev1kagJrtl3ff9ea+eeyjPifweJsSOTjHKAxMSb9b
 Vp5hP3j7SX3Fv54qRxuK4zpeQ/aO5Q5IjTRliFS/lc6ikmZE/TEfxUQ1F5yYgaMwha+q
 h49Pc/1Ht8xSWsZ0P2shmmqjAr0EAkxqZDGzmT6YQITTGB/MblhBjDMBekykKgzfHqRF
 5kSfLUy6bt7HcjK4PQhFrFPqenz7mvFfLpQUp5joWMgnCdYuNtxlc8tMVVMFEtPuhX5X
 7N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+e+BnVIcdXQpIo13+f1rOjuEwcuZUOaf2ae2EEV4Ap4=;
 b=ELp1mQtSDKR5X/faHfaCzWMpsKLD7f5OajUN0zTH2BHlSGkPgtnLx8u62fkCzLTZjv
 SummsULoRlZKJlFQawQnohI31ufCNPRP4PFmSd1Uqe9pW6BWKTv2iGg0+vhvF19yXfx6
 18Cv82wMkC9Ta6thEu3l8xjFc/ReTrPkWWXzBidoniPTUJJkd6yuw8cC2CPPMgr89XuI
 4yUlyyObqniaV9mNK2fR8o46Vf3oFssrKt94cBl2IuE5JqQ53d6sygvDuoA5NKZB3uup
 gvoO6bwXxcS9FP0xFQlfkIwCBhQ9LrYX2yJAfNkApguIgBJGieEAVHtdGRcWP34onRIg
 N3ng==
X-Gm-Message-State: AOAM532D+TRNbsuVNt103kUd/1NM5kiqrscf7kJdwwzLGVRfY3DDvDwA
 e82pAgxiA/QGh9TupuiatGKFO2eZLdAI
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a0c:fd62:: with SMTP id
 k2mr8030346qvs.51.1621366887804; Tue, 18 May 2021 12:41:27 -0700 (PDT)
Date: Tue, 18 May 2021 12:41:14 -0700
Message-Id: <20210518194118.755410-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 0/4] With the pca954x i2c mux available, enable it on aspeed
 and nuvoton BMC boards.
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3ZxikYAcKCjQlUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: dMsNtxYujvaY


Patrick Venture (4):
  hw/arm: gsj add i2c comments
  hw/arm: gsj add pca9548
  hw/arm: quanta-q71l add pca954x muxes
  aspeed: sonorapass: enable pca954x muxes

 hw/arm/Kconfig          |  2 ++
 hw/arm/aspeed.c         | 33 +++++++++++++++++++--------------
 hw/arm/npcm7xx_boards.c | 14 +++++++++++++-
 3 files changed, 34 insertions(+), 15 deletions(-)

-- 
2.31.1.751.gd2f1c929bd-goog

