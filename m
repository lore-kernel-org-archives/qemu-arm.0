Received: by 10.25.208.211 with SMTP id h202csp1258495lfg;
        Wed, 16 Mar 2016 08:33:21 -0700 (PDT)
X-Received: by 10.140.40.138 with SMTP id x10mr6183938qgx.2.1458142401241;
        Wed, 16 Mar 2016 08:33:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 200si3339909qhm.18.2016.03.16.08.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 08:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agDRo-00076g-RE
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 11:33:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1agDRm-00076N-D6
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:33:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1agDRj-0001Ss-6A
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:33:18 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1agDRi-0001Sd-Uy; Wed, 16 Mar 2016 11:33:15 -0400
Received: by mail-lf0-x243.google.com with SMTP id i75so1301353lfb.1;
	Wed, 16 Mar 2016 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=oXImSxuRbA3E3i9iVxiCvEckMQ+p1Xbk3+p9RZxUv3k=;
	b=NeysEJYuBZ1yh3vwCrfLLnIT4uUUvf4IYxbgji95AW8iqR97se51CSuEUbhQYjQO+D
	44OthpYeAVZ+i8xuOQM/KDFnY0MSf99hHm9Vk/LO0OTTccbyZq2bNt0v+ZwGe6w6IVQs
	Mr/QZXOtGxJXtABVCU+bbu8GZBRfSFX5GZENVMj5SS+l8JtvvyPlDb45qhR9o9Sq6/Pz
	eWsyCD027LyCTUP9Z/aPfTAt8HEpt4faemQYtGJ8lSqX7FOyxPCvjfhjO7BVjYsNBf4x
	n5TAA6u01tdhEzLB8iEFjuRomqezyoT+DT7ZTQUmCo6ml8YLchbqUODLSmCDqYZt+/Qs
	OgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=oXImSxuRbA3E3i9iVxiCvEckMQ+p1Xbk3+p9RZxUv3k=;
	b=e6Lqs3GqriNzmhyaBkHVyPf1/UUph5EuBOoTNBeL9ldnQ1FOEmbtjyROULf0krRZVp
	ppsuKfw2bdrAT0BwS5T6JLM/pag8sZHVlboA5Dd5dDIH+psyoNQehcI3lpKTyD0U8vwg
	gwWFA06RSWH7eXAlxt/A37V/OthzPX6m/LNOuINbsLUtTk2hErUTR6dfl2o+16jjdLP0
	rGSktW+zZne6fDHVdrE4SZcfsVOMHbAiNv+Y3UOpIxkW8CZ4L5JP+MZRYBQoVQRWS5hZ
	aLSzIod82NHnydEk+/WcduvG/7ywm2u/sg5u40+fHzsXAcNvKN49r1Oo2YKW9ViSAI9E
	pdJA==
X-Gm-Message-State: AD7BkJKlo4bKjasufT2Yt2zynslNntQySYXbcuXvHv1hIFXJWWj3ajTkfnewxUWk4wAiPw==
X-Received: by 10.25.85.204 with SMTP id j195mr1742770lfb.49.1458142393967;
	Wed, 16 Mar 2016 08:33:13 -0700 (PDT)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	f7sm634127lfg.19.2016.03.16.08.33.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 08:33:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1454169735.git.digetx@gmail.com>
	<CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56E97CB8.2040505@gmail.com>
Date: Wed, 16 Mar 2016 18:33:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v12 0/9] PTimer fixes/features and ARM
	MPTimer conversion
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
X-TUID: xJEpmBKvAI9P

16.03.2016 17:36, Peter Maydell пишет:
> On 30 January 2016 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Changelog for ARM MPTimer QEMUTimer to ptimer conversion:
>
> So, where are we with this series? It looked from the mailing list
> threads as if there were still a few things Peter C hadn't got
> closure on, but we're rapidly running out of time before hard
> freeze :-(  I'd really rather not have to push it out by yet
> another release, especially since it got posted back in January..
>
> thanks
> -- PMM
>

Well, I think the series is in quite good shape. Peter C got busy with other 
things recently, so review process isn't going fast. Maybe you could give a 
quick glance at the last two remaining patches?

I'll re-test the series on the current master and send out final V13 then.

-- 
Dmitry
