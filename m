Received: by 10.25.0.144 with SMTP id 138csp570190lfa;
        Wed, 26 Apr 2017 20:20:39 -0700 (PDT)
X-Received: by 10.55.78.201 with SMTP id c192mr3136559qkb.81.1493263239839;
        Wed, 26 Apr 2017 20:20:39 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id q23si1615873qkq.30.2017.04.26.20.20.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3ACAB2094F;
	Wed, 26 Apr 2017 23:20:39 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=hCeXURZg10F9AioOCyfCpFNuKQp5pApccb8T2B
	EBgqA=; b=ynitsSE+gbVcsUNGE7A1BTgrzihxLxFtK49DPMEDRCIMF7Yhs55cpN
	BpeQX3rD7yZkJo+kJiSOEI5+RaDChjj3K5QEnVLFQvGZgDimha1eFHneBd8Z8Y8B
	Viuk69BhFOe53KQEZspw8odT7AZiehSC2psQK1+V3wfq6wuhlHysU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=hCeXURZg10F9AioOCy
	fCpFNuKQp5pApccb8T2BEBgqA=; b=p3PfrhV8vATtsZyydYt9bkDPQH76d2UKx5
	XZjZ2v4qa/9SICRZkj9asSZzPh/T2g23b4sDLdM47zzRTNN8vVQNINwORWD2CU1F
	9kAnAyI/AKUPAE4Yrd3gYA/qlOXUZkkgNJ5Szo6y+r2CjORCxX8PgCx7oL34jhuh
	C7lwRyCeazjOITDgELqjuLQYcTgiK+pBTsRQoLEdp7UwhRhkxFm3UWk235aaOHLp
	rtyGY9XMt9fYihDQmidy+vOHseiy5QW+ugi3PvvxbG2TgFYjX13ocLTlWARiL5zx
	Kia8rEZD1KOF+gpDOj3F1G834eoB+i8qUVi2ZvStCqY7QnSfx1wQ==
X-ME-Sender: <xms:h2MBWYk7FcJmeX4x0jNgtNlviMP86-xWXNkmIh9AI5b6jrh2qVfC_w>
X-Sasl-enc: /dhd7fCj4/NXRd9KsTKnGbtYtZedkylVuhe/cujrlne3 1493263238
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id E49BB241E1;
	Wed, 26 Apr 2017 23:20:38 -0400 (EDT)
Date: Wed, 26 Apr 2017 23:20:38 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org, alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: Re: [PATCH v3 06/10] target/arm: optimize indirect branches
Message-ID: <20170427032038.GA5078@flamenco>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-7-git-send-email-cota@braap.org>
 <9ed31413-ddd8-b229-9731-a0433f8fbcde@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ed31413-ddd8-b229-9731-a0433f8fbcde@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: po00j7HGqmSR

On Wed, Apr 26, 2017 at 09:54:07 +0200, Richard Henderson wrote:
> On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> >+static bool gen_jr;...
> >         case DISAS_JUMP:
> >+            if (gen_jr) {
> 
> Why the variable?  Why not just try the goto_ptr for any DISAS_JUMP?

We have code that assumes DISAS_JUMP implies "go to exec loop", e.g.:
            case 6: /* isb */
                /* We need to break the TB after this insn to execute
                 * self-modifying code correctly and also to take
                 * any pending interrupts immediately.
                 */
                gen_lookup_tb(s);
where gen_lookup_tb does:

/* Force a TB lookup after an instruction that changes the CPU state.  */
static inline void gen_lookup_tb(DisasContext *s)
{
    tcg_gen_movi_i32(cpu_R[15], s->pc & ~1);
    s->is_jmp = DISAS_JUMP;
}

Also, the gen_exception_* functions set DISAS_JUMP. I suspect we want to go
to the exec loop with those as well.

Testing shows that I'm onto something; if I remove the variable,
and note that I make sure DISAS_UPDATE is not falling through, I get
easily reproducible (~1 out of 5) freezes and other instability
(e.g. RCU lockup warnings) when booting + shutting down debian jessie
in the guest.

In v4 I've added a comment about this.

Thanks,

		E.
