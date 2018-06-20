Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp771020wrq;
        Wed, 20 Jun 2018 06:29:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIQW8Zu1twN2xgK7V5embNnUpkHgJTEr3Y7O+yNswa80B3eUGIKHhEEpzGYFlm6WbnLC4YC
X-Received: by 2002:a37:5f01:: with SMTP id t1-v6mr17259114qkb.231.1529501390777;
        Wed, 20 Jun 2018 06:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529501390; cv=none;
        d=google.com; s=arc-20160816;
        b=DBHOMGhweOaAA1CINNqnGXQvVR2D07uh62o+eS1wapRFzozfpRVPsUP5CvRbIo62oE
         +YVWhykuFs1chh113XEfSLEHnfNQCD/zUqWdM8WDDRnJrRNvifOk8Mp24fNpWPUrqpex
         81MWQryFPwWrPb/v7q8+V2csuc0j1TrQKg3GkcEy06SmH+svdYViBUGrYGSoNs7sDle2
         jC8JvF0dMn80H1arybXT5PpbOYyDyDFGVfDvqBoNYpvZr/DTp93zdJKHKiP1t3OGApRA
         IY34qllWLF6MO0L9LeLclqe8wGoC+/tLt6AarxCkd5LemRsymzwF90JJXYntcSJkbJF1
         KCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Wqtb4O+QELIZLhWbC6fEGkZFlF1Gwhmg+HHDEnt11mA=;
        b=wdZyvuGx9amfM+fg8rSaUWOPbSXX0y+RKb1eirIRHeSmGApW2x3j8Iavve5qtt6tq9
         LW52hhPF1oChu7MghuRC10NdyiEdrdduoBlFia9TuWYISgx3hcpmlfKGJZn8KcbEUc80
         VtKisFRQbimrCBnsL1h50VB3nuj8o4iRtQ6IGAT9aX1n1GgLn43tj2v4TwIbc+/g9ZNC
         UX6wzI2IKe7AJ6XLfiFutdv3LDnUsocpUCmhqhW1ee8f/dnzlkQE+1oDAxlgUcNN19+g
         rr2ndmVtTD2BcSwYhCp4+qz9waslHV5z4c70GbqjC/rTH1KoHhKONbHRXfcspKLuy8CS
         UYHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=izQCkQz9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x128-v6si2342605qke.47.2018.06.20.06.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=izQCkQz9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVdBG-0008Jg-4e
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:29:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVd8U-0005IO-5O
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:26:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVd8T-0005HR-CZ
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:26:58 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:42372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVd8T-0005HK-7H
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:26:57 -0400
Received: by mail-ot0-x243.google.com with SMTP id 92-v6so3670923otw.9
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wqtb4O+QELIZLhWbC6fEGkZFlF1Gwhmg+HHDEnt11mA=;
	b=izQCkQz95jACpS2J+Jo7VtSUUgBtMsdZSe1lD5VErbnmuJ37yus8G7KxyMLJ/eMrls
	hogig4qvg5Vy5mT52GIQdxbb6+4aiCNNWaJbjb1z839sxVT5rTSQhdLF3+wMi/U26dmc
	j8pYRpwPzVzNANDOPK4QnfH4iUGtPlxiedkck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wqtb4O+QELIZLhWbC6fEGkZFlF1Gwhmg+HHDEnt11mA=;
	b=tBwlhdM5mNEEqFMkpzk/C9P1YLQeTDjqaa7Ja2vd7STKD6T9HD2+D6o+VxBrfVgqu/
	GTVL9rX5Mx3kOBMvTc0aoPed0Sq13F2Ryk5HzAKx7muYCAE+Ab9kL5yYlRlwaAAeN6Rb
	m6JpL6RRqaxT+orb69LSL27NYIwbvYkLHc2zPxcGX4AaidZhTDB10OltQzl6LT64eQHF
	vjifbH1BOJVxefikPaIWuNj30BfPngG9EUXch8lZjIBOHR5xOC7bXJ9RK4Md7eVPMoNw
	O5RU75PvKv6/IyaTWRVGHiG+m8M7nJ13nmrBWCeNrsxalcquF3aKl8u4ZC4LY9iahDLR
	St8A==
X-Gm-Message-State: APt69E1IYUrY1j38y+G0ShJxUg35Y5ZSLZ5F1ABRXMN005cR/VHG5rxI
	I17EL+oFFpURnFEGBywf7R5kAIViN9ykoKWw0y3U7Q==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr13900227otd.210.1529501216659; 
	Wed, 20 Jun 2018 06:26:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 06:26:36
	-0700 (PDT)
In-Reply-To: <20180619075821.9884-1-zhengxiang9@huawei.com>
References: <20180619075821.9884-1-zhengxiang9@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 14:26:36 +0100
Message-ID: <CAFEAcA_uWp-M804PSZb8=rDMBz6ci=_j-NC_f=-q-=F7N7FXaQ@mail.gmail.com>
To: Zheng Xiang <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH] target-arm: fix a segmentation fault due to
 illegal memory access
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Zheng Xiang <xiang.zheng@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 25fNjVFzhyi1

On 19 June 2018 at 08:58, Zheng Xiang <zhengxiang9@huawei.com> wrote:
> From: Zheng Xiang <xiang.zheng@linaro.org>
>
> The elements of kvm_devices_head list are freed in kvm_arm_machine_init_done(),
> but we still access these illegal memory in kvm_arm_devlistener_del().
>
> This will cause segment fault when booting guest with MALLOC_PERTURB_=1.
>
> Signed-off-by: Zheng Xiang <xiang.zheng@linaro.org>
> ---
>  target/arm/kvm.c | 1 +
>  1 file changed, 1 insertion(+)



Applied to target-arm.next, thanks.

-- PMM
