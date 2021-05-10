Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3258527lfg;
        Mon, 10 May 2021 12:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ7XXKnMGG8EKf3pXhC5wFxKTq7hRbImvO5x+DNGDlGDDUhN19orQptMV2ZAdDjerDIEen
X-Received: by 2002:a92:d7c3:: with SMTP id g3mr21225526ilq.114.1620673771343;
        Mon, 10 May 2021 12:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620673771; cv=none;
        d=google.com; s=arc-20160816;
        b=j8M4wBbuFlNjz/ZDXxfricAfB+ANBzjARC8ZJEIiFq7/yBgWNalbNPn92qHQxbOAmL
         YnfU3KJdnkMOI7gRq/zo3mzO0ek15QVtPCwSj6aOv5ZfI1XZKgP1UeldBD/80c8xOnIP
         ZAYfL+LaisvYkx4jlE0k2G1YUzG5CU7lvpw7TwNYJA4fmZ1TcXqecdwGvJWo9DSOk+eH
         Prj3Nke7paBG+8Zy6JB/AyGrsNVYngIELcHkKJ7PtfclEAMDuKSbPRPvfvJ2NkSFaygJ
         PXFHiD3OavXoxFKh3jBOAFZed4f9DbCXqd3iZ3oYKgdkhgS39g/PM3geFyuJNsJluKIy
         DADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Brpjl91FNbgNkC1s6ukF6xIzfG/+Bi80rWCJ3iDuHSY=;
        b=WZ81MQfqjROryaQ+SC1zSZPm5NniPjBocI630V99+/8DEOJB2djuXoD2jcSVCnPtS8
         Hr5D5uZqvt9QYF64cohzeyX4UI6rk8dnF6xwRfgIItxS++l8VgY2vjsQtG6U7TG+LhAv
         gw8zAi+pfiBbECU7i+XMET46MnnnQVDeJv8SVsPBLFd5JmhAfLdekZsil+SOaTtCRw6k
         iUSL3ImzSizLZozPFD+XFuWBWNN03nQ7sIdTgkajZoGjpU/JnxcFR4KK8iaCslhMLmOJ
         u7et7GnxVhhgYTFcTUZ97/cMnYa2aiwYYVIIiN/QtX+RjUrsjnAPbJWoNC6lWYICTvVw
         NWLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T07b31jk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si15858154ilg.27.2021.05.10.12.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 12:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T07b31jk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgBHW-0000ZT-Ir
	for alex.bennee@linaro.org; Mon, 10 May 2021 15:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGt-0000WJ-Am
 for qemu-arm@nongnu.org; Mon, 10 May 2021 15:08:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGr-0004uP-8q
 for qemu-arm@nongnu.org; Mon, 10 May 2021 15:08:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id z6so17725186wrm.4
 for <qemu-arm@nongnu.org>; Mon, 10 May 2021 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Brpjl91FNbgNkC1s6ukF6xIzfG/+Bi80rWCJ3iDuHSY=;
 b=T07b31jken9Y0vfNN1MvjuKwcmxntlqLD32YhNiql3iECMlywhuSHRKJdl/JERp5Ne
 dbI7iT+jv/46jsazGzI9sZuQFnF3QHsAM+m0Ljn2JX8DFp+vtj3miubCpZbfmiLA21fl
 9LdInlQy79UV7SLe7Minx1BPHXogZFo7ucIE32zRUO7kalHINx7Zf3m1QgVLjEd7QDVF
 E+gtx5GQCuAgRzITp6Zv6AR0dPjcjQM0WurJmsRjTJ/OgFUeW/1c3ZWIk7hIygjG+0+t
 KiadzDOBjE4MfscHhktyu11hVqtyCv/vRzFIXfqqlITIpQOizQPGfngE7I2aTYt9xfb/
 MO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Brpjl91FNbgNkC1s6ukF6xIzfG/+Bi80rWCJ3iDuHSY=;
 b=hffKky2aK3sxFeBLVb3OnJXrXQYnAqdHidatWi1Xxjf86GubNsjf/1ejlHHK/Z9rQU
 RAr4h40rqg0ysZv3//ZHKShYmkvfyVtVVsHTUTf81yDXUiiNYo2JFm6idJBVqN4CDr18
 gKS4HunJCzQGj/LN8y1kUZXQ90uWs4LTPVprIruuoaswoyIdk5VXKlKz9ZxWueXtRcPU
 v+fvJXLZ5/C+40nOKgwg93EW9lILasI1STYwLjd5CabGgmFK1EH3MPw08ZTE8PQgHMof
 tFSNyWBDHo6lotbgqB2wJJMba9UGj1VRaprbposTNP0zK9czaY7toKqJtjoKkXrBXnIP
 gCuw==
X-Gm-Message-State: AOAM533HGS6I7DB1C3oXc9wqR3zn5qnlZXUx9vCoyDIJ38iYMfNcRrgz
 WCKZb2fabDb6P9Q0GhEwsyJWKTuWrciSBQ==
X-Received: by 2002:adf:e845:: with SMTP id d5mr32267824wrn.96.1620673727616; 
 Mon, 10 May 2021 12:08:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/arm: Fix modelling of SSE-300 TCMs and SRAM
Date: Mon, 10 May 2021 20:08:38 +0100
Message-Id: <20210510190844.17799-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jD7RNvL+j5Mu

This patchset fixes some bugs in how we were modelling the
TCMs and the SRAM in the SSE-300 which were preventing
Arm TF-M from booting on our AN547 model; there are also
some fixes to things I noticed while I was in the code.

The specific bugs preventing boot were:
 * SRAM_ADDR_WIDTH for the AN547 is 21, not 15, so the SRAM
   area was too small
 * we were putting the SRAMs at the wrong address (0x2100_0000
   for SSE-300, not 0x2000_0000 as for SSE-200)

The other stuff I've fixed is:
 * we were modelling the SRAM in the AN524 both in the SSE
   and in the board model (harmlessly, as the board-model
   memory was just always shadowed in the memory map and
   unreachable)
 * we were modelling the TCMs in the AN547 board model,
   which is conceptually wrong because in hardware they're
   part of the SSE-300. No guest-visible change, but it will
   avoid problems if/when we add another SSE-300 board model

thanks
-- PMM

Peter Maydell (6):
  hw/arm/mps2-tz: Don't duplicate modelling of SRAM in AN524
  hw/arm/mps2-tz: Make SRAM_ADDR_WIDTH board-specific
  hw/arm/armsse.c: Correct modelling of SSE-300 internal SRAMs
  hw/arm/armsse: Convert armsse_realize() to use ERRP_GUARD
  hw/arm/mps2-tz: Allow board to specify a boot RAM size
  hw/arm: Model TCMs in the SSE-300, not the AN547

 include/hw/arm/armsse.h |  2 ++
 hw/arm/armsse.c         | 35 +++++++++++++++++++++++++++++------
 hw/arm/mps2-tz.c        | 39 ++++++++++++++++++++-------------------
 3 files changed, 51 insertions(+), 25 deletions(-)

-- 
2.20.1

