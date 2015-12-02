Received: by 10.182.158.201 with SMTP id ww9csp3376732obb;
        Wed, 2 Dec 2015 14:52:20 -0800 (PST)
X-Received: by 10.140.250.70 with SMTP id v67mr7894052qhc.43.1449096740451;
        Wed, 02 Dec 2015 14:52:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e81si5803644qhc.22.2015.12.02.14.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 14:52:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GG4-0003Ku-3m
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 17:52:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GFu-0002xl-0v
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:52:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GFs-0001E3-VH
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:52:09 -0500
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:36091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4GFs-0001Dz-R9; Wed, 02 Dec 2015 17:52:08 -0500
Received: by qkda6 with SMTP id a6so23101164qkd.3;
	Wed, 02 Dec 2015 14:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=10/veLSdvgqIDFB8SWWUnDsikg6WFnqSnFXtO5LTsz0=;
	b=x+kmo+hp8YT5V0Pa6Megc2IRQpNhgZwmKdA4mCxOwLddNpPmpLlAvuQeXnAy2m9vM5
	06E6UxWD0nA26kbMiNRJOTxHH0CSrlL1Tu7KJAvVgc07Pe8Cdi1V1PnDHLHVAxLpDuG+
	oXiAk7vJiqqqQBWRyEQ5b7IfXKknedy+suRCJGudoSu9yVtzn/1nkydGGxKdbp5Fqls9
	56Y2RBS0COM4kG9X5QBBTMdwQE0RJPBKvGsmi0EeW6+8R33IzyS2Myee38cTt634aHPH
	3FN3YFeVMIBzJ+INhxQnzKANajJvMKS58Bzg7G0Y0pLIR4376RRcjI1XksaBSKwFhTUq
	3vow==
X-Received: by 10.55.31.30 with SMTP id f30mr7208868qkf.5.1449096728492;
	Wed, 02 Dec 2015 14:52:08 -0800 (PST)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	b107sm2148729qga.10.2015.12.02.14.52.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Dec 2015 14:52:08 -0800 (PST)
Message-ID: <565F7617.1070107@gmail.com>
Date: Wed, 02 Dec 2015 17:52:07 -0500
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-4-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_As6k3yg0roE1ZSgWo4bufsRXkXYLaO7Q7YZBk==FPAg@mail.gmail.com>
In-Reply-To: <CAFEAcA_As6k3yg0roE1ZSgWo4bufsRXkXYLaO7Q7YZBk==FPAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22e
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 03/18] armv7m: Complain about incorrect
 exception table entries.
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
X-TUID: UQreIbtQ3Hpe

On 11/17/2015 12:20 PM, Peter Maydell wrote:
> This one's not really correct, I'm afraid (though the spec-mandated
> behaviour is a bit subtle).

I've dropped this patch.
