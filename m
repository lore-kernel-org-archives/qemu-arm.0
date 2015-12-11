Received: by 10.182.158.201 with SMTP id ww9csp380474obb;
        Fri, 11 Dec 2015 15:39:22 -0800 (PST)
X-Received: by 10.55.82.132 with SMTP id g126mr26974090qkb.63.1449877162862;
        Fri, 11 Dec 2015 15:39:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w107si21879605qgw.35.2015.12.11.15.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Dec 2015 15:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:49900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7XHW-0000Rz-LM
	for alex.bennee@linaro.org; Fri, 11 Dec 2015 18:39:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a7XHU-0000Qb-JA
	for qemu-arm@nongnu.org; Fri, 11 Dec 2015 18:39:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a7XHT-0003y2-PX
	for qemu-arm@nongnu.org; Fri, 11 Dec 2015 18:39:20 -0500
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:33775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1a7XHP-0003xP-Jk; Fri, 11 Dec 2015 18:39:15 -0500
Received: by qkck189 with SMTP id k189so27235794qkc.0;
	Fri, 11 Dec 2015 15:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=QVEFoNzOxrYzZhOYWZnnfv6L5wonPR97HMKYTQYq8gc=;
	b=h80tZG7Yu/Eui4dduaNOVL932BRY8BQHh1cR3vg6/GCcgOeSXqohvuhPNLZMinxtPO
	4JSsiTpYdF3C1xDSPvu7qmrlnH0Ldrv2BDb6qMz8QNlY396nE/0wRQY+G9vmwn6/ZYaY
	2OXZdm805P0vR/EMG3mUSAlqKj8V5EfiIRZKWn4ZifVHc+JlPvvK5cmJVG2EooZwAE8I
	YaBf1qZjpbVpxRly2CxQDDlJ5M2JBtucjMs3sfjh0CedeEu/C13gd1iGfJuVGPINK6Bs
	174hDCsC+dnA6ObI7xYROBXvc5NRnNz+onc3gJmm1GzBkuUr2wCQX/WYGWNSP6LdZSCB
	Zj0A==
X-Received: by 10.55.51.203 with SMTP id z194mr7504517qkz.21.1449877155154;
	Fri, 11 Dec 2015 15:39:15 -0800 (PST)
Received: from bigtime.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	h19sm9130528qgd.37.2015.12.11.15.39.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Dec 2015 15:39:14 -0800 (PST)
To: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-devel@nongnu.org
References: <1449773244-17078-1-git-send-email-serge.fdrv@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <566B5E9E.8040108@twiddle.net>
Date: Fri, 11 Dec 2015 15:39:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1449773244-17078-1-git-send-email-serge.fdrv@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::235
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
X-TUID: RSqQ3Awkv8BA

On 12/10/2015 10:47 AM, Sergey Fedorov wrote:
> The "PC advancement" trick was used just after recognizing that a
> breakpoint exception was going to be generated. This trick has had two
> points:
>   1. Guarantee that tb->size isn't zero: there are many places where it's
>      expected to be non-zero. In fact, that is even stated in the comment
>      for this field.
>   2. Try to satisfy disassembler's check for instruction length. To this
>      end, PC advancement was done for estimated instruction length, but
>      actually, didn't work properly in variable-instruction-length cases.
>
> Substitute this trick with checking for TB size at the end of
> translation. If we get an empty TB then just set tb->size to 1 and skip
> disassembling. Setting tb->size to 1 is enough to get correct behaviour,
> whereas an empty TB doesn't obviously need to be disassembled.

This doesn't help when the TB already has instructions, the TB would ordinarily 
cross a page boundary, and the breakpoint is at the page boundary.


r~
