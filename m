Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3309615ejf;
        Tue, 9 Aug 2022 12:04:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7mmal55fijr4YESt9MC8IOH4PlYMH0HhzHIsJQ4erbyXqwKfxH8K060AUu+wDmobkMyXT5
X-Received: by 2002:a05:620a:4489:b0:6b6:1c1d:2fc1 with SMTP id x9-20020a05620a448900b006b61c1d2fc1mr18872876qkp.703.1660071852585;
        Tue, 09 Aug 2022 12:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660071852; cv=none;
        d=google.com; s=arc-20160816;
        b=mKSsHflvp0BgjrON6/s+h9+JauwmRutWPNSB3iA1LVlD5R7cr0goOskdgLdhx6Vn4o
         4cyldMcXMdm/fdLbWy7B/KswSsU3C1N+B0CA4zofAwlRyrOzHEAvopjmfcsyowk5NcO0
         8oFgFa2hphnUeQv1J0S/lDyCiNVRXlFCPMDiec/2Wq/qdhYNtn0yQCEDw61aSf/ClQtW
         0H9gd2k2Vd/55Gy9l04m3nMMfnRz+AXfPlsdpHytNI9JyzZo7tdoRtfjl1qvheBt65Zj
         DtvZ8y0rICbHTMkrMFqGJ3Y8nompkOL3UvRQNr2KO1JoUleLd2YP0/4n8elu4zrzdqmK
         xpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=9hhQo5rrgo96zejCamVjtXDZ60kb/C47QZI6h7LB4/o=;
        b=hbOhlhnmSEVphWOTW9DjrCxz7C1aG5PCQkQ5wG4QnR43bOJi/VXTWJzHD/3u6SFZhp
         eEWsmDyvp7GqoUxsXp+vTkEWi0S5jUVfppPpUcVO01blnU/5mDN0yhGTmaXG0rP9qV01
         A4rwEEOzBBQ1ZmgtmI9JmXRzEKtaYck8QTJkgcsRd0V/qLyJdZGYsOcTubmbd56Vrt7N
         so0VWdCwCgcKH7Y7PTQq3zsMBa9SRM4eKSgZkFOOPKHA6ShnTWDQlQ/mu6SQIQLZ+l16
         DX0O+4U83465vOyv+UZWNygjrxu2B2F/6oDSqlZyFLSG/z73ORKINVBqZQGcKwWqia5/
         E+Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl12-20020ad45e8c000000b00476e89faef1si8387571qvb.471.2022.08.09.12.04.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 12:04:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUWS-0005hH-3N
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 15:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ9-0007KW-8q; Tue, 09 Aug 2022 14:57:41 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:57384 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ6-0003AR-LX; Tue, 09 Aug 2022 14:57:40 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oLUPz-0039Dq-2C;
 Tue, 09 Aug 2022 19:57:31 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Subject: add qemu_fdt_setprop_strings() and use it in most places
Date: Tue,  9 Aug 2022 19:56:34 +0100
Message-Id: <20220809185639.750345-1-qemu@ben.fluff.org>
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
X-TUID: yIQNHpO0Pu0G

Add a helper for qemu_fdt_setprop_strings() to take a set of strings
to put into a device-tree, which removes several open-coded methods
such as setting an char arr[] = {..} or setting char val[] = "str\0str2";       

This is for hw/arm, hw/mips and hw/riscv as well as a couple of cores. It
is not fully tested over all of those, I may not have caught all places
this is to be replaced.                                                  

Changes:

v4:
 - fix checkpatch issues
 - remove error checking in hw/core/guest-loader.c
v3:
 - fix return value for the call                                                
 - add better help text                                                         
v2:                                                                             
 - fix node/path in comment                                                     


