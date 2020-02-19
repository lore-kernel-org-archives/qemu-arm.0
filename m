Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp322349lfp;
        Wed, 19 Feb 2020 02:24:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqztyIw9JlKOcgWHqpIEq2UazGJpFqZfnE++j3OjbrX9IEtu+QQMXsjXbAvv/GRgbbvSCxm/
X-Received: by 2002:a37:b09:: with SMTP id 9mr18832191qkl.327.1582107869042;
        Wed, 19 Feb 2020 02:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107869; cv=none;
        d=google.com; s=arc-20160816;
        b=F9BJ0UIVo3nG+5iWhGPvbDdJ3kCjBo3LEVvzpvxoQl8vyIh9ACmESygSqCDqK//Vna
         AnFfHwLe+gtjeFJ6dEVYTAFfGEmD500UGCjO6X6kSL/98Ml5FMHLBVwZ4WAH5oPRDz5L
         cirA4r2gWKDtelJmeLMG11hs6p3uE527tWCWQpBs7o+tFUOQL9Tjwj9gQ8IVASzqZvE+
         RTPYGyUtKVQoo/sp1AVTvo6MmvdwKfpI5PMynDi6rXPn0lbogGyL2N67Q1H3/B9zuhQ0
         0imSkAQCzeOZu4FGyJUKKGy1nwnrNOryQA9VY9T9KGF+nnwDMRsFid9eZSu6mpy+d/6m
         ehhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=p3WtfiacGOofT8uM/WQ4oJiMv7OHdl9GdfdYZE8RbVo=;
        b=NQpgHsIaYEf6OB4ef2W/2AzEBQwt5lp90LXkbJrW+DG3sNG/9OroaX+9P9bP5ttm2X
         028Hk+A47iKzdwjd6zpAgJDClY8ups2L/Tune68qSE+4Yz24PW6fy780c3Yyl4jTlLp2
         C/DRkZyr4h6VxBv8fAlqqriwIFoTptrD8FWsIFGYgODJKB7JYhHA4PdXGhqk+MC9NRyc
         xTfi8eBFeTxQ4PfG1D88HQFnP6JmMdArELZc/GgJgqU8UKpwjGFKjbVo9edg2ps/wD4j
         QP49YDXjgWe5mCzIwOYs1+9cjL7Nw5zG6WBwWCAsYEINQqt0ppEgeO6w5fquUBMWM4hU
         Rtog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si741551qtq.400.2020.02.19.02.24.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:24:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MWq-0001B4-8x
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPu-0003iU-Vk
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPt-0005V8-BQ
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:18 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:56387)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPd-000543-2c; Wed, 19 Feb 2020 05:17:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MK3iK-1ik4d83kmE-00LZU1; Wed, 19 Feb 2020 11:16:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/17] mailmap: Add entry for Yu-Chen Lin
Date: Wed, 19 Feb 2020 11:15:56 +0100
Message-Id: <20200219101612.1033925-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xe7wKhpW7sXLoo199dRB/P1e4/7TgICYuBSsWrRJup5IcV/QJDq
 a3CtbgancMWpc6D9W43PZRdAidSaEqYjrGaO4EZABDLuWLwsZGVSKhanQtrmHNUkoSY71Yw
 X+7zg2yuL6+yQzXjWqm4g8ZhUAo8qffqJAtPZOMDtVxO1JY7tHz68pHonIULRpI+U9wIyBt
 GcBjEZwc7K2b2iiwySwdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zqlyOD3cVig=:l34FrFYAmNKubln+sQibfc
 nXhE9k6YREHjSeSHnh4MWVUiIXIUevjWujFUVpGLzOhtomdgDjl9pDfDrEWGGcxnZYPGz2klw
 A//D1MYnxLZb0Ay/u2BpAI45opHZPxf/puY365Ns0yQMyGck69mRumDbRi7qd759wPVtvCL8q
 Hrg+ofqGj7v+oFcaVRXOUtsj4yas0TIN2wMRzxEv6DjSNRIaa8xXWv9+KUYgNimV2+BBHOHZs
 3vt5fczORZqIeUisPGwZUeEYr2rWbN6A62APLezlVZB8Fc4fP/jXWU6i5rOumcJxlvosbsPDH
 hEnVjem8OdItiiBliC2UOGjUa9AW0ykME1aNrQD9c3vpZFRLljALG/ls6rPT88g1DBTILJ7iE
 UosapGHp263xeQj2mWwCpZyzQVZKpH65urLNOwHhWWcqoVBNQ23QPoJCfflADQElXKngsCLVs
 c3HMxrosmjkOGA+XmqADp3QA8QLSIIwbY4JaXxyzQUTCV0Au0iE/+jdlSCZQ8k4FAq8ECMrpJ
 c7k64HtgDklPEbHEpOG1USZuGfhkxDsMms1t/SpUNuao1mMMKDG5gpfp3pccRTv7X729zVgRK
 2q/TINmzLbrtVw2qNSdoC/2PDmeU1IdomReLLCuSOiCbMZYneiQxj9bw9uvji/eKErbuyboFb
 VoaUWrn199W8euBQzIS9a+TIp2S5EKZF0wnTtIz6+xcFVH7nV6HVwpdASnnTSZYq5JDbtymVV
 MjZuHgohszDDcHlKk1dN2dQZrybMitFg0QjCnfv0vU6uPoJH0yd641DUth01GIL7g96OScKnt
 2xLZegXgl5Mh7Y3xrKZmwVmw8t+VLvxafTDkiFlgJ6nSwD++/Gzg0MXJ1hyu4mjRxzwfTme
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Yu-Chen Lin <yuchenlin@synology.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Yu-Chen Lin <npes87184@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DzF8OlUgCKzW

From: Yu-Chen Lin <npes87184@gmail.com>

I have two mail address, add entries for
showing author and email correctly.

Signed-off-by: Yu-Chen Lin <npes87184@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Yu-Chen Lin <yuchenlin@synology.com>
Message-Id: <20200206125504.7150-1-npes87184@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index a521c17b4430..76154c7d8abc 100644
--- a/.mailmap
+++ b/.mailmap
@@ -152,7 +152,8 @@ Xiaoqiang Zhao <zxq_yx_007@163.com>
 Xinhua Cao <caoxinhua@huawei.com>
 Xiong Zhang <xiong.y.zhang@intel.com>
 Yin Yin <yin.yin@cs2c.com.cn>
-yuchenlin <npes87184@gmail.com>
+Yu-Chen Lin <npes87184@gmail.com>
+Yu-Chen Lin <npes87184@gmail.com> <yuchenlin@synology.com>
 YunQiang Su <syq@debian.org>
 YunQiang Su <ysu@wavecomp.com>
 Yuri Pudgorodskiy <yur@virtuozzo.com>
-- 
2.24.1

