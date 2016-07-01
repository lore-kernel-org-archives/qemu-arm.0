Received: by 10.25.21.96 with SMTP id l93csp506195lfi;
        Fri, 1 Jul 2016 15:34:34 -0700 (PDT)
X-Received: by 10.55.4.23 with SMTP id 23mr789598qke.179.1467412474830;
        Fri, 01 Jul 2016 15:34:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z197si366389qkz.259.2016.07.01.15.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 15:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ718-0004x2-8z
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 18:34:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bJ712-0004wv-Hp
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 18:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bJ70w-0001r6-GN
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 18:34:27 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bJ70w-0001qv-BI; Fri, 01 Jul 2016 18:34:22 -0400
Received: by mail-qk0-x243.google.com with SMTP id n132so26585893qka.0;
	Fri, 01 Jul 2016 15:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=FcCtQQO71xmCnHm67qXXnpla0J1ocAEZ1c1miIirvKk=;
	b=do+Hzg0qN0ZsCasDutsccPIjpxemd6C11CPUHtY7qEyuOXZt9gFUvhPNv8+/YM+vwQ
	8kMeglOUJfvz671KgHY7GH9OvgkDksZEym7nc/Y4IxfIRbuuVEEKzVzb2JVtTOeZRLKl
	uvPEUnBhuIxGcMFRUULopBZl51DUFegou3Iot3NpKp7mZE+ZBN71moD8Uza2Ii5Rg5B+
	LnC+aNPX2Y8CnlGvbuelg+1WnDWxH8jrcrATwYS1xuX85JDOysJyVzRzf3Ucj2RrZ8DN
	11KLqg8A2qXvyL+3+FzAeN1/lFUhQRMYlHWoNqUKj9WiwbzfLE9FAIQA/IYpPz0rJS9V
	sQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FcCtQQO71xmCnHm67qXXnpla0J1ocAEZ1c1miIirvKk=;
	b=K32pRmgynk+JMP1FoT0F098UPFBFcdxW++9M+ZUyL62GQN4PeS0ejP0g5mmfN5gfAc
	8hZYeRriQRHdxYXtv097PAVf9OkACqDtFEuYGK/Q3AnD7SFdO875JWnZCw5x93gkX1SJ
	hc9RwU7DUh+AR/Wwy3t4RMqf6r7YTZpJ5mK4KXllBtNDPEqVa3r71pgN18b6yhAL0jHg
	vmshbv+WaSfSc4qTFuFCrcO7YpcaScQP8w14B8uAJxDqOmxZJonkGjqCNQnDOAbqlBes
	mD+b2XZz3+0qcXBqRzKaIrmdfghPpIEonSO16JsrjTfvwpnyO0ZNe9+jytR2Qu/a/s9o
	zB6A==
X-Gm-Message-State: ALyK8tJ9g6t4yIJ/aZUoKvOBCkmo5nPzqRC7NPygfmuUAD/a90eEE5ZpJ56d4leGH1xAwA==
X-Received: by 10.55.158.2 with SMTP id h2mr930427qke.94.1467412458636;
	Fri, 01 Jul 2016 15:34:18 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	59sm1678847qtb.21.2016.07.01.15.34.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jul 2016 15:34:17 -0700 (PDT)
To: Shuang Zhai <zhais@purdue.edu>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <DM2PR08MB1372F250DD79F123EDC2525ECA240@DM2PR08MB1372.namprd08.prod.outlook.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <18b4c362-d48c-058a-4b79-e2a351dc2978@twiddle.net>
Date: Fri, 1 Jul 2016 15:34:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <DM2PR08MB1372F250DD79F123EDC2525ECA240@DM2PR08MB1372.namprd08.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] Expensive emulation of CPU condition
 flags
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dSc1YxAUrNs2

On 06/30/2016 11:13 AM, Shuang Zhai wrote:
> We wonder if there exists any optimization, e.g., directly mapping the
> frontend flags to that of the backend? Any suggestions are appreciated.

Directly mapping frontend to backend flags is a non-starter, since not all 
backends have those flags.

There are alternate methods of emulating condition codes.  As an example, 
target-i386 and target-sparc store two values and an "operation code" value. 
The latter indicates how to treat the former.  This allows for the full 
computation of the flags to be delayed, and for the host compare-and-branch to 
be less complicated.

See also my design for an improved m68k condition code scheme:

   http://lists.nongnu.org/archive/html/qemu-devel/2016-05/msg00501.html
especially
   http://lists.nongnu.org/archive/html/qemu-devel/2016-05/msg00524.html

You're welcome to experiment with target-arm.  If you can create a scheme that 
performs better than the current, we'd like to hear about it.


r~
