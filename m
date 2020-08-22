Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1298506lfy;
        Sat, 22 Aug 2020 11:10:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb5JhV3NL1Y8szQmnOjW6SxZKTM0bdTFgkVgfBLXejbSBsi6woBLtiTcB3PXZQlt+DkrxH
X-Received: by 2002:a25:3483:: with SMTP id b125mr11823930yba.8.1598119823477;
        Sat, 22 Aug 2020 11:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598119823; cv=none;
        d=google.com; s=arc-20160816;
        b=vQw/9aXcOt57ZEKi8EyyJKUQKh0/JiKzS9j19GqXY7Fpu2Cqu9nfb4rBnaUVZvFFO3
         v/EhjOkJRv1vjACdcR7DP3UIQ9zO6n7OVthoQSrn+AK1Kv+XmspMICcXEUV5/SpF5LjP
         x4x7o4/snuim2HULUnfi/UoFd2dPugsPZXIndw0RmELEh3WxVqqCAq77rK0LBbio+nII
         1t2CXRFSieruieoMgoqn18o65NpecXbYN6EAzC8jAHYJrjRLM30SL4M3u9kvP8La9KAs
         y1Kvx6gob6gpEsDr6K+Axzfobj1VL2IQOIblCMotdOH0ik1DjlJTA3xEw5cOTdazrZMx
         TAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=K0k77PmVQN5AlBGF9o/Ch9CVjiLjAUW6B49s4OWNij4=;
        b=hXZTfz6VsdGTH2Q5/Nkv5/89nr+r1nZ+wK/IjQf4EjJjJ6rEcZfC0oHND96bkKL8cZ
         2dFrMesrpAxk6ZV9hwpvpc7n4u9zfKkKLoYFtY44R8j5AFNwS+1iG/35/34IaJ8SPJi4
         fetEUeuJLY/TmnkIshSXZHarGrLZnj8nnKBpce/XqMB8oEkkK9eyKLAQx7dfNtNrV8Ig
         dKcNGhqJHqyyJRqShQKEOqb5fP4yZubs+sdB8C/+fdEVoHMJyBuC4roLp1ap6dkl1GLW
         FD3jU0H+1fWHtnItmNUXWBSE7vpGNyTFx0y+hw5xHA1B8ug6i7vO5+XcE9sQJi/O/Ai5
         H+Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fh6WK7hp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m185si5831213ybb.377.2020.08.22.11.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Aug 2020 11:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fh6WK7hp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9XyA-0006lq-O5
	for alex.bennee@linaro.org; Sat, 22 Aug 2020 14:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Xxm-0006Ig-Eu; Sat, 22 Aug 2020 14:09:58 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Xxk-0007af-Su; Sat, 22 Aug 2020 14:09:58 -0400
Received: by mail-wr1-x442.google.com with SMTP id a15so4801455wrh.10;
 Sat, 22 Aug 2020 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K0k77PmVQN5AlBGF9o/Ch9CVjiLjAUW6B49s4OWNij4=;
 b=fh6WK7hpjUb9zIuu8p0/G2pbR5mxLrfgvka3gmh8bMjclNJ8ec5h5D0et9lEYIilpl
 m3No3XuM6lus6YGbaM2bweqyXeJxcd0MtFGOsl+C7OkYq/F0krk2W7f8DuNoVOZrr3pt
 pnorpuUUcoMe8W42ceesImIdBWoVviBGd7ChxxiVv6DpMQINPE61NYDzjVE9bQAp+TXp
 L3nJxVR6r3RM6g1ejtMrIT9FAPlwnSwxwW/bc5FhyzluQV2YgXGGwMY4DLA4HVo+R4U0
 nZouK+ulbsPVLVw4AsT3pLGN5WJ0MAYUIC+h5e/W4Fci6NA+cPA2pMlqezKpLfvcftaA
 aBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=K0k77PmVQN5AlBGF9o/Ch9CVjiLjAUW6B49s4OWNij4=;
 b=nq/uLmstYHTHloWHHXsnFySz1ksPY/3P9g7pgTFc/Vm8BsJxM9uC3T45Bwb1lhr0Bx
 ilS8ieLT6qKEzA+70UTeAfkZUj+FwFtFdAt8M/bpyVKa9K0ueSDM6PGiZpvEi6XK9P/J
 hP+YXQyZ0wf/i7VSegQ6yO3DKa2KU7GVZfDC9Eogjf23QBLeFxFErPD2NtOu2Flwu3v3
 6h5jZ8yF4Gi1nD0gnJUTDd3lpFJJ86oF8wBjMQTwJPu3yLlSneTrCZ2QCwVaV68MPItW
 gQsSXRc+zpchxPX5eLdFcRCR4KnrTNfS+thCyUh1fmL45gyu1iEDQERPRdXICOintNgC
 A5VA==
X-Gm-Message-State: AOAM533ml0y4D0T3E4xVjwBWI414qJ4u0ZahlAiYparKVBwm2xbO2zMn
 vWCTYbt50vGrrk2GcR9+FhWYRq0AU60=
X-Received: by 2002:a5d:5084:: with SMTP id a4mr8208684wrt.191.1598119793555; 
 Sat, 22 Aug 2020 11:09:53 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 126sm13713876wme.42.2020.08.22.11.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 11:09:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] util/hexdump: Cleanup qemu_hexdump()
Date: Sat, 22 Aug 2020 20:09:48 +0200
Message-Id: <20200822180950.1343963-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Zhang Chen <chen.zhang@intel.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kvNJryRPMeRD

- Pass const void* buffer
- Reorder arguments

Supersedes: <20200822150457.1322519-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (2):
  util/hexdump: Convert to take a void pointer argument
  util/hexdump: Reorder qemu_hexdump() arguments

 include/qemu-common.h    |  3 ++-
 hw/dma/xlnx_dpdma.c      |  2 +-
 hw/net/fsl_etsec/etsec.c |  2 +-
 hw/net/fsl_etsec/rings.c |  2 +-
 hw/sd/sd.c               |  2 +-
 hw/usb/redirect.c        |  2 +-
 net/colo-compare.c       | 24 ++++++++++++------------
 net/net.c                |  2 +-
 util/hexdump.c           |  4 +++-
 util/iov.c               |  2 +-
 10 files changed, 24 insertions(+), 21 deletions(-)

-- 
2.26.2

