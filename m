Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2796399ejs;
        Tue, 4 Jun 2024 01:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXucQreCd4GKsfRnR2jR8m0Ef4mpw/Eer1VIRJ/Hv91HO49gv3SflqXiER7HiYYKjivMHg9SbK8A0RLPrI8RARdnKyqN18S
X-Google-Smtp-Source: AGHT+IHfRSN4ww4zVPtwkLHk73+EiXPK/uKB1VYEnQpyrhV6ooUh4YP0XvuinABsuG6InqPh/AW9
X-Received: by 2002:a05:620a:3195:b0:795:1962:2d4a with SMTP id af79cd13be357-79519622e6emr124834785a.60.1717490870365;
        Tue, 04 Jun 2024 01:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717490870; cv=none;
        d=google.com; s=arc-20160816;
        b=TA5jK77/fZzxRSZGY8uFDXUxy175N0p6tDvcgonFyT0GnPUSQLxOOBUkQed3sleRps
         mzbkJAab9TK0s4lXzqr9MXwSVnlTF00jPUbXTXfb+ReTiQti2uz7iemmSkdf9a6xORI0
         yDRSqmPcd8gvU/cmg/K0SsmYpkmiT+anM3TK8IqiYn71a6A2zfozZ4UPsxS5kWKav7zp
         bQh3W8JZ25w/QpwQebdM1oXMajLp9pbXC518gq+plXzDEQQRVBUQUYSdhZYtCrBrcCal
         vCif7C2I8WZDPlTOKsAbLvt1sCuiEsNY96Hg8HSckGP1G5ShxAiQ8rCCQce4VjiDvpKn
         ohpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=iYMov8+MVZFvylV1Ui1pFu3uDiFuy66PwQ1u7k9mBPQ=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=azjNE/A5Wf67pJH/zg3uboYYzfx9t4HcMdPhFW0wproJXwtXo9s0fwMr2E0omjLhTY
         dtj/46/CKbCIIDCa/tp1D89Ng85r8JdDRaAgfk0R14VmYXZ765yhdXOLU5NMLX/s0p5T
         0N+7zC7r9ThLWXjkJ55Wef7nLo/wPQyA7XNiNaM0FFKyYBKyXPWWjPkti6OOd0sspJEh
         YnGMiJMwFckTy6yHg50ZxDxnIG4MChZfzfXaMJTZg7vThjR61VErMwf7LGp/y2RGbui2
         olR6oW6ClFU5vHgb6ZJoXzeq/IploJeTLoEoOGIpRqGEDY5nMGOCpYn6+obJoUJuX79w
         gcMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cl5lp50W;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-794f32a5da9si1001700985a.666.2024.06.04.01.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cl5lp50W;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717490869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iYMov8+MVZFvylV1Ui1pFu3uDiFuy66PwQ1u7k9mBPQ=;
	b=Cl5lp50WEMWQmY8pnp3hn7/l41yallVTNgbg4fUKp8fY1/JdDVPr1B5+x9C/fDYDsB0457
	C8OMrtYeQWZJvCBzyKRE64h7MhrUDplKdTcD4eu78wRahW25GUDXkRjWp8WDnNvQ99oaV3
	f0I99PdyHplHmYBe2VPW5t3I/giPK0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-GPX7FAV8NsCwEKc_CtdJIw-1; Tue, 04 Jun 2024 04:47:46 -0400
X-MC-Unique: GPX7FAV8NsCwEKc_CtdJIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A64D68007BA;
	Tue,  4 Jun 2024 08:47:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6228921982FF;
	Tue,  4 Jun 2024 08:47:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8729D21E6687; Tue,  4 Jun 2024 10:47:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo
 Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Michael S . Tsirkin" <mst@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eric Blake <eblake@redhat.com>,  Marcelo
 Tosatti <mtosatti@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Sia Jee Heng
 <jeeheng.sia@starfivetech.com>,  qemu-devel@nongnu.org,
  kvm@vger.kernel.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
  Zhenyu Wang <zhenyu.z.wang@intel.com>,  Dapeng Mi
 <dapeng1.mi@linux.intel.com>,  Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [RFC v2 1/7] hw/core: Make CPU topology enumeration arch-agnostic
In-Reply-To: <Zl7RbLrYUN0cg+t4@intel.com> (Zhao Liu's message of "Tue, 4 Jun
	2024 16:33:48 +0800")
References: <20240530101539.768484-1-zhao1.liu@intel.com>
	<20240530101539.768484-2-zhao1.liu@intel.com>
	<87plsyfc1r.fsf@pond.sub.org> <Zl7RbLrYUN0cg+t4@intel.com>
Date: Tue, 04 Jun 2024 10:47:44 +0200
Message-ID: <87zfs19jrj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-TUID: 688GT9Ibkt9b

Zhao Liu <zhao1.liu@intel.com> writes:

> Hi Markus,
>
> On Mon, Jun 03, 2024 at 02:25:36PM +0200, Markus Armbruster wrote:
>> Date: Mon, 03 Jun 2024 14:25:36 +0200
>> From: Markus Armbruster <armbru@redhat.com>
>> Subject: Re: [RFC v2 1/7] hw/core: Make CPU topology enumeration
>>  arch-agnostic
>> 
>> Zhao Liu <zhao1.liu@intel.com> writes:
>> 
>> > Cache topology needs to be defined based on CPU topology levels. Thus,
>> > define CPU topology enumeration in qapi/machine.json to make it generic
>> > for all architectures.
>> >
>> > To match the general topology naming style, rename CPU_TOPO_LEVEL_SMT
>> > and CPU_TOPO_LEVEL_PACKAGE to CPU_TOPO_LEVEL_THREAD and
>> > CPU_TOPO_LEVEL_SOCKET.
>> >
>> > Also, enumerate additional topology levels for non-i386 arches, and add
>> > helpers for topology enumeration and string conversion.
>> >
>> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>> 
>> [...]
>> 
>> > diff --git a/qapi/machine.json b/qapi/machine.json
>> > index bce6e1bbc412..7ac5a05bb9c9 100644
>> > --- a/qapi/machine.json
>> > +++ b/qapi/machine.json
>> > @@ -1667,6 +1667,46 @@
>> >       '*reboot-timeout': 'int',
>> >       '*strict': 'bool' } }
>> >  
>> > +##
>> > +# @CPUTopoLevel:
>> 
>> I understand you're moving existing enum CPUTopoLevel into the QAPI
>> schema.  I think the idiomatic QAPI name would be CpuTopologyLevel.
>> Would you be willing to rename it, or would that be too much churn?
>
> Sure, I'll rename it as you suggested.
>
>> > +#
>> > +# An enumeration of CPU topology levels.
>> > +#
>> > +# @invalid: Invalid topology level, used as a placeholder.
>> > +#
>> > +# @thread: thread level, which would also be called SMT level or logical
>> > +#     processor level. The @threads option in -smp is used to configure
>> > +#     the topology of this level.
>> > +#
>> > +# @core: core level. The @cores option in -smp is used to configure the
>> > +#     topology of this level.
>> > +#
>> > +# @module: module level. The @modules option in -smp is used to
>> > +#     configure the topology of this level.
>> > +#
>> > +# @cluster: cluster level. The @clusters option in -smp is used to
>> > +#     configure the topology of this level.
>> > +#
>> > +# @die: die level. The @dies option in -smp is used to configure the
>> > +#     topology of this level.
>> > +#
>> > +# @socket: socket level, which would also be called package level. The
>> > +#     @sockets option in -smp is used to configure the topology of this
>> > +#     level.
>> > +#
>> > +# @book: book level. The @books option in -smp is used to configure the
>> > +#     topology of this level.
>> > +#
>> > +# @drawer: drawer level. The @drawers option in -smp is used to
>> > +#     configure the topology of this level.
>> 
>> docs/devel/qapi-code-gen.rst section Documentation markup:
>> 
>>     For legibility, wrap text paragraphs so every line is at most 70
>>     characters long.
>> 
>>     Separate sentences with two spaces.
>
> Thank you for pointing this.
>
> About separating sentences, is this what I should be doing?
>
> # @drawer: drawer level. The @drawers option in -smp is used to
> #  configure the topology of this level.

Like this:

##
# @CPUTopoLevel:
#
# An enumeration of CPU topology levels.
#
# @invalid: Invalid topology level.
#
# @thread: thread level, which would also be called SMT level or
#     logical processor level.  The @threads option in -smp is used to
#     configure the topology of this level.
#
# @core: core level.  The @cores option in -smp is used to configure
#     the topology of this level.
#
# @module: module level.  The @modules option in -smp is used to
#     configure the topology of this level.
#
# @cluster: cluster level.  The @clusters option in -smp is used to
#     configure the topology of this level.
#
# @die: die level.  The @dies option in -smp is used to configure the
#     topology of this level.
#
# @socket: socket level, which would also be called package level.
#     The @sockets option in -smp is used to configure the topology of
#     this level.
#
# @book: book level.  The @books option in -smp is used to configure
#     the topology of this level.
#
# @drawer: drawer level.  The @drawers option in -smp is used to
#     configure the topology of this level.
#
# Since: 9.1
##
