Received: by 10.25.205.13 with SMTP id d13csp131849lfg;
        Mon, 16 Jan 2017 09:55:20 -0800 (PST)
X-Received: by 10.55.204.197 with SMTP id n66mr34497422qkl.205.1484589320748;
        Mon, 16 Jan 2017 09:55:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f33si6102975qtf.306.2017.01.16.09.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 09:55:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTBV0-0000lv-6p
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 12:55:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTB4T-0001RZ-8r
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 12:27:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTB4O-0000F0-JZ
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 12:27:53 -0500
Received: from mail-ua0-x22a.google.com ([2607:f8b0:400c:c08::22a]:34627)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cTB4O-0000Dh-79
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 12:27:48 -0500
Received: by mail-ua0-x22a.google.com with SMTP id 35so85910268uak.1
	for <qemu-arm@nongnu.org>; Mon, 16 Jan 2017 09:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WlRdzLSlBaDHuwpddNSuCCiyI7PNqIW0/0JOkn5/wUg=;
	b=Um9Opeqy4AEO/nritfbyE0t5CHUouGFVwrmIS2gOO09GRigD3Kbdg+rGc4ViRCf/UH
	HboYsvUaZmbuesh0Q/dwsB+wubVQ8kA141fkIB3jpK+x1IswC8AffwjSOpzIWJjLX++2
	7cPchW7tpL6xNcurxl2JEOCNEjP32DR1Q36VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WlRdzLSlBaDHuwpddNSuCCiyI7PNqIW0/0JOkn5/wUg=;
	b=bzbC/6xXgXuZWg3bz0bEDtSDuhLe2yEW5+iI8HMR0iR4sSHvm1mx5uKBUQp9839Tx6
	wol1vc95t2pObMq7y2ASjaw8PkGaWI736EaPbfkKPTWijga2htDpkMfed0ceOpep7cJ5
	FX9yu0pQsB/fCv3mhHSVUBYEMgpqmzzn4ZmKGi9G8KoPebA5LAhmZd9NKafuL+hPkWAh
	eDUbzjii/9Xifkz4c68JGcKrd9d8zyPgjbbmczs2ZxjM3QvsZpyhE719+STvpAJqVTsl
	YIvnMW2KIE80sdM6RnqUmkyQS27Dc6+dVZ7TN2MIsEFHnFS0mZ4U0xcrQXhs0tB0xK2a
	5KQw==
X-Gm-Message-State: AIkVDXLuvkTcJnK3p0yfXRvgn2gVjVsZ45LP/xtw8L4rP43IatrxCDCkd4PNp7OEMOkW5vWzDRv28I1UGw5mWjy9
X-Received: by 10.159.48.131 with SMTP id j3mr6905430uab.42.1484587667634;
	Mon, 16 Jan 2017 09:27:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 16 Jan 2017 09:27:27 -0800 (PST)
In-Reply-To: <1484477462-14088-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484477462-14088-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2017 17:27:27 +0000
Message-ID: <CAFEAcA_pKX-v6q2uE-5+mWXYyEfooYCUFu4kVEL1N_DS5yjA2A@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22a
Subject: Re: [Qemu-arm] [PATCH] arm: virt: Fix the segmentation fault when
 specifying an unsupported CPU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y9qwTo/41KJx

On 15 January 2017 at 10:51, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> For example, using -cpu generic will cause qemu segmentation fault.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7a03f84..4b301c2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -175,7 +175,7 @@ static bool cpuname_valid(const char *cpu)
>      int i;
>
>      for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
> -        if (strcmp(cpu, valid_cpus[i]) == 0) {
> +        if (valid_cpus[i] != NULL && strcmp(cpu, valid_cpus[i]) == 0) {
>              return true;
>          }
>      }

A better fix is to just remove the NULL entry from the
valid_cpus[] array. We already have one "stop when we
run out of entries" condition (the ARRAY_SIZE check),
we don't need two...

thanks
-- PMM
