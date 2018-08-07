Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4286675wru;
        Tue, 7 Aug 2018 07:45:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfHINgQ5dvsQlGqVYYNbfLQOd0AF3SgFkZmeUfberuX4Rk1YqdwTZa/alX1spVkkZKpGRAg
X-Received: by 2002:a37:d49b:: with SMTP id s27-v6mr17635780qks.220.1533653142658;
        Tue, 07 Aug 2018 07:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533653142; cv=none;
        d=google.com; s=arc-20160816;
        b=yRv5qqt9D+VeBfami6Ec+1aE9DAcwTD2bj2x7u6cana2szgmc5scqjWTe8hv5Ge3I6
         UNtqBPGBzC8lR8R6J5NtlwfZcYP8Uum62CD2YgV+hqRjeawTz3SyDACe14GQ5WH+vz3J
         IaDCiNSrx0Kw00CcYSprRhDKB1hmN3quZhYkd69Oauku+jFChJFZGYxqOeXH73LKTDwt
         zkK8Ha4nZXwJPMYGuPg8r8Y9Tbe+bQglim0X2FIHXhvHV+HcvQRcS50oKKTKSgSHXc4K
         Ex59ZpvnEnAD5pu5ozC/vLiR9+ioYz19ze+gN6LZMFYTNV+lIQnMNlwhB+fJzsT/aYcg
         h8mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=WvsWdi4BntQzLbq85G8Vp5CkWOZu0i76YuCMs53bSqg=;
        b=VVKh+6xhG8b4Hw8dcKAaQhIFLCPw/+ZYO75/s+Dux35qa0Q+nmmdB1tD4+uYqVdnIl
         COql9CmqqzQMJ7vKqPTDh50dvfGU6CyEbQzyssGxi1cI3M8kyPqKTn7LKt+bu2ZDgfc1
         LfUxztVgOFYRELy1fwU9Ze3lDR18wt9k+/vZI0AAS8YpnqmWlgcJDUlFacLJy2j26dLP
         7opIIzQ1my+wchEfGjAw/I/ES8tqGd3AVc1/7SykPixARQIig1Akn6m8zfKj/8v+dVEO
         pe8+SmSMb6WHFIG3OR5/axnZeCudftKnPmSDAYMS6ZVVVhsRr6mmywQzqSLygN2CMqjl
         aztw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J51nf0MP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h41-v6si1594363qta.97.2018.08.07.07.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J51nf0MP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn3F0-0003NY-60
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:45:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fn3Ep-0003N3-Lc
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fn3Eo-0000G8-Ps
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:45:31 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:45011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fn3Eo-0000Fn-Jn
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:45:30 -0400
Received: by mail-oi0-x244.google.com with SMTP id s198-v6so28812722oih.11
	for <qemu-arm@nongnu.org>; Tue, 07 Aug 2018 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WvsWdi4BntQzLbq85G8Vp5CkWOZu0i76YuCMs53bSqg=;
	b=J51nf0MPqBxwBrkQPIaYHvmYS04uYcKpoZkmEyFtLIHS8Wg7b6PrAz7HU71ZXi9S5z
	ImdhisDTqKCTZ6i4T2+qWfdkVD7NFRizQXSK/4PtjFF+yDCWtRLCQ8OW1BAbrJY+JjEl
	fYc38llei7lHZ0dGugbTJNTUSiHmmS5lbCgKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WvsWdi4BntQzLbq85G8Vp5CkWOZu0i76YuCMs53bSqg=;
	b=fohve/AQ7UGKHdVNMvjzrO4Urqo9Vi/LN/GkpBzmyq4NAObxz3o49bpj7xip82paeF
	za1RPaXmCG+lhsS0qnKBk+IxH+yeSM7PUk4NG8Ag6eYwFfHhZt05FKpu660dVnIPJ1cL
	2gxV1CFJbrOGOaO3DjEpivjk1I09HJpkobYxrsINr1Nb8tnfKw0RogkfeMUm6TqTA0Hy
	XGh9WAZz/l9tYorGICzElnn+bXkir+wQVjoFhp0ngCHSBTqbfnIRiXivw9S/Gx5aFphI
	YWjg4P39NB1hurm87ZeDZsrPIRUOv/1mA+bcDYAMgwGmED12NGlGxHQLCYsFrlW6zGJF
	tgJw==
X-Gm-Message-State: AOUpUlHxRsl+r1dzK+Fe6p2skSRfKYD0pFH3D/Bu2Uu4+JUipgS6f9/S
	8kOQe4iWvjSBGtjDoS2eDSIs3OlXJuYhMZ8Gm/q4bg==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr20451474oih.102.1533653129931; 
	Tue, 07 Aug 2018 07:45:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Tue, 7 Aug 2018 07:45:09 -0700 (PDT)
In-Reply-To: <87600m2qb2.fsf@trasno.org>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<20180806123445.1459-4-peter.maydell@linaro.org>
	<87600m2qb2.fsf@trasno.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Aug 2018 15:45:09 +0100
Message-ID: <CAFEAcA8O-SL4Bg4ar3QLLFCPcF8A7W7mRu4D8bbXvJkFUsXTKQ@mail.gmail.com>
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH for-3.0 v2 3/5] target/arm: Add dummy needed
 functions to M profile vmstate subsections
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1+Uxl1sZ/gXx

On 7 August 2018 at 15:40, Juan Quintela <quintela@redhat.com> wrote:
> But having 3 subsections with the same needed function ... we could have
> a single subsection.

I wanted to keep the change small here since we're very
late in the release cycle, so I kept it to a change
that restores the intent of the code, ie "always transfer
the subsection".

thanks
-- PMM
