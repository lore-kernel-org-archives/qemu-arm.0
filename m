Received: by 10.223.172.38 with SMTP id v35csp5250781wrc;
        Tue, 19 Sep 2017 11:32:39 -0700 (PDT)
X-Received: by 10.200.19.73 with SMTP id f9mr3519840qtj.236.1505845959770;
        Tue, 19 Sep 2017 11:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505845959; cv=none;
        d=google.com; s=arc-20160816;
        b=C6wPDXCuAVmYI1m7fJUG6xi/xX/hFVE3OAFFnvnIP9lucoEA9iKQfNLIr3fp2cBI3a
         I/XfH6QHuV5oUtpjpLHIOYZ+bWrinx+oDb5o/bR5taLwLGy0CwkbZP8lApFC8XMxLsc8
         Y8poSGaqqiGuppt3cZGjhyNGCUrNOSu4b7UvYLve3uxcOd5teKZfZ5hUpv4if2XEwVy8
         KTgHn2ogq32BOV3sPyfevwozM2gFiwqpOrdgHMeXFJozIu4V4nVH6BR34tBQOqv2LWQc
         fO4thD96ygzolGMDQV6daIB/QH7C3vS8Ah+gq/vO0RePlDwquJ0ikWPV9YQpZsbWV55r
         MEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ZnnJZVeZKU8OLUvWV4YXfDYqAae84eIIonnk2N2WPpw=;
        b=HsdV6DN2fDDzmbTowQ9nWkaUBjqRxlq1hOq8sTFyne3GodEEGAWg96QQaqvDC5e9ke
         hI8WtO8LR4CzoC973Rb4VANpTbbYq7xncgNF93z5+/HOu2dL2nqHlJ9bA0DWzv9wvtOd
         Mp3KiDaI1qtsW1a3AiYIde1Jko/jObkyieHWRYVobHkgGtFJZAZxCViaFc+H6DtrspAA
         rbbWia93GapiwuyTQdXWdFO1Xa+zQa7Kq/9CuxQK1zEvYOFBy/pemwugJ4XTa2zj/dOz
         vGqlH+nDk32JZfD1hOtGAKOfK0SkQdAqEG4dDMQl7w3wUUkj+tHFiKJ9q509IChtndF3
         YNHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QJV7T7wA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si9573084qkd.291.2017.09.19.11.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QJV7T7wA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNK1-0007P9-AE
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:32:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNJn-0007Na-QM
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:32:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNJi-0003F8-UC
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:32:23 -0400
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a]:55445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duNJi-0003E4-Pb
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:32:18 -0400
Received: by mail-io0-x22a.google.com with SMTP id z187so1188503ioz.12
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZnnJZVeZKU8OLUvWV4YXfDYqAae84eIIonnk2N2WPpw=;
	b=QJV7T7wA7gvJZ7YEijIHxMMPyE7tOxrcVhKrVaL+9w4kDjQUWHo+/boJAgP36rT9EV
	MJSfsYI+FNYwh4Pz+rOAmV4FB5LgcYBSn4GCeSian24/hwdy5jCaFKZZjX9521HjXc58
	lXNmtdD9Ajy9u6j0Ve+SySGQ+HxW7GIAJHlOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZnnJZVeZKU8OLUvWV4YXfDYqAae84eIIonnk2N2WPpw=;
	b=B7zr+D57K8Njx+JG+ZzpfsBDMP7yc2kUeN4uY9PPnIYkKUMEQN2cX/w/RvEZynJ6Td
	nleUtC01zHa1Mog9sJ7457Uv/O8hgfd1OG6WqOe/K06PjdsVd9SDtjrAl0joSQESbniQ
	saK/FZ9Mbi59C+MQnygID+oMhFLpS6OGT/qFJC1ubhE8p3fbpu14H9k5/tiK0vlkGoBL
	rwzaBZ8KPjsOhpXNQhcvovjqJsZoAKjYgnVuRtmo6b2biTeJ09LlujIe5Ix+YQuUR8yz
	uYpaud8DcSVXjLQRmgn3srluMKofYWoorv67k3ZvXSgqPiylBGdF1NplNp/+97ysr6iM
	t2Vw==
X-Gm-Message-State: AHPjjUjUefu2hNedxcQJz78bLe4kS0DHjlSx7/KpMxKZWBKRrzRaHSre
	0rXiYsHvOWA0K+eek29W6JPc1Q==
X-Google-Smtp-Source: AOwi7QCj/5hKzqHNLGIqV2YGbZtI+Ta1E7GnE58Byq48pgBMuYRG8ETE5Oq5en1GBE/w+2jA/J2JWg==
X-Received: by 10.202.228.201 with SMTP id b192mr2551845oih.132.1505845938062; 
	Tue, 19 Sep 2017 11:32:18 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	u129sm3253800oia.2.2017.09.19.11.32.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 11:32:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-9-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de7f9ca1-0faa-1676-2429-6775296afa7c@linaro.org>
Date: Tue, 19 Sep 2017 13:32:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/19] nvic: Handle banked
 exceptions in nvic_recompute_state()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xa6qAqWPKD1o

On 09/12/2017 01:13 PM, Peter Maydell wrote:
> Update the nvic_recompute_state() code to handle the security
> extension and its associated banked registers.
> 
> Code that uses the resulting cached state (ie the irq
> acknowledge and complete code) will be updated in a later
> commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 151 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  hw/intc/trace-events  |   1 +
>  2 files changed, 147 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

