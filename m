Received: by 10.25.87.130 with SMTP id l124csp519339lfb;
        Tue, 6 Sep 2016 03:41:53 -0700 (PDT)
X-Received: by 10.55.191.67 with SMTP id p64mr41902558qkf.44.1473158513244;
        Tue, 06 Sep 2016 03:41:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m64si20875656qkf.253.2016.09.06.03.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Sep 2016 03:41:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhDpA-00035f-LE
	for alex.bennee@linaro.org; Tue, 06 Sep 2016 06:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhDkf-000829-On
	for qemu-arm@nongnu.org; Tue, 06 Sep 2016 06:37:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhDke-0005EF-Cl
	for qemu-arm@nongnu.org; Tue, 06 Sep 2016 06:37:13 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bhDke-0005Dx-8p
	for qemu-arm@nongnu.org; Tue, 06 Sep 2016 06:37:12 -0400
Received: by mail-vk0-x22c.google.com with SMTP id w64so7403492vkh.3
	for <qemu-arm@nongnu.org>; Tue, 06 Sep 2016 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6jTy0Avqtgq5MSbvI0/D9nO+5fzgs6jWCZ6Ksr41/1Q=;
	b=N5BwulNHS3Gi1dY5XxNNfIMChww8GOjS/ENhOEp8xZVWkxa3LLTyXjNw++cPsyfjyH
	aF7GVAEjIRfwJSehWEd9ZVDR5/F5Np8uVor3ij2Up7oIytsU65WHZ/kgqd4ns+xukA33
	bCtWQRczwEyQj7yjSThwEk1kQ0bmZoVAZYglg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6jTy0Avqtgq5MSbvI0/D9nO+5fzgs6jWCZ6Ksr41/1Q=;
	b=lyQcXhj1Dc0S6ZUUv9fYghl6Qrg5IJW6TCIOLxYkghQDCccobzMH5Jy6mR6QY+SjLK
	28AuhYNPiFLctE9Q7llPcuWYzByBoabvo6hscZoAJFvYFuTD2Zwjrf/J48ee7IVTXGyi
	zmoFjy3oqkedgctIH4kPFzhp77te3L7SGQwnOSfzlwnukpXM6dGsjq/6+Xj5qgtaZ2zI
	uC/aktj5iYpeXZ4QWBLIh+nBcIowCbNesUCpNWc939eY8brmojqn8O9/FRB0e4hj9I9B
	HufRQT2stekDmEWdbgVn2dkWhuKy30FlcBYJboxrYMHULOGx5GLwYK25hsCv0WSVA2BC
	6PTA==
X-Gm-Message-State: AE9vXwN2iVBZFaDxHOQFwodvGNCnLehSkZ8kNDHfKGsglxAAKb986N280fIy2ddqqqvMontrFXlO8qv+1GrNWX+G
X-Received: by 10.31.41.20 with SMTP id p20mr1726926vkp.6.1473158231832; Tue,
	06 Sep 2016 03:37:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Tue, 6 Sep 2016 03:36:51 -0700 (PDT)
In-Reply-To: <d954c190-79a1-d413-c4d2-2f425fad9ee4@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
	<CAFEAcA-vNVToZ1gONUhUxa-2zwEVmd_sVSJOTLzH6ry+OnxS_A@mail.gmail.com>
	<034e2688-83f6-23df-4e4f-da68ef1f580a@gmail.com>
	<CAFEAcA9_ihKX0N4J02+yqkqAYU_h6EsHNzK-2dYubrVxBaoNEQ@mail.gmail.com>
	<d954c190-79a1-d413-c4d2-2f425fad9ee4@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Sep 2016 11:36:51 +0100
Message-ID: <CAFEAcA-SEGFSQ5C3NnvdupDuRQHtHp5P5m+3VeS4xBH5MmynFA@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH v15 00/15] PTimer fixes/features and ARM
 MPTimer conversion
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nXoh6/Ydc1h/

On 6 September 2016 at 11:32, Dmitry Osipenko <digetx@gmail.com> wrote:
> On 06.09.2016 01:12, Peter Maydell wrote:
>> I had a look at the rest of the patches, but to be honest I found
>> it very difficult to figure out whether any of the changes were
>> making the right changes or the wrong changes. So it's not clear
>> to me that "silence the warning if running under qtest" is right:
>> why is the warning being produced at all?
>>
>
> The ptimer tests cover all ptimer behaviour cases, including the cases where
> ptimer stops because of the error condition. This helps to ensure that further
> applied ptimer patches (like new policies) are not affecting old ptimer (policy)
> behaviour, including those error cases. So the warning message is being emitted
> each time some of the ptimer tests checks the error condition behaviour.

Oh, I see. Right, that's certainly OK to suppress warnings for.

> If you have any thoughts on how to make review of this series easier for you,
> please tell. I'm open to suggestions.
>
> BTW, I'm going to turn "Fix counter - 1 returned by ptimer_get_count for the
> active timer" patch into a ptimer policy. The patch is correct for all of the
> current ptimer users, however that "counter - 1" feature could be useful for
> some of the future added timers, like nios2 timer [0], and could be already used
> by some of the QEMU forks. So it might be better to retain old behaviour for the
> default policy.

Yes, if the patchset didn't change any behaviour for timers which
didn't request a non-default policy that would definitely help
in making me more confident it was safe.

thanks
-- PMM
