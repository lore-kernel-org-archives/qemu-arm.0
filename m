Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4490718wrt;
        Tue, 29 Jan 2019 06:04:45 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7aUtrxkhFzMQ7W63TmpgxBL0EtMZF+HvmcyF4lRsIl8q+/pn5iwPb2OaWkGZWL3um+XAwM
X-Received: by 2002:a37:9604:: with SMTP id y4mr24418432qkd.279.1548770685822;
        Tue, 29 Jan 2019 06:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548770685; cv=none;
        d=google.com; s=arc-20160816;
        b=TnOWUqLkg2Shk1yPVeGa/pWljd55mfwO9U5DoCzES5CyFtNvbTPZJ+rnjLmKTEM3Qo
         cRdNpc50NuM4mvSDlU30lkX3eEZRRkxMr/danR9s9xi1Tch9eQrFhph53E4Jzw5UqXf3
         /Id020BVOXpX+J7cg6kJrqeYGw+JWBgUwK65bScwXpnW2xkiyn5NzNg6muIzULYs66a1
         gPz91tlj5rlo8283QZplil+99vRP3iwYjmxbmlnCFmOfKuALtGEET3sxav8JvV9W6czy
         KupB8MwlnO2FJVXaX0RILRF6gR7fBfbqEdQfECQUCrcesHsAxmJKlxVXglvyjmqMZfyL
         eeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=SFq4LirveFxOXcHyQo66CkZInBfhgMTrdZu5xJeK2mY=;
        b=YiT06fH7WiObEb4Z8ut5XXWLHFUTofjzPvujk/06Hk0iVM06EsFHlqmz3nScHpM8pc
         rAqjzrO4/SrDf4Xp2AXEpycrRn49AEcxxQTv4oPkqBUwjCGt74coOMyouIuxlNuOLApD
         k+4AG3oyhgZkWMB7Rl0RoL1VpRNP6fWy9n665vM3zJCN0BwdGQw9nZ/x6i8wKAKaIQvT
         gMKsd6z5nqHTvfbzz7Zf/6Gps/8oSczH27a0dH3/ky2W8MQ2FdABPyHDoAdjeZAAZ/e5
         zJfaHmh37rjqMR7aIDyo4s1Rlf6uy8JZbI3zX7bLLMH1XTKdtehfmsdUc9EkodoUELlb
         ANDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WYj6KAD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l48si1683632qvl.106.2019.01.29.06.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 06:04:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WYj6KAD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goU0L-0004cc-5s
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 09:04:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goU06-0004bz-KM
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goTzy-00009a-RE
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:24 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goTzv-0008QK-F5
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q18so22186213wrx.9
	for <qemu-arm@nongnu.org>; Tue, 29 Jan 2019 06:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SFq4LirveFxOXcHyQo66CkZInBfhgMTrdZu5xJeK2mY=;
	b=WYj6KAD0iQ3B0TafB92iqy0wqD5EgefMqzQtNFLE9uyK2bvhMR3MDwNpBzLTh3H7mZ
	RXvOnKYWUwtAfq41KozvUSq+P7u6ayG6NvpD42h/YxOSas4+5wU9siZMzMTtNDr2OhVW
	bni1Cl12bRs61KLtZKcxkoJeJVhBwRKWnnhcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SFq4LirveFxOXcHyQo66CkZInBfhgMTrdZu5xJeK2mY=;
	b=iljWTb0DdgCfFdkVNXp2ooy/jY4LHc1GK1NxHWIXuIaVkd1N4QeWdBydVbe6UhKSw6
	w622wANc7WInPWglZKbVlR74BAtkx1pRxMR8ydIoK16+p3jS50ihGBlrBb5HOFNHPOK/
	pnq/kwEXZANXj9ejXHWYqv7zqSHQUNYAoBvvvujm86cf8lB/al9noJDaWPisWy6fUFRM
	i2LyyzzjstsOFgpKijm9R1nZg31Z3RXOaEbb6i5cVyc+ioup+HySvCYCNEZIGTEdKZ9j
	u2wLpQ2LdT5NWqMQuXt5jcGxYEMof+KSTbbwwAdeHAPNxs1xBHfiKrLlYOtB966Jpplb
	jpfw==
X-Gm-Message-State: AJcUukcy5e2AXl2v1zhKoXyEFPmD1l+E31gtHZWKp1iUV/PCpzeAmCmK
	lK5OvjTT13Tm6Uqlc2QcchbsJIwsGtx8TQ==
X-Received: by 2002:adf:ee89:: with SMTP id b9mr27029087wro.246.1548770654034; 
	Tue, 29 Jan 2019 06:04:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	w80sm3876678wme.38.2019.01.29.06.04.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 06:04:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 29 Jan 2019 14:04:09 +0000
Message-Id: <20190129140411.682-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42a
Subject: [Qemu-arm] [PATCH 0/2] target/arm: Fix FCMLA decoding errors
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L23E6ppX7VJS

This patchset fixes the two bugs in our decode of
FCMLA (by element) reported by Laurent.

Based-on: 20190125182626.9221-1-peter.maydell@linaro.org
("target/arm: Fix various underdecodings")

thanks
-- PMM

Peter Maydell (2):
  target/arm/translate-a64: Fix FCMLA decoding error
  target/arm/translate-a64: Fix mishandling of size in FCMLA decode

 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.20.1

