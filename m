Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2391694lfm;
        Tue, 16 Jun 2020 00:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7GRQQW1IB2NrkePReI8aadpVhVhtY6zT7W7i7Prba3zyb/BM0I57bWS8Go4hfvvGQMIIj
X-Received: by 2002:a25:4cc6:: with SMTP id z189mr2072465yba.153.1592293901468;
        Tue, 16 Jun 2020 00:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592293901; cv=none;
        d=google.com; s=arc-20160816;
        b=F0xQn1zWbqE8l1iHnmQ6XZA08X4Wb3WeoHpo9ljjARmLuPv/NOgzK3kxyFbptA7Duz
         iwVmIrJbI+8R09xZadG6ygqa6uSjm/6BaxE7e4wasQDXvvUu0t1T69xaWS6M6EFHD739
         61jsGPZCjUllto5ahkY5BIJocjKlQNCDKZoZwb/eLIMsm86kzPjZAD81BXhsq4EEVM/q
         2Y0tmMi1r30UhA1FJ4pBLQyf6RD8MYUIyPpYuVCgdFGFA7PXjPy94LivnAOM9M4tw+Wq
         Q9d3BjX+4Mwf2rkXdLdtAHmAwtQ6iyEYYYhAT0SilLZXLw/G8SlH5fu+HMd6cK19Llje
         jCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CMGZ8HmZIZlFe+EGA2xhdq3yGzhcCaWNcKp3HY+yM/k=;
        b=omiBA8f5Wkk84iS0IyXTfKrrEG4JZglod6NSKGUy0Vn8zXHeMqZ1oxj7nET0iQFj1D
         Co78YVDwpkvUf20UMgOQizqYQq0R0tMfjdAJ4vpMRa5JEePSV0YA+dgJUFQhZVziQhoS
         i7HXC7L45taHeVO4HBeb7Fp0D3unnUG89VIE5hdfnVCk9pmVUQ7ZsrSb0+kvUF29THJR
         Vp49ewBhnFE7R3dtb3JXPze2vryoqHs7FaVKUgIxM+3hCgA8GT5FD5J9hSIbJY19P75X
         y28P/hz2XXHGbyDAjKGC3zgRuT3bTVBgxrvX8fV12QqE5CkxXFG7BeBOp/UQ4dYgsC7K
         rA8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l8drelST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q72si15439242ybg.133.2020.06.16.00.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 00:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l8drelST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl6Ng-0003ep-PE
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 03:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl6NT-0003dL-Sd; Tue, 16 Jun 2020 03:51:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl6NS-000844-4y; Tue, 16 Jun 2020 03:51:27 -0400
Received: by mail-wr1-x442.google.com with SMTP id r7so19697879wro.1;
 Tue, 16 Jun 2020 00:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CMGZ8HmZIZlFe+EGA2xhdq3yGzhcCaWNcKp3HY+yM/k=;
 b=l8drelST4J485o7YCO6ppUAgvESbk/nw0xzGesnIw33Y78ManT58+5luzQ5airxIzL
 W9SJ+0MldslH/WLb9TGA/jTT4dPnAppXb9uG+ymCBmlCnRTURl7xBa8OgQkwroBK4iJQ
 eyUl5s8h/pR++TmcxfNvsMXFUYc8EnUlS/obfO2rUdu+QLAzAKq2TYT1by3pgLnUrGXM
 cXmXxuiSzYwG/jEtu4UGmmX9YcbHx65JHwZBetOmSYAYu8jNxG+PCRnQYsVi/IkHQVbW
 9GUzEcPTv+Ma0ehxoa4DMR/QWa3xVmon6XBoOlJdL3cMlKYdUccqiqK84u//m1O9/py4
 1mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CMGZ8HmZIZlFe+EGA2xhdq3yGzhcCaWNcKp3HY+yM/k=;
 b=svYMNyr/c5YmUMedgu4+iuHooiFFJDbfu5n89M0b2iMgvp/DMZCFTK38fb0Hom4lmV
 oUpzHQCO5eUS4F6DMf6BR0BNNxrwgRNGgcO34GZFojsLqYoWMazYZ1ixRReEavZ0olrd
 MB1DM+Ivg4bec3wXPACyCXq3Qn2eOa8U8BfVfMLHk8zMm50Bk0oLeRrNsxXpKT1m4Czn
 2NNeOAv4/kvRjlj7gjvkpBsTVZEUtjhbVTVW6l26yhPgCtxGjevpqhUZ5J+rXAlQrHCl
 OAt6ORWA3H+R5OGGy3CIwxnFTMw/v0rqPqkJSzGWgqP/7OfAaa/d0M1miOrp5rAqeEr+
 nCxw==
X-Gm-Message-State: AOAM5331JOhalVKdfX2C48Gskc4zv1njJt0vZ/Z5yOwwM0ZoUHl7IMqo
 fpNnZp2w7snG1zd1mrPkEctb73wo
X-Received: by 2002:adf:a396:: with SMTP id l22mr1640024wrb.24.1592293883830; 
 Tue, 16 Jun 2020 00:51:23 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q11sm28093538wrv.67.2020.06.16.00.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 00:51:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] misc: Reduce QEMUTimer pressure by using lower precision
 when possible
Date: Tue, 16 Jun 2020 09:51:14 +0200
Message-Id: <20200616075121.12837-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eNUUkiv0MwS3

This series contains few patches resulting from the notes I
took while reviewing Mark ADB series last Sunday, in particular:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg712078.html

I have another patch for hw/input/hid.c but I prefer to hold it
to test it more.

Philippe Mathieu-Daudé (7):
  qemu-common: Briefly document qemu_timedate_diff() unit
  block/qcow2: Document cache_clean_interval field holds seconds
  block/curl: Reduce timer precision to milli-second
  hw/virtio/virtio-balloon: Rename timer field including 'ms' unit
  hw/rtc/m48t59: Reduce timer precision to milli-second
  hw/ipmi/ipmi_bmc_extern: Reduce timer precision to milli-second
  hw/watchdog/wdt_aspeed: Reduce timer precision to micro-second

 block/qcow2.h                      |  1 +
 hw/rtc/m48t59-internal.h           |  2 +-
 include/hw/virtio/virtio-balloon.h |  2 +-
 include/hw/watchdog/wdt_aspeed.h   |  2 +-
 include/qemu-common.h              |  1 +
 block/curl.c                       | 15 +++++++--------
 hw/ipmi/ipmi_bmc_extern.c          | 19 +++++++++---------
 hw/rtc/m48t59.c                    | 31 +++++++++++++++---------------
 hw/virtio/virtio-balloon.c         | 14 ++++++++------
 hw/watchdog/wdt_aspeed.c           | 24 ++++++++++++-----------
 softmmu/vl.c                       |  2 +-
 11 files changed, 60 insertions(+), 53 deletions(-)

-- 
2.21.3

