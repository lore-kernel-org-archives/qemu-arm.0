Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp215652ejq;
        Thu, 4 May 2023 04:05:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5sr+edKeu0X4UqyL3A06LdXgAWDw7mRBI0BJ5wg7+8pL7OeJkn7hfRkDc1HXwxsA4pdARO
X-Received: by 2002:ac8:5b8f:0:b0:3ef:3b04:b8d8 with SMTP id a15-20020ac85b8f000000b003ef3b04b8d8mr5537662qta.0.1683198335306;
        Thu, 04 May 2023 04:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683198335; cv=none;
        d=google.com; s=arc-20160816;
        b=CWeRTQbaLvbtPpjL+5V3Wd+YW2j/vzP9W+nHPTDUA6AAXCy1QBds7n6sPcHOqQSLnU
         EP2/TIDz6PfMKs2E++dPUVG5DQug4BFXELhiDFm7aw7uygDtBqsag1ZI6ty2iTnaBWdR
         SmrpOzjU4BGAaxNNh+RYY92LgjPiZM4lPHvHefNciAoR2n9ZBZE/Is6XCQ2ra+iD0E5U
         +nx4f+p+k+73qoAc6ZoPDVOnGvaVDd/ZCW+E4ibdVi4GBLNeyDTGk5ltP49ppTViVLgT
         KRh8UFhiZc6q1XX6WpDBKJS5yLJBHSm0iWPNObD33/v2/UoEZmeV37XdTgoKCUVLg+qM
         zmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yEb8PpHn49AMMlxPL+20BITsNaLIqwdHTBTJ6O58xYU=;
        b=donoMxOQOD0i1czgUZGFfMHO3R26dhux6MHHP971qmPm9Ag9HzXzq2U2/IJIHBZ1vq
         aU3YVn9KF5+6gTroiYKTaaUdpgS7pjkZnIErqZaWJEvHwICEPrp2IgkksJfQXflpMiRA
         KxftbsYQh4sNKGZ3XMu2Pmdvy/moY3aSr+Kxqa4ht/gHMSquKNgKY03U5y1JM3d//B0S
         0UORrWkxkvkdkQcCipKw705HCYjs0c0EGwCDb8ZVLH/E70q7aOA20BJMF0ERGwgoNK/3
         L/fLjOWCmddvd/NzaqkSi6xHcSfhhGqe/zd2pdtm/1rq4w3tyDym31nSrzEmxx5avMej
         akBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/qlDT/T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x204-20020a3763d5000000b0074662785f1dsi18830534qkb.657.2023.05.04.04.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 04:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/qlDT/T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puWl2-0005eC-0Q; Thu, 04 May 2023 07:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWkz-0005dl-Up
 for qemu-arm@nongnu.org; Thu, 04 May 2023 07:04:17 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWky-0003aB-DR
 for qemu-arm@nongnu.org; Thu, 04 May 2023 07:04:17 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-957dbae98b4so48523466b.1
 for <qemu-arm@nongnu.org>; Thu, 04 May 2023 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683198255; x=1685790255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yEb8PpHn49AMMlxPL+20BITsNaLIqwdHTBTJ6O58xYU=;
 b=e/qlDT/TM1LLxO7OEkmY0QDEvkLijegh/DpsgOHX1tmAUWQKqi2Iv+z8tEGjurrG58
 lOMQArkjc+LjBGl/85UT8NM5uDsbfEcughqdCjq1FHubfhScpV9gzCsj5YzeH6qQS82o
 fd7aKH27ig9IGJ0n5E4nfvtqqNzvLfn3jeN8NXN2WiO/iS3x9kM3n3MDcqHfyPlt/+aG
 s69/fMz/qTdSJNy+A2FnRcyqPFOqlMtpfZvabUZqUqLggn82NBljZdGELYtUKYYc3ae3
 xPRY3oRAKnuepcpwv+7OEx0bH9v+qB6GGU2DWhhv5RNwvCtkrEdrvciYnJKO0ct+pRyJ
 oNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198255; x=1685790255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEb8PpHn49AMMlxPL+20BITsNaLIqwdHTBTJ6O58xYU=;
 b=LSXHl3hQBcBrdNwCS+B6Hn9dCjyzM9kh/DKX8Z86kHOKnkL5S3KXudcEa1uDyfLdja
 Bt4fEgxnIA3Fk9LmfABCxlfdngRTFDNI4Gi674iRYJfQB3eDLnBft7+1TE43VJstNwl/
 zwpElK10M9HQBlrdkmEWubB8EIODlFeZyTWRdPKgd/Y3LnoOtPRjaMULdUdnp6xJAmyr
 e45DYmOMhoPGOC0WFi4YfSXBixFSmCHoayD2IfRbN0dJ5f/FU/ExKYKRF375OIwQu0ft
 WhcgtZO/CrVnCcAv3eMiFg97EcF1OYkoZ5Ah2K3esSwfW5rptVTIrRKtY+i7gNfPHWv3
 FtHg==
X-Gm-Message-State: AC+VfDyP7fsMJ/P2fZp6LM8/OMWvQvDKBixB2Cez05nd4tSy+L24kQTf
 I7OdBVpYE6rmngmm22DED8sPfQ==
X-Received: by 2002:a17:907:6d1f:b0:962:582d:89c8 with SMTP id
 sa31-20020a1709076d1f00b00962582d89c8mr6023461ejc.45.1683198254714; 
 Thu, 04 May 2023 04:04:14 -0700 (PDT)
Received: from stoup.. ([91.223.100.49]) by smtp.gmail.com with ESMTPSA id
 d5-20020a17090648c500b008c16025b318sm18626175ejt.155.2023.05.04.04.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:04:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Move more files to tcg/
Date: Thu,  4 May 2023 12:04:10 +0100
Message-Id: <20230504110412.1892411-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: oswpBcBlHdQ6

Move 7 files to tcg/.

r~


Richard Henderson (2):
  target/arm: Move translate-a32.h, arm_ldst.h, sve_ldst_internal.h to
    tcg/
  target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/

 target/arm/helper.h                      | 8 ++++----
 target/arm/{ => tcg}/arm_ldst.h          | 0
 target/arm/{ => tcg}/helper-a64.h        | 0
 target/arm/{ => tcg}/helper-mve.h        | 0
 target/arm/{ => tcg}/helper-sme.h        | 0
 target/arm/{ => tcg}/helper-sve.h        | 0
 target/arm/{ => tcg}/sve_ldst_internal.h | 0
 target/arm/{ => tcg}/translate-a32.h     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename target/arm/{ => tcg}/arm_ldst.h (100%)
 rename target/arm/{ => tcg}/helper-a64.h (100%)
 rename target/arm/{ => tcg}/helper-mve.h (100%)
 rename target/arm/{ => tcg}/helper-sme.h (100%)
 rename target/arm/{ => tcg}/helper-sve.h (100%)
 rename target/arm/{ => tcg}/sve_ldst_internal.h (100%)
 rename target/arm/{ => tcg}/translate-a32.h (100%)

-- 
2.34.1

