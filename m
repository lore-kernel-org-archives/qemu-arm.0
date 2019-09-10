Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5258466wrp;
        Tue, 10 Sep 2019 02:58:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1s6onrP+o6HOShw8NltxXceqcMYDtLx2g9itx/A/l6Y/mJMCkFTldgogVK9OFCRQ2KNNc
X-Received: by 2002:a37:9d53:: with SMTP id g80mr27225111qke.67.1568109507431;
        Tue, 10 Sep 2019 02:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568109507; cv=none;
        d=google.com; s=arc-20160816;
        b=Xn1CU5O9hFrhYq7AAiggCG/piKwDxlgrCHdRqmIHUj5Roqw6cKYYe0vdFbJPayHyvx
         eMoYXzmkYyabZ224aTukD4MJNc1gBgW0pbsE7pYxBlszJ4mQwW1cIoTRgovxCPu6syiz
         Ne0nFyruEV5fGNzMRv4UqAsCvK0I4VjFloLtz2AvAG03ADfOcNmvC2X5PNQYzDIGBSwL
         recEwF97TM9vAdW7E9i9jwvtAlOoF1uuz1JDhWG98Pv+ivovMHIp7pXvdGRW/OMmQgnl
         v6W4a0hZDD1T2xjxtxLspWQbNgi/OzeaOl2wI0HFpqCatehzU9tR+gjlCMzK7WV8eID9
         RJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=64ABiwabwec/jyTMQAJqG7C3XJSwzw/xE4Vr+VwrIq0=;
        b=PY7bULW0ZMHaZTY8Ce1JV3SAB4z2FbuLkj2Nzo3COPqKBDfEv6D7O8y0LBjEg8nwjW
         bGwTBq0uey3NVV7tVPNSxy1nKZgpfmjo/f3beliOlyIhN83aaXfv+WwRbmySHlTqH1AE
         siCY2WbvPaBU22vbx+DArQT97tjOEM3CJLVHCJhRtEQz0EbuHgMt0pqTLZBDiWtQBv13
         khcjj/VAsy5wu9xF1ImN7DNhAhYTgHjVWj5hOHKu5uPBbSHwpBn3PDruQfyw0J1s1nEF
         Mvy61KvP+vDEsj823gn4+ZAgJzn4C6SH2zlTroXIFnKbCbjzxJoQ06K059ru2q0rwmGO
         r1EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HY+4w06f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si5870165qvz.177.2019.09.10.02.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 02:58:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HY+4w06f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7cuo-0001Np-LV
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 05:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1i7ct0-0008P7-KH
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:56:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1i7csz-0002XS-8H
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:56:34 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44191)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1i7csz-0002WZ-33
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:56:33 -0400
Received: by mail-wr1-x443.google.com with SMTP id k6so6705501wrn.11
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=64ABiwabwec/jyTMQAJqG7C3XJSwzw/xE4Vr+VwrIq0=;
 b=HY+4w06fNHu9p5eTBDH4d87As1kJdg76FLXuQIHE98gT3eXg/DmyN8qL4wYS+oBMcg
 k4hes7VfpHH4EB24sfS4VoUWEwlbv7A6nikbFbCGdwzlgK3oZXrjD2mzLi2OyCvjuYS8
 SZapcfZTiySy29M23mwTRbzcxQQTCciM23G7ulYzUTGzHKlB+3uUPqcZcfcSNiG9x8tr
 XtKuy+0Q6LhA647UIHNLSJW0lxUvVYA/190bNN/KG75rtbeKuIiqUjJJnTdTyw+mTt1K
 owmgiZZjQRJDHAUlygmIAyyifM0UPbzGXuNXJrmsGXebGEBpxkiZ1JPi6otEePMy+7is
 nfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=64ABiwabwec/jyTMQAJqG7C3XJSwzw/xE4Vr+VwrIq0=;
 b=bLtcjVUSvp50BLli+G9W1S1wF2K3uAv+jtd08dwawobj1r2RH1ncj4osg7cvrYbUXE
 WYg2C6JNNpXaJRbwur4n4mD34T1H3WshXqk9jLlniMEI+POEL7tMSQmu/hJuvqiFT/ir
 FselfVzvzWXTNSmyWJOyaKlSxWMiiNg7eDr2NFinFW7DwLlVr71zyTtIQj/v7bMT8UCc
 IYa6gpVBbfD7fSDMvXiuOomjGEZarER6wewJzG+7ZK6rzgP7vSQBvBfAmtnGkUXqL+t+
 cXeZx8caiUKnYil2Q0kfieFHc3ze7ZgKAT/mOtMlUttao28PU2jnKmHvHjnkjzJ0AIWJ
 QWHQ==
X-Gm-Message-State: APjAAAUEo2iqtVhG+jOwLvwZxlMi0JlK0H6q4XF/kyzh4y44SIwSbiOj
 Ap/NK2jqPVHvsmSVYFZ9YbL9mhf97IP01g==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr24657511wrt.79.1568109391128; 
 Tue, 10 Sep 2019 02:56:31 -0700 (PDT)
Received: from moi-XPS-13-9350.arm.com
 (host86-144-13-57.range86-144.btcentralplus.com. [86.144.13.57])
 by smtp.gmail.com with ESMTPSA id e30sm32403540wra.48.2019.09.10.02.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:56:30 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 11:56:06 +0200
Message-Id: <20190910095610.4546-1-beata.michalska@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH 0/4] target/arm: Support for Data Cache Clean
 up to PoP
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
Cc: peter.maydell@linaro.org, Beata Michalska <beata.michalska@linaro.org>,
 quintela@redhat.com, richard.henderson@linaro.org, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OaoRoXuGrmeY


ARMv8.2 introduced support for Data Cache Clean instructions to PoP
(point-of-persistence) and PoDP (point-of-deep-persistence):
ARMv8.2-DCCVAP &  ARMv8.2-DCCVADP respectively.
This patch set adds support for emulating both, though there is no
distinction between the two points: the PoDP is assumed to represent
the same point of persistence as PoP. Case there is no such point specified
for the considered memory system both will fall back to the DV CVAC inst
(clean up to the point of coherency).
The changes introduced include adding probe_read for validating read memory
access to allow verification for mandatory read access for both cache
clean instructions, along with support for writeback for requested memory
regions through msync, if one is available, based otherwise on fsyncdata.

As currently the virt platform is missing support for NVDIMM,
the changes have been tested  with [1] & [2]


[1] https://patchwork.kernel.org/cover/10830237/
[2] https://patchwork.kernel.org/project/qemu-devel/list/?series=159441


Beata Michalska (4):
  tcg: cputlb: Add probe_read
  Memory: Enable writeback for given memory region
  migration: ram: Switch to ram block writeback
  target/arm: Add support for DC CVAP & DC CVADP ins

 configure                  | 24 ++++++++++++++++++++++++
 exec.c                     | 38 ++++++++++++++++++++++++++++++++++++++
 include/exec/exec-all.h    |  6 ++++++
 include/exec/memory.h      |  6 ++++++
 include/exec/ram_addr.h    |  6 ++++++
 linux-user/elfload.c       | 18 +++++++++++++++++-
 memory.c                   | 12 ++++++++++++
 migration/ram.c            |  5 +----
 target/arm/cpu.h           | 13 ++++++++++++-
 target/arm/cpu64.c         |  1 +
 target/arm/helper.c        | 24 ++++++++++++++++++++++++
 target/arm/helper.h        |  1 +
 target/arm/op_helper.c     | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  5 +++++
 14 files changed, 189 insertions(+), 6 deletions(-)

-- 
2.7.4

