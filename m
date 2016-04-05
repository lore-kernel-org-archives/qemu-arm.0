Received: by 10.25.208.211 with SMTP id h202csp488309lfg;
        Tue, 5 Apr 2016 08:29:28 -0700 (PDT)
X-Received: by 10.55.74.9 with SMTP id x9mr41630671qka.81.1459870168526;
        Tue, 05 Apr 2016 08:29:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f27si26599600qki.118.2016.04.05.08.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Apr 2016 08:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anSv1-0001ZS-VX
	for alex.bennee@linaro.org; Tue, 05 Apr 2016 11:29:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anSuh-00013F-EM
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 11:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anSug-00062f-4m
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 11:29:07 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anSuf-00062Y-QU
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 11:29:06 -0400
Received: by mail-vk0-x235.google.com with SMTP id e6so22253052vkh.2
	for <qemu-arm@nongnu.org>; Tue, 05 Apr 2016 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W8u9hcwWkYWtOWkprveWz71dXl3DXumUjn6yN+eKQ+M=;
	b=dPY+lYBdUUsqUg15g3wS9AgPKqtmTPFxtfPbz4QBilzASSnl/mUExa1jwZzt9UgisY
	VMQQePa8ciqkerK6yMkKzQNdwEHabQMo7xe6PdbRGyZ6DjE4V7TLiNBjxcFqd3z+6Rzz
	qMKhqIxk1x1ud46SbfP4YRTL7jioa/6SNgIEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W8u9hcwWkYWtOWkprveWz71dXl3DXumUjn6yN+eKQ+M=;
	b=Pbqo4RIFTNdqAbdGCbX1s30pdlfPRaPNSxKyl2MbywKxpAE28vtcZLUNxaNI1PBKba
	JrRrKl2kp3hWGrFpkpZdqQn3BItHY5Oo69D5WFDCKPQhzAjyxu9i7DO40mw6PMNC6+1A
	Z9hmigcMYTKhc9sL4Rr8ZL9cxFSBfYxf6PVB9YiD9eLoI3eZBbwPiimB+4h2q0kswrsa
	Ch4OQoPIri42nVzCfmO4G2fCn/1XXp8eexIPCUheCIm3KFwbO3R+mUQjMSxsxh66U+A1
	2RPYJrbM7JD7aO9CM6o6VLNW/tL6VLw7nFxv0Iim7s45spnVqpcp/AlHLtuYm6pybWsi
	C6rA==
X-Gm-Message-State: AD7BkJIT80qcb2pjjJ1EXpnsfeug6fQPDJCmSrwAYmk+iLMLkRsbr69lKg6S+29BytRNT7o9ddpOaGzpDSzPDAZM
X-Received: by 10.176.0.212 with SMTP id 78mr10357799uaj.4.1459870145404; Tue,
	05 Apr 2016 08:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 5 Apr 2016 08:28:45 -0700 (PDT)
In-Reply-To: <1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2016 16:28:45 +0100
Message-ID: <CAFEAcA-rV_rZHkOmbhMw+otPTPBSTZp_Ff_0ZrD_LpK2=TSAMQ@mail.gmail.com>
To: Vijaya Kumar K <vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	Vijay <vijayak@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijay Kilari <vijay.kilari@gmail.com>
Subject: Re: [Qemu-arm] [RFC PATCH v1 2/2] target-arm: Use Neon for zero
	checking
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5vuePvYfBe7z

On 4 April 2016 at 14:39,  <vijayak@caviumnetworks.com> wrote:
> From: Vijay <vijayak@cavium.com>
>
> Use Neon instructions to perform zero checking of
> buffer. This is helps in reducing downtime during
> live migration.

One other comment I forgot:

> +#define NEON_VECTYPE               uint64x2_t

This is a 128-bit type...

> +static size_t buffer_find_nonzero_offset_neon(const void *buf, size_t len)
> +{
> +    size_t i;
> +    NEON_VECTYPE d0, d1, d2, d3, d4, d5, d6;
> +    NEON_VECTYPE d7, d8, d9, d10, d11, d12, d13, d14;

...so it's a bit confusing to use d0, d1, etc, which implies
a 64-bit value.

thanks
-- PMM
