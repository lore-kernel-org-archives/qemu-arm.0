Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2228063njc;
        Mon, 24 Mar 2025 14:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWybmiUADrtL0VEexH9PSfHqLd8BM2It8n4phrbqdYFC0h0vSF9kj706mstseBuBT9+Me5xC+epQ3QtPg==@linaro.org
X-Google-Smtp-Source: AGHT+IEJ0ek2fKiwIFjoFJv91K/aRfY/BIa/Ca3HUgWqU3W89xC26Ylk4X1944N04Cm+i0QNdChN
X-Received: by 2002:a05:6102:c0d:b0:4c4:dead:2f36 with SMTP id ada2fe7eead31-4c50d286cb9mr10302619137.0.1742850549121;
        Mon, 24 Mar 2025 14:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742850549; cv=none;
        d=google.com; s=arc-20240605;
        b=M1QA0Y6zJETiwD2yDeSj6KQkpUfn5HNjMIJgTdD8vU7ue63v86dAZmMajR6Th9pyaY
         lldzkWUtV3wDFJ0BpVP0fAGH5ITvJ7JXsvlamjmV+Aq2r5ULnMD0copOqolpRXCog8at
         kpKR1QUDB8qefP27vE8T+kRFV+tXZKwGlx1linO9HmohD9y5BAvQcn1zhPHCGgquv6sl
         MVADF0+wRe3C86Cokq4itgW0zpqpYaTsoHTmKRyGAGMrAhQtM2VLfDuTKLhLd9sg1biG
         CinCCmDZxxaa7ftle3XAOz/P+n2VtrxNDMolFWRE6yNLL7KFpnE7v1uDV/XcCePAM3xy
         P83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=3cx+XRzgucR1b87MKUL3kVV2kbyfiV4eQXKyj4gncQ8=;
        fh=i796QYE+3AgekThBub9Wh3d7I6DUqyd+K9khfkpKOEI=;
        b=Pe+SBUhCuP1fkUQZNd9Wt9POLciLQOS3lVn+uQ0xb2OX1P5MzzsL55UgS2ORyv+b11
         9IwZJorOm/DJCtcUaR5DSvnWC6CVcPzdldzOdOVaqbK5i63amlY+n5pjM7UWafHHDOFU
         ZboV4sEC7J8yIZqpTn0qfRqBXQ+jpheJtv68CrL2vkFsqGapDWasM8mhcN5RKLimNqSZ
         j3Vyb9/d151xRZya6mIZRugkVyuWYGh/FRDr6RjSm6/f66TlyH9dQtdTDtgla+EA3WdX
         PM88+09OEMkycq4oAtsShh2SJgj1MpNQPmbT49I2L6Sx7Elx4BNLP4x7YLHI8usvUT0S
         VcYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c50bd44264si1938740137.194.2025.03.24.14.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 14:09:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twp2Y-0004gc-Ab; Mon, 24 Mar 2025 17:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1twp2P-0004fd-3E; Mon, 24 Mar 2025 17:08:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1twp2M-00031V-Sb; Mon, 24 Mar 2025 17:08:48 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D86F2107AAF;
 Tue, 25 Mar 2025 00:07:32 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 71F4F1D5B7E;
 Tue, 25 Mar 2025 00:08:41 +0300 (MSK)
Message-ID: <debb6c58-2a38-40d6-ac9c-b90c60ba8b69@tls.msk.ru>
Date: Tue, 25 Mar 2025 00:08:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 0/3] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250323174541.406860-1-clg@redhat.com>
 <08930285-903b-4413-bd6e-20a14b2d15bb@tls.msk.ru>
 <2616d3e5-443c-477f-a024-317fadb76a59@redhat.com>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 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
In-Reply-To: <2616d3e5-443c-477f-a024-317fadb76a59@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
X-TUID: 2ZNC2lf/yXhA

24.03.2025 23:46, Cédric Le Goater wrote:

>> Is there anything in there worth to pick up for stable series?
> 
> you are fast !

I was just about to send final announcements for a bunch of next
stable releases, and noticed another pull request has been merged.. :)


> - "aspeed: Fix maximum number of spi controller" is QEMU 10.0 material.
> - "hw/intc/aspeed: Fix IRQ handler mask check" was merged in QEMU 9.1
> - "hw/misc/aspeed_hace: Fix buffer overflow in has_padding function"
>     was merged in QEMU 7.1
> 
> The last 2 deserve to be backported IMO. They will need some massaging.

The "buffer overflow" fix seems to be okay for 9.2, 8.2 and 7.2.

The "IRQ handler mask check" seems to be this (for 9.2). Does it look sane?

Author: Steven Lee <steven_lee@aspeedtech.com>
Date:   Thu Mar 20 17:25:43 2025 +0800

     hw/intc/aspeed: Fix IRQ handler mask check

     Updated the IRQ handler mask check to AND with select variable.
     This ensures that the interrupt service routine is correctly triggered
     for the interrupts within the same irq group.

     For example, both `eth0` and the debug UART are handled in `GICINT132`.
     Without this fix, the debug console may hang if the `eth0` ISR is not
     handled.

     Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
     Change-Id: Ic3609eb72218dfd68be6057d78b8953b18828709
     Reviewed-by: Cédric Le Goater <clg@redhat.com>
     Fixes: d831c5fd8682 ("aspeed/intc: Add AST2700 support")
     Link: https://lore.kernel.org/qemu-devel/20250320092543.4040672-2-steven_lee@aspeedtech.com
     Signed-off-by: Cédric Le Goater <clg@redhat.com>
     (cherry picked from commit 7b8cbe5162e69ad629c5326bf3c158b81857955d)
     (Mjt: update for before v9.2.0-2466-g5824e8bf6beb
      "hw/intc/aspeed: Introduce IRQ handler function to reduce code duplication")
     Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 126b711b94..495fd2bdfa 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -92,7 +92,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)

      trace_aspeed_intc_select(select);

-    if (s->mask[irq] || s->regs[status_addr]) {
+    if ((s->mask[irq] & select) || (s->regs[status_addr] & select)) {
          /*
           * a. mask is not 0 means in ISR mode
           * sources interrupt routine are executing.

