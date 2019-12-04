Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp666299lff;
        Wed, 4 Dec 2019 05:56:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHQhazeI6LzeuUUOCpMjTsOs/XHgBX4F2Dxj37WGrM3v9HfmOkrEPxlFlhEyRqbVF156O/
X-Received: by 2002:aa7:c159:: with SMTP id r25mr4092401edp.42.1575467801977;
        Wed, 04 Dec 2019 05:56:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575467801; cv=none;
        d=google.com; s=arc-20160816;
        b=D1JsYxgz05rZ/6bEQDnKEAIx+jEWieez9nF9nTa7GsGnrhmpZLSnrl0HNG8mopkQF5
         58y+eHOBxnZtqA22Ii39dJtUu4j6V3k5p82KbLbQq+mzGbPmlXTgAIimnqKwBRl8PQ3S
         d+gm+1BjqnZ1PqR8YyKtS/qTMfwzf4OQIjaD8RqYUkobzYskPoHeVJmXPSedq6tMezDw
         5fTKi0nC1hP9Xn6W5EazwNQXahbuQ4jZvjrGGI0ctFzH4MH60dIrtzslpJi4npTI+ANo
         oM49bpxJeESbYoGQliTmXDIDiQxbVeqO3G+71ssV8ZSEy7YrOjMbHlkNM90MqZdQ7UkZ
         i4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:ironport-sdr:dkim-signature;
        bh=amRmOZ81ssXzZqOVsDMBobbUW7BTTADIGSXfhNanSq8=;
        b=rcq6SxrmPNgVsU3cfVGfWNA3lmInlJyC02dpwyKLrN6YagwfjMnm0zr9rVD4KNDoyW
         trsNGSflztzaNQA9DemaVAue6TKj2MJn0uNvIiQhtmQcS5JS+++wCDBZpWasZ+7zJw7D
         b+aUNR7PkVTlqJbyn+IFW8m83IbcOodp9fHjiPQq9JuWS1EjkPaf1RznYUjQFsB3uJRr
         LMxAZb9YP78uSuVDMW34D5sJLAv+c2z7HyyvJB5dzPBooMbPFOZ6xeXpB8jzTMeVH6DR
         AVVsaAWbzTJbiTURXI+1wNpr+UIBQTVAmBv+aOaOsx70niDl5apR+OumLYEBc0sOyNBM
         iF2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=AgcBFSXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si4725404edz.90.2019.12.04.05.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2019 05:56:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=AgcBFSXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:39232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icV8y-00059N-AL
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 08:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8j-000578-Dp
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 08:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8i-0005DD-92
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 08:56:25 -0500
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:9490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8i-0005BH-2F; Wed, 04 Dec 2019 08:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1575467784; x=1607003784;
 h=from:to:cc:subject:date:message-id;
 bh=amRmOZ81ssXzZqOVsDMBobbUW7BTTADIGSXfhNanSq8=;
 b=AgcBFSXrH15UHCFncEIWqeTYwSd8VKm73tGjm4FFarhcFIXaAojjEaKP
 QCH97zxXsXvrnrnPEyePD7a0W7Qx+qDsXPWGlpEhDJEOVsFH/ARVpmN76
 e/A18NNhTTQ3k46nQ7PcolqFz/ZgjpQOJYSnMf3SPKA/3p2fQCN1xBAhy Q=;
IronPort-SDR: yUaUEAX32SYqXk8ZjOlm+6F+BYcvUIP+QNVXs80cyWQWILsbhPkduqaBOJQeL+KN/s7WL/0Wpb
 +CHvJ2bEC2Ag==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="3177649"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 04 Dec 2019 13:56:12 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan3.amazon.com [10.247.140.70])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id E7A91A21B0; Wed,  4 Dec 2019 13:56:11 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xB4DuAqV029090; Wed, 4 Dec 2019 14:56:10 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xB4DuAC3029089;
 Wed, 4 Dec 2019 14:56:10 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>
Subject: [PATCH 0/5] hw/arm/smmuv3: Correct stream ID and event address
 handling
Date: Wed,  4 Dec 2019 14:55:43 +0100
Message-Id: <1575467748-28898-1-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.184.25
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: blJwbbxEup5/

While working on the Linux SMMUv3 driver, I noticed a few cases where the QEMU
SMMUv3 behavior relating to stream tables was inconsistent with our hardware.

Also, when debugging those differences, I found that the errors reported through
the QEMU SMMUv3 event queue contained the address fields in an incorrect
position.

These patches correct the QEMU SMMUv3 behavior to match the specification (and
the behavior that I observed in our hardware). Linux guests normally will not
notice these issues, but other SMMUv3 driver implementations might.

Simon Veith (5):
  hw/arm/smmuv3: Apply address mask to linear strtab base address
  hw/arm/smmuv3: Check stream IDs against actual table LOG2SIZE
  hw/arm/smmuv3: Align stream table base address to table size
  hw/arm/smmuv3: Use correct bit positions in EVT_SET_ADDR2 macro
  hw/arm/smmuv3: Report F_STE_FETCH fault address in correct word
    position

 hw/arm/smmuv3-internal.h |  4 ++--
 hw/arm/smmuv3.c          | 39 ++++++++++++++++++++++++++++++++-------
 2 files changed, 34 insertions(+), 9 deletions(-)

-- 
2.7.4

