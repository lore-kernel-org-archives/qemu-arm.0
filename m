Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp506530wrp;
        Wed, 13 Feb 2019 19:58:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY24GCIy2+8lr8h7HJsD4iDBJ1CTAdW0jSXl0Mq0saRp8dpsd9EFQJSm+OhYBlxQCENjj3s
X-Received: by 2002:a25:a2c7:: with SMTP id c7mr1299918ybn.411.1550116703933;
        Wed, 13 Feb 2019 19:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550116703; cv=none;
        d=google.com; s=arc-20160816;
        b=fP+Re92rv+kE1hPf/2WcAv6BjBRw1ZYaDYv85cTdLBShOttDDVDvOov7IJscE7DeJH
         A6E+ZMSq7XUcwBPTu+07lkkvHZNcnXmZrh318Z2jHOZ51fV2c0gv3ZFGG3az5zITtP8l
         iS+bHKIG0UXXeP0gVJBjZfeX43VhdfHgOMjprLsQyT3q4czjwQfeZ9b1pReHy04VVdrx
         81OneS85AH7dk+cUBCxnuUbWkyha7qh0rpnMgCIczUleJjb/Yavz51msLqHrhgjhAaJp
         ZsdaXjkpLbVnkyGcHjXiUZBcqu95+Vpqv/IFUI3sj31hpWWfWHDO972VHRML7Lyd5Ywd
         LLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=LY5syL0pyEGDn4IDGdZxhslqrDlmJwOplMyFI7S+0GI=;
        b=1CtZLArg8qxFLkIztw7LjvlIofYA5GnpjkKZ06UWn+8TDAdJY9N2nhRl8NUjiBYC31
         8AysqzjgrR13VVRrDL4IZ/tS2GsxoyOHwjA6N7Ys6n1bV9Xe5pptc71SJWg1GGIvQVL5
         8KiLiJO3YPGyIjzqa7UEsw+vmXKgCV8fpackFCaauCkbfI216p89sHxdCn2wkRGAewUj
         6G2o36tKCGr1+vjArnHXDAsXPoYRGrG/F+I0L8XLlDSBtahmjomwPN5pd8UPF6FzZDOn
         VjFflRT+nseHCtsZSu/P+QKX6c/5GORWpCEltnAGwRtELqHxxSPfRjUIAJXy79BL2jkG
         ciZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m/mt1EbO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p124si727565ywd.454.2019.02.13.19.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 19:58:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m/mt1EbO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gu8AJ-0007P6-Bd
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 22:58:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu89f-0006vk-Dw
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 22:57:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu7wL-00075u-8c
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 22:43:58 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gu7wL-0006xt-0l
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 22:43:57 -0500
Received: by mail-pl1-x642.google.com with SMTP id s1so2365421plp.9
	for <qemu-arm@nongnu.org>; Wed, 13 Feb 2019 19:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=LY5syL0pyEGDn4IDGdZxhslqrDlmJwOplMyFI7S+0GI=;
	b=m/mt1EbOuQUMspqeIhOq2mrnVykk3hXXoJKdh5qfoqmnKZnWHGNSoNxykSz3/29LCj
	hDt8bjutKBE+89BV0GxsjoT9xpU6SurbLcolTT2V6WMrwItE8JnHlMG6jd04EEiuQzgZ
	PdBkzmqjW6OdR+DdffAXR8tw6H8l7oepbCrYV7CLULULQxSJ+NjXMCdjzdhbOREMmZfR
	4Nnl1VnsttgnZ+TsADrFjX87MlmokAlqUqdhBIipN9100wkrsRLI9/A2v4gTLEFLWW0u
	1aAoRIwvZbxHYUg/plV0eA3tN4x9HY6FqRJV4kffs7faWGmwrOt9Gr3iRJLzpKBDhEOu
	eK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LY5syL0pyEGDn4IDGdZxhslqrDlmJwOplMyFI7S+0GI=;
	b=kWYKfI11DbWkWR/2Eu4Z3+YrUXx2nlQ2qKsWrZsIUCFlzpVq/25uIDF+h8CyOUI0sk
	gKo76HBwMOoxF2erh1CXvaj1Fbk0oEm7taw91B1tv4pj2FW5ORKlbagnl0oxGABu2vRR
	z+ouhp1Vobsyi8Ru7PkToVScwAZL2v0tZN5/+7hm8kBK/sAePAq6pHb0NGtoaDpnyeTT
	mkUQ4iQxZ+20+gQbFmWnjEyiXZTalmHuJz8jCJKhnuIlINgtgbFwxQ+10DrO3dw5b4sg
	pjb7V88iR/tp3wqQzM1Crxg31cPd8c7nkeHxxlFnYHiT6lJu3H6JNitrYZGwIBiCcFvI
	ARug==
X-Gm-Message-State: AHQUAubdmBXQuHQda7vCdDcrI/uM0j4yyFewae+QWWwOwXgV7tjljpFH
	zIqd8DVtNKvKr3cpZSqQtN3s9sb9Qk4=
X-Received: by 2002:a17:902:7e0d:: with SMTP id
	b13mr1896986plm.154.1550115827864; 
	Wed, 13 Feb 2019 19:43:47 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id o2sm972713pgq.90.2019.02.13.19.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Feb 2019 19:43:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 19:43:41 -0800
Message-Id: <20190214034345.24722-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH 0/4] target/arm: Implement ARMv8.2-FHM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b7RIVEsrxkPH

Tested with RISU vs Foundation Model, both a32 and a64.

I am aware of a trivial conflict with the ARMv8.3-JSConv patch set.
I just thought it was easier to manage separately based on master.


r~


Richard Henderson (4):
  target/arm: Add helpers for FMLAL and FMLSL
  target/arm: Implement FMLAL and FMLSL for aarch64
  target/arm: Implement VFMAL and VFMSL for aarch32
  target/arm: Enable ARMv8.2-FHM for -cpu max

 target/arm/cpu.h           |  10 +++
 target/arm/helper.h        |   9 +++
 target/arm/cpu.c           |   1 +
 target/arm/cpu64.c         |   2 +
 target/arm/translate-a64.c |  49 +++++++++++-
 target/arm/translate.c     | 104 ++++++++++++++++++-------
 target/arm/vec_helper.c    | 154 +++++++++++++++++++++++++++++++++++++
 7 files changed, 299 insertions(+), 30 deletions(-)

-- 
2.17.2

