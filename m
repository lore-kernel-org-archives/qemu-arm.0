Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3587873lfm;
        Sat, 4 Jul 2020 13:27:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF0EunQMF4ZiUSxH3sJ42LudGmVLoZ3HieN9PVVrjZBaAtNejFE2Dav39XFpWoc0IYgLki
X-Received: by 2002:a25:9904:: with SMTP id z4mr66844034ybn.146.1593894469059;
        Sat, 04 Jul 2020 13:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593894469; cv=none;
        d=google.com; s=arc-20160816;
        b=ROJYLgtAfpyDJRrFP3a+q5mVQleDPJ4ct2WGAJLbxKtF+dZrJaFMEoce7oiecX82mf
         0qr4CJkw1fB5Vx0rpUndc95mullf/SXjof/bFdGGgsmvJ4yEGI/D5mMXvwaq9lqfGchj
         QqN/qNS636Bk8hA/jcZR026eAFr9MNy7/t4cZa9bHO2N3lXaFjBqYh0o/uoga+wLA94x
         DWpTiJnYmG0Of2bdUy9YgUkoJWh21VpF3RVTe9EjCIDnp5dLJ9+/jonSBNbxFM5kIwVY
         DIEW8VKnLl0uz7xSvMd5j/IGm2js6ZjntVEorAg4S5A58yWrfz142gY8gpnM+b3Oln+H
         53WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :subject:from:to;
        bh=nk+Q6uYHh4+LSeObai9l8jJ1txoPX0cPdYRHqMPf+Yg=;
        b=xAjNnAAKWe04rjDPFAqWOWpjTthuyBYlTmWGYQ/WiZ2mg2TAynjtCavyfyK1CG31VT
         5bmx5Y8Do5xVngOsH5uRTBVDRBxdm89jAQlSWS2BKl6eaI4BxLWDrYU7cjAT6hh55MTG
         NC/PuMSzv3sofdRWmJMelKjkVV4EMloepHGx92wyT0DgrG0XEuOU3uVYXoB28Tw4XxE0
         lpAHnFRyud6tiW13VWM2swYDo+ZHN/ehU3quKVO0pg/cmirbsC5zqmkJVkA/AsILI8ZH
         LlA3ZZnSqETqA3njbPGVAQcAzI223jjq/s/SxJKJYXWEjHNLdORJ+cfNbM+tXXrQ5etB
         a3mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si15411502ybk.222.2020.07.04.13.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 13:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrolI-0002jh-CN
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 16:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrolB-0002jT-EC
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 16:27:41 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:37147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jrol8-0008Ke-Vt
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 16:27:41 -0400
Received: from [192.168.1.42] (lfbn-idf1-1-2027-69.w90-127.abo.wanadoo.fr
 [90.127.194.69]) (Authenticated sender: jcd@tribudubois.net)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B4E04100002
 for <qemu-arm@nongnu.org>; Sat,  4 Jul 2020 20:27:33 +0000 (UTC)
To: qemu-arm <qemu-arm@nongnu.org>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Subject: How to force EL2 mode when booting ELF32 file as kernel on CortexA7
 or CortexA15
Message-ID: <b7f00d84-bb8c-78e6-3fe1-54507c872ebd@tribudubois.net>
Date: Sat, 4 Jul 2020 22:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=217.70.178.231; envelope-from=jcd@tribudubois.net;
 helo=relay11.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 16:27:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, PDS_TONAME_EQ_TOLOCAL_SHORT=1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: 6fcFAPm3Cisz

Hi,

When booting an ELF32 file as "kernel" then Qemu seems to always start 
in SVC (EL1) mode.

When booting a "non ELF32" file (a bzimage or any other binary image) as 
"kernel" then Qemu seems to start in HYP (EL2) mode if the processor 
supports this mode (it seems to then emulate the uboot behavior)

Is there a way to tell Qemu to start in HYP (EL2) mode (or even EL3 
mode) when booting an ELF file as kernel (assuming the processor 
supports it)?

Thanks

JC



