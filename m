Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2759499lfo;
        Sun, 31 Jan 2021 08:45:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnCOR9DORy/JUxjIS+TT0SxuN71yp7WRToo24gVjxFGbqZD1otBJFkGcazBZstfibQy3MD
X-Received: by 2002:a25:7651:: with SMTP id r78mr20212766ybc.198.1612111503563;
        Sun, 31 Jan 2021 08:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612111503; cv=none;
        d=google.com; s=arc-20160816;
        b=Scu3dQRW8sbJ1I5YWG2UVwM8GZ3JfRZ7necZxpHHQcI8vHTl665Nopd1m5oXv4qA19
         br7OiuyO2N5aBLPM1byKoubpxB8ptyUopzSuV2WO2Czptrley7JMVStof1EG9mazVL8q
         iS2i1SIDTiAnsUakS+rEWLNcL7XoS1nMXLD8YS9epQwEUdlpKcAkJ+hiFM1H1O8Qcmqp
         tv3OA6PGgbzaX3hS8DV2Km69sNXQqQb5CBqHibyh7EcfE+YDIq5hebYxlSoeWVYbgAN6
         ZTpiMXsmvuOGgdXjMU3qiFnyXk6MdQ/IAnzVAkV1wumQkQvZTLp2enwDCy7Cfvyw3iXk
         0TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qTXl26BhYMMkC6cZxuxgFnk+gqy5Q4bDto7VeuMgqds=;
        b=OHd/6GNAqABxls4FEgVo6NKPVxlxaovgmoDHnC4Ay/UPZFhmEWLFQdWbs+Wu+y0SuA
         JqfqCUt8+CRUH1YaNYuCIICaLyBkvqUHBfaLt5vl9ROZjjh7tOYw9/DUGfxkukVIQUrW
         MeVlyHx6YBCNVxH+XthVGOJEU15syZ+hEA1EEcKhxHBYpf1O7y+OwqV/77Dartn4pFwF
         ykqmjTt4jNw2tL9ph0lu8aLKOsysPri1APOUmPySWKfbLRJi7ZZIZxAhZz5t4Ql4pAvM
         PuAEI/a8pzpjxC82My2ElHi7LYN1zEQPZiO7rFwQY/auY3Pcm6zRtlbTZfWU0NyVprZS
         pFgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="jzxLW/69";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v201si19219240ybe.103.2021.01.31.08.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 08:45:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="jzxLW/69";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6FqQ-00085N-Ra
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 11:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpd-00084v-K0; Sun, 31 Jan 2021 11:44:13 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpc-0001PZ-03; Sun, 31 Jan 2021 11:44:13 -0500
Received: by mail-wr1-x436.google.com with SMTP id c12so14026745wrc.7;
 Sun, 31 Jan 2021 08:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qTXl26BhYMMkC6cZxuxgFnk+gqy5Q4bDto7VeuMgqds=;
 b=jzxLW/69ks5l7t/9iBxuGGFkFJ//lIEVx3ozA1fyoN+IRfCpRvwNnvOm3uAe2M9kTD
 eDdQZWZBeDPOHRFJ4YzPx2g/jeuNXTvOb7njI8dULz1/T6ZRISeflY+RZ0LFoXvek1yu
 lxCnnywUh3QJQhRWaMceGoyomJuLq6a8ABCRhFHAtYz4ofYl7dUtu/a4K8b7+5Eio4V5
 HdtPbGQeC9Z/yWdf6/OHCKINZ4/ZEAAYweDT7DH5uJjpvJdJTqLPWkJzTEdvD297pOkm
 LgmqHK2SweGyoSoW8wdEeoRjJ6f5IUcuMYApatXZ9VUVbChFpeePv2JJQw3U6cQv2mUx
 s8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qTXl26BhYMMkC6cZxuxgFnk+gqy5Q4bDto7VeuMgqds=;
 b=Aw3VS3XZk5aglL2+4/KW9J2y2Ld9bvtLJqj290WpbtpNLbirTln42dXIoha4gg8BhT
 yiQWKUQP+qzd7YT2NANR8KdKdP92m/PIow3tSsy6XcqNb4mxTt2m4T9uHKVK8rNXLzPs
 9Sqz1107HAkfLcs8yq5YIfrdIoJJxz0Ami1VZCmgtj/vRVhenhzXnERJf6DtuqYwf6jB
 xVAccmhRQCNl6nU5mY1HGpWGwme3EvDrYD2W4r7V79uREcxC6UZsC1tRaqREk9rkYAV4
 UW/d2IpprpxYWCt0/Lve/ta7IpD30bhW6015FS7PpN3g+ZqB5NJ6nTpaVwbTNMohxUbk
 UvfQ==
X-Gm-Message-State: AOAM530qa4GlXNCcIuGwyvgCseoV40G3Kx++2PvCElPcXbOwT/kHuO95
 QZu2NaB+Iqngi/3AZ/Xsg8T+HY8QuI4=
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr12930181wrx.357.1612111449892; 
 Sun, 31 Jan 2021 08:44:09 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id a6sm17936335wmj.27.2021.01.31.08.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 08:44:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/arm: Restrict v7A TCG cpus to TCG accel
Date: Sun, 31 Jan 2021 17:44:01 +0100
Message-Id: <20210131164406.349825-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BndFWr4nfVCH

KVM requires the target cpu to be at least ARMv8 architecture.=0D
=0D
Restrict the last ARMv7 CPUs (A-profile) to TCG.=0D
=0D
(This is where I realize no need to split the v7 A/R/M profiles=0D
anymore... I could have use a single ARM_V7, although it is useful=0D
to have the M-profile separated).=0D
=0D
Based-on: <20210131115022.242570-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/arm: Use Kconfig 'default y' syntax instead of default-configs=0D
  hw/arm: Restrict ARMv7 A-profile cpus to TCG accel=0D
  target/arm: Restrict v8M IDAU to TCG=0D
  target/arm/cpu: Update coding style to make checkpatch.pl happy=0D
  target/arm: Restrict v7A TCG cpus to TCG accel=0D
=0D
 default-configs/devices/aarch64-softmmu.mak |   3 -=0D
 default-configs/devices/arm-softmmu.mak     |  12 -=0D
 target/arm/cpu.c                            | 330 --------------------=0D
 target/arm/cpu_tcg.c                        | 318 +++++++++++++++++++=0D
 hw/arm/Kconfig                              |  15 +=0D
 5 files changed, 333 insertions(+), 345 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D
