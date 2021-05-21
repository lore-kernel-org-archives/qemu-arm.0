Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1114962lfm;
        Fri, 21 May 2021 05:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhr1FUFiQpY0LjF62AOF4DDFYRP8SJv6lC4SWyKJ8SJ+O8xc38y8w7ZBhCIc4Hkf3h3Fhq
X-Received: by 2002:a17:906:87d0:: with SMTP id zb16mr9925406ejb.467.1621600122455;
        Fri, 21 May 2021 05:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621600122; cv=none;
        d=google.com; s=arc-20160816;
        b=W9T9GpC0c6FagSo3cmuJUhNZksAuz/O911RbieCFqhxhiwtDmcgrZ2Nyu3cs5X+QO0
         44U7aa9UI+0tkKTdVeS2kvxGcUlCeI6MxYfrO6Pzju9diwpsWudNfPjWzXKIUGqN/yNX
         0ghbvKAQf2IN/TEKCWXQV9MwXisOtGqDj7Pk0Rh0uDkOZiUfyAxsZFhEq412olHlJ5Vv
         Ds1AgqI789J1VzlMe/nvD3wGYz5I5WdVI1IvWFFR3kGBEIWOyn1C+getTuvzraNGMOGp
         MOQQ4aIdhUYMhvdbHQQdGjPnI1wcHLfbllaPKjAWvapL4dE1mBIoqAcFSYg7kRAB60VY
         cU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PAIvEx2mSQJr37uvnqVRAXLyQnlf9AXNqu12tPg6sSg=;
        b=va2i9hvvsZbqmHW3XBCz/pyaqDMdY1IcjHDQJD64nA/5jvur6qUF/Bmxc7KIA8yUyJ
         seMnb0AkvbfYwTF9maHr7nYh5kWKHavUqBfyc4KbRXIxcYGbexJqN2M0C/W+fexyYxKI
         v82RLXejX38e6CAl2f/weJ+0XrQAyBcRi7AYELNkJ6caTpRTKb6019aF2YumwF5J1JOf
         EzIqefR206ZIQvEP7ZVjFo6AmRK0B84X9wJ+SckjZB2ZJgOt9KYF7mlPgIMPJIcIPHJT
         GeBgAonuwxt6Ehdl0wVQTV4ZbKHAGL5NFBGlbt0O5v+yTbiJdfUwa2HsMR6kDOQkahYv
         6voA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iZMg2VRV;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wrampazz@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id di24si4846670edb.224.2021.05.21.05.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 05:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iZMg2VRV;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621600121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAIvEx2mSQJr37uvnqVRAXLyQnlf9AXNqu12tPg6sSg=;
	b=iZMg2VRV0MiD9RKcs1dT7vK2V1eQXVQJ5ZqfqnmEe0oWz5haJkgkV/HvD0GeD25PUcUsl4
	laHhXDqe+M92sWo7uRR3qAqfzRGVkpwHc2khoJCWIwKhEn8xF5XQwLfO27bnMIstyW09OH
	89BlaiSl5vmQT6Nh1VH4ANow3jMicpQ=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-tRRypclxM8yCdCrUZiEnYQ-1; Fri, 21 May 2021 08:28:38 -0400
X-MC-Unique: tRRypclxM8yCdCrUZiEnYQ-1
Received: by mail-ua1-f72.google.com with SMTP id 49-20020a9f21b40000b029020ed81a67feso7498233uac.16
        for <alex.bennee@linaro.org>; Fri, 21 May 2021 05:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PAIvEx2mSQJr37uvnqVRAXLyQnlf9AXNqu12tPg6sSg=;
        b=lvgRGiISqCArOu2CCLrcXgG5zCNt7fRtQPRS/ECFEif/nhpCDu7rcAtqpb3Alr4FP7
         leu2QWEPru7pTeI0fEKtJBUfFnlIDPRFTvXdeHvJLo65BnZ152g88THhY2H0I+xxgLGz
         jISWJDGxjvXQDvAuHk5aDecEUkpSUFA9bruszqLUBWsY7LbRiGTTO6nhq1r/6W1qKbMk
         Y4NYfy0/wYifi67dLO1xAHMbMsfdmtkkSV24gasvsmRkQcLTP9cFEpTCJUP3i/NxR4tq
         ruzq99Trcx9WMIsSI+YMDyxnJ06ZpB4sTXg4+7HF+e1wbHuEotaIskDt4iWrWL5lzK5+
         yg+Q==
X-Gm-Message-State: AOAM531Cw13DSoo+8o2v7dWkTlkqG9hmDTIGt8lS3KofBglXJHrQqhca
	RJkA6RrMtvwmP7dYzaDaySarcTmFxh9umM8LCQGy1XJ47WJDWM6e+83HPTTr+C5YKw5NE/Dh5to
	9bCqYRlXzxml910qEn9o3XiE0JmIgSr3l
X-Received: by 2002:a67:c31c:: with SMTP id r28mr9342205vsj.50.1621600117699;
        Fri, 21 May 2021 05:28:37 -0700 (PDT)
X-Received: by 2002:a67:c31c:: with SMTP id r28mr9342185vsj.50.1621600117492;
 Fri, 21 May 2021 05:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com> <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com> <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
In-Reply-To: <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 09:28:11 -0300
Message-ID: <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	qemu-devel <qemu-devel@nongnu.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ajVBY7IV+MeQ

On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/05/2021 22.28, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 5/20/21 9:53 PM, Willian Rampazzo wrote:
> >> Conceptually speaking, acceptance tests "are a series of specific test=
s
> >> conducted by the customer in an attempt to uncover product errors befo=
re
> >> accepting the software from the developer. Conducted by the end-user r=
ather
> >> than software engineers, acceptance testing can range from an informal
> >> =E2=80=9Ctest drive=E2=80=9D to a planned and systematically executed =
series of scripted
> >> tests" [1]. Every time Pressman refers to the term "acceptance testing=
," he
> >> also refers to user's agreement in the final state of an implemented f=
eature.
> >> Today, QEMU is not implementing user acceptance tests as described by =
Pressman.
> >>
> >> There are other three possible terms we could use to describe what is =
currently
> >> QEMU "acceptance" tests:
> >>
> >>    1 - Integration tests:
> >>        - "Integration testing is a systematic technique for constructi=
ng the
> >>           software architecture while at the same time conducting test=
s to
> >>           uncover errors associated with interfacing. The objective is=
 to take
> >>           unit-tested components and build a program structure that ha=
s been
> >>           dictated by design." [2]
> >>        * Note: Sommerville does not have a clear definition of integra=
tion
> >>          testing. He refers to incremental integration of components i=
nside
> >>          the system testing (see [3]).
>
> After thinking about this for a while, I agree with you that renaming the
> "acceptance" tests to "integration" tests is also not a good idea. When I
> hear "integration" test in the context of the virt stack, I'd rather expe=
ct
> a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe
> virt-manager on top and tests them all together. So we should look for a
> different name indeed.
>
> >>    2 - Validation tests:
> >>        - "Validation testing begins at the culmination of integration =
testing,
> >>           when individual components have been exercised, the software=
 is
> >>           completely assembled as a package, and interfacing errors ha=
ve been
> >>           uncovered and corrected. At the validation or system level, =
the
> >>           distinction between different software categories disappears=
. Testing
> >>           focuses on user-visible actions and user-recognizable output=
 from the
> >>           system." [4]
> >>        - "where you expect the system to perform correctly using a set=
 of test
> >>           cases that reflect the system=E2=80=99s expected use." [5]
> >>        * Note: the definition of "validation testing" from Sommerville=
 reflects
> >>          the same definition found around the Internet, as one of the =
processes
> >>          inside the "Verification & Validation (V&V)." In this concept=
,
> >>          validation testing is a high-level definition that covers uni=
t testing,
> >>          functional testing, integration testing, system testing, and =
acceptance
> >>          testing.
> >>
> >>    3 - System tests:
> >>        - "verifies that all elements mesh properly and that overall sy=
stem
> >>           function and performance is achieved." [6]
> >>        - "involves integrating components to create a version of the s=
ystem and
> >>           then testing the integrated system. System testing checks th=
at
> >>           components are compatible, interact correctly, and transfer =
the right
> >>           data at the right time across their interfaces." [7]
> >>
> >> The tests implemented inside the QEMU "acceptance" directory depend on=
 the
> >> software completely assembled and, sometimes, on other elements, like =
operating
> >> system images. In this case, the proposal here is to rename the curren=
t
> >> "acceptance" directory to "system."
> >
> > Are user-mode tests using Avocado also system tests?
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html
>
> We've indeed got the problem that the word "system" is a little bit
> overloaded in the context of QEMU. We often talk about "system" when
> referring to the qemu-softmmu-xxx emulators (in contrast to the linux-use=
r
> emulator binaries). For example, the "--disable-system" switch of the
> configure script, or the "build-system" and "check-system" jobs in the
> .gitlab-ci.yml file ... thus this could get quite confusing in the
> .gitlab-ci.yml file afterwards.

I agree with you here. After I made the changes to the code, I noticed
QEMU has the "system" word spread all over the place. That may confuse
people looking at the "system tests" without much interaction with
software testing terminology.

>
> So I think renaming "acceptance" to "system" is especially ok if we only
> keep the "softmmu"-related tests in that folder... would it maybe make se=
nse
> to add the linux-user related tests in a separate folder called tests/use=
r/
> instead, Philippe? And we should likely rename the current build-system a=
nd
> check-system jobs in our gitlab-CI to build-softmmu and check-softmmu or =
so?
>

As I mentioned in Philippe's reply, those tests are still considered
system tests because system testing is the software built and
interacting with external test artifacts in software engineering.

> Alternatively, what about renaming the "acceptance" tests to "validation"
> instead? That word does not have a duplicated definition in the context o=
f
> QEMU yet, so I think it would be less confusing.

While at the beginning of your reply, I started thinking if
"validation" would cause less confusion for the QEMU project. Although
validation testing is a broader concept inside the Verification &
Validation process, encompassing unit testing, functional testing,
integration testing, system testing, and acceptance testing, it may be
an option for the QEMU project.

While system testing would be the correct terminology to use, if it
causes more confusion, using a less strict terminology, like
validation testing, is valid, in my opinion.

>
>   Thomas
>
