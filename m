Received: by 10.25.0.144 with SMTP id 138csp541979lfa;
        Wed, 12 Apr 2017 18:46:48 -0700 (PDT)
X-Received: by 10.55.127.129 with SMTP id a123mr493588qkd.127.1492048008011;
        Wed, 12 Apr 2017 18:46:48 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id u42si6373022qta.298.2017.04.12.18.46.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Apr 2017 18:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 673432100E;
	Wed, 12 Apr 2017 21:46:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 12 Apr 2017 21:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=zX0UtDf4AviOaXBMI9Y+ZGdqyS4R9WGdCjeY6W
	WaRS4=; b=DayMhtsqAWZbO1h1UmjdUH4AIkKodG9zW9ulL3gztQFf3GoZkUD4Wi
	QJaGxHFr5x8nipttTtMmPuVK2Wjlat3Z61oioWynsLU1Vc8AZAFlo3tEJfTdmokR
	eYYXcKYIIhuQpWrChmtRtLmRrdR+aDlDuEIz9eGHM96Gd8cMO/TGQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zX0UtDf4AviOaXBMI9
	Y+ZGdqyS4R9WGdCjeY6WWaRS4=; b=NM8ovvjIt2N/Qz17xmrX84gKsjrPOjpX8x
	gXsmP3cNQCPf4AmQkp+cjjBosQ7qkLiz9xJ6UyJTxfJ692ydVNL2kaAEN8Gz8HGw
	4omfel+2purOSjW9e+nY15UiccbMSoetUCBDLafB3bgMCNIUP7MkHeTBdh6XQzQt
	0Xt5gJwybiNXf2QTIE+XVMoZtgK7mnSPt1Aw57DChY2Ox/tkgwnj9dkfQDHIgLA5
	P31jtHGXYW0rq/SEaojuKl1o+ZkJZtQAK0HTIgtIwjGJlf9nTj6+wAi+HuBLOgIs
	/lxldmXJiLhqfSuJEFQC2Flo6LKZkNsWAkGcV2G4SxTLSH/d5dog==
X-ME-Sender: <xms:h9juWJIhWqCQRmCttz1Nzo_m5UyGi0gJ6PXvj5y0SAGdA2NYbMgVNA>
X-Sasl-enc: 6NoG4EjlAscvI9SwaVU/vuqxUdCND1szlok/+tftFqoZ 1492048007
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1FDB32400E;
	Wed, 12 Apr 2017 21:46:47 -0400 (EDT)
Date: Wed, 12 Apr 2017 21:46:46 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org, alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: Re: [PATCH 09/10] target/i386: optimize indirect branches with TCG's
 jr op
Message-ID: <20170413014646.GA1474@flamenco>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-10-git-send-email-cota@braap.org>
 <2ede0852-6888-8bcb-ac5a-363478841bc7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ede0852-6888-8bcb-ac5a-363478841bc7@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: LXOpL2hPHTL6

On Wed, Apr 12, 2017 at 11:43:45 +0800, Paolo Bonzini wrote:
> 
> 
> On 12/04/2017 09:17, Emilio G. Cota wrote:
> > 
> > The fact that NBench is not very sensitive to changes here is a
> > little surprising, especially given the significant improvements for
> > ARM shown in the previous commit. I wonder whether the compiler is doing
> > a better job compiling the x86_64 version (I'm using gcc 5.4.0), or I'm simply
> > missing some i386 instructions to which the jr optimization should
> > be applied.
> 
> Maybe it is "ret"?  That would be a straightforward "bx lr" on ARM, but
> it is missing in your i386 patch.

Yes I missed that. I added this fix-up:

diff --git a/target/i386/translate.c b/target/i386/translate.c
index aab5c13..f2b5a0f 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -6430,7 +6430,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(cpu_T0);
         gen_bnd_jmp(s);
-        gen_eob(s);
+        gen_jr(s, cpu_T0);
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
@@ -6438,7 +6438,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(cpu_T0);
         gen_bnd_jmp(s);
-        gen_eob(s);
+        gen_jr(s, cpu_T0);
         break;
     case 0xca: /* lret im */
         val = cpu_ldsw_code(env, s->pc);

Any other instructions I should look into? Perhaps lret/lret im?

Anyway, nbench does not improve much with the above. The reason seems to be
that it's full of direct jumps (visible with -d in_asm). Also tried softmmu
to see whether these jumps are in-page or not: peak improvement is ~8%, so
I guess most of them are in-page. See http://imgur.com/EKRrYUz

I'm running new tests on a server with no other users and which has
frequency scaling disabled. This should help get less noisy numbers,
since I'm having trouble replicating my own results :> (I used my desktop
machine until now). Will post these numbers tomorrow (running overnight
SPECint both train and set sizes).

Thanks,

		Emilio
