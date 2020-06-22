Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2950406lfm;
        Mon, 22 Jun 2020 00:51:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH7V460RMyMUckmMeh9FZKtJUcfTgoO5g7orQ43W7I3u0GCTli7CosYJ+ExBomNuUQwqm4
X-Received: by 2002:a25:6b4d:: with SMTP id o13mr27236916ybm.496.1592812284092;
        Mon, 22 Jun 2020 00:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592812284; cv=none;
        d=google.com; s=arc-20160816;
        b=hAlcVmm3xJ4+wjbVu7i7P9Gu12HrJ1dg7yv+A6Um8jxWbMq3JTdgAX98athaHSAZsR
         GDbsL3Rqywq16roQKuKfTvFBcrDKtQp1EFsZaoNf/HK575a6MkvN+9poMRDIB23tXYdm
         +X1aviET6d4DUEHsYeHHFqU/fvV0rq9ABETs867t1kqg6oF9iH1FmMtDVwxFXtWS01xX
         ZWnlLXTStXI6h0D5g22jsN3vIRoOe1OQEW5fpft53uNofQjm/QmJL0ssvbnoBVGZIOTc
         3pDUoaESgyizha/BTMDC1S1xtCEfUOni45FOSOKcqpSinMoUf2CGimIW8JQI1Q+WsQDR
         TkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=TjfRrN6M6tiTv8NtIjJeKYbbBYvcMqs7K67eY5/64P8=;
        b=jmJ9HJ9kHboZiVwi2iGbjgd8LftDZTkeOdNRO0HMqtC996vpssk0wMQZZbaoJvjEei
         jnnnMk8Fz63Q359Sn3kkfDpErt3OKTUVpztWqnzDkst6MMFVyNw9Q1cYhmTdTpC7jUUI
         v+vJ+ItrqAUaKJXqvBoIzn5c9Ll6VIzbk2oTrzx4jpyTKeENvxxDw0+NazDx3PSm9J0g
         fGf0mUQNS20dD08ec8L5MkAfRvOIZolmhJfBJuK2NMNID7Iv/prBHjmNqa4DtImOcoF0
         X7VQr8EacZCz5zXNqVN8u1kw6uqigLnusnmYAFpZ/85HpVR+Yfedd/UfC2Qm3Pqu/DxR
         WzGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g39si3765609ybj.274.2020.06.22.00.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 00:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnHEh-0007Xu-GG
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 03:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1jnHEY-0007VW-PG
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 03:51:14 -0400
Received: from mailex.trusted-objects.com
 ([2001:41d0:117:dd00::95ca:f4cc]:9781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1jnHEX-0003Nk-1E
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 03:51:14 -0400
Received: from [192.170.0.219] (82.233.132.60) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.1913.5; Mon, 22
 Jun 2020 09:30:55 +0200
Subject: Role of qemu-arm
To: <qemu-arm@nongnu.org>
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
Date: Mon, 22 Jun 2020 09:30:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Originating-IP: [82.233.132.60]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
Received-SPF: none client-ip=2001:41d0:117:dd00::95ca:f4cc;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: il3mFMrl+9lS

Hello,

    I am using qemu for doing simulations of code, and currently find
qemu-system-arm convienient.

    But, I cannot understand how to use qemu-arm. In fact, what I am
searching for is a way of simulating only the ARM core, not any
peripherals. I can work with qemu-system-arm, and could not find a way
to use qemu-arm.

    Would anyone have any pointers to a documentation or a tutorial
using this tool ?

    Best regards,

        Vincent.

-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert de la Lauzière
13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>
