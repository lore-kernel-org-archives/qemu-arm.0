Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3613413wrg;
        Mon, 13 May 2019 22:32:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyG+1/4O0Vn5ccpv2hOW0gQ7PHnT2Z/TrmxwljQba1J+tULwuMqHk4XXGGT36jcOm1GpX6W
X-Received: by 2002:ac8:2f35:: with SMTP id j50mr26719786qta.378.1557811970483;
        Mon, 13 May 2019 22:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557811970; cv=none;
        d=google.com; s=arc-20160816;
        b=PlkSwsMOLDCtV8y5HB/o1gO0ClVeDphZlPC7hWNYkcwlCsksHSuc+0oQYKBc4ofeUW
         XjAFFKxo9nGPYToIZVCIK0/vjBUAtN5zJi8muQ/gDvfwPG4XoKLwL7HO6THzDDiQXXYb
         p6udqV1t3y3jTkw5/lL7+/CudYtMYHl51qUTtcJDXK3Sfzx7fNAqOpjLbLaxTpdJW3jE
         Y4qc0q5zv8labI9PPEGm/pzAWrW6ABWlRkmYZGAry4A+3j6lUsckIhcCbV/wZSlbmplR
         2rkK7qaCVpBs+eFxc6InMOxnvJfDjl2sbM73ibFGaDRMfZDUmPQcMB7xnAFBeexECI+A
         APDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from;
        bh=uJ1T7i6hvsK2RsAVO5+VGJ29ekhySz0E0dvR0Kq2QSM=;
        b=faOeHUmWCgb/BJDC5K5LjsJ8vzzO+vtYVCo2qWJvmBWga7+6jswWxAmAmTSFg9zvf4
         imw5a/mAwW4OKEAAB9/fck07RZyf3/MU2TK7FumkQfEsK+y74OeqXyzZ7vlrWAo2/5Qf
         SGuvfTzRMBMbpPGEEucYgGuP7tnphVy4OzetwVcoPzpwW38oc4RJrK/B2PfNm+D8igci
         cMKbpkQI7sPJHl3j4Y5UsYSvoWxRQ5+azor2j8c/ENoC7g0YeqxWrrrsKE0VQyYh10zr
         8hLZUesngx2r0xqYNJShDFfptaU6iiiq/gumVLYWh+GT9fCJTCSThrquELGyYorPiPbx
         78uA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v10si1011166qvs.190.2019.05.13.22.32.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 22:32:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56BAC308AA12;
	Tue, 14 May 2019 05:32:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com [10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAD155D706;
	Tue, 14 May 2019 05:32:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 43AD911385E4; Tue, 14 May 2019 07:32:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org,  richard.henderson@linaro.org,  qemu-devel@nongnu.org,  abologna@redhat.com,  qemu-arm@nongnu.org,  alex.bennee@linaro.org,  Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 08/13] target/arm/monitor: Add query-sve-vector-lengths
References: <20190512083624.8916-1-drjones@redhat.com>
	<20190512083624.8916-9-drjones@redhat.com>
	<87ftpie3k9.fsf@dusky.pond.sub.org>
	<20190513183030.aap4gsxm7rbbkrbj@kamzik.brq.redhat.com>
Date: Tue, 14 May 2019 07:32:47 +0200
In-Reply-To: <20190513183030.aap4gsxm7rbbkrbj@kamzik.brq.redhat.com> (Andrew
	Jones's message of "Mon, 13 May 2019 20:30:30 +0200")
Message-ID: <874l5xa9ds.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 14 May 2019 05:32:49 +0000 (UTC)
X-TUID: Nm/b9lL2H7Fg

Andrew Jones <drjones@redhat.com> writes:

> On Mon, May 13, 2019 at 06:12:38PM +0200, Markus Armbruster wrote:
>> Andrew Jones <drjones@redhat.com> writes:
>> 
>> > Provide a QMP interface to query the supported SVE vector lengths.
>> > A migratable guest will need to explicitly specify a valid set of
>> > lengths on the command line and that set can be obtained from the
>> > list returned with this QMP command.
>> >
>> > This patch only introduces the QMP command with the TCG implementation.
>> > The result may not yet be correct for KVM. Following patches ensure
>> > the KVM result is correct.
>> >
>> > Signed-off-by: Andrew Jones <drjones@redhat.com>
>> > ---
>> >  qapi/target.json     | 34 ++++++++++++++++++++++++
>> >  target/arm/monitor.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
>> >  tests/qmp-cmd-test.c |  1 +
>> >  3 files changed, 97 insertions(+)
>> >
>> > diff --git a/qapi/target.json b/qapi/target.json
>> > index 1d4d54b6002e..ca1e85254780 100644
>> > --- a/qapi/target.json
>> > +++ b/qapi/target.json
>> > @@ -397,6 +397,40 @@
>> >  { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
>> >    'if': 'defined(TARGET_ARM)' }
>> >  
>> > +##
>> > +# @SVEVectorLengths:
>> > +#
>> > +# The struct contains a list of integers where each integer is a valid
>> 
>> Suggest to s/The struct contains/Contains/.
>
> OK
>
>> 
>> > +# SVE vector length for a KVM guest on this host. The vector lengths
>> > +# are in quadword (128-bit) units, e.g. '4' means 512 bits (64 bytes).
>> 
>> Any particular reason for counting quad-words instead of bytes, or
>> perhaps bits?
>
> It can be considered just bits here, but when set in sve-vls-map those
> bits are chosen to mean quadwords as that allows us to get up to 8192-bit
> vectors with a single 64-bit word. Maybe I should write more of that here
> to clarify.

Please do.

In general, QMP prefers the plain units over arbitrary multiples,
e.g. Byte, not Mebibyte.  Sadly, many violations of this rule have crept
in.

More complete documentation should help us determine the unit we want
here.

>> > +#
>> > +# @vls:      list of vector lengths in quadwords.
>> > +#
>> > +# Since: 4.1
>> > +##
>> > +{ 'struct': 'SVEVectorLengths',
>> > +  'data': { 'vls': ['int'] },
>> > +  'if': 'defined(TARGET_ARM)' }
>> > +
>> > +##
>> > +# @query-sve-vector-lengths:
>> > +#
>> > +# This command is ARM-only. It will return a list of SVEVectorLengths
>> 
>> No other target-specific command documents its target-specificness like
>> this.  Suggest
>
> Well, it's pretty similar to query-gic-capabilities, which is what I used
> as a template, but I'm happy to change it to whatever you suggest :)

Here's the documentation we generate for query-gic-capabilities:

 -- Command: query-gic-capabilities

     This command is ARM-only.  It will return a list of GICCapability
     objects that describe its capability bits.

     Returns: a list of GICCapability objects.

     Since: 2.6

     Example:
          -> { "execute": "query-gic-capabilities" }
          <- { "return": [{ "version": 2, "emulated": true, "kernel": false },
                          { "version": 3, "emulated": false, "kernel": true } ] }

     If: 'defined(TARGET_ARM)'

The "If:" line is generated from the schema's condition.  It's not as
readable as I'd like it to be, but it's there, and it always matches the
code.

"This command is ARM-only" is redundant.  Escaped review.  A patch to
drop it would be welcome.

>>    # Query valid SVE vector length sets.
>> 
>> > +# objects. The list describes all valid SVE vector length sets.
>> > +#
>> > +# Returns: a list of SVEVectorLengths objects
>> > +#
>> > +# Since: 4.1
>> > +#
>> > +# -> { "execute": "query-sve-vector-lengths" }
>> > +# <- { "return": [ { "vls": [ 1 ] },
>> > +#                  { "vls": [ 1, 2 ] },
>> > +#                  { "vls": [ 1, 2, 4 ] } ] }
>> > +#
>> > +##
>> > +{ 'command': 'query-sve-vector-lengths', 'returns': ['SVEVectorLengths'],
>> > +  'if': 'defined(TARGET_ARM)' }
>> > +
>
> Yup, will do

Took me a few seconds to connect this to my "# Query valid SVE vector
length sets." line %-}

>> >  ##
>> >  # @CpuModelExpansionInfo:
>> >  #
[...]
