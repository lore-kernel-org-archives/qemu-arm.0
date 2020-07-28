Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp829834lfy;
        Tue, 28 Jul 2020 11:15:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdgqUQabZUq+cnPn705TEgoVyFGWd+2tQ2AtFiR+iptyNLRUrj69XXnTSKFsXNPWgUP+bt
X-Received: by 2002:a25:31d4:: with SMTP id x203mr45237128ybx.396.1595960139663;
        Tue, 28 Jul 2020 11:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595960139; cv=none;
        d=google.com; s=arc-20160816;
        b=GIHeUKJ4RFNDjBxNtM1ZS4MrO5IwrLQCxanfZSjMXB90SjmHUSH8L0ya6WAIuXdOKn
         zQmNrU6Nx17ew96565i/lmbALkJ3XWV3gQZema74vBI+sJb7sMc3iSYPrFvr3fdPfx/x
         DTpst5OW6CYDX+S8oaGz75DoRDfJBvEGzMwKB15HRWV8lK9gSqE/QY+vtYSzeN3B9dy/
         Vky6zHaCBsd7enhkI+uvUVn8TNPWHZ7w6kFuY48jAQF0ftlncz143E+Q/deURTRRrW3W
         Rw/gpsotompuaSApfTB3JcZcehThKyrC5WgimwD7Ki1KHyYrZQnWkfEn7w4+0dlv3d10
         ybxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x1PrBZCMipbb2lf9EAtiAlXHxMZihCIa94a8rfunS30=;
        b=TBhqRxf8EoA/Io+pjqp0zNeksr5YN8JSvuil4KPFouzUfgTui3GkZ7pLgPWMPS7pk6
         tHhBvRCMAeRQNuC9bY9PaULewaTyK2bwYdmFZ99BK7IX07Pvu5QDjcct0/dutzydvCFQ
         eOQWopFKVBtS2ZBJXV0UdRt/LcILRZbB2wED13dp7rBCU4pA92tYfYivgdf05tvtML2Q
         sDvZ1fjE7gzCR12xAWXYq9jpA4oJBZ+34rMvTivFilR/OJirDjTczJ0jN/u3Cw7+V6F1
         Oxz7crWGVI3WWRvzoX/vTfB57kkILbf15JOnwNvtuH04STJZeaBHBtlDf+qePlg1iK4C
         RskQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BcqeAvO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si13129243ybg.418.2020.07.28.11.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 11:15:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BcqeAvO6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0U8Y-00069A-Ug
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 14:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k0U8J-00068n-T2
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 14:15:23 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:36037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k0U8H-00023D-N6
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 14:15:23 -0400
Received: by mail-qk1-x72c.google.com with SMTP id g26so19627733qka.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 11:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x1PrBZCMipbb2lf9EAtiAlXHxMZihCIa94a8rfunS30=;
 b=BcqeAvO6kLW2/4kz/qNcccTMzrm9jHCNZgBI6dchiRESSrKdiHEJoDlGrqi+oXTjMp
 tedWUW0jEuh1MS3FdneVQS421TWFf9x5tD+Pv1G4He2byEIA3zrZumolL+02SLOlvHpD
 3ev5YjErktRD3Bh8qDs6UW7X7lIARbvr/TQFh7olrmZZSi/ey5xZgh6kG/h8Qq+cCxxK
 YpZjTruTIRkQDh+2N8rhjrzIKaEAg+9/GV8aWKKAbeGElbkIFfSEHC+ikp85ICPlUElX
 OpFl2nuzEHH+Cprhjc1t6xJqC5wNuhRsIjclAQRBmfriA6ZHRL2TiE2NXg8IfMN98EiE
 NYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x1PrBZCMipbb2lf9EAtiAlXHxMZihCIa94a8rfunS30=;
 b=EraQ+Oe/1vvK6K+f8iulFl8hSd7Wigffqdlg8WwopMQrv1nIj6XkNJS9HbmDWcufEc
 1uw4LXO4RQajEYBpfp+qJixo1T979eTIzErYVi9PEGXxVQnewcbQjm1UPh/KUtVeINIi
 7QkGqQPldF0rckVd9nusHj7S1PtPKuK+ONJTmbeVu53M5ogLQNzikkg5XfkBc/jOog+T
 dgTSCrC13HRBSZYf1wr91s8tp6KuUSqKtIUZ1Wo/QWZcrdocMhid2ce3W83onGXTs7dF
 zvUy6cnYxpX3llAwCSDOX8uj5344NucRygaz/iHDu9lErF+uJMc3sIsvVwJiUvz3RlBB
 xK0w==
X-Gm-Message-State: AOAM533j2aE6FyZpT9tu+IJbhNN0OoNEda6i00qHtbE/+sVTlhQ7nh/N
 q4/bYD9v4/GpNyFfO3BZPC4fCVwyT8VLHADSYOM=
X-Received: by 2002:a37:614a:: with SMTP id v71mr16213359qkb.31.1595960120585; 
 Tue, 28 Jul 2020 11:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <c5b4e931-f475-d0ab-70d4-0100cdb55dbc@linaro.org>
 <CAJoBWHxBv8L1nS_rf85kKPeWkq_E3bTvoMqNu1TRZZvYwg7ANQ@mail.gmail.com>
In-Reply-To: <CAJoBWHxBv8L1nS_rf85kKPeWkq_E3bTvoMqNu1TRZZvYwg7ANQ@mail.gmail.com>
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Tue, 28 Jul 2020 14:15:09 -0400
Message-ID: <CAJoBWHwLX+GUTZoniC-SNjpghY+h2SaN=JjVnOk7Ux7DByR3jA@mail.gmail.com>
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000104d6505ab846c5e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qk1-x72c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JRrUtOSeTsnG

--000000000000104d6505ab846c5e
Content-Type: text/plain; charset="UTF-8"

Here's a minimal test that shows the different behavior, as of master head
commit 0a58e39fe90c50b313a5148c095f8dbb6111a6d6.

The output on FVP:

signed_ptr_1 = 0x72ffff94022000 signed_ptr_2 = 0x59ffff94022000 auth_ptr =
0x20ffff94022000
Unmasked pointers DO NOT match
signed_ptr_1 = 0x72ffff94022000 signed_ptr_2 = 0x19ffff94022000 auth_ptr =
0xffff94022000
Unmasked pointers match

The output on Qemu:

signed_ptr_1 = 0x50ffffbe314000 signed_ptr_2 = 0x4affffbe314000 auth_ptr =
0xffffbe314000
Unmasked pointers match
signed_ptr_1 = 0x50ffffbe314000 signed_ptr_2 = 0x4affffbe314000 auth_ptr =
0xffffbe314000
Unmasked pointers match

To compile: clang -g -O0 --target=aarch64-linux-gnu -march=armv8.5-a+memtag
--sysroot=/usr/aarch64-linux-gnu/ -L/usr/lib/gcc/aarch64-linux-gnu/10.1.0/

#include <stdio.h>
#include <sys/mman.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include <assert.h>

#define ADDRESS_BITS 48
#define ADDRESS_MASK ((uint64_t)(1ul << ADDRESS_BITS) - 1)

typedef enum {
RED = 1,
GREEN = 2
} MTE_Color;

uintptr_t sign_pointer(void* address, uint64_t modifier, bool use_mask) {
uintptr_t addr_to_use;
if(use_mask) {
addr_to_use = ((uintptr_t) address & ADDRESS_MASK);
} else {
addr_to_use = (uintptr_t)address;
}

uintptr_t result;
asm("pacda %[loc], %[mod]"
: "=r"(result)
: [loc] "r"(addr_to_use), [mod] "r"(modifier)
:
  );
return result;
}

uintptr_t auth_pointer(void* address, uint64_t modifier) {
uintptr_t result;
asm("autda %[addr], %[mod]"
: "=r"(result)
: [addr] "r"(address), [mod] "r"(modifier)
:
  );
return result;
}

int main(int argc, char** argv) {
uint8_t *region = (uint8_t*) mmap(NULL, 16, PROT_READ | PROT_WRITE,
MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);

assert(region);

uint64_t modifier_1 = (1ul << 10) | RED;
uintptr_t signed_ptr_1 = sign_pointer(region, modifier_1, false);


uint64_t modifier_2 = (1ul << 10) | GREEN;
uintptr_t signed_ptr_2 = sign_pointer((void*)signed_ptr_1, modifier_2,
false);


uintptr_t auth_ptr = auth_pointer((void*)signed_ptr_2, modifier_2);

printf("signed_ptr_1 = 0x%lx\tsigned_ptr_2 = 0x%lx\tauth_ptr = 0x%lx\n",
signed_ptr_1, signed_ptr_2, auth_ptr);

if(auth_ptr == (uintptr_t)region) {
printf("Unmasked pointers match\n");
} else {
printf("Unmasked pointers DO NOT match\n");
}


signed_ptr_1 = sign_pointer(region, modifier_1, true);
signed_ptr_2 = sign_pointer((void*)signed_ptr_1, modifier_2, true);

auth_ptr = auth_pointer((void*)signed_ptr_2, modifier_2);
printf("signed_ptr_1 = 0x%lx\tsigned_ptr_2 = 0x%lx\tauth_ptr = 0x%lx\n",
signed_ptr_1, signed_ptr_2, auth_ptr);


if(auth_ptr == (uintptr_t)region) {
printf("Unmasked pointers match\n");
} else {
printf("Unmasked pointers DO NOT match\n");
}


return 0;
}

On Tue, Jul 28, 2020 at 1:10 PM Derrick McKee <derrick.mckee@gmail.com>
wrote:

> I'm not quite sure if it matters, but I am also using MTE as well.  My
> understanding is that the only affect to PAC is that the available
> signature bits are reduced  But I am definitely getting a valid pointer
> from the second pacda instruction because the autda instruction succeeds.
> My application is kinda convoluted because I was testing out a research
> idea.  I'll try to come up with a minimal test case, and test it out on the
> Qemu master head.
>
> On Tue, Jul 28, 2020 at 11:50 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> > The scenario: Application signs pointer 0xdeadbeef using the pacda
>> > instruction to obtain a new pointer 0xXYdeadbeef.  Later, the
>> application
>> > wants to generate a new PAC signature for 0xdeadbeef, but uses
>> 0xXYdeadbeef
>> > as the address for the pacda instruction to generate pointer
>> 0xABdeadbeef.
>> > Finally, the application wants to authenticate using the autda
>> instruction
>> > using 0xABdeadbeef and the modifier used to generate that pointer.>
>> > Qemu behavior: The autda instruction succeeds and 0xdeadbeef is
>> returned.
>> >
>> > FVP behavior: The autda instruction fails, and an invalid pointer is
>> > returned.  In order for the autda instruction to succeed, the pointer
>> > provided to the pacda instruction must have the upper bits set to zero.
>> >
>> > Is this a bug, or are we not very concerned about corner cases like
>> these?
>>
>> Well, actually, if you haven't already gotten an invalid pointer out of
>> step
>> two (the second pacda) then *that* is a bug.  And an invalid pointer
>> should not
>> succeed the autda.
>>
>> So, yes, this does sound like a bug.
>>
>> I will see if I can create a test case for this, but if you already have
>> one,
>> that would also be helpful.
>>
>>
>> r~
>>
>
>
> --
> Derrick McKee
> Phone: (703) 957-9362
> Email: derrick.mckee@gmail.com
>


-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com

--000000000000104d6505ab846c5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Here&#39;s a minimal test that shows the different be=
havior, as of master head commit 0a58e39fe90c50b313a5148c095f8dbb6111a6d6.<=
/div><div><br></div><div>The output on FVP:</div><div><br></div><div>signed=
_ptr_1 =3D 0x72ffff94022000	signed_ptr_2 =3D 0x59ffff94022000	auth_ptr =3D =
0x20ffff94022000<br>Unmasked pointers DO NOT match<br>signed_ptr_1 =3D 0x72=
ffff94022000	signed_ptr_2 =3D 0x19ffff94022000	auth_ptr =3D 0xffff94022000<=
br>Unmasked pointers match</div><div><br></div><div>The output on Qemu:</di=
v><div><br></div><div>signed_ptr_1 =3D 0x50ffffbe314000	signed_ptr_2 =3D 0x=
4affffbe314000	auth_ptr =3D 0xffffbe314000<br>Unmasked pointers match<br>si=
gned_ptr_1 =3D 0x50ffffbe314000	signed_ptr_2 =3D 0x4affffbe314000	auth_ptr =
=3D 0xffffbe314000<br>Unmasked pointers match</div><div><br></div><div>To c=
ompile: clang -g -O0 --target=3Daarch64-linux-gnu -march=3Darmv8.5-a+memtag=
 --sysroot=3D/usr/aarch64-linux-gnu/ -L/usr/lib/gcc/aarch64-linux-gnu/10.1.=
0/</div><div><br></div><div>#include &lt;stdio.h&gt;<br>#include &lt;sys/mm=
an.h&gt;<br>#include &lt;stdint.h&gt;<br>#include &lt;stddef.h&gt;<br>#incl=
ude &lt;stdbool.h&gt;<br>#include &lt;assert.h&gt;<br><br>#define ADDRESS_B=
ITS	48<br>#define ADDRESS_MASK 	((uint64_t)(1ul &lt;&lt; ADDRESS_BITS) - 1)=
<br><br>typedef enum {<br><div style=3D"margin-left:40px">	RED =3D 1,<br>	G=
REEN =3D 2<br></div>} MTE_Color;<br><br>uintptr_t sign_pointer(void* addres=
s, uint64_t modifier, bool use_mask) {<br><div style=3D"margin-left:40px">	=
uintptr_t addr_to_use;<br>	if(use_mask) {<br></div><div style=3D"margin-lef=
t:40px"><div style=3D"margin-left:40px">		addr_to_use =3D ((uintptr_t) addr=
ess &amp; ADDRESS_MASK);<br></div></div><div style=3D"margin-left:40px">	} =
else {<br></div><div style=3D"margin-left:40px"><div style=3D"margin-left:4=
0px">		addr_to_use =3D (uintptr_t)address;<br></div></div><div style=3D"mar=
gin-left:40px">	}<br><br>	uintptr_t result;<br>	asm(&quot;pacda %[loc], %[m=
od]&quot;<br>			: &quot;=3Dr&quot;(result)<br>			: [loc] &quot;r&quot;(addr=
_to_use), [mod] &quot;r&quot;(modifier)<br>			:<br>	 =C2=A0 );<br>	return r=
esult;<br></div>}<br><br>uintptr_t auth_pointer(void* address, uint64_t mod=
ifier) {<br><div style=3D"margin-left:40px">	uintptr_t result;<br>	asm(&quo=
t;autda %[addr], %[mod]&quot;<br>			: &quot;=3Dr&quot;(result)<br>			: [add=
r] &quot;r&quot;(address), [mod] &quot;r&quot;(modifier)<br>			:<br>	 =C2=
=A0 );<br>	return result;<br></div>}<br><br>int main(int argc, char** argv)=
 {<br><div style=3D"margin-left:40px">	uint8_t *region =3D (uint8_t*) mmap(=
NULL, 16, PROT_READ | PROT_WRITE, <br>			MAP_PRIVATE | MAP_ANONYMOUS, 0, 0)=
;<br><br>	assert(region);<br><br>	uint64_t modifier_1 =3D (1ul &lt;&lt; 10)=
 | RED;<br>	uintptr_t signed_ptr_1 =3D sign_pointer(region, modifier_1, fal=
se);<br><br><br>	uint64_t modifier_2 =3D (1ul &lt;&lt; 10) | GREEN;<br>	uin=
tptr_t signed_ptr_2 =3D sign_pointer((void*)signed_ptr_1, modifier_2, false=
);<br><br><br>	uintptr_t auth_ptr =3D auth_pointer((void*)signed_ptr_2, mod=
ifier_2);<br><br>	printf(&quot;signed_ptr_1 =3D 0x%lx\tsigned_ptr_2 =3D 0x%=
lx\tauth_ptr =3D 0x%lx\n&quot;,<br>			signed_ptr_1, signed_ptr_2, auth_ptr)=
;<br><br>	if(auth_ptr =3D=3D (uintptr_t)region) {<br></div><div style=3D"ma=
rgin-left:40px"><div style=3D"margin-left:40px">		printf(&quot;Unmasked poi=
nters match\n&quot;);<br></div></div><div style=3D"margin-left:40px">	} els=
e {<br></div><div style=3D"margin-left:40px"><div style=3D"margin-left:40px=
">		printf(&quot;Unmasked pointers DO NOT match\n&quot;);<br></div></div><d=
iv style=3D"margin-left:40px">	}<br><br><br>	signed_ptr_1 =3D sign_pointer(=
region, modifier_1, true);<br>	signed_ptr_2 =3D sign_pointer((void*)signed_=
ptr_1, modifier_2, true);<br><br>	auth_ptr =3D auth_pointer((void*)signed_p=
tr_2, modifier_2);<br>	printf(&quot;signed_ptr_1 =3D 0x%lx\tsigned_ptr_2 =
=3D 0x%lx\tauth_ptr =3D 0x%lx\n&quot;,<br>			signed_ptr_1, signed_ptr_2, au=
th_ptr);<br><br><br>	if(auth_ptr =3D=3D (uintptr_t)region) {<br></div><div =
style=3D"margin-left:40px"><div style=3D"margin-left:40px">		printf(&quot;U=
nmasked pointers match\n&quot;);<br></div></div><div style=3D"margin-left:4=
0px">	} else {<br></div><div style=3D"margin-left:40px"><div style=3D"margi=
n-left:40px">		printf(&quot;Unmasked pointers DO NOT match\n&quot;);<br></d=
iv></div><div style=3D"margin-left:40px">	}<br><br><br>	return 0;<br></div>=
}<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Jul 28, 2020 at 1:10 PM Derrick McKee &lt;<a href=3D"mai=
lto:derrick.mckee@gmail.com">derrick.mckee@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I&#39;=
m not quite sure if it matters, but I am also using MTE as well.=C2=A0 My u=
nderstanding is that the only affect to PAC is that the available signature=
 bits are reduced=C2=A0 But I am definitely getting a valid pointer from th=
e second pacda instruction because the autda instruction succeeds.=C2=A0 My=
 application is kinda convoluted because I was testing out a research idea.=
=C2=A0 I&#39;ll try to come up with a minimal test case, and test it out on=
 the Qemu master head.<br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Jul 28, 2020 at 11:50 AM Richard Henderso=
n &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">ric=
hard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">&gt; The scenario: Application signs pointer 0xdea=
dbeef using the pacda<br>
&gt; instruction to obtain a new pointer 0xXYdeadbeef.=C2=A0 Later, the app=
lication<br>
&gt; wants to generate a new PAC signature for 0xdeadbeef, but uses 0xXYdea=
dbeef<br>
&gt; as the address for the pacda instruction to generate pointer 0xABdeadb=
eef.<br>
&gt; Finally, the application wants to authenticate using the autda instruc=
tion<br>
&gt; using 0xABdeadbeef and the modifier used to generate that pointer.&gt;=
<br>
&gt; Qemu behavior: The autda instruction succeeds and 0xdeadbeef is return=
ed.<br>
&gt; <br>
&gt; FVP behavior: The autda instruction fails, and an invalid pointer is<b=
r>
&gt; returned.=C2=A0 In order for the autda instruction to succeed, the poi=
nter<br>
&gt; provided to the pacda instruction must have the upper bits set to zero=
.<br>
&gt; <br>
&gt; Is this a bug, or are we not very concerned about corner cases like th=
ese?<br>
<br>
Well, actually, if you haven&#39;t already gotten an invalid pointer out of=
 step<br>
two (the second pacda) then *that* is a bug.=C2=A0 And an invalid pointer s=
hould not<br>
succeed the autda.<br>
<br>
So, yes, this does sound like a bug.<br>
<br>
I will see if I can create a test case for this, but if you already have on=
e,<br>
that would also be helpful.<br>
<br>
<br>
r~<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Derrick Mc=
Kee<br>Phone: (703) 957-9362<br>Email: <a href=3D"mailto:derrick.mckee@gmai=
l.com" target=3D"_blank">derrick.mckee@gmail.com</a><br></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Derrick McKee<br>Phone: (703) 957-9362<br>Email: <a href=3D=
"mailto:derrick.mckee@gmail.com" target=3D"_blank">derrick.mckee@gmail.com<=
/a><br></div>

--000000000000104d6505ab846c5e--
