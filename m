Received: by 10.25.208.211 with SMTP id h202csp2377077lfg;
        Wed, 2 Mar 2016 13:36:43 -0800 (PST)
X-Received: by 10.140.102.232 with SMTP id w95mr35918610qge.21.1456954603432;
        Wed, 02 Mar 2016 13:36:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si4442883qkx.21.2016.03.02.13.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Mar 2016 13:36:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abERm-0003DW-Vc
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 16:36:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1abERk-0003Ai-3g
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 16:36:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1abERg-00084O-T3
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 16:36:40 -0500
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231]:34030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1abERg-00084D-Ld; Wed, 02 Mar 2016 16:36:36 -0500
Received: by mail-lf0-x231.google.com with SMTP id l13so1360874lfb.1;
	Wed, 02 Mar 2016 13:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=pu7v4myKnhwj1rbIZ1M7wB5b55a9JImTTK/dp0QZeTU=;
	b=v6SJa0a/yasKjh6p8RPrxuCcyUqWrtFr3zr4jshuL8QvvlkDI2HUQb0rH1pNmngoV8
	7RtlorsfnyysdY78ITJHYYrqNW1h0Pwd1426V3gYorXPWNiENt1iBkkUyJwQm5QqVz7v
	k60fesA66YM7sVbeg/5jGTa2lI38Wfkz6q/TNI+/hmLWS5zs/HPA40OWlZ2si7yAPZ30
	z+QER5ZXJlIk4YAunezJr2WUtGSx4xg0rOtjeh4tE9qDu1ZviFbx2Drf4QxKZodx7UtX
	aKX7089TSNY+2gR99JxkelE/ZkmN7QsgoBVzB9eZiAiLqzMZtfxnItIoe/o3Jcxp5XOR
	X+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=pu7v4myKnhwj1rbIZ1M7wB5b55a9JImTTK/dp0QZeTU=;
	b=BCdtH6rrcX/CviIaUROe6p/SwcmY9sMQu5unMeWVI2vM+gI/N87K567eAlNsGX+4Tf
	gKDthJp04x2aWLNkjOetEV2mM6KyECbAvgvhSYTbCpSWDrxP+FpS+2CRwAT8fpJp8TZ1
	k+RxdOykHYCWCciCqWBMQaHZIQfrU2rtDqI2EuJ5eC7/EnPVBfjGx0RFwjyJH/2Q/Rjh
	ybz8IGtk5x4FcG9YsDpURbtN9YH5vl5QCR7cWbvoBHkw4Dz/aMDvRJVWA/ActYrMfdL3
	j7XEYCTVWhXoIReMiDR5z7hERN1teXdLaZHxrQ9wPQNaCBLwIti61SY8tJVlYpUZ0dpk
	VHZQ==
X-Gm-Message-State: AD7BkJKVDdNKTE5/eWTPhkl6gGm6HKzCy3IjA05nTamsbqUDv8Dfv/qi4jlIziROkbENwA==
X-Received: by 10.25.168.138 with SMTP id r132mr9068555lfe.77.1456954595445;
	Wed, 02 Mar 2016 13:36:35 -0800 (PST)
Received: from [192.168.0.65] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.gmail.com with ESMTPSA id
	v140sm5859181lfd.24.2016.03.02.13.36.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2016 13:36:34 -0800 (PST)
To: Sergey Sorokin <afarallax@yandex.ru>, qemu-devel@nongnu.org
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56D75CE1.4000608@gmail.com>
Date: Thu, 3 Mar 2016 00:36:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::231
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix translation
 level on early translation faults
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
X-TUID: H1OZ2xxwLrST

On 02.03.2016 21:04, Sergey Sorokin wrote:
> Qemu reports translation fault on 1st level instead of 0th level in case of
> AArch64 address translation if the translation table walk is disabled or
> the address is in the gap between the two regions.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>   target-arm/helper.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 18c8296..09f920c 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -7238,6 +7238,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>        * support for those page table walks.
>        */
>       if (arm_el_is_aa64(env, el)) {
> +        level = 0;
>           va_size = 64;
>           if (el > 1) {
>               if (mmu_idx != ARMMMUIdx_S2NS) {

I think we'd better set the level variable to 1 for AArch32 in the else 
clause explicitly and drop its initialization in the beginning of the 
function. Otherwise it looks like AArch64 is a kind of special case.

Best regards,
Sergey
