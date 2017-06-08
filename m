Received: by 10.25.0.23 with SMTP id 23csp2706108lfa;
        Thu, 8 Jun 2017 11:20:01 -0700 (PDT)
X-Received: by 10.200.58.163 with SMTP id x32mr18383704qte.110.1496946001202;
        Thu, 08 Jun 2017 11:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496946001; cv=none;
        d=google.com; s=arc-20160816;
        b=bgpLYRkqBFU6Y0t51GRG0U1JlZE1JSl4UVNIr2w0nKviFFdb4NgCMrLxwDPwrHH0xc
         jjG6wviuUZmer9dLWMkALaqeepc6ldquhz0xNaWwAmrIfE9IH9h4oWJR5DFODeumYxnH
         XbLwlqo63kbbaeI53AHp3kMzYHr+kId9VrSzmLqFkXnd3W7ZRfBHT16WMj2KIB3ruoyP
         TG1MvxoE3q/SN5V0xpTeBXWhsJAYO6KmFlM6stMgVzcAl09uHlDTjPyijgZh0HlHjMA2
         bDADiilQqqV868tnSMTfe795K/wWLMXcy7up7D1iVMUoM96NsqTtkmlhPwZYfOTxLDQP
         WZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:from:to:dkim-signature:arc-authentication-results;
        bh=j3acF3XWa2v8gQJquwqD+QSdENyQ7xn+ICKNfkapLQk=;
        b=VpJ+EZhSw/izw2v9SqhBFxzAsKMwAOvMu09/e3NRuuaPkI0ZX5+fI8PfoaDXNa4aLE
         rWC02KnwAs/DxlkyGQGHOjRqGlxRafs4Nh/ef8fyZccl+lOePt2cvEGRKrQ0q+4x1ejj
         gRHmKpXURsvc+b4Q/tg6FCbQRn/UrubsAaNOa3DajmLcWCztvtUCrPog1MnoBf6SdlTw
         6MgB4qTwAYbi+mDffNy/wjOJxKVpcfvm20qvUUd4um4cqxC/Fs1bA/APyFjhInuqr8gk
         ZCoByT9NymqSbsd0Wgwh5qxmoTkNcbzFMt9+ww399dFcHlPona/g/vuOJkn1JL3eXx4d
         O7tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartechhomes.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s55si4136302qth.127.2017.06.08.11.20.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 11:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartechhomes.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJ22I-00031r-Ht
	for alex.bennee@linaro.org; Thu, 08 Jun 2017 14:19:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerry@smartechhomes.com>) id 1dJ21M-0002Z2-Ba
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 14:19:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jerry@smartechhomes.com>) id 1dJ21J-0001RV-HN
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 14:19:00 -0400
Received: from smartechhomes.com ([66.246.75.169]:34204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jerry@smartechhomes.com>)
	id 1dJ21J-0001O3-DW
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 14:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smartechhomes.com; s=20161214; 
	h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:From:To;
	bh=j3acF3XWa2v8gQJquwqD+QSdENyQ7xn+ICKNfkapLQk=; 
	b=Ke0XxTXAidQsES/KIP6Xx9G7p9DNv4mtPmBmY7apHNRKpFDvrPMy2O5IrY374TBXun4FaSGcmzZlztCpYW8/nbRmtLkZCbMkyyjsewh9uKeY5usru/WrUrgPpnDzUTA9HAxJmmLab26vsoytAJhBw6q9NhWrRWPT4feT/1Zjc8w=;
Received: from pool-173-73-25-174.washdc.fios.verizon.net ([173.73.25.174]
	helo=[206.223.85.24])
	by smartechhomes.com with esmtpa (Exim 4.80 #2 (Debian))
	id 1dJ214-0001KP-B6
	for <qemu-arm@nongnu.org>; Thu, 08 Jun 2017 14:18:47 -0400
To: qemu-arm@nongnu.org
From: Jerry Stuckle <jerry@smartechhomes.com>
Message-ID: <2993d0a4-d0fd-7414-4a5d-8bb0c377565e@smartechhomes.com>
Date: Thu, 8 Jun 2017 14:19:00 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ACL-Warn: Your server announces itself ([206.223.85.24]) with a bare IP
	address which is in breach of RFC2821
X-SA-Exim-Connect-IP: 173.73.25.174
X-SA-Exim-Mail-From: jerry@smartechhomes.com
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:57:07 +0000)
X-SA-Exim-Scanned: Yes (on smartechhomes.com)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.246.75.169
Subject: [Qemu-arm] Llist misconfiguration
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x8EOGb2pczBZ

All,

OK, I finally figured out why my server was bouncing some messages from
this list (which lead to my having to renew my membership).

The bottom line is - the list is misconfigured, as alluded to in RFC6376.

The problem lies when the originator of the message is from a domain
which has implemented DKIM on their server.  On sending, the originating
MTA creates a hash from the message and stores it in the header.

When the mail list sends the message on, it keeps the from: as the
originator.  However, it either does not send the hash or the hash has
changed due to the message changing.  I can't tell which because our
email servers reject invalid DKIM signatures.

What other mailing lists have done (and the correct way) is to change
the from: header to come from the list, and have the originator in a
ReplyTo: field.

Maybe it doesn't seem like a problem now, but I'm seeing more and more
companies implementing DKIM and more and more of those are rejecting
invalid DKIM signatures.

Jerry
