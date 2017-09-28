Received: by 10.223.174.134 with SMTP id y6csp289805wrc;
        Thu, 28 Sep 2017 10:19:40 -0700 (PDT)
X-Received: by 10.200.2.5 with SMTP id k5mr2008806qtg.163.1506619180679;
        Thu, 28 Sep 2017 10:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506619180; cv=none;
        d=google.com; s=arc-20160816;
        b=HVXtwvo/aR5bSOsDMs4Odwgn5Ssb9KihSXH36aEoEsWSbOXlt/dNDXCwSDPDwX14pK
         yJjKC3h3VPzJj5RF7ULDtIEAIfyxYTP3KaZ5BnY8uYSeTtgzBj2a+OEFBb6gu7OtxvwJ
         BB9RaE91URmRqC89Nt9p21icsypi6i1NW5h18krsHs1+LSCgKMz7kiIDe46YrPAK7CKR
         URXAVuuwwcbxY3rw2EM7fOnXCsmWe0QWHVR7nF02XOp9LfuUIIrcUuEuifscBdTe1bOg
         XC/HMSUZ0fjm2rZRl6olz8yBcbwvFpjn1ZdIkCmm/MUdHm1sgqvLmXWtuMzBjMBuIrIh
         6nsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=n5CpPVXKHaZhGA5H/hVTp818Bo2Iz7QS32VPIQtGhMM=;
        b=erWKQqjaNg6lhl07Z1tRzvpT6ydmTFZkpDBrdS7GnLXoVwtH6OfUXIs5bvVA/L4HTW
         tagzLYxLfZreyNiJ+VDVAsGS9rfNU9y2R6MswZUWun/q85EY5fDZiTGK395dRGpuxNrP
         sPBWI7wEZvN47VnM0kMBuKUy6dEmy2AhV+Zv7v+T7HP93NeoCHa2H8pXHtTt1wHFdaLH
         JPcsqApMOX8XTL7tyo0snOgHd5Nx81bMY5Mhp/IEjwQcuk+1eRuakuptvoYaXUYRvzKB
         EP4K33R8HHomAZTLSTplVqAKr07gAw5jfBbUJPU1CyhJo/dzgrK27rRFbxk7C2xnpdVZ
         6Tkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jtqj3U5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si2006605qtf.447.2017.09.28.10.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Sep 2017 10:19:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jtqj3U5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dxcTK-0008Mt-Ec
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 13:19:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dxcT5-0008KW-Kd
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 13:19:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dxcT1-0006Bo-Id
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 13:19:23 -0400
Received: from mail-pg0-x22c.google.com ([2607:f8b0:400e:c05::22c]:49503)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dxcT1-0006B8-CH
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 13:19:19 -0400
Received: by mail-pg0-x22c.google.com with SMTP id v13so724953pgq.6
	for <qemu-arm@nongnu.org>; Thu, 28 Sep 2017 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=n5CpPVXKHaZhGA5H/hVTp818Bo2Iz7QS32VPIQtGhMM=;
	b=Jtqj3U5hqzzL6iJHfYGOWzOevX1Pc4PNpNsJGWlWK//+aiKulF/2D/L+pAsXD4MVxF
	sEMyKB+8712AUGp3G1nG1BPDpnd5vv1T1y6wsJfZrzn0GI5HJHARzzm9Pr5md3zglNAf
	wJ5U7id7fUt4OZfCBSfi+nMKM1hjw7P8Z3e8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=n5CpPVXKHaZhGA5H/hVTp818Bo2Iz7QS32VPIQtGhMM=;
	b=TAAUU024QjbzFbsWXDj6hma1tc1qjDdzuCjztb1NzyMGStythE9ViStDGsDe9pG8Gn
	9zu4KBH9FB8H8ew3ew7tMGXAdvaC+ocNumqm9LjnZppIhC3EuOs0Hkk+UDIQf2H9L0XN
	y+Di8c4CDufb6z4pUDDeL1pQL4U6wuxXnHWJuPxMvjnawXfImxyW5lK9J3DwCJ83oCp4
	Wida3zEmvot3ZM54Dex+00Pt8DqjUm/C+MDm7/UrBQB/IccAEymyUfZHP0nh/tzxUtNT
	EL+6LD3eRj8yV5VgzF+iOox7qF8c8aCVVExkZ0M3ecM9PGr1W5PwDrkFTb74Xk+Sil+u
	/h+Q==
X-Gm-Message-State: AHPjjUjcs41AqdNI87t19tnMnbOnuxPNh7/T7IFAYdNES23AEmQJ7AZg
	MqPOCeDhepjBWNwFZiDKXV5DFQ==
X-Google-Smtp-Source: AOwi7QDEwLumG5dNsmozSZPMsSggGoDa67h9BJmoC612YCYXeJJWSZ5U9stYehkB8x2/ghHvotYu8g==
X-Received: by 10.84.129.7 with SMTP id 7mr4542423plb.40.1506619155365;
	Thu, 28 Sep 2017 10:19:15 -0700 (PDT)
Received: from bigtime.twiddle.net ([70.35.39.2])
	by smtp.gmail.com with ESMTPSA id
	n2sm4071309pfa.118.2017.09.28.10.19.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 10:19:14 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1506524313-20037-1-git-send-email-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <66d1d3b0-5f46-a682-1f3f-8945168f3aac@linaro.org>
Date: Thu, 28 Sep 2017 10:19:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506524313-20037-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22c
Subject: Re: [Qemu-arm] [PATCH] disas: Always initialize
 read_memory_inner_func properly
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Julian Brown <julian@codesourcery.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: FrCFxkGenYFb

On 09/27/2017 07:58 AM, Thomas Huth wrote:
> I've recently seen this with valgrind while running the HMP tester:
> 
> ==22373== Conditional jump or move depends on uninitialised value(s)
> ==22373==    at 0x4A41FD: arm_disas_set_info (cpu.c:504)
> ==22373==    by 0x3867A7: monitor_disas (disas.c:390)
> ==22373==    by 0x38E80E: memory_dump (monitor.c:1339)
> ==22373==    by 0x38FA43: handle_hmp_command (monitor.c:3123)
> ==22373==    by 0x38FB9E: qmp_human_monitor_command (monitor.c:613)
> ==22373==    by 0x4E3124: qmp_marshal_human_monitor_command (qmp-marshal.c:1736)
> ==22373==    by 0x769678: do_qmp_dispatch (qmp-dispatch.c:104)
> ==22373==    by 0x769678: qmp_dispatch (qmp-dispatch.c:131)
> ==22373==    by 0x38B734: handle_qmp_command (monitor.c:3853)
> ==22373==    by 0x76ED07: json_message_process_token (json-streamer.c:105)
> ==22373==    by 0x78D40A: json_lexer_feed_char (json-lexer.c:323)
> ==22373==    by 0x78D4CD: json_lexer_feed (json-lexer.c:373)
> ==22373==    by 0x38A08D: monitor_qmp_read (monitor.c:3895)
> 
> And indeed, in monitor_disas, the read_memory_inner_func variable was
> not initialized, but arm_disas_set_info() expects this to be NULL
> or a valid pointer. Let's properly set this to NULL in the
> INIT_DISASSEMBLE_INFO to fix it in all functions that use the
> disassemble_info struct.
> 
> Fixes: f7478a92dd9ee2276bfaa5b7317140d3f9d6a53b ("Fix Thumb-1 BE32 execution")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  disas.c             | 1 -
>  include/disas/bfd.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
