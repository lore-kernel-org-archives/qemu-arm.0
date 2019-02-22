Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7178165wrx;
        Fri, 22 Feb 2019 09:10:35 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib/MJJQN9Hejcbm4f/z1vEUnobCsGRjO6ZeD4RBNTkbHFSU8i1AKZuC8NsrXVnb9BbjvsTQ
X-Received: by 2002:a25:c044:: with SMTP id c65mr4327437ybf.284.1550855435617;
        Fri, 22 Feb 2019 09:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550855435; cv=none;
        d=google.com; s=arc-20160816;
        b=ioBltXDfvBuXw0CJ4qKDFZygGEI/X0tMyCkD26y10d7bgAm52KEsSjAMMS9CvlI95d
         G+Ar/809Op23KGUHhZ07501WH0no9YN0+oN05mZbZCijxAatVdIMxQFThr161Nomd2S0
         oNALc4jcXG3zvfvBs5AieB/0i2mQHh41QQLARel1Fd4Wgnz5NZQ0zwT6LIe9gmEADAeo
         0Yj/xRsHfIgFVQzPOvOUvUsAtnrFumoWXXWTtr5amqEOAaD0WnDVFfHdyb6zcIYGHlrR
         Wu2F9sCPUDlQUt0fCU0PtaWZyxx0qzOAedTkKhx0IfIj5N/uhq76pEGWi1c8Ob1JphhR
         Jgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=eOc2MC5G7RAcLxP1oY0WaDEgqJOO5LdIGP0QvWVZQQQ=;
        b=lGYCifM8dZ1Z5e1Ohq17uJfa2157/vVxOn+kmnc6ueH6xBR3/JgLnt/mySpQ2TfspF
         0LAQ0fAVUMPny3irtFZl1VCjV9YTHyD5XFkBrvi8kEug90GF72yT/XQdM2ZXNrql/SX/
         ZubXdfXx8x0SL6TyMy3RWnCeXcnJXnUo2R+erv2EA9ajcbPsanTG3V08p/94fM96HAFp
         TphAWhA0ZaSqhr/zsO+2UtEecOUzJkTsrRlxJK2lR3uGrsWFBU/FIMLxav//wpoxCbnB
         J5oqG2Qf6kG+S0Id4IzYhejFO3t0+YDBBJgsjLsTrv54O2h6IN/LQm85L05HThizBqgh
         0IlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SfY6vStL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si1154706ybo.487.2019.02.22.09.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 09:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SfY6vStL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxELL-0006Ri-38
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 12:10:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gxEKx-0006Hs-7a
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:10:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gxEKv-0001gC-39
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:10:10 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43520)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gxEKu-0000pH-Kx
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:10:08 -0500
Received: by mail-wr1-x432.google.com with SMTP id d17so3135352wre.10
	for <qemu-arm@nongnu.org>; Fri, 22 Feb 2019 09:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eOc2MC5G7RAcLxP1oY0WaDEgqJOO5LdIGP0QvWVZQQQ=;
	b=SfY6vStLsXlaSnVtHuGBv/l+rBrWDzlGzVH+Ctrxgx9CFRo1vd/PgpzS1YLKzoC4n2
	gtJZ/YHTD/XX95J6NBGxKj5fg+U2VKxT5DV5yZ3m/HWQwCBongh5u730VZIe6CR3bhDJ
	5FD1FTH3ODYlzUR3I02hx6rxWoxffSZ+/V/m8SOddz2aosX+WPHywfEb+Ew1fo4eQgVu
	fw1a1Gc9gWjkipKZj711BK81Y2EGqtvRKyIbr9bRmpEmgqmCUqFLLKf2ZmhY/QJF6xlg
	YljvuFlaU+e47IUUFoa4xXj8sxVm6Ez2qfWhsM6Ju83G+Kcd4QngP1snZR+46U9cBxXD
	Jtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eOc2MC5G7RAcLxP1oY0WaDEgqJOO5LdIGP0QvWVZQQQ=;
	b=oF2pZ3rBezby6SO783+36nwuu3O0uNXMju0A/YdRaXHP8O6kiehtmvyCO+QGLuqd8F
	f3yRJCNY0yoiucVCpx/1KSEIDAr6D/sPTebv6G7wFG52rQWpKyHt2jcymI1GP2//4WEg
	FGaer225MpXJ65qTk3JSO8YNGNIp4wDTwlrjeBfnKkH/RsWdcCfbyLm9C/DaE7NpPV8U
	MD59dLQO0ffuTLT6fo0HBRNyw/rif4444VEWyXF1oUYsiaZZVW392WLaKYowaIY4rX/R
	cWpbjFpCOjwfTpCMWlMwLLhEqENfrxNm6E9s96mJe+5hygAXYIV49u7Frkcp/dTvUWQN
	nAXQ==
X-Gm-Message-State: AHQUAuaxlH/3gFJoAoANX5QWTXnIztqyNKpqV3+R9itX5g21XDEeEjxH
	ztjHWMFifEyGEmDRCn2hDZ6h1QtHkw4=
X-Received: by 2002:a05:6000:1142:: with SMTP id
	d2mr3622449wrx.43.1550855378889; 
	Fri, 22 Feb 2019 09:09:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id f6sm2829077wrt.87.2019.02.22.09.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 09:09:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Feb 2019 17:09:34 +0000
Message-Id: <20190222170936.13268-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: [Qemu-arm] [PATCH 0/2] target/arm: Use MVFR feature bits to gate
 some insns
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0JJVLPWm811t

This patchset switches some of the A32/T32 VFP decode to
look at the relevant MVFR feature bits rather than using
ARM_FEATURE_* feature flags:
 * use MVFR1.FPHP and .SIMDHP to gate the FP16 conversion insns
 * use MVFR2.FPMISC to gate the various insns in disas_vfp_v8_insn()

This is a bit of preparatory work for v7M/v8M floating point
support: the v7M FPU has the "misc" insns that only arrived
in A-profile in v8, and also the FP16 to/from double precision
conversion insns which are v8-only. So feature checks that look
at ARM_FEATURE_V8 won't work there, and we need to look at the
MVFR* fields instead.

This should have no behavioural changes for current CPUs.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Use MVFR1 feature bits to gate A32/T32 FP16 instructions
  target/arm: Gate "miscellaneous FP" insns by ID register field

 target/arm/cpu.h       | 57 +++++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.c       |  2 --
 target/arm/kvm32.c     |  3 ---
 target/arm/translate.c | 47 ++++++++++++++++++++++------------
 4 files changed, 87 insertions(+), 22 deletions(-)

-- 
2.20.1

