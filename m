Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1374500wru;
        Wed, 25 Jul 2018 19:59:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdI1IOI3gPMFYnmBLu+DoFYztMM3naL0QbbUuRYwFemp79xGk7i+JHp2PqTLnLBSSQ8vIPU
X-Received: by 2002:a0c:e703:: with SMTP id d3-v6mr102398qvn.209.1532573981525;
        Wed, 25 Jul 2018 19:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532573981; cv=none;
        d=google.com; s=arc-20160816;
        b=rRLsBKPoTpb/pul+u64ajk+wWOPJg8ccwgy4wxFdl0faHJrW2+KhHxlhJvpEi1OER5
         Nxlc7brvQIoJnb147BX8ApY6TmCUVHykoRsbE9XLKudz7+hU22haLfDrb8qLJ4zjlGdY
         FO+OySUKnioFdLtNXOqpK9f1Q4BhcBH6r55XTlNCkmoJxAjSx7qXmwbWxkfRYEzV55XC
         My/AaVcg0GNJ1hzN/R2ViPp3SwAksczBuxNso/tgI82CiNZb9LNXPwvql/a9g9sofjNZ
         mah8RDpQxU553dljEA8E41uzq7Ng+h4i4ZLNz/ybfq2IaI5qSZ2icCA8L4TMTCyMN4mu
         buVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ejJ1Fb6LDhyxRMTX8DUghcSEtxF5ZLM7n9Yb8upRKGQ=;
        b=uKFQyYblRxExQsz9TzohvHCwzLxuKC2SjVAcwEu9I8OSWgj56TbgQUph3MP/b6LLW5
         UQWQJpBxMOnrbkJ+VBcmSkqeKD59A8lEC5im9+7zCqQIf1RAPrjhzC3VLd/LirVMsqT9
         bWe8xGIWuVxPxDT8cG+yD+l8jpgW62QwIq9JpxQD25WRAP+tCPx4W5Z+RnrmEB9FSBMd
         WH9euwqiVEHTfe4L2BXmo+zR7sMeN7sndtWMPuzVY1YNxSHIacRFAnFdqd9HKRaBkqqG
         Vv7geQmrCX956HjG1BxFtPRPH5DsttY79K7mTQ6wodRsgQLX8P515xCTyAAVtwa5XmyF
         O+Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v72-v6si151396qka.308.2018.07.25.19.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 19:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiWVB-0005B4-3h
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 22:59:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1fiWUz-0005Ay-S5
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 22:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1fiWUw-0004EU-Um
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 22:59:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51104 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1fiWUw-0004Cj-PY; Wed, 25 Jul 2018 22:59:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25F3540216E3;
	Thu, 26 Jul 2018 02:59:25 +0000 (UTC)
Received: from localhost (ovpn-12-77.pek2.redhat.com [10.72.12.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E73432026D68;
	Thu, 26 Jul 2018 02:59:23 +0000 (UTC)
Date: Thu, 26 Jul 2018 10:59:21 +0800
From: Fam Zheng <famz@redhat.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20180726025921.GB8038@lemon.usersys.redhat.com>
References: <20180726023645.13927-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180726023645.13927-1-joel@jms.id.au>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 26 Jul 2018 02:59:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 26 Jul 2018 02:59:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'famz@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/3] arm: Add nRF51 SoC and
 micro:bit machine
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtVdID5TJNjZ

On Thu, 07/26 12:06, Joel Stanley wrote:
> v3: Rebase on Stefan's cortex-m0 series
> Based-on: 20180725085944.11856-8-stefanha@redhat.com

Correction:

Based-on: 20180725085944.11856-1-stefanha@redhat.com
(Point to the cover letter message)

Fam
