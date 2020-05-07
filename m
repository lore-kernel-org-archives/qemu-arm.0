Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2060594lfb;
        Thu, 7 May 2020 08:18:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypITxEzi7umwydO5yl/fPfRp0oCmnmKs/CptTf+nPUYErTt3JQ5hoxQSlI8cdSBvmwo39Ihu
X-Received: by 2002:ac8:66c6:: with SMTP id m6mr14944907qtp.25.1588864720903;
        Thu, 07 May 2020 08:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588864720; cv=none;
        d=google.com; s=arc-20160816;
        b=RCVYWi9ixsQ8O7QJkNhuXT49tncT36Gl2wYxFpA3dPpa30wwW+mOim0Q5GZZV7gwwf
         B2fUzUQuQ2b6mOJ6hRkCtI+Ap6adUWV8zgO2ka6fC42MJSQHiKLb43Nzg34SbREnLmoL
         nJjBWAfjnlt+9NQts9zUL9/IRcGv3C3YUUmOZUqKGHd/EMJU2EgVDos+Y5fD8jbqAkBV
         Xwv/KiEWDNmG859UZrF8QfSMMmVzdnq6BjN44rq84QzwyVqbUgo5pye4BeEsAY9uZO6u
         /14l5+K5jfMsQDhcL1T2Be5+T/sJ41SDzQ1hAggRPm/1T/5enGQUr4BGb2Fy4rm4nrYu
         B8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TGcmfNlDWPZF6zKifFKModO2QCDgF7kjS3M9oH6wUnM=;
        b=UO7CN9XIOk+UlZt+YB1dsze/rrnRaJ7nknr0eEJOOAgbKYjWtjnY8+7o7cbdPVlDZR
         szAG2CSHpnVQHnMkmSnRJ3wizpW16Nop4enANL7RBAhrliWbwbQBzO3G22jcXgcAaWao
         17OwN23Eek5WDL/+/nynlI6x4oKSVXW8PLb7gGn2GE7ZK6zeG4fCtu49sAsOUT3rmYxY
         8qVp74s1mVqQJEJMzP/5GnIkiNKbOue763vLYZQj/4P6uSSk6AhXM6MoJp7JhWDipabp
         +x5v7W+VccqQIHKdBgYChFryNqrUax2FHK813cdWj4YQn7mNS/8lQN8KEBYtd7qLsuO1
         XA9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t/P45Hhf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x4si2423761qkh.245.2020.05.07.08.18.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 08:18:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t/P45Hhf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWiIK-0006sr-8d
	for alex.bennee@linaro.org; Thu, 07 May 2020 11:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiI8-0006pk-Kd
 for qemu-arm@nongnu.org; Thu, 07 May 2020 11:18:29 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiI5-0002Zp-Vj
 for qemu-arm@nongnu.org; Thu, 07 May 2020 11:18:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id z6so7279841wml.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TGcmfNlDWPZF6zKifFKModO2QCDgF7kjS3M9oH6wUnM=;
 b=t/P45HhfXSOxnzevGByJpsItNSTteT0+FvltoX/hvsGi2Gt5qrpcA5tCi2ImJ20sks
 SjJmu7pWh5VyXeXUQDukMRJiy3znFPJehUFE5yYs9cxRPiRaqy1XT1HZMzoZRiiljPVV
 qYFhsL/KjSfz62iHQvrnRI+e5B5G4wqtiDDjdLcX4x57rXvPNuhAUSJpl5pEKzB/zzhj
 D06xc3GpGeLqAmdHlUl3TcZV8k9CryzQGgdRUdxu825z+k4vpchW0uOdNpxf4BVJ358D
 qzdawIJgwKrJWUbypZlQPR6SWCKhtxWfNZ8Z4f5Ji4KN7F1DYLEMAWgyFMWCMLcb9o5T
 Xv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGcmfNlDWPZF6zKifFKModO2QCDgF7kjS3M9oH6wUnM=;
 b=NO/cUP0WN+tddG5fruZAq8ZegzqwGWeqAMe5wcruRvQftfIrZJM/JvD4FU1eoDBljW
 CpIvjz/G82doYE/zEzmn87zRB2AZpWlTImj4i++lzmGLAjMY5V2krHCsKfRZq5MZpZDv
 KEi2kiBy9elzH/+vhLSESHp8Ucz9j00387n465QwUfOeyLykYTvAFyUMfkYx9MsPo0Nx
 QFtoMXaro0cPn7+zzXCdhNC8EPMDeqrsJib40ulkZicn2ttef1ndNq+S2ZZeGxJOMBUE
 yUugtC/QEslPmeGzHgvKinUwLyw+E5yUESltkMkjIW5sapmMHQrE5CqTv9+YSqXADdgT
 pqFw==
X-Gm-Message-State: AGi0PuZ4bS7pufOy5g/vJ/B+HD28p3JJY8clGHX1XiSCdW1AXIrmsAXo
 OO5b6p5LEisliOcbedrQItYGfZjbIkd2PQ==
X-Received: by 2002:a1c:dc8b:: with SMTP id
 t133mr11000234wmg.117.1588864704035; 
 Thu, 07 May 2020 08:18:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q74sm961246wme.14.2020.05.07.08.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:18:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] docs/system: Add 'Arm' to the Integrator/CP document title
Date: Thu,  7 May 2020 16:18:15 +0100
Message-Id: <20200507151819.28444-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507151819.28444-1-peter.maydell@linaro.org>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: 7plFYG1TQ4WY

Add 'Arm' to the Integrator/CP document title, for consistency with
the titling of the other documentation of Arm devboard models
(versatile, realview).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/integratorcp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/integratorcp.rst b/docs/system/arm/integratorcp.rst
index e6f050f602b..594438008e4 100644
--- a/docs/system/arm/integratorcp.rst
+++ b/docs/system/arm/integratorcp.rst
@@ -1,5 +1,5 @@
-Integrator/CP (``integratorcp``)
-================================
+Arm Integrator/CP (``integratorcp``)
+====================================
 
 The Arm Integrator/CP board is emulated with the following devices:
 
-- 
2.20.1

