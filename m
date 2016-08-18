Received: by 10.25.21.156 with SMTP id 28csp356084lfv;
        Thu, 18 Aug 2016 07:47:54 -0700 (PDT)
X-Received: by 10.237.36.173 with SMTP id t42mr2828087qtc.89.1471531674904;
        Thu, 18 Aug 2016 07:47:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o84si1446171qke.190.2016.08.18.07.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 07:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baObq-0005OI-EB
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 10:47:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1baOar-00056U-RV
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 10:46:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1baOal-00029F-Pa
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 10:46:52 -0400
Received: from mail-it0-x230.google.com ([2607:f8b0:4001:c0b::230]:38255)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1baOal-00029B-KE; Thu, 18 Aug 2016 10:46:47 -0400
Received: by mail-it0-x230.google.com with SMTP id n128so19176692ith.1;
	Thu, 18 Aug 2016 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ryk6tSnqDaTM2khS+dxkCu4Ddn5EU17XpHsXqZDyH3s=;
	b=B6Rz4LLxdZvmu1aiTFzSXB6YU1krNbhWSO52zZGvnLNW5z9uYUeWlWwEoXEoyJat28
	+yxO6oMzp9YpNvRUMBLAqELEPlDsbkj1Io5WUZSHBTW5RgV/WdpaXNpZWOJVGztYMufS
	Rz5EDh58RFzcLXe4fkP0u8uUqjp51eFwUxJ2oUgcyJ/nmQsT9C0XnVBECtMdOmKyZS29
	kVCGdb2Brt0V1xv0+ZjvjGrnQxGKIGaWcO+fMCiN+/yMTzGjxIOG4U4iMfzuf40Qw5aD
	lgATk4PZPYgQD9HqPWZ7Q9FrIZUlbPuPJZTLOzhDbFHlAJWW7mwN9AtEg8s9jMXsSh1D
	0Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ryk6tSnqDaTM2khS+dxkCu4Ddn5EU17XpHsXqZDyH3s=;
	b=PccvYjLU9YnA3AWbgU4vRab0oaNBevrJWTUPSSPRPUePXstzQiBD+AqMaCDfYIs6O3
	s393E8nD7W08PDOtVj3Ow69Ri+8nd9xRQNcBJFE5ACM1ZTJQQ81lcktwXUrizfzN1zic
	u96hBabqdE9qpIrtifaIaxPYM5bE7EiwYriGqEPRA+LWY0QM0vF/6e+DfvQ05VGa4WxN
	eBwkgK2aLEYvM8PILtWDTicO3a6ftAOv5XBGfS3gx1+cRWJbT/Htd9/ye0FocSr8ZviR
	6CALeoogLNa7YPQYcUCckkxWC67fejrTM93fh3s4/Tjeg0gLuBxL1+8ZYoEh2elcEKNM
	6C8A==
X-Gm-Message-State: AEkooutcK2gA0K017T20xVur4hRyWnWxcQh3Q+g/Z65QAvJmql7R02DV+H8894PmclH6+A==
X-Received: by 10.36.124.141 with SMTP id a135mr3572240itd.25.1471531606906;
	Thu, 18 Aug 2016 07:46:46 -0700 (PDT)
Received: from bigtime.twiddle.net ([208.95.30.164])
	by smtp.googlemail.com with ESMTPSA id
	j16sm1247991iod.25.2016.08.18.07.46.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 07:46:46 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
	<CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
	<59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
	<CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
	<f5f56ea7-795e-81d3-6892-f30772631e53@redhat.com>
	<5e34688d-af70-9fed-33c7-96d86868d1a6@twiddle.net>
	<CAFEAcA9J1_xGV7ScRzPNdU0qVa5nREa1ibPVHZgA8Nj7FXeGgw@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1d77e7f0-61b6-5533-f0b2-04eae0fed815@twiddle.net>
Date: Thu, 18 Aug 2016 07:46:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9J1_xGV7ScRzPNdU0qVa5nREa1ibPVHZgA8Nj7FXeGgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::230
Subject: Re: [Qemu-devel] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: "prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b+ktUBwQ+uDY

On 08/18/2016 07:14 AM, Peter Maydell wrote:
> On 18 August 2016 at 15:04, Richard Henderson <rth@twiddle.net> wrote:
>> or (2) ifunc
>
> While we're on the subject, can somebody explain to me why we
> use ifuncs at all? I couldn't work out why it would be better than
> just using a straightforward function pointer -- when I tried single
> stepping through things the ifunc approach still seemed to indirect
> through some table or other so it wasn't actually resolving to
> a direct function call anyway.

No reason, I suppose.

It's particularly helpful for libraries, where we don't really want the 
overhead of the initialization when it's not used.

But (1) we don't have many of these and (2) we really don't care *that* much 
about startup time.

So a simple function pointer initialized by a constructor has the same effect.


r~
