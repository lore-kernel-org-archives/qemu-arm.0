Received: by 10.25.208.211 with SMTP id h202csp1296111lfg;
        Mon, 7 Mar 2016 01:57:35 -0800 (PST)
X-Received: by 10.140.143.134 with SMTP id 128mr29297333qhp.25.1457344655434;
        Mon, 07 Mar 2016 01:57:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q66si16117591qgd.93.2016.03.07.01.57.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 01:57:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acrux-0000U2-0V
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 04:57:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1acruu-0000SZ-UD
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 04:57:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1acruu-0000lm-0X
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 04:57:32 -0500
Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a]:36553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1acrup-0000lA-Hj; Mon, 07 Mar 2016 04:57:27 -0500
Received: by mail-lb0-x22a.google.com with SMTP id x1so123981305lbj.3;
	Mon, 07 Mar 2016 01:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=oF58OD1FwzovJsRdZ5njADfGMviwU76G/rxkoiojJnc=;
	b=QSlAmVz7kJ30S0Zic/rBAri/gUA5aDtZyfsizs8bfyq8+4jn6PH8BR72vwN5s4c24U
	aZShZn2Wek1ZIMcbmz4XbMLLy7pDewGX/UcABqWmrBxql3zAifkwphVp57PkzDYmoJEq
	xU1PSa9bSA/6DDDCJI/uEHmjD+v5/nRD08pzhswxqfBTO8SkDQcFAWM905uOVkq+OVIH
	ysfiH+1QA+Y/nuNZPAMmq5txqZxxk/HDGVwxJ3G7T6J3+89J6CzpH8qu0I9oXB1fEm2M
	VAn7VS9ycaYEDAdDrecrvkvmC+6eo+0f/784uf9HyIbixDYBBcNvZKpV1HV0l1DvEVMT
	HWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=oF58OD1FwzovJsRdZ5njADfGMviwU76G/rxkoiojJnc=;
	b=D1fHFLhQSTjiRNDwQjVZVJ/kqlsixrbBlth7cZRz+nnzxPvxM8+s3ON5761kWdnZOX
	j3cBzrX6IDm/VhExOKrZgHhl4vU8fG2eJQZXIhlbSfUdog9h8DgyRUrxikY66urVrTc5
	YaNsk7bi2RVbPFdmGSVK4xnHkt0xf4JdC63ULtZlU0nRxsWJbXyGWRL1/DdEsKH+Jtf5
	/dMjxYegbicmd+bMAPiYlwAnpnAb3ouN7jHfihqcezC+UdUEGJ8t3ttTA1/I6jidCan6
	dP8Di+lnc3IwfKiBP/nShQsocR/cCwwZbqdPty3o5IPvb4yF6ei07I74sYTGYM9KQWpB
	7w0Q==
X-Gm-Message-State: AD7BkJIservFPrGi1EHQJ/vjxx+UtzDT/DKBMROkC/SrOwz6sNnPrxSI/Qz5405DA4OxsQ==
X-Received: by 10.25.168.138 with SMTP id r132mr5598823lfe.77.1457344646536;
	Mon, 07 Mar 2016 01:57:26 -0800 (PST)
Received: from [172.31.81.134] (h195-91-255-43.ln.rinet.ru. [195.91.255.43])
	by smtp.gmail.com with ESMTPSA id
	l129sm2685132lfl.18.2016.03.07.01.57.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2016 01:57:25 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20160222222554.GA11598@beta.comsecuris.com>
	<56DC7F23.8030104@gmail.com>
	<CAFEAcA-h9MfC0xc9jc=nXSnX+AnCZngkdvJd=9nuSN1ndM6d2w@mail.gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56DD5084.1010201@gmail.com>
Date: Mon, 7 Mar 2016 12:57:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-h9MfC0xc9jc=nXSnX+AnCZngkdvJd=9nuSN1ndM6d2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22a
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Ralf-Philipp Weinmann <ralf+devel@comsecuris.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Fix bug: SRS instructions would
 trap to EL3 in Secure EL1 even if specified mode was not monitor mode.
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
X-TUID: zSZew7FtvqWP

On 07.03.2016 00:14, Peter Maydell wrote:
> On 7 March 2016 at 02:04, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> On 23.02.2016 01:25, Ralf-Philipp Weinmann wrote:
>>> According to the ARMv8 Architecture reference manual [F6.1.203], ALL
>>> of the following conditions need to be met for SRS to trap to EL3:
>>> * It is executed at Secure PL1.
>>> * The specified mode is monitor mode.
>>> * EL3 is using AArch64.
>>
>> The code changes in the patch looks good for me. But anyway, you should:
>>   (1) tweak the commit message title according to the requirements [1] and
>>   (2) add your "Singed-off-by:" line [2]
> Ralf-Philipp sent a second version of this email which did
> have the signed-off-by line, so this patch is already in
> master (as commit ba63cf47a9304113); I did tweak the
> commit message as I applied it.

Really, not sure how I missed that :)

Regards,
Sergey
