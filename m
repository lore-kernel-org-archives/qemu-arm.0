Received: by 10.25.208.211 with SMTP id h202csp1132269lfg;
        Wed, 16 Mar 2016 04:58:00 -0700 (PDT)
X-Received: by 10.55.217.208 with SMTP id q77mr4464756qkl.106.1458129480580;
        Wed, 16 Mar 2016 04:58:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si2956502qkb.94.2016.03.16.04.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:58:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agA5Q-0001eK-7D
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:58:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA5N-0001ba-Ee
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA5M-0000ys-Nn
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:57:57 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA5M-0000xj-KR
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:57:56 -0400
Received: by mail-vk0-x22b.google.com with SMTP id c3so58211973vkb.3
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gCfZsv4DLbZ/Bo7A0iSjmsgdXvKo6vMy9z4nQbT1Qjc=;
	b=OSJxjTr3vnvmSc3XgHqDHXochxriSYmRaLnm3ZNUcgzyrGjXKrd6H/Z0QBWvvrPEOu
	WUJpBdE5FtX/GP5uVQ2uowqFc7USXn3fZA//WngVuYJSA4QHD6qT77EFB6nGK0TPAry/
	sj9HrjDKndgZV5yaLN93maz1kC1X6DYSmbEt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gCfZsv4DLbZ/Bo7A0iSjmsgdXvKo6vMy9z4nQbT1Qjc=;
	b=WOZwNUenGZWw59/RZgCKdb1dHnkm889V7WqPVR5dXAODiUkC/RVfrWXTvJKIwVwpP3
	4WpeCt2Ibvykbn2ieOBriekYLzOxazUg8Pwwenr1DQr6u3KLQkJkloq0FfB8+ZmNgmA4
	aN3udOs/ih1ULj2GYuJTaLM//lISI+cRoGALF3BPYRAzq2YWKgtaWfMehtmjkf0IMvH6
	zWS95TL0HS3QLKPWglODMcF/lxhthdYcNUfOGaQBbGM5157fGWMmtiiNiTFBHHkt1jcu
	CTV9kmmpH1grT/bHZFc/5HD2SSB5KPKofYmzNeNN9K1h6paQNPC4fpGs8LUuHlBwDC2Y
	RWTA==
X-Gm-Message-State: AD7BkJKDOg0kJvO3oIEm9EFzy7GygzWyZvuHDfJf989GTZwejFYKGzwkj51ju9rWTDIyfBABJ4GUlip3pk8FB6vm
X-Received: by 10.31.3.193 with SMTP id f62mr3360482vki.27.1458129475150; Wed,
	16 Mar 2016 04:57:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:57:35 -0700 (PDT)
In-Reply-To: <1457337136-6893-1-git-send-email-zxq_yx_007@163.com>
References: <1457337136-6893-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:57:35 +0000
Message-ID: <CAFEAcA94P9Vppq0bFoq3SsUrgxXDEC3xWWbkE=Ysbd7Wfuk4ag@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 6/9] hw/arm: QOM'ify spitz.c
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
X-TUID: XBnxCrOGUQ63

On 7 March 2016 at 07:52, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Drop the use of old SysBus init function and use instance_init
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
