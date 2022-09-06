Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3215416ejh;
        Tue, 6 Sep 2022 15:09:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6CK844FLHHA2ibF7TcxzTOq/ORXXpt7BHufYlhTE7hRN7XCf6Hh/+Q+KlEfEZnbOv/NhVA
X-Received: by 2002:a05:6214:2486:b0:4a5:8b:9ba0 with SMTP id gi6-20020a056214248600b004a5008b9ba0mr438150qvb.70.1662502177625;
        Tue, 06 Sep 2022 15:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662502177; cv=none;
        d=google.com; s=arc-20160816;
        b=YYoISw3NkPLJxXjunN5dYP4enuJWISdHSBkZnQwnLgnJBy35oxTeg4uZ6+R5UO3gMA
         wJuKCob5KzcYq4bIZNcLtzn0nxnE7qvyggooMUXnTEaE86zoSzp4D+ieOH+3SEfTzF/u
         YOJcvWALQWIhS0twYj9A++9f76YW0qERGuFQXBbSsAIjSeBm0HrIHdOG2ysJWzLtkVXR
         gp1AphSFLUtAwN6iJQAkvbxK4JuyDMKAeEFGSAZwzdFwCtDA+kD4iL3MhwVNCLJ40I07
         JoRknCFrM1ErOlrduo+BtyaqJAD93X9/RUqCaea/akOxO5bckLpbA+lVNbeupqQhsxRX
         cOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=TPJW1DiYNB9NHz9aIvVyrDqeoouDBNDSFCDgLlhxjTY=;
        b=hGnVW/z9VYpTH8zXpUeiY+JhYILJyI+ZjPTIKYbtQqj/8b9LcVnoSu/5vZp+FjkOD/
         40m0Kap5Am5QU+656OZy2f0tY9YbH1GsCZeREPM8I+H9qZFvGdML0V7jPXIaXqJHzZ70
         YCjJ9aORvit69ybOPA92EybgdrVuHD8IeISFY6iCLRtnh0dxKXmLw3pTSscfLB8bpl4X
         v86M6pyut/cFYSd05h3SI5tJ2vtoDTh7lbm/aYaQhZg2H0iKI4tSBbwiLmGMkDJLWrPT
         LhSvWZni4wt2JB5gyd8BXQbQaYLODUO0WEddq14FMGzLDVAq0iNIVbfUohfo2eLg4NKc
         WAQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=XWynZ1Gt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s28-20020a05620a16bc00b006bacc41ef0csi7138586qkj.166.2022.09.06.15.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 15:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=XWynZ1Gt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVglF-00026w-4j
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 18:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3T8QXYwYKCFYH6HIGF4CC492.0CAE2AI-yFABCB4BI.CF4@flex--titusr.bounces.google.com>)
 id 1oVgi2-0005Vp-9h
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 18:06:18 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:57298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3T8QXYwYKCFYH6HIGF4CC492.0CAE2AI-yFABCB4BI.CF4@flex--titusr.bounces.google.com>)
 id 1oVghu-0004Rr-0Q
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 18:06:18 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 d8-20020a25bc48000000b00680651cf051so9534271ybk.23
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 15:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=TPJW1DiYNB9NHz9aIvVyrDqeoouDBNDSFCDgLlhxjTY=;
 b=XWynZ1GtswyKZ+WmgaifeezqFYw6LOf9/rhcv2xhRZUO0G0TJ+TZF1KheADBIf25xv
 W1bESw3Ny7DTbuzQlM1FmyIt2l6I7d4gopzR+uAg68d8gECrXRjEiBKEf7iwcWOE7aQK
 Li/Sq99yZLY5OuO+3nwKsd5p5qAqnP533CwZX3B3espFpYkk2DHZfvaNBIyjaKbIvh9F
 TMwMkRhKE2WEuEGk+fC/3GBmKBaPi/6DVfIjV/Msto8AbiG9x1qGHl/rgYCMb9BMrIkQ
 OEX0q77/nYLne+YJJRb9CRXbEd2yEwTLsQ2nRF+p5OySZNJG5mhsHoDy/FbhkntSxprG
 cY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=TPJW1DiYNB9NHz9aIvVyrDqeoouDBNDSFCDgLlhxjTY=;
 b=rqGmf5rQ5AbnszpLT5nU40duwzk0uIQQhQy3iwORGEXBPP+GhK0s77reJIrJoqHXlm
 GOb1eTnqH8OZec9iUpbHal60jwQC6u2Brob1pjueqqTtxqHkbMupr5v9T8Lscs6FH2ML
 mV+QKxPIDWspzE3/AwronLf2468nkW0VbtKFLr78WZ3rC2agdIS7ZR4iVu7vOkzVsJoB
 vLyITWZGjPCC/AjXplNKhiNWwhgAavrMabU6yhFJhg/iDtgWclGus346bfFMaI6KwBbJ
 qK7U9eeeMz0PnCuAvxhLxXlUynLYblb8rZawB36JQlxHSDNHyP6BI2a9FgV8LvyRZzMF
 Vqmw==
X-Gm-Message-State: ACgBeo3RTAjdBw1BBlTzlyp+9r7POCII+TULqEt/yhkcwKxTtyFy40qd
 V0AT8Cn3Cw4sicaUTYvUHBqZYWX0/VY=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:ba47:0:b0:695:e4ad:8df3 with SMTP id
 z7-20020a25ba47000000b00695e4ad8df3mr626834ybj.378.1662501967983; Tue, 06 Sep
 2022 15:06:07 -0700 (PDT)
Date: Tue,  6 Sep 2022 22:05:49 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220906220552.1243998-1-titusr@google.com>
Subject: [RFC PATCH 0/3] Initial PECI bus support
From: Titus Rwantare <titusr@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter@pjd.dev, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3T8QXYwYKCFYH6HIGF4CC492.0CAE2AI-yFABCB4BI.CF4@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: eaRZ6dISTIJS

The Platform Environment Control Interface (PECI), is a way for Intel
processors to communicate with management controllers.

This series of patches simulate some PECI subsystem functionality. This
work is currently used against Nuvoton 7xx BMC, but it can easily be
extended to support Aspeed BMCs. Most of the functionality is derived
from PECI support in openbmc. See https://github.com/openbmc/libpeci

The main consumer of this work is openbmc, so functionality not
exercised by the openbmc/libpeci is unlikely to be present here.

peci-core.c is an attempt to split out functionality defined by the
spec. Anything that is not expected to change between BMC vendors.

The following commands have some support:
    Ping()
    GetDIB()
    GetTemp()
    ~RdPkgConfig()
    ~RdEndPtConfig()

To be implemented:
    RdIAMSR()
    RdPCIConfig()
    RdPCIConfigLocal()

Currently, in the board file during bmc_init() one may specify defaults
as follows:

static void my_machine_peci_init(NPCM7xxState *soc)
{
    PECIBus *peci_bus = npcm7xx_peci_get_bus(soc);
    DeviceState *dev;

    /* per socket properties - both sockets are identical in this case */
    PECIClientProperties peci_props = {
        .cpu_family = FAM6_SAPPHIRE_RAPIDS_X,
        .cpus = 56,
        .dimms = 16
    };

    /* socket 0 - with example setting a few of the cpu and dimm temperatures in millidegrees */
    dev = DEVICE(peci_add_client(peci_bus, 0x30, &peci_props));
    object_property_set_uint(OBJECT(dev), "cpu_temp[0]", 30000, &error_abort);
    object_property_set_uint(OBJECT(dev), "cpu_temp[2]", 35000, &error_abort);
    object_property_set_uint(OBJECT(dev), "dimm_temp[1]", 40000, &error_abort);
    object_property_set_uint(OBJECT(dev), "dimm_temp[8]", 36000, &error_abort);

    /* socket 1 */
    dev = DEVICE(peci_add_client(peci_bus, 0x31, &peci_props));
    object_property_set_uint(OBJECT(dev), "cpu_temp[9]", 50000, &error_abort);
    object_property_set_uint(OBJECT(dev), "dimm_temp[0]", 31000, &error_abort);
    object_property_set_uint(OBJECT(dev), "dimm_temp[14]", 36000, &error_abort);
    ...
}

This is something that can also be extended as other parameters arise that need
to differ between platforms. So far you can have have different CPUs, DIMM counts,
DIMM temperatures here. These fields can also be adjusted at runtime through qmp.

A lot of the registers are hard coded, see hw/peci/peci-client.c. I'd like to
gauge interest in what potential users would like to be adjustable at runtime.
I've not written QEMU models that read config files at runtime, something I'd
appreciate guidance on.

Thanks all

Titus Rwantare (3):
  hw/peci: add initial support for PECI
  hw/peci: add PECI support for NPCM7xx BMCs
  hw/peci: add support for EndPointConfig reads

 MAINTAINERS                    |  10 +-
 hw/Kconfig                     |   1 +
 hw/arm/Kconfig                 |   1 +
 hw/arm/npcm7xx.c               |   9 +
 hw/meson.build                 |   1 +
 hw/peci/Kconfig                |   2 +
 hw/peci/meson.build            |   2 +
 hw/peci/npcm7xx_peci.c         | 204 +++++++++++++++++++++++
 hw/peci/peci-client.c          | 293 +++++++++++++++++++++++++++++++++
 hw/peci/peci-core.c            | 222 +++++++++++++++++++++++++
 hw/peci/trace-events           |  10 ++
 hw/peci/trace.h                |   1 +
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/peci/npcm7xx_peci.h |  37 +++++
 include/hw/peci/peci.h         | 217 ++++++++++++++++++++++++
 meson.build                    |   1 +
 16 files changed, 1012 insertions(+), 1 deletion(-)
 create mode 100644 hw/peci/Kconfig
 create mode 100644 hw/peci/meson.build
 create mode 100644 hw/peci/npcm7xx_peci.c
 create mode 100644 hw/peci/peci-client.c
 create mode 100644 hw/peci/peci-core.c
 create mode 100644 hw/peci/trace-events
 create mode 100644 hw/peci/trace.h
 create mode 100644 include/hw/peci/npcm7xx_peci.h
 create mode 100644 include/hw/peci/peci.h

-- 
2.37.2.789.g6183377224-goog

