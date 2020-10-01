Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp738312lfq;
        Thu, 1 Oct 2020 10:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvuJJKMNkFrh12u/eia5tXXO3mzrdZvVq0c9NruAeOyL/UaStCV/xl/wmUIt3PZUsy0ayP
X-Received: by 2002:a25:d3c3:: with SMTP id e186mr11809594ybf.418.1601572117566;
        Thu, 01 Oct 2020 10:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601572117; cv=none;
        d=google.com; s=arc-20160816;
        b=WA/52Tz8Ai92qcJ0jTXvCScs1AnpjV981bAnr64dTNCvX2vefa0Zmn8OHiqgyrjU9M
         2gOpTuXTcYzBh4erVGhjoRGdKEg9U6tcIH93bi7lkYopaQ9l6UBYcSG7KSy3sbl08jAa
         heNYMUoIGTpkFYyBpzxLVeZiwYL0+PnCAmjHmXSc819MMQJ9hk4/Y4q9q2KQoFbcN914
         pSnPZfTeuswtgiT0zwMhPgVRHB7kI6tx6qo+JOcd4UJIdKKnjpQyxIW925C6fNJ3u4O3
         sPKIaP+vCbyxoBx6sGeXeRODEinZxtaCNQ3fdpCl2F2ojPiuAF4CCc7uFnbm8FDbHerD
         BIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=n007JuMxNaM+43IWW/tiTfqPZrJc3uDGY1zoJY2D5Cs=;
        b=CwBLVPWTS9I0VRKJf8NFPJA2qazuwldergFDsFXg9jxXetvyTsxzA72dogUyJZ0cDZ
         h9YK1uLSXn0moSosLfcyz/07fVa9k9OA89oIfSIR3oLslLhTnLxLlKzmzCkr/aaPQKXV
         H7PT5YwhfUjw6+jhP1hWTKn7pJLEiHRtMgZC+fSUL/Nf7aY6WgYhLAjW3G7whufSbL+6
         ENR/lWxng55rKUjQycT2xb7XyE87yPIhe16U7A7zAY4jhiNbly3jUVaZltxNEw1Ecedr
         hsgOXpF1zTsGJTjqRhcFHbQgWJIq73KfOo51NaWjarzmztLcZqvUAmq2eoPz2Jup6CDb
         2Hug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jwZ6rZbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n132si5351102ybn.168.2020.10.01.10.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 10:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jwZ6rZbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kO24K-00023D-UQ
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 13:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO23j-00021o-IW
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 13:08:00 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO23h-0001cF-PK
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 13:07:59 -0400
Received: by mail-ot1-x342.google.com with SMTP id q21so6162762ota.8
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2020 10:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n007JuMxNaM+43IWW/tiTfqPZrJc3uDGY1zoJY2D5Cs=;
 b=jwZ6rZbh3YU3FxfqN7WkrUJQRC8KExfaJTj2AaooCvudCJWDYf3DJE7MOZaF0oWz1e
 8twKi5zr3QYsYUyXoeXSdi11CXkdrMzfIJOewzWCWEGraUR7sGxLWsn5oW+4drCX/yv5
 A43bFAzlqV0mXfViUgR2UqEOR3Uu034LRHWFi4w7mBt8+YyJVGGOltmv4eWCdd2eRRws
 0nktHOAS1R+3MBTRkED6KjMlN8b5dKML8Sf2xbYWVnCIPZxOwDqoOn7JoXFLaYJ4gMEO
 QOBQTHk448luV5g/HF4TeTyrOUMbCiYhAxUmAhTX+5vwmLdULy/iDlhcAY+Llc+INz+o
 JvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n007JuMxNaM+43IWW/tiTfqPZrJc3uDGY1zoJY2D5Cs=;
 b=aJjMXwIjusjIVLSLfUbbPrUpTz+vV/4X7p8nzpJMUYxhviRKYNixeZDa9kkCInmc/l
 LgCYV/8qdn06Nui71/vlJ34sbf8N+I+tnwLkHc3xt1kmtIf+I6K67S0ItV59xdph6uHC
 W0cUTD/oLg+F517NRXJ5qr3wMaDND9+tZP/fva6Jgk51x3+5H7p14gB4jPetNtIFVgBW
 ewDfABTYTm8I20OxjEwa97hIY+GUR38xyD9ZmBErLi36J/T9CCEE2aW0h+F+dciGLinN
 jtefiRI9egUejQreuXY8SiRdgxK+mdeLqgfW+rU+FNRz9ggGmE/srTBVlC3XfyQFFxQp
 AAGA==
X-Gm-Message-State: AOAM532+tFuH5mDtQivyMHA+0WUn3kx7oW2GL52k44d2AeYRAFF/KQZz
 1cD4bo0y0xJHNhH4a6eyAAOdcw==
X-Received: by 2002:a9d:7f89:: with SMTP id t9mr5827596otp.206.1601572076536; 
 Thu, 01 Oct 2020 10:07:56 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w25sm1334350oth.22.2020.10.01.10.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 10:07:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] target/arm: Fix tlb flush page vs tbi
Date: Thu,  1 Oct 2020 12:07:50 -0500
Message-Id: <20201001170752.82063-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Jordan Frank <jordanfrank@fb.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ioLcp6hGTtp4

Since the FAR_ELx fix at 38d931687fa1, it is reported that
page granularity flushing is broken.

This makes sense, since TCG will record the entire virtual
address in its TLB, not simply the 56 significant bits.
With no other TCG support, the ARM backend should require
256 different page flushes to clear the virtual address of
any possible tag.

So I added a new tcg interface that allows passing the size
of the virtual address.  I thought a simple bit-count was a 
cleaner interface than passing in a mask, since it means that
we couldn't be passed nonsensical masks like 0xdeadbeef.  It
also makes it easy to re-direct special cases.

I don't have a test case that triggers the bug.  All I can say
is that (1) this still boots a normal kernel and (2) the code
paths are triggered since the kernel enables tbi for EL0.

Jordan, can you test this please?


r~


Richard Henderson (2):
  accel/tcg: Add tlb_flush_page_bits_by_mmuidx*
  target/arm: Use tlb_flush_page_bits_by_mmuidx*

 include/exec/exec-all.h |  36 ++++++
 accel/tcg/cputlb.c      | 259 ++++++++++++++++++++++++++++++++++++++--
 target/arm/helper.c     |  46 +++++--
 3 files changed, 325 insertions(+), 16 deletions(-)

-- 
2.25.1

