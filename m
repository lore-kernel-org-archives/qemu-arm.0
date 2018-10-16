Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5553125wrt;
        Tue, 16 Oct 2018 01:24:37 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60jJYTIGrgzazGIMIHs94Zo0iCFhha8D900HLGuGYN09zXd44fbF8bbBy2nP6i9Bp/CT4Wz
X-Received: by 2002:ae9:ee0e:: with SMTP id i14-v6mr19010659qkg.298.1539678277187;
        Tue, 16 Oct 2018 01:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539678277; cv=none;
        d=google.com; s=arc-20160816;
        b=yUNB19gqHtHQtjXJqo5ylHmJwKDx+cXiHtFldLyps4tIMlPhgIGmC0xwbaIySnio0B
         7BOkZTc6zTS7zBzjJl1k8qyFLjt8A8AckCxrzoPz0HlapuOeV73WnpIR4NE/cSOUb9bu
         tAm98HDg86TCpdqE25AFbpV/9SJcVU+iiieInAEaJcPWOTuakMgSBp9Qnd2CkVvDzJGG
         pIEH5b9zpPuxLvP4V++T4oJAV8f0RoeTfDGbkGN5Bwm59ovJFmcNQpl/lyGRx2RUa1As
         S5OuD957xnAeWxcIghD9HKR/QzEJTIkxn2Ac5whKpqUug0q3icqeVXs5qHnxkoZRyZHo
         AwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=GM71ATq40uu2q5omWyJApMyp8C/RtU5LlSRPaKfDZ+A=;
        b=0AZrZfdcoqBXrhN793te5yynqTcpHuYgXkNaLfJArGj0B1xG9yFvZEZDdG7QYJmrCI
         0Ya6ppXNkgYpPTUpWBp0n6434MD1vVjDuBSZzx9gIZ823IrNRjF6G1Otc35ilJnJfLCw
         a/arjy6oQyWD6TbhuaKQxt0fkDsm0Yt1Zpv9AscuuUFour8EJHb4fn+WbhMKDoj8D3zV
         xw5QH/GbfXnlFhkS8VSrQwMMASFzwwBu7OwNmVpSfxGJrmI5FusSPqugklb4S2H0d+G0
         brl6WLP4jozuKVEby4+msFOQ6A13l9x6bfByxYwTEBK7yxslmjmHAPwSzDibb2cc7W4Q
         7yvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u56si642894qvc.146.2018.10.16.01.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 01:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCKea-0007IR-9S
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 04:24:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gCKdU-0007Ff-NY
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 04:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gCKcg-0001ab-RJ
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 04:23:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gCKbl-0008I3-16; Tue, 16 Oct 2018 04:21:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0CF15F74A;
	Tue, 16 Oct 2018 08:21:30 +0000 (UTC)
Received: from work-vm (ovpn-117-199.ams2.redhat.com [10.36.117.199])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 706EB5D962;
	Tue, 16 Oct 2018 08:21:23 +0000 (UTC)
Date: Tue, 16 Oct 2018 09:21:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20181016082117.GB2426@work-vm>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-4-aclindsa@gmail.com>
	<3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 16 Oct 2018 08:21:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 03/14] migration: Add post_save function
 to VMStateDescription
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yrZmYWwZBQ5a

* Richard Henderson (richard.henderson@linaro.org) wrote:
> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > In some cases it may be helpful to modify state before saving it for
> > migration, and then modify the state back after it has been saved. The
> > existing pre_save function provides half of this functionality. This
> > patch adds a post_save function to provide the second half.
> > 
> > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> > ---
> >  docs/devel/migration.rst    |  9 +++++++--
> >  include/migration/vmstate.h |  1 +
> >  migration/vmstate.c         | 10 +++++++++-
> >  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> Hmm, maybe.  I believe the common practice is for pre_save to copy state into a
> separate member on the side, so that conversion back isn't necessary.
> 
> Ccing in the migration maintainers for a second opinion.

It is common to copy stuff into a separate member; however we do
occasionally think that post_save would be a useful addition; so I think
we should take it (if nothing else it actually makes stuff symmetric!).

Please make it return 'int' in the same way that pre_save/pre_load
does, so that it can fail and stop the migration.

Dave

> 
> 
> r~
> 
> > 
> > diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> > index 687570754d..2a2533c9b3 100644
> > --- a/docs/devel/migration.rst
> > +++ b/docs/devel/migration.rst
> > @@ -419,8 +419,13 @@ The functions to do that are inside a vmstate definition, and are called:
> >  
> >    This function is called before we save the state of one device.
> >  
> > -Example: You can look at hpet.c, that uses the three function to
> > -massage the state that is transferred.
> > +- ``void (*post_save)(void *opaque);``
> > +
> > +  This function is called after we save the state of one device
> > +  (even upon failure, unless the call to pre_save returned and error).
> > +
> > +Example: You can look at hpet.c, that uses the first three functions
> > +to massage the state that is transferred.
> >  
> >  The ``VMSTATE_WITH_TMP`` macro may be useful when the migration
> >  data doesn't match the stored device data well; it allows an
> > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > index 2b501d0466..f6053b94e4 100644
> > --- a/include/migration/vmstate.h
> > +++ b/include/migration/vmstate.h
> > @@ -185,6 +185,7 @@ struct VMStateDescription {
> >      int (*pre_load)(void *opaque);
> >      int (*post_load)(void *opaque, int version_id);
> >      int (*pre_save)(void *opaque);
> > +    void (*post_save)(void *opaque);
> >      bool (*needed)(void *opaque);
> >      VMStateField *fields;
> >      const VMStateDescription **subsections;
> > diff --git a/migration/vmstate.c b/migration/vmstate.c
> > index 0bc240a317..9afc9298f3 100644
> > --- a/migration/vmstate.c
> > +++ b/migration/vmstate.c
> > @@ -387,6 +387,9 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
> >                  if (ret) {
> >                      error_report("Save of field %s/%s failed",
> >                                   vmsd->name, field->name);
> > +                    if (vmsd->post_save) {
> > +                        vmsd->post_save(opaque);
> > +                    }
> >                      return ret;
> >                  }
> >  
> > @@ -412,7 +415,12 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
> >          json_end_array(vmdesc);
> >      }
> >  
> > -    return vmstate_subsection_save(f, vmsd, opaque, vmdesc);
> > +    ret = vmstate_subsection_save(f, vmsd, opaque, vmdesc);
> > +
> > +    if (vmsd->post_save) {
> > +        vmsd->post_save(opaque);
> > +    }
> > +    return ret;
> >  }
> >  
> >  static const VMStateDescription *
> > 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
