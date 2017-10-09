Received: by 10.223.197.9 with SMTP id q9csp2664629wrf;
        Mon, 9 Oct 2017 10:12:31 -0700 (PDT)
X-Received: by 10.55.90.199 with SMTP id o190mr11087663qkb.180.1507569151478;
        Mon, 09 Oct 2017 10:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507569151; cv=none;
        d=google.com; s=arc-20160816;
        b=Dd4YijsTOCSkKIjn1UlP5VcWepQPcNxQ/gFyWbfUIPPg9pw1Bi4AQe4risgIFTwMHg
         QdLnO+UEH5en4GY80sS8YdYf0AolUxi+5a1D5fOOK9qB5JihmjMENh41hRY0LWSH3ea5
         j4+cwOdJtZxIvC1FdTR12QYf+ap5jqkjrrZfw9XtmjLapxiTFPocLDqsGky1mjpxsWvW
         bGNKb/9lP59z15I/dWx6WkTQ9DPpvCIRNfK/H/iE4jMK41VNG69s4X4tzDbdZaY9KISh
         8Do/F7rP3gRlxy1N6TUKruHM3PDornPan7liP58TPyFJflI3+NqRY/3UN/3GqiwFy3nJ
         w0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VPA3RLfD5hsy7cENC+EH/9nxxyDhNDgLGBncmUUt468=;
        b=IiKWqqWDxphi5/zu6h3D4dIyHElF9Yc8gj9WhqKmvq4ShclR7YGcn5GvisCk30qriG
         aZF8CuEWhP5roG10IQ1TX1A6FnRXtGZBWAlrcqEY5CdNc8ajP6tGuvkes0pc4a3G34tw
         p7aZ6C0UTv4w7dXCQ1cDlWBtqA/7cIqDpLic3/kLoLCtxZBuJNvhx8udXd0LDCi/rtWL
         sV/ue6oM/++PEbKqXXMJrGDMT246cPbn9IcTJ/XbhXvPyxA5KW/ulVRlzvJUMJO/tBbL
         PFcIRcMB1St7M7UG98h35fwB9HemOeq63ycjqeF3iMrRd1/GbDYmMbxDLmZM1MS3m0Al
         wDhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CiNlNTXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m4si2489746qkc.75.2017.10.09.10.12.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CiNlNTXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1bbT-0004rA-1B
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:12:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bZ5-0003RC-M0
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:10:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bZ4-0003es-H9
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:10:03 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:51781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1bZ4-0003dQ-9z
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:10:02 -0400
Received: by mail-wm0-x229.google.com with SMTP id f4so25374757wme.0
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 10:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VPA3RLfD5hsy7cENC+EH/9nxxyDhNDgLGBncmUUt468=;
	b=CiNlNTXtx0++kAlmKKQCNWTE/r+nBYV1xfBj4V6BNTvjn2MMSfMKUi2kdsiRxEtFBu
	vKe37XTYMZNxgNf0UhjWdnrLNxrpypAmp0QbS0pDo1eB+ahNMxftK8Mn+GjgpLuPOVQh
	qflj0qVJNCpw3n9+9y47QqpFffMo86e9ED0iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VPA3RLfD5hsy7cENC+EH/9nxxyDhNDgLGBncmUUt468=;
	b=oNeJgVtxgvHBBnYjjJEI+UFqvzZBA/9fTwfuaGK/eAz2hX+tCreNPHttMxrrlBggoM
	XPSxLCAphcWpyE7uzc8krXHEBR7LK9mLio6sqVrx25zgifCmvO8kFyR/4S7avGS7LjUM
	iMr/jxXc82CP6ft5AUAMLGbXC6WsfsrAB7SC/kk4bIuq6PCmqzk36TLUUL9qFPUxNcp9
	WXad5GYovsN1ArXCVier0N5o36c78M8WB65QPIh/KMFO7FzpDYkeBRr4CZumFBRLbwgM
	8CWvBtZUPJWJmjTZTznxyIMqzlB5zY5OurMLCe8n/YPa/sgLXYm3mX31T+wbsVuICal/
	wd9Q==
X-Gm-Message-State: AMCzsaX1oeECL3oxCbm2vvgWqR0yjrwH+RJqDbeKcyTR1Z0UCVMs2ER7
	9zfFNdYBbBOSoUTKglf0fJyhABP+cO3iaR+22719FA==
X-Google-Smtp-Source: AOwi7QD2L0bNTdYalHYy0sfKDNV4dlWSHv7PZaDk3krUl2uMCbjVxLnC/+SkIDEHcH/eTMvCZCYlJKAVegEgP3KDpuI=
X-Received: by 10.223.175.56 with SMTP id z53mr11479343wrc.177.1507569001341; 
	Mon, 09 Oct 2017 10:10:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:09:40 -0700 (PDT)
In-Reply-To: <CAHQ1cqGy5xaqf4sVT34fv=cRDTDhpi2Vfx01SA2+cvdYqiArPA@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-17-andrew.smirnov@gmail.com>
	<CAFEAcA_a_YLw4u5SwCF-L_n630iiJJwyphbKc2M-orvFs7dERg@mail.gmail.com>
	<CAHQ1cqGy5xaqf4sVT34fv=cRDTDhpi2Vfx01SA2+cvdYqiArPA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:09:40 +0100
Message-ID: <CAFEAcA-MyTaffU7mEV3XH95NOvFmaKm2a=VkFbDU6n6dwTpuRA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [PATCH 16/17] i.MX: Add i.MX7 SOC implementation.
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
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q5DXAkPWeW2h

On 9 October 2017 at 17:18, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> On Fri, Oct 6, 2017 at 7:38 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>>> +static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    FslIMX7State *s = FSL_IMX7(dev);
>>> +    Object *o;
>>> +    int i;
>>> +    qemu_irq irq;
>>> +
>>> +    for_each_cpu(i) {
>>> +       o = OBJECT(&s->cpu[i]);
>>> +
>>> +        object_property_set_int(o, QEMU_PSCI_CONDUIT_SMC,
>>> +                                "psci-conduit", &error_abort);
>>> +
>>> +        object_property_set_bool(o, false, "has_el3", &error_abort);
>>
>> Does this SoC's CPU really not have EL3?
>>
>
> The SoC support TrustZone, so I thing it does have EL3. This setting
> however was breaking SMP support(I can't remember more details) and
> that's why I added the code setting it to "false".

The idea is that for new boards (where we start from "no guest
code works") we try to model the hardware correctly from the
start, ie figure out why SMP doesn't work if you say you have
EL3 (probably because either you need to provide boot code
for the other CPUs or implement a power controller, depending
on how SMP secondary CPU start works on this hardware).
Existing board models that were added before we got EL3 working
tend to set has_el3 to false even though the h/w we're modelling
has EL3, because they're maintaining backwards compatibility with
previous released versions of QEMU where we didn't implement EL3.
New boards don't have that back-compat requirement, so if it's
not too hard to get it working from the start that's preferable.

thanks
-- PMM
