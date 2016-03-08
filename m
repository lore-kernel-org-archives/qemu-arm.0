Received: by 10.25.208.211 with SMTP id h202csp1895783lfg;
        Tue, 8 Mar 2016 04:16:09 -0800 (PST)
X-Received: by 10.140.94.106 with SMTP id f97mr34668175qge.95.1457439368388;
        Tue, 08 Mar 2016 04:16:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e82si2666915qhd.116.2016.03.08.04.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 04:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adGYZ-0005pO-SU
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 07:16:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGYX-0005on-Ft
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:16:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGYW-0006PQ-Hs
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:16:05 -0500
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a]:34715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGYV-0006Ow-Ay
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:16:04 -0500
Received: by mail-io0-x22a.google.com with SMTP id m184so23550928iof.1
	for <qemu-arm@nongnu.org>; Tue, 08 Mar 2016 04:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=fQ73YtBywoz552L1m798fKRUESFFPvOFDfiVyxwk9eg=;
	b=UJ9HOXBUvYQQ2PyVjvTKRfEQgGfWbGcaTcntYRwa0tB0rmNdyu2YQVLB6Mfweb1PQy
	oOnvuMnZIrxwRb//tNIhugwwjh5hmXfchg0ypSQBNtMZItxwneC6u9SBqJ6OErz/832c
	fPq7XTkIJZOAyWq85Jn+YiKr+vXd870Zc8Dqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=fQ73YtBywoz552L1m798fKRUESFFPvOFDfiVyxwk9eg=;
	b=f6NkNz9nFmohqDDPVHga3rpy7upl4Dl4V9qS98v1KUmc0coRIW4gwXHhrE/gNU/bAN
	tyF53gzY7wxDTkCWBprE8cA6RAYz8qesuwVciRtt5G+8OusCkchqQs3gB8B3fCQ+Hf/T
	JNMFAZNmBuBPQatR9IJ7gDUoFcqkR7fGXijulwSwRxCoE+oVTpzSyKlAevbvuqEwY6TC
	XYefD0BdgG1pXMBAYkLjPcddT93hHnTwkD0HArvwlhlDzY6M8VOTB285YJUsZZVXV+je
	L1K2ccB3cuWGKKqDweF5r+xTL57ZoLPt1dzuxb5uep1MIFs6wjLL5Cqtu/EYIZAi03TV
	vjLA==
X-Gm-Message-State: AD7BkJIGf05IneQp9vgwz5n+vn6efomyWG++Xqe3NKzNiyrQRo1elSDJW+ZgKf8t2ibFu2v0jgPIKNPqky9aY7d8
MIME-Version: 1.0
X-Received: by 10.107.18.214 with SMTP id 83mr17196592ios.130.1457439362938;
	Tue, 08 Mar 2016 04:16:02 -0800 (PST)
Received: by 10.36.29.6 with HTTP; Tue, 8 Mar 2016 04:16:02 -0800 (PST)
In-Reply-To: <56DEC234.70907@redhat.com>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
	<CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
	<56DEC234.70907@redhat.com>
Date: Tue, 8 Mar 2016 19:16:02 +0700
Message-ID: <CAKv+Gu-joM8MqtM=G_F7NLZEwpxLBMPeqimDwZv7yivTjYBFVQ@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::22a
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
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
X-TUID: wQ9rme1md8SK

On 8 March 2016 at 19:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 08/03/2016 13:13, Ard Biesheuvel wrote:
>> > As far as this QEMU port is concerned, having some flash in secure and
>> > some in non-secure is going to be useful regardless, and 64 MB is
>> > plenty for both the code and the data. So if users of the Trustzone
>> > port (which is disjoint from the KVM port in any case) can tolerate
>> > having the code and the variables in the same pflash file, I could
>> > simply move the code into the second flash, and we could reserve the
>> > first flash for secure (so it sits at physical address 0x0
>>
>> Uhm, actually, the code is not even in the flash to begin with. So
>> having the second bank be non-secure only makes perfect sense imo
>
> Interesting, where is the code?
>

The UEFI code is loaded into DRAM by the secure firmware, and
relocated and executed from there.
