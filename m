Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4012996wrm;
        Mon, 7 Oct 2019 09:29:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUYsdswa9qaHDh75b+tb6H+AvD4UhSgqDo8h3uF7iYbV/+CdOsIIXqqolD2oKILR+Phtc4
X-Received: by 2002:aed:3576:: with SMTP id b51mr31376786qte.378.1570465677186;
        Mon, 07 Oct 2019 09:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570465677; cv=none;
        d=google.com; s=arc-20160816;
        b=fKKUoHZUvfDrK8MYFi4WvBjSWIEs27KVOq9SaeiIkjABltfp/Tn5JlgA1ffSs6vA7I
         GhdgJPRPfar0P6rM6l/aoqSVMRo3wv2C6Q1Y6FOTwhlHZaHVCR4Qnr6r2bsyNnyYUFSZ
         fmhVQgfllZwN4hv8/HtFlwFrJVXJQdTA5we6ypxdORwL3r/J48fWqNExdXhcR/hwkhoU
         9eVBdrQy4Qioqnq+ycQbYmSrE8QRz1Hwe9rZQJbxFYr1xPgNWzlp+mxdz3yhkpApaqmk
         vFaOYHuCpxhAUQxroiAfjUBulmet0Mi0x8uJ6jwt0hfl9y5et/OxKPywT1Lfmn8rnhny
         fJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date;
        bh=V3qRErLav3YCTc9LnUGFlSZcZbdg7FNusB0We2WAVrM=;
        b=sAZhRrtfny7WneUkvQlx2cLIWNaFi7bdONGQc2HJ+p7U2YsY18OXgItBiwyH/kMYst
         SJ/7vlaryJ/Cd2loVOn/yNItGAjSxgVbUiQL2Q71iB0bdNAN7FUZVWZ67r/jZ6hD6LFb
         yMHR+0EGVS6TkdIey3LX/8C7XpKMYqkjqhpldiXyTxvRnCVkMwGi9qEfqO0B+wYLqKYQ
         3VZXrRnqdDSfudTQ1LzWy5xTdFfPuDgEt+xCPGx1/QV//JHMttY80c89Nqa1Z5ArFAOJ
         /94GXd+EqkGWZmD6L+GqIW6JG9vN13MQ0AZ8B0m4KLUOV8ZP7szczdg5hZJsCqf9IIwG
         6vOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g48si13450122qvd.146.2019.10.07.09.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 09:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHVrY-0001fE-CE
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 12:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iHVm4-000336-Cc
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 12:22:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iHVm2-0006dJ-Ax
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 12:22:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56784)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iHVm2-0006ba-0p; Mon, 07 Oct 2019 12:22:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 088BAC04BD33;
 Mon,  7 Oct 2019 16:22:12 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB7345D70E;
 Mon,  7 Oct 2019 16:21:44 +0000 (UTC)
Date: Mon, 7 Oct 2019 17:21:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v4 06/31] python: add commit-per-subsystem.py
Message-ID: <20191007162142.GO4656@redhat.com>
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
 <20191001155319.8066-7-vsementsov@virtuozzo.com>
 <20191007175514.19360a2b.cohuck@redhat.com>
 <cc355055-871d-9fb8-6f2d-f75d5cd40a3b@virtuozzo.com>
 <20191007181651.2fd72fbf.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191007181651.2fd72fbf.cohuck@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 07 Oct 2019 16:22:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "fam@euphon.net" <fam@euphon.net>,
 "pburton@wavecomp.com" <pburton@wavecomp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "codyprime@gmail.com" <codyprime@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "groug@kaod.org" <groug@kaod.org>,
 "yuval.shaia@oracle.com" <yuval.shaia@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "integration@gluster.org" <integration@gluster.org>,
 "clg@kaod.org" <clg@kaod.org>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xpk51K7I/aP7

On Mon, Oct 07, 2019 at 06:16:51PM +0200, Cornelia Huck wrote:
> On Mon, 7 Oct 2019 16:10:02 +0000
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> 
> > 07.10.2019 18:55, Cornelia Huck wrote:
> > > On Tue,  1 Oct 2019 18:52:54 +0300
> > > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> 
> > >> +def git_add(pattern):
> > >> +    subprocess.run(['git', 'add', pattern])
> > >> +
> > >> +
> > >> +def git_commit(msg):
> > >> +    subprocess.run(['git', 'commit', '-m', msg], capture_output=True)
> > >> +
> > >> +
> > >> +maintainers = sys.argv[1]
> > >> +message = sys.argv[2].strip()
> > >> +
> > >> +subsystem = None
> > >> +
> > >> +shortnames = {
> > >> +    'Block layer core': 'block',
> > >> +    'ARM cores': 'arm',
> > >> +    'Network Block Device (NBD)': 'nbd',
> > >> +    'Command line option argument parsing': 'cmdline',
> > >> +    'Character device backends': 'chardev',
> > >> +    'S390 general architecture support': 's390'
> > >> +}
> > >> +
> > >> +
> > >> +def commit():
> > >> +    if subsystem:
> > >> +        msg = subsystem
> > >> +        if msg in shortnames:
> > >> +            msg = shortnames[msg]
> > >> +        msg += ': ' + message
> > >> +        git_commit(msg)
> > >> +
> > >> +
> > >> +with open(maintainers) as f:
> > >> +    for line in f:
> > >> +        line = line.rstrip()
> > >> +        if not line:
> > >> +            continue
> > >> +        if len(line) >= 2 and line[1] == ':':
> > >> +            if line[0] == 'F' and line[3:] not in ['*', '*/']:
> > >> +                git_add(line[3:])
> > >> +        else:
> > >> +            # new subsystem start
> > >> +            commit()
> > >> +
> > >> +            subsystem = line
> > >> +
> > >> +commit()  
> > > 
> > > Hm... I'm not sure about the purpose of this script (and my python is
> > > rather weak)... is this supposed to collect all changes covered by a
> > > subsystem F: pattern into one patch?  
> > 
> > Yes
> > 
> > > If so, what happens to files
> > > covered by multiple sections?
> > >   
> > 
> > Hmm, they just go to the first of these sections, mentioned in MAINTAINERS.
> > Is it bad I don't know, but I tried to automate it somehow. Anyway, I myself
> > can't have better idea about how to organize patches to the subsystems which
> > I don't know.
> > 
> 
> Yeah, that is a problem I don't have a solution for, either.
> 
> But the script should probably get at least a comment about its
> intended purpose and limitations? We don't really want people to start
> using it blindly.

Is this really a common enough problem to even justify having the
script to start with ?

It looks like its only really usable in the case where the changes
to each subsystem are totally self-contained, otherwise you'll get
git bisect failures. The user still has to go back and edit each
commit here to fill in a useful commit messages. It doesn't seem
to save much effort over 'git add -u sub/dir/ && git commit -s'
which is what I'd typically do for grouping changes that are
spread across the tree.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
