Received: by 10.25.30.65 with SMTP id e62csp847635lfe;
        Tue, 24 May 2016 10:17:02 -0700 (PDT)
X-Received: by 10.55.121.68 with SMTP id u65mr4225164qkc.92.1464110222730;
        Tue, 24 May 2016 10:17:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f12si3375597qhe.130.2016.05.24.10.17.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 10:17:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Fx0-0001eb-22
	for alex.bennee@linaro.org; Tue, 24 May 2016 13:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b5FvZ-0000uj-4E
	for qemu-devel@nongnu.org; Tue, 24 May 2016 13:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b5FvW-00074p-CU
	for qemu-devel@nongnu.org; Tue, 24 May 2016 13:15:33 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b5FvW-00074k-48; Tue, 24 May 2016 13:15:30 -0400
Received: by mail-lf0-x242.google.com with SMTP id z203so1585015lfd.0;
	Tue, 24 May 2016 10:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=LpXAyCJWCHn6akLLxfzISiKbH91AY6nE3xpv/HhkI4c=;
	b=Y/+RzDanBz8T+eZCe9gBcyu00A9h2amTSWsO781M7QAKWY1kll5ccHL7JssthSDBV/
	iZwuZXMqQ7IMJp72YuXNMIuUIbUuHLcLcRk+guUaUt+jlsi+lYjuyvbtckWeKQRB4yPM
	Mx9hML2gO9T4dJ2wDrMI7JBOLwXjRKWQD8bOZ+wRl28k8jWw0j8i5vv0HeJ1kHfZOl89
	cP4glN3fzMEErr7sd69n0RIRji55cyKAoNPNrE/yj4smtjb19yXde+seJZEiBJvFDtv3
	STMycUEmBgkcpGWBV8RhBMlhOtNrVEB4OLUoDAsydrUX15BuEm702WSpSwm15J5GN3eH
	1vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=LpXAyCJWCHn6akLLxfzISiKbH91AY6nE3xpv/HhkI4c=;
	b=g5uAWw8wf8o+L6UrtR7jUBWixQKRM9LZcUVrDZleSU+WSOGZyr2vlrTIb25UX/4P7Z
	kl7Ob3GwEsuOXUzlXjV8OUvvtASc4xuRuY48s/+8tCHbiOiYC8PT2RFxQLr6j5mRO7f6
	EtJ5TNp41E2xiLmpczYgNEC8+KyKoKWUpsxMeTa2o63pgCMgJxAh0tMEDYvDZJL05wPO
	1+sfNGksu3SPvdLFVQ7Bj3gxZxRjD6mEhvwzBfxqhr1Xd+yWVsFQ2H6Qc+4HGPrJZJ/R
	JVjZbWXNApab4sCqczGMjkfTDnnTARXFFoZNLc2V943uy9p0iL5q2iOny8eA2jaZ7Akz
	6NLw==
X-Gm-Message-State: ALyK8tLqhtGQdd0FakoNOLNfIYtBHTBYje4h8cHZQEECszNuboQqgKmhwHeaFySVipX8pQ==
X-Received: by 10.25.15.83 with SMTP id e80mr5607539lfi.71.1464110128939;
	Tue, 24 May 2016 10:15:28 -0700 (PDT)
Received: from [192.168.1.145] ([109.252.52.1])
	by smtp.googlemail.com with ESMTPSA id
	67sm635205lft.30.2016.05.24.10.15.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2016 10:15:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1454169735.git.digetx@gmail.com>
	<CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
	<56F92FFC.4020805@gmail.com>
	<CAFEAcA_SCnc_C_LteDMRwSXFa80gKOt0Gimc_R8vjVURWx8pSg@mail.gmail.com>
	<56FAE2D2.6090307@gmail.com>
	<CAFEAcA9o3gcsgLLPQpsnww+Wn3OgpXgM_gjbTg6t6J2_SmA=NA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0987a767-5d1b-ec54-f988-a2ae95e0ace4@gmail.com>
Date: Tue, 24 May 2016 20:15:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9o3gcsgLLPQpsnww+Wn3OgpXgM_gjbTg6t6J2_SmA=NA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-devel] [PATCH v12 0/9] PTimer fixes/features and ARM
 MPTimer conversion
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TJcgAAN1ga4w

On 24.05.2016 19:20, Peter Maydell wrote:
> On 29 March 2016 at 21:17, Dmitry Osipenko <digetx@gmail.com> wrote:
>> 29.03.2016 22:00, Peter Maydell пишет:
>>> On 28 March 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>> PTimer fixes ready for submission:
>>>> [PATCH v12 1/9] hw/ptimer: Fix issues caused by the adjusted timer limit
>>>> value
>>>> [PATCH v12 2/9] hw/ptimer: Perform counter wrap around if timer already
>>>> expired
>>>> [PATCH v12 3/9] hw/ptimer: Update .delta on period/freq change
>>>
>>>
>>> I'm afraid at this point I really don't want to apply changes
>>> to code like ptimer that affects multiple platforms; this will
>>> have to go to 2.7 :-(
>
>> Okay, this is fine too :)
>
> Can I ask you to rebase this series on master and resend it,
> please (or at least whichever parts of it you think are ready
> to go in) ? I'm sorry it's been kind of left in limbo for so
> long but I promise to look at it when you resend it :-(
>
> thanks
> -- PMM
>

Sure, I already was going to do it this or next week :) Thanks for remembering 
about it!

-- 
Dmitry
