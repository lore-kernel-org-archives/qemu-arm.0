Received: by 10.25.159.19 with SMTP id i19csp2596565lfe;
        Tue, 19 Jan 2016 08:34:57 -0800 (PST)
X-Received: by 10.55.75.131 with SMTP id y125mr38770271qka.61.1453221297237;
        Tue, 19 Jan 2016 08:34:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 195si38168716qhy.17.2016.01.19.08.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:34:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLZFA-0006Qe-LZ
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 11:34:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZ5r-00060w-M7
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:25:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZ5q-0006SM-R5
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:25:19 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLZ5q-0006S7-Nj
	for qemu-devel@nongnu.org; Tue, 19 Jan 2016 11:25:18 -0500
Received: by mail-vk0-x233.google.com with SMTP id e64so14894324vkg.0
	for <qemu-devel@nongnu.org>; Tue, 19 Jan 2016 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1bAlLnY3mRT5KyH+kDc8CX9l99bgnTa/q0A1g2fbiAQ=;
	b=k1LoY0Zi8KSaloPj4s9jlnNvzxW6KZSnnFqxAlFO/LO+W1rYAqYjS5FgRa2GqR6nuL
	9Bw1eGgIBeEIEBWuc88dj10X3ssuTvHuMwAj4QGxbAFepDO9e4CYhTBYxI3ZvfAecUgK
	9YJsFs2uDIvDxq7qy2Q61Oas+X91Uua9O2MeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1bAlLnY3mRT5KyH+kDc8CX9l99bgnTa/q0A1g2fbiAQ=;
	b=bWSean7JIz9o6TAcM7JCx9VVklN8NrgjV3fp2ikOLY9SHHDFTOiAP4hnMgyAM/x4SI
	kx+9lYkxjDZHlEHhUQXrekJIQeRPrtVnVK1+v3eE9b0U0KQtwmlVOVuop6Mb9i99jUHB
	okDnqgN1qie2fw4jwN+qFOiaF6WRESFnqDLdPuUkpkg5YAYnGk/sE61qJVkAXqrwUD5O
	R1Ve2FvcFLG3giDfgbRXzeC/NUmIuvcVsuI+5Dj8xTQUOniLhy5AKKGyrPAzb1Xw5Ihl
	RNHWslEdDHbIMfswDRqRAscTg2bWuxX9ln94m32YpsYXtnx5JANnY9mXtPzv9ZTsHyHc
	YBJQ==
X-Gm-Message-State: ALoCoQlf8i5c7kWY7YjY7ktBAwxluJtOXJVbHYhPDF4EgpVIoHA1gq1a8HN+eCMFjJOPKBPTkdAlZ3js/kfnpBQHcMCimfMggX9CV6PYfMfRTOjSKqTtt74=
X-Received: by 10.31.180.145 with SMTP id d139mr18484503vkf.83.1453220718398; 
	Tue, 19 Jan 2016 08:25:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:24:59 -0800 (PST)
In-Reply-To: <dd65260edbfddabf929355be5e1f4145b12ab964.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<dd65260edbfddabf929355be5e1f4145b12ab964.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:24:59 +0000
Message-ID: <CAFEAcA-cbMNM2-=n6DS6vn5Z9MJdQZ-zW+jxMQEtHbCmspoL1Q@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-devel] [PATCH v1 03/17] linux-user: arm: handle CPSR.E
 correctly in strex emulation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: s20RbLwxz9zS

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> Now that CPSR.E is set correctly, prepare for when setend will be able
> to change it; bswap data in and out of strex manually by comparing
> SCTLR.B, CPSR.E and TARGET_WORDS_BIGENDIAN (we do not have the luxury
> of using TCGMemOps).
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [ PC changes:
>   * Remove BE32 support
> ]
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---

I reviewed this with the BE32 changes in it, but this version is
missing them. I don't really want to go through thinking about
whether all the cases work again only with the BE32 cases
behaving different, when I did that the first time round
and will presumably have to do it again later when the BE32
support gets added back in again :-(

thanks
-- PMM
