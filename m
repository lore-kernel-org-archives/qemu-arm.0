Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2032005lff;
        Mon, 2 Aug 2021 16:03:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq/mxhNyE2/K/i0+lG5YWncJt33h/RHwWCNQiEY6pzWRDlD0RtxtyoYtcMzEtzBx5XfaYV
X-Received: by 2002:a05:6102:2f7:: with SMTP id j23mr12419916vsj.29.1627945432799;
        Mon, 02 Aug 2021 16:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627945432; cv=none;
        d=google.com; s=arc-20160816;
        b=iFC6BArydQEvTl2rCoXexx/ymgYfcDh/7oJC5Hqh/1VYfj6LmyjDa4N2IdOxwMD2Yj
         oAcxmLjugD8U3XdwueeZg6FtcGlkmw1XRd5Sl2b3TcDq2/G6FdBb1yFP6rt2Avr8FkE7
         1JmRNqtSXikoRPMv9K62/FuRzGrk31hVreU9leoy99F+I2F5FhfDc58ZxTLI6oxtNmsf
         BUVwYMb9G7gYJKiV+BhEzb746P6CxVXUO1AvpGQ9X7zxPtGJ8yPsHKQmx4X4JtSrBES0
         EiIHAOmi/fyO2HS1YbBtyIvy9Ta4+dEx9Lw9N6whMbuivSV+6L+pTHVDnHRbEwVuMO7V
         opEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
        b=i31nAzK9b7EViSJTcVaIzBj5BsGWZhKQm0FQTDikPrlnn1cCEYmiTsaFu1BPhdoa9i
         VxDfR0m5jd+0FY7RDgBgwLN61fVFt6yP49oVYRDrtU2MOsKP5I1JA4Tef//nQPh6UZWy
         8mSANU3azv2fDX4U7qbEfq0xbxzlM/jLU75685A9XYj0sQipvoxfcPu/yQT6nlwXB36P
         K4AWXrXbuuySh4dCBWwnHXIrH6jHDWxUsfrF79kDjts+lPGqy5wUFNseLEi5XQphSJwj
         ECcfTX26T6BdztUAi2XSay0MYFoXVEZqnurNIjoRMb7MEqJbH/Q26itCSkWOgDk15HEl
         6PnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=evi1rOOK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si4744094uak.231.2021.08.02.16.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 16:03:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=evi1rOOK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAgyN-0001Dn-JT
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 19:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wnkIYQUKCOUZaTHVNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--stmao.bounces.google.com>)
 id 1mAgy7-0001C6-P5
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 19:03:35 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:54789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wnkIYQUKCOUZaTHVNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--stmao.bounces.google.com>)
 id 1mAgy3-00060N-UJ
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 19:03:35 -0400
Received: by mail-qv1-xf49.google.com with SMTP id
 s12-20020ad4446c0000b029033a9344451cso9907675qvt.21
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 16:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
 b=evi1rOOKt3C+FHwiD/5anPiy1peBKCcGWXAgXOh6MYHGckPUYiTrD31DG67ZjWr5xJ
 wDhY0dPz9xh8ekshZrnNyE8UHkKNTikWnBNfD+0593gDtkNzvrLb+0TxFCIvM6xCPAB5
 f5ygdUf/dWsBAp5XiYtW6E6eiPB5Mneyr+hORgxbCxBZidjN9Da0Uqv7rGuYiBkIA+Ph
 jspp14T0L4Q7F4FurvpYSzzdxe1J60traKKNqwSrT7BTvH8wIZjEwQ90q3yx6SF6Cp+1
 1K3E9Ry6ZamuD0dbg7ZuxPY7IMsOF28xtclg3PiWLm6kVeEYkSZoeZmj/pehHTYNAUZH
 v4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
 b=kFIu5KGcVaT5+I74lQKoApnMGEQk11ef8ixHoxMHT9nTwiSd/dQ+20X4HYJpO8pMs5
 n1QIPE4uaD8pxKgDC1Fb3ka6sSoEaibLSXwZWuMMPlFOKU3Ym6aZcHaDbcNCGAzPyoHs
 YhNqW3m8HcH0VYVDVXOHEtb7ryJsKkwJBR1j2tuFSqqoo9l/00qUIvGKhlQqtFuBUXvD
 apmm5lqqbQSqL7cxDW3dSPIptIrhRuzgrV6XvO5/aNMZXwP1j9W/GgUjNKS0dJ93cyIS
 BPxisi4Wjf9nfsfFXwiPGp15NRYe+7XnwR+mWexkchF15i8w0+xBhhOWGkmKGQ6Z1i3N
 9hqw==
X-Gm-Message-State: AOAM531GsfB5W/26ulTjRu241oLLSafIboxXaAZoRpeg398ywmI0a8p/
 kQ1td23dgrzZ8OJIvKsX5wZt8t3wqw==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:2589:: with SMTP id
 fq9mr18987328qvb.30.1627945410139; Mon, 02 Aug 2021 16:03:30 -0700 (PDT)
Date: Mon,  2 Aug 2021 23:03:20 +0000
Message-Id: <20210802230323.1164787-1-stmao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v2 0/1] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, stmao@google.com, 
 crauer@google.com, wuhaotsh@google.com, venture@google.com, 
 maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3wnkIYQUKCOUZaTHVNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--stmao.bounces.google.com;
 helo=mail-qv1-xf49.google.com
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
X-TUID: s2NKj2SRa8p4

This patch implements the remote I2C device.
The remote I2C device allows an external I2C device to communicate with the I2C controller in QEMU through the remote I2C protocol.
Users no longer have to directly modify QEMU to add new I2C devices and can instead implement the emulated device externally and connect it to the remote I2C device.

Previous work by Wolfram Sang (https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough) was referenced.
It shares the similar idea of redirecting the actual I2C device functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
The work by Sang mainly utilizes file descriptors while ours utilizes character devices, which offers better support for emulated devices.
The work by Sang is not meant to offer full I2C device support; it only implements the receive functionality.
Our work implements full support for I2C devices: send, recv, and event (match_and_add is not applicable for external devices).

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

