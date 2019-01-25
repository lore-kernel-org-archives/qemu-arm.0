Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp616328wrt;
        Fri, 25 Jan 2019 10:27:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6NlcBN2QmNHBqDFfL/xrXa58thXOJZXw1MDt/KlwLDIBw7LbjBgXgXQVRC0wyyNAL4L6Gu
X-Received: by 2002:adf:9382:: with SMTP id 2mr12320513wrp.269.1548440838729;
        Fri, 25 Jan 2019 10:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548440838; cv=none;
        d=google.com; s=arc-20160816;
        b=k9UoyoVzmuYW/Kc7Udna52hZsPOrGqgD7GNjKK4TdOOyXPek10CO57l0e22Z4KuDx4
         iY74ZrBfPzFyiByxr2tOiMSm3gztJ1n43yeoeKM+S80wIQlUM7orQW5wNIBBL4sL3NiV
         A8owEFBm76PWwacgr1jRM+UzSTAAaXjAE67WrjY6OR4othov8SDd4HiyhJagtfZnJ0zg
         am6MToi6m5FYgJYJwgehZMLIsPRbd07JO69/Y6POnuBmbmtCLO/i7ZbjS4HyAl3rvxfL
         BagZfTRaQoUb/Mq4t0NsARUW45Yp/YuxFWY9YPXN/cHc+RPfsFyb3+x7XKgFrIa1wOUb
         6egA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=BwvnS0RP7EYeThR6KZ6gSsrUipmzStGV4Ytjj6MNAiY=;
        b=hbycJ4j9n+YcGXKVZSOnJnV8RjRQQra8i/xtFvnU2yMdo2NE9VfdkgZQ1uyAG0pg+p
         cf9Xyla4YG9oAoOJLesBOhPDljFngKAswO5dKn7V9HE7GBZSz1MZu0Hbk63Znv1KJuDf
         g360Xvq1vZz7Ax/MFHsFi6WXOJ00a0BwehKsWYDgcPitRv45DotbtsC8j9VB7AgtMXuu
         Q8NQ6comAxAv7nikz6n1WNTto5CqMz/ij+BvNSb5FjM80C78gScxlnFyyifbdsJ8VPWX
         tDgVFogiLdkjGxqtbYbi2douZTOVvkDh8PTxlamnM9dW2ymBSe+0Z5f2TwE3sfZILka/
         gCng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eKR8UREB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si73821407wru.442.2019.01.25.10.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eKR8UREB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn6CD-0004bZ-N1
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 13:27:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bj-0004Js-IJ
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bi-0002cu-4V
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:47 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33940)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gn6Bh-0002RZ-Ri
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:45 -0500
Received: by mail-wm1-x333.google.com with SMTP id y185so5389507wmd.1
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 10:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BwvnS0RP7EYeThR6KZ6gSsrUipmzStGV4Ytjj6MNAiY=;
	b=eKR8UREBWMmcaM/eNl0z6TF0TRD//pQ7UXt7VffxA77S1TKNeYwRT6wdohOgXTiqcb
	EdJUnWSW7cYr3Lc7HqnQfojjhLQmLuPaRrBKna8BicxmcIMcoROrzSc3MYzPm/olsA5E
	FrznqvE8ElVXq8+Ue5P8BBWowhPfn88s/bM7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BwvnS0RP7EYeThR6KZ6gSsrUipmzStGV4Ytjj6MNAiY=;
	b=Y6FRVtX/Lt1kUZx8C2zfb06h6PjCceNm0WXtFibbMaTGtzoqVynKJb6zE9oHrnpUnu
	FSXn/iASsCTaj8XY+BXdxhSlgfRdxZNgoACGJHK3a4pjs56IevhBF5TUkzgOo8gcrs1m
	IhARO3kYsF1afXmBl7K2WGBpN/TyicBfLSw+94sYbb5indIs79sz5IuiIcuvu9GuizoQ
	nBQmx/YKrEw0IEH0EWitPYEhOE0iGU/M3WWvnO/BvOfK4JwikBsWXAfvSoJzWFbEXrST
	+PlFhsPQS1/TZLdpUtdykUV+K7US9w4a3TvULtqckZzidgs5Ei6cP/ulyF6ga+UqxT+g
	aj+Q==
X-Gm-Message-State: AJcUukd2J0GN8yX0tOZpxk/aWqjWpjTJu0FNNeJKz5hN+G/Bs8pt7B1s
	19jWs4EOcCJhhpeoM6Y/tgsOf+sYSll6nA==
X-Received: by 2002:a1c:1d8e:: with SMTP id d136mr7623846wmd.98.1548440788923; 
	Fri, 25 Jan 2019 10:26:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	t5sm45014921wmg.43.2019.01.25.10.26.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 10:26:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 25 Jan 2019 18:26:19 +0000
Message-Id: <20190125182626.9221-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::333
Subject: [Qemu-arm] [PATCH 0/7] target/arm: Fix various underdecodings
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wJQebC42Szox

This patchset fixes the various cases of underdecoded instructions
that Laurent spotted and sent a bug report for. (The exception
is "missing default in disas_data_proc_1src", which got fixed in
commit 18de2813c35e359621a.)

thanks
-- PMM

Peter Maydell (7):
  target/arm/translate-a64: Don't underdecode system instructions
  target/arm/translate-a64: Don't underdecode PRFM
  target/arm/translate-a64: Don't underdecode SIMD ld/st multiple
  target/arm/translate-a64: Don't underdecode SIMD ld/st single
  target/arm/translate-a64: Don't underdecode add/sub extended register
  target/arm/translate-a64: Don't underdecode FP insns
  target/arm/translate-a64: Don't underdecode SDOT and UDOT

 target/arm/translate-a64.c | 53 +++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 7 deletions(-)

-- 
2.20.1

