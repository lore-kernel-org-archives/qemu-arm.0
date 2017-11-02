Received: by 10.223.161.27 with SMTP id o27csp2214133wro;
        Thu, 2 Nov 2017 08:08:56 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TVxVVkfC3x3K8rsZIQUAE/Pn+REv+Bd3P4UFRHLfN9TYUW9sFmx+spzCNsaULY4/dfBz64
X-Received: by 10.37.55.71 with SMTP id e68mr2345701yba.369.1509635336174;
        Thu, 02 Nov 2017 08:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509635336; cv=none;
        d=google.com; s=arc-20160816;
        b=YSl9h0bpMJjC/0N9lQ0yT3FtEDSHLevyG+51OXPytf7x8BFGS2sfFi3gWqldlkbGV9
         NySk2q/gOM9q2ScrvjZPjJodA9I6v3ZTouWZ/MIpGr7LwtOk/6p5Up47n67xGqL8xw4z
         o4nKhEmMSItpDQI8at/wD59NN27V+yXhTQT+gEe82wXcUozsI/jQ8l0NTY6Xz8Mhlbf2
         s0sHeXtDMdPiYA/WfLE4XoWu25wCoFn9B0OY9Zvd809Uon8DlczvFw81WAIapqA2w3cP
         C0hfP9Nq+OjUQz7U8B6bbpAkrjE9ES+JGLFDEPzDx+gDFOnOYZSX0vZyIvyJKDnkz8NU
         SVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=acWItrS8zp+T2MnhHjg/pUCZR9CGz5vRaVr97dtpUr0=;
        b=dKws2Df/FXKd5M07BKyCOu3gnSbWlk8zoPwByAm+/z4YOKseVQqlqmScgWizfvNA+k
         o+W4CzOFWssSveaNM3vHBulicuj4mK6nhn9J4Kh+279KjyOFqvf2SwfRvckLDFmtScuZ
         hWMnDmu39nLxxkqGuXN9iX8+inGzyXs8NLtLVFgS7k/f3snzGMaA9zuMU2GwRpbwbOvo
         fiLvdO4RJM1iIRs+XQsAU2UViUL48TdnDVUWay93sPL3rHltcLv/lhFHpEwYgGhgNJUJ
         AeWChU16XaDDoUmjvZ9Y46DWAQm0CWBkvto7NHyvwZCuB0DQX1XyOcwap5shThDc9wBO
         cu3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DAdIKKTg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4si801884yba.390.2017.11.02.08.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 08:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DAdIKKTg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAH71-0006Jo-LT
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 11:08:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAH5t-0005eZ-LD
	for qemu-devel@nongnu.org; Thu, 02 Nov 2017 11:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAH5s-0005lo-Rb
	for qemu-devel@nongnu.org; Thu, 02 Nov 2017 11:07:45 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:44996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAH5s-0005jX-Lk
	for qemu-devel@nongnu.org; Thu, 02 Nov 2017 11:07:44 -0400
Received: by mail-wr0-x244.google.com with SMTP id z55so5339830wrz.1
	for <qemu-devel@nongnu.org>; Thu, 02 Nov 2017 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=acWItrS8zp+T2MnhHjg/pUCZR9CGz5vRaVr97dtpUr0=;
	b=DAdIKKTgKRAUltA8U95B0oKe8xsPk9gPuTU6u5lTwMN3UG+tOcoFcmVgJkn1dU0cwn
	n4oxJuCVcbycA2XGar1GET/sizq5C3dE3xJ/ptoW5lCulKQm6VSlmlsQwOWoW/NYam04
	Twdskwf1oQ0knfd3xOL8l2CAM/tvLDMzn5aBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=acWItrS8zp+T2MnhHjg/pUCZR9CGz5vRaVr97dtpUr0=;
	b=rLSQe5kZ/9OpZXFt7igI84dPvlbuOvQlU6XXpO9Hc1neHkppDbsZ3xyJ0N7+BN4bbX
	3RvDwGTy12ImYMZ695KcWn/ijAK/VuucPuOlclUNNu+7/7Pe3zaq7yT2tPOT/HghU6Z+
	YhZo0qnzOLZ6cNn8yYpgX2e2txS0DHd1uZkBYmMGEjjrMQnS9IhMXpkYA75shKkForD3
	6Z9+5nQSte4qI8+Svv0b7gltPAyuqgKqvE+dyeXANFnxwrk4Z4cU/FNmtCl8ls4aXtjO
	oDCzRxIa3WwO8uD0BlnKEp1Tcm5RTD480TAnycwNE5Vik+9mhjf0wvJIGXhI48JjvBpb
	SEYw==
X-Gm-Message-State: AMCzsaWEuzKG3Xnl9URJofqFmT2gk7pB+t0cSejX4k8/2fLsqi/+WhiK
	taneDjnHc4rO/5wnIDbTUjXilfSwNwK0LyOz6tCzgw==
X-Received: by 10.223.171.161 with SMTP id s30mr3118201wrc.194.1509635263680; 
	Thu, 02 Nov 2017 08:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 08:07:23 -0700 (PDT)
In-Reply-To: <1509519537-6964-1-git-send-email-thuth@redhat.com>
References: <1509519537-6964-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 15:07:23 +0000
Message-ID: <CAFEAcA9e7GAMmHjp9-nOy5AAiZL+CnW_OUbg89LpaT=3AoDnoA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-devel] [PATCH 0/3] hw/arm: Mark the "fsl,
 imx" devices with user_creatable = false
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9hf9bzo79TZz

On 1 November 2017 at 06:58, Thomas Huth <thuth@redhat.com> wrote:
> These devices can not be used by the user directly and cause QEMU
> to abort() if the user tried it anyway. So simply mark the devices
> with user_creatable = false to avoid that the users can run into
> this unpleasant situation.
>
> Thomas Huth (3):
>   hw/arm: Mark the "fsl,imx6" device with user_creatable = false
>   hw/arm: Mark the "fsl,imx25" device with user_creatable = false
>   hw/arm: Mark the "fsl,imx31" device with user_creatable = false
>
>  hw/arm/fsl-imx25.c | 6 +++++-
>  hw/arm/fsl-imx31.c | 6 +++++-
>  hw/arm/fsl-imx6.c  | 3 ++-
>  3 files changed, 12 insertions(+), 3 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
