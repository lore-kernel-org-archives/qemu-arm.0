Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp625387lfb;
        Sun, 18 Apr 2021 14:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi45kyWVuQO4OR5jStdBwkZ5Rhp/a4XuoRxWq/ECUew9T/Q8vTfWoCB2jsOtfaCTJWdH2T
X-Received: by 2002:a6b:3c1a:: with SMTP id k26mr11950165iob.113.1618780900938;
        Sun, 18 Apr 2021 14:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618780900; cv=none;
        d=google.com; s=arc-20160816;
        b=bB0nK5EnpVjkEJWIdYLTqdAx7ypbb9RckpLmjNO9iyBHet8FDISJ1YzrIMrbQnmeDr
         782G/d2KPv39P4VAgPOluKDx/mKM3j0064uRa23YAQKq9r0WRqxE6dB1FVOECZhuJIFM
         e4FtXQJLhWlWsuUtXiJonE9lXQr4DH2tT3d4sooMM30ldp730dw+0pyq8B4GMKQAWoSq
         6uEInE3qtaYeMmsI/FblgD6xZJo/kSnuHubz7Yn5ey83576bm/zQ0v7wYBPG+g4jkezS
         i0zwa0D60lLrkrStWgW9zK6SZBAYLEY6uOFir/Eo6CmXNIxWqrOmx2E3xjd1PWUeRlNJ
         rOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject;
        bh=VTUtPAKLl+cHGz7IP3jrAdan1m6JYGLiFL3QX3jluWM=;
        b=TUgWSkTiG0aK19dNvHTsP6H+9K7uiRK09HsZRDH0zI2A2MRx0somdhqzmGnrOcoaD6
         HktVUZ/Icoc8YFQS3OuUidO/IIQZ9tXGYVKki/zPPjVXu4UN5giItMqShZB6cdG5AXwW
         U8VkafCL29uvY2ZLV2iUpnpWWes0roLa+xuHz4ENO7n+FySK4aUOo73jjuRgixi2ydLX
         ANJae9BqS/BaDR0nsfiwSGPfSZG9wAouo3wqUxZ/H4cGRVJRjYcG76KMunyGIfGKqlQc
         NVo711X1PtLjUT4GHhz7DQ18tgrGYZDmBluohGVDNiQ53vcKp0BF6Q6K7oyvdt0ENeKv
         pE0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si16895477ilu.124.2021.04.18.14.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Apr 2021 14:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYErM-0000MH-6o
	for alex.bennee@linaro.org; Sun, 18 Apr 2021 17:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steve@freyder.net>) id 1lYEr3-0000LF-Em
 for qemu-arm@nongnu.org; Sun, 18 Apr 2021 17:21:22 -0400
Received: from mailman.freyder.net ([45.27.155.9]:43026)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steve@freyder.net>) id 1lYEqy-0001aF-7C
 for qemu-arm@nongnu.org; Sun, 18 Apr 2021 17:21:19 -0400
Received: from mailgate.local.freyder.com (mailgate [192.168.1.207])
 by mailman.freyder.net (Postfix) with ESMTP id 207C46601A6;
 Sun, 18 Apr 2021 16:21:13 -0500 (CDT)
Received: from mailgate.local.freyder.com (localhost.localdomain [127.0.0.1])
 by mailgate.local.freyder.com (Proxmox) with ESMTP id 14F3A81133;
 Sun, 18 Apr 2021 16:21:13 -0500 (CDT)
Received: from kungpow.freyder.net (kungpow [192.168.1.204])
 by mailgate.local.freyder.com (Proxmox) with ESMTP id 0043C80766;
 Sun, 18 Apr 2021 16:21:12 -0500 (CDT)
Received: from [127.0.0.1] (kungpow.freyder.net [192.168.1.204])
 by kungpow.freyder.net (Postfix) with ESMTP id C70B5440341;
 Sun, 18 Apr 2021 16:21:12 -0500 (CDT)
Subject: Re: Emulation of armv7+e1000e+/dev/sda or /dev/mmcblk0 devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm list <qemu-arm@nongnu.org>
References: <b5aa5292-5088-fb31-24b4-c8fc202413fd@freyder.net>
 <f553a91f-5f7a-f7a1-242b-00406e43dc20@amsat.org>
From: steve freyder <steve@freyder.net>
Message-ID: <3bd08e56-6857-2216-002a-94f1c551724d@freyder.net>
Date: Sun, 18 Apr 2021 16:21:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <f553a91f-5f7a-f7a1-242b-00406e43dc20@amsat.org>
Content-Type: multipart/alternative;
 boundary="------------DECBBE1B112FE5119CE63209"
Content-Language: en-US
Received-SPF: pass client-ip=45.27.155.9; envelope-from=steve@freyder.net;
 helo=mailman.freyder.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MUccuMCSnfa0

This is a multi-part message in MIME format.
--------------DECBBE1B112FE5119CE63209
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/18/2021 12:37 AM, Philippe Mathieu-Daudé wrote:
> Hi Steve,
>
> On 4/18/21 3:42 AM, steve freyder wrote:
>> Greetings qemu-arm group,
>>
>>
>> I'm a new qemu-arm list member and looking to get an emulation of an
>> armv7 processor with a PCI bus, supporting an e1000e NIC, and some form
>> of storage device preferably SATA and [e]MMC - I have an iMX6 SOM custom
>> board with an e1000e on the carrier board via PCI that I'm attempting to
>> approximate.  I want to boot U-Boot (I've built U-Boot 5.2 with support
>> for MMC, SATA, and e100e networking).
> Did you look at the SABRE Lite board (which use a i.MX6) as a start?
> https://qemu-project.gitlab.io/qemu/system/arm/sabrelite.html
>
>>    I have the "virt" machine able to
>> boot U-Boot and see the e1000e, but I have found nothing that allows the
>> booted U-Boot see any MMC or SATA devices.  All attempts to use -sd, or
>> -drive to create some kind of MMC/SATA device have failed with what
>> appear to be (as I have been able to understand) the standard reasons,
>> missing busses, missing properties, etc, etc. A majority of searches
>> result in documentation from developers that's 5-10 or more years old,
>> so I'm hard-pressed to determine whether this is my own lack of
>> knowledge (probably YES), or whether I'm simply looking at stuff that's
>> been overcome by events.
>>
>>
>> I apologize in advance if this is not the proper forum for this, and
>> will happily take this to a different forum, but is there any chance
>> someone could give me a clue about the right way to look at all of this,
>> and whether there's any machine or system definition out there that
>> would support (or be a starting point for supporting) what I'm looking for.
>>
>>
>> Thanks in advance,
>>
>> Steve
>
Philippe,


Thanks for the quick answer, yes, I did try the sabrelite, but when I 
attempted to add a SATA controller or an E1000 it complained that there 
was no PCI bus.



--------------DECBBE1B112FE5119CE63209
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 4/18/2021 12:37 AM, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f553a91f-5f7a-f7a1-242b-00406e43dc20@amsat.org">
      <pre class="moz-quote-pre" wrap="">Hi Steve,

On 4/18/21 3:42 AM, steve freyder wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Greetings qemu-arm group,


I'm a new qemu-arm list member and looking to get an emulation of an
armv7 processor with a PCI bus, supporting an e1000e NIC, and some form
of storage device preferably SATA and [e]MMC - I have an iMX6 SOM custom
board with an e1000e on the carrier board via PCI that I'm attempting to
approximate.  I want to boot U-Boot (I've built U-Boot 5.2 with support
for MMC, SATA, and e100e networking).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Did you look at the SABRE Lite board (which use a i.MX6) as a start?
<a class="moz-txt-link-freetext" href="https://qemu-project.gitlab.io/qemu/system/arm/sabrelite.html">https://qemu-project.gitlab.io/qemu/system/arm/sabrelite.html</a>

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">  I have the "virt" machine able to
boot U-Boot and see the e1000e, but I have found nothing that allows the
booted U-Boot see any MMC or SATA devices.  All attempts to use -sd, or
-drive to create some kind of MMC/SATA device have failed with what
appear to be (as I have been able to understand) the standard reasons,
missing busses, missing properties, etc, etc. A majority of searches
result in documentation from developers that's 5-10 or more years old,
so I'm hard-pressed to determine whether this is my own lack of
knowledge (probably YES), or whether I'm simply looking at stuff that's
been overcome by events.


I apologize in advance if this is not the proper forum for this, and
will happily take this to a different forum, but is there any chance
someone could give me a clue about the right way to look at all of this,
and whether there's any machine or system definition out there that
would support (or be a starting point for supporting) what I'm looking for.


Thanks in advance,

Steve
</pre>
      </blockquote>
      <br>
    </blockquote>
    <font face="Courier New, Courier, monospace">Philippe,<br>
      <br>
      <br>
    </font>
    <p><font face="Courier New, Courier, monospace">Thanks for the quick
        answer, yes, I did try the sabrelite, but when I attempted to
        add a SATA controller or an E1000 it complained that there was
        no PCI bus.</font></p>
    <p><font face="Courier New, Courier, monospace"><br>
      </font></p>
  </body>
</html>

--------------DECBBE1B112FE5119CE63209--

