Received: by 10.25.208.211 with SMTP id h202csp215740lfg;
        Wed, 6 Apr 2016 17:46:41 -0700 (PDT)
X-Received: by 10.140.43.10 with SMTP id d10mr298346qga.38.1459990001625;
        Wed, 06 Apr 2016 17:46:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d126si4067353qkb.84.2016.04.06.17.46.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Apr 2016 17:46:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1any5o-0000c6-49
	for alex.bennee@linaro.org; Wed, 06 Apr 2016 20:46:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1any5l-0000c0-Bj
	for qemu-arm@nongnu.org; Wed, 06 Apr 2016 20:46:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1any5g-0001Sw-O9
	for qemu-arm@nongnu.org; Wed, 06 Apr 2016 20:46:37 -0400
Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236]:34175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1any5g-0001S3-J7; Wed, 06 Apr 2016 20:46:32 -0400
Received: by mail-qg0-x236.google.com with SMTP id c6so50787476qga.1;
	Wed, 06 Apr 2016 17:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TAqcSNBTkRqGoWiH7Gj2VotqZr1k5PvWH5z3cL8r0jw=;
	b=j4WnBwmucr3q5mSxQnxSHvFx94Q/zW8gM2sd6mxAhS9PokdcN7l8HIHp3yoLPsoD8b
	5DDuYuPmdRLq6I06H9Ze7tUNgex93AhASDNR4etUfkHQ0h746s2ujy2VOINV5nLOtG1i
	+qdWmeqTHeYV3qgPxQ9t+gwIGaZeMAaN0vIuHwhlD0TQ0BYEHw8P5UAtig/yDhSlJaTe
	2qtR5x/x/fhJ5pivRlacZEfPT7U8Zz2/yDGvDxJ1A7zfCqor/zM0oB2Xc3Yj9w5sdwdt
	1fY4eiGdFya5N1u0X6R9Ag3sm9aVGnKx2kagswPyKYaqW+dO9Qo6Nk99ZgSf3z69+G84
	uLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TAqcSNBTkRqGoWiH7Gj2VotqZr1k5PvWH5z3cL8r0jw=;
	b=AARVBb/F1jJflytW84mGYsO1pQe0sPMNzUG3N/xbrkDH2Q1+lCifB/5XJHOETfK9ry
	3zYlL/jee085CKAlhpgdJHyqX26HTpmW8haPey4JuyyQof1JCzL9rI85TRu1WXUKh8L/
	cS9UoFuDCb8uQAZeBivebHYR2YnAPdURFj/izDDFPzIEg0+TmuiocMW7H0ct9AuhAq8X
	29ZtWomsX5hojfAmsWtShtOthFtWTjkRnVqHhmwJjo4aj8BBCwtrVJLUtUg9V9ii4uWR
	YK2UjReqFFHwK4Y4pln3ymqDIQ3T61Aar0Jw8KKweHRHeT9ps2hhF+0XbxXS4mlaiPlI
	j6zg==
X-Gm-Message-State: AD7BkJLN7pFvhBUiVvrBI/wnWan8DcZIcCDEE75lAnvQLNGtgUsRTqvwbsDTU7OJ6IL0FA==
X-Received: by 10.140.219.134 with SMTP id p128mr293764qhb.80.1459989991793;
	Wed, 06 Apr 2016 17:46:31 -0700 (PDT)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	n48sm2379073qgd.38.2016.04.06.17.46.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2016 17:46:31 -0700 (PDT)
To: Liviu Ionescu <ilg@livius.net>
References: <4472FF70-5E47-41AA-893C-01CF82C8BA2D@livius.net>
	<CAFEAcA-PM5GCL0RNhPm9bsMZm_ya7vdES0SG=ozwCKY2dCQWjg@mail.gmail.com>
	<F9E27184-2608-41F7-ABDE-FB02DB46A593@livius.net>
	<CAFEAcA9mmAL8cdL7Ayvg0kLq5LZbt5fiKsBVaCJ5XAwTNObaGA@mail.gmail.com>
	<49544542-7BDE-4C03-843C-7852D345CF46@livius.net>
	<CAFEAcA8m5z_HZHLKx0985nFVwK1tHoQYH6b9kmCP0X8hK5R-RA@mail.gmail.com>
	<D2CD166F-5E77-4BA1-B468-64296F379D05@livius.net>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <5705ADE6.3070502@gmail.com>
Date: Wed, 6 Apr 2016 20:46:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <D2CD166F-5E77-4BA1-B468-64296F379D05@livius.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::236
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] Any progress with the Cortex-M4 emulation?
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
X-TUID: R38Kw5JOAc4m

On 04/06/2016 06:23 PM, Liviu Ionescu wrote:
> 
>> On 07 Apr 2016, at 01:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> ... Somebody needs to do the necessary work to fix the
>> code review issues. ...
> 
> in this case I'll probably wait for this process to be completed and reevaluate the situation by then.

Liviu,

I haven't had time to complete a revision of my patch set so far this year.  I've been busy with other work (good for me, bad for qemu), and don't see this situation changing for an least the next two months.  It sounds like you have time and inclination to do part of what I've started.  I hope my having done half of a too big job won't keep you from finishing part of it.

If you decide to work on this problem, please don't hesitate to appropriate, or ignore, what I've done so far.

For what it's worth, I did start another revision back in February.  It does include the change Peter requested to the storage of priorities wrt. prigroup, but doesn't break up the big "rewrite NVIC" patch.

https://github.com/mdavidsaver/qemu/tree/fixirq2

Separately, I have a set of target test programs which I can run both with qemu and a real board.  They mostly agree.  Aside from test8.c (MPU) they might be of interest.

https://github.com/mdavidsaver/baremetal/tree/qemutest



Michael
