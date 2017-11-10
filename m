Received: by 10.223.150.237 with SMTP id u100csp3132673wrb;
        Thu, 9 Nov 2017 16:22:31 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TAOAa/ql2kMFbNPF7QDzfIMbAB6VVOTNYf6olnVkt/vRj0iFqrgTBwU5P5hKD4c2jzQR2l
X-Received: by 10.129.114.10 with SMTP id n10mr1676502ywc.54.1510273351633;
        Thu, 09 Nov 2017 16:22:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510273351; cv=none;
        d=google.com; s=arc-20160816;
        b=s7ApaFAoYnjDeN9TsqjcwiL6H4Ce3dggLDfzKl/flExiuIg6s9RLGmoVHU2zVRRzCe
         PFh7ymMEbauc2A7cf6zfCPuA9d4bmr9PDSIXmTfCT9oaotUhXJF0VvUNvqkfByuOGuG7
         mYi2XLdsHxAj4zuOJkzUYkPpCHCzWbKvIUWEcSGbrXses+x/6XYjjKllU3teapSu2RlO
         OCzKhh1AJuugYARHmjwsVrTN9QRvR/2U3DkEmxVIvn3kax9UD+INLla4MOv2GQSYSkrQ
         jheV8zbCS5TG2cDKetZYvwKIXz7g56R0ImZKe8353NME8ngqDR6j6oV+3Nz7WeOYZhO5
         OrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=i7n0KuDPwvoLzLGAyS/rkBE5NtsuIJ5TI5rda3jLBGI=;
        b=QjDQRoGPJPuU6LZDf6dfhCFjUcjU4BQJWKcyaCMmcAHFoQt9mko9wSefvjPxQMv2Z2
         DlFHexjRDBdS9epZQiiIk+54aDhrop6FEewNOxw2aJTMljc1Sg4sMamshroHAoUC+moK
         pga/FS+EaryEcNipscxJgnSuN+wu+LLMFgRea5a7xX/YkzD1Y9t4W+nyhfs0hQH4TIxO
         Wtx3dRbrRNzl2S7JWQcy6MlWJ2XfGTISNrr56xlKPkIKQLf4SX/BcmXhTrGdLL/pOnfu
         3ZRU6Idkr3OR0JrsR0YgSbWaZXLfpoXvhnfTY+KZ+eyC5442oDDJpfJmE9W9cIwkAGpt
         DDxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nJULR1/r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10si169788ywh.629.2017.11.09.16.22.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Nov 2017 16:22:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nJULR1/r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCx5b-0001oR-2W
	for alex.bennee@linaro.org; Thu, 09 Nov 2017 19:22:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCx5P-0001o8-Nv
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 19:22:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCx5M-0007Og-Jh
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 19:22:19 -0500
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:53429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCx5M-0007OO-F6; Thu, 09 Nov 2017 19:22:16 -0500
Received: by mail-qt0-x236.google.com with SMTP id n61so9940985qte.10;
	Thu, 09 Nov 2017 16:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=i7n0KuDPwvoLzLGAyS/rkBE5NtsuIJ5TI5rda3jLBGI=;
	b=nJULR1/ri7BKYXClmUG9W6yu0CcqwmizJpjhzXgF9dGF9n0zo9asxsDEzwFAm64xec
	M+nTg3ZUcTJDYiZcQm4YVjeqvGKV4fCYf8KvdEk3hKNwCpMZg9K/DhGb4VYIBBqlFru0
	C00aJVp5TgVUdcJGspIh607LZq/nKU8SYJjy5zULx7TxeWL2+zpzvAqtna/o4hL699f8
	ItrUsSHykgk5xn1ZutUWskTbLz6zqPSX6U1Wslvw1XRICEpVrqKAMlrwJ5RhRLXeLGiq
	jevGl+/x+Y4eR3aMzMxl1Vvvl7JcmTDj0YThLlr+ljqX290KiiAdv/t/XuLqibBC7TvC
	9Rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=i7n0KuDPwvoLzLGAyS/rkBE5NtsuIJ5TI5rda3jLBGI=;
	b=U0sdqJfEunM3gYFszciHTWO5w+DhtymmWBlVBDfWkOCXQDSnCdqQ0NWw91gmnxDH1z
	hRTCMzKvVVC0ISFY9gP3hLGSI6sO8NgmOIJg0A/NK1v27QiasRCfxbOYXkwJumUH1eis
	bZMz/6clA0k+fDgHd14c4vD467Z9v2oETv1Jqg4a/VQtCu98uAxEVn1F0by0VlmSrVKe
	Pg3VMdnmwfFnlkLz21PAKb6ZIAvH1O2sxorrtTsUa98V/vpacc+QO1dtWCzCL9gUjnQf
	0t+JU2dMEUZlMdRl4Rob5uKnAf6fR4V2ri85y3tJ0mGnKijwzr+DBXDSucYrRnSexI6G
	sqDQ==
X-Gm-Message-State: AJaThX42+oW7KBZ5HMxWeYN5O8S4gb+u+YjbjJ9yR8vV/wy5Y/ByK1jX
	7gDScEciyZtXvbdyuA/gLQ0=
X-Received: by 10.237.62.252 with SMTP id o57mr3827953qtf.144.1510273335871;
	Thu, 09 Nov 2017 16:22:15 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y9sm5599419qth.43.2017.11.09.16.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Nov 2017 16:22:15 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	"Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
	<4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
	<CAFEAcA-ATtAougvALVo=48p+jVx5B+Ejq60TD9dGYEQU2ReWCQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5a7b721c-fe04-921b-b9d2-986c9930b00b@amsat.org>
Date: Thu, 9 Nov 2017 21:22:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ATtAougvALVo=48p+jVx5B+Ejq60TD9dGYEQU2ReWCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: Re: [Qemu-arm] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VEYrN1Ct6LnF

On 11/09/2017 08:55 PM, Peter Maydell wrote:
> On 9 November 2017 at 21:46, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Subbaraya,
>>
>> On 11/09/2017 09:02 AM, Subbaraya Sundeep wrote:
>>> add voluntarily myself as maintainer for Smartfusion2
>>
>> You need to share your GnuPG key signed, I couldn't find it using
>> http://pgp.mit.edu/pks/lookup?search=Subbaraya+Sundeep
>>
>> from https://wiki.qemu.org/Contribute/SubmitAPullRequest :
> 
> I don't in general expect to take pull requests from
> everybody listed as a maintainer in the MAINTAINERS file.
> That just means "I'm going to be reviewing and should
> be cc'd on patches". Pull requests are sent by people
> who are maintainers for a subsystem. Rule of thumb:
> unless somebody asks you to send a pull request, you
> don't need to do it.

Ok, please apologize my misunderstanding. I still think the M: entry
stand for 'Maintainer' instead of 'Mail', and still don't understand the
difference with a "Designated reviewer" (R: entry):

        M: Mail patches to: FullName <address@domain>
        R: Designated reviewer: FullName <address@domain>
           These reviewers should be CCed on patches.

"Designated reviewer" seems to duplicate the M: entry and is therefore
confusing. Can we simply remove it instead?

When introduced in fdf6fab4df4 the explanation was:

--
Some people are not content with the amount of mail they get, and would
like to be CCed on patches for areas they do not maintain.  Let them
satisfy their own appetite for qemu-devel messages.

Seriously: the purpose here is a bit different from the Linux kernel.
While Linux uses "R" to designate non-maintainers for reviewing patches
in a given area, in QEMU I would also like to use "R" so that people can
delegate sending pull requests while keeping some degree of oversight.
--

Regards,

Phil.
