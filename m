Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1266385ejb;
        Thu, 30 Mar 2023 07:03:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ayVHA9uwP6GoLpzz41fD3+3JpfSuUp57IXXbAbyr+sbX5LfVb18CfhVr+bLkXUDlOuh/JT
X-Received: by 2002:a05:6902:1201:b0:b71:8d17:7e4 with SMTP id s1-20020a056902120100b00b718d1707e4mr31478483ybu.51.1680185010986;
        Thu, 30 Mar 2023 07:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680185010; cv=none;
        d=google.com; s=arc-20160816;
        b=Ig3POHmD6y27P2uq7ydNxt7x0YNwX0l2T+k4mjZZOxkwbIPkgLZi+8Sv3TEQ+vPW0O
         GKqcIpJUABtUO0IKEZAyO10c2gHN51cxzHf4hYl3XhFz1fhoN21jbo+41Lt/BhdGJOPh
         DfC+ALWCI6O9b7xPrgslTRxvCH4BXCfB2xlVXVY7RtuM3TIL6FDIkcpAjLfTsXj/apSy
         ahsqRVSxQmIgH1Fh4jNRuDP4U3yskonvyrFudQYk7MVXgSfKQI4uVPGlFG17iayYtFoG
         M2ccbL/YnzB3pExIT4pCKmQzt8OYv6QcWwkQZKTJMnI4WEZ5ZVJP03GsXJjzhKci1L/N
         x08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:date:from:dkim-signature;
        bh=Bbba0TpdX/+MZRHS5ch5oFXZb/MbtM4FYt9Wt3Q92Pw=;
        b=lLWjgTjFZgiyV3xhOeuHh7S0rumvsCXvJqt9778Zojxfv2yWlDrEF6XBf1zKa21MYc
         gQ/JrQLF+A7LqbUoH5lSsuesF9fZ+57vB5goTSOyYcPqCtoaRMKVVFIqMRP5X9g/d8Nd
         +1fnJFH+twC/bWpYTGdZ+F/6P2eAZYXmyD1XrqoHiwSrAcjH8J1TQGZQu4JQFdXM/y0d
         YRcA+vR8zwhZfYr/NmRCEIRb48FOauaAHky/k1wGfbXjr5oSSKrLFyU8rs0AxMwRik4z
         958rUYT6nESdvSTEWZTxvvSoCnB6cXm1DcxCQh4iAOebhmQ19hyP/xEH/gLNcTIW7CBh
         6BCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=djhy5x7j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y197-20020a3764ce000000b007464bae74ccsi19013814qkb.551.2023.03.30.07.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 07:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=djhy5x7j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phsrx-0008En-ID; Thu, 30 Mar 2023 10:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1phsrv-0008Dz-AP
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 10:03:11 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1phsrs-0007xD-Vs
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 10:03:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso22028207pjb.3
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112; t=1680184987;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bbba0TpdX/+MZRHS5ch5oFXZb/MbtM4FYt9Wt3Q92Pw=;
 b=djhy5x7jYiHfr2W6pAlukxSkhn7v3GitqTTTxuVJcSCTH5aThtJrimoRAceukUd+US
 A3m29eb1gSybclbDOrKMEna8scZHV7SbeWFux/BjYdWygyqbki/le3+yIfQyGN6OQP4K
 RlUCWZz3u78ZbigLyBJHVvrRBIy4jMFFhlqP4kEx3IcGZH3ezOHSSbDuMf9PDq93f9cf
 quq7b8EYl4HNLnplHxhFGLPNN8PvHpXWbsaPd0cxTUJYxC9o6DKgS7KtrE7eJ9Y/C+Ml
 ZyisApd5LxPSBgnTQioRrSr+zw0PqRe7biNgElp2ioLoh1eVx6HlIOeG1WgBDoexWqK6
 qfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680184987;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bbba0TpdX/+MZRHS5ch5oFXZb/MbtM4FYt9Wt3Q92Pw=;
 b=P3CktZlK9WHNBaxAhkyK2j6wKCtIyrdCvJygySMBdTFkOG4W75KHnGIM4AylDNIWOT
 TBSlGTNm6dRJrGAZtNnLpRmVnoHbMLto1dQYTwNSj81NOwciIbKfMH0zV+oo4tIG7+Ll
 jBSvy6aI5XCLZ0CFH/CxwBkfAOTWUYp0E+Dwe/AA2B5OkxKt9Z/GaPAsPbtb8eB7fd+r
 WhcuJlS5VLe49EFAxz1L104I9ERcEjjTA72WXvKQxHVMcnASoesqU9CqZ9cSjZS7ehz1
 6n5CWXDtJzpdGhptXXV8QCbR/okFidELvvhAX04HFW5dqGrzWvT42Ia/PC2YbgFhi4o6
 m4pQ==
X-Gm-Message-State: AO0yUKXGiFOF0cCLqc89wcvuTfH9rw/AfsGl9EeUBETebg55LggrgFIC
 88vabgespXS3A4oa8JwDCcno8Q==
X-Received: by 2002:a05:6a20:c509:b0:db:520c:430a with SMTP id
 gm9-20020a056a20c50900b000db520c430amr22704804pzb.38.1680184987151; 
 Thu, 30 Mar 2023 07:03:07 -0700 (PDT)
Received: from rhel9-box ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id
 j26-20020aa7929a000000b0062c0c3da6b8sm11299417pfa.13.2023.03.30.07.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 07:03:06 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 30 Mar 2023 19:32:59 +0530 (IST)
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, Eric DeVolder <eric.devolder@oracle.com>, 
 shannon.zhaosl@gmail.com, imammedo@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
In-Reply-To: <20230330094323-mutt-send-email-mst@kernel.org>
Message-ID: <366bb156-f41f-e1c4-fc59-3ecca6eeaba7@anisinha.ca>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
 <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
 <20230330094323-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1usnj4S2cZOa



On Thu, 30 Mar 2023, Michael S. Tsirkin wrote:

> On Thu, Mar 30, 2023 at 01:06:36PM +0530, Ani Sinha wrote:
> >
> >
> > On Wed, 29 Mar 2023, Michael S. Tsirkin wrote:
> >
> > > On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> > > >
> > > >
> > > > On 3/29/23 00:19, Michael S. Tsirkin wrote:
> > > > > Hmm I don't think we can reasonably make such a change for 8.0.
> > > > > Seems too risky.
> > > > > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > > > > revert to old behaviour, in case of breakage on some guests.  and maybe
> > > > > we want to keep old revision for old machine types.
> > > > Ok, what option name, for keeping old behavior, would you like?
> > >
> > > Don't much care. x-madt-rev?
> > >
> > > > >
> > > > >
> > > > > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> > > > > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > > > > less than 5.
> > > > > >
> > > > > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > > > >
> > > > > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > > > > Linux?
> > > >
> > > > https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> > >
> > > Great! Maybe stick a Link: tag in the commit log.
> >
> > If the original bug is in the kernel and kernel upstream has accepted both
> > your fix and Mario's patch on the acpi revision mess, I see no urgency to
> > fix this in QEMU.
> >
> > Maybe we can address this in the 8.1 development window.
>
> Why "maybe"? Eric is working on a patch I don't see why we won't
> address it.
>

I am not opposed to addressing it. I just think it might be too risky for
8.0 given that we are already past the hard feature freeze date.
