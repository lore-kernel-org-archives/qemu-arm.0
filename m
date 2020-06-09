Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp239145lfc;
        Tue, 9 Jun 2020 00:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmijzaPkbziiCT5V2WSlMlBRr2Jy7HLyZ5Y+NPxTaIqvjzAxK3OWj5r7N04cy6Xy9NxdwK
X-Received: by 2002:a25:d354:: with SMTP id e81mr4492969ybf.398.1591687888555;
        Tue, 09 Jun 2020 00:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591687888; cv=none;
        d=google.com; s=arc-20160816;
        b=P9t5IEfuN9rh3+OkAktxdZ3/p1p8D8DrjFFr/t/QtNwWWkcVlF9MkxyaqtPHXpKIIH
         nzHgSqaYc6DHhjJ2Sftp1cUxVfZUl4yDuYQ9YUf9Li91zYWtQy8lcE+TFsRj7hjCgQVX
         qWeh/EMtLc2hixjsB+7yDb1SltFcJcKj/MmGGDpIgWLaqAW57l3Dedu5NOzDStkbHefy
         KCdksZrlorzJ3VcS96EzgblinpG2TRkFHqGiUA1Rf/LGQWG1kw1U22Ijvlr+/WsXzuR5
         R/qom+nMcYyKtFIYp1DZrD+tSdZsYBbn5qHrgjgXQv5vuk6K+Y4KEoRDlUT/8GOoELjz
         FOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=BJMSx5i856FwYZZfxk4qwrImE/FNf4HM/U4BcRr36sE=;
        b=Hn1ifySErv1EVxllKaZZ5VTlfIRhPD8stOUX+e44W2FfmI07/hGqOfGvwiLrhZ48wL
         Ip24G4gNKFSPNx+NlOCeNuvOXiFh3aNJmQrLhJfcDWgdqdrGlsMCyLGYsSvMdUB6FqE9
         N5GbeBjQeeSQizxpBFhKyl3XOzSuKqwYmVBdpugM2+oyGsoA2YcVfv7NhcgFTLALEMlM
         sK9VzfJyrPKABTGtQ/Ae6Qiz+V5hzL6czfERInDAk4OuL1x3nypM/LK8UEdZyP0m4rSJ
         CTap55ig3q4A6rXMV4yWZiCtoE8x+B+AnJvxXAJU7O+BtcxVe3OECkA6wYbM9jMYdQga
         3T/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si2035704ybb.38.2020.06.09.00.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 00:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiYjH-0003AJ-Rg
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 03:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jiYj7-00038Q-Jk
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 03:31:17 -0400
Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]:48774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jiYj6-0007R5-Jz
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 03:31:17 -0400
Received: from player693.ha.ovh.net (unknown [10.108.42.168])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 54EB12868FE
 for <qemu-arm@nongnu.org>; Tue,  9 Jun 2020 09:31:14 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id A61BA13235E02;
 Tue,  9 Jun 2020 07:31:08 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0026a7e6e3a-5b68-47f5-9b1a-dd91ac6d90a4,2CE69A6D3B62F9BF35ECE14C7D737F520D542DA8)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 0/6] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC machines
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <CAFQmdRYYhoWu7q350n0vNOE+pesp-UG975v1f1Yjwf9Ao0mjcg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <60521645-6e85-cc59-7048-94db9634ad0a@kaod.org>
Date: Tue, 9 Jun 2020 09:31:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFQmdRYYhoWu7q350n0vNOE+pesp-UG975v1f1Yjwf9Ao0mjcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4233946601796635561
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudehfedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfffgeelfeejudevuedvvdeigeduteetveffhfffudeggfegleeljeeuieefuedvnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=87.98.182.191; envelope-from=clg@kaod.org;
 helo=13.mo5.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 03:31:14
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YPxXp2e/f3x7

On 6/9/20 12:14 AM, Havard Skinnemoen wrote:
> On Thu, May 21, 2020 at 12:21 PM Havard Skinnemoen <hskinnemoen@google.com <mailto:hskinnemoen@google.com>> wrote:
> 
>     This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to boot
>     a minimal Linux kernel. This includes device models for:
> 
> 
> Does anyone have comments on this series? I'm currently finishing up a second patch series that adds flash support and a few other things so qemu can boot a full OpenBMC flash image built for npcm7xx.
> 
> If you prefer, I can combine them both into one series and send it to the list.

The first series was nicely presented I think, but you can extend it in v2.
Documentation needs an update in :

  docs/system/target-arm.rst

Thanks,

C.

