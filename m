Received: by 10.182.158.201 with SMTP id ww9csp3300231obb;
        Wed, 16 Dec 2015 09:04:10 -0800 (PST)
X-Received: by 10.55.74.141 with SMTP id x135mr20631577qka.20.1450285450274;
        Wed, 16 Dec 2015 09:04:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si7264310qhv.68.2015.12.16.09.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Dec 2015 09:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:48453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9FUo-0006i5-0G
	for alex.bennee@linaro.org; Wed, 16 Dec 2015 12:04:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a9FUg-0006dd-3V
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 12:04:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a9FUf-0008QK-8Z
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 12:04:02 -0500
Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f]:34393)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1a9FUZ-0008Pa-J7; Wed, 16 Dec 2015 12:03:55 -0500
Received: by mail-qg0-x22f.google.com with SMTP id 21so39126106qgx.1;
	Wed, 16 Dec 2015 09:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=Z20+rDJcfLsBQcvPYu2z2Vq3zd7hdkPRU/Ud++18CEY=;
	b=ICLU0u9ia+qxFlA1Q8R8zKRMMlEKFUv1vK+q61JR9HlsRHwwHUlVirFsogQOe2XyR9
	Ylcf3PxKJg43iHAsLCo2CdjL7ntFF0oOJ93eDlbdhrXJv6DFPkztASIXXigw4OCIJlSB
	VNdU3Qug0wFc9y+ZPbW/95VEkPh1K4/g+0LbgItcB91c77Tms2NqSkumClY/aM2fiumx
	AMT4RMsACpBNORe0jIyqdMphNsPP1He5N2CF+7LJivFffZku1P2hdV0SZvORWDmCTjgi
	AJRRMzIZPY1XU7xnZTeqtLzG7hAeHqQRqeeeriX3r39XzTy3PBD4ZoGHaR0nXKzfRQbI
	KXdQ==
X-Received: by 10.140.36.232 with SMTP id p95mr63106022qgp.55.1450285435065;
	Wed, 16 Dec 2015 09:03:55 -0800 (PST)
Received: from bigtime.twiddle.net (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86]) by smtp.googlemail.com with ESMTPSA id
	207sm2899688qhy.47.2015.12.16.09.03.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Dec 2015 09:03:54 -0800 (PST)
To: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-devel@nongnu.org
References: <1449773244-17078-1-git-send-email-serge.fdrv@gmail.com>
	<566B5E9E.8040108@twiddle.net> <566C7D38.4040609@gmail.com>
	<566EEC05.2080702@twiddle.net> <56707FD3.20705@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56719970.9000106@twiddle.net>
Date: Wed, 16 Dec 2015 09:03:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56707FD3.20705@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::22f
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Anthony Green <green@moxielogic.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-*: Get rid of "PC
	advancement" trick
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
X-TUID: 56j3xBoT0eO+

On 12/15/2015 01:02 PM, Sergey Fedorov wrote:
>> For that, I think it might be interesting to arrange for non-empty TBs to
>> exit prior to recognizing a breakpoint.  So that a breakpoint TB is always
>> just the one operation.  Except for the fact that "generate an exception" has
>> traditionally been a target-specific helper, we could almost make the entire
>> breakpoint generation be done in common code.
>>
>> I'd think something like a generic "must we end the TB now" predicate would
>> be the proper hook.  It would contain all of the usual stuff: tcg_op_buf_full
>> and checks for singlestep, but then add "is there a breakpoint at the next pc".
>
> This could be a next step :)

Or perhaps a first step, since the patch you posted doesn't seem to me to be an 
improvement at all, merely a rearrangement of code.


r~

