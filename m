Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1240500ejj;
        Tue, 26 Mar 2024 03:18:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWeWeV/Caa0qdyJcK7F5YhdzYvIVgbEv0OnVWP0QLD3QrESeITdjLKEQQ6/tDczF+SLsacYHWD+wefBDF5hc09+g21bCHX
X-Google-Smtp-Source: AGHT+IHyEEeWo4FC6prkcEeIpo1HxSEhim+w8+dexty1roFZ1SbwADgE22ujbAx4tucqeXX6ztgf
X-Received: by 2002:a05:6808:bc8:b0:3c3:d0f5:198d with SMTP id o8-20020a0568080bc800b003c3d0f5198dmr672486oik.40.1711448305265;
        Tue, 26 Mar 2024 03:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711448305; cv=none;
        d=google.com; s=arc-20160816;
        b=GP01RtI/w2sPCGx2NSfP3ifV6T/gV4zlPO/dYS+cyU7vd2JeqrCjMIK0yC3DumzIlP
         dsmKTBDi9bOFtBOv4XeI//z9EWdDJv0AYZYNqJCl9nhhJ0eunS81BabKL+Gxci3N8byL
         ZQjny3WDUHX0CRgaLjtrqZS1NLkknf+jaVGS7mE4P3/fT292ykfx+JJEB6hCgKecovBd
         X3MHKWRKaFGqE8s8Q9gzOv4wQVQBFLkPgqzDBoryZe/8Z0yqaXdqn8tZM5bZz4fsLrwD
         encZwMtsQJfvegGPMISOGALe6DaJVdp7N/zcwaHg46pQC7X8wp1JG4PruZ9G4+PUW6lf
         AjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=KEQJETNEk4wTxAbmDE7IF8Ho8ryXep/KGcVsctLsOm8=;
        fh=5zeJpO4ynDVAtSXeA67ToqlohQB1e8PC1m+coNyDlrM=;
        b=A4orp/MTu9dzKSFooO54F9dfR0TdndrrHkS7MviByR/3Zxd5pNvXyjKbTS6TJsExSt
         ggaCsDSBVCOuD+oi6LafTF4Dwty69dGrN5/LfLoEk9CNHO/Q+v0A+VknykZMX6xGaHBT
         /DfBAayN/lm4rrvaExQnql66Oij+2gF8/GUPzUXf59UDED//y//NFi6OiCpVKs+yxZxy
         zDL/TbHueJOq9Qqf0kBPqovwM3y8wEzPpttmZmVab1yfl/pZVuLn4XABZXH6rv+LozGR
         9mjIOfM84uu8xNZBPXBlse4P7yQ7m+i6vDYmGen30hkSXEXXA0CqQhFBEQfKG2ymtGDl
         nZIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q8KhtiOs;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g20-20020ac87d14000000b00431615406e3si2597617qtb.345.2024.03.26.03.18.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 03:18:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q8KhtiOs;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711448304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEQJETNEk4wTxAbmDE7IF8Ho8ryXep/KGcVsctLsOm8=;
	b=Q8KhtiOs91TRMna0TP0etmYvj09lzQVcLTFkjr3jCW2JvoVTgt4fx936xlEzhbZ/CLuq/H
	rrsKuPd1OtOsWwyc6XOURBCmtYcfte+lLBt9wln8BSmA6UEaK+UnNA1dUei/iWjqtjEtVr
	G0cpZ1Hot5on6XX/bBr7UeY/TmCx3eg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-98-pL4SSwWZOeS0ZogMZwZJZQ-1; Tue,
 26 Mar 2024 06:18:20 -0400
X-MC-Unique: pL4SSwWZOeS0ZogMZwZJZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5BEB3C0008C;
	Tue, 26 Mar 2024 10:18:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BEF62166B33;
	Tue, 26 Mar 2024 10:18:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 54BA321E668C; Tue, 26 Mar 2024 11:18:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Anton Johansson
 <anjo@rev.ng>,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
  Eduardo Habkost <eduardo@habkost.net>,  Claudio Fontana
 <cfontana@suse.de>,  Richard Henderson <richard.henderson@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Zhao Liu <zhao1.liu@intel.com>,
  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH-for-9.1 00/21] qapi: Make @query-cpu-definitions
 command target-agnostic
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 15 Mar 2024 14:08:48
 +0100")
References: <20240315130910.15750-1-philmd@linaro.org>
Date: Tue, 26 Mar 2024 11:18:14 +0100
Message-ID: <878r25qot5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-TUID: 7RD+FXKPfXSC

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Alex, Markus,
>
> Markus mentioned QAPI problems with the heterogeneous emulation
> binary. My understanding is, while QAPI can use host-specific
> conditional (OS, library available, configure option), it
> shouldn't use target-specific ones.

"Shouldn't" is too strong in the current state of things.  It can be
awkward, though.

Target-specific macros may be used only in target-specific code,
i.e. code that is compiled per target.  To catch uses in
target-independent code, we poison them there; see exec/poison.h.

QAPI-generated .c are not normally compiled per target.  To enable use
of target-specific macros in conditionals, we compile .c generated QAPI
submodules named *-target.json per target.  This is a bit of a hack.

Since the same conditionals will also appear in the .h generated from
them, these headers can only be used in target-specific code.

Sometimes, these headers "infect" target-independent code: we need to
compile per target just for the headers.  Awkward.  I can dig out an
example if there's interest.

But what about possible future state of things?

The QAPI schema is compile-time static by design.  QAPI conditionals
permit adjusting the schema for build configuration.  Target-specific
conditionals adjust it for the build configuration of the
target-specific part.  Each QEMU binary contains just one target's
target-specific part.

However, a single QEMU binary will contain several target-specific
parts, one per target it supports.  The targets' QAPI schema adjustments
may conflict.

For a single binary, we need to resolve these conflicts.

Special case: QAPI definitions that exist only for some targets.

Example: command query-sev exists only for TARGET_I386.  It's actually a
stub when CONFIG_SEV is off.

Obvious solution: make it exist if it needs to exist for any target
compiled into the binary.  Requires command stubs for the other targets.

Example: query-sev now exists when the single binary supports x86.  It's
a stub when CONFIG_SEV is off.  It behaves like a stub when CONFIG_SEV
is on, but the machine isn't x86.

Drawback: introspection with query-qmp-schema becomes less precise.
When the binary supports just one target, introspection can answer
target-specific questions like "does this target support SEV?"  With a
single binary, that's no longer possible.

Harmless enough for SEV, but consider query-cpu-model-expansion.  The
command may support expansion types "full" and "static".  Currently,
s390x supports both, ARM supports only "full", Loongarch only "static",
RISC-V only "full", and x86 supports both.

(I think.  The documentation is incomplete:

    # Some architectures may not support all expansion types.  s390x
    # supports "full" and "static". Arm only supports "full".
)

A management application may want to find out which expansion type is
supported.  Right now, it can't.  But we could improve the schema so it
can find out via introspection: define the expansion types only when
they're actually supported.

With a single binary, that's no longer possible: we have to define an
expansion type when *any* target supports it.

Such loss of introspection power is not a show-stopper, just something
we need to keep in mind.

> This series is an example on how to remove target specific
> bits from the @query-cpu-definitions command.

This is an instance of the special case with an additional twist: each
target defines its own QMP command handler.

>                                               Target specific
> code is registered as CPUClass handlers, then a generic method
> is used, iterating over all targets built in.
>
> The first set of patches were already posted / reviewed last
> year.
>
> The PPC and S390X targets still need work (help welcomed),
> however the code is useful enough to be tested and see if this
> is a good approach.
>
> The only drawback is a change in QAPI introspection, because
> targets not implementing @query-cpu-definitions were returning
> "CommandNotFound".

The change is introspection is actually something else.  Before the
series, query-qmp-schema returns a description of command
query-cpu-definitions exactly when the (single) target supports it.
Afterwards, it always returns one (I think).

The CommandNotFound change is a change in behavior when you try to
execute query-cpu-definitions, but the target doesn't support it.
Before, the command doesn't exist, and the QMP core duly replies
CommandNotFound.  Afterwards, it does exist, but the target doesn't
implement the call back, so the command fails.  I guess it fails with
GenericError.  We could make it fail with CommandNotFound if we care.

>                    My view is this was an incomplete
> implementation, rather than a feature.

Feels fair (but I'm not an expert in this area).
