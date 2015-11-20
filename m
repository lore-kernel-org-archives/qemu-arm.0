Received: by 10.182.158.201 with SMTP id ww9csp578277obb;
        Fri, 20 Nov 2015 08:26:54 -0800 (PST)
X-Received: by 10.31.170.199 with SMTP id t190mr193911vke.66.1448036814359;
        Fri, 20 Nov 2015 08:26:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 71si171158vkc.163.2015.11.20.08.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 08:26:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:48394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzoWT-0001gN-Vt
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 11:26:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzoWS-0001ed-Kw
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 11:26:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzoWR-0000wq-SU
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 11:26:52 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:34502)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzoWR-0000wk-PF
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 11:26:51 -0500
Received: by vkbs1 with SMTP id s1so804573vkb.1
	for <qemu-arm@nongnu.org>; Fri, 20 Nov 2015 08:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aUxOZ+GDgCLmHRvjoe8H24IHJn7lMvDEbRt+CAiaOas=;
	b=UCc4EyRR7IsjNqIej324U6W13PkWjBsDa/h77jrr+sIHXkpWYS4oKoF9a/1eHpfAxi
	2vv9V44G8eE4LC+l41lgG4RnP7Qb5DdnWQL4tK+Zdtyxvc9ViyqdMKm8y4ZSlgV6zTzA
	nsOQFAHWeygl/UZk2bE46ZOBMFsyNyNmlTXcHK5pNfQFYfWs/SVcLZTGb46pjBlsjnLr
	1Jjm9FIxAAsYS0RH7IAoSQf12jlLT7LWhKGemh5A5csA8FAmE0g8ZywNINNbp7ZhPYfw
	+6o0g/MhwD28rvplLTY5A8CGSDdiymmGrUSwZY6CnW96XZZuFqm/jdbhlA7R49Z4Ipf+
	ypTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aUxOZ+GDgCLmHRvjoe8H24IHJn7lMvDEbRt+CAiaOas=;
	b=K9ujC35ioi0vZoufZ493Ta+Q7w2Hx69oG4VKMLlT+7gm5kv4k1f6xZ85Y/YZ20Z1kb
	bxXcr+1syLxaWep4U66p4c7Bv16so4TDHQC7tUpUuUW8cvAODCxQGseWrNdWDu30mfR/
	W9sUwM2ClNxcecjU0hj8OlmV5aiOdIDSbgS9b9ZKUMUPDW/j9G/q/m0iH/zzmOGEiCWP
	S4E2XnXNAoO/w6Qeo3n5ckLwC2HNlH3n/5yKmxh6bFOmwYtz3mAfUFDIW3+f5fmyf0Ew
	CJp62LbsftHBL38JzPEu5TIxptY1ttgXBqe1KvCGVjwLJxjVIeQrfW1E//NT+ZmVsGbP
	xvgQ==
X-Gm-Message-State: ALoCoQlGptUvW0JW4sOmVAON7+x9AZ+Q3sTtntrdixPRQGdgHIYVLAe2ZovwfAI//MWqVu4FdcmE
X-Received: by 10.31.131.201 with SMTP id f192mr198949vkd.90.1448036811431;
	Fri, 20 Nov 2015 08:26:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 08:26:32 -0800 (PST)
In-Reply-To: <20151112150423.GJ4180@thinpad.lan.raisama.net>
References: <1447278167-320-1-git-send-email-ehabkost@redhat.com>
	<20151112133747-mutt-send-email-mst@redhat.com>
	<20151112150423.GJ4180@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 16:26:32 +0000
Message-ID: <CAFEAcA_4LmM9pH4HNv-XUGjzmnj=rEJe=sKbN7M1JEREn_uX=w@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [PATCH] nseries: Don't use qemu_hw_version()
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
X-TUID: Q4gvBkPCTLDf

On 12 November 2015 at 15:04, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Thu, Nov 12, 2015 at 01:39:24PM +0200, Michael S. Tsirkin wrote:
>> On Wed, Nov 11, 2015 at 07:42:47PM -0200, Eduardo Habkost wrote:
>> > nseries doesn't use qemu_set_hw_version() and doesn't need the
>> > compatibility magic of qemu_hw_version(). Use QEMU_VERSION
>> > directly.
>> >
>> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>
>> This looks very wrong.
>> We should be reducing the users of QEMU_VERSION,
>> not adding more.
>
> I would like to hear from the users and maintainers of the
> nseries machines, to judge this. I assume they don't need ABI
> compatibility betweeen QEMU versions, and maybe they want to know
> the QEMU version they are running.

I suspect you won't find many users or maintainers on this
list (or anywhere else). My guess is that this was useful
for when Nokia were actively shipping an SDK that used QEMU
(because then they could surface the QEMU and other component
version information to SDK end-users and get better bug reports
and so on as a result), but that anybody still using upstream
QEMU to emulate an n-series device is capable of reporting
what QEMU version they're using without having to have it
reported via a dialog box inside the guest :-)

thanks
-- PMM
