Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2904840lfo;
        Tue, 15 Mar 2022 07:16:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxilI3o4Fsvph85tIn3BnO+aiNWoteVRwZVn1Me8uvrO8HCIxcWtW5Gbp8lLzCtzQMQz1i7
X-Received: by 2002:a05:6214:e6f:b0:440:c472:febe with SMTP id jz15-20020a0562140e6f00b00440c472febemr2564677qvb.9.1647353763407;
        Tue, 15 Mar 2022 07:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647353763; cv=none;
        d=google.com; s=arc-20160816;
        b=dWhB/SlYDRSIL0jcXmT2Qa2FN3DYsuVehdZB7jHCUjEwvdLGK81hYmMMnJDTysKk0A
         pYoHOFFK1ass1GcVnaYaXVuDalSACggz5pH9lppKeopSu8nNkgLVtagm7HiYIcbwIRZK
         XZKDd4rXfzzOvnAc0Gqf7sydMv7OtIAMQLNrJsLciDhRFAqo8yGad3Kzip+x1U5FQoU+
         FlLkXQyw/KUCBq+oQMIg8X4CTPb2HeGItuwQC1PLNA8q4XBKhN6axlJqruQy8P8WRbXY
         FIn3oMy9KPduHcXzD9nO2USn99KRvtJYoQT2HO44G2GBbw4NTMwg2D3uMgNyvyn34Pwh
         zW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=G34M2wqplRWeWarXP0G90H9Fcumln5YneSZGyKEyuqA=;
        b=qu5OCI+g12OtdiYWM6mKJKDfV0V/v78vqNJTmFfuRBkDx7VxecvpYE4CsLVBD1Z6tE
         Ipp6Bh3hnQbDP1FzCSF/gM81vVcLF707VLGUBD/cf7vgPjWNu3eNTV3MkxgeQqW+ZXhC
         1TCCP3aVN3PJlNl69jZ19PBdm6nhEi1YmAfKLN+Jkohs0hv34bZOf/j2KVYBjr/L+Kgl
         ZJn6oueL0SN9K3/1hBuJrwIFBjiKdZwDEdLBAycA7BSujlHt5QYAiq1J8TacsGRui2zd
         vMGlFC8c1zXYmdDMhtRPRNbDIibzqvIG08fb6CBzXHSiNlSnWRzhEMG3ywshPuerQZgm
         Zs/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fOY8R8QL;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p5-20020a05621421e500b00440a03e9f38si3348485qvj.129.2022.03.15.07.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2022 07:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fOY8R8QL;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647353762;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G34M2wqplRWeWarXP0G90H9Fcumln5YneSZGyKEyuqA=;
	b=fOY8R8QLuJspw0+Fzrdgpk6Z5cximYBufsAqchzMPmC4+gWvxSBdtp0b2N2MDIgBBS3wTf
	OxqT0Vhwa2M2RCc3wxIL0zefRPqL7SWuC/QTTwWug3ZINLuHmji0heDwk/3Q8umBP3aIWO
	J0tB65TQL6BKE6lGYKnSkJnvQ/n3kp8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-damje9vXMueOcGOcWhJQuA-1; Tue, 15 Mar 2022 10:15:48 -0400
X-MC-Unique: damje9vXMueOcGOcWhJQuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A4903C11C7A;
	Tue, 15 Mar 2022 14:15:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 049DF41136E2;
	Tue, 15 Mar 2022 14:15:44 +0000 (UTC)
Date: Tue, 15 Mar 2022 14:15:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
	qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
	aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
	crosa@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
	sw@weilnetz.de
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
Message-ID: <YjCfjmxMnGZYGGv6@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
 <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
 <87a6dr48n2.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87a6dr48n2.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: QGZQwFxK7vFQ

On Tue, Mar 15, 2022 at 01:59:59PM +0000, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> writes:
> 
> > On 15/3/22 13:12, Alex Bennée wrote:
> >> Another cleanup patch tripped over the fact we weren't being careful
> >> in our casting. Fix the casts, allow for a non-const and switch from
> >> g_realloc to g_renew.
> >> The whole semihosting argument handling could do with some tests
> >> though.
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> ---
> >>   semihosting/config.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >> diff --git a/semihosting/config.c b/semihosting/config.c
> >> index 137171b717..50d82108e6 100644
> >> --- a/semihosting/config.c
> >> +++ b/semihosting/config.c
> >> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
> >>       bool enabled;
> >>       SemihostingTarget target;
> >>       Chardev *chardev;
> >> -    const char **argv;
> >> +    char **argv;
> >>       int argc;
> >>       const char *cmdline; /* concatenated argv */
> >>   } SemihostingConfig;
> >> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
> >>       if (strcmp(name, "arg") == 0) {
> >>           s->argc++;
> >>           /* one extra element as g_strjoinv() expects NULL-terminated array */
> >> -        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
> >> -        s->argv[s->argc - 1] = val;
> >> +        s->argv = g_renew(char *, s->argv, s->argc + 1);
> >> +        s->argv[s->argc - 1] = g_strdup(val);
> >
> > Why strdup()?
> 
> The compiler was having issues with adding a const char * into the array
> and it was the quickest way to stop it complaining. I'm not sure what
> guarantees you can make about a const char * after you leave the scope
> of the function.

No guarantees at all. This method was implicitly relying on the caller
never free'ing the const arg it passed in. That is indeed the case here,
because the arg came from a QemuOpts list. It is bad practice to rely
on such things though, so adding the strdup is sane IMHO.

I would have split the strdup out from the realloc -> renew change
though, since it is an independent cleanup.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
