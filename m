Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2879691wrt;
        Mon, 14 Jan 2019 02:24:45 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7hyqWEqdBmUoqz2Mj2AJ4SCjx62Se4AMnIKOFdauHBTxzX3E9FKKWoXOR45DSs31j9rMnf
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr22489443wrs.7.1547461485556;
        Mon, 14 Jan 2019 02:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547461485; cv=none;
        d=google.com; s=arc-20160816;
        b=DYe3aQPMzTzMpIEHBd6/wxUIrVESfHBMo4ZPk/J9eAYQmU9o4vEXtmxFdEW7UFh7Ok
         qQrgUwSFYQOQ2y5oouUHt/Ho660tfCFqQrn/aAnUvvn/A+BkNvse0/Rcyi1LuSTsbUmN
         yKeHdau1/KTHMfXdln7F3rfHU3DnDHLTXJfthwlU+x49hOqVQarHvr4q6nc11FyXMb84
         sF+VX0jYXS18TOYNXJd930xKVGUnXfSn8ix+TmSHxBXCSYAnifqHgHDG2I5iJPid7RYp
         nPBf6l6ujs8qSqtld39eNYxYfAA5sr/loWQx+liGsWF6Jn+RHZO0s1K9CugyI8IRe4o0
         zzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=SvJvb0v8Ox4B/9kFxlO4j7KMZmfZqUvB6HxxIzmrZ6Q=;
        b=MocFsf7AfKC36bYidPYrfVVBPlli4kNpcKGHWHbhP0M9LrWicf/KaYIYOCF1Kh9CE2
         zIMs7ad2LVW8UNYSkXfuQifw5/fGUKim9Dbd1jWBERrm58acpgnP5sQ94NO7qK4Dgs0o
         j9MGkIYNigTToAuY9Sfl+HB37JECyN/bfQgK8OfYYpMfGDe8wDvNwejYEohp+sA0THiS
         6ufCswK9swIWH2j/xHzJ0fZ359YdSPVAAGwAZw5bGWB+BOO8KVIf01QASTHHn5I7swnj
         J6CBtrqxVpudP2WxjlXLCcNDBmnVVLE9lG87xnUIUt/HHRKSZXtNg9uwiq/2vdI/mQTa
         W/SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si48186102wrt.169.2019.01.14.02.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 02:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gizQC-0006og-Ho
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 05:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gizPt-0006kE-67
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:24:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gizPr-00062M-Ev
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:24:25 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gizPr-0005tL-6l
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 05:24:23 -0500
Received: by mail-wr1-f65.google.com with SMTP id u4so22184571wrp.3
	for <qemu-arm@nongnu.org>; Mon, 14 Jan 2019 02:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SvJvb0v8Ox4B/9kFxlO4j7KMZmfZqUvB6HxxIzmrZ6Q=;
	b=P5orR5sttN47DfRqca166GrshRKgsbSWxzy0j/hxXyYCfHvaINM9Svyf3D9F2S0Mku
	fbKz6t/itmxNsLN4MZFeYVnZytpstyy54ktL8dNb/510WtMb5n5G9F9K0HHnV724Vt7e
	JDAfck4A8hO1CJAYUW2udCbv0kuXRnFdyeK8HiufwheDIbFiCCcjFEz+dsqlfPZXJVl6
	n0bJ8052+/yfA/PaySV7nMxMmpVScFSRNamUuVn8D+QT15er80ofKXpnqJrIvXwPd+fc
	FOCk6FH4orcVRMwv0cScApOiN3GjCHSat1H5OhCfHjjRHFkTy3dL3rw6RrQ5vaq6U3Pv
	6p8g==
X-Gm-Message-State: AJcUukdhzO8S0HN6E3+T/CqJekeBVgIivZupJwA1ju2IL7yttvZFuf+f
	GE038PvR5GfDq7/ASMscv6yCGg==
X-Received: by 2002:a5d:418b:: with SMTP id m11mr21930422wrp.8.1547461457126; 
	Mon, 14 Jan 2019 02:24:17 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	b18sm69019641wrw.83.2019.01.14.02.24.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 02:24:16 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-16-philmd@redhat.com>
	<8a7ef73f-97a4-d270-9836-3936b7be1046@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f91cbbae-c3a0-d182-6de9-4ddd0c3892fc@redhat.com>
Date: Mon, 14 Jan 2019 11:24:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <8a7ef73f-97a4-d270-9836-3936b7be1046@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [RFC PATCH 15/15] ui/console: Add "ui/pixelformat.h"
 to declare PixelFormat
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RoAQWzKPqbZv

On 1/11/19 6:32 PM, Paolo Bonzini wrote:
> On 11/01/19 15:08, Philippe Mathieu-Daudé wrote:
>> PixelFormat is used by "ui/console.h" and by "ui/qemu-pixman.h".
> 
> ui/console.h already includes ui/qemu-pixman.h, just move it there?

That was my first though but then noticed pixman seems a bit
different/unrelated. If Gerd is OK I will do it. (I should have written
that in the commit).

> 
> Paolo
> 
>> Create the new header "ui/pixelformat.h" to declare this structure,
>> and remove the forward declaration from "qemu/typedefs.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> RFC because "ui/console.h" has on license, so I added a default one.
> 
