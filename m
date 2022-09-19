Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1287744ejy;
        Mon, 19 Sep 2022 10:33:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5O7/H7fnkF0Qd21s/vTWglBofK3tLkfTSN7nHgqTk3b4zIbGNK8sHfTX3DgaAmrdo6o/d7
X-Received: by 2002:a05:6214:2302:b0:470:2d10:b6e4 with SMTP id gc2-20020a056214230200b004702d10b6e4mr15674589qvb.72.1663608799823;
        Mon, 19 Sep 2022 10:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663608799; cv=none;
        d=google.com; s=arc-20160816;
        b=lgqSqbKLo7eow9QNqAXNc8fCympsBfmwJVsDeeTMtybYt2gkPjZNy6L+68RNH66VJ5
         +LO16qDvRIqbqBm0eRXsql/Y2ANYVQfwnmM+KlaMXQOCW5FF9XJmLYZEI3nG50jnmqm9
         2eoRAaxXwBi2Na2uJBOE3g0nvKB0kW1fgNQ7xEyW29hQt8yloTcWoCa/o060lC8wxQTB
         4VjX5Kq0OJBD1NTM7Iq8MG/u8K4V37Z8mw3/rhtl+yqfsZ31+h3hDEj8GMduHHkGa6ln
         oLJVvBXAnezbn9Pwyito6uXWsPUDfHJdKJ8JKZ7h7VVx1GltUJTDjw5+xNIe0dLUvoaF
         bgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bCmvzAKny1aLEo3VxnAGoHnqK+UgoHYHKIov0Cln1Dw=;
        b=gI53SGopuPiPJhltn3KBEAbTI6yTtUu44Clg5YkboAzUViO8wnzn5PWsN4lKRN/+fR
         x7X8XCKmaGR0Z64PU5/UFxa+vGlyZ6t/QSXoIuwKCLocxOrsXvst69c9CFpgBCK7koJi
         HH8pJz1N/bKyyzuqMBvpAKOaCIMHa0aZ+Lr/4iBedE+dKh3CQAnNJPnMBqH1qi6gZt7h
         xdvAPQKdaG3v+rK0YPzmoFcT4NgBzd4In+Htt0foThiz+9CAfwx8gP1if2hzd8v/7NfM
         XrlkFGIIhoyXfHxq26x8t8dpp7bsnMdjpjWWQJED0WAMQ+09qhyY5OKsQMxVHpwx4EP5
         TDSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=NwF9SeIU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a056214076100b004979de33396si8990530qvz.25.2022.09.19.10.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Sep 2022 10:33:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=NwF9SeIU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaKdz-0008CC-CD
	for alex.bennee@linaro.org; Mon, 19 Sep 2022 13:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKSd-00056Z-Pt
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:21:35 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKSY-0000OD-Ay
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:21:32 -0400
Received: by mail-pl1-x635.google.com with SMTP id jm11so28469101plb.13
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=bCmvzAKny1aLEo3VxnAGoHnqK+UgoHYHKIov0Cln1Dw=;
 b=NwF9SeIUsO61E3Q4947wxWSF6AyGzw+Zcb2gGr2eVYex+q81F+GCK+2aI0XwFGHDPQ
 h+jjQ7LsT0DoMdmX8oEGYJRpFIfkpvFaZkgj0fTRQFQqbBqeo+rzuaLC32uy8FgFbmPE
 HZtuAiwgUvGWLBVmUrCJ29bnj+ZSxPHeAZq7KbBv/nPNEN6DWd5Rjm4f5GfU4CQM5KUR
 Gih3w/kvmMqlqWB5dp9WXXRbIcBioaSF1iAZwKsCn8gzw67BEzloLfYKQCPlCPHD3sLG
 hw+uKziGBALcxEfvBXqnrRvzFBvFi1NeypuYj5PwyJdT7k/wW/+B5Q4p0N17FCYoZcDL
 RfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=bCmvzAKny1aLEo3VxnAGoHnqK+UgoHYHKIov0Cln1Dw=;
 b=ymxJWZ1zPLie+3V/JnDwJmwI17RAAm4HkDMv+CX+yxZ9tW1WMTrp5KBWXjCa020zh0
 064unMe1oXVTNz4+ID2VXFgvNHDnVEWhvzKIqusttRmbP2uCSya0uLZfiJBUtIHHzd3k
 B9sWUSmAx4kUoOSBkZgHXaKvXNTEJ0TDFy4Oh2OiBat3MGz05QWrXyEojRHy+5F06dbl
 W/hRQ0/XQCifD6jl86t8TyWmr1fHnJJ3Q+mWRK7/Eyla1IOE/1NVbgd2HHpWYisWy/R3
 5d6rv8M+9Q9aN0BmU1eblRahlXRoDVSW0DVcxVLN5JCFk6BSuVHagwmuhXJIHSozVOs/
 FaUg==
X-Gm-Message-State: ACrzQf00OMaKpIIEI3NKnip4pdYqzrsboH8h7+U9n5vyJWIWmd3fK++F
 wfseo9FBn417kyksCP5cm0rVdw==
X-Received: by 2002:a17:902:8648:b0:178:1b71:c295 with SMTP id
 y8-20020a170902864800b001781b71c295mr765292plt.148.1663608087081; 
 Mon, 19 Sep 2022 10:21:27 -0700 (PDT)
Received: from localhost ([49.7.199.170]) by smtp.gmail.com with ESMTPSA id
 r15-20020a63a54f000000b0043395af24f6sm18908032pgu.25.2022.09.19.10.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:21:26 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com,
 Jian Zhang <zhangjian.3032@bytedance.com>
Subject: [PATCH 0/3] Add a host power device
Date: Tue, 20 Sep 2022 01:21:09 +0800
Message-Id: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Sep 2022 13:29:46 -0400
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vqa6SHcke3jS

This patchset adds a host power device and added it into the g220a
mahcine. The BMC have a important is to control the power of the host,
usually it is nessary in a hardware platform.

The BMC(soc) usually had a output pin to control the power of the host,
and a input pin to get the power status of the host.

The host power device is a generic device to simulate the host power,
accept the power control command from the BMC and report the power
status.

Test on the g220a machine, the host power control command can be simply
work.

Jian Zhang (3):
  hw/gpio/aspeed_gpio: Add gpios in/out init
  hw/misc/host_power: Add a simple host power device
  hw/arm/aspeed: g220a: Add host-power device

 MAINTAINERS                  |   2 +
 hw/arm/Kconfig               |   1 +
 hw/arm/aspeed.c              |  19 +++++++
 hw/gpio/aspeed_gpio.c        |  17 ++++++
 hw/misc/Kconfig              |   3 +
 hw/misc/host_power.c         | 105 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   1 +
 include/hw/misc/host_power.h |  41 ++++++++++++++
 8 files changed, 189 insertions(+)
 create mode 100644 hw/misc/host_power.c
 create mode 100644 include/hw/misc/host_power.h

--
2.25.1

