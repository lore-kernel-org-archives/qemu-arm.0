Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3689210lfm;
        Mon, 24 May 2021 09:11:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE495LV2g2gp6CuPjBRvlgA8cL9FXff39CnN+cfzW9Okqgy+msPykiM1h9FOQ5D8qwPe4g
X-Received: by 2002:a50:ed13:: with SMTP id j19mr26632137eds.190.1621872710553;
        Mon, 24 May 2021 09:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621872710; cv=none;
        d=google.com; s=arc-20160816;
        b=pr5L5081yUEtRNmi2vGBJCkzbN8VRWNYxEyGu+ZpDlwkvuk+oTdDTP9NdznhRZujQi
         9H4CDX1zu0Ot9TrCfa0xWmPJSTGFZWxPeKtuNh4ImcowAdD/nxWljHbSp4/t4DW9KnhZ
         1xIH5cI+1rCCQKzu+Kj6gnAZONo8xzxAehnY/yRFXSK4r+uvhpffhaEKWRP0vsqo1tyd
         179vRXQjrOYjm0bCCMK85EU5p5vYGFt+rtoA2ygVpIS4n7YLp1bIDj903Ui+ZHNbdWtd
         bUPASpcySU/nMkg50Nkv5XwJgz/UJTzmS3ky0J+pr54Cc1AdK4zhYWz9s7bT3OgEAnCj
         2RKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CYhsjndEznet9R16p0vFDe7S8z/CIhlPB7iI4b935nI=;
        b=Ky/I1wHeIlT2Kv76ME2b6o7iqTID79Eup3VyY5nHwuBdmbFHX9niVtFXD73MVQGOWu
         UhVmIzHQZGVvnVZNK2IOZpWXQg/5Bzk6UTJs++Bx0T/GJ9vPR/ReLpeu1a8XFQ++AnTx
         GBvQwNgO60iLpnO+GIUgACikb8Djr6bUdcTiPTXJJ37UHIsvi2G2kVxUjiF9dor4Dxnb
         z+BRfyRggvvtDhKXFzULB/IYHinCLN2rRQYrbCxtiorffEEAOZnZ4a/ZAvx7d+SvBCl2
         zbiEWMo+RU0mNNjCHMK3IzFSKivnC7QCBDcQNms28/8Ybjnj/QX+aFtvT1JuwSx/BGnv
         6+Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afS3EFpm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20si15481253ejj.671.2021.05.24.09.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 09:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afS3EFpm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llDBF-0001yl-LK
	for alex.bennee@linaro.org; Mon, 24 May 2021 12:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llD9c-0007m4-9x
 for qemu-arm@nongnu.org; Mon, 24 May 2021 12:10:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llD9a-0001bq-Nt
 for qemu-arm@nongnu.org; Mon, 24 May 2021 12:10:08 -0400
Received: by mail-pj1-x102e.google.com with SMTP id g24so15081673pji.4
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 09:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYhsjndEznet9R16p0vFDe7S8z/CIhlPB7iI4b935nI=;
 b=afS3EFpmOZNIpgsZPPJN3uG6sjBLFkXe4HDEY6Wmns0H1uPfoskZpz2GY3+d8iw54y
 WfCIVSqj68CrKou7KAVa7VJjVCZEukDYGztbH14cxSwUBwSId1Oc2Gg5x5DJVPIVf/WW
 JX3bhj3armXzxaLXlKQNOQPZ1ziDqcxUync/GrFtpl21P214qS9zOTmeCbBWasNWtpq1
 FywUOUJpm8rh1GJhQI4ydQarSBWbw+/EGSRps6zy9xH9LQXlqnYGjKdcrGAm3lTBcL+J
 RvVx0GEP5lxWcF7f+hZNhU5EuJcxIzrtZo9a9NkUhGpwqvpbURan27l4AN4kfa12oAIa
 /Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYhsjndEznet9R16p0vFDe7S8z/CIhlPB7iI4b935nI=;
 b=sBHkSqCSDJIofaft6UMA9t0nZmDwLb3GxFWj7jxl2qSrJNaej/VWl6TlbvXziKMiSD
 OMO1jj9NlkfSjkb6HPw6w/o9nlr4PvsKKMVvEVnhJdVLbh/nydR2U74EqnRcT9D+GkP1
 BsrvWs5QBWwqjiG4TJkzjDnKpRgtegU+n9vkhRhvQEMAL6OU+rc0BPhx7caZE8qW1b9J
 xLWVTF8WsKKo25NyQ1y1A74T53LTsLvC4qeBcW3jbk2UMFizgSrsyoiDS5HaseTrPhR1
 HPcEEbZNnc3f13N3Fk7zlweD6rl23BUjI7AEouh3BacA+zU/9XBLbGyqlS0RZ2x1Vi/q
 FOnw==
X-Gm-Message-State: AOAM532uLQ/d2E4Bcp1itE6ULgj3oPmcIyohcm3GDRo+4VW8TLZb3tBA
 8+8oOaxDNFt6rtqz5tCdrnHBeA==
X-Received: by 2002:a17:902:9885:b029:f5:fc21:7837 with SMTP id
 s5-20020a1709029885b02900f5fc217837mr23425258plp.60.1621872605152; 
 Mon, 24 May 2021 09:10:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l20sm10268397pjq.38.2021.05.24.09.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:10:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
Date: Mon, 24 May 2021 09:10:03 -0700
Message-Id: <20210524161003.18335-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510150016.24910-1-peter.maydell@linaro.org>
References: <20210510150016.24910-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: qemu-arm@nongnu.org, ckim@etri.re.kr, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b1HuP63rItDm

> In icc_eoir_write() we assume that we can identify the group of the
> IRQ being completed based purely on which register is being written
> to and the current CPU state, and that "CPU state matches group
> indicated by register" is the only necessary access check.
> 
> This isn't correct: if the CPU is not in Secure state then EOIR1 will
> only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
> complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
> ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
> prevent EOIR0 writes completing G0 IRQs when they should not.
> 
> Rearrange the logic to first identify the group of the current
> highest priority interrupt and then look at whether we should
> complete it or ignore the access based on which register was accessed
> and the state of the CPU.  The resulting behavioural change is:
>  * EL3 can now complete G1NS interrupts
>  * G0 interrupt completion is now ignored if the GIC
>    and the CPU have the security extension enabled and
>    the CPU is not secure
> 
> Reported-by: Chan Kim <ckim@etri.re.kr>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
