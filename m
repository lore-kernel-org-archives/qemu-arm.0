Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2800930ejx;
        Wed, 13 Sep 2023 07:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHXhNDHbGsIUk7SCG4m5UsS86Qf5NTmbjMvKdPnw2xEpRCiDFvXce3OJl5CBLHTFP9bUjv
X-Received: by 2002:a05:620a:459e:b0:76f:f64:58bf with SMTP id bp30-20020a05620a459e00b0076f0f6458bfmr2544026qkb.18.1694614022119;
        Wed, 13 Sep 2023 07:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694614022; cv=none;
        d=google.com; s=arc-20160816;
        b=TNeCYQAInZvnyzh7QCmY2kjrpXQaGq32nkBjVP8SPDGMKaSmycPR3nbAFPyn+2WIV4
         0Hx/eLTWGRFEFdzk52O83eSbRplxp5GGqcOpGe0ACG4vKAr8Zb5SCV1bRNC/PD6xYKxo
         A/3aC+KUOoJk8iI5VIl71Y5M4yyeLYO4ug5eDTvOp6UGdWse/jusMr4bRDk0W71pqTKl
         3wT6ggF9Q7AcgszQOxyd5PrOL7zYMAsEn9yi+rJ9JwpSHH4iSQyw7xdqntjNhrkmghHF
         w3RD7tcZqqWcgWIK0XzfnRXkKfjFkuDDPHbVxpKBlo5gb8m/K3QvynqpCUNCafbs+Pa5
         Um0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=jjPrK7fAatfOGbJGaqIKRz5Sxee0T+5HJNHMRe4gPj0=;
        fh=mEZyouRtxfiyfuPooUBunR13dbh3J4hBhCqVSpYjthI=;
        b=ulZPB8o180bO2grlXqS4f+fsjPfWos/qdwlDE8QMOHFfBfXRMbkOqPT0wTsowpu0+w
         /6OHdu39VmV6RJUQRZn+IYd3xKqBhzWpjjqggSlix0KOJg1Nbn2ICeMB3hEwcyrMBDk9
         1P+m/nnZs0U38wnYDdRCwaowUn6m/NhtTcnRYRmyhoZKWJQ8xORRpoBL1Nka02d74fxn
         HANFBQIfqtHRA45CNVGVWxq5ZbLMT6zvJWwP6oXDhVXV4VaKekf3mjgCiNtb8BmJhwlA
         m+SVRxZtFGDQNy7EFOzWPuyLo5aucYMOXYscaINP4M7qcIREhdP1xWNj2DosYP1l0Xid
         Gz1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24-20020a37ac18000000b00767117b9c26si7094273qkm.210.2023.09.13.07.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Sep 2023 07:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgQVz-0004Gl-Gn; Wed, 13 Sep 2023 10:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qgQVj-0004DE-LM; Wed, 13 Sep 2023 10:06:31 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qgQVe-00036b-Ge; Wed, 13 Sep 2023 10:06:31 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id E8211260B83;
 Wed, 13 Sep 2023 16:06:16 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Pvd2mRImotoE; Wed, 13 Sep 2023 16:06:14 +0200 (CEST)
Received: from applejack.lan (83.21.94.247.ipv4.supernova.orange.pl
 [83.21.94.247])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E63C126000D;
 Wed, 13 Sep 2023 16:06:13 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 0/1] sbsa-ref: add non-secure EL2 virtual timer
Date: Wed, 13 Sep 2023 16:06:09 +0200
Message-ID: <20230913140610.214893-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-TUID: pAmW2RivpusV

Armv8.1+ cpus have Virtual Host Extension (VHE) which added non-secure
EL2 virtual timer.

This change adds it to fullfil Arm BSA (Base System Architecture)
requirements.

From firmware side information about timer needs to be present in GTDT
acpi table. If it is there with suggested interrupt 28 then BSA ACS test
266 passes:

--------------------------------------------------------------
 226 : Check NS EL2-Virt timer PPI Assignment         START

       Received vir el2 interrupt
       B_PPI_02
                                       : Result:  PASS
         END
--------------------------------------------------------------

On Armv8.0 cpus this timer should not exist as there is no VHE.

I hope this code is correct. Tried to compare with other emulation
targets but only "virt" and "sbsa-ref" use cpu cores newer than v8.0
ones.

Marcin Juszkiewicz (1):
  sbsa-ref: add non-secure EL2 virtual timer

 hw/arm/sbsa-ref.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.41.0

