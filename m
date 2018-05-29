Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3515452wre;
        Tue, 29 May 2018 05:34:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJwpl845HBu+6rCf5nBbF3Z7N0ttkLQGMtsoOK6ZaablwCQik8rBIyD1q44X2hlxDsLIdTZ
X-Received: by 2002:ac8:3183:: with SMTP id h3-v6mr16079490qte.173.1527597291547;
        Tue, 29 May 2018 05:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527597291; cv=none;
        d=google.com; s=arc-20160816;
        b=o5wL+3yiqQPyzQ1A7+rdQ99K0DJxDGavlrYjeoCmXpbo6actS42Q9ofI2t7Lh+T8Gr
         Z8NzjodFJTqRZmEw9zphhMagvLK0+EQcJqfPQPt6vbfX2oHqradcP5DSoXSZRzJuyILN
         veXCeZHwC4F0oXB/gB4uytK2DZmbYy4UDlwegL7/JpwmrbPbnyntxULAvAWkN30gfpn8
         ATZ9Yth1np7x3r6FEGFp6T48WrukUGxEK89qD/jEydAnvDHZd05G5IQJiUfQ9HodurDt
         xGU5aExH6oyHGC01nKNZUAuicE6VaMZMrH/rZoCrTiQ5SR4fADeiCItFKpQYvyCz/Anr
         fj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Vo4JPmxWuAhjskPXlGj8EAr76vBWWpxAJbnGwGXgTMs=;
        b=d6p+PfdUu4wYyU7Jgs94Hgkw2tEIlvJQ2smV5644AAmxIHX/0NBtZ1g+mjuOgVVW2Z
         8kzEHDEPrCnYNaybUsgCvdvl7N/mbzacE79RkkfjUM0bq761SN3whQxTqdFOddA6dqBW
         b1NBcxT7lUW3cOEssbOysWLCYD/ejPY711b2KQtJhIEOJUn1xGdAzlYK7PNllq8a+i0k
         b49euR5bcwo2d+t13Z27raDCNaRwDSx5ROAYYs6NFWvRzjh5d0cqBUc0yRsH++we39Kq
         ykWlH2hi26pxTwe6QH4lKOMebJCwcKAR4DmZJo/9obTiwXCjCwL+VevrhG3FacUOcyPo
         bzfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C+6UmY8y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22-v6si339545qka.184.2018.05.29.05.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 05:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C+6UmY8y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNdpz-0005mw-1g
	for alex.bennee@linaro.org; Tue, 29 May 2018 08:34:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdpc-0005kd-Gp
	for qemu-arm@nongnu.org; Tue, 29 May 2018 08:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdpb-0007RR-Mk
	for qemu-arm@nongnu.org; Tue, 29 May 2018 08:34:28 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNdpX-0007Nu-Ba; Tue, 29 May 2018 08:34:23 -0400
Received: by mail-qt0-x242.google.com with SMTP id j1-v6so18349248qtp.2;
	Tue, 29 May 2018 05:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Vo4JPmxWuAhjskPXlGj8EAr76vBWWpxAJbnGwGXgTMs=;
	b=C+6UmY8yNjo7YIvwN2d+mb9aNoXc2smBxFPmJPHNO/dDJJXaaWDlOg2rcx7bV6Igtd
	neQYqjNESC/N2w07JWvCfkjI8fgDK806xcta9kjsI0gMDoJq5PfUM/tHZp5ZgjitOj1Q
	1tznopFSTvXLZmlrUE5GeUftsUOTcmHiyhmrJcBkmn39z7jmFiYSHdWyQRUMEbdVq7Cj
	6XsVp5Df7qB0BL4tqT6pPsMNjVa+DM56+6wjfSc8bQvqzgJbx4mhWA8LS5dBW4R9PKOe
	IOi7dYaeiC3OTf0BtR31hJQD63SEWE9P8b/PSMhxm6zZ1wBYLKBZ0+mpjmJuAiiWY/Me
	Jtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Vo4JPmxWuAhjskPXlGj8EAr76vBWWpxAJbnGwGXgTMs=;
	b=F1jKIbBQVKvNqhYCeRo2c+vKdL1oTyBYmmIKfMp/qH28KSvjiU7eSOE/+Y4Nc5Qm6M
	0b7gnubRkIBcdlhfooahUu/68Im2eKhThO87qSozlInDCezU7RcmRRCNRo7qmu7S35nX
	EkYud4xP50DhvvWGco7O9+3aWSVUbAR475sXYAKIbJrS/HtlcNafFCJPVk5MpqmVqmgz
	7dogoZroRWyRUeZ1P3SNRhaSxT0OFOZBhWmlS44LWgZRJ4mD3ucX3hce9ZXiZ5VHXilT
	ynZQmCPPHJKzcGLCkc+cmB4cfGfQrmimYPvl3lUtvMhgYFE/qX2sTO4mY3t/nbPxWHdi
	xlKw==
X-Gm-Message-State: ALKqPwd/EpxJA0Fd/FmrFWi182g2F8w+U20fAD18bfEXLR1e7AaNulWT
	0cf7o0Ev0z6u7K8FVQsukbbDYrrSnbk=
X-Received: by 2002:aed:3b94:: with SMTP id
	r20-v6mr16576261qte.364.1527597262454; 
	Tue, 29 May 2018 05:34:22 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	c20-v6sm21573921qkm.59.2018.05.29.05.34.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 05:34:21 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <fac124fe-d816-1bb2-c8b3-d1a0213f968b@amsat.org>
Date: Tue, 29 May 2018 09:34:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529062838.20556-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 0/6] ftgmac100 and NC-SI enhancements for the
 Aspeed SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VMef1TmPgkb9

Hi Cédric,

On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
> Hello,
> 
> Here is a couple of enhancements and fixes for the ftgmac100 NIC used
> on the Aspeed SoC. It includes VLAN and multicast support.
> 
> Following is an assorted set of changes for the NC-SI backend also
> used on the Aspeed SoC when soldered on OpenPOWER boards. These fix a
> few problems found when running OpenBMC on aspeed QEMU machines.
> 
> Thanks,
> 
> Cédric.
> 
> Cédric Le Goater (6):
>   ftgmac100: compute maximum frame size depending on the protocol
>   ftgmac100: add IEEE 802.1Q VLAN support
>   net/ftgmac100: fix multicast hash routine
>   slirp/ncsi: fix "Get Version ID" payload length
>   slirp/ncsi: add a "Get Parameter" response
>   slirp/ncsi: add checksum support

Doesn't it make more sens to have slirp patches applied previous to the
ftgmac100 model?

> 
>  include/hw/net/ftgmac100.h |  7 +++++-
>  hw/net/ftgmac100.c         | 59 +++++++++++++++++++++++++++++++++++-----------
>  slirp/ncsi.c               | 54 +++++++++++++++++++++++++++++++++++++-----
>  3 files changed, 99 insertions(+), 21 deletions(-)
> 
