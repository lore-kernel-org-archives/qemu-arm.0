Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2606188lff;
        Thu, 19 Dec 2019 10:53:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxo2qHxb/BpkiiOCKaOt04eqB5DKYswZG+YGgmtMlkMv3u3EyUP+WohGZ+DV7R4Ecr0sQQu
X-Received: by 2002:a9d:7999:: with SMTP id h25mr10268503otm.347.1576781615654;
        Thu, 19 Dec 2019 10:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576781615; cv=none;
        d=google.com; s=arc-20160816;
        b=pPx5f5hnFD0XrsCQEWO7CsQtoziwxsD2/ue9nEJBoXCoHa6NxOH9pv7nay/x6S/yRU
         nbslPSevkBgfqMRICOrjwwBLxB+NXO7hTEtUOsuyLCm1RxZx1ItiB9JTWVJPgM95lk84
         N/cugTOS3XhpEbvvENVlkL0IUcDhhvskO4aQF/tm/nSOWOei6a3oCC4XLcrj8dha++Fq
         xiBp/0oUHbG+npiLWa17g49IWUgnuPUSDxAiMbBPddbDXc4ubBDlGdIlxYxRfzFgDcvR
         BualXlfgxgS5mjC/iv/fxJbQUoxNFCGaRHt8lNHwPxqNziw+e8yqOW1BXjf8hVHZwS/m
         kUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=kawbqCEjPPYKCsVnRVsa55n98nVaL/1o+fmH2TsyLNE=;
        b=xZgZee4gXZl3isfQKxYNY9a6rmqrggPV//erRZqRIIHElxXYv2MeVdxHHbPS/WG+zW
         BnKpsc9r/t0lInEFCyOsDQBnxkVmG+LksLlQAMhjttWJlFclDQjh+4Q6YOGHnuRbSVKX
         L+nyWA0IM1zQaAYKGaqb68mflZcKMlfpAAFK8vkPIE17yjTTv+AQeNRX63sZg64rFeqq
         HS2ZkVm0pXiqRhRqDShLtSCStHxfKAM/Mlhrlc4NnBmBzZchafb/ZPIC5l4xQjziAfSB
         fom6xTFXrK9y86MLAHAe4pXHED5v6KsGu1m2Vnce6NMkAdI2wWR0iuHl9eeu+47tfAFL
         afEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlmMNCLN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si3531617oic.190.2019.12.19.10.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 10:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlmMNCLN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii0vW-0000FK-T7
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 13:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0ta-0006zc-Fq
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tY-0007HZ-0H
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tX-00077M-MV; Thu, 19 Dec 2019 13:51:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id 20so6637350wmj.4;
 Thu, 19 Dec 2019 10:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kawbqCEjPPYKCsVnRVsa55n98nVaL/1o+fmH2TsyLNE=;
 b=hlmMNCLNwX+RKju0XCfr9FBOQbehZMq5UQz4OtXjSkx2kDsWMOmkiJVcAocgiUOMCq
 dk429h3d4vhPgkXjx+0WXlbk0ZwbwtqpfTaGGhU2wGDQyzUcX0Db5zmGi9nlpIKP8n3Z
 xO0qpuuMEp0etQ5PzaxG8tWIcGc6UhfqfO97S5MPVIjSG4Qpdp9enG08SgnGx62SFJWH
 uvzr3jee9R8X3QgiZaldjIdQivqTRrnekv/dryvXYfLjD5Mg0Fn2dyzKrGu5tit5unHX
 o1TqASqFhTZvwXviwl5GKkr03feprp2aHRUlDiy/KTkHVpvxKrnC2qIizd9qvxfYoS2v
 9NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kawbqCEjPPYKCsVnRVsa55n98nVaL/1o+fmH2TsyLNE=;
 b=YivAMyzbDWZvJ2ZTv6FOMqXVr0ndZqJwoW14LVWBjLoOLRi1ouv2emYAzS0deycGsc
 jWsm+uixisoBGsmQnLOdq5H/vVcOzXXmg7yNOa88g5s7beLr+R5w1xmeha/66u8ut97x
 fOCN8+UIWW08Km7HymLMM1tOGvgdvCqp1JzOFedgGQsx4B9wEdjH4j8Pc2UmKQZmsblu
 PgmXWIl857pm4eaKGwnuYJfMr5xs2rDpqRPITWA3FbSyBgbLt2wCJShpIoMgpEBpowmx
 2J5yAXYW3PtA5SHCeH4ubhK8mPY9v5WQCM6yth4qYbdmrwq5LbmY3PImlX1ytEEHYMSx
 bpRA==
X-Gm-Message-State: APjAAAWT23b2QUZUyioLJs4ICOAGtQ7pCR/4EdEC+hSH4puGitcnSIYI
 VsFtdwFglSUeyULfsP/OAGmvQc8h
X-Received: by 2002:a1c:486:: with SMTP id 128mr12132694wme.163.1576781489342; 
 Thu, 19 Dec 2019 10:51:29 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id b67sm7435494wmc.38.2019.12.19.10.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 10:51:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [RFC PATCH 00/13] hw/timer/allwinner: Make it reusable
Date: Thu, 19 Dec 2019 19:51:14 +0100
Message-Id: <20191219185127.24388-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hgUWcR3suB4H

Hi,

Niek added the H3 SoC in [1] and noticed in [2] the timer
controller is very similar (less timers, watchdog register
placed at different address).

On 12/18/19 9:14 PM, Niek Linnenbank wrote:
> Actually, I copied the timer support code from the existing cubieboard.c
> that has
> the Allwinner A10, so potentially the same problem is there.
>
> While looking more closer at this part, I now also discovered that the
> timer module from the Allwinner H3 is
> mostly a stripped down version of the timer module in the Allwinner A10:
>
>    Allwinner A10, 10.2 Timer Register List, page 85:
> https://linux-sunxi.org/images/1/1e/Allwinner_A10_User_manual_V1.5.pdf
>
> The A10 version has six timers, where the H3 has only two. That should
> be fine I would say, the guest would simply
> use those available on H3 and ignore the rest. There is however one
> conflicting difference: the WDOG0 registers in the Allwinner H3 start
> at a different offset and are also different. The current A10 timer does
> not currently implement the watchdog part.
[...]
> So in my opinion its a bit of a trade off here: we can keep it like this
> and re-use the A10 timer for now, and perhaps
> attempt to generalize that module for proper use in both SoCs. Or we can
> introduce a new H3 specific timer module.
> What do you think?

As an answer to his question, this series is to help him to
reuse the A10 timer controller instead of adding a new model
to the codebase.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg665532.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg666304.html

Philippe Mathieu-Daudé (13):
  hw/timer/allwinner: Use the AW_A10_PIT_TIMER_NR definition
  hw/timer/allwinner: Add AW_PIT_TIMER_MAX definition
  hw/timer/allwinner: Remove unused definitions
  hw/timer/allwinner: Move definitions from header to source
  hw/timer/allwinner: Rename the ptimer field
  hw/timer/allwinner: Rename 'timer_context' as 'timer'
  hw/timer/allwinner: Move timer specific fields into AwA10TimerContext
  hw/timer/allwinner: Add a timer_count field
  hw/timer/allwinner: Rename AwA10TimerContext as AllwinnerTmrState
  hw/timer/allwinner: Rename AwA10PITState as AllwinnerTmrCtrlState
  hw/timer/allwinner: Introduce TYPE_AW_COMMON_PIT abstract device
  hw/timer/allwinner: Rename AW_A10_PIT() as AW_TIMER_CTRL()
  hw/timer/allwinner: Rename functions not specific to the A10 SoC

 include/hw/arm/allwinner-a10.h       |   2 +-
 include/hw/timer/allwinner-a10-pit.h |  54 ++----
 hw/timer/allwinner-a10-pit.c         | 271 +++++++++++++++++----------
 3 files changed, 192 insertions(+), 135 deletions(-)

-- 
2.21.0

