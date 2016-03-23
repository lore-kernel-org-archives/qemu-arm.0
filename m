Received: by 10.25.208.211 with SMTP id h202csp128707lfg;
        Wed, 23 Mar 2016 09:13:14 -0700 (PDT)
X-Received: by 10.140.138.209 with SMTP id 200mr4931303qhk.100.1458749594393;
        Wed, 23 Mar 2016 09:13:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e32si2690017qgf.67.2016.03.23.09.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 09:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ailPF-000262-N5
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 12:13:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ailPC-00025j-Pl
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 12:13:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ailP9-0006og-0b
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 12:13:10 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ailP8-0006oS-RD
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 12:13:06 -0400
Received: by mail-vk0-x22c.google.com with SMTP id e6so25579998vkh.2
	for <qemu-arm@nongnu.org>; Wed, 23 Mar 2016 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5qfz8V1Lv1F8g8dPLSaNq1N686vYLwhbIar65khy170=;
	b=eAzCDqh/FPPbmBPZt62pmT7CR3wKUJ2RmNMrgSJ5Y9YiyLi+2J9ez/D1bEWZ8o06oZ
	oqLfHuFFcwfFED23cNvsdiLq4teJ1Buv6HfOt4D7OsqN/Pi2jH9+k4FkAST7HFqUhOyD
	SE5FwwMxuIourh+t1wjXsEHdxBCkiecP0IcW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5qfz8V1Lv1F8g8dPLSaNq1N686vYLwhbIar65khy170=;
	b=FTgfIvkywjSnyn2QzFao1iiMW6WUPsXYIjPSu+xg7+oZ1DSKivVgQN+5G03ySHUaf0
	GcrKzVw8lHT4hidhEyy2VQgBOYr3Qoy6v7wTlUdZBRErc0jzR+D8JAy2K0NhIFaLmjw5
	ReNYUXiqJRz0KDNVLADUJg+vn9mAQlnQO/hsziAUvTa5fqEdEuwy8xmb11xGIKHEMUpn
	pe6daLL5d4At/fTAhF+tB9i7zC4Dr5jOr9iBoFdGpj1as/huHq52ZmjRgLexsMot2sWD
	CJhwpMolNFZ5osp6YMsJQRIaPNyHTP0HhMHP7h1ByeEoKg5HTzTwWTSp3j9UU17OdkLF
	hsxg==
X-Gm-Message-State: AD7BkJJWxTsjjMCA7P/DbKkaMjGcmCzOczvS7umauDsMgRnBMFKDV6uJAFJ97DcaKfeparNwaPZhTjl4lNPwDCUu
X-Received: by 10.159.36.72 with SMTP id 66mr2019948uaq.125.1458749586166;
	Wed, 23 Mar 2016 09:13:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 23 Mar 2016 09:12:46 -0700 (PDT)
In-Reply-To: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
References: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2016 16:12:46 +0000
Message-ID: <CAFEAcA_7ww3PBQ5Mf=ax69B2i6zOx4-pDaiEUVerGG5iru-pJg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: "Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 0/2] Add gpio_key and use it for ARM virt
	power button
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
X-TUID: MxCe5ILAR2L3

On 17 March 2016 at 13:25, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> There is a problem for power button that it will not work if an early
> system_powerdown request happens before guest gpio driver loads.
>
> Here we add the emulation of gpio_key and use it for ARM virt power
> button.

I tweaked the type names to be 'gpio-key' rather than 'gpio_key',
and added a comment to briefly describe what the device does:

+ * Emulate a (human) keypress -- when the key is triggered by
+ * setting the incoming gpio line, the outbound irq line is
+ * raised for 100ms before being dropped again.

Applied to target-arm.next, thanks.

-- PMM
