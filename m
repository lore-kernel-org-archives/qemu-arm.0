Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4487412lfm;
        Sun, 5 Jul 2020 18:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIQdiqABv/sroxoNkTSw3PQFSYmbpc/UrKdjypbEh5lGQx650OxDiZsbRmbnrm+FVC6FbS
X-Received: by 2002:a25:bb82:: with SMTP id y2mr70972122ybg.392.1594000797773;
        Sun, 05 Jul 2020 18:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594000797; cv=none;
        d=google.com; s=arc-20160816;
        b=ccS3mN5J3d5+VBXKwAo80O2/xBamwP/MppmD70bNavZjka6M+filVuLcSXFsFHoohE
         EkSecYNsAYvYtlZRC83HCnIXNaDiyvFhjIR/YsIt1zohn4idJsLOLoSGTJb9voQeP45W
         IeePTIwcdz/nW8+FiVTel9qEnYKme0CkU7tUUdgjeOmvcRTgCQhzPT6IsFhh+UPqo5of
         xVD0YoCCdkaPRnEA/sWWQdEsoxS1HrcY6hARdxCuvKMW3fgyo3Tm5FVeySmQca1BEA4L
         Drs1M7Wn1qVYuQCppsBu28YSMRp/NlhzBhKPH3PA7tkQDwViM6Y7QRj4euFqBZpJ/579
         DueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=rir9q1V4XSPi8pCPlUzHKUaVsOAm/gih4cY+mHrLsao=;
        b=fq4Cm7dZSyYTDjOe/EhbYParJBbm1N30XQFuSHySsYwEtLrJT9peOOR9mQTBKsanks
         R5lw65jm52Q28Lw0RCKwOoim9JNI/1LuViNSStsUe6o7JiVV1PQFTw9xTv8pqVeFVpiL
         F8PD5OlIrI2Zcs5oF/Q8qRctYOAV+c4M4RncnIJGuRIa2hpFIwSHDMPkpEiBBjD8Eo8e
         4Lqm3tP2ibVGT3PpRzuJu8hTwP5wUtuuqKRZn6TQs6KpRmbSkwUhfYnKVNrl520QCQNi
         TiPyrUduW24KI45gY1xf0An5UBfGvpqhjNKPgt+/5hup/ely+tRplz8baQbiuB3JSPk2
         8OEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=isduqsbV;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b="U/U3uzef";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j190si18382945ybg.386.2020.07.05.18.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 18:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=isduqsbV;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b="U/U3uzef";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsGQH-0007Ee-6v
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 21:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1jsGQ9-0007Dv-A3; Sun, 05 Jul 2020 21:59:49 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1jsGQ7-0004qS-Ij; Sun, 05 Jul 2020 21:59:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C8065C00CE;
 Sun,  5 Jul 2020 21:59:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 05 Jul 2020 21:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=rir9q1V4XSPi8pCPlUzHKUaVsOAm/gi
 h4cY+mHrLsao=; b=isduqsbVfFbh+Z0YLZL2+C9zPdRGGQU2MvWqOBRzm7vbgXE
 0zG1ZyB7Xt5586K7pCBjgujrb7S20VKuwA1MLgT01KqGX1xeczyrooLEftWILC7S
 fM0BXEGTqRQ/fZiU6ejX9xVY/ifM1pwbbEGQcG9XduvRww9dFpzNtcRFzAA5i16s
 S3fCywCRR/3wZpZQm9r2qN9IIKfpkJ+2VfYAoSPxrK6yL0hqfBesw21QmA/Qnkvx
 dmOpzhtHUt3c19854Q2guGsf52/qmmy8h75AhWo6QLsa+C0WMiA6wk94fjtlzXVh
 +hD1Nd8yD+tg+mWgQp23J2RqxS/Bj5sYXsnjPHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rir9q1
 V4XSPi8pCPlUzHKUaVsOAm/gih4cY+mHrLsao=; b=U/U3uzefh+pL8+08CxZ/u/
 KAvNWp8Ani6KJDIq9si0noDsFP1OkviNhawfRWcH0g6orUnNQB4S2dAgIV9K2QgQ
 19sSFLNEvLy2CNUgz2CYqSsErCRvHH/9Cq2iGBYXytr2jrmKrmG14tok4JNkGoGg
 fI21lxVbPe2KLnbcW6d7vopB2nIJGj5YxUKIXerEPLEjUL/APETVCG8w63ddaa6Q
 9ba1IiSyrPL7WbNfbFIoQhxCm/um5uG0qhQtusb12rrs0//uWnrHlrauEkj+6SN1
 /OcZ9O56aa4pCrJfdpYLHlVDN35QIQca35M4NLdktS7DDa3tC1MXTYG9kIqkz5sg
 ==
X-ME-Sender: <xms:kYUCX6fAxgiGrb_swiIarlXbhrc3ap0L1BkBX7niFpDILTLU_hYWXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:kYUCX0MtoAEeK7npK_jMDfN5s9dwCXJh1vKgdc2FBm55gjq8OtWyxg>
 <xmx:kYUCX7jPAWWnyu-sbFA4jiuvNPp67o0FoIfyZDH5HqIfULZTb-rIHw>
 <xmx:kYUCX38t6PT_kZIEruiz1pGwTVtmc1jXS_YKInGKZhTXooOGFFeScg>
 <xmx:koUCX6Kle_lxgrJIJwzE7J12Qe9mRmUp0gr4ZiTF-19U_8xaqYIlfw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0C925E00AA; Sun,  5 Jul 2020 21:59:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <df64d8de-9d7f-474b-8b72-5d2e6c7df1f4@www.fastmail.com>
In-Reply-To: <20200628142658.29264-1-erik.lucas.smit@gmail.com>
References: <20200628142658.29264-1-erik.lucas.smit@gmail.com>
Date: Mon, 06 Jul 2020 11:29:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: erik-smit <erik.lucas.smit@gmail.com>
Subject: Re: [PATCH v2] ftgmac100: fix dblac write test
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 21:59:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScCwv736io31



On Sun, 28 Jun 2020, at 23:56, erik-smit wrote:
> The test of the write of the dblac register was testing the old value
> instead of the new value. This would accept the write of an invalid value
> but subsequently refuse any following valid writes.
> 
> Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
> ---
> Changes since v1:
> 
> Changed %ld to HWADDR_PRIx to fix building on mingw

Bit of a nitpick, but the type of the value argument is uint64_t, so shouldn't 
the result of the expression captured by FTGMAC100_DBLAC_TXDES_SIZE() and 
FTGMAC100_DBLAC_RXDES_SIZE() be printed with a straight PRIx64 rather than 
HWADDR_PRIx?

Otherwise the change seems sensible, so:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
