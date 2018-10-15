Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4913911wrt;
        Mon, 15 Oct 2018 13:31:43 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61E/0Kg37kEFOAcn4/aLjxtZ6xLkDpLdhN/NO3qfXkdJ8YpMrvhqVZN0UrySQ+UQkc09c33
X-Received: by 2002:ac8:c0b:: with SMTP id k11-v6mr17987585qti.31.1539635503037;
        Mon, 15 Oct 2018 13:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539635503; cv=none;
        d=google.com; s=arc-20160816;
        b=Ad+2hkrkC92kR1ctfw8/4J6Rq0tO0tgmGkr7JsOADDHSRlEDQCiSv7K2shRENFrd/y
         LGNRzFYA8vXHSJm3HRA5wBb969cZFN4OOAYwhDyZMxgBoA3lLadEZTouQblFrhai63E4
         uTSQk+0c2R8bQrp88E2MfsdbgFWLGGMhCHZ9K9cMa4NqQ6vnoV9WJjXOOeqRVqUruz65
         b95ZO7+w828nXJikn80CD3dCFneoC67oN0YAg3k47uuRO/OzsQ42scQhIowmDabOpk6e
         eGiMrpr8DU7wj8aAZ/D4KJDHd7Dy+pxBy0vszBufkpbO8hdhfkUZOk8MDdVsm0HCw7b6
         NHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=8+bPbcOavpPM4eV3QFZe/KklQtVUSLjG+X/1bnEeXNU=;
        b=QKOvtyMAsEBujF1PVQd7Yiix7sFrxDP9hTyw9aMy38q38uZ10+2yC4Ske9KN7KVCgM
         1PiSeGes2F2+zsdoXy4Zvph5OCL6thWn+zqhpmxFJ0kfLALNJqpu48QcNqDL2cAPQ0eL
         wrBXsVDoMZw5t0nIwRPxfbaGbKa6dSCaSREQZp80uyO5ig2P4MaYFoIdeuTEAxHUMPym
         T+vvbsUf0Z89Zkmip4Aeu2QrGdhpSeu0q9rKSxwBkCLJcKn7CelpL5xlq75njqgFYLzy
         wDPUy4bT+zLDZZzL6XIk55gD21kS04RDwUgablh9zc7RmeepfQq8QoPchHKkPLr1YKJD
         S7bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sx8NYUCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r32si3745241qvr.26.2018.10.15.13.31.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 13:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sx8NYUCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC9Wg-00052z-Gt
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 16:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gC9W9-000521-RE
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 16:31:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gC9W7-0004KK-Jv
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 16:31:09 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:46216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gC9Vy-00042H-GT; Mon, 15 Oct 2018 16:30:59 -0400
Received: by mail-qt1-x841.google.com with SMTP id d8-v6so23063664qtk.13;
	Mon, 15 Oct 2018 13:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8+bPbcOavpPM4eV3QFZe/KklQtVUSLjG+X/1bnEeXNU=;
	b=Sx8NYUCmzajlPf/lXEFw481JeUV2puiIRrCiF70jGKUyJzZJfCYqgMzo87EX+c2iN/
	Im+Q22/KP9PRMW/8q4wyQANABaEnFPgrqaJYcvASOFSzw++A2Hj1iK1ZvwxPSLoSG+r4
	RmE0QjjhRla4j458McwFckO7dxTkjNI2ZRSFfSW+zimPFqhEjaygm/nXBB6+YHmxeuCj
	zwPp+Le5a0i3lwOyl7ruWwGCVePWlqak6ZxiPuWxtHzsm1SqYNFXQ/W6cZ4m5vZLPHd1
	3sQJcl0fkEMNrpIQjywH5ecuhh5vqF9o6KrKBgnIvr1gsipGBA9/AUHe0EEdHAlHoNf4
	epDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8+bPbcOavpPM4eV3QFZe/KklQtVUSLjG+X/1bnEeXNU=;
	b=VUj78kkC6fkPwyaiQSXsa4wtzbSSEegELdxTRrOUQj1bc6cIYw1gcNzktw6n1VZJ6z
	BLfsczrW4q18CmbXDPvNGACcY++l152PeobC55WRpUvwmthL6c1WLwb5oeLhtQLYcl8L
	uXTHV4zuojTc7VLKnOLgY1gMGhwWYDlm012EVsoAd9pdOj+0EQNr6KvCzh7rtXIpzXvG
	nzzh67sZSaLOSH7wNmrWgQuZBGtBc5wfvuXtpgoxZntqlxGNQOSbZgmGXJUnCOPrD86A
	40icsTlTzJdod8W0tpyAv1NwqJoCM3tzflmKFQtDJvWZPv7TFXOYaVx/UZjuxpVMJCAU
	3t9w==
X-Gm-Message-State: ABuFfogWw6FivKgljnEVA8OD1MB4xZJrgOXVooS4/HfvZMNIn45eoipw
	RAkUBeoYxIZ+ypgLicFUQcw=
X-Received: by 2002:a0c:c204:: with SMTP id l4mr18776791qvh.212.1539635438456; 
	Mon, 15 Oct 2018 13:30:38 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	7-v6sm7537538qkv.56.2018.10.15.13.30.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Oct 2018 13:30:38 -0700 (PDT)
Date: Mon, 15 Oct 2018 16:30:37 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20181015203037.GJ3671@okra.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-6-aclindsa@gmail.com>
	<4fff310a-8fc6-91f9-6caf-315c84d983d0@linaro.org>
	<8e83cbd8-8c2f-f6f1-4423-f19a5f13aa5e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e83cbd8-8c2f-f6f1-4423-f19a5f13aa5e@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-devel] [PATCH v6 05/14] target/arm: Reorganize PMCCNTR
 accesses
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RO7jUUfPmlfv

On Oct 15 13:19, Richard Henderson wrote:
> On 10/15/18 12:50 PM, Richard Henderson wrote:
> > Ok, looking at this follow-up makes more sense than the previous patch.  Would
> > it make sense to squash these two together?
> 
> Or, rather, split into two different patches: the first splits pmccntr_sync and
> updates all of the existing uses, and the second which adds the migration hooks.

To make sure I understand, you're suggesting essentially reversing the
order of patches 4 and 5 (and fixing everything up to be consistent)?

-Aaron
