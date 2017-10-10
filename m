Received: by 10.223.197.9 with SMTP id q9csp3317353wrf;
        Tue, 10 Oct 2017 01:30:03 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCSPqdUanDHgf/euYilCK5Z65s4Go5BHD0HCLw7hty0y9vKUum2P4kQH0wriGfvHboOgWTy
X-Received: by 10.55.127.70 with SMTP id a67mr12185942qkd.90.1507624203834;
        Tue, 10 Oct 2017 01:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507624203; cv=none;
        d=google.com; s=arc-20160816;
        b=iYiJdBZYTMcl8KsF114aUlu1jHnfVVXSHeyi1f4osstYfxZQzjJed0MUupj6VOGt+N
         OQEPxN3KGUQBEMcSTU6RnJBU1PW055L2HF21FNJp4pbJjn9+KN0vPRBVM9LrFVARHX/i
         qxu1S1R5VQCo0Gu6BLKCEmgFo8o7T0/zOebzng3MPEuGA1DtSOG2Gui9oFUDD45a31nw
         Hq8S5jKcJGUhY1rJ813iiQTzrso3Wv07qvApISs/I34HWvIIxL15nkrGNkABEgGLNoD9
         Aplr3lam074ww5CdyeYZXDqo/5V/TMzq8I5ch4Ksm0qPyMqhj8oqeYhuV7IagVtRcS/W
         z0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dmarc-filter
         :arc-authentication-results;
        bh=xdEMazfx6K1xxFfCvQldQPoV0HRDeafZs40VvTwRMcc=;
        b=isiiRjaHgTOZx1P/lXPZAFseAJoiBBnavqaQiyizY01GfrSpSH5iZW5c4R0zhuXOQ7
         kSHQR1q4QHgbMUotsmOr+OPhIJKf+vmrRi9nO9BgLxxYQ0+gkBX8P32tFnM5VS0t4BIs
         uWH2OmJOjwyFAtVzn5BrhBY2r2P2dPX2Yosi9lvqSnwyCEM1i2gd1nTB5h/IgObLD1qX
         wCskj3VB3tuLcX8pMk1CdHb6q9DTmofUN/2cTW8gtaFKvS6Vb4a+zuMMsZZR5Ecbb7Ff
         y3x0aOOC2Apa2i15Qr2Jty1DqQG3csj/x+drNIS+/3ChpMUnCNgLG7BskXdgfIDpZ1c5
         BUFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si2413066qtj.158.2017.10.10.01.30.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 01:30:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1pvN-0008M5-Q1
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 04:30:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e1pvE-0008M0-DP
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 04:29:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e1pvA-00014r-CG
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 04:29:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e1pvA-00011g-3e; Tue, 10 Oct 2017 04:29:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31D4483F45;
	Tue, 10 Oct 2017 08:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 31D4483F45
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.161] (ovpn-116-161.ams2.redhat.com [10.36.116.161])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4942160464;
	Tue, 10 Oct 2017 08:29:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
References: <1506524313-20037-1-git-send-email-thuth@redhat.com>
Message-ID: <e5e8a117-f055-cd1e-e805-8e1e336eb897@redhat.com>
Date: Tue, 10 Oct 2017 10:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506524313-20037-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 10 Oct 2017 08:29:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] disas: Always initialize
 read_memory_inner_func properly
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
Cc: Julian Brown <julian@codesourcery.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KEAPzLj8Orz5

On 27.09.2017 16:58, Thomas Huth wrote:
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
> 
> diff --git a/disas.c b/disas.c
> index d6a1eb9..54eea3f 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -190,7 +190,6 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
>  
>      s.cpu = cpu;
>      s.info.read_memory_func = target_read_memory;
> -    s.info.read_memory_inner_func = NULL;
>      s.info.buffer_vma = code;
>      s.info.buffer_length = size;
>      s.info.print_address_func = generic_print_address;
> diff --git a/include/disas/bfd.h b/include/disas/bfd.h
> index b01e002..d99da68 100644
> --- a/include/disas/bfd.h
> +++ b/include/disas/bfd.h
> @@ -479,6 +479,7 @@ int generic_symbol_at_address(bfd_vma, struct disassemble_info *);
>    (INFO).buffer_vma = 0, \
>    (INFO).buffer_length = 0, \
>    (INFO).read_memory_func = buffer_read_memory, \
> +  (INFO).read_memory_inner_func = NULL, \
>    (INFO).memory_error_func = perror_memory, \
>    (INFO).print_address_func = generic_print_address, \
>    (INFO).print_insn = NULL, \
> 

Ping?

 Thomas

