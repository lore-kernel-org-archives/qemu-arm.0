Received: by 10.223.197.9 with SMTP id q9csp3555023wrf;
        Tue, 10 Oct 2017 06:24:24 -0700 (PDT)
X-Received: by 10.55.53.202 with SMTP id c193mr14693686qka.110.1507641864417;
        Tue, 10 Oct 2017 06:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507641864; cv=none;
        d=google.com; s=arc-20160816;
        b=qlSlgXsuClQijm+uWnsTq5P6kPeBg90Ko/SmvvBXz4UGbpgQXZiVAJqbIN/BXhAJiU
         Z/7odRXYM6ddg3TW9iJNYmsAQZp3ZUyYh22r2lwToOPkZw3+lcwlF+yz13yMLc1vaa3i
         mP0m1IaDwU05gT7KTCI0bVGEbuZY+EY29GONZ6SIaxirHNTYiOzDMQT4NXVfdqsPTJO7
         PFGbQMnUxtGPIGRQ5sZTw5UuHTXUlxtIDHDIakuZeZ85Au6ZFJooqzc8JOeYalPfGBYF
         T6yz8SD2bCbdiCwv+sTkBUI+IJmKbOig1Dw0ojmUNxrtPBfDSjKZr0jpMeG9Q2tcj8Sl
         thag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=MtLTeDxL7P0H6n20zPJX0JEHdc2uLs+gdpmqZWnJfYA=;
        b=PqmhWrAiVzzng2YWNz1GxY40SS9aBlOe6oCL/a7VMGlW4t1XOWneKoU1bRY5VIyXco
         gSpwU7ak2Eg6MwAuiPdNu7YYLXwHmD5mk1mUX7XjX2hqOhRnVUmVgILlf/QABEPkZQ7E
         GpN0QuW3ysuyv6CDd9OZq1iAcbNRbJTIHV7dUalY/9krg+uscGwwoRUf2DPpww4qlBJf
         FxxhYMEp7NND20FdqbC1tWZJQsk7pdjN3dCkgYfjAdG6k06J5kx71G6r4IQPZEaqiPBu
         dIeVvL/MiiegZNs1jH4RyZs604kuFoAJRtTvNB9U4u74oxrQKOMcToE+5h8HUHGgyTDJ
         7zTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d18si8149743qtl.395.2017.10.10.06.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 06:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1uWE-0003BY-6T
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 09:24:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1e1uW6-0003BG-Gy
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1e1uW1-0004Y1-JX
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:24:14 -0400
Received: from mail-wm0-f42.google.com ([74.125.82.42]:48526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1e1uW1-0004VE-Cj
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:24:09 -0400
Received: by mail-wm0-f42.google.com with SMTP id i124so5090034wmf.3
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 06:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MtLTeDxL7P0H6n20zPJX0JEHdc2uLs+gdpmqZWnJfYA=;
	b=i2xk2rmnFZN8OlB5yxyHOKpEjj1WCwVssi2RHJKcKx9eRj0XRV7u4JcY3Gu6mXvgnW
	9R2z33Z4HwMKBJKkxTDigIUGeMIuGes5HIzcUmmOjPOR022kFPKbGxtwU8xBZyFjUNAk
	lrD+O/QxPJHmjVn7XiVtf8LOedFZFrJELDUhQWYJbCDGek00+K0NOyhbFdsVVu6+uWIX
	rTUWiAviXeI8Z0E0Mn3Wm/DeBl217FBdbvmRXAh23xkns4klZOHf3KOGyWTA1dDZjsZc
	vsW1EtblTOKvu9TE96qDX9aEIQBeIonnBf8HnN3uyqehOsrzXefbfoP3rSCe1d0DvLZm
	RPSw==
X-Gm-Message-State: AMCzsaU9/QtkbfBXpYVYGWsXGedEHD/ElMUgeApyNLyXEKN9f3YAnrAr
	iFQZa4Mtdwl7uP13WbySnca1qQ==
X-Google-Smtp-Source: AOwi7QBuNLJ1ImuQH/tG4sgyTFqp7tbL9/tpQ6evEELpKq4573XElvimcHrgkJ8lZa91JniIM9CHjQ==
X-Received: by 10.28.93.200 with SMTP id r191mr12108445wmb.19.1507641845279;
	Tue, 10 Oct 2017 06:24:05 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-78-12-246-117.clienti.tiscali.it.
	[78.12.246.117])
	by smtp.gmail.com with ESMTPSA id c3sm3093082wrd.44.2017.10.10.06.24.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 06:24:04 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1506524313-20037-1-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <59cd0315-bc0e-87dd-7738-35242a7c9676@redhat.com>
Date: Tue, 10 Oct 2017 15:24:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506524313-20037-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.42
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
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IXrPnD5HrVSH

On 27/09/2017 16:58, Thomas Huth wrote:
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

Queued, thanks.

Paolo
