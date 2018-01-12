Received: by 10.28.173.206 with SMTP id w197csp2029723wme;
        Fri, 12 Jan 2018 08:15:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBovRmxfOhQbwLT7mEkJFtzQ7TBr+t9pvwLa2OjjP0aJH+VVXDGuswswI+tDLVe4wyNwn08In
X-Received: by 10.37.139.1 with SMTP id i1mr9992703ybl.47.1515773755190;
        Fri, 12 Jan 2018 08:15:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515773755; cv=none;
        d=google.com; s=arc-20160816;
        b=a/51Jea3J4wTbkubKnfzmJh72rpXUTbxQR1qcbqwsCOrzeoY7O2ko9aR+PBB0v1L2Q
         n3ycbB0eke3BbdPGdHbkbdBP7MOI4h4RVjKY+OhuQrEdBzz1I0qB5WjRjgugOArf67Mx
         zB9fQmIq6UBApO5raVyiNebc0WALDti1HnyPaCMGEX79d18jNl8S/l2nKa2Nc/xr60BS
         xH8n/M6M6e+iFW41VShRkLAlkXd0pYYmf834QJeOv5ez3GXMGwONb3/J0/yNscUk08Zp
         Byj8eSUTXP8RTb+G74Su9WmMAp4JZebKDgUWpQoLak91Ys/mwr2Vqjikd23LWoiin37n
         cuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=qrAotF6MGMwYz3zQ+DXEOxaBIDrPpL3CyDJMSQHGOCY=;
        b=qFjfleDh30Jd1/l2r+Jj27qKW+gQNU9u7DMYsDniBvv8TxfMvuP9WlZ1SUzcxEJkIy
         POGuK51NfyMbvHhROStW2H7mawB/0hnlGYgtoqqSXUhShSHtBYw/N5TX9cUfYMeGXQl9
         HFuFfin0q520JB+dVAOpjRjAVdflc1rgpCLf9pBSU9MS+9JU54ULGKR+PyLKd/g1G8J1
         xeNaI1bMFVNwYsJITnMJ2L/36kk0rltPnB2V/HdP7ZC/d4hViI1/WRWQBoBV4NekYXlN
         VWPyM2aRmAnb41QcuCyV9WLh4EXjbZrgVo8AnhEIK8iPzrXxjOyGXVgqcFxAWo8sD1KS
         Pp5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=jognPX7J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c186si4685754ybh.117.2018.01.12.08.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 08:15:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=jognPX7J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Received: from localhost ([::1]:50421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea1zm-0001LU-JH
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 11:15:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1ea1zN-0001JQ-KJ
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 11:15:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1ea1zK-0003PX-7V
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 11:15:29 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:59054)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1ea1zJ-0003NW-PW; Fri, 12 Jan 2018 11:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qrAotF6MGMwYz3zQ+DXEOxaBIDrPpL3CyDJMSQHGOCY=;
	b=jognPX7JXZKd2tYoQ56XQX/Hxh
	qZu52CAnniQMVQfuXh2cwKz1Dt461BC/iHexR044lbrCmX7Un2pUzB30hUowAZ2j1N+XIIRw8+dSc
	QhNdTHWk3Aa3XlV1wKU+jA9ZOrjrJON7RuxO8BlXLw/WPZOWc4k4bpNJMSTPNlEWPWxQ=; 
To: Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-3-richard.henderson@linaro.org>
	<CAFEAcA9igMy9u0WdTBvJWms1G4Cd2m0QXUucJeXCJ1Uo=7OAMw@mail.gmail.com>
	<300b87dc-7a0c-dda9-058d-674b115d06a1@linaro.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <7bec8c5f-3454-374f-b2e9-f01890e1996b@mail.uni-paderborn.de>
Date: Fri, 12 Jan 2018 17:12:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <300b87dc-7a0c-dda9-058d-674b115d06a1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.1.2730818, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.1.12.160616, AntiVirus-Engine: 5.46.0,
	AntiVirus-Data: 2018.1.5.5460001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-devel] [PATCH 02/23] target/arm: Add SVE decode skeleton
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P3RT7pw5zFog

On 01/11/2018 08:12 PM, Richard Henderson wrote:
> On 01/11/2018 10:20 AM, Peter Maydell wrote:
>> On 18 December 2017 at 17:45, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
> 
> I didn't want to attempt to generalize this until we have two users.
> Particularly if we wind up with extra options to the script to change other
> behavior.

I might be exactly the second user. I think there is little sense having
two generator scripts (one for ARM, and one for RISCV). Unfortunately I
missed the original mail of Richard and can't find it anywhere in my
mailbox. What is the best way to leave some review comment's for
Richards patch containing scripts/decodetree.py, since I cannot inline
it in a mail?

Cheers,
Bastian
