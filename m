Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp598762wrt;
        Wed, 17 Oct 2018 05:08:06 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61naCFndAd45pDZZ5LqiKkx+47UVyhKAK5DDfelnLPDXJxG66ZcRK5+iuCV2t7SwxyhhQP6
X-Received: by 2002:a0c:fe11:: with SMTP id x17mr24796448qvr.150.1539778086122;
        Wed, 17 Oct 2018 05:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539778086; cv=none;
        d=google.com; s=arc-20160816;
        b=Hh74sIZ5hqK1SikZ8wLm/Suh1gc46Jn5WIxO3GOgtL7U5LKwZtcBX9YgePSwJt0s5Z
         EB6BZD+qIxP3aIEvlCo5IRLAVJdyRqAdm3Zn5X37O5f+hipxpcg7SPOepEiThwXvu+qs
         buW+DHwTTqVp8Dd/gSl2rU7n5Vum5iLxxfhdPp/oZJ83nQVTScBAi2g4wqbenYweP0L3
         z6BHVswqTtHSedcX2zyH72L2c6UFknA4donHdIfC4eoWLC61OVVFiH+0drZn8SZuJ24+
         VrLrANt/VOPpe6Dn3znvZywDtULaZJsaBaACnic2luh6QV22eSZBm3EYLcWXBhUvWwN/
         +MZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from;
        bh=4xm+FBicuIzDdE/DEW3XJgGiOhMLL+Hgu1u8Lq1WDa8=;
        b=kkCjVuYI5affwC0GtHI9zIGiLlyMyu1CbrXXJReGCAZ7vwms5vnHVmSVwnK9Pf0V/7
         u8BJdKdWyAOVqMUSXbmRN9gYnk43hr+xOKTm7yM217VEh9SEMaW375eOl69dLmz8g0TY
         pLyFMeZCOfi0m0rS/aCsxFaPIqCZc+Qwnp6kvOwSnXCXc34UoBrW09z9Ibq3PgrpNO/p
         Gv8LNxaat5QwCNlCe4ESQ/C/VP6fGsdTxHtocwlrkIb9A748Rzsb5VlLOCoezS6DaLEf
         0HUMfJlEGdSIn57USPdDtNOjEpqJjKzRam+J+8zcmZngKN1gY+uSLbMvhVP8idp3yD+w
         PLJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2-v6si13506758qte.137.2018.10.17.05.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 05:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCkcP-0004Ie-KD
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 08:08:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1gCkc9-0004Ey-OJ
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 08:07:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1gCkc5-0006gU-Lq
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 08:07:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1gCkc5-0006eC-D8; Wed, 17 Oct 2018 08:07:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 979529D508;
	Wed, 17 Oct 2018 12:07:44 +0000 (UTC)
Received: from localhost (ovpn-116-210.ams2.redhat.com [10.36.116.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1092C313;
	Wed, 17 Oct 2018 12:07:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
In-Reply-To: <20181016140655.GI2426@work-vm> (David Alan Gilbert's message of
	"Tue, 16 Oct 2018 15:06:55 +0100")
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-4-aclindsa@gmail.com>
	<3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
	<20181016082117.GB2426@work-vm>
	<20181016135517.GO3671@okra.localdomain>
	<20181016140655.GI2426@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 17 Oct 2018 14:07:32 +0200
Message-ID: <87y3aw93p7.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 17 Oct 2018 12:07:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 03/14] migration: Add post_save function
 to VMStateDescription
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U0I0zftm8xHn

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Aaron Lindsay (aclindsa@gmail.com) wrote:
>> On Oct 16 09:21, Dr. David Alan Gilbert wrote:
>> > * Richard Henderson (richard.henderson@linaro.org) wrote:
>> > > On 10/10/18 1:37 PM, Aaron Lindsay wrote:
>> > > > In some cases it may be helpful to modify state before saving it for
>> > > > migration, and then modify the state back after it has been saved. The
>> > > > existing pre_save function provides half of this functionality. This
>> > > > patch adds a post_save function to provide the second half.
>> > > > 
>> > > > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
>> > > > ---
>> > > >  docs/devel/migration.rst    |  9 +++++++--
>> > > >  include/migration/vmstate.h |  1 +
>> > > >  migration/vmstate.c         | 10 +++++++++-
>> > > >  3 files changed, 17 insertions(+), 3 deletions(-)
>> > > 
>> > > Hmm, maybe.  I believe the common practice is for pre_save to
>> > > copy state into a
>> > > separate member on the side, so that conversion back isn't necessary.
>> > > 
>> > > Ccing in the migration maintainers for a second opinion.
>> > 
>> > It is common to copy stuff into a separate member; however we do
>> > occasionally think that post_save would be a useful addition; so I think
>> > we should take it (if nothing else it actually makes stuff symmetric!).
>> > 
>> > Please make it return 'int' in the same way that pre_save/pre_load
>> > does, so that it can fail and stop the migration.
>> 
>> This patch calls post_save *even if the save operation fails*. My
>> reasoning was that I didn't want a failed migration to leave a
>> still-running original QEMU instance in an invalid state. Was this
>> misguided?
>
> That's fine - my only issue is that I want post_save to be able to fail
> itself even if pre_save failed.
>
>> If it was not, which error do you prefer to be returned from
>> vmstate_save_state_v() in the case that both the save operation itself
>> and the post_save call returned errors?
>
> The return value from the save operation.
> I did wonder about suggesting that you pass the return value from the
> save operation as a parameter to post_save.

The one from save.  In general, this one shouldn't be called, and if it
gets an error, we are really in big trouble, no?  By big treauble I mean
that we can basically only stop the guest?

Later, Juan.

>
> Dave
>
>> -Aaron
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
