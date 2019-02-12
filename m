Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp847281wrp;
        Tue, 12 Feb 2019 07:32:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbPx+JnpvMNSetfLGzf/dTurpu0V6t4HIun8fGPAAkzuSF7FsrMEdZRzwBSqnZNx0kacL2D
X-Received: by 2002:a0d:e502:: with SMTP id o2mr486481ywe.227.1549985532102;
        Tue, 12 Feb 2019 07:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549985532; cv=none;
        d=google.com; s=arc-20160816;
        b=CMKFgrP8tTlSWxJWVe6qb38dgF11/Np5li/tHLu1f5CJG+ywtgJTM71cJIqBQe7Csb
         5o3RbQimA+ZeUU5CQLmhz0Ucj/SRby0qFjOCtoMkBf8Z1Y9S32aLL8l2w4iNzHngg7+0
         7b1mEp6SfNB/gPANRYe9LCYfFErhfo07YZIQRaF5itOfLPiyyWzfrGUjoSq8zz8vrV6W
         ACar44p1YjpQxANxw9kYR5ZUCSY+6uDdndRG30rEdXqYwQ8/YWM4flI+bgsIWlH8nyzC
         3OioPYPL+BBQxt/5Za9KWzPm3zKDp/lOXrQkeakALOhi3VD/NjOL5fOG7CyQtiPU2LS+
         WR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from
         :dkim-signature:date;
        bh=3jsw/Uhl6H0fV+Ke/xoB2XlRawuoowRaBLoGlOf4Ikw=;
        b=a/aKOYze5GtICq+eYB0lR2O12v1+C8McK9Kuq7kKwjwX7J3hULfAced2OGQuP5/w0U
         bacYlp1jG6n8aW3wd+R+uameKaDhXe0uGoZ2zgXc+8hnUGZBqwixeKNqr2Gvb9spmqsN
         aeUG0AzWE9SS86aDKW0jBDgD1HbPwaA3boM6Bn9JpjsEmOQLdQp1sxLu4CG7fLgh5jjL
         tfVEysebCNEq+cElLJr52nmTpA9f1PUyM6Gq6U/F5nub49p4OuwnkxMDSmCr3cPDDYIM
         vq/yq/YWfRtq93warrIwJmm4cN5N4VMqOqYEJEQW8K6JzN8PTYOG6PO51rs9KR3LXomK
         LSWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@airmail.cc header.s=mail header.b=Mtx7n5VT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x66si2146193ywe.322.2019.02.12.07.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 07:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@airmail.cc header.s=mail header.b=Mtx7n5VT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gta2d-0004oZ-Jl
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 10:32:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alnyan@airmail.cc>) id 1gta2A-0004mc-GJ
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 10:31:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alnyan@airmail.cc>) id 1gta26-0008Hw-82
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 10:31:39 -0500
Received: from cock.li ([185.100.85.212]:38778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alnyan@airmail.cc>)
	id 1gta1r-0007nX-FO; Tue, 12 Feb 2019 10:31:27 -0500
Date: Tue, 12 Feb 2019 17:31:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1549985475; bh=07CYjeMZk+9qeM8wjxpxhNnPsgAElJWOURaILjByDOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mtx7n5VTtLTsvC8eSd7oiCd7Qipy0xKs9EdoUr5s41Cw4lq+DxQsZ1CWKn3QYhrNO
	A3fsWEdDaiyRxSF9596DxMuUPOBVt9Cwk1s7zv4XCUIS0PLZSsnMf4zVNC+ehdNoBH
	mWcCjOeKwi6KZfeoyxAIoqJXYoeV4kP1e65PYNZNwi4pyE5DjBU2ClF/Xa+OgIMm+5
	RNTkIg6Tbrt87x4ql/oHk4++eDa0MoLqEUthSm/eU0TDrwAjJKfal7s+HsQ+/mrK0h
	1VJkqjIXO9XNCAI4iaa7qT3hr2ArT0W0pm0OJuYwUC19/Q3tj2Ar30e0hGnPbEuz6g
	MedSBQz50yh7A==
From: Mark <alnyan@airmail.cc>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Message-ID: <20190212153141.GA21710@nyan>
References: <20190210165735.GA23862@nyan>
	<BN6PR21MB07857DF2253F6D7380B85F239E640@BN6PR21MB0785.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BN6PR21MB07857DF2253F6D7380B85F239E640@BN6PR21MB0785.namprd21.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.100.85.212
Subject: Re: [Qemu-devel] [v3 PATCH] hw/arm/bcm2835_peripherals: add bcm283x
 sp804-alike timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:Raspberry Pi" <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zE/cSzaw3gKZ

Hi Andrew,

Thanks for reviewing the patch I've submitted. I've already messed up
two and this is my first time contributing to any open-source
software. =E2=98=BA

I've checked the implementation you suggested and I think it would be a
great example for me to implement free-running counters, too.

Best regards,
Mark
