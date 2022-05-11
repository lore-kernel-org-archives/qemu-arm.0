Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp5283285lfj;
        Wed, 11 May 2022 12:50:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDYRd+qZJPApgYTMqpcwQF1LKKOJIIk4JJkDrwmjXM5+SFurwnnQ3QMlaEdbh5HV+o7PmD
X-Received: by 2002:ac8:5f06:0:b0:2f3:cbe5:1e1d with SMTP id x6-20020ac85f06000000b002f3cbe51e1dmr23458567qta.389.1652298653659;
        Wed, 11 May 2022 12:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652298653; cv=none;
        d=google.com; s=arc-20160816;
        b=i85ZK+YZI+ZnY3+l2fvBUHCAvEs6Nf+IhjGSJQQfslQe8jYlnt1z2eBP/9gff/pCkw
         aZfzVGH4Dg2Cbwg684nCZ5IvYhLn5xnxVhgPMTlsInsVdPXEXE5pQuVBgimgXcuV58bg
         GsW2+gaJ32NDzSHNYa5lxaXPMiIa2L3HMVVKJhIc3fiwDVHNVMYbPYtVqAEGFJwxO587
         IMU2KBlO9f7pHjt55jYDoQ38ITjz63rAKJDaRvVdIGVBUMoEuKjQI6U86af0UrsyJw4Q
         JksP2HckpYMIYO203vlUeA3um2T50Wk5jBPy3FN86W6895D9D7eLxt6NctV65dubDlBQ
         /iog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Q8PAmGFFVVe8O/gA0s8T27KtnCCeETx3gDLIS+/2Wig=;
        b=evsxzP+ByBlf3iD1SKTCdxA60reSILAVPvFT7cvR91KVkzyz+Zx2KCEKNk2xmt98eG
         X4UO4/sP7WDKinIzzASsYOlmQjyFDuHY12P5NRN4sMmzp/EamY7mweZ/G7fattpyFSSY
         6K6NHI4o9NIqvXqY7v0Lvo/U/mWNz6XjcCoHPaKOBFM3BScC+bKm/FA5aPjSVtL57ciO
         uadoV/OZeMuaAhO2dL5AKenrPuNQFS+k5h10pRNX1mihDq0TRzb4EVxpMG5ZfsztKA/S
         rM24N+T1yI0c8AIWhdj05w15KVTpi4Ww+CuncnOiYMLz3qe1pihJATKBlDq39BAzLKwp
         u/Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf14-20020a056214250e00b004563ecee5ccsi2364027qvb.266.2022.05.11.12.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 May 2022 12:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nosMH-0000fE-5U
	for alex.bennee@linaro.org; Wed, 11 May 2022 15:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1nor6Q-0005W2-Ap
 for qemu-arm@nongnu.org; Wed, 11 May 2022 14:30:30 -0400
Received: from 66-220-155-178.mail-mxout.facebook.com ([66.220.155.178]:34293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1nor6J-0001On-LZ
 for qemu-arm@nongnu.org; Wed, 11 May 2022 14:30:26 -0400
Received: by devvm5719.atn0.facebook.com (Postfix, from userid 279525)
 id A448813ABF90; Wed, 11 May 2022 11:10:25 -0700 (PDT)
To: 
Cc: irischenlj@fb.com, pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, patrick@stwcx.xyz
Subject: [PATCH 0/1] hw: allow write_enable latch get/set
Date: Wed, 11 May 2022 11:10:23 -0700
Message-Id: <20220511181024.969263-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <irischenlj@fb.com>
References: <irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.220.155.178;
 envelope-from=irischenlj@devvm5719.atn0.facebook.com;
 helo=66-220-155-178.mail-mxout.facebook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001, RDNS_DYNAMIC=0.982,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 May 2022 15:50:04 -0400
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
Reply-to:  Iris Chen <irischenlj@fb.com>
From:  Iris Chen via <qemu-arm@nongnu.org>
X-TUID: sbFn1SILaCB0

Hey everyone,=20

My patch adds the get/set property for the write_enable latch. Currently,=
 it is not an exposed property but this change adds QOM visibility and ma=
kes this property modifiable.=20

Acceptance tests have also been added to verify the value in the status r=
egister (after the value is set).=20

Thanks,=20
Iris

Iris Chen (1):
  hw: allow write_enable latch get/set

 hw/block/m25p80.c             | 30 ++++++++++++++++++++++++++++++
 tests/qtest/aspeed_smc-test.c | 20 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

--=20
2.30.2

