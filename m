Received: by 10.25.0.6 with SMTP id 6csp905925lfa;
        Sat, 13 May 2017 22:32:07 -0700 (PDT)
X-Received: by 10.55.176.196 with SMTP id z187mr21396qke.60.1494739927272;
        Sat, 13 May 2017 22:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494739927; cv=none;
        d=google.com; s=arc-20160816;
        b=pBUs0+XXdBK5rWjJcMxmzg7lFv/t1GSG9q8H+oOJD4oICgSldOfXxn8mRCtknAP1JK
         jr6mFQNxHOkaKHijc3Tljtpr2Z2AO6vVB5QFdeuQQ4hS2buDf9bwctFClh+P+oPQY3nh
         3QW5N6//Bl8O2HCA1Zg75xp+/yrnjpx7TWpMnyzVZwoaE+JTHlXtTGUHjzkVHdblrTAA
         LAMCYegfeBBQ+E4oXBY/guZjc2M6axQ8WShjkfUUjgiTdpAaBkz4tZFXWFJk8a4gd8bI
         bUFiTp2pfzC5yO5YuesM43ux49mZs0gImD19xP5wHC/f8TFvZSL76zIEAGV/qBGKRUnH
         qgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=wslH/SeHejIehepUd4RIBIX61VTBIrGvy/m8uDMyYZc=;
        b=AGbgiNf85Xrn28GTkM4ExZcO6aMgSCVSwmj/2DO5Mmp+21lQAlj+HGHFBI8u5V8wdg
         qltlNs6wfIH8Yy3YI1rqbBoUivGK9i3n9UtUDbubotJhtYL5LuH7hFU+OOJbvvtTEDds
         wJK5VJVXGvkH7MNlk3Szlq9M/LjJ4p4F2ifNxqm0P6uF3fUnwbR9Y0bEdbxw7AeC3pXO
         vv6jhWu/wuQ7dkbvdgJkCRNpsNH8NB5pUl/gLYXJOaktiVSUTS99S28pJPheKtpllu/N
         LTlz/YjJ5XpZZY4O9CsyZLwz22sOOwF+u9WRv9UI3KEM7r5N3ImOytM9oMCFUVRYIyEb
         3S/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w47si7494181qtg.120.2017.05.13.22.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 22:32:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9m8S-0000zm-L6
	for alex.bennee@linaro.org; Sun, 14 May 2017 01:32:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9m8O-0000yW-NJ
	for qemu-arm@nongnu.org; Sun, 14 May 2017 01:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9m8N-0005D5-Sm
	for qemu-arm@nongnu.org; Sun, 14 May 2017 01:32:00 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36690)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9m8E-00058p-50; Sun, 14 May 2017 01:31:50 -0400
Received: by mail-qk0-x243.google.com with SMTP id y128so13036761qka.3;
	Sat, 13 May 2017 22:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=wslH/SeHejIehepUd4RIBIX61VTBIrGvy/m8uDMyYZc=;
	b=aw3B7lq4RczH+BbDrJMy3LxGYcNWlzv/QSoF+SMx+JBk/TXbBPObDzQJhJngwIY7Rt
	eu1oUzG5nb/5H2Z4IOvU7kOlDt5lJ+Fpt4nNpH10wbbZ2WQ97v6486B4jG+gtMWZWhts
	eduHC/5mggaZoSZh8ietPo4vKCenU3YJZ4mY0Q6ELqktNuVSxxwtokvv7YtOoDDbgg0J
	cq3xb4SmOyw2K6FnBeI0GWgyzEVex7GAy9tcVWWEAjmFFmOkSYYNXlVMkhQJqcGq4Iqw
	1Yzf7A/6GK3rptJLdDqRMw0Srl+emvp3JoTuf9reYxCZ/dwFya/OaR7vyrzBbfGaaGsG
	15ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=wslH/SeHejIehepUd4RIBIX61VTBIrGvy/m8uDMyYZc=;
	b=b9Le49FK2OAOToDLxWXvJMybWqM/M1B6XwwTrSAjouzHV63RihXWp9YG+I3dzruOW2
	IANqqDkx3Py3fkp6v/IjRw3gn+BRnKxlXH1HYc/4JxCusRKv/TZS91trg2QtcFzRCozD
	KjPoImxKfvHMJ87IChjmRxeDgxBftG9pdH0Lanjix3umSCaKABuTK6mlWu2aKY4XUcuU
	YQovNyBMAAJr5ep8Fc9Uqd5yt3Y4epLo07MSJYdZN9f6ejX67OOVVVrW7drabfUxOjP7
	x7epKRfv6yHkAPrIuhz9FgwcOSk+JPiuuh+HgLn4YD3nyQf3WHaa5rmUkfI7griLj2v7
	RkJw==
X-Gm-Message-State: AODbwcDIy7BDlzzAAUC3ijZzXM824jHhG7EAO7kJnrYARRx1NnKT3bMj
	eJdRYYb/jWXMzQ==
X-Received: by 10.55.110.132 with SMTP id j126mr8196048qkc.227.1494739909526; 
	Sat, 13 May 2017 22:31:49 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id h3sm5772575qte.11.2017.05.13.22.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 22:31:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
	<1493226792-3237-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ce532829-b11b-7992-3fc4-3e21210c66f0@amsat.org>
Date: Sun, 14 May 2017 02:31:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493226792-3237-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/intc/arm_gicv3_cpuif:
 Don't let BPR be set below its minimum
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uzROFaGDudNl

On 04/26/2017 02:13 PM, Peter Maydell wrote:
> icc_bpr_write() was not enforcing that writing a value below the
> minimum for the BPR should behave as if the BPR was set to the
> minimum value. This doesn't make a difference for the secure
> BPRs (since we define the minimum for the QEMU implementation
> as zero) but did mean we were allowing the NS BPR1 to be set to
> 0 when 1 should be the lowest value.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index d31eba0..e660b3f 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1388,6 +1388,7 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  {
>      GICv3CPUState *cs = icc_cs_from_env(env);
>      int grp = (ri->crm == 8) ? GICV3_G0 : GICV3_G1;
> +    uint64_t minval;
>
>      if (icv_access(env, grp == GICV3_G0 ? HCR_FMO : HCR_IMO)) {
>          icv_bpr_write(env, ri, value);
> @@ -1415,6 +1416,11 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          return;
>      }
>
> +    minval = (grp == GICV3_G1NS) ? GIC_MIN_BPR_NS : GIC_MIN_BPR;
> +    if (value < minval) {
> +        value = minval;
> +    }
> +

which is:

     if (grp == GICV3_G1NS) {
         value = MAX(value, GIC_MIN_BPR_NS);
     }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      cs->icc_bpr[grp] = value & 7;
>      gicv3_cpuif_update(cs);
>  }
>
