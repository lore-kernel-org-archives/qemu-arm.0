Received: by 10.25.205.13 with SMTP id d13csp107116lfg;
        Mon, 16 Jan 2017 08:49:27 -0800 (PST)
X-Received: by 10.200.48.172 with SMTP id v41mr28707676qta.54.1484585367066;
        Mon, 16 Jan 2017 08:49:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l47si10825767qtc.113.2017.01.16.08.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 08:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTATE-0005Q7-Id
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 11:49:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTAT8-0005Pe-Pj
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 11:49:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTAT8-0005bh-5w
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 11:49:18 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cTAT8-0005bT-1o
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 11:49:18 -0500
Received: by mail-vk0-x235.google.com with SMTP id x75so76624299vke.2
	for <qemu-arm@nongnu.org>; Mon, 16 Jan 2017 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sWAFOCk1v4dTdf2SB84fJclnFjVqEux+1HnoRYULc2s=;
	b=bosoHAByVCULEPeN0g9EnUl2rONRFIA6PLPrvF9BMek+HYL1uxRw+fpb1kflUJN5HC
	A6a7k15mnzh5EMxNShvlC/ur8hGPIfyr+NhQAdeTxb6m9M9vGrE6/kjmnVYn0xsuV2NY
	w0E5NB5nPGzgBdLFzXIWbpfl4yrM2sz/EnrCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sWAFOCk1v4dTdf2SB84fJclnFjVqEux+1HnoRYULc2s=;
	b=DptErmq/DXmxzeWoq6a6KnEzTY2vIonDUNnx4ib3Cbg2H+sCi9R+p+AQQrxS/kFRF5
	MpYs1G4u/v0g5fnkG0eGNDcXoJaCxnzbESg+LuXW6WbM7FWILFLiKA8ndN1TAQqKb60A
	vkNEiMaDThIDL23uhVTEKz1+iHefRen6on7p2KjwYcGH10yE9HqkUC3gopIC+pdhmpBY
	djrVkZMrq5K6heJgNgsaAJ2Pj3vOry+qMOd2ZzyT8YTa2Xd19VKdjVF55YG6kn6qbB7P
	/xUw2Xqy6q00rplJOmN4U1X2VeV7a1x4F7i3o6Y3CZLcQiEpQXrrveHyHeWPWemeBBQ4
	CGGQ==
X-Gm-Message-State: AIkVDXLQk2tFtinG1tx5jPy2V/5dVdqpvtBk3RviT8qb2VhqnHan4KPtV6xGiVm4sB2PvFIi2UZNRyVl+nb5F2m3
X-Received: by 10.31.7.204 with SMTP id 195mr16677225vkh.175.1484585357205;
	Mon, 16 Jan 2017 08:49:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 16 Jan 2017 08:48:56 -0800 (PST)
In-Reply-To: <20170108083854.5006-1-mar.krzeminski@gmail.com>
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2017 16:48:56 +0000
Message-ID: <CAFEAcA_QZ2k=V5MC_=ny++8VebFyq9dFDJsohOGVjjuChVrEyQ@mail.gmail.com>
To: Marcin Krzeminski <mar.krzeminski@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [PATCH v3 0/3] block: m25p80: Improve mt25qu01g chip
 model
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xTx/sr+XTS73

On 8 January 2017 at 08:38, Marcin Krzeminski <mar.krzeminski@gmail.com> wrote:
> This series introduce some improvememnt targeting mt25qu01g and adds
> support for n25q00 device.
>
> v3:
> * Removed debug printf
> v2:
> * Rework die erase command functionality. Since the number of dies
> is constant per chip, new field to flash description structure has
> been added (instead of dynamic code from v1).
> * Add definition for n25q00.

Thanks, applied to target-arm.next (with some tweaks to the patch 2
commit message).

-- PMM
