Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1554031lfk;
        Sun, 30 Jan 2022 03:04:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOJovI7mXsa8/7dqWdVqBayYC1yhQafGyl/cbMCZPWJqV+FRV3i/4GBauEbzzXAUYKdFHU
X-Received: by 2002:a05:622a:130e:: with SMTP id v14mr11195572qtk.355.1643540657026;
        Sun, 30 Jan 2022 03:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643540657; cv=none;
        d=google.com; s=arc-20160816;
        b=yi83UNvWOHPXUtfykRVA633wTRIB+MowRfMisi8X0yGd7A6gMiWfFBjAIeh/7qgyg4
         Sw7k50HomotyRm4Q05gkO5D3rn6gPKpVZ6JOOxlx43pR9iBh70LHFsjGvMNXsiv5IHTI
         GIDjwSUkabI+PU/bTNZ3EuYcEMfVIcateU0qrerejJL7EBiFNRCg2lJf5IH7Qk5rtoz9
         niggYRK+NnF3tyb06e/94R0I92MQzXnomHG3LAMWMDebM1ezma4rdjHwBdUJv3/MG3DW
         CQmdZzzcz8mWuYyBxL+0iewsJAGDs3CjJ2I8P6h0r9vVamGi7WthnKBS+V5ijZ7bIACU
         3uYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MEIGrybOclqUD83VbzxeddgFxVNGzQEKSjdZ4MLB4Nw=;
        b=CArIxpstmORmLmQyDpe7fj27EVnxc+UbpAgzSnfGz6j0VyLleH1H+MmvHz5l1T/5Xl
         cCr3NJmHw4rOO5zOMw0Jm/tIvs6Jf1JwnmedCqF0Ugpnv1l0nYEqOP892u+/IPPcAIOU
         UzB8427kDeWsQl6YLTOTn8k5fK+Izyd1o5+gLrEIQ82NYnTNIXAAEKeftl5QKKtVUfZg
         S574oMU7S/6Ga8wIBGmSurQo7gLJnUWSsmxUJ/6HI+bfFS9BelOuhlc3AYurxamEdUJ2
         YNqFEB3iMW6Z155d0tE3qXyj1IwqBhVJR07YAsTlcgAYN7FB5HgTB/k7aZATwvQNekOu
         E2/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=nGJjmXtQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si6896843qkm.611.2022.01.30.03.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 03:04:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=nGJjmXtQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nE80B-0006ZI-7q
	for alex.bennee@linaro.org; Sun, 30 Jan 2022 06:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7zM-0006XT-Er; Sun, 30 Jan 2022 06:03:20 -0500
Received: from [2a00:1450:4864:20::235] (port=46619
 helo=mail-lj1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7zJ-0008MW-Uw; Sun, 30 Jan 2022 06:03:19 -0500
Received: by mail-lj1-x235.google.com with SMTP id c7so14962959ljr.13;
 Sun, 30 Jan 2022 03:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEIGrybOclqUD83VbzxeddgFxVNGzQEKSjdZ4MLB4Nw=;
 b=nGJjmXtQDeVHF1UNqbl3b4txHjDui8f/o2ieRfmOi3TNxohSb8frenmcu5zGdA3ptL
 Nc5b9uQ9nu8JI73J05PpECownWxM2dMBLGByb2gswtwhYleNIqeFcYtKrgi5sjSeN+pB
 kr3rudGb76dwliKbWthhURvCyJdPc/bBjOzev2slrIw5BaDj2q93CDz1JKJrn9HsMJQV
 I+bav4ZaowalLTG8lcJNbVnR10VG/xoqzTvghon4zLYB7ffjsO/4lGUTK5vJJHV7WbU8
 Rm3Ggz9pWEB/flBg/DUeM7Hi91oqjoPToln0SqW9bMCrXOjTIdOHxrDYvliBUshkkr9O
 vn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MEIGrybOclqUD83VbzxeddgFxVNGzQEKSjdZ4MLB4Nw=;
 b=Xx4R9eKOgiWSS1+e4J4du+lK4nYxKJtnsfoN3CCJa6Z9+//yDREJkBYUUSi5pd4CXO
 9MH5WY1siniDiRIA6tdVskEjOagnOx5pj789Dox45wV66j2GIedreUHNpSYKwdnZs/sC
 qtxenGb5UX73P2Qtg/ZCr9Tzy/fOM8DCUzUWQk6XBzLSaQcypaKeSQd88ja2uaq4pEJu
 4ln2s35lKd3ZSf/+dHXGjXraoiP+K4EvFFAsbVfHasvxqq4rUd6t9tznh3TrivrXMIGH
 uPC0cfFqpmB/C+dD1jpNWPfHV6W3zwENbEZXDC7oHZi8PgsfcH+6Qc/pfIMFuRyxiu8E
 6P0w==
X-Gm-Message-State: AOAM532xIl8KX5Gt4H0sEYMY/aTFnoHtySHMGxLGmVuKSRkCKBVafzDs
 qZ532bumXrH1homgtADPEuHppEEadaddzw==
X-Received: by 2002:a2e:81d6:: with SMTP id s22mr11202679ljg.61.1643540594564; 
 Sun, 30 Jan 2022 03:03:14 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q6sm2788413lfr.171.2022.01.30.03.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 03:03:14 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] hw/arm: versal-virt: Always call arm_load_kernel()
Date: Sun, 30 Jan 2022 12:03:12 +0100
Message-Id: <20220130110313.4045351-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::235
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 luc@lmichel.fr, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Sk6kPdx60MX

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This should be applied on top of Peter Maydell's
"arm: Fix handling of unrecognized functions in PSCI emulation"
patch series.

This fixes an issue reported by Peter Maydell. We should
always call arm_load_kernel() regardless of kernel_filename being
set. This is needed because arm_load_kernel() sets up reset for
the CPUs.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/arm: versal-virt: Always call arm_load_kernel()

 hw/arm/xlnx-versal-virt.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

-- 
2.25.1

