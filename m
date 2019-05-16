Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp728930wrg;
        Thu, 16 May 2019 07:47:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCjpyz61Sk42ef68wCZjHAvlvrS0uph5WvF1mnpsGjpYHIfd0f8BCSSl3QArlvMLr5B/3x
X-Received: by 2002:a05:6402:1644:: with SMTP id s4mr6996931edx.182.1558018079437;
        Thu, 16 May 2019 07:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558018079; cv=none;
        d=google.com; s=arc-20160816;
        b=O2o/85ozs1cQ6Zm4vW+WmCfUdC8Po75MsRJnCzjlk5uvDdLpmHKDr17Iu5mPVB4ISb
         cMKzpAKfXG46CTN/rhDxEkZIRUTxN4G4d3SlLENhE8zgBCIWm3vCCwP3/DWys50/b6ap
         OFLRY7/EoKyF5esj68GSnRJ1cA7Vo/LMcRZkpmMgW9LAmADiBkMNoiZ8ZJxBhgzzLLrx
         b61SYw9Q7M6KLHochmu00HsmWmZJhQFWP900Z8w0EeQx876dPRyrrlnVrPHHxe2He+fk
         Dp4hSg7ZE9J6D8cXmwzHvX+2yg+IKRQhHy6HY4mzBELnjUC5SYdGdiwmiSvvA/Edmpdb
         fy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=fdK5c58nnMRXpbn7bDsZcFXFZe6V1MTgfq5dHpHbPUU=;
        b=FVkD2CwUxkIbQL+HUtdjka4jk8a6H6w815aZqvgi0l+9/J9j0gKWPZxcGnnXDA/UNG
         V75QXMcfoEHmtq21+ZBbA/O+m0g8Slyc9mYl5vwqde9PXVL1zXJSiqR+vbbATvbDOlAA
         f+cbmYvHsjmCVG+zyIHVTqXsV2wImlBJCybEBfDyvSKPHs8sX3NW6eURirVFu5glQsyv
         m6zCTAKjZleruQKtcBiL59zIpGJnFPPkVyluX6HxJvOMydH6JAoQnLPdboFks1bMaHL/
         otpKvPSNIUZX+w3ZnLbJBKxaqEZifCX4BTf/gEtjK7LAGVdM5n9EAA/qMWDl9rwNGvs4
         UU8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y863flIN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j41si1820179ede.401.2019.05.16.07.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 07:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y863flIN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRHfq-0002by-Gj
	for alex.bennee@linaro.org; Thu, 16 May 2019 10:47:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRHfX-0002Zb-6a
	for qemu-arm@nongnu.org; Thu, 16 May 2019 10:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRHfV-0008Dq-Tv
	for qemu-arm@nongnu.org; Thu, 16 May 2019 10:47:39 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35537)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRHfV-0008Bn-Gy
	for qemu-arm@nongnu.org; Thu, 16 May 2019 10:47:37 -0400
Received: by mail-wr1-x444.google.com with SMTP id m3so3568472wrv.2
	for <qemu-arm@nongnu.org>; Thu, 16 May 2019 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fdK5c58nnMRXpbn7bDsZcFXFZe6V1MTgfq5dHpHbPUU=;
	b=Y863flINpkjnHg8eEMKgNUbADagVXogPOlbLeGJ9smdp1s43kvQLWXTq4vYxCTht5e
	CA9AhJFMD8xGPw/mCN6g/NgxAANqX1J3RJR1Xd/UBiekM6I1MEnOCexemWRAjYObotEV
	eYZKllxuzznoFPpmWjhY3O3PHEQFDOt815OaTkqt+oE8xr+Ad6H4qn7nUCSoWRQ/4P4v
	Ys9NhaKnLcbZwkAKgO8hba00bjBF7L3Mx9/B1p6ZJnUXnJTXat2qjt2zx67n3HoiyIRX
	ldoKrIHGSKUJv+PWvs9Utms/SeZ6N31I85JC4KEcrTUMWVfrDNtbhtPaECRxbbbutHES
	m85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fdK5c58nnMRXpbn7bDsZcFXFZe6V1MTgfq5dHpHbPUU=;
	b=nWaG8N+AXHI5UEaEpX10oFghSQTIuNuNyODineQf5xypPrQLG/k/UfioaF6q8kPnTX
	wqXi9ymBz6mKyDwYJES7Im5IyT92WCthYfmI3M4KbZyYKzNv6Z59iXtDmhNn7ysRcf5i
	B/4FRvdaXzkRkUwwvSXYpnOMgX49ahP6kkVoj+2ToSOWOIRqIAY5rfS/7IFZ3GJkot52
	4M4PCKKj/ZdtxAnL/pm0lMHYcXjW7g65jElur98+dgzlhb1l52QyeK0z45X3Mf8i7y1l
	gQPdgGb4tP6hdUCJdTtOoI4A/adx3X1LXQ35e/zGhS7wJtoGyndHWR42Y51r3vSiGAeo
	L7PQ==
X-Gm-Message-State: APjAAAUsCeskidUKfymVDNLTGa7xE14a1cqie68mFlTM8lmzf8KplXgf
	ESTbr4wlTwgx67id4ubqDBVbfCHzRt0=
X-Received: by 2002:adf:f8ce:: with SMTP id f14mr2333588wrq.110.1558018055916; 
	Thu, 16 May 2019 07:47:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id o8sm7629018wra.4.2019.05.16.07.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 07:47:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 16 May 2019 15:47:29 +0100
Message-Id: <20190516144733.32399-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH v2 0/4] hw/arm/boot: handle large Images more
 gracefully
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
Cc: Mark Rutland <mark.rutland@arm.com>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WaJk8mvhm5NE


This patchset attempts to fix https://bugs.launchpad.net/qemu/+bug/1823998
which reports that we don't handle kernels larger than 128MB
correctly, because we allow the initrd to be placed over the
tail end of the kernel. AArch64 kernel Image files (since v3.17)
report the total size they require (including any BSS area that
isn't in the Image itself), so we can use that to be sure we
place the initrd sufficiently far into the RAM.

Patches 1 and 2 are new since v1; patches 3 and 4 are the old
patches 1 and 2 (and are basically unchanged since v1).

Patches 1 and 2 in this series are new. Patch 1 fixes bugs
in the existing code where we were assuming that we could
treat info->ram_size as the address of the end of RAM, which
isn't true if the RAM doesn't start at address 0. (This
generally went unnoticed thanks to the magic of unsigned integer
underflow turning end-start calculations into very large max_size
values for load_ramdisk_as() and friends.)
Patch 2 adds some explicit checks that we don't try to put things
entirely off the end of RAM (which avoids those accidental
underflows).
Patch 3 in this series adjusts our "where do we put the initrd"
heuristic so that it always places it at least after whatever
our best guess at the kernel size is. (This might still not
be right for images like self-decompressing 32-bit kernels, where
there's no way to know how big the kernel will be after
decompression.)
Patch 4 makes load_aarch64_image() return the
kernel size as indicated in the Image file header, so that for
the specific case of AArch64 Image files we will definitely not
put the initrd on top of them.

thanks
-- PMM

Peter Maydell (4):
  hw/arm/boot: Don't assume RAM starts at address zero
  hw/arm/boot: Diagnose layouts that put initrd or DTB off the end of
    RAM
  hw/arm/boot: Avoid placing the initrd on top of the kernel
  hw/arm/boot: Honour image size field in AArch64 Image format kernels

 hw/arm/boot.c | 83 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 62 insertions(+), 21 deletions(-)

-- 
2.20.1

