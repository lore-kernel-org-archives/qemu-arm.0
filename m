Received: by 10.223.172.38 with SMTP id v35csp273651wrc;
        Thu, 14 Sep 2017 21:54:09 -0700 (PDT)
X-Received: by 10.55.40.41 with SMTP id o41mr5735098qkh.271.1505451249895;
        Thu, 14 Sep 2017 21:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505451249; cv=none;
        d=google.com; s=arc-20160816;
        b=GUpOl87QAs/bQxtLJS0iU0FDzCpxjb67BjRk3UF4m4QZAVaLECX18LTyl5Frg2UhqG
         Ri4fCVA1el0dnury64tNGCqopfJpXdA1JUpk2tO19dRkuCJ1+lC+F50HjFK1OYZVK8nk
         7eCJJpoypi0HRy4D+RZPyGIgKbGtjX3ZTZrsJEtHfRikDPru+E0/iTMsGcdZRl6JtQwX
         +EazGx8BLjKzGEVwvoqLMfW7CDbVJb1twiJv7pAjV3r5Jj91tTsaKAWJMYbCETamDm1D
         KQ02QSL8S+yvec37r6BtSPHNfdyvTyxNWdro0HO0wD1zJh5x7ksrD2j4HtbGSFIrkKOi
         jYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=H9yuEM49yxi56W7WPRQQvDyCoC3cjsv5W5msh1SdTlI=;
        b=aAoMnuXNBHTPeVHdY54KBz0RVU2SvYPMKYcvyIjFdeauAjQ3XkitNfbIqwuAHUUezW
         DjGRd+JGCeg+gqm670iaiWz9YRpDItIuekIZd/VG+mzVVeU3oCeg1BrZyrmdf3EDPTpD
         s9m8gz/26KDJmaxNoZr/mQxPJFEUDVZbBuALPd+HUSScOPXXXrgtgYhOLn2r6xUzT/KG
         FxDrH2SzjSYm5MGOJea3lZ+/AGnY2ooENYVHxCdi0kj/c0a3j26hOnSSiinnGn9+t8ld
         ArYfceoV7d8gvvrAupeYb4rGAgNF03PoORLvbxpr0hUowrjVMwdoZxohv9vRGOyyyXYe
         QvWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LcpscxeM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b184si46971qkf.407.2017.09.14.21.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 21:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LcpscxeM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsidj-0004Vi-Kd
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 00:54:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsidV-0004TT-LM
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 00:53:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsidU-0005A7-DZ
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 00:53:53 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:53591)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsidP-00058S-LO; Fri, 15 Sep 2017 00:53:47 -0400
Received: by mail-qk0-x22b.google.com with SMTP id t184so1180740qke.10;
	Thu, 14 Sep 2017 21:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=H9yuEM49yxi56W7WPRQQvDyCoC3cjsv5W5msh1SdTlI=;
	b=LcpscxeMZyLxj653qLm5Nookc623rpjNQTcgisNWiX38nFnufng6SkaHNOpYlj1bBs
	m6UazJUasaUGWSYBTrkBE0wOVJ0NxQAx5Anv2JOrufqGXDZrbH9v/VNC4PBlkpzKfwhJ
	r5lwQ2mOiIfd1EBe6yjsXjciC4K38ite26wZ+pBAQLE9OlVGhdymQb+T6pzVu5eNXiek
	YiuA/LfehSuHr0Axalr6Raj33l08AkYlrXyrXzgHRUK8PjrfQLYenYWyv+EqwkQWzHEM
	epjk3i+LWd12Fktxf6PKtqHXorDZC8i8Uya05ISH04hnizcmmHuZ3jdKvjTk52bxp0J9
	hpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:cc:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=H9yuEM49yxi56W7WPRQQvDyCoC3cjsv5W5msh1SdTlI=;
	b=tcOODoBe+3zgxQiwQvoz40NXO2Qim9+eYoOBKnN5eFtZytdoq8KQRcEE6ejFO1LsIX
	9PB6QPH/xKj7bQGC9YmWHtxdtWvwlyKBATaxFuoq15JlAS0s0rucquXZM3I8LjeSgnn8
	POXjI+0w/J4LiSBnpby+PlA+MnbyzmGQ1SxSmVTjTuFWADmeBGmNSyDcgpLYc8SnOT5A
	S5IolKTEPIjrV5xhhsIK30ssSFHp/NxjEUUffeetjibSRXXKuCszMXfSIKD6db7Ki4mM
	INr9wm6nqYKAEzmyX3T5Cd/+8yl6J42O1VWaEl/9B30UF2aSiqAuW1KSBsLPeQW+fMLL
	QnGA==
X-Gm-Message-State: AHPjjUhhk2SxUG7a0Gy6Eug5y+F29oAvU649vrmfdaFfOC1AptG1kgBK
	xydq5M4nnbfRa/8l1Lw=
X-Google-Smtp-Source: AOwi7QCdSxchw/l83/CXrbEin9kD6CGy5MXElHT5BboaxnDrOfnxRmHyHYIGwGlZzAv2aeqIr5Fi0A==
X-Received: by 10.233.244.1 with SMTP id y1mr5689375qkl.231.1505451226735;
	Thu, 14 Sep 2017 21:53:46 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id w31sm30290qtg.48.2017.09.14.21.53.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 21:53:46 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-arm@nongnu.org
References: <20170914183516.19537-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53de205c-7c24-426c-129a-7cce7ca67210@amsat.org>
Date: Fri, 15 Sep 2017 01:53:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170914183516.19537-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/10] Support the Capstone
 disassembler
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8FXtBbPlCyPW

On 09/14/2017 03:35 PM, Richard Henderson wrote:
> As occasionally discussed on this list, due to licensing conflicts,
> we are restricted to a version of libopcodes that pre-dates its
> upstream re-licensing to gplv3.  That makes our copy rather old
> and dated.
> 
> I've already seen this as problematic for s390x guest.  I'm sure
> the same problem exists for Power8+, though I haven't looked.
> As we go forward with vector operations we'll see this for x86 host.
> 
> An alternative is to use a BSD-licensed disassembler:
> 
>    https://www.capstone-engine.org/
> 
> This is an actively maintained project derived from llvm.  Moreover,
> it is already in the major Linux distributions, which makes it easy
> to phase in its use.
> 
> I've arranged the code such that we attempt to use capstone first,
> and if that initialization fails, fall back to the existing code
> from binutils.
> 
> 
> r~
> 
> 
> Richard Henderson (10):
>    target/i386: Convert to disas_set_info hook
>    target/ppc: Convert to disas_set_info hook
>    disas: Remove unused flags arguments
>    disas: Support the Capstone disassembler library
>    target/i386: Support Capstone in disas_set_info
>    target/arm: Support Capstone in disas_set_info
>    target/ppc: Support Capstone in disas_set_info
>    target/s390x: Support Capstone in disas_set_info
>    target/sparc: Support Capstone in disas_set_info
>    target/mips: Support Capstone in disas_set_info

At least this msg disappeared:

"Disassembler disagrees with translator over instruction decoding"

i386 comparison:

  ----------------
  IN:
  0xfffffc30:  cli
-0xfffffc31:  mov    %eax,%ebp
-0xfffffc34:  mov    $0x1,%al
-0xfffffc36:  out    %al,$0x80
-0xfffffc38:  xor    %eax,%eax
+0xfffffc31:  movl         %eax, %ebp
+0xfffffc34:  movb         $1, %al
+0xfffffc36:  outb         %al, $0x80
+0xfffffc38:  xorl         %eax, %eax

  IN:
  0x000fd5b8:  cli
  0x000fd5b9:  cld
-0x000fd5ba:  push   %ds
-0x000fd5bb:  push   %eax
+0x000fd5ba:  pushw        %ds
+0x000fd5bb:  pushl        %eax
-0x000fd5bd:  mov    $0xe000,%eax
-0x000fd5c3:  mov    %ax,%ds
-0x000fd5c5:  mov    0xf2f8,%eax
+0x000fd5bd:  movl         $0xe000, %eax
+0x000fd5c3:  movw         %ax, %ds
+0x000fd5c5:  movl         0xf2f8, %eax
+0x000fd5c9:  subl         $0x28, %eax
-0x000fd5c9:  sub    $0x28,%eax
+0x000fd5cd:  popl         0x1c(%eax)
+0x000fd5d2:  popw         (%eax)
-0x000fd5cd:  addr32 popl 0x1c(%eax)
-0x000fd5d2:  addr32 popw (%eax)

For i386, arm, mips32/64:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

This series but patch 4/10:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.
