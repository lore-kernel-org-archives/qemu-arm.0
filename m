Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5602194ejb;
        Tue, 7 Feb 2023 09:38:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+rTceNZT16CyYzRdQVEiuzZsHmt31giIPSK7i2W/rWSmehlein71YX5BUUUIFlmCx8dMre
X-Received: by 2002:ad4:576d:0:b0:56b:ece7:af2 with SMTP id r13-20020ad4576d000000b0056bece70af2mr6994069qvx.18.1675791509589;
        Tue, 07 Feb 2023 09:38:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675791509; cv=none;
        d=google.com; s=arc-20160816;
        b=I1UdJLraUqzAx8ftyEQkAtP+4YATAWsOUHVWJ61CVfgv2GRl8/eh2yun8NHC+/n9C3
         8/d9wYyB2I5fIbbLIClNC033KGf6vjNmDMfzlndZ8CI0Hywjb+s+awcyHE+YMjpUYKky
         L9pm/1dvKRF1KAz6vgflCnLZA4yWZQPrIraJ8QOskM3//ACrXUHi50TKTEAxQGqxE3LE
         sK++tCsmCEjjuYz9Z5vgbwDta9+D+svpyfSXlY539MVvMC/+HY3pYZGDmwGTsPswTG8I
         ZLcu0QSnR0WUFmFAyW3vu+VpngRpzLQiEPXjNaZkpyDBqZlke3lGARHYuKOIy+5ySX/5
         ahJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=IKlDdBUba+ZmJD6OD9lZCnIHg2sJfjEyLSxqT8eM6c4=;
        b=iMA8F9uiZEiRYuCPIe0K/7fiL9XPQjdxGEo6Cu1kzL2zsLQaydtsFPPZBxogNOSGTu
         H/iHDdvRzqRlDgYBc/Iq8IRspq1tfzCh6vumGrmApSav22acxpBge/fL90MEQ7wttJlW
         TU8kd3wq8vqPOzKIV9bvdi3Y6o0qyg5zpPqT4Gztqwk6Q8m7TgiF/mTOKCr3b2KdT3Ke
         ycVDy/+38BMarWRUJT9+stln98qksl4jjeK0N6+t4bXUgo2u6jUZL9nsyz7XrVIoFRCn
         ESqmGi8HfIjHre5KnRstPhR6P7LeToAaeGsOMIcvuKhO5uV3Ey98eLhAZ89UDUzOecVk
         lxsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020a05620a298300b007200a6636b1si11833490qkp.175.2023.02.07.09.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 09:38:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRus-0004Vp-Ky; Tue, 07 Feb 2023 12:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pPRuq-0004Ux-Sm; Tue, 07 Feb 2023 12:38:00 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pPRup-0004Ku-AT; Tue, 07 Feb 2023 12:38:00 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 84CDF11EF0D;
 Tue,  7 Feb 2023 17:37:57 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Tue, 07 Feb 2023 17:37:57 +0000
Subject: [PATCH qemu v4 0/2] ARM: Add support for V8M special registers in GDB
 stub
MIME-Version: 1.0
Message-ID: <167579147730.28776.7263330829354840538-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aqaEllI6IZjw

New in v4: Moved arm_v7m_mrs_control out of the `#ifdef
CONFIG_USER_ONLY` block, unbreaking the user-only build.  The downside
is that this function is now taking up space in the user-only binary,
but it can (presumably?) never be used because there are no user modes
for v8m cores.  Let me know if you'd prefer for me to wrap `#ifdef
CONFIG_USER_ONLY` around the v8m registers in the gdb stub.  Also, let
me know if you'd prefer a separate commit for renaming and moving
v7m_mrs_control.

David Reiss (2):
  target/arm/gdbstub: Support reading M system registers from GDB
  target/arm/gdbstub: Support reading M security extension registers
    from GDB

 target/arm/cpu.h      |  25 ++++-
 target/arm/gdbstub.c  | 241 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/m_helper.c |  87 +++++++--------
 3 files changed, 305 insertions(+), 48 deletions(-)

-- 
2.34.5
