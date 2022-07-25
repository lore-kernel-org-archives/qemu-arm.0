Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1019150lfg;
        Mon, 25 Jul 2022 11:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u0YIGyp8Lxz2Tw96/cpCiUzr49u8c2/AuFq4IDk5R18Djc8U73pyEPgmIFShkUzBf2Jain
X-Received: by 2002:ac8:5c03:0:b0:31f:1bef:1915 with SMTP id i3-20020ac85c03000000b0031f1bef1915mr11280132qti.26.1658772994090;
        Mon, 25 Jul 2022 11:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658772994; cv=none;
        d=google.com; s=arc-20160816;
        b=yzp9FR05i3saIhYp8k8z7IeUpmoQylXjUgx+p6qF24yDJB8Mna8KD8g3/oPVUD9cNN
         7O/fB2vwDOudEvfrmRtm7dEJC3OO0o2bNV/933SgANQ8LDTXaNgPM1TGQKtZZiDWe4Mx
         3BFlSGsbhCYu/CgL8b53jK2lB6yzo7ByV7vTTNFH5PiBv3fY+GnhZve6d0rNMZKOrpCO
         9ru4a4qOCKNKrOJR3PxCyjq7bvYClpNsHu5cFAST8kfw8G/+BGSiiBl4C1bQByk5tR5i
         NIsr6dl1K7N/xpqLEIZosYqBYThMo7W2Nb9WJo01q66vbrz8fo/XVEPH8rMzdW21XZeT
         PudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ViJBlpwDyPMMbahD+o1p+IIPNsSREaHwlObWQOXKMwY=;
        b=z1hvUaVimVKJbgYGpT7KMeZefaMKbBVbbSk5Ugmn+q1cEK4iJvRGj4Ry4XXdfkDr3S
         WoSfg2OIwA/QMsIVshu8qx6dxWZMMuZFg3GL4i2VYth6RJOkPg58rVNIGrHufUugbVTF
         y3g3tPLklRdVcoEkFUNtzES9IAeSHO+D8O6L5lZ/AZhel8iLAH5Jj1Hm3K/F5hBvj3YS
         VowUU3tscIkZQonPtaSJz7iBQCdDD5EfXUw/FQ4V99KeUMwUolRd1EqnyQQFwwwNAfLU
         9+Q0EzmHODFvosaEp2gls3iKj2uQ6KHhK2nqwtdK8SCJliiYkOGARW5J/GayGpj+EpCl
         cPSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IewS8qWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br18-20020a05622a1e1200b0031f2099f4efsi6017916qtb.476.2022.07.25.11.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 11:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IewS8qWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oG2d7-0004pU-Gg
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 14:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bo-0004mi-U1
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:15:18 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bk-0005pm-Rs
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:15:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 y1-20020a17090aca8100b001f2ec6f3ebaso54552pjt.1
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 11:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ViJBlpwDyPMMbahD+o1p+IIPNsSREaHwlObWQOXKMwY=;
 b=IewS8qWsSk2wEK0DAhao5gNI8wth6xFFF0W2Qu5r/ZA8yP8Kah0uDXsdS+ZPORJADi
 BcCOUAbW9/gpDK7yOgQA1B78tWkprN1pskSTdHNPyYdF0FTzBv3fZVRFH3wnvzrypUsb
 SwJpIa2yUfUcgWqeAigG871Ojxk25RBNknmTFMgBZIeIcQtKx6iG5Sngpk77bNTBiqri
 xh05yQqy4a7kSkn0kASJLiBv1J/ie9eV7M+YvqPJ202PKOsKJINGE0D200wZvuzEyyN2
 n2L57QL1ZMQx5da7BU06vIM23Xrgtbg6/hRmAV+NoywqfZ1d5BPDvd/sGXSYRN4i3/XP
 21kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ViJBlpwDyPMMbahD+o1p+IIPNsSREaHwlObWQOXKMwY=;
 b=6zEoVkhBfXGg0yXh4QvcVezq4OlAKsrt5TKH78+SDi5OdZkBwg3cvl14Nib+9PbhLl
 exRTfvp/MV5h2cV340/8ziOezJpkaNDJk88vQp8tH3h5WPtXmHdQ2BzcuQwh1YXeJT9F
 r0l+9uNfDl5bkLpw8lYF60NtqWFnOdHBb0wPQPxIdretraghI66Pa2dUFHlXf2nOZkoU
 nKnuuTLliDTiR/S4Am0JRb1AA54DBD6dcCUHSmxRN+IqfGLqPFLY7INISh7PmeihLGWY
 UGOIyMVrTaHN14RcyCnfgh9aDymkcGM+PoUPNIGHnSC87aaKprpjYla5N1u5fhndQfhr
 6CMQ==
X-Gm-Message-State: AJIora8JlYHLIHSGrIYYTeJ+NsjHXqbLuOySNJb7bmt7QH7Gy4C7eWyv
 78q7arCEcTeyc5DG9mSJDG12QA==
X-Received: by 2002:a17:902:9005:b0:16d:296b:6272 with SMTP id
 a5-20020a170902900500b0016d296b6272mr13341562plp.144.1658772905687; 
 Mon, 25 Jul 2022 11:15:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b0016d8d277c02sm1125004plb.25.2022.07.25.11.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:15:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH 0/3] target/arm: Fix kvm probe of ID_AA64ZFR0
Date: Mon, 25 Jul 2022 11:14:54 -0700
Message-Id: <20220725181457.41083-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UKJsWZL2Fss3

Our probing of this SVE register was done within an incorrect
vCPU environment, so that the id register was always RAZ.


r~


Richard Henderson (3):
  target/arm: Create kvm_arm_svm_supported
  target/arm: Set KVM_ARM_VCPU_SVE while probing the host
  target/arm: Move sve probe inside kvm >= 4.15 branch

 target/arm/kvm64.c | 50 +++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

-- 
2.34.1

