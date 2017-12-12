Received: by 10.223.159.74 with SMTP id f10csp3873694wrg;
        Tue, 12 Dec 2017 06:18:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBosn3t2v034j1iqsj2bJwhxN8Q8xZqhI/y/4CPdOWuR1IeRIWj0SbAU+qmQPcT+JCBGcR31/
X-Received: by 10.37.129.12 with SMTP id o12mr2872245ybk.28.1513088314934;
        Tue, 12 Dec 2017 06:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513088314; cv=none;
        d=google.com; s=arc-20160816;
        b=QPMbUu+k9R/gG7IDCiVk422TflPmWrdmi3OJd05JzN4Hmowt4yd2rbG0aqwMH9U9RA
         fuzjcU/tEytatR1uRJ5w+ILv9l+SRx6IqXR+fx97RNNdkAAB0dxhofiwnbl9bKNR339k
         t/CMBY4Ao1mONYuoJq3SxYkwXg9ipMyqpQvu1Xwd82PrM4yyQK/iWutT6i/lGhXw5yu5
         jJ2JovBKs1hGpNtdJFHwyWkDzHAtkKBqXoEcJSPAE8W4JL0X2SWfYjIjl5EN1fBJOUh6
         9QON21FbbJ3jyWu2VETTMRFCQWYKzhEfhVfXUc2P3Ll/NjzjlbXPDRnjUHCEDPyMtJW7
         UVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tg6cslf7Zd12CmdhlKqJ/lUsIz1TtfTwBVPcj+dySTE=;
        b=uKSyuzXnA7wWVJ6f3tBF7W3G9LpcLwtA52qY/oJgT9izkNL4RFFBQBp4mnPDsTJSWI
         JUzTT27fZJ/XMKa8c0Kw6seFGyBRtu7sn/ckbBW7ntKmjHU9tbwwth79zHsaK5lu8iWF
         e62yvMtVln01hSeZzS8A8f1tUoJrXEtWFtRSyP7f17ufu+GzhV8tvoK/a7KdQzlo3MEs
         39EFAHmDnkg0WVqJEsxtplys5Bd5vlZKFe0zTE2cq+Ga77HAr/7ucd2+xQuyIZ8w7U7q
         w0ofalCsCXJn3rFKO9uWIjy4DfRNbjcZzPGAkUUqlpFES3yjX6J5gZNXat9Nk5GYkexE
         S98A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dogBr1/Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t14si817007ybc.833.2017.12.12.06.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:18:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dogBr1/Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlOE-0002VR-9Q
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:18:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOlK8-0006yj-KQ
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:14:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOlK4-0004VF-SJ
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:14:20 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:32987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOlK4-0004UM-NJ
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:14:16 -0500
Received: by mail-ot0-x243.google.com with SMTP id h9so17895792oti.0
	for <qemu-devel@nongnu.org>; Tue, 12 Dec 2017 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tg6cslf7Zd12CmdhlKqJ/lUsIz1TtfTwBVPcj+dySTE=;
	b=dogBr1/ZT1sPIhuz4zht7PMId0gCJQH/bYl5YwECuW/RPrqeZxibl4072IcoTN3sVf
	+xik6WDoQLM4V6NccyD2o4XtQUEiqOV4rs/wLUikk8qALdfT4ZRL9RFOz8TVLgH+wIMa
	ddG1KJOLvaDPKVnTgJQUzGTzqMJqNanaagdGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tg6cslf7Zd12CmdhlKqJ/lUsIz1TtfTwBVPcj+dySTE=;
	b=n9VhV5USpNL8H5+qX2unDjVGSMUaCIY79ck3YIS1xLBBhqpq5FLIM5MNdM5kSchXNu
	OVzlt8xUkLKwsraK8TZ9AcdKXTJyFQ7mhlSp2gTxaNlfmA1YdpXLux6ZHX08bHjBoUQO
	zf+OYY+GPACdzR+U6wqOqqBFuF8yfFR9JcLMHI/jAn5uGGv5IjyzxKbQx9QAldrlB+gp
	MIZkKDJJQYFsTd6JIJt+p6ecxUQ9NYl1RlVsZZeFUQeJHFHGofOOmpTvYT8VDsY2dCP7
	DNFJoA9bpKhPsaJO2tZIca3FlQrbMautFia4m0SOayeJNuEzfbRmYpGdjt2mZzVrstAh
	ekSw==
X-Gm-Message-State: AKGB3mLdlvM1h0kKCCjsjJcek3sV1F2uXbnzASowF69KE2AxcvHid3qj
	+zeo+S45xdZhm0+g+SPuH+I2/672rGTciSxa0PjNYA==
X-Received: by 10.157.40.7 with SMTP id m7mr3479238otb.91.1513088055874; Tue,
	12 Dec 2017 06:14:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 06:13:55 -0800 (PST)
In-Reply-To: <CAKv+Gu_mzynBKSBSdtUhKRgNd3KmuJTwiNZpmvPCfkRDo_QCgA@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
	<d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
	<CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
	<CAFEAcA9JzK8sNF5TmENfXZ-NBJwfp03b2La4YQ=N2i1ZCzrNBw@mail.gmail.com>
	<CAKv+Gu_mzynBKSBSdtUhKRgNd3KmuJTwiNZpmvPCfkRDo_QCgA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 14:13:55 +0000
Message-ID: <CAFEAcA9HAcZTi6bT-FbsG9LtqO=4s7rpcz0niZbimG834t4uHA@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add second
 UART to ACPI tables
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
Cc: Drew Jones <drjones@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dP6b3gfKy1rV

On 12 December 2017 at 14:12, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 12 December 2017 at 14:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>> That doesn't actually usefully separate debug output from the
>> console, though, because stdout-path is also going to point
>> to the UART with the lowest physical address...
>>
>
> By default, yes, just like is currently the case. But I would assume
> this new serial port could be appointed 'console' and put into
> stdout-path by QEMU, based on the command line options?

We don't have any command line options for doing that, and I'm
generally reluctant to introduce new command line UI, especially
new command line UI that's specific to Arm and not also needed
for x86.

thanks
-- PMM
