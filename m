Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp152523wrw;
        Thu, 8 Nov 2018 05:50:41 -0800 (PST)
X-Google-Smtp-Source: AJdET5erA9HBK7RRCo0giK5ZDvckGuTL1cGTSUEQOX4KBpGHbeB4vBiu8YOTxgYHge0Pp4NxUQ3P
X-Received: by 2002:a37:5f05:: with SMTP id t5mr4271382qkb.47.1541685041686;
        Thu, 08 Nov 2018 05:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541685041; cv=none;
        d=google.com; s=arc-20160816;
        b=kyp6Qgju9CydFdzuxm8pT4qdw5qeamFVaia/b4miuX8F3dp+a2XoCh4IZofIRXz04r
         KeCC7pjpf0g+iZ3KX6ArG8IhVrbPx0Ps/2O14RggzsRq4B1wG95ApBYsiRrFibpHbdyN
         7zabtGZhGgJLGrMQU+nwX37McbdbY0FkPpohCAzPbYP4FiXaaqDM1lh58BayPwnZDfI0
         ILXJhXOuOKoCsVTZKl23p4rzqaysvKhF+WymXcjLcUmMz9xVWvBAjOEqFTo9UH/H0ooh
         suDwSOdbgOE+SF2vNmyzd/yIEgwdPIpz5h8XP1QwZZ6ttpfCFyORZLYoJmWeIGotQsXM
         6QcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=nfDC8R6rTCHY89R0NcxHJmqqpmgiLLzOFd7+rkw0Iic=;
        b=suJoF6GfqmMQjLMJZfZPS54u0qMTWXX5viDLf2gEw7Cj9S6Ds8DLXZU87b5AYyZXuq
         OPZQ9stdYnjnYsqaoHU6/xi0YSjhwgBaPAFAuoGWL5WDkeEKMQVajVvC3O5Zx4TwZZDD
         1xNlO/Z0xilnuT+nTFD/YKsaUGHCgnby63mPk5x8FtSEPPiXdzlInTu6DLcgo9I2QhE+
         3ivmsxPTOAqdk7/NvbMlOQtMSoIVgV/TJEfhiujEe3AdcPZ9DkYGh217gzibbnTZIMxU
         AVWm9YWIaE3nF5sIs19lL1jXJkBHm7BEreeCu5AoQ34jiO/2qFNQjFy32F/qD2fojf99
         Lj6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Vr9unlX/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l91si3114888qva.115.2018.11.08.05.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 05:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Vr9unlX/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKkhk-0005rf-Ho
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 08:50:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gKkhY-0005qg-VK
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 08:50:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gKkhX-0006zu-4G
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 08:50:28 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34847)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gKkhR-0006x4-3S
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 08:50:23 -0500
Received: by mail-oi1-x243.google.com with SMTP id v198-v6so16965410oif.2
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nfDC8R6rTCHY89R0NcxHJmqqpmgiLLzOFd7+rkw0Iic=;
	b=Vr9unlX/Phch9K3FnaSedvOy0RDr9HnO6SfU2E9IZv2rFhnMfAdFhp/AT4FTFWrHVD
	jKM0peHnednb7h/h+5Cg/Uw8CcSfcOyZRuRhQqU79oRnxuN9PGzsdnsAdU+Skji23ylD
	inkDNehAGt3McSOP7TJ0hjLDLUDqVpotGASDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nfDC8R6rTCHY89R0NcxHJmqqpmgiLLzOFd7+rkw0Iic=;
	b=rkGZI0SC1vPYUAkHrpHDFpNxkGZtj3kmpHeP8g/0h6R/dOepbsdgQPcqZzmpa4JMj8
	MOriIDVc2XSJqRN90LdbijJq+tI6N95RRC38rYpJzzH51ucG5TInGWpFDNa5GmUmOtLR
	Kj6lITh2jbMQykAyHMifXT21/tITe7rKvd5WCd7GYxMo7+bJyei6xounrmE/r14i1Ed3
	Ed7oQr94yv+ItFD3n9qBi+uMFkX8T7CEKba4sPnGsBG7XdHWkQ51WToPVH3NG1UheNK1
	McDEvCVRdNogGjZAd+zXPDSC4Tec2PQqFxocrc18c9/nBn4ZJI4I27vpPE+o36SKO60B
	eMJg==
X-Gm-Message-State: AGRZ1gJ2h2LjUnCeQOqcDtj9muIolKQ/2n6h78DNq6db63QoAV4uFieZ
	jHIcpnP/zVTdW0LpMS/fTerqTvi0Z6HGRR9h7J4gbQ==
X-Received: by 2002:aca:c50b:: with SMTP id
	v11-v6mr2449012oif.48.1541685016955; 
	Thu, 08 Nov 2018 05:50:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Thu, 8 Nov 2018 05:49:55 -0800 (PST)
In-Reply-To: <20181107092721.6c01f09e@w520.home>
References: <20181106184212.29377-1-eric.auger@redhat.com>
	<20181107092721.6c01f09e@w520.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Nov 2018 13:49:55 +0000
Message-ID: <CAFEAcA_da2B6xQOF8CdZPvNb2WiBOdiUAZ+3h5-=ntNRL0EDLg@mail.gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v2 for-3.1] hw/arm/sysbus-fdt: Only call
 match_fn callback if the type matches
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
Cc: Thomas Huth <thuth@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q+Sxz+Vfg/0W

On 7 November 2018 at 16:27, Alex Williamson <alex.williamson@redhat.com> wrote:
> On Tue,  6 Nov 2018 19:42:12 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Commit af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with DT
>> compatible value) introduced a match_fn callback which gets called
>> for each registered combo to check whether a sysbus device can be
>> dynamically instantiated. However the callback gets called even if
>> the device type does not match the binding combo typename field.
>> This causes an assert when passing "-device ramfb" to the qemu
>> command line as vfio_platform_match() gets called on a non
>> vfio-platform device.
>>
>> To fix this regression, let's change the add_fdt_node() logic so
>> that we first check the type and if the match_fn callback is defined,
>> then we also call it.
>>
>> Binding combos only requesting a type check do not define the
>> match_fn callback.
>>
>> Fixes: af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with
>> DT compatible value)
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>
> The commit this fixes went through the vfio tree, but since the fix
> itself only lives in arm code, I'll leave it to arm maintainers to
> shepherd this fix and offer:
>
> Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

Applied to target-arm.next, thanks.

-- PMM
