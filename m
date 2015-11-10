Received: by 10.182.105.169 with SMTP id gn9csp1662483obb;
        Tue, 10 Nov 2015 01:31:38 -0800 (PST)
X-Received: by 10.141.3.212 with SMTP id f203mr2991672qhd.98.1447147898210;
        Tue, 10 Nov 2015 01:31:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si2128281qhw.57.2015.11.10.01.31.38
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 10 Nov 2015 01:31:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:58415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zw5H7-0007no-SK
	for alex.bennee@linaro.org; Tue, 10 Nov 2015 04:31:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zw5H6-0007m8-9r
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 04:31:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zw5H5-000795-GJ
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 04:31:36 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zw5H5-00078w-B5
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 04:31:35 -0500
Received: by vkgy188 with SMTP id y188so8995593vkg.2
	for <qemu-arm@nongnu.org>; Tue, 10 Nov 2015 01:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1p2xOCUuXxVIAW5oI5ik/ibsKiEgLlTA1H6SRyazXSQ=;
	b=cJkgT+GWn+QZbEw/idoGkEh466wW6nhXLS7/up6R8o+BdGyJISQdVsANzDMfqYgm1Z
	f2HaJXbHhCWlOfZit8mhikwPv6M+LZ73GWHQ2gYy+LRSVSavy6ieEDgJSCm/Ap+3DzbA
	L0WoaPJ/+AH0r1+DpwfthTCpbwYzVu1fxBJXuZmbmPzk2+LiAjTFi41XkjlR2lYvk1OQ
	h6jbQdJEA9f5ufI/D64taESN5+v1/3byzo6bPEg6TuTSpo9rQ2+oXR/94WOYdHluk4sY
	M7xM0fZ5KuYaoTWBVFjxxjxFTCSgG0tJvUyFSiL49Rx7tdU7+E8vEXlmnqC8hwmOuDI5
	SW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1p2xOCUuXxVIAW5oI5ik/ibsKiEgLlTA1H6SRyazXSQ=;
	b=nCn/2JAeEsyr2LnhZQ89OPGWSB7hOf8F9Ejcd5wDXKBbo+LRaA783t+xLqVzm2K5Yf
	g55WbJqpu3meyeaP9urKzdMRyYGlBrjfM1kXFVs7tlk3eIRntZVKO1rC2ORrz4IYBPAO
	+GBcLIUYbZgdtI/93kKZ/p0LACxcel7GyhjDQln1xL0keO0IMWOcbffhgDgohBQa2hzi
	nV5YSJE2nTaT+xtfUDXkkaT2tzT/Wsp89Amb5lhmrv/qoMdxJOg0L2gQW52wT2YgKFoJ
	GSjNYSjnxI3HDe+EQ/ckeAorkE/koavJ+Jv9567+bfDzIkvSXa7HJKIS7e3HmGVKxeDB
	OONQ==
X-Gm-Message-State: ALoCoQkXJFpRQjbbPGEz+RqaABU394lr+K+R2rSHzlNhMeU7dPBMcg9kE98x34DnYrv5veuNSOvV
X-Received: by 10.31.138.145 with SMTP id m139mr1539014vkd.139.1447147894862; 
	Tue, 10 Nov 2015 01:31:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 10 Nov 2015 01:31:15 -0800 (PST)
In-Reply-To: <878u67atv0.fsf@blackfin.pond.sub.org>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	<87twovpqg1.fsf@blackfin.pond.sub.org>
	<CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
	<87oaf3jww7.fsf@blackfin.pond.sub.org>
	<CAFEAcA8Rh9ts2r-nMGbNm7Y=SpdxL4gv0ch3CBWOHiHTRMeztg@mail.gmail.com>
	<878u67atv0.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2015 09:31:15 +0000
Message-ID: <CAFEAcA-z6NzyGkXqG27seP9G5c8qAL-MwY0QCPT1qZhfq6DZ+g@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: error_report
	cleanups
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
X-TUID: 0GK8nDAeRTLp

On 9 November 2015 at 18:52, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> Thanks, I had missed this useful improvement to the API.
>> How does it work in cases like this where we don't have
>> an Error* to fill in?
>
> You do what error_report_err() would do had you had an Error *err to
> fill in:

> In other words, you print the error message proper with error_report(),
> and the additional information with error_printf().

...so in conclusion Andrew's patch is correct as it stands
and I should just apply it? :-)

thanks
-- PMM
