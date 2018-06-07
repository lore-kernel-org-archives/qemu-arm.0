Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2407957wrq;
        Thu, 7 Jun 2018 11:10:49 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKVIRLZLkmOy9HFFwimyk96Pt9vcpHda6Qa33YcqqXfrmDhPE2GcRv7MfZmADw+A/D+/FC9
X-Received: by 2002:a37:15cd:: with SMTP id 74-v6mr2549308qkv.335.1528395049332;
        Thu, 07 Jun 2018 11:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528395049; cv=none;
        d=google.com; s=arc-20160816;
        b=twreJGe0hWlG+NXZIDQnww9hk1Rce0e6dy2PHRw9JqhHFGdkuZYsAyxKUpievPUTBl
         7oFUmaQvS/2JX+g3alo0DTSybFIpKBjOt2AEWLXoBZR/TXFKr9ySfYuOGrtCAoaaAWK0
         Z/H+gPzNdBtxZky51FAaW1OvbpV0YCQStVFYlT1P4K3vAuCrnfAAe8zCT93ZNtEucOq1
         2YTIZlfmNS9kVhD3m8Vgdn++azKvnJazv5CIv9iiGXalFm7+so3jHwDEVIGyDPx5heKu
         RGLltSOMSqg+5m/DE7bwrOgnkUajob2hAmvmHgmlX0nvkU/jEsykQ1Sn6JEUAchtQZyH
         GHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Sz85XgAFXalMbW12R7xOcPRe5Swn41N+qiy1nU84b1o=;
        b=mp6EpxPI2ZAcBfHjH/9prhktt3U8nrp+cYS7Ux6pdHZ3OAgGs0sZ4DpDFTw6HtGg24
         rbFpT0ULkUpVoElqI938DLByfMOWRXMm7loq8hjMqcbo9T96QpwiMvI8laBGBaU0wVx2
         yHzYXHk9yi4J4q1+N8h2rmzmcYrI24TiampiATpGT9nu1YHQkPwkWlIEoaujzqlGj8ab
         uwTAToLuv7i6E4SEzx2PBXlvjfX9vyqEnaJn53e2ESaCGraX3AxfJ0xc+U8czTFp3UlF
         PXPNGaK8dmQ75Yva5LfWngadfXCa13pB4XBW4t/17dInMruUV5JmRNLtdqQaW6v8CdM3
         ng9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CR3RYjUJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j201-v6si4015735qke.268.2018.06.07.11.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CR3RYjUJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzN2-0004eg-RZ
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:10:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJG-0001wf-J0
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 14:06:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJF-0004Lg-JV
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 14:06:54 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJF-0004LS-Ek; Thu, 07 Jun 2018 14:06:53 -0400
Received: by mail-qk0-x241.google.com with SMTP id y4-v6so7133975qka.5;
	Thu, 07 Jun 2018 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Sz85XgAFXalMbW12R7xOcPRe5Swn41N+qiy1nU84b1o=;
	b=CR3RYjUJBE7LjNkeuZcyRhjrjmblt2+BH8PP/fs5bQ70JusyN+FyxE3xjqD1HomsQl
	Sj8fML5FICwM5MC9CytD6JFhm1KHCsCSSR0emt05PVu/8LqDyZzv4uD/bc81+IxyHYnO
	yV61zsWv3rbgVFHK65blB+HpM5l5fS6DXef+0d14cH71m1btHjJJajASlOB5G/VnMtgH
	TNyIrcM6IXf7zpzVTuBIXjLB8yuWkAs1FwQ6nO6IenO71v+ITd1/OlYc6D1mrAD+09sA
	t3n1lNrJlQ74cm1J0gjPuj8SqT/lPT5RjuhfsNd/3GQfIjwUliSV3FIojkMK0S0amfqO
	6i4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Sz85XgAFXalMbW12R7xOcPRe5Swn41N+qiy1nU84b1o=;
	b=fXYrg0dxjgzKSAJYIChQXu8EyM+hp9iKfRfKCJHwrPEOOKQrx0edzr1oNLZMDswaAZ
	hfYNFXBPWVPi2iHO6YNB34P5SDW4q2aGu8HxMNj8GNc1cltBsVAgoWMCYlaorxB6WGDg
	s9Ky/C0quruAylsDzHCTF60O3vCNhWdzSyI2PkZfE6hiYh9RXLsPjtvtvw/xXVOCki/P
	+BWugLgK9JBJtnkk/8iR+lHeZhbzsSC6Pc44AdrJ1yyr/Mz97WPangMU1xXNQTOKup0N
	2h7kvWQ9UtYWj0wLmHnhND6yptGztMVxeW1KyOCYWpOlxuhnioog2bwadh8/g+QIQL02
	w1DA==
X-Gm-Message-State: APt69E0yTcI5Avxhql+fZtSyLLWcnL2yAoKIErYGGTzjlW5ttYvIOnDv
	R8iqPfCV7zAaAQeWhWHglRQ=
X-Received: by 2002:a37:7985:: with SMTP id
	u127-v6mr2601706qkc.272.1528394812934; 
	Thu, 07 Jun 2018 11:06:52 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s15-v6sm26838414qtc.81.2018.06.07.11.06.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:06:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  7 Jun 2018 15:06:35 -0300
Message-Id: <20180607180641.874-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v2 1/7] sdcard: Update the Configuration
 Register (SCR) to Spec Version 1.10
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dzbTr2fRLFZx

The initial implementation is based on the Specs v1.10 (see a1bb27b1e98).

However the SCR is anouncing the card being v1.01.

The new chapters added in version 1.10 are:

    4.3.10 Switch function command

    Switch function command (CMD6) 1 is used to switch or expand
    memory card functions. [...]
    This is a new feature, introduced in SD physical Layer
    Specification Version 1.10. Therefore, cards that are
    compatible with earlier versions of the spec do not support
    it. The host shall check the "SD_SPEC" field in the SCR
    register to recognize what version of the spec the card
    complies with before using CMD6. It is mandatory for SD
    memory card of Ver1.10 to support CMD6.

    4.3.11 High-Speed mode (25MB/sec interface speed)

    Though the Rev 1.01 SD memory card supports up to 12.5MB/sec
    interface speed, the speed of 25MB/sec is necessary to support
    increasing performance needs of the host and because of memory
    size which continues to grow.
    To achieve 25MB/sec interface speed, clock rate is increased to
    50MHz and CLK/CMD/DAT signal timing and circuit conditions are
    reconsidered and changed from Physical Layer Specification
    Version 1.01.

    4.3.12 Command system (This chapter is newly added in version 1.10)

    SD commands CMD34-37, CMD50, CMD57 are reserved for SD command
    system expansion via the switch command.
    [These commands] will be considered as illegal commands (as
    defined in revision 1.01 of the SD physical layer specification).

The SWITCH_FUNCTION is implemented since the first commit, a1bb27b1e98.

The 25MB/sec High-Speed mode was already updated in d7ecb867529.

The current implementation does not implements CMD34-37, CMD50 and
CMD57, thus these commands already return ILLEGAL.

With this patch, the SCR register now matches the description of the header:

 * SD Memory Card emulation as defined in the "SD Memory Card Physical
 * layer specification, Version 1.10."

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7af19fa06c..e1218d1fb6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -310,8 +310,8 @@ static void sd_ocr_powerup(void *opaque)
 
 static void sd_set_scr(SDState *sd)
 {
-    sd->scr[0] = (0 << 4)       /* SCR version 1.0 */
-                 | 0;           /* Spec Versions 1.0 and 1.01 */
+    sd->scr[0] = (0 << 4)       /* SCR structure version 1.0 */
+                 | 1;           /* Spec Version 1.10 */
     sd->scr[1] = (2 << 4)       /* SDSC Card (Security Version 1.01) */
                  | 0b0101;      /* 1-bit or 4-bit width bus modes */
     sd->scr[2] = 0x00;          /* Extended Security is not supported. */
-- 
2.17.1

