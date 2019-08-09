Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9086795wrv;
        Fri, 9 Aug 2019 04:40:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzLB/LgsmGu92D+zI1+gzIsoYjdJyXDh5EQWW2dtHXA5eL/Q/A1WYjWtQ56s6nbdohGH/vG
X-Received: by 2002:a17:906:4e0e:: with SMTP id z14mr8216583eju.109.1565350854143;
        Fri, 09 Aug 2019 04:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565350854; cv=none;
        d=google.com; s=arc-20160816;
        b=m/PfY836dIpsP8+5d7A2dWqkypv0Cq360j99mYChuyyBSqoucsKDVHCWs0S2Advb/3
         27nKtmsdZ8+pZEbZioRCkQXbMObqVBktNum18/xg/1QHJtf/S5alKsumLMaFGXvCxtg2
         xqMHqgBxRLM13i5xHGEeacsSBmaW+aluLIk5hZd2egDwdkd4ij1K4hW9Mb8i9JOJ3f3D
         cmmaVJ61S4UfDr+RXhPNfWJOV7bBRxuxRE72nJZmdWJtPrjRLqGvE/t/bFgxMDvl/yz8
         B7Vpe8VQCFMmwpuPjg4PxjSLxqyPIORzdn0T+WaNsu2eWj0lGjIGe79Njp+bhmFskYdr
         q21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6ujltMDZvMN28bIbGQfa245iAujTdhkgLzGy7qUnPyc=;
        b=gNCOHkBBEvJBFf5ZAPIb1lGvEE0AA9MMtGMgKKXd+GFHdgD7V5JlBsfYn78C2aCKyX
         /urpoRLEWslSZldtd2Xo2VSfcO8z7QCiaY93fBz/X0jhWwg4uIItUDHENO/ypcP8sDLD
         Oaj/lOzQNdAj2FzAnundcy/BucbqKN/V4rXBHSFmdz6x2JLgDSGx66dn+7zUJNhp6wOX
         4w63wza4q7Us0QiDy2vW7RT+xPUiST2dK3znwAyvy//I++SuoXa4d9WSO+Ht6y6V+AS1
         delGENTHZcrvKQZt57cPeoXzFkflLmDnowXnRgO+wiF4eOiYHVQFY4cgcPGhUUXmkAEv
         ae/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si11963105ejg.75.2019.08.09.04.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 04:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw3GP-0001eE-7O
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 07:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43350)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hw3GD-0001dc-RH
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 07:40:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hw3GC-0003HL-MJ
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 07:40:41 -0400
Received: from 4.mo3.mail-out.ovh.net ([178.33.46.10]:57876)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hw3GC-00035i-Fk
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 07:40:40 -0400
Received: from player778.ha.ovh.net (unknown [10.108.42.202])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 7D53D223010
 for <qemu-arm@nongnu.org>; Fri,  9 Aug 2019 13:40:26 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 5443D8AE3458;
 Fri,  9 Aug 2019 11:39:49 +0000 (UTC)
To: David Gibson <david@gibson.dropbear.id.au>,
 Damien Hedde <damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-6-damien.hedde@greensocs.com>
 <20190731060533.GD2032@umbus.fritz.box>
 <51aa7e6d-3568-8485-4b67-a598a24a1f3d@greensocs.com>
 <20190808064810.GE5465@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4fa2ecbe-d81e-5285-822e-28f984aed77c@kaod.org>
Date: Fri, 9 Aug 2019 13:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808064810.GE5465@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6604810331389201207
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddujedggeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.46.10
Subject: Re: [Qemu-arm] [PATCH v3 05/33] Switch to new api in qdev/bus
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 jsnow@redhat.com, rth@twiddle.net, berrange@redhat.com, cohuck@redhat.com,
 mark.burton@greensocs.com, qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oJOozdXtXBB/


>>> So.. is this change in the device_reset() signature really necessary?
>>> Even if there are compelling reasons to handle warm reset in the new
>>> API, that doesn't been you need to change device_reset() itself from
>>> its established meaning of a cold (i.e. as per power cycle) reset.
>>> Warm resets are generally called in rather more specific circumstances
>>> (often under guest software direction) so it seems likely that users
>>> would want to engage with the new reset API directly.  Or we could
>>> just create a device_warm_reset() wrapper.  That would also avoid the
>>> bare boolean parameter, which is not great for readability (you have
>>> to look up the signature to have any idea what it means).
>>
>> I've added device_reset_cold/warm wrapper functions to avoid having to
>> pass the boolean parameter. it seems I forgot to use them in qdev.c
>> I suppose, like you said, we could live with
>> + no function with the boolean parameter
>> + device_reset doing cold reset
>> + device_reset_warm (or device_warm_reset) for the warm version
> 
> Ok, good.
> 
> I'm afraid the whole series still makes me pretty uncomfortable,
> though, since the whole "warm reset" concept still seems way to vague
> to me.

Isn't the reset after the CAS negotiation sequence between the hypervisor
and the pseries machine some sort of warm reset driven by SW ? 


C.  
