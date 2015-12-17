Received: by 10.182.158.201 with SMTP id ww9csp601986obb;
        Thu, 17 Dec 2015 11:37:14 -0800 (PST)
X-Received: by 10.140.80.240 with SMTP id c103mr46688255qgd.61.1450381034711;
        Thu, 17 Dec 2015 11:37:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si12659995qka.74.2015.12.17.11.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9eMU-00071d-9J
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:37:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eMR-0006yG-JQ
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:37:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eMQ-0002VJ-Ra
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:37:11 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:35820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eMQ-0002VB-O1
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:37:10 -0500
Received: by mail-vk0-x22e.google.com with SMTP id a189so52757718vkh.2
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 11:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RMlUX5sTGbyLoSO0l8VBJSRbmL/wocJFU+uOQulAvLk=;
	b=jfHIkm7nGe3s9sDICfa5KHavMPcRcSmmAXUEy5pGcFNrjQ6FdYxCdHAQXx5IGEokX6
	sxpXElDpq8hi8ei+0OXOUmanJ6qt/epHJ0EkdCnkdlI14ULL++b3uk2480pC/enEM046
	qxAU2apfYFQlrea/gX6HEdrV4THl5UdBn69jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RMlUX5sTGbyLoSO0l8VBJSRbmL/wocJFU+uOQulAvLk=;
	b=iq8Bzjbjc7dHCYH8yC0FVrvYz5qf1jVr5vATVhF6RYKL0itZzTGo8ZODVNJAgb4T6g
	Ew0c2FJNPQJsQzppA4w5bVhwby9vu4HVV05ztmPOFVFAGK7B9EjyQ7xoLsuEgs0sz3Jq
	O5GFXBxGGBUJ7Djh60/bFRH9BtUBWZoEx/nO6msEAFxzC3jxn87LsaVlVStkMbxc6J1J
	ERg09lw7B/DN5OpQCt4CTUeng9TbyqCbVi9advosHTuHtJ0jWLFHrpW49sol2yY7aOXB
	iKxZieg9H2oMqn8IC/ZcraefElLWmDetcV2fHFgxQafp9D8+Yhdticfu0C9QOkm9swmM
	InNg==
X-Gm-Message-State: ALoCoQmB+EXrIwb1U8iTI2XO0+prLC/mQDkC9KktdzKYPlfsf3Sj0t12lGQWyUa+RFmKIZE1DVT9lTKev9SZP+BXBrB7yhX34oF5Fp38t/Q85N/zj7K2zkI=
X-Received: by 10.31.194.21 with SMTP id s21mr37591118vkf.92.1450381030361;
	Thu, 17 Dec 2015 11:37:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 11:36:50 -0800 (PST)
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 19:36:50 +0000
Message-ID: <CAFEAcA-muUVpTc_z=sUs07eSrWkxHmZw0FVdr8dasuOAOMUzuQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 00/18] Fix exception handling and msr/mrs
	access
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
X-TUID: fzN3EHCCceJ1

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> This series grew from a previous incorrect patch attempting to fix some
> incorrect behavior.  After spending some time going through the arch. ref.
> manual for v7-M I think I understand better how this should work and have
> made a number of changes which actually improve the situation.

Thanks for sending out v2. I've now reviewed all the patches in the
set up to the start of the MPU related ones. I think it's probably
better if we work on getting the NVIC related patches into a mergeable
state and then come back to the MPU as a second series -- the patchset
is already quite large.

thanks
-- PMM
