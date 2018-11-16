Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp469012wrw;
        Fri, 16 Nov 2018 06:43:34 -0800 (PST)
X-Google-Smtp-Source: AJdET5eBYzVlpnS5fFQ7UfYWwHBW8ca2KtyRE5SW/0O0B+HoqrkgH9aLAwqx7VbRTTszpZSk75Ds
X-Received: by 2002:a37:9841:: with SMTP id a62mr10298672qke.348.1542379414324;
        Fri, 16 Nov 2018 06:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542379414; cv=none;
        d=google.com; s=arc-20160816;
        b=kQl7bMv72tw7VebWKL35W6NGQ6S8Qm4W64LcGPAB+CKR79D4e/aKein5j0Bwf7Pb9n
         5OANYF+SH3x1FeH35CVlDIWsSadeLZIL/0tiKy1YO5pM+oyAJbsP/2tz8XgbyIZKna4/
         v6T4pWxrd6rH2mTidjzjDbBAyycA1lE6wfhydikigL+ZokfdJoJ38KCMuiLahvg0gpVh
         PM7MCiZULrLYe1NrtHXyMlZ0Fu/I7S+yFMoeJvBNVGM57ml+NGrzxdglPmWx8H1Q0yZ7
         SRkZ5TW8KJl1bZ9Wk/W0DHDfszXFFlNl1iOa3P9GxPzfsuiwFjwsPUIpcVANkkHtRz+c
         /fMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=dkNDc8vJLRX0r1dHMILsPe2pXmELTrO5pJ2baxw2BAw=;
        b=nIP1dceAF+MWQqSgEM+IAeCaKV4kdszA/feQKC5vnf1Cd5KJhJ3WrWeijygH4OBIfZ
         WPBgZeF9jFN4ISBWid9HBGZVWw+6paL+Ad9biLvC9rx1zaRSCmniu760s4+xG/hGjb6L
         D6KEFlxdr1SJMninYrOu/4SHmu0jsOUcpCmAj9BKybEAALiBXLCoIRsY1QbjwOiBHDvl
         CvYeHihtlkLuRfWI+zoD9jFB4eSdHGEUDomZI8DyQRoYeuJFew2ozXlk5nMhdyfSgGY8
         7F/xQM6sACxllhYg66oEQrvp6J8VcTXiqoCtFloSyqPFI7fifQf0uYGVuIlR6SUIzOKa
         LmzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AXo+7ffU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o56si1043237qvh.84.2018.11.16.06.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 06:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AXo+7ffU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNfLJ-0002cX-Lx
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 09:43:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfLA-0002UU-5y
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:43:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfL7-0007eg-Rz
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:43:23 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37786)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNfL7-0007cE-JU
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:43:21 -0500
Received: by mail-ot1-x344.google.com with SMTP id 40so21511817oth.4
	for <qemu-arm@nongnu.org>; Fri, 16 Nov 2018 06:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dkNDc8vJLRX0r1dHMILsPe2pXmELTrO5pJ2baxw2BAw=;
	b=AXo+7ffUfc5WHisJdEeudr/oBg4UEniM28kI5BUbEXtgrqeONCt0MLqZcGQRpLPXqP
	LFT76bl04J71bBvCmGOFpfWgSfA0xYxQdlzPYKSSOdPRZq1hkHZ9cU0hvhfND1ZtGD/D
	Oqd6iotfNttuJgjHkE5sa6UGOwyUR3Y+OD3tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dkNDc8vJLRX0r1dHMILsPe2pXmELTrO5pJ2baxw2BAw=;
	b=gSw0XGd9ryQRewz6Vgr7G/VuiMVg9fA0VHcY4epbys0h86biLNGkuqTGwRJdALG7+c
	IvGabx7ASQMWAIDOp3KQ0MQkIuHp00ogP1iZLvhbs7WwF3Gn6Mt1SHOza64mSDt0hKfi
	r16Nso3FyGCJhaeQil3yeHGr/rFwFfiwOnTX0RyFR08QR71aBllHy7AGjOs1dKs6vRpX
	GS0pNZAKc0Z3cHPgLu1wlnENGpflWZoSPjONHZKmHIXIrZvMmBHUiP1PGdejBcf7D/jm
	Vc+ps6e4GmAbD5MSftTDKHK1gFpx3Je81u4HRoQHXtmo5m1Su7iVm5XDx0hxgWiSpj+m
	QJng==
X-Gm-Message-State: AA+aEWa/NdVm7+6XC52rHMqsxhoUTiJP5SKIZl47JDG3e6KQnmCkxyub
	MzkqnyjDUPnIZI+/XjvQT+dLXzXBycZTwiHqbjIyFg==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr832580otq.316.1542379398689; 
	Fri, 16 Nov 2018 06:43:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 06:42:58
	-0800 (PST)
In-Reply-To: <20181105185046.2802-2-aaron@os.amperecomputing.com>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-2-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 14:42:58 +0000
Message-ID: <CAFEAcA_M=KfiFdtVbyuiFPfAh1r+p=vQT+CHBpRNdiqPBxN_4g@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v7 01/12] migration: Add post_save function
 to VMStateDescription
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 21ICApX9vvZ4

On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> In some cases it may be helpful to modify state before saving it for
> migration, and then modify the state back after it has been saved. The
> existing pre_save function provides half of this functionality. This
> patch adds a post_save function to provide the second half.
>
> Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

David: do you want to provide a reviewed-by/acked-by for
the migration vmstate API change ?

thanks
-- PMM
