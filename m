Received: by 10.25.44.15 with SMTP id s15csp3550185lfs;
        Mon, 10 Jul 2017 08:28:28 -0700 (PDT)
X-Received: by 10.55.2.68 with SMTP id 65mr4875013qkc.73.1499700507975;
        Mon, 10 Jul 2017 08:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499700507; cv=none;
        d=google.com; s=arc-20160816;
        b=J8XpvUWIcnuLpUtg4M5uZZ7Tf4i+aFMLtADvwnXUxsx3U0yUJchNB6Y2GWuP5BOt6c
         KFxNd0opznLEN6rWR6f9uBd9dvs+1sKvJULIzwNyJNmV+jn/U7MGxPaqyx5kd4nGnsJ4
         bfxqhcJx4HcjBcatjLARdrMpQ4XTEFEr2GBnNUtDNZvO0oOw4qBa0BQYvjBRNi5yKh8K
         wWPr+HhIbIzPutIKWt40iJfrY6u5gNrAqM4Q/V1+EWgH1KBD5Fu2OttT5W9fyFMUowy4
         nBlrK+QmYaSrbBEXFTcTR51PNGjqQY9HB0GIgZk/B3ILoP1DT96mO71bLtTIOZi3XRSN
         sW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6w8NOwkSFGZGq4MzneSK+BkQPX6r9LiT27SbomsKHo4=;
        b=Tai7muG2liUZhKXa0BjXBlG9jAI2ptSKmJg4uX1HOtFM4JLwOMfqga+Lyz81WxKoCi
         8hUSVm+tq/gsVBw+DRh5xQEuEzFS7qm3CrdITVbxpc89/YV8oQVNZwF8F0b7CyX6wIeh
         NrVUypPmN+Z+y5vL2dBniZef/t5BUBh4oqN5Q71O2BY4XYK4cBo6ZWzBzK3bEHDQQtE3
         CXYXWCrCD08uat4VbMn34hN1rO551/p9kTFsj6nTB5vEgwXtxY9lUA7L3jKq5nybS+gK
         0FeK/g6sY0kD1ECLAGhPPw+BManAQKnRItRWEA8d+yt2dEdSWZDW9Uw/sXtsqn6zAFb0
         8e4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=hhODQSeF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s78si10566792qki.35.2017.07.10.08.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 08:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=hhODQSeF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUabU-0002bu-AA
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 11:28:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUabO-0002be-NK
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 11:27:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUabN-00079v-Ua
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 11:27:58 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:35220)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUabN-000797-My
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 11:27:57 -0400
Received: by mail-wr0-x235.google.com with SMTP id k67so142862684wrc.2
	for <qemu-arm@nongnu.org>; Mon, 10 Jul 2017 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6w8NOwkSFGZGq4MzneSK+BkQPX6r9LiT27SbomsKHo4=;
	b=hhODQSeFF53h975/JfZ0TlMb4xVnr4oQhhDIb42JDsFknZh3ftibEmQ8F8eVDj3Hwm
	QQQxyLUjzzDPuLujWFHRZ6Vcm271Y0X8zvy6jP26ujIHFvBgu+z7ed6/A2TGo13zO4U1
	L+65FFMrD7X7CXFBqv4YGdo8C7iHAE+/U0u6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6w8NOwkSFGZGq4MzneSK+BkQPX6r9LiT27SbomsKHo4=;
	b=mj3g/uY4lnWpO2j946VESY2EX0Fba2b4zwkfJFQiFw/wDRV2uA2cYHIPoOoG0wyJA0
	iw8VEcbJa7onxGqsmhnyceKDmv/0JLwp0us337waak6WQilrgZDcZWcv1RPpbHq4Imk6
	4yyQxU8BHm8gO50K326AoGRxr+GqxS17Qm7PQoiA2ZcZAKza7e4rf1OHw13K2R7H6EW5
	xFSuwCmjf39simozKpE0+i/93McdnwoaliPupdvrfFoY+kjwhpxYz8UKY4xFj8vT8c40
	in+6Ib3ZiDrdZPSanQG1gQzjLwMZP6N1bJDqn5VlBa0gMUbWD06ZP7ocMnCCfrlM8ZBq
	eY3g==
X-Gm-Message-State: AIVw1113Ann2XbxJmNHbOpp1Poq71YhFTPyCXgYE59KVNI6LTS+CwZt6
	ouhcLIXpqB1e5fr0lWCGxXiGRjnumv4j
X-Received: by 10.28.129.203 with SMTP id c194mr2843054wmd.120.1499700476465; 
	Mon, 10 Jul 2017 08:27:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 10 Jul 2017 08:27:35 -0700 (PDT)
In-Reply-To: <1498927637-14496-3-git-send-email-drjones@redhat.com>
References: <1498927637-14496-1-git-send-email-drjones@redhat.com>
	<1498927637-14496-3-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 16:27:35 +0100
Message-ID: <CAFEAcA-CQm1FuF7eyveSbSchRD1PkB-PDVNyMQhVny+bmWWAvg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-arm] [PATCH 2/3] target/arm/kvm: split pmu init from
 creation
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MGd7hWFAOiTi

On 1 July 2017 at 17:47, Andrew Jones <drjones@redhat.com> wrote:
> When adding a PMU with a userspace irqchip we only do the INIT
> stage of the device creation.

Can you explain why? My assumption would be that either
(a) we don't need the kernel's PMU, in which case don't
create it at all, or
(b) we do need the kernel's PMU, so we should both create
and INIT it.

If we do one but not the other then we've left a half
created and unusable PMU device in the kernel, haven't we?

thanks
-- PMM
