Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2775391eja;
        Mon, 6 Nov 2023 05:57:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0Eo7/LGq8O92VKTU8RxGKWV3wW8UfH4vEb5t8eTv/3H64XJb2J3VaxSW+INGiMExdDcwX
X-Received: by 2002:a05:620a:46aa:b0:778:abc4:cc3 with SMTP id bq42-20020a05620a46aa00b00778abc40cc3mr37096323qkb.61.1699279066812;
        Mon, 06 Nov 2023 05:57:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699279066; cv=none;
        d=google.com; s=arc-20160816;
        b=KZyZ628L28qtxEX7VI2ugQC5dIvDann+O5BIs5xTr0DsYu/I9Bvbbczu2ExmXHsnjL
         diAjacebnefUn0iByAXbTUbKL0lGGlR0UxR18fudF4bSJqpYhQSVPLHi92jzlC+8nO76
         0RdhMcbch7nC35sXipQ699gEvRBKez2VOaUovrgBLW8+ajOCbixZzGWeTLgfqzgzArs/
         VBolI64gBET2Q93oLxaXWCJl7Nn0b5tzHWtgyU2mQKlkXJZkxy4msgFBQUjVMMgfOGVf
         i2rkTdNzhxE0ZQZ+enPkW+h7kDR4aJkHOFLvH6xqzZhplkS0PhXejKB73E0wBYp/j148
         BGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-topic:thread-index
         :content-transfer-encoding:mime-version:subject:message-id:cc:to
         :from:date:dkim-signature:dkim-filter;
        bh=k8D20BWyjJjiJ1XukyijOfCLVXq8WqVZg8rLnZRPjZw=;
        fh=9EOLRH/DTFIvs3jJz0QQZUR8guQJTB+cFx6unJs0T0Y=;
        b=ecDafrfW8lAtkVDjDrNUDFLaDyv92m3Cgge6Dnf1cvPSLdkSeAWZNhUgdSOhixlAWg
         yytAoOMYjSHHD0eyJBy2DJLhpExTpXxMunlKmFd9WNhmcK2TkGlvICyCsHyGCy3Iu+uK
         aZfegx4f2gespP8QzowLf0wXqAMolLvtRHhxjTu3RW3RfoXs+4+l1PxBSUfc0qmc6U9g
         2AuqU+8D+TaIOC6xJPj5DfIiWJoQWgaWACj9q74g9FPNc0ixjGbH+NVXF9cnvtwnBdqU
         VeXgIDTTCFMSE3ta2WajjIAfJnwIJ1pOiFi1pNLLoJgpCN9Z0bdKvuKdUMtV6aRzCORW
         Iijw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=MMUcJxsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq9-20020a05620a468900b007726400ee6dsi5998040qkb.491.2023.11.06.05.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 05:57:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=MMUcJxsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r006Y-0007av-5B; Mon, 06 Nov 2023 08:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1r006W-0007aS-BC; Mon, 06 Nov 2023 08:57:24 -0500
Received: from zproxy4.enst.fr ([2001:660:330f:2::df])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1r006U-0008Lz-Ew; Mon, 06 Nov 2023 08:57:24 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 8E65120607;
 Mon,  6 Nov 2023 14:57:16 +0100 (CET)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id cOsY3OnJ6v-4; Mon,  6 Nov 2023 14:57:16 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 1C16E205F7;
 Mon,  6 Nov 2023 14:57:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr 1C16E205F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1699279036;
 bh=k8D20BWyjJjiJ1XukyijOfCLVXq8WqVZg8rLnZRPjZw=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=MMUcJxsfJt7eYyQbGx+ZhO1+ziQ/X3+We8FkaOeq9Lp7mdN/4axo50Qqcsc6OTVP3
 7EhV+OHJRgsP7fpRJldKtSYg/6SmX8gcvPKiG0sGob/ZSJw2R8Mhn3oIFCSfCxhe3/
 EINIe72wU2HRL5Xo2U11Xfe3H97jAAjoyiFtwo1o=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id LW4Sy1VxqVSO; Mon,  6 Nov 2023 14:57:15 +0100 (CET)
Received: from zmail-tp2.enst.fr (zmail-tp2.enst.fr [137.194.2.199])
 by zproxy4.enst.fr (Postfix) with ESMTP id AE04D20578;
 Mon,  6 Nov 2023 14:57:15 +0100 (CET)
Date: Mon, 6 Nov 2023 14:57:15 +0100 (CET)
From: =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, alistair@alistair23.me, 
 peter maydell <peter.maydell@linaro.org>
Message-ID: <1353832942.8123338.1699279035562.JavaMail.zimbra@enst.fr>
Subject: Adding support of ARM board B-L475E-IOT01A using STM32L475 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [137.194.2.223]
X-Mailer: Zimbra 9.0.0_GA_4564 (ZimbraWebClient - FF119 (Linux)/9.0.0_GA_4571)
Thread-Index: nKl23wLJrfRlX/NmoX4VoM60upk07w==
Thread-Topic: Adding support of ARM board B-L475E-IOT01A using STM32L475 SoC
Received-SPF: pass client-ip=2001:660:330f:2::df;
 envelope-from=ivarhol-21@enst.fr; helo=zproxy4.enst.fr
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yI0Zlk0HvUeb

Hello,

Along with my fellow student Arnaud Minier, we're looking to implement supp=
ort for a new ARM board for a university project.

As of now we've have implemented a minimal version for the machine and the =
SoC without any syscfg, timers or usart implementation.=20
We have looked at the relevant informations about the procedure to submit a=
 patch, however we aren't sure if we should submit a patch now already,=20
as a way to get acquainted with the procedure and expectations, or if we sh=
ould rather implement more peripherals and submit the patch all at once.

For further details about project, the end-goal is to emulate a maximum of =
peripherals and be able to display an emulated LED matrix driven by the QEM=
U-emulated board.

How we're proceding for now is replicating code designed for the stm32f405 =
SoC and other specific stm32f4xx code and adapting it for the stm32l475 SoC=
 (both are Cortex-M4 SoC).=20
Is it alright if the patch commits reflect this copy-paste then incremental=
y change details procedure ?


Of course, we would greatly appreciate any guidance, suggestions, or insigh=
ts you may offer regarding our current progress and the best course of acti=
on.=20
Moreover, if there are other pertinent issues we should consider, we are ea=
ger to learn and adapt our approach accordingly.

Thank you for your time and consideration.

Best regards,

In=C3=A8s Varhol
