Received: by 10.80.166.35 with SMTP id d32csp160663edc;
        Tue, 11 Oct 2016 12:20:53 -0700 (PDT)
X-Received: by 10.55.169.23 with SMTP id s23mr4767986qke.32.1476213652976;
        Tue, 11 Oct 2016 12:20:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d73si2138450qkc.232.2016.10.11.12.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 12:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu2bc-0006d6-EB
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 15:20:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bu2bW-0006bU-BI
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 15:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bu2bV-0004Wu-Am
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 15:20:46 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:33138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bu2bP-0004TB-6F; Tue, 11 Oct 2016 15:20:39 -0400
Received: by mail-pf0-x241.google.com with SMTP id 190so921968pfv.0;
	Tue, 11 Oct 2016 12:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=K+Th554jSmbrlNQLaeDBkmwM8ypJG5lWST4ehh2QR8I=;
	b=PSQ+BYXme3n3TZp/sJq8nmOtwwTxMUmEXL4tbQeIbWF7iOs6Gvp+U/ut9fLrsiD+JY
	U6Pmt0sDm1ga5fs/QPdWI6A0DmNYawYukTh7d5s+bhkYf+47fN/QnXiwoxEX7OJejccz
	DlbZxH11jjOVhQU+59W1WYmup9RioXhLMPVNe5BZiJxy+9hLxPawFI4gQqH4IE/POz/q
	jS87B9nK8Dh0u3FCgXIek0ZNvy62J0ahr07hu/b84jo/mt3GnjqImOJ5OWp33wlfueIZ
	TSUYTsyF//o1xmsBtuLUWStU1m+oLjjQwuOwlaQ8JHocdkLAqYytje+pJnv6MqlwIz6+
	E/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=K+Th554jSmbrlNQLaeDBkmwM8ypJG5lWST4ehh2QR8I=;
	b=lRQaYfjgPVcQQjO6W7VhVXHv8wosd/mHAOpQ5WNjihqmYk657L55K/le3d/nLBTWTZ
	l3o7NDche/DSCHWNxElVCkYiyVDJiNYy8z1Lqqu3NYaFM8ABoXI1r9WDpLPI+GVLH1Rq
	hwhIoRWCHAlsFwTJHqePn8rC1yMnLaG8O2YhaiMuuLAccV6LZ4sSP1r460R8fJuepKk8
	PbnPrikyGQD6ayp7+YTgCBU6WOHyLf4PZ/GCz2fJBLpLZvX2zHErIF+UBGOCXm3G+Byw
	DQa//WCDMOAKMCMjvuwQ+QlWox4L8FTXaX56K/WJE/s4kk/Y4Zh57LBSXmVp/hc7bUka
	bCuA==
X-Gm-Message-State: AA6/9Rn86wlTd4K4LTBTGaZyCG57ODNzu/iIsWW6nhZuTPei58MsQIPx1PiIDk0oxNk73Q==
X-Received: by 10.99.56.87 with SMTP id h23mr3403405pgn.82.1476213638500;
	Tue, 11 Oct 2016 12:20:38 -0700 (PDT)
Received: from bigtime.twiddle.net ([187.217.227.243])
	by smtp.googlemail.com with ESMTPSA id
	l187sm6147202pfc.0.2016.10.11.12.20.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Oct 2016 12:20:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <20039503-ebed-fe18-be17-78d39643c9af@twiddle.net>
Date: Tue, 11 Oct 2016 14:20:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH v3 0/7] Runtime pagesize computation
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, paolo@archaic.org.uk,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qXoFK4XqjoYd

On 10/11/2016 12:08 PM, Peter Maydell wrote:
> The basic idea here is that:
>  * the target CPU implementation has to opt into variable page size
>    by defining TARGET_PAGE_BITS_VARY, and then calling
>    set_preferred_target_page_bits() in its realize function
>    with whatever the CPU as instantiated actually requires
>  * the machine also has to opt in, by specifying a new MachineClass
>    field which states the value they guarantee will be no greater
>    than the preferred page size for any CPU they create
>  * we finalize the decision about page size in cpu_exec_init_all()
>    (and then later attempts to create CPUs which can't cope with
>    that decision are failed)
>
> I would ideally have liked to finalize things much later, but
> this is in practice hugely difficult because so many things
> (in particular all the address space/memory system code)
> assume the target page size is known.

Unfortunate.  I suppose that 4k is still better than 1k, but I was hoping to 
get 16k or 64k (or higher) when the OS is configured to use such.  I.e. totally 
dynamically configurable upon write to the appropriate cpu register.

Given how the memory subsystem already dynamically reconfigures itself for 
changes in address_space topology, I assumed page size changes would be trivial 
and fall out naturally.

Anyway, patches 4-7 get my

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
