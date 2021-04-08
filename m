Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp958296lfr;
        Wed, 7 Apr 2021 17:21:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJBZNyes6ksvdJ7rNmQo3V2GEMIMGPFR0eSame0t3qJ6gY8hjg4uA165hLwpNn7rPz7wn7
X-Received: by 2002:a05:6102:22f0:: with SMTP id b16mr2425213vsh.32.1617841280445;
        Wed, 07 Apr 2021 17:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617841280; cv=none;
        d=google.com; s=arc-20160816;
        b=LrBQHVtGM8DZlxb77hFKMGldWd+7gFlmnpfhhx3SEJf0KISrtZlwjjBLcZrBmM2WuG
         xPUsGwxEGzTtKX/s9p6kwm1F2R3kjxB3LfBpsfC01EAfOJbVDs35ba5nzXDSS1fBCRxY
         fkV6Qjfkhx6INzMrdRdegJK8zkMX3E6y13VmPXzIUeWROFDvBlU1miK4BFB+GV8h3+ot
         tc8gCo0qPup2qx2ikIAuZKl6hqcVqfjBOIkf0mdW+eBtV9XwKyBY7OOTwLaXrVlYsC6E
         JFh+M1f1vszqfoFY7Xitv8Tzs+SSH6gsH6VAiQrqSJaykig3u0vDkgy8bfr0KtCyv0B0
         YC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PPTNh0965BLKGe6VCDI7MG4KhBVDWdp5v+1SoqVu6+I=;
        b=WRYgy7J0YLLKu+ZMmSXOqPXFmHeqmZtGAmYEnBpKUG0n0gAidsmqFyuJMlUkI78/lr
         HrFg7kT35voTgqp93OzH1Fx+p//fkdx53zjT1mWJ1sLkIfohY/Xnifb9XKeuPzTIMdk+
         Px4icmFSeAQCi7UZyIVtIT7QrB0yyU7xQ8+usvMJyYDDfBht9Gt6oYlCaLHVmQHSoZW3
         EPk58vUAUkqosS5hCyfMzCYU7XkWOtBuafVA1gEWnj1lc80O1573g4QuevVwvsf09Oyb
         ZMH5nZGVp7LYKs6o/xmRDYYOmFQfU9DoxvKCpMlrjglvWTOOZs2GzBGnjX6AS0EMIqRY
         WSFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Ef7u7zSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si6622489vsj.243.2021.04.07.17.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 17:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Ef7u7zSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUIQB-0005IW-N7
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 20:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPx-0005G9-KN
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 20:21:05 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:36776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPm-0002dO-Ls
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 20:21:05 -0400
Received: by mail-io1-xd43.google.com with SMTP id y4so365076ioy.3
 for <qemu-arm@nongnu.org>; Wed, 07 Apr 2021 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPTNh0965BLKGe6VCDI7MG4KhBVDWdp5v+1SoqVu6+I=;
 b=Ef7u7zSZ60VPCSWvu3JRt8fFNov7E/LWwhFJsZJPn8+Ua1LYTv3XizdhzorYrhJC9t
 JZjmE7nkY9Z/eORLyGzf9xrNsJsHXqeGmMAGG8bLTMjzDacVZJSklPgEcJKiV+Hz5lQl
 lQpQFOlw4kKT+S9Ws7wbHZcZmatohrwbxgepKVq95I7nhSBPB/ENnnzEj/oWouEQQhhA
 PNS+sxjUTs5yVfkej1kyhTSOv+Zuc3VXmjdhHC8jUFAnYVzrFdXyHH2wGztDf3j0EJJC
 Pwhz77ppyNnhn8nk2ienPF+gz5IKy257GkvqtudMdokK1p8DeVaDHHxcXVldF+3dbE76
 YAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPTNh0965BLKGe6VCDI7MG4KhBVDWdp5v+1SoqVu6+I=;
 b=EPOZAgvc7kLRQKsGPf3ECjgIGGnQljgPhQ10hbZqe0ksFZX0uzMkhGv24SdsEXhldj
 uTt5nrvgDK7UZHBiu2g0+VZeHCg3AkCTLvo7kBvQ6/H74BoaMt8FQz89597y0pfzjq6F
 /ShkxId+HXE/qoBGH8Aoz2VyKFya1KvecJADw8hSxGZLUA6LHnIxtOvQ9IVurhwi9keb
 +JPJc45mxtnhUWicVP2wAeMI0VDnfwjcV/I8vfGZJ7alxc1QE03f+SN1MwzmrcmcxVQ5
 YEeaXh/GxwBv1+nhnGiKhbKagz/2kqO+u2fiy3yPG+wbi9krft/x0bwiCmZ6Vb30Siz0
 /siA==
X-Gm-Message-State: AOAM532XABskrVYfmlQZCC3OvpEry4GVdRYHqD0SXYBgMdRO4AXWKwnk
 JHd5g+a8Ddv8T0wbNsfSKOuWFw==
X-Received: by 2002:a05:6638:1648:: with SMTP id
 a8mr6045868jat.25.1617841251630; 
 Wed, 07 Apr 2021 17:20:51 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id 11sm1818393ilg.53.2021.04.07.17.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 17:20:51 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v6 0/4] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Wed,  7 Apr 2021 18:20:35 -0600
Message-Id: <20210408002039.18027-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd43.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tnjTFo2ZXunG

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.

Changes from v5 to v6:

Fixed wrapping of functions in exec-all.h to avoid exceeding the
80 character limit. checkpatch.pl now passes.

Rebecca Cran (4):
  accel/tcg: Add TLB invalidation support for ranges of addresses
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 130 ++++++-
 include/exec/exec-all.h |  46 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 369 ++++++++++++++++++++
 5 files changed, 553 insertions(+), 3 deletions(-)

-- 
2.26.2

