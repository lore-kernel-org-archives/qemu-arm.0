Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5697796lfc;
        Mon, 15 Feb 2021 07:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTWmF0qi/eiKWJt5jxfmVFFBUGOY+ZfC398fxTn2XsQyUFdeeY5kTgepxpuIPOqgqX/sLr
X-Received: by 2002:a25:774b:: with SMTP id s72mr24077900ybc.512.1613401950030;
        Mon, 15 Feb 2021 07:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613401950; cv=none;
        d=google.com; s=arc-20160816;
        b=R+Oep88ABB0LsWX+xD7859DSosRS9qp3pxYiV8AAseu058z0hI/XWkv2ioqpx2w+VA
         9JE+1layHEeEqPHFhlvx+I70KVdBXSX/emWHhxX9rN+E2VtpaWxqfmCZLugJRnKjQiiM
         tHhR6P1ilV88zl2vLQu1+SLAqV+wfOkqnBDviXJs0bSh6OnBh876naczmRZaYMXv68qM
         8Jd9IZc0jlI3IEdBYjYRy52xod+CanpzDa6Cw8BivwPU6/S7uB+lFBALzpY8xrhsZw0Z
         FCpi7uTIp6C4h2i5azOV5ZzI9D9fL3cKPQ8LPF/ej0S0iuCJLBd4AoNO4eiueeH6rcN5
         o4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject;
        bh=SFdlpHRANWf2vw/0FkIGtLrE9WhLqw72qbtlwcg+9lU=;
        b=KOjzeCe0rvNbig1YA/CjE9chytcwiQe6KTQP8CpDhFi08lPlVmwmjXCzLzih2FEgF1
         W/2X5P2eyuBZdYFNp8QjyKRUMH0jXCQFzVV7oLbpv3e7yaDzzZAoBCH1vcQYAAeX/wmH
         8bLo3khVa8hE89iydmZIHu0lDm1qI6eeP+2K5rR9FS6SnZ4aR9hHpeYHB97UoN4PowSf
         bsbOyTgBuGhAQ6r5xgeg1eMCbfUePlOoCtI0NxoyqvezZqRE7R1ileUe6wjL8G2qTsA6
         Q8/spmHxP9p01oy3seIgaunfDHJv0BMpT6afHeloeW8nosIKIiEuR64d3oWL4IiKfpWH
         5Kiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si16886884ybp.412.2021.02.15.07.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 07:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBfY5-0000JV-Dm
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 10:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lBfVF-00051E-Bx
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 10:09:33 -0500
Received: from mailex.trusted-objects.com ([149.202.244.204]:10136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lBfVD-0003wy-IG
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 10:09:33 -0500
Received: from [192.170.0.219] (88.127.245.42) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.2176.2; Mon, 15
 Feb 2021 16:09:27 +0100
Subject: Malfunctionning qemu-system-arm ?
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
Message-ID: <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
Date: Mon, 15 Feb 2021 16:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
Received-SPF: none client-ip=149.202.244.204;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: NgSz/HiJQYWJ

    Hello,

    I am using qemu-system-arm with a netduino2 target, supposingly
integrating a STM32F2xx chip.

    I tested using the STM HAL in order to make a simple program run,
and I just failed to have it running correctly, it satyed stuck on the
starting HAL_init() call.

    Debugging the code, it appeared that stepping-in was making the code
work while when running it it failed (stayed stuck in an infinite loop,
but no obvious arm violations).

    Has anyone any idea of what could be the cause for this ? I am using
the latest STM32 HAL, with a qemu version 5.1.0 on a Ubuntu 20.04
machine. What is the level of support this type of target is supposed to
have, and posibly which limitations should I take into account ?

    Best regards,
        Vincent.


-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert Gautier de la
Lauzière 13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>
