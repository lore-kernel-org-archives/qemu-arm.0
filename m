Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp446670ejc;
        Fri, 6 Jan 2023 09:29:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtJc8PG/rGkXjxb5bwLiD0+x79eiOdS7KE16JUE8fzD2dUFsDCWShnW+xL5yzcAeQEVGRUl
X-Received: by 2002:ac8:7655:0:b0:3a7:ea5c:f453 with SMTP id i21-20020ac87655000000b003a7ea5cf453mr72288216qtr.9.1673026152284;
        Fri, 06 Jan 2023 09:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673026152; cv=none;
        d=google.com; s=arc-20160816;
        b=YgtrQ1h2uAz/TN+5Er9lFY45ByqHioe6yYRo5xhJgDp9uh70m9WCOEWuACGHDl/TPQ
         E9Uundekxt1B9i1jbtr8B3RyeYYYzMVKQT0P/Ho19o+Yb6e47XiUVMJb71dLNMa9Akup
         G2bGlEkWKzsjZI8vSEjxeXztLoL8GRIyEt3UY/1/CbOyqdrgswhlUQFG/rSoT4845Dpg
         ebqaswZSNjdYbh3gt9SgHETKmWfJ+uaYUeRHi/swwKMPFD12ifVJxf8INlfSQh38zhCN
         Fq4KNiHwokOCZy58ZReWKBdBydjk0E3Q1cITQPtQTdj5b9PeVfMrCJ88K8POm6RjNAPD
         t2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=P7KG7W2xk0l0+mElEeVX1hNHOHzvVAM/573gniUSkoE=;
        b=NDRuo2J4NXrgTjQ1DVTio6oEnCUyOb73ZjO0Yx+89TEKtHuvDdVT4yM/EVdMRDxIoV
         ftB+dgxUMxa4eqPmNdcegPNanGpjK68NP6nR1DRfGHE0QFSFC2Y0nh1W3bwIWVyjctzE
         8fV4//C+Rm4GVoK7rCfcgzGRsGtDaH26k0qz5IdQKs8DUi0A2PP6uNCsxtMxDQDvFt2Z
         ZOzsgsPqAH1ngcLGM4N2dXlBzneO+Np8+dEg3MxmIlzMEmmKxoIeAXRjg0DAOXJAG8Yf
         3WRY93cdZYu7VWwnO75XzyN+MpRXEOAe3Ra+Hd/NcqB3qonQBMgHjqqzFG8mUHkTv4ZR
         BQsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=LHLN+S0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ac8474f000000b003a7f5484791si1048632qtp.487.2023.01.06.09.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 09:29:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=LHLN+S0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDqWe-0004RI-Fz; Fri, 06 Jan 2023 12:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDqWb-0004Pu-75; Fri, 06 Jan 2023 12:29:02 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDqWZ-0004R3-2x; Fri, 06 Jan 2023 12:29:00 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2C1BE20B92AA;
 Fri,  6 Jan 2023 09:28:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C1BE20B92AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673026137;
 bh=P7KG7W2xk0l0+mElEeVX1hNHOHzvVAM/573gniUSkoE=;
 h=From:To:Cc:Subject:Date:From;
 b=LHLN+S0uNy2OBxkW8kKqjB4NrCYL/xrB6Td15NZ+w8wo6X4xqidCA8axKoO0prMqU
 gsyJDD0I5Td7R8o9pW3Cl4Y11KbpMZjTFJa31ChVWWNd5773mbmHqkjkvG0TzbFEq8
 5pXRUIoVQyMtD0jcGiiRlJtwSk2/hX5C8dVl7SaY=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH 0/2] Series of fixes for PL011 char device
Date: Fri,  6 Jan 2023 18:28:49 +0100
Message-Id: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: OkAbNM+0T6U+

Evgeny Iakovlev (2):
  hw/char/pl011: better handling of FIFO flags on LCR reset
  hw/char/pl011: check if UART is enabled before RX or TX operation

 hw/char/pl011.c         | 51 ++++++++++++++++++++++++++++++-----------
 include/hw/char/pl011.h |  5 +++-
 2 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.34.1

