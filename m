Received: by 10.28.71.155 with SMTP id m27csp487073wmi;
        Fri, 23 Mar 2018 06:37:24 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv+B75U1x909bukxGkb8bHWdCUGisranEo9fLOYY9OZuN+rlNORmBLp6GW66qS0dKN/Ls9v
X-Received: by 10.55.24.1 with SMTP id j1mr41511580qkh.23.1521812244270;
        Fri, 23 Mar 2018 06:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521812244; cv=none;
        d=google.com; s=arc-20160816;
        b=SsmgDq7eL+K2uPS3O7EN2fkLwu/t4nx569lfT9Opp1DAa5dqleozzbqqskbMlB+csE
         U66GkcAARUeUaKUhylTYvMGxnyFpxgHIgyRi20YWtDyVmCT8ncSWUv59ZyTI7aD9gGsO
         RBLXTkAOL4LgwqEhg/q5V+Y0fcsppEyrgkn4bb1WZ7I3iVIS5ijvgNMHl2Y2O9Vqbr+3
         t8yIY5312SRfsr3BrodV60Ltj21oIhDhrJqH5SX8Q04EDqumEz44ECvMVUVRwe1GjbOo
         ZWK6QFPrsKa74DEVtqm+MkekAsDS9HRAVOvrXrWHjhb2NATbIgO5OySxtW3q7p4jfhC2
         r9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZHJNL59/ZS6q7gcytMuUh/iqAi1lS/0rIF5gYIogpwQ=;
        b=Z3TtkxHKB/MJHCtN6UMZahgTAT6GQgMRluqHei3kPyyDzAZk6EYyRvHRPrBKS1bp22
         rdFT5OisqoC8G38BbwPhNwvk9K6gnNdWvtLdY6G9GorIUX2t2n17yln2VWVXfmElYB59
         tSEu9Yq2mgaZPyVKpbArX0MmN2IE6EmXzaeXowe59TuqcHMRlSDFnvHDNTr3n88L7jBX
         vqhcT+mrDEOPt1FNg8E9cJ93OgeC2S0Ke061ar//iuSQ+VDklgqBWy+juHgpeZR3ArAM
         tGU9UJGOc8BCBTRrIY933IKANTEDMM6LU3sxSuJE+DACQXGdyiX+5fTxMKoawyvvPW+O
         h9dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DZ89PVZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e62si5583678qkd.384.2018.03.23.06.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 06:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DZ89PVZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezMsl-0003H7-Rk
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 09:37:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezMqx-0002FT-Ki
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 09:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezMqw-0000zB-Ko
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 09:35:31 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:38892)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ezMqw-0000yp-BQ
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 09:35:30 -0400
Received: by mail-ot0-x244.google.com with SMTP id 95-v6so13244491ote.5
	for <qemu-arm@nongnu.org>; Fri, 23 Mar 2018 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZHJNL59/ZS6q7gcytMuUh/iqAi1lS/0rIF5gYIogpwQ=;
	b=DZ89PVZjgj1RwbPHf1NnLb42+rBoWjRraYQVQNOSgIRVxYN6uDC/pVfHXMaz3+gqjN
	s97T+2qqz6Ik6XL2ymtopM/J/fytQdrT3EPbBqf/b6FZxpA/RIOb4tUnJBYSZH3u2sUn
	5DvrPZZdgTwaX7yliedhYEHVQi3YvKZPXrVUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZHJNL59/ZS6q7gcytMuUh/iqAi1lS/0rIF5gYIogpwQ=;
	b=cDcknHzjBm5tAZnnWlITwkzn7ZmZ/9X3I1KalVr1eupKFm2lxg4xlSzkmbetsBDDBw
	vU0TqzLrDftWxPXG90PqjWkHnN9U7loaA9cFkcphneVaSzjj+k1JABG1FIuZLAU9eq2s
	8MpDrH7BDie1F5EgE3wyxtzEmVSSDmzlMCOh7VSet+quOsAaApz2Kjykmolg8wE+24kN
	DhjwLRnpbm4V7nFZfdUTabZTziEalJTaapcOx2LZeW3+ZfE3q5HXkFJ4zRSp3oyq2xSd
	DxcZ0Q+GxEkNbNf8BpyKjLjoOjGuiqmSawmpPZoHDt/NlSGCW7M2MiZqt3WWONGjSpd6
	Xb/A==
X-Gm-Message-State: AElRT7FRdMoYNxiYo3W1j0uPz1kzqkOZU01xNVJvLUFClfSyAoqkM19r
	nr/D4YcMeSgP76VAp6ad5JMQWPk8PEzLbGTlIx9lxw==
X-Received: by 2002:a9d:2ae1:: with SMTP id
	e88-v6mr19072338otb.308.1521812129508; 
	Fri, 23 Mar 2018 06:35:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 06:35:09
	-0700 (PDT)
In-Reply-To: <20180323074808.eyxeqaqyuz5sm743@hawk.localdomain>
References: <20180322212318.7182-1-wei@redhat.com>
	<20180323074808.eyxeqaqyuz5sm743@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Mar 2018 13:35:09 +0000
Message-ID: <CAFEAcA9jLpBOLn53S_r_UAuzVAifZ8=GdKqo3=UkSee0eTuYgw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V2 1/1] mach-virt: Set VM's
 SMBIOS system version to mc->name
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOKK0rDPzmQk

On 23 March 2018 at 07:48, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Mar 22, 2018 at 04:23:18PM -0500, Wei Huang wrote:
>> Instead of using "1.0" as the system version of SMBIOS, we should use
>> mc->name for mach-virt machine type to be consistent other architectures.
>> With this patch, "dmidecode -t 1" (e.g., "-M virt-2.12,accel=kvm") will
>> show:
>>
>>     Handle 0x0100, DMI type 1, 27 bytes
>>     System Information
>>             Manufacturer: QEMU
>>             Product Name: KVM Virtual Machine
>>             Version: virt-2.12
>>             Serial Number: Not Specified
>>             ...
>>
>> instead of:
>>
>>     Handle 0x0100, DMI type 1, 27 bytes
>>     System Information
>>             Manufacturer: QEMU
>>             Product Name: KVM Virtual Machine
>>             Version: 1.0
>>             Serial Number: Not Specified
>>             ...
>>
>> For backward compatibility, we allow older machine types to keep "1.0"
>> as the default system version.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>

> I don't think we need the compat code in this case. I used to pedantically
> recommend compat code for all guest visible changes, but after speaking
> with Igor about the policy for introducing compat code for ACPI table
> updates, I learned that we can relax a bit on a case by case basis. In
> this case I would recommend relaxing, but I won't insist, as the compat
> code is indeed the safest way to go.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>

Applied to target-arm.next, thanks.

-- PMM
