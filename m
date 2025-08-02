Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13974C87FCA
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 03:14:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ui2ho-0002OU-Bk; Fri, 01 Aug 2025 23:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thiago.bauermann@linaro.org>)
 id 1ui2hh-0002L4-Ib
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 23:14:37 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thiago.bauermann@linaro.org>)
 id 1ui2he-0002Bn-5n
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 23:14:35 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-76bdc73f363so1340818b3a.3
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 20:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754104471; x=1754709271; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jc8dOkR6guV3MbEoeAmUiuprRgYTSlFsQL1OZa8lKA8=;
 b=ocH3/jYTMjfz1zo3MUzVUeNbnshC1IrXaRZBby6jb8QECvl0vv+SkioELPQf47O9y/
 QX1bJyp9avjiszm5RlkBgvyELZKuKK89DVWyBq3hozr05jkFFN+N8LlqVYLh80IzwPpo
 i+UFQIZGxLwff/eClf9EQ2Vwk69tPi3yqeVeNQUubmzMEsoX4Hj7FV7JyCPXshzKyPMi
 /NeS+OYVNNtoQNrcIDeClXzaloGW0v+jcNyU0GejJRcFN8SWgTUbywAzxMXyWoPwcW+P
 jwwM2KJ19IiiaxMXGkwG0Tgl4CYxUbeuMEFqw56bqy+QfHg7C9S9mNKVz72K0J+qUL0O
 8blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754104471; x=1754709271;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jc8dOkR6guV3MbEoeAmUiuprRgYTSlFsQL1OZa8lKA8=;
 b=qwfAE+bUk0KO5rc3CwB4HvhMMFhXUOFgnj1JkjiNV23+Im4nzqNzR6Dec17jBbMCoS
 +jJHHgoiGNprIcGGvPymJmdiB+7K3y/XWhwa/BwjZJVTO1iilqfWYdjK4vWTLkiAQ5uj
 rtSVEUK9gPzV0g66s873vFRpviQiVsE0SyGZz5xx7RtrbjeCqd6UWwwa3PmDbSRJnIHG
 F+/H/cI+NayL8oT7J47WsKTiFnqsEfHa+OkWDD2F5v+RQ51D65bYYtWVFjcv33PPGCcH
 H0t1cZXQgM8Knle7vhk9ERrazDDS7WPIbOnY5fc7eq4VmxMyf2tmNgGkd3AZkUy6cKKV
 D/uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbxVuczN4NspOryuPKF3dcCeGRtZg1MEWNrz4+quG3VvriEHsgFAQ1AL+LYJN1bId7s2Y8pjkGPA==@nongnu.org
X-Gm-Message-State: AOJu0Yyawq1kmdx8QceJpsSizjbWfb5DVmx7L56acX1O1Cwxu/LjzodX
 4ZFO5Q+Mal82BY8/9uhWG12xdh9uifQrrCJmtRPXFv75mGXETVZ610Mx/j9dp7KMuRQ=
X-Gm-Gg: ASbGncuBO7y4HixzF7FG8rG03maaj3zTFgYDdiYi3brRucnOF/adsilN+nQSi1tQO85
 Xm5EHGaJN2MW8pWARIoL76VlvsdDryqLqunXfAzfeR1Szytlox9jj6/vnf/woh8lqRB4HAP+xXw
 uNTTw8NwrLeREP6gq1ekGZrR0FPj1AxlbHUQfCyv3jPYVTY303L7T9C7wJZFOU7IeZEimqknDTK
 Wj5o0U0lelIh3BWQxhn2GnMW0s4LE5FF0URrmyfG6jvFgTSI3o2BVLXTcfCisV52ep90IESLeun
 Ka7NFe+D7fzyljR/HVwOo8c67yFjYfRX9NzkZfOKfsCMdT8N+y2L54M+KGTXj4kQJTMWT05PmED
 PC7KVurIHLuqD2ZLWAdAubQFzwZM=
X-Google-Smtp-Source: AGHT+IFxcqdlzmz4tJTQ0fYTHjOp/OBsvCyg75PBQ2QedZnVeJqCqUaxjjsrqpF31jJINTr+3mer9g==
X-Received: by 2002:a05:6a20:2445:b0:23d:74a2:cdd with SMTP id
 adf61e73a8af0-23df8fa1df2mr3193403637.15.1754104470640; 
 Fri, 01 Aug 2025 20:14:30 -0700 (PDT)
Received: from localhost ([177.124.15.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63f0b04dsm8780101a91.25.2025.08.01.20.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 20:14:30 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 47/82] target/arm: Expand pstate to 64 bits
In-Reply-To: <CAAjaMXbd6TF1x13h-N=F+kBL8=+0K+gyVzh6zk-65LjeqqDVSA@mail.gmail.com>
 (Manos Pitsidianakis's message of "Fri, 1 Aug 2025 21:45:55 +0300")
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-48-richard.henderson@linaro.org>
 <b2e40787-6043-4d4c-9cbb-731d0e92e25c@linaro.org>
 <CAFEAcA_9tkv1EoM33=G=zW6Pw0gBirvjs-SsDaC8ar8feyH_8g@mail.gmail.com>
 <CAAjaMXbd6TF1x13h-N=F+kBL8=+0K+gyVzh6zk-65LjeqqDVSA@mail.gmail.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Sat, 02 Aug 2025 00:14:25 -0300
Message-ID: <878qk2h0tq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=thiago.bauermann@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> On Fri, Aug 1, 2025 at 4:33=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>>
>> On Thu, 31 Jul 2025 at 21:34, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>> >
>> > On 7/27/25 1:02 AM, Richard Henderson wrote:
>> > > diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
>> > > index 64ee9b3b56..3cef47281a 100644
>> > > --- a/target/arm/gdbstub64.c
>> > > +++ b/target/arm/gdbstub64.c
>> > > @@ -47,6 +47,7 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GB=
yteArray *mem_buf, int n)
>> > >       case 32:
>> > >           return gdb_get_reg64(mem_buf, env->pc);
>> > >       case 33:
>> > > +        /* pstate is now a 64-bit value; can we simply adjust the x=
ml? */
>> > >           return gdb_get_reg32(mem_buf, pstate_read(env));
>> > >       }
>> >
>> > If I'm correct, we currently don't expose PSTATE through gdbstub, but
>> > only CPSR. This was a bit confusing for me, considering that CPSR is n=
ot
>> > even supposed to exist in Aarch64.
>> > Maybe it's a good opportunity to expose PSTATE instead, which could ha=
ve
>> > a 64 bits size. This way, we don't break any workflow.
>>
>> Architecturally, PSTATE is simply an abstract bundling together of
>> different information: it is not a particular format of a value,
>> whether 32 or 64 bit or otherwise. (This makes it different to
>> AArch32 CPSR, which really is a guest-visible register.)
>>
>> The thing that *is* defined architecturally is the SPSR_ELx format, which
>> is where various bits of PSTATE get saved when reporting an exception up
>> to a higher exception level (and which is pretty much the AArch32 CPSR
>> format when the lower EL is AArch32). (Note that not *all* of PSTATE
>> appears in the SPSR_ELx: for example the SME SM and ZA bits are
>> considered part of PSTATE but they aren't saved into SPSR_ELx.)
>>
>> For convenience, various pieces of software pass around information
>> in that SPSR_ELx format. Calling this either "CPSR" or "PSTATE"
>> is not really correct, but either is perhaps less confusing than
>> calling it SPSR when the context is that of the code running at the
>> lower EL rather than the higher.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/arm64/include/asm/kgdb.h#n41
>> suggests that expanding the existing pstate to 64 bits is probably
>> likely to produce problems. Perhaps we should define a pstate_high
>> or something for the top 32 bits?
>>
>
> IIUC, this is only a problem if you use the default gdb architecture
> register map, but QEMU ships its own as part of gdbstub, so it's free
> to change register definition of cspr. Or add a new PSTATE register.

That is correct. The kgdb.h comment also mentions this:

 * Note that if you are using one of the versions of gdb that supports
 * the gdb-7.7 version of the protocol you cannot use kgdb directly
 * without providing a custom register description (gdb can load new
 * protocol descriptions at runtime).

"providing a custom register description" is the manual procedure the
user can perform that is equivalent to the gdbstub sending its own
register map XML ("target description" in GDB parlance) to GDB, as the
QEMU gdbstub does.

I checked and the only places where GDB hardcodes the CPSR size is in
Linux and FreeBSD specific code, when reading or writing a core file
because in that case the size is defined by the OS.

Note that the CPSR position in the register map is hardcoded, defining
its register number as 33.
--=20
Thiago

