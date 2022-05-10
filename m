Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp3997750lfj;
        Mon, 9 May 2022 17:06:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyma/4LNNivduhCcpGi/RHn54EhwtZSxqq0Op9iHmiXBhlg2lgYLSUGCwLZ/94q/k1144HA
X-Received: by 2002:a05:622a:41:b0:2f3:c678:34df with SMTP id y1-20020a05622a004100b002f3c67834dfmr17255359qtw.67.1652141162291;
        Mon, 09 May 2022 17:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652141162; cv=none;
        d=google.com; s=arc-20160816;
        b=UuG6rdpJnvABzLNKIcDM37BmKxS0iSB7RRa6WrJrDpgXcOio9I3vndqdT6TXHzN+kU
         PZdRjBkXMTphmgRqCU2ER77zwws+GEWzGqT5ajV/2yZ+7YG/5nWkosFmZKpuEWyROhwe
         5RImU+gsYKGckZ4Hhgp4/CXYmiOkSuYSu6qs2IJND8Mi5MT/CE06Qmli4cvWAAwc3DiZ
         /Qg3SIB4/sRhNfM8dMkCM0FuKdlSH6hDPMR0FocC6U5VTuVzCD9n/gUOXbty3qyLO/qm
         8/NqtQVWX85Fgie36izXXLwAgx6zWSVJChnbCdSFrKm1i5PODtQDJ0o2c2Ok0nT8lyph
         TwOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gZeXlhv89ff/tRX5QIcImqsHuRO/df9gxiVoF59awRE=;
        b=VYGSnkPAJwe73XOxsj14qHVrwOWBzaQQTnopKQx+t8bnblTGHUCCAUoZTG58ZsFhLD
         9cPHwooRCuY8O1FmkqVyAJprkJb5fTWOMCZUsk/uWtwJNOxDGE7ITmN1jb27LmGTKivG
         0mpt8EalsM3cjT26YlccxGFJTKOL7T5H7Y2p2ZEJUsuSLXiAiL1jiotvTGMGRuNKP5wT
         kZ2+3hBZAEP4wfUkhG6MkJ/Djc7IPD2eqi+WS8Huk43NFpiKC254HmeDmCSxA7dgl+Ct
         8AProkRbSNgOmLQ7kxEm17nwdzdV42lpoQLNi6qeP2dv4YOiCA6/cqHDJAK47fHbUGAz
         cBRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5XniPeJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs20-20020a05620a471400b006a09505cbf5si3377190qkb.229.2022.05.09.17.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 May 2022 17:06:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5XniPeJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noDO5-000635-Qc
	for alex.bennee@linaro.org; Mon, 09 May 2022 20:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noDMe-00062l-29
 for qemu-arm@nongnu.org; Mon, 09 May 2022 20:04:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noDMc-0005An-Bx
 for qemu-arm@nongnu.org; Mon, 09 May 2022 20:04:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so907925pjb.0
 for <qemu-arm@nongnu.org>; Mon, 09 May 2022 17:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZeXlhv89ff/tRX5QIcImqsHuRO/df9gxiVoF59awRE=;
 b=w5XniPeJBC9xMEEReH7QGgF2tOAlbhvzRlgzc0hJL2JcL9enRL8hBnZ+QdQf4p0jUy
 1KDSsB2QLc4ukFNuTWHCXrwTA6cfDNo2ca4BW6EMzj+/W/Ea+aZfmwtXK26CkpPhRS4Q
 6bGWBq+nFcAH+DdOuasXy2LloCX7VCMEAJ+FyMaL3NxZ+FUZu/FR/X2eFvMQ0KoNbu0D
 zrzFBARt7wtC6tclqV182Txxw4OpgqrqMletx9MPUeH1TH7gM4Y2kAaAZ+U7MsjxeBgh
 Cac1Nj/6L51AFuu1XFT8kEXQeyT1vf9rcVmgpYsLtXPGK/Daq6oiW9s4zn9Ik5LTE5F0
 gBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZeXlhv89ff/tRX5QIcImqsHuRO/df9gxiVoF59awRE=;
 b=JqhyTt/1AbOoRNcX+jIqYDn+HOzkqqi1YObWmRVUGBvNa5/QtmfoSObS6gTzJfbLTI
 qGtLHBESTU4hAJggFvJ+pyq5yFuMSxmlwrQs22s+4NU52Vk2SqzW3SX/VbZh71/AHfqj
 ihvXyGo2FOW09stN/1fYWPWrfHHtk7mn5UqJuyszSYNIOCbq8zlpembfdbuhMsuIb9VX
 lD/8zKl7VduD0CL45W/Vs4IkEo5zjhZ1KyuzuFAasMxdixatvbVhKz9XqDwFq52Od91J
 HRrmDOgU1D+bnBB59JWbNdR7JDrQb3//JBf2QqJj6rx3IXuVlDuqL2eg+OoAjwvG3tPk
 yVmw==
X-Gm-Message-State: AOAM533uhfZY5qI5ptgwwYTJikIqw7nOaWZMXg0yiKUmfHJBEegtVPmV
 QyGgLnzWcQXwvDGFdTQ2JYV3/g==
X-Received: by 2002:a17:902:f542:b0:15e:b6d2:88d9 with SMTP id
 h2-20020a170902f54200b0015eb6d288d9mr18087519plf.128.1652141068617; 
 Mon, 09 May 2022 17:04:28 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x71-20020a63864a000000b003c15f7f2914sm8983691pgd.24.2022.05.09.17.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 17:04:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: SME prep patches
Date: Mon,  9 May 2022 17:04:24 -0700
Message-Id: <20220510000426.45797-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h2lBpb3I3pfK

Add HCRX_EL2 with no supported bits, and bit definitions for CPACR*.
Just trying to keep the queue smaller.


r~


Richard Henderson (2):
  target/arm: Enable FEAT_HCX for -cpu max
  target/arm: Use FIELD definitions for CPACR, CPTR_ELx

 target/arm/cpu.h    |  64 ++++++++++++++++++++++++---
 hw/arm/boot.c       |   2 +-
 target/arm/cpu.c    |  11 +++--
 target/arm/cpu64.c  |   1 +
 target/arm/helper.c | 104 ++++++++++++++++++++++++++++++++------------
 5 files changed, 146 insertions(+), 36 deletions(-)

-- 
2.34.1

