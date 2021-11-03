Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4796101lfv;
        Wed, 3 Nov 2021 06:27:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc6BRPfK/mxlqHK35kAYDj5BUextlWcEL3qA30jzcaiP3O5ssLFXLbaDX0teqchz0bCgvo
X-Received: by 2002:a4a:301c:: with SMTP id q28mr23397570oof.54.1635946070846;
        Wed, 03 Nov 2021 06:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635946070; cv=none;
        d=google.com; s=arc-20160816;
        b=SemMTTGJOeb6OdxRCLpWtAbUFgqfxB7LqeOWi4Gb/NbLKbfJsJlEx9evlF5THEjDmk
         2vj4z1cWwN+ZVWZf0EcUdpmohKRUslvn/u59f/qsFb/O+UfW/U7XYqO7i7JKIF8MZoUQ
         Qe0wNKlNukE3wc4JlztLQXZl5ZXV7a3C0AQWwLXOJSukWWoZCJcWOAupf/NxiupINPJu
         0CKHTO7JMn94KS/o2uw+3d3aPwLY+cHwO4DNKtSRHUEf9kvr5pZLxYyXmEEPuBKSkN6g
         aKpT56X8kf60Q1sTk4yKqW3/CtoX0Ezn4XW7GPRh+qHZRdUlXnTKIjDpUgYGwM7REEaG
         NbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:from:content-language
         :to:user-agent:mime-version:date:message-id;
        bh=kIxeGA5BR/RZcosdjy26AIphDbIjbPKKu/Q8PWxQYJ4=;
        b=AevQLECDcVR2FxACY10nPE/XyR9YDiWIhlIiCttSl2Ql4oABk71Rwv+foodVpISspi
         fb7e90I1YO0SDOsrALvFoePuY/KP5z5WjnS3nmAKct6ZM9SQ93Kho/G/jAm+E3rVityL
         v3fifWL4yl3R5zi35orgwbOpJ1lAuQaRKgwCyu+BHMwJ0cZBssXd1t4TGcW7F4FKQCWi
         mQKFRaHt4VF2OWsRf03bmylyRtrTD0vaD5RXSvOa1NMp7PWuw1ZR1lwjKTpDsFFUEUR8
         4/KmskP1DSC2Nwjq4ErRVURl3obQH2mJMBm+diKYfeJdhJfxlXsoYrrSLSx+YTVEydWi
         DEsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9si304807oom.56.2021.11.03.06.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 06:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miGIw-0006YY-5J
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 09:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1miGIj-0006YP-Pi
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 09:27:37 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:60871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1miGIV-0006hr-4K
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 09:27:37 -0400
Received: (Authenticated sender: jcd@tribudubois.net)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4B48740006
 for <qemu-arm@nongnu.org>; Wed,  3 Nov 2021 13:27:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------QEgD60pwLXSBLFdu6ewTVp9r"
Message-ID: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
Date: Wed, 3 Nov 2021 14:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
To: qemu-arm <qemu-arm@nongnu.org>
Content-Language: en-US
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Subject: Qemu and ARM secure state.
Received-SPF: pass client-ip=217.70.183.194; envelope-from=jcd@tribudubois.net;
 helo=relay2-d.mail.gandi.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XkARyxU4Ppsg

This is a multi-part message in MIME format.
--------------QEgD60pwLXSBLFdu6ewTVp9r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have a little application that is designed to work on the i.MX6UL 
processor.

I developed it and tested it on the mcimx6ul-evk platform emulated by Qemu.

This application used to work "flawlessly" on Qemu 5.0.50 and is working 
on Qemu 6.0.0 (available as a pre-built package on the latest Ubuntu).

But when I try to run the exact same command line on a Qemu version I 
compile myself from main/latest of github (Qemu 6.1.50), my application 
fails to start.

So a little background:

My application expects to start in "secure" state and supervisor mode 
(which is the default state of i.MX6UL when booting barebone [without 
u-boot]).

 From this state the application tries to get to "non secure" / 
hypervisor mode which imply going to the "secure" / monitor state before 
being able to drop to "non secure" / hypervisor. To do so is runs a "smc 
0" operand (from "secure" / supervisor).

This "smc" instruction is processed "as expected" by Qemu 5.0.50 and 
Qemu 6.0.0 (getting to "secure" / monitor mode) but on Qemu 6.1.50 
(latest from github) it is as if the smc operand was a no-op. It doesn't 
trigger any exception and the processor just get to the next instruction 
after the "smc" instruction. So I am a bit puzzled.

  * Is there something that changed in Qemu (since Qemu 6.0.0) when it
    comes to the "secure" world/state?
  * Is there some additional command line parameters to use (I search in
    the documentation but without luck) to get secure world behavior ?
  * Is it necessary to "adapt" the emulated platform
    (i.MX6UL/mcimx6ul-evk) in some way (it looks like the "virt" machine
    with "secure=on" does work for arm platform)?

Thanks for your help.

JC

--------------QEgD60pwLXSBLFdu6ewTVp9r
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>I have a little application that is designed to work on the
      i.MX6UL processor.</p>
    <p>I developed it and tested it on the mcimx6ul-evk platform
      emulated by Qemu.</p>
    <p>This application used to work "flawlessly" on Qemu 5.0.50 and is
      working on Qemu 6.0.0 (available as a pre-built package on the
      latest Ubuntu).</p>
    <p>But when I try to run the exact same command line on a Qemu
      version I compile myself from main/latest of github (Qemu 6.1.50),
      my application fails to start.</p>
    <p>So a little background:<br>
    </p>
    <p>My application expects to start in "secure" state and supervisor
      mode (which is the default state of i.MX6UL when booting barebone
      [without u-boot]).</p>
    <p>From this state the application tries to get to "non secure" /
      hypervisor mode which imply going to the "secure" / monitor state
      before being able to drop to "non secure" / hypervisor. To do so
      is runs a "smc 0" operand (from "secure" / supervisor).<br>
    </p>
    <p>This "smc" instruction is processed "as expected" by Qemu 5.0.50
      and Qemu 6.0.0 (getting to "secure" / monitor mode) but on Qemu
      6.1.50 (latest from github) it is as if the smc operand was a
      no-op. It doesn't trigger any exception and the processor just get
      to the next instruction after the "smc" instruction. So I am a bit
      puzzled.<br>
    </p>
    <ul>
      <li>Is there something that changed in Qemu (since Qemu 6.0.0)
        when it comes to the "secure" world/state?</li>
      <li>Is there some additional command line parameters to use (I
        search in the documentation but without luck) to get secure
        world behavior ?</li>
      <li>Is it necessary to "adapt" the emulated platform
        (i.MX6UL/mcimx6ul-evk) in some way (it looks like the "virt"
        machine with "secure=on" does work for arm platform)?</li>
    </ul>
    <p>Thanks for your help.</p>
    <p>JC<br>
    </p>
  </body>
</html>
--------------QEgD60pwLXSBLFdu6ewTVp9r--

