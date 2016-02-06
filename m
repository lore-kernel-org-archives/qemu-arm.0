Received: by 10.25.159.19 with SMTP id i19csp553738lfe;
        Sat, 6 Feb 2016 10:24:15 -0800 (PST)
X-Received: by 10.140.160.130 with SMTP id g124mr23771785qhg.88.1454783055261;
        Sat, 06 Feb 2016 10:24:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si2633874qkv.0.2016.02.06.10.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 10:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS7Wn-0001Sb-Fm
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 13:24:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7Wk-0001SF-S7
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:24:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7Wh-0007vO-Nq
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:24:10 -0500
Received: from mail-lb0-x243.google.com ([2a00:1450:4010:c04::243]:33232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aS7Wh-0007vI-EF; Sat, 06 Feb 2016 13:24:07 -0500
Received: by mail-lb0-x243.google.com with SMTP id bc4so3425936lbc.0;
	Sat, 06 Feb 2016 10:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=/dm/5arGUB7NekmN375Z5Lib4PIubhicToIkohlFcBk=;
	b=0zl2J5QYRIHojEAMRr336c5Z3auylRFA3uBEJn3sZRmEkZWxUWhp/81rTC0vcrEOzV
	WsZyYcTdFD9VQJ6OTUeti7pHUKpyRpeZ9UCkCDDaYh6i2L1+5lZsdOA2un6GslBQXUs9
	O7FkZN2hSLr6EAo/yVFOfbsPr2fbIP4SvA2cLk+IGom2HrttZryRQfIs0IOo/n0/Y7S+
	cZuyOX9EkEEH3+tXVbpXx6NB+UA2SGo5dQnRPUgYabiY9r6xQLDCOMdEZL/4Uwba7JWh
	NZVjNGeAP/UcxGOPtAwoe3urzJPHvtI3JdJMxIkcBXEajhjo0um+rZReJL6yzJGArytq
	Cbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:references:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/dm/5arGUB7NekmN375Z5Lib4PIubhicToIkohlFcBk=;
	b=AQq1KfHKEG3axsNI3PJfywma76Ak5eZf0esbKDFQ4QWZKBxAJzPFAcWktu+O7GXc6p
	406IF1LM8A7ahjS8megIjWQdIBTIzcqLj7dRpIRjfzyVHvZT25ymyiHzYRnhOuOqXCoD
	3CKrBQGtDMueTXhsOVRaSKuAzDqsAdvln9PsGdbVfKIV1EZHup60v02wWUHbH7xo9Lof
	OEplwAQNfPOUjVSYWhk5kLn5y340XLc/tJ+O6sQVDfKDEzIWvp16SGOfLvH/2PJWzsws
	Fw9dFPIWAnhrrJwdEiGvugDwQLlAgBaX69Givgg6DthMkkbxcKTe+bKOnFAq4fzsRG8S
	9N3w==
X-Gm-Message-State: AG10YOSSxg20fn7sClb5iaodVkAjy4nYNssbfe9Vj/ChR500GDD6fKCr9tkcp2qT8r+jdQ==
X-Received: by 10.112.120.200 with SMTP id le8mr7269524lbb.106.1454783046214; 
	Sat, 06 Feb 2016 10:24:06 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	h8sm2875563lbd.48.2016.02.06.10.24.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 10:24:04 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-2-git-send-email-peter.maydell@linaro.org>
Message-ID: <56B63A44.9050408@gmail.com>
Date: Sat, 6 Feb 2016 21:24:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454506721-11843-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::243
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 1/7] target-arm: Fix typo in comment in
 arm_is_secure_below_el3()
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
X-TUID: ajSIYAypz4nH

On 03.02.2016 16:38, Peter Maydell wrote:
> Fix a typo where "EL2" was written but "EL3" intended.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index b8b3364..52284e9 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -931,7 +931,7 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
>      if (arm_feature(env, ARM_FEATURE_EL3)) {
>          return !(env->cp15.scr_el3 & SCR_NS);
>      } else {
> -        /* If EL2 is not supported then the secure state is implementation
> +        /* If EL3 is not supported then the secure state is implementation
>           * defined, in which case QEMU defaults to non-secure.
>           */
>          return false;

