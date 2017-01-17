Received: by 10.25.205.13 with SMTP id d13csp452604lfg;
        Tue, 17 Jan 2017 03:44:25 -0800 (PST)
X-Received: by 10.55.161.212 with SMTP id k203mr37951722qke.234.1484653465794;
        Tue, 17 Jan 2017 03:44:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f47si16363348qtc.221.2017.01.17.03.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 03:44:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTSBb-0007hS-D8
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 06:44:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTSBU-0007h3-71
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 06:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTSBT-0003KO-1v
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 06:44:16 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cTSBS-0003KB-Tm
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 06:44:14 -0500
Received: by mail-vk0-x230.google.com with SMTP id t8so90383050vke.3
	for <qemu-arm@nongnu.org>; Tue, 17 Jan 2017 03:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mi5ghCKXBTxQnY/vKip0j8s+T5t9GZ2it6rLXPNziQ0=;
	b=Uox4n55VETFIudwVhc/+Fwx5PYGvBV1PapNPsrIQI/Isf4CxVwJVFETWCtEpiPEvPj
	TUe9SjtohuZ5NDpezV9XUx7Ijr2Ywi8PYf899vJf5BfLTq5rkFtwQ0c80MiBLHGiF+6X
	pDz4DgYCTkQRReU+KXZgedMEsM1cyx47DHvaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mi5ghCKXBTxQnY/vKip0j8s+T5t9GZ2it6rLXPNziQ0=;
	b=K03IjFA0udVeZqMiYKUxIwWS0ZKSf0jj46zP9rtRvaDJzzrmuRc8S/hecVggJGF1Lw
	nTXdpwsk+ZgR+oQGK8wie1jH9s1rS06lcFSlXE6+T57uV3I8kC6uJUnWT5VFItUTujLG
	IFEOIiksellFFnwBhACT8v93kw2+oHmqBuyBEMrJogry56Mypcw4YQFi81qwUz5oMfk2
	6mBJ3lcCbHfCqG0AVP1vXsyjZBKDgDjmjQld3bBTdpnQ8hM/1k01DgVp2EKkzv/fyEIs
	rmFNbW19yK5Df4x6qAY828992chpOEpA1/ueb+P+NDY4NRNTdIaZdz/BSKle0a/wacD4
	yfig==
X-Gm-Message-State: AIkVDXIiTGROKAYEUA13HAC8wHePk+6EUQCXWL8EPB7eYVmKR5lv2/MB2oXmif3UmVJc1oFZxoanqCRKze8VTKJK
X-Received: by 10.31.73.198 with SMTP id w189mr15193715vka.170.1484653454260; 
	Tue, 17 Jan 2017 03:44:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 17 Jan 2017 03:43:53 -0800 (PST)
In-Reply-To: <1484619334-10488-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484619334-10488-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2017 11:43:53 +0000
Message-ID: <CAFEAcA-2iqU3Ni_yabu93e1tvJ0YNiyANhf2Vb5FtDT1MtF_nA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH v2] arm: virt: Fix the segmentation fault
 when specifying an unsupported CPU
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
X-TUID: v7WSn5yamuEh

On 17 January 2017 at 02:15, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> For example, using -cpu generic will cause qemu segmentation fault.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
> V2: Just remove the member NULL instead of checking twice
> ---
>  hw/arm/virt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7a03f84..95ac585 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -167,7 +167,6 @@ static const char *valid_cpus[] = {
>      "cortex-a53",
>      "cortex-a57",
>      "host",
> -    NULL
>  };
>
>  static bool cpuname_valid(const char *cpu)

Applied to target-arm.next (with some expansion of the commit
message), thanks.

-- PMM
