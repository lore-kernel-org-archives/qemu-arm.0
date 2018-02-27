Received: by 10.28.71.27 with SMTP id u27csp5365431wma;
        Tue, 27 Feb 2018 15:09:40 -0800 (PST)
X-Google-Smtp-Source: AH8x225P0VpOk9G5HLyq1AKET2u3FmffQGTQcRp0fKrcmPpuroLyCuJ8WjWUklSx5Tw3lBwQpmhU
X-Received: by 10.13.218.2 with SMTP id c2mr10656177ywe.13.1519772980704;
        Tue, 27 Feb 2018 15:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519772980; cv=none;
        d=google.com; s=arc-20160816;
        b=NGsPldZj/1XQqQBxebsX19PdUmM4ldBSoJAruvcncSMLQgXuIaaeZBlXBnhHLSvoxP
         /jkewUnXXEkL01tq8s1aWUmHl6OL1I4x3M8g2B3Igdt2FyYfRnUlAYeFel21ZXYBtOys
         RgeRU0MCtE1lYR+kieuLkD/Tpb1IY3yXWwe/+SlnMtC77fZ1/nmBI7B4aZjr3Wl6Uyef
         FV+VWuHXY8z4o4L/ZhvmedoJ7catBLHJAEZPjT0T1RD8322tZDmOayDh6d75XY0xPklj
         tui+xVb6Zqby38ZMHx7D0wrcnGVbckCQXr+BfrQgngLr0GqTts6YuC9PIiH9BqWgHWlp
         tSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=j/H/PLEtXbvaxT7xXo8+CL3wBFyajFA3tck4L5grf2Y=;
        b=JITej1jSftOOQ4UKidyHUUKHFec5F4sazhDY0laGTNZUtbcLVPHG4Dx/BFyfPS1SjW
         5oV9/mZdgitFwAwwjyZMU9yqcQc8ghgWo4GgO6Pit0ZvDIiMAWWHtLa3FwnK8FityGkj
         uvdd8cM8t1pNyolcsNhwVT/7IlOQE9hM1v29OSv213hzqk4jFWfYOqa8qazgW3kWyCdi
         m0lkQsV3ai6bOzYwZar5jZ0rKrBcT25hF57SG4RYQ1Aztl+AuvPx9tqRrj8G9RmKv5oN
         o4mnT1ZQG44yHcqEp9hlUd/mn/rOI7MEsMbqj3dIS3c7OSdCMKis8azpTSIjIVu2K4iQ
         Lp2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vcdIX2Ll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t9-v6si45321ybc.138.2018.02.27.15.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 15:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vcdIX2Ll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqoNQ-0002ak-6H
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 18:09:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqoNJ-0002aU-5q
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:09:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqoNI-0001gf-6E
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:09:33 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:43188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqoNH-0001gC-VY
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:09:32 -0500
Received: by mail-wr0-x243.google.com with SMTP id u49so462744wrc.10
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 15:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j/H/PLEtXbvaxT7xXo8+CL3wBFyajFA3tck4L5grf2Y=;
	b=vcdIX2Llm7eW5+B+8pZF9FjS1RRX6OK3DPwRmyXHsnsPMDQGZ327ZTgecMeeYCBl1Q
	3gNYGDpdaW9/PzY38dCIUyUL4vrKWP0nmlCIStsNLIGQeEvEqT2KRPzd4Nl2ZztC6KHr
	7fvgLLfybU3Yd3TbEV2kGK65Azj/KqQ9tBV7IBoK1R0n7B730eX+5GKLhBVs5KHQGAxd
	jYWLD1Fx1zC1u9KXLS3zA2F3dXxMQBb6vAjCVJbyZot4cnXwnA562ReXCxBjeaL6oXJT
	OZlMRxfmcI3ijK+xPG6Z48H5x7ui2HriaOMSf3s0Xv/oyay9yz123SVlgo0tmI4f6XfG
	XpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=j/H/PLEtXbvaxT7xXo8+CL3wBFyajFA3tck4L5grf2Y=;
	b=ZJPSAzdzH6f+wQJFlE2CVGrakMpFoZdGSz99FA7FxRWtIP6dC0PQceTBlnj0f2KZ6I
	UNiyLv9yIb4lC+LHveQrSDZIAhRxxQzhdxdOTwfadrWcX51ZPPvjXoMP4JC+ZTgsiAZE
	taqoiKZxFhcO3eB0T40VdEEMDJs5afctI15VM+iOudJ2ktFhEdBW3enybtOSpsS3Nomv
	0d9ckSlS0zNZrzWYf3JP/RXmeXaQ0F253tbhueGgZ6cRSIYNajwUlejeVc/avURKq4u8
	oIql0/XDpNU4kGjYKKXqyQsMJbKKIYGcPcHPP7KUOMOiAuV4C/B2vUg/3WyXOtMyWm01
	TLZw==
X-Gm-Message-State: APf1xPBOTWURbHHC7nr3hifmYP7Ux31LnagEaGB77PvgwqxH1QsxWcUg
	zrynKdC7FWk+WFIvZrK+frRo3U8E
X-Received: by 10.223.163.222 with SMTP id m30mr4588121wrb.30.1519772970641;
	Tue, 27 Feb 2018 15:09:30 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7?
	([2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7])
	by smtp.gmail.com with ESMTPSA id 78sm785027wmm.22.2018.02.27.15.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 15:09:30 -0800 (PST)
To: Grant Likely <grant.likely@secretlab.ca>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Fam Zheng <famz@redhat.com>, 
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
References: <CACxGe6vSPG8KcmV5kpxcm3d41b9Vn++EZPAEm1qyoouZ5zPkug@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <af4c6c75-3d55-a3fc-98c3-0f2b162727ba@amsat.org>
Date: Tue, 27 Feb 2018 20:09:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACxGe6vSPG8KcmV5kpxcm3d41b9Vn++EZPAEm1qyoouZ5zPkug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [PATCH v5 1/7] hw/mdio: Generalize etraxfs MDIO
 bitbanging emulation
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 96swcErf/5U6

Hi Grant,

On 02/27/2018 07:50 PM, Grant Likely wrote:
> On 22/09/2017, 12:13, "Philippe Mathieu-Daudé"
> <philippe.mathieu.daude@gmail.com on behalf of f4bug@amsat.org> wrote:
>> From: Grant Likely <grant.likely@arm.com>
>                                   ^^^^^^^^
> 
> Hi Philippe,
> 
> Just following up on this series. I don't really have any additional
> comments. It has been many years since I looked at the code, so I'm
> quite happy for you to have picked it up.

Except Xilinx who uses another approach, nobody in the list seemed
interested. I used your work to run firmwares that are not opensource so
I'm not sure - yet - how to show to the reviewers the usefulness of the
patchset.
I have on my TODO "compare the Xilinx tree with Grant series to see
whichever is more likely to get merged, and search for examples/tests
from the Xilinx wiki".
Since I do this in my free time I have it scheduled to a low priority :(

> 
> However, it is very important for you to preserve the original email
> address that I used when I submitted the patches, and do *not* use my
> arm.com address. None of this code is owned by Arm. Please change the
> From: attribution and my SoB line to use "grant.likely@secretlab.ca"

Yes, I first thought this domain was not in use anymore but noticed
later this was mistake and was planing to correct it, I apologize for this.

Regards,

Phil.

>>    The etraxfs and Xilinx axienet Ethernet models implement quite a nice
>>    MDIO core that supports both bitbanging and direct register access. This
>>    change factors the common code out into a separate file. There are no
>>    functional changes here, just movement of code.
>>
>>    The etraxfs and axienet are slightly different. The etraxfs version
>>    includes the bitbang state processing, but the axienet version has a
>>    minor enhancement for read/write of phy registers without using bitbang
>>    state variables.  This patch generalizes the etraxfs version, with the
>>    axienet change backported in.
>>
>>    Signed-off-by: Grant Likely <grant.likely@arm.com>
>>    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>    [PMD: rebased with a minor checkpatch fix]
