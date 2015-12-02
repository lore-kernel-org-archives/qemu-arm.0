Received: by 10.182.158.201 with SMTP id ww9csp3379104obb;
        Wed, 2 Dec 2015 14:58:36 -0800 (PST)
X-Received: by 10.141.5.136 with SMTP id h130mr7628406qhd.47.1449097114749;
        Wed, 02 Dec 2015 14:58:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j52si5836575qgf.35.2015.12.02.14.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 14:58:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GM6-0007ly-Ev
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 17:58:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GM4-0007hw-Ep
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:58:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GM1-0003GS-7a
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:58:32 -0500
Received: from mail-qg0-x230.google.com ([2607:f8b0:400d:c04::230]:35175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4GM1-0003GO-4X; Wed, 02 Dec 2015 17:58:29 -0500
Received: by qgec40 with SMTP id c40so46788508qge.2;
	Wed, 02 Dec 2015 14:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=KkXuu34uCy7XV1Y/glzgbBzMbGxHKrQd8QfbkVAiuxs=;
	b=XUMn4Kvt/dnLW6oKFaQHIqUFw6FV/unVPC49wImnNmvXbbIdfPR+CTQ7lUcbEFb31K
	KbDF5blSTW3rO37+qiG/V6lrl8M52XFK3JfzuCrbM4VRdIxl4Hn4GatdBmxY50mLAs23
	gMTea2poInzt5iwydKGkw+GkL49H4E7Mc1I5NbkOoQckGx4JNSrGrI5yrKWEERjLO3to
	vm1xlprNbJElt/lZygI6K/1KttYSF6JJmLnE2ULfcdXkJS94N/Glwfa79EUJTDHK0gEG
	FPSQSA7ZCniW2t6WT561qpetqA4RaivxdJcuTUh4BKLcR0m1ahGqjig4deifN5eTf47V
	X2nw==
X-Received: by 10.140.174.68 with SMTP id u65mr7895397qhu.62.1449097108782;
	Wed, 02 Dec 2015 14:58:28 -0800 (PST)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	s20sm2154599qki.31.2015.12.02.14.58.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Dec 2015 14:58:28 -0800 (PST)
Message-ID: <565F7793.4090707@gmail.com>
Date: Wed, 02 Dec 2015 17:58:27 -0500
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-6-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-qQBfSVx+q3yOgCy8O0VGfrW1u_BV6YduB+DpCMYWXVw@mail.gmail.com>
In-Reply-To: <CAFEAcA-qQBfSVx+q3yOgCy8O0VGfrW1u_BV6YduB+DpCMYWXVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::230
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 05/18] armv7m: expand NVIC state
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
X-TUID: 3DN+tcdeurdO



On 11/17/2015 01:10 PM, Peter Maydell wrote:
> On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> Expand the NVIC to fully support -M priorities and masking.
>> Doesn't use GIC code.
>>
>> Move some state to ARMCPU to allow calculation of exception masking.
>>
>> Add storage for PRIGROUP to configure group/sub-group split.
>> Track group and sub-group in separate fields for quick comparison.
>> Mix in vector # with sub-group as per tie breaking rules.
>>
>> NVIC now derives directly from SysBusDevice, and
>> struct NVICClass is eliminated.
>>
>> Also add DPRINTF() macro.
>>
>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> 
> This patch doesn't compile, because you've removed the definition of
> NVICClass, NVIC_CLASS, etc, but not their uses. A patchset needs to
> compile after every patch in it, not just at the end when all patches
> are applied. You'll need to rearrange your changes between patches
> a bit.

In the next rev. I've rearranged things so that each patches compiles.  At least according to 'git rebase -i -x make', so not a full rebuilt.

This does mean that the big block of changes to the NVIC are now almost entirely in one patch as I couldn't see how to split them up given that the nvic_state structure is changed so much.
