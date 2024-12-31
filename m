Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp8437098njk;
        Tue, 31 Dec 2024 05:30:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeedq1RQZ+hPFy3j5Nuff/JKgfZBueSM19lS/zMIGmcdjmnL1JqnCl9QptQQPwPUGDtrM/a5pqehkjjg==@linaro.org
X-Google-Smtp-Source: AGHT+IFO4+93fFqrJm1/bckFq+EF8Wdc5RZnrNLdtKbt/YOexSVVOWyucmkMc2p7grAatOLPPJBx
X-Received: by 2002:a05:6102:fa9:b0:4af:a216:c0d0 with SMTP id ada2fe7eead31-4b2cc108d92mr36655126137.0.1735651850582;
        Tue, 31 Dec 2024 05:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735651850; cv=none;
        d=google.com; s=arc-20240605;
        b=XP6HvNyrV1Iqa3uhLp71/4v7mzBFK96hb9cqlDkytfAaQ/WdZ0lnxMABWrq8MRoBnf
         pcxkvs+nPVKf6N/1GvcpQw93jbeyn0RQ8QiDAV2R8kVHpSW+7vF2Kupme1I8us2fpsVk
         OqHNH82Xt4l39xCbxju4Kf0LL4V+RxY9lKIbY6st541yQ+Ndypc0nM119gdLczEEX7/3
         dk+CNl/oaHXiDRh78Z7DozYoqW8gYNaKN6Mc1NlhNPopmGl0CMkxF80hUIZTBLWz1WB1
         1p9n9ljURI3fzvAMBBs4mrq63WIhUdAJJzc5Nq/uDfDse2PCTIfDedfrrZWc+Hr71ls8
         c/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:content-disposition
         :mime-version:message-id:subject:to:from:date;
        bh=Gwg7QalZrfeZx1k3mmm1N/e29AN0UOs9uUlTEvU1NJ0=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=jPGlLGwg/HxllkK+w0z7nBKYhgHr1SdQ+wSjGCgndd4HuADjOjtx89Jltph/D0Ptcs
         l6Pqq1X53WVBWiEEBLcZ44M5XW8ui/SUWNJyz/Al5V0DDffl+RnndrT3TEof0Ix3v2Bb
         hqvlbp8pZ/AB8OGe+OjGO79ntv0a4wyxBrGZsAd6BZFyDGuZnjql6prEICv+wc1yS8Sa
         urUa7tuoYNt1Sv60LFOhfPZbs1xbKA4tvea0ZJooW8S7hlRMBH/FWo9lCB53d7w6rD2O
         7qJKhTjtn0rBqY0X0Y1sxioSN7Vj1Immowq93NfA50y5ouktLvNEv9xqCinX3I6OpzRB
         y/Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2fd0a5c1dsi5091530137.94.2024.12.31.05.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Dec 2024 05:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tScKW-0006yH-5k; Tue, 31 Dec 2024 08:30:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lists@dawes.za.net>)
 id 1tScKQ-0006y1-Hr
 for qemu-arm@nongnu.org; Tue, 31 Dec 2024 08:30:35 -0500
Received: from lisa.dawes.za.net ([178.63.77.189])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lists@dawes.za.net>) id 1tScKO-0001yP-Hu
 for qemu-arm@nongnu.org; Tue, 31 Dec 2024 08:30:34 -0500
Received: by lisa.dawes.za.net (Postfix, from userid 1000)
 id D797E140253; Tue, 31 Dec 2024 15:30:28 +0200 (SAST)
Date: Tue, 31 Dec 2024 15:30:28 +0200
From: Rogan Dawes <lists@dawes.za.net>
To: qemu-arm@nongnu.org
Subject: NAND Flash emulation?
Message-ID: <20241231133028.GA458@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=178.63.77.189; envelope-from=lists@dawes.za.net;
 helo=lisa.dawes.za.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: O7utF/DqgLhu

Hi folks,

I am trying to modify a file on a UBI/UBIFS filesystem on a NAND flash
on a locked down i.MX6UL device. I have desoldered the flash, and read
it with an xgecu flash reader, but am now faced with the problem of
trying to decode the flash (FCB, OOB, etc), mount the mtd partition,
modify it, then convert the image back to something that can be written
to the flash chip again.

I have tried nand_sim so far, without any luck. It appears that the
version of UBI is no longer compatible with current kernels.

One alternative is to purchase an imx6ul_evk, solder the NAND onto the
board, and boot from my own kernel. Another alternative I am considering
(purely due to the cost of the EVK), is emulation.

I was wondering whether it might make more sense to try and run the
kernel under emulation, pointing to a different root partition, mount
the flash partitions, modify them under Linux control, and then write
the resulting image back to the flash.

However, it seems that there is no GPMI implementation/emulation in
qemu, and so this seems doomed to failure. Unless, that is, that I try
to implement such emulation myself. I have no idea how complicated a
task this would be, but it seems like it might be simpler than the other
alternatives that I have considered so far.

Does anyone have any pointers on where I should start reading, on how to
accomplish such a task?

Many thanks

Rogan

