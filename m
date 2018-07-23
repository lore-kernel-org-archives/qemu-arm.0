Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5772458wru;
        Mon, 23 Jul 2018 08:19:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd4i13p71FTw3iIZKlQz31wer17p0ULGBbVsBnd+YzzNXOVnDtq1hcB8//330FQqnsmzxHQ
X-Received: by 2002:a37:2c84:: with SMTP id s126-v6mr11509101qkh.311.1532359161072;
        Mon, 23 Jul 2018 08:19:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532359161; cv=none;
        d=google.com; s=arc-20160816;
        b=oW+eFBHLzU31jtH6v6HWlxzRBhKItw599oa08vNzuR0S118BxeqaQZyBFceYwAusP6
         pExMbh1BHtuwkcLO1DQq3Op9qz6HdbYpd8q+b8hz0aLN16qlnWLa7+6EmSRtJJSmQrRV
         b+4ShLMHJbsVZyT/kldQiuJlv5pAoc9b6tR7wkjblC/OS6SxKagt1kHPBwQrMhLv0N1u
         5o6V+aFKRboXXOq/1oYU+Gn30Uz5ii4MM8X9vD+RIbR/1OoN3zbNR8T7ijKpItXRLrGL
         RxglSiWm66c4GJMnjLjxW3A/m9wguO6r45znS3ekq3iujBjJ2Fn2Dy2ekMkxE3M7E10I
         F6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=MfPAz903yxD3VE/7Ay1xEgaytu6oRRWXDtnTX1Xght4=;
        b=ydzCW2R+SlajnVGmKUfV+u+MR4c4SIKdlFz6aP6tkcbcf2i5salMK0xlQkk6NaNi/P
         /Avzp9YTjlM1OL77CR/fvkHA2uqLv/1TvOz+BD9C0PjacbVAjk/0L/2i+5kYhOZMtO4G
         yArsEN5R4t3zVm7CKATQhklNpPhyLUgqd8Q4ccX/foewnhO/AUkB0eKLFaWMxVxvTpVI
         /5iMqzfnmf+2mytf3u87w4IOfpcZolfDeiDpsoWRZ0fpdEIjUo1zLeLgjFWvYwHZLvcA
         MbNrgoY1A2Xi5eLS6a3Jy6YWiQlhDZ0x0OZN15n057IIsXLIZVo8BE/OBOFTi/Io3UYL
         50vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AElcsEOl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v40-v6si3297643qvf.11.2018.07.23.08.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 08:19:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AElcsEOl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhccK-0007Xw-Lu
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 11:19:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhcbC-0007Et-VB
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 11:18:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhcbC-0004Jk-2k
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 11:18:10 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:33367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fhcbB-0004JW-Sh
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 11:18:10 -0400
Received: by mail-oi0-x243.google.com with SMTP id l10-v6so1796927oii.0
	for <qemu-devel@nongnu.org>; Mon, 23 Jul 2018 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MfPAz903yxD3VE/7Ay1xEgaytu6oRRWXDtnTX1Xght4=;
	b=AElcsEOlBSqYMNY4OsoAUFFr27Wem8Jppk9PlhwQf/lkBnNeNhY9Q3/ZXMDvjPvJBK
	PAnrey/5/ZcMTxLc9Q9AN7UcKkcyLaxdj9kYEuKIg8uKsbHVD2ttLKbedGW1SSXZk1hN
	D/9cq9m6JkyWV6QvAIrB0Z1Kqc59IRpkVPGrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MfPAz903yxD3VE/7Ay1xEgaytu6oRRWXDtnTX1Xght4=;
	b=IjZ85PfA+jWOa6Ry8oYPNV0vI46CWE15dJNE52A/JRWKtBmi9L/fC3Hm8FX5bqNcF6
	Mc/03Hz1S6/x2gvMATAW5y2t1ZVVk0NdjVurk1g2s6IZ+XllHvVrU7wcKhNnvhvC9Qk0
	jlEbyobws9Kw3Ex3ElLLHoCTLq8GWN+Sb7nJZdLdU1wtJzcsfQ6DMZz/tTnjZCclEyg7
	oO9kG4HzACJeiQTM1mis7o+fYI1hoKdBmUj1yTKSx5Ybz9YtBHUo0+59kIn1rmVZnCNV
	pUxXCbM55Qjpe+Azl4jdAMVVYp0px0wJ23foGUQ5G4DvpUIgCfxTGp6GphrQxhGNfblZ
	vq+Q==
X-Gm-Message-State: AOUpUlE6yWHK4ebR46oJb1DcUj94W7lS3hM2aEqFULVknImNaSCKpEyF
	ZS+YuPu6XlNnbASj0KdkniSakrBPCl0BXO9ZeCX3GQ==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr9145247oih.12.1532359089304; 
	Mon, 23 Jul 2018 08:18:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 08:17:48
	-0700 (PDT)
In-Reply-To: <ce2458db-7b97-1672-48cf-b88c24d93157@kaod.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<ce2458db-7b97-1672-48cf-b88c24d93157@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jul 2018 16:17:48 +0100
Message-ID: <CAFEAcA88a15YJ86bK+3=OMG-2=URAgfXEjFoAx603YpCsw5X2w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH 0/6] accel/tcg: Support execution from MMIO
 and small MMU regions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W5eQW3ZpRGsl

On 23 July 2018 at 15:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 07/10/2018 06:00 PM, Peter Maydell wrote:
>> Note for the Xilinx folks: this patchset makes the mmio-exec
>> testcase for running from the SPI flash pass. Cedric: you might
>> like to test the aspeed image you had that relies on execution
>> from an MMIO region too.
>
> I have added a memory region alias at 0x0 on the memory region where
> the first flash device is mapped and all aspeed machines, palmetto,
> romulus, witherspoon booted fine.
>
> More or less 4MB of data access is generated and the slowdown is hardly
> noticeable, around one second on a laptop.
>
> I wonder if I should add a bool option to the machine to activate
> or not the feature ?

I would tend to go with "not" -- if we need the feature then
it's better to run slowly but correctly, and if we don't need
the feature then it doesn't cost us any speed I think.

thanks
-- PMM
