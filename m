Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp577833lfg;
        Wed, 27 Jul 2022 15:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s13V1sZ2meIgC8TpGKlyhlW08d4x7aVauJgB1ikSwdaGrG36/BjQmL3ZfpMcGsKIBTInmm
X-Received: by 2002:a05:622a:13ca:b0:31f:31d3:ece0 with SMTP id p10-20020a05622a13ca00b0031f31d3ece0mr17653023qtk.348.1658961614954;
        Wed, 27 Jul 2022 15:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658961614; cv=none;
        d=google.com; s=arc-20160816;
        b=xsg2tEO7VVDxP86yRLEBbKH88PhgLuLJQSEUH/nIaRbBGO+M3tc9/HmZdTUxu3SGWL
         My1pdPKO4VHFwmu4upKMH1Yhv/YRgMOaJMjXj1gfDwz1DE1mhs3mOTP/3qpbGcD3ui6h
         hIk7297SYRtSWXg+b456+ExOtssRPek0jhLIeCyxfZE+3lgGKj8ZmJHj7QLQfJXdk/S2
         MCP7Vrdsmm7T3vo7vdYwbfGXTgnhkFcrqNFcefoLM8F1sLYYhxiFNsltdvnWecwrA8SE
         9TkTG2Wd499j8q45ai+SQ3pO3Q90o7OeBBKQ0O8+8r7pqjRBYnnj0fqfHHc+We5g87Bh
         r9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=BzFDomryLyy0FfGzB+/LiwjzeC3ZFFPJ/b2dYc0iykI=;
        b=yt64DhSYrRZ59OODxYcifC2rQRsKmLogEoEKKjMFGdEdW3uJczELpyPPAF6qs3jjM7
         Mi9tgSmo6RMaOj1VO1yWHxiYsB2imV79/edTd+nE1uXAWGX62WqZR/rm8RQOWGcTRSz6
         kEnXqo8nKo2jiYEYpRK7MITXNcPabFuozURh36T5nZwLBHCuZ3PhQWBW/qaSw6kthcZ3
         ID12QYO0/nxoyYOY5bO8Tiz4jJdP9qaXnN1PvQSWGTp33Ep1J45UvhyHADVJncoeGR8X
         2WTwCA5wiJTLTbze4OXKiZ2bi6GZ9mGv7n6oIENVMeBpFS1/95MwyDodhYN8OIpFtJnY
         i3Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020ad4574b000000b004746df5f2edsi3253671qvx.183.2022.07.27.15.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 15:40:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGphO-0004Ig-Ee
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 18:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgU-0003gs-9a; Wed, 27 Jul 2022 18:39:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:52740 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgR-0007uk-Hi; Wed, 27 Jul 2022 18:39:16 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oGpgI-002cQq-06;
 Wed, 27 Jul 2022 23:39:06 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org
Subject: add qemu_fdt_setprop_strings() and use it in most places
Date: Wed, 27 Jul 2022 23:39:00 +0100
Message-Id: <20220727223905.624285-1-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.187, PDS_RDNS_DYNAMIC_FP=0.001,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IvPzkCxu024e

Add a helper for qemu_fdt_setprop_strings() to take a set of strings
to put into a device-tree, which removes several open-coded methods
such as setting an char arr[] = {..} or setting char val[] = "str\0str2";

This is for hw/arm, hw/mips and hw/riscv as well as a couple of cores. It
is not fully tested over all of those, I may not have caught all places
this is to be replaced.


