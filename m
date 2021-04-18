Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp15781lfb;
        Sat, 17 Apr 2021 18:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3Jf0PbyJi3cVRkoT+8EU6mzXZOQ+Da1+T7BRhb5pdu221MkQlKCRELLWlN55VC7HvQYwU
X-Received: by 2002:a5b:110:: with SMTP id 16mr8002108ybx.25.1618710142283;
        Sat, 17 Apr 2021 18:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618710142; cv=none;
        d=google.com; s=arc-20160816;
        b=hBHNU0dTHHZLv7PslECD/ificXQBBisHKymvFrj7PWb1K5dFCqwxVMJXgNwJd9lgw7
         djC6gA2G18FM0jh+wrkfHHFdcK3m0uDdjViAlco3B91Zm/trM7lFNypIiFWi8zelx3Ju
         agNBt9fDdZHs83MSM5+bon2szJ7ySIJrRx2I0CFLU7qiev0Lj9XILxaLVcV+oEijAqAU
         jjsrpzPdzXZkGokOiTXQ2InGjlTpBO4gMuF5bVARMDnxmO+K5jpponPRWFDv7E8Z02K5
         Mmkjvli2Td98TIMdRy965/H3XcEmVLdnJz/xsignBvio1qsN1cSVYzOZV70n2+DZN44+
         uBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :subject:from:to;
        bh=o5XtC8ShOhayXF1HENR6BBYNRDgCGa0iswZkxxmjDUo=;
        b=FhxMRxOTySbItz5evS4BeL7JfCFU4HwCNpb8X7YoIcTrnoh6Fk/nPXCjuVFAwW14je
         JqsBxL/5y2J1PEU63/QwWtp8pv9F0Zk1WVHzGii1DhljcAWN9XxJor5Ci+uRVKpWm8Iu
         WC6hk/RKeuNEXoDBmowxbGzEZTuCu+j76vVtEi0mh3fmoGIJecnJTtX3znux3Xs0nSY7
         fzHBR9QE+4UY3MqrhCVBcLZvQnl2C8tTOG8DqJR++wfW63DyvpezoKT+vFtetuXI8Adq
         ffSB+aVNe8ohhq2vmEXZfrT+zpX/jrnj97cBZCEEbiwAuN8k28DedZblO67u5+RlQ+vR
         vBkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c186si10793048ybb.181.2021.04.17.18.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Apr 2021 18:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXwS5-0007OL-LI
	for alex.bennee@linaro.org; Sat, 17 Apr 2021 21:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steve@freyder.net>) id 1lXwRz-0007LT-0C
 for qemu-arm@nongnu.org; Sat, 17 Apr 2021 21:42:15 -0400
Received: from mailman.freyder.net ([45.27.155.9]:41888)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steve@freyder.net>) id 1lXwRv-0007dn-Jy
 for qemu-arm@nongnu.org; Sat, 17 Apr 2021 21:42:12 -0400
Received: from mailgate.local.freyder.com (mailgate [192.168.1.207])
 by mailman.freyder.net (Postfix) with ESMTP id C631E66015C
 for <qemu-arm@nongnu.org>; Sat, 17 Apr 2021 20:42:02 -0500 (CDT)
Received: from mailgate.local.freyder.com (localhost.localdomain [127.0.0.1])
 by mailgate.local.freyder.com (Proxmox) with ESMTP id BBA8B81007
 for <qemu-arm@nongnu.org>; Sat, 17 Apr 2021 20:42:02 -0500 (CDT)
Received: from kungpow.freyder.net (kungpow [192.168.1.204])
 by mailgate.local.freyder.com (Proxmox) with ESMTP id ABAD780074
 for <qemu-arm@nongnu.org>; Sat, 17 Apr 2021 20:42:02 -0500 (CDT)
Received: from [127.0.0.1] (kungpow.freyder.net [192.168.1.204])
 by kungpow.freyder.net (Postfix) with ESMTP id 8DEE44402A7
 for <qemu-arm@nongnu.org>; Sat, 17 Apr 2021 20:42:02 -0500 (CDT)
To: qemu-arm list <qemu-arm@nongnu.org>
From: steve freyder <steve@freyder.net>
Subject: Emulation of armv7+e1000e+/dev/sda or /dev/mmcblk0 devices
Message-ID: <b5aa5292-5088-fb31-24b4-c8fc202413fd@freyder.net>
Date: Sat, 17 Apr 2021 20:42:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=45.27.155.9; envelope-from=steve@freyder.net;
 helo=mailman.freyder.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: tG9uZ0CN5JfA

Greetings qemu-arm group,


I'm a new qemu-arm list member and looking to get an emulation of an 
armv7 processor with a PCI bus, supporting an e1000e NIC, and some form 
of storage device preferably SATA and [e]MMC - I have an iMX6 SOM custom 
board with an e1000e on the carrier board via PCI that I'm attempting to 
approximate.  I want to boot U-Boot (I've built U-Boot 5.2 with support 
for MMC, SATA, and e100e networking).  I have the "virt" machine able to 
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



