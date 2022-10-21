Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp887790ejn;
        Thu, 20 Oct 2022 23:14:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7V20nYq3XtYY8US4yhrqsgSFb2+78mYEI4wO3JNz+F+yWed59rVMYWvNv9aP8F7qOOo3d2
X-Received: by 2002:a05:622a:1713:b0:39c:e41e:2b27 with SMTP id h19-20020a05622a171300b0039ce41e2b27mr14229438qtk.45.1666332860568;
        Thu, 20 Oct 2022 23:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666332860; cv=none;
        d=google.com; s=arc-20160816;
        b=H7XR2lxJn2+UI4gfGUY6pPVKh3eGKPEsGpW24go1P4YN8XQdCjJ+iqWoS1ji15bhuz
         9f6nvt20Am6JuEY59XeoqLqsrOrlZbq7SUaCpm5VMld/Yzglaoxmp/o8zgqBbXUQKA3X
         Eupw5AFFX6zS/7OGkvKKUSi8+e32WT+F6I6kSKORN7o29k4e9ZsRCB/ZHwh+cMzL1/1m
         nf31oYFjeaJQabbnHRMCJvh3YUgE9hJog0YZy4rQ3gFGfj08UZxeSAjh7WfpCY87ofFG
         9B660pCoo8LUcgybGliIA8BxSzsfA0grKWFWLAxoMzsARYW3qAFTytDl+Oi9yXxli1OH
         4faA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=JlvdarTIghoeAzFtBqOG1O/CiP4wctc4oOwyZ6vlQ64=;
        b=ak6wxJVSFtdl13tH5K7x9+OrAczw/tYKovwwTAqbfE1f8IrPWwYzpXZXCH5GU6KXtE
         ASFp+1VYzu1g/qWmkd7MS2ZtUm5ulXTv5Za0Pm/m1VTQuGHi1fCGVCwc6wP5/gO4ZuHI
         4Ikq9uOpGvZn44AXStaM9tYzgqZgfzuSNWOsNM6eJCfi2Eyk3wxyEv+lElIB8xBHlOxd
         JgzaKqS45VXVjSSAj6b/8ACuwKsV53X36EWisixfZMRCUp2LSp6A6k1ZyckJWXWKR8/I
         mAkryOybzq4c1IPxGKPrPRdS9eXTNiq49/pa4VAHqAoK2wEJuIF9pqXsdDHw5vRIU6yV
         AwHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq11-20020a05620a468b00b006eedea7cc62si9221795qkb.662.2022.10.20.23.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 23:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ollIN-0002hn-C9
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 02:14:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oll2x-00012p-In
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 01:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2w-00011e-10; Fri, 21 Oct 2022 01:58:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074O-2r; Fri, 21 Oct 2022 01:58:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0L-29;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org
Subject: add qemu_fdt_setprop_strings
Date: Fri, 21 Oct 2022 06:58:02 +0100
Message-Id: <20221021055808.342055-1-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.4, PDS_RDNS_DYNAMIC_FP=0.01,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-TUID: nkk+ZWjk60Dt

Add a qemu_fdt_setprop_strings to set a string array into a device-tree.

Only minor updates from v4 to fix a couple of minor patch issues.


