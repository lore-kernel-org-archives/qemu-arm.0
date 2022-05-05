Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1288012lfj;
        Thu, 5 May 2022 11:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuJbcYAscCqUQHHyb1CItDRTZm77tmNfL8yt6LO9NZ6oBlEC0KO332smkEUbazBdfKyzyX
X-Received: by 2002:a05:622a:1213:b0:2f3:a79a:2ccc with SMTP id y19-20020a05622a121300b002f3a79a2cccmr17542767qtx.376.1651776868149;
        Thu, 05 May 2022 11:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651776868; cv=none;
        d=google.com; s=arc-20160816;
        b=GGIpewUF0VbiZJ5CIhzIvzHazU2klevQ51MyxBsxzXjSYfUR3DBGNIqqySZ1C/AAiC
         cu2lSw3+jhG7097e2dL918fhqc0OaamuGWPXr6tOU/27+WHML8mHb/3OiC09QosTc4Hj
         TnKzKC05WdolOX2CjBHT4uj8bh4fz+kdpd9EfAsq+mma+h8KUMQN1FjGPYWfXso1mDeq
         gdretf/Z+lwp+z0NYEJigEdqDyd/hVvaHz/dJfKh7scDpCG4J2FlKVzjDa6gubt7cum7
         hPW4VnP7rc/PF4a/osZ5AFv97gu9rX/MNDramhiZsmQacifXcIddXreFwJFomL1yhwww
         Eqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=eCFtBdRFjCk2yrX7Z5CmDT86wwtvDbT+InZeWZNrnhs=;
        b=cLB23jc42VuSbQp07EZZzUQUpPHjMWkhB9HyLZWur84qc1/wSdw1+KBNXBz6plhz6P
         8DCwEtKPVXOJnUiTFBpE9KUfZFbqMyQILWCfOyVHi7s4hrIdQGLRlSEZW4kiInnyL7H+
         fAZXK1pf5qMEL1O7Pdw8s43jhfzsTg97Atw57O8ME+W8f0/2IIbChzu9QE/exIiUkWyB
         u63SFsCeeSXKqvutaZaPSdnL6e34WJvljWRwcFD7tcaVT1GS2XhqF5MZjKSe1XvMksox
         LuW9zO78IVDsNq+G/BGw/MPUYeIaD8Sdk8fiXyE3secmX0msxNPNXHPYRw1VKTrITrAn
         GVxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KShYSBp3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020a05622a180800b002f33ba280cfsi1246640qtc.91.2022.05.05.11.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 11:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KShYSBp3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmgcN-0007a3-Jf
	for alex.bennee@linaro.org; Thu, 05 May 2022 14:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOK-0006wg-AM
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:39:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOH-0002AB-Td
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:39:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id e24so7212856wrc.9
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eCFtBdRFjCk2yrX7Z5CmDT86wwtvDbT+InZeWZNrnhs=;
 b=KShYSBp31oh5Rm9NW48CBiL5zgI8z4iyFcGxMYub9oWR1hD+VNgbPAMyr9obDRBj/b
 IgcirWi8KIQH96qxcUuuRELcwiKBA1eKwOrNlAQmCrCPi1gOOX/BSg7a16cjQAk3mxwo
 knv53sQwvfW9OKtOYiVvtrhSyD/RMD1JkFA6OLNZf0CXW07C0GpPNkuvSXJQDisQ5T8A
 MQlVuzu2fdSWSWyR5+qQACben8+SxS4dqAqpgk0DggOoPAXfPu8yahDu2s3wXoLv4RUb
 fr1FeqVoye1iOID/zNkCHxeXsc/TFNpEK8NOqy21b0YcOKtEHK5x5VecQIUYcIIRX3Ow
 SQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eCFtBdRFjCk2yrX7Z5CmDT86wwtvDbT+InZeWZNrnhs=;
 b=oOV9K70AxUh8bqFize969p/PK3q1/wLLOGtWxhHDa59tpXprCxhCTQIkRE1IRYvIDX
 dLL7KnfBgnBIIruWkkZaBvUa+7RYoQuZFWCORVWUrEYY3M2hmqS1fmuAHOEkF/z89s2r
 yRSr/GEnsvMydWZcr9IoIka6YIPDFNGkSLUARkJnMoiwkyrA9+EXZT0Ypnm6vs4C6El6
 5jXa3xf8KaLW+3d3F5hw7J0OI+eCuXNKXd5v88dUhaR5cZL7/c6pVENNFFwJcYgOoPTb
 DjeuWX6j9SYqsqqGUVNJyOmhI5wZEjhL8w02wqXrRsEghHF7wZgdkRPDFWLvUZcommDa
 lrsA==
X-Gm-Message-State: AOAM5333xoeFgQ5KIutqi+ikVoQL+nxSaeKOh4OLA5scZKmQvwtBMPNE
 o6uamKROag8mPRtCv2/fIb09hw==
X-Received: by 2002:a5d:62c4:0:b0:20a:e377:71ea with SMTP id
 o4-20020a5d62c4000000b0020ae37771eamr21251706wrv.549.1651775992252; 
 Thu, 05 May 2022 11:39:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b0039454a85a9asm2302121wms.30.2022.05.05.11.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:39:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: Implement S2FWB
Date: Thu,  5 May 2022 19:39:46 +0100
Message-Id: <20220505183950.2781801-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: f9oenADXcxjL

In the original Arm v8 two-stage translation, both stage 1 and stage
2 specify memory attributes (memory type, cacheability,
shareability); these are then combined to produce the overall memory
attributes for the whole stage 1+2 access.

The new FEAT_S2FWB feature allows the guest to enable a different
interpretation of the attribute bits in the stage 2 descriptors.
These bits can now be used to control details of how the stage 1 and
2 attributes should be combined (for instance they can say "always
use the stage 1 attributes" or "ignore the stage 1 attributes and
always be Device memory").

This series implements support for FEAT_S2FWB.  It starts by
postponing interpretation of the attribute bits in a stage 2
descriptor until the point where we need to combine them with the
stage 1 attributes.  It then pulls out the HCR_EL2.FWB=0 specific
code into its own function, so that the support for FWB=1 that we add
in patch 3 slots in neatly.  Finally, patch 4 turns it on for -cpu
max.

I have tested that a Linux nested-guest setup works OK (and that
the guest really is turning on HCR_EL2.FWB), but since we don't
do anything with memory attributes except return them in the
PAR_EL1 when the guest does AT instructions, you probably wouldn't
find bugs in this unless you explicitly went and wrote a bunch
of test cases that set up page tables and ran AT instructions to
check what memory attributes we report.

-- PMM

Peter Maydell (4):
  target/arm: Postpone interpretation of stage 2 descriptor attribute bits
  target/arm: Factor out FWB=0 specific part of combine_cacheattrs()
  target/arm: Implement FEAT_S2FWB
  target/arm: Enable FEAT_S2FWB for -cpu max

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |   5 +
 target/arm/internals.h        |   7 +-
 target/arm/cpu64.c            |  10 ++
 target/arm/helper.c           | 200 +++++++++++++++++++++++++++-------
 5 files changed, 182 insertions(+), 41 deletions(-)

-- 
2.25.1

