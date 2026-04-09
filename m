Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4C8E9DE78
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 09:16:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAlUZ-00043r-Gm; Thu, 09 Apr 2026 05:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAlUX-00043E-GD
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:16:02 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAlUW-0003mg-4J
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:16:01 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64e87a81639so644636d50.0
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 02:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775726159; cv=none;
 d=google.com; s=arc-20240605;
 b=H4IiywPZiTRQDkCMjtSc45n03FD6wdyz7/S0G3+F5uSMRlZHoTqHKpYL9r3X0E1KU1
 dgUUM6FSAB42C+qdvtigCD7918H6SNcnQX7yV0yAL8vX9uBHw9XQ8Hkp8CotgxnqKwN/
 pFIv5AxMnt50oCK8nNAlU26dijolvacS6+9QktRRDuDS23s1Q/eAtdZ6VvtOFo3R3OYo
 gNRC/fxvbHujU4/Vy1UhZdgyOYHIsj1UoTCGDwQRN7BYbwseTdwWQWqB8fjUk9Rpjfl3
 EfiNhmsjEL3baJTeg6+aq1Zkkoe27M2Pg0SVt7Z9M8kLrp08FKumGGzu9P2Kri4TdMRw
 RH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ji/MitblkuNDNICVUIyixzUQa1KXUQq1gYxLKB6hZuA=;
 fh=hiWQHjwY1u0sSlYxIXdkB/gS8Or76ryHp3NVZQjySs8=;
 b=SNA8zr5MvBdHcNoiQ9haVseNW9k2SBY6ayzvBYre5cJ84pE4O3VO4zi5/N6Wrjd7jA
 DrwkoZJLk2B3Cuhdvb9uCpXnqC/T6plpFTGCAsvNHngZy7c8HLL+k7q1E6rbMXWQ/sYC
 utx+nM4WxbNbjM7kwqEWZ0DbE7WqqEFTAmSTMF83GuyaCT9QVgaye/njQmkvHuRHXBVI
 yG5MItawNtkeYov5T9lD3jq3soyKSXWBvw0pgeda4/CC6Ks6S/kzMsN82NqfcIGwThp/
 9zDPRaFk+82ZkoyNIuxyvJ6agBtPCINf2YQAyvjsicoV2mrYhVlOxypA21bTpAhszxz4
 34zg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775726159; x=1776330959; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ji/MitblkuNDNICVUIyixzUQa1KXUQq1gYxLKB6hZuA=;
 b=ZfdejXVEBNmfdFd7UDHOGytu8uOyMi39+iddlhRiuTYH/CIMW1krTBDGSsG65m5S3F
 PigYUdlrKOAanN3SWElDFNbRjprdL1kYzeYmRnDqHvj9L0FkdZ9m2xUBa+6YbyjwMnG/
 Q9CbPyti/Ao33LRLvXzXB4HbERDyOlt11uqm3oRYrKsjsSOcq4cu4CnvIYZBfe8FcuFu
 V6IxqZqlKsB2OFygKwKyarDOC5/Wc9PifbqlhPuhSnd6ylT7JSOfhgMb13onLmTdrjjD
 SNjAhxCElbc46ANFJABGTVc2FPR4hOWy0pZ+mTEc7O2ymBsXACtX3NX1UFvClQZW9g4C
 FcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775726159; x=1776330959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ji/MitblkuNDNICVUIyixzUQa1KXUQq1gYxLKB6hZuA=;
 b=SMHd5fxSduAkXTOaCWRRQ3NGIkMsnuZsQELakq/s7pqlsaTSjesnLsFWwzxoYFHWWO
 IoP0sbtVONRyyywK39yxqPVZYGAg4k7DpvdVS8E8Wr51rkzyvzo4vcWEzy9Q0DWH1FUe
 P/4gSCuxb1m2KCUOIeuzlCpVsgu5FwlIPtHe+woLY1TNBN++kAVpzRxi08gKG4nAX2+L
 pBLvsx4CtJRh0vmyYrsgwZW0PYKlRoyTdjAPjfHiLiH0m06K1p5+46jhJeUoirfYvUP1
 UgsNx3EBKRYzwTUdTtV5QjVATcVSENfTgqEoluUctzCDw2iChMgg8VGZI7ozA6b6ZXVy
 k+Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9jQTrVMUXxhaGr+bcCL1L666kGaY5930l7W4YUwrDcnk6rl2TUzneZo52pfvGu82IgDL/49SLdg==@nongnu.org
X-Gm-Message-State: AOJu0Yy48sFLxIY+DfxhnKVmdTz6oGGstF9EiJh4V50pz2KJNedrwtGx
 BbezGNPbtWv3zmLRIHMx1N0ERESjRX1N17u9O4lBency5Lrp8/m91JHj5KDlkMhIfItvEIAjjHB
 NYM8m6XZP0JoFs85yHGJtVJBY1/dF50qmPrV0FmsNbg==
X-Gm-Gg: AeBDietlk0KmbDOyuWHspyt8ot43D4r+BBmjs0q6ZLSMA+t3rYkWCLLZDi+k8TYU7Bz
 A92bKpHHmP22u7F1vx+ZQoBoff6UjMTCLWn0VX6VFkQa82qrFTwHYWrdizRWgU61tn5NDO1ATgm
 DMq7TxAQ7TlzF3PD3GR14iEzAulVz1mvT0I91oXKn9Onlklt2jKUl3uewrjomnpHTOBqb7sIZdr
 wxDsLiy8FjZFUJu7VreCNXGOtGfOnraxuAuLA2lM8gVf+4mrvMkfr8cSp6ztltLZ1euoKCZipOp
 5mc9kf6TjRvwQP8NMOO0m+fjUcElqn0zkEK6rNLcNnYsnXfV2TpKAy7MX41xO7ghXPE=
X-Received: by 2002:a05:690e:130e:b0:650:389f:8b7e with SMTP id
 956f58d0204a3-650486eaebamr23879047d50.18.1775726158753; Thu, 09 Apr 2026
 02:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-fix-unit-address-v1-0-946840930af2@iscas.ac.cn>
In-Reply-To: <20260409-fix-unit-address-v1-0-946840930af2@iscas.ac.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 10:15:46 +0100
X-Gm-Features: AQROBzB4l51zZE1yVUUrjpAWGI--TBOlN6G9MYpFsp-7-zOFWBnSppEokR8Mjhc
Message-ID: <CAFEAcA8MsNRCXp2xKzB2goiQeXbSM0qEZurx9ZV1C2X=4avMBQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw: Fix unit addresses of FDT CPU nodes
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 9 Apr 2026 at 07:40, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>
> Apply some pendantry to the node unit addresses of /cpus/cpu@*:
>
>     / {
>         cpus {
>             cpu@??? /* <- here */ {
>                 reg = <10>; /* Equivalently, <0xa> */
>             }
>         };
>     };
>
> According to de facto convention, as confirmed by DTSpec maintainers,
> these unit addresses should be in hexadecimal [2], i.e. cpu@a instead of
> cpu@10. Currently apparently everything uses decimal which is wrong.

Who counts CPUs in hex, though? Decimal works fine, so it
seems to me more sensible to say "you can use either base".
These are just node names, there's no particular obligation
to use any specific name format.

-- PMM

