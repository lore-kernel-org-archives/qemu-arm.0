Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp16337wru;
        Fri, 10 Aug 2018 08:41:26 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw5YpvcosM8VMfCE3l/s6H2h6UwFMiuE2+IlHByYnXBn0buzesBR8smb598N7MdHkzZc/vP
X-Received: by 2002:a0c:e7ca:: with SMTP id c10-v6mr6257516qvo.48.1533915685926;
        Fri, 10 Aug 2018 08:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533915685; cv=none;
        d=google.com; s=arc-20160816;
        b=aRh5Eg71uk7p5thbHVnAT5yqRI4U05IT7aBNU77IaLpbhu4norGJb/BrGQdRCO5AF1
         8ipw80U8499TNrIhLV98G7uMF3Zka92Lxd6ZN+XR2B7S5K5ecaPXq+gVolM7ccFCuPJu
         RNpprceJD08BHoHZLSQ8kdyHba+54EldL6MG7DUakyZ9zVyhrM26oJfMiv08sMaFUw1K
         jdhPCC4Dd/wCy/IP0y2BHMwZso+JMSCmpsUHzKb9CfBacBRajS5kyVRziFct8H79GUL6
         dAcXtArUrq4S8xM5UJAvG7w/uKAap/PtMMXAbh7HykuakLM4gbCytOJeV4ymVIKN+NfI
         T1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=idsVOvJm8SM6h5gaxJgoMD6XTaS/h0uaHhxC1uI1l6Y=;
        b=wESZaomR7eTkhVnaHmvvuhT40U01ntP0gyYp9FpD1DVk9Rv8e5F7xrBmcefYjrsWwu
         fwneg1g4z9I41Ehge3eGbkBnS/GjGgReX2zXIQ0pGD8KfZPEvSss02svjNO/nqDdBe+K
         8JPsj2TAUAlKg02TOZxCAwUJkBYiBJbhV9AZ2oevep8J+lt+/Soe4uWe1XdfLSCZ114Z
         kNInmh9M9CHXIraDD8oXENIPGeaRDsRzH2uwnQ+4Luj3FSYWdXjzEae+sZMG++zD7kYh
         hEiX2kQO/g19PJgVu45adp7buttPThgOT2yaEwnyLUZ9MU4XOUpqzju8czUENfT9DkDw
         VY1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtrRW50C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j67-v6si8728465qkh.114.2018.08.10.08.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Aug 2018 08:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtrRW50C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fo9XZ-0000al-H2
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 11:41:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fo9XS-0000af-MH
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 11:41:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fo9XR-0004yl-UF
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 11:41:18 -0400
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:43059)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fo9XR-0004y0-FG
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 11:41:17 -0400
Received: by mail-oi0-x230.google.com with SMTP id b15-v6so16461334oib.10
	for <qemu-arm@nongnu.org>; Fri, 10 Aug 2018 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=idsVOvJm8SM6h5gaxJgoMD6XTaS/h0uaHhxC1uI1l6Y=;
	b=JtrRW50CITlLLe4CzCkPvQ99/7ns5/XtFMGIbADvuOJnniwVYQlT/7lKBvyRUVx/pP
	5XBhmSmjiM5F8+fBiEh/2mZmTQE2IzfmSs+UhPfuVTKYAGm+Yi+UxF7112hJ2q0ZAmBu
	lARPEklGqHa5L/gbP3c/FYvlO0QgBAAmwLQ1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=idsVOvJm8SM6h5gaxJgoMD6XTaS/h0uaHhxC1uI1l6Y=;
	b=R64xMGO2pBvsCk+7WhiBfeVY6vlAo0LA36mYnWlOdZCCW3dxLkusRlBQjsQ9ltoyRJ
	NXJyxrHENuWx+wvyn+AtRoGOK6ziGzjVJzdU1CoENT2y2htqB3BOTAlObEZd8IGQIkTX
	QlBdEmJridr4H3KTca3wtmrgzL7IhcO956OpuQs7p1b2IIyXAa9XkTAOtAErxbkS/pCT
	7gGRPIaWR07fbcdX6uK7ta+2KCs1nhi6nU2YJITTwbJkQM1QLU91SdK776MS8tT4j2m0
	SJFB65JnaWwdiI46RLTkYPgZB36pVyynsRPZi0wB90RLzR+ko6ONpUfbGhgKjSuYbXPe
	KJwQ==
X-Gm-Message-State: AOUpUlEDly4RHrX1bSmO7WzNUETHCrSjQL8YYMG0eA/9XxRmKZBsJ480
	xqOgwcSU+Bno7RBhHvhIZc4jgVva0F3+pcpGKmGmzYVgdYorrw==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr6598970oia.164.1533915676462; 
	Fri, 10 Aug 2018 08:41:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 10 Aug 2018 08:40:55
	-0700 (PDT)
In-Reply-To: <CAF++6AMVaAcAtKHN+NpheOuvu4mKaSo7W5yMFHs7_hpALzzcTQ@mail.gmail.com>
References: <CAF++6AMVaAcAtKHN+NpheOuvu4mKaSo7W5yMFHs7_hpALzzcTQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Aug 2018 16:40:55 +0100
Message-ID: <CAFEAcA_B+Ydhiep-P2hqRbpx9y+VkSvk0XnTJ0APAmruU4MVCQ@mail.gmail.com>
To: James Hanley <jhanley@dgtlrift.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-arm] MPU/MCU vs board setting cpu-type
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wwQ+osawIGl8

On 10 August 2018 at 16:29, James Hanley <jhanley@dgtlrift.com> wrote:
> Would it make more sense that the MPU/MCU implementation (ie
> stm32f205_soc.c) define the property for the ARM_CPU_TYPE_NAME instead
> of the support board (ie netduino2.c)?
>
> It seems like a chip die version should have that property inherently
> set by its init function since it will always be the same core type
> for that chip die - and for a board, if it includes that chip die in
> the init, then it will incorporate that core type.

Yes, probably -- but we haven't been very consistent in the
past about how exactly we model SoCs where there are several
in the same family that are more-or-less-the-same apart from
the CPU type.

thanks
-- PMM
