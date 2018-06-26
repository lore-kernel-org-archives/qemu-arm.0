Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5272998wrq;
        Tue, 26 Jun 2018 10:24:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfbgZcX7zuN/En1XLKp/mKhjLyR2pBA9R1K2rOe/ECC13d37yMGOXFiJAPKy6z+lQRs40M0
X-Received: by 2002:a37:9d58:: with SMTP id g85-v6mr2152765qke.230.1530033878565;
        Tue, 26 Jun 2018 10:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530033878; cv=none;
        d=google.com; s=arc-20160816;
        b=tHqFxLcvXe0MHqMut8/yKO8fnEscaRedOCG8rxVP7PMFiXfF9fBXCVLxpM8Sj8n6X6
         KCsG09JAp+jh0Oa/x7Tc4fku6KOkGw+QlyTd+TQ1TnFtCCgiC8gKKgEe9JQt2X0ubG4n
         SG7gXOa2asfAzzF5OrkJYQmM0u5Cluqq0nEL3J6BawZ6GWDJ4Row+xZr4TYSiNzpA76U
         HsLjrh5/vQSJ6EEx7K6iKJQJ8u7OFZFB8FCB2NhRf5/7L4cJ6rHuu5dpDHBiZvyiPHK9
         pPy+LwXz4QJ/PIQuK0DbX3OIRjaPVGR0EHklBG8PHqE3/ahrJMBX9PoLOQd5466/lrlx
         fOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eZRDZBJkRbxA1d7GVtutttRGtb3yXXVoBm+p+Q+Im6E=;
        b=wRLkl2FmKye4+BpnFaRGiLW24/rMtGxNrNcHxHHFCa7KVTabvP7H264jZ9y8S41wJE
         CFYi7rddWAHgEkuOaGksIPvs4Jawl2Xq0oMq1mXZWr6i5S/0velDdGI/D6fMpaMvQB5B
         9nw0ofuWwgSoumE51RUh3fmT1HMNf/d86w7h75y7OGtIEQwlqtT574zZoU1Hak1CTTO6
         IM40sub5ZAgd86RwVpUCdWEXtXESnIl6F4vSmqlcDmgdO191FDasgLXAKrbGGHMYnNoi
         2llSTa+8XzjlbROFhsUXN3LL6tjpwdwqHZVNv3pvWBZ9QJ4Dc2RAKa76XSrr3/rMvS2u
         zpTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YT+rH5/i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s123-v6si562957qkd.40.2018.06.26.10.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 10:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YT+rH5/i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXrhm-0005Db-31
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 13:24:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXrQJ-0000r7-93
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 13:06:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXrQI-0002qj-Im
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 13:06:35 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:34844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXrQI-0002pe-Cx
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 13:06:34 -0400
Received: by mail-ot0-x244.google.com with SMTP id a6-v6so5303847otf.2
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 10:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eZRDZBJkRbxA1d7GVtutttRGtb3yXXVoBm+p+Q+Im6E=;
	b=YT+rH5/ilqXJlsIrqONVSZUpdOmPoCd7Ye8FhwDgThcb3Q7cBl+PfM/zcLx4+XcYyC
	URW/4dz1jPFWZAJ/FV23TnecisfuJ9o7y3KJd/pPr+3TUmkpm/xlYi2cv09zA7VlkuVQ
	E6YKBN29g0ds4eUtPu3nOCfTi0gEAAM+P674s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eZRDZBJkRbxA1d7GVtutttRGtb3yXXVoBm+p+Q+Im6E=;
	b=SWGZ0tuhOQ6WYYFCJllRa4l5tllnPTCbbkFzyoxHcELzkj+n/L4H2+AIW425AJhX5q
	YUQAexx2IGC1FJuYiSFwF49RQupSBpkEvyX1iGyliYKLp2jT0HwrY+OToP8zsOGlyidd
	08rBtk/7wLZvF4seTxEWYIKotpJHQu4zC8IZKQhHSK6IsLIapKlterjUHvZ2/8ZTP3of
	hBmVf0VwTXc3NSoZsl70sotc7gtyru8pOS9iFZOzIjMNkj6uFo0DPhoaYK4WiJe7YtVp
	JHqCb+uChDuvYgSLZGfJpEOBguLgrnv1o25oxp3AwvOs+6taZ0PX2l1PzTqhwC8fAoWg
	M04w==
X-Gm-Message-State: APt69E3p5HUdNNBsexO2dAmpstSXNnRWS7kvq1xh0WOKRoCaWvlnr+H1
	WfPGk7hI/xPFMUpaUoznCpncSlTvT1tHM+BwEb9GCQ==
X-Received: by 2002:a9d:1a0b:: with SMTP id
	a11-v6mr1253528ote.205.1530032793789; 
	Tue, 26 Jun 2018 10:06:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 10:06:13 -0700 (PDT)
In-Reply-To: <1529673765-16627-1-git-send-email-eric.auger@redhat.com>
References: <1529673765-16627-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jun 2018 18:06:13 +0100
Message-ID: <CAFEAcA9Pg3C+XD7WuLyNr5RfifRCvXB6t01YuLiK9Cs15v-Dpg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH v3 0/3] ARM virt: Silence dtc warnings
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
Cc: Alexander Graf <agraf@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3wWvwInY7fXX

On 22 June 2018 at 14:22, Eric Auger <eric.auger@redhat.com> wrote:
> When running dtc on the guest /proc/device-tree, we get the
> following warnings: "Warning (unit_address_vs_reg): Node <name>
> has a reg or ranges property, but no unit name", with name:
> /intc, /intc/its, /intc/v2m, /memory.
>
> This series removes those warnings by adding the unit address to
> the corresponding node names.

This didn't apply to my target-arm.next tree. Once I've
applied my on-list arm pullreq to master, could you
rebase it, please?

thanks
-- PMM
