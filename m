Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1054604ejb;
        Fri, 20 Oct 2023 01:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfyvLgwuLMGvTfMEGNLUlWA8HyJqSV4Fo3xtEHEKTUV3VWc0+gSOeJOIjUq9lbHXbJNiGM
X-Received: by 2002:a05:620a:8e8a:b0:767:8373:a890 with SMTP id rf10-20020a05620a8e8a00b007678373a890mr831944qkn.45.1697789220022;
        Fri, 20 Oct 2023 01:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697789220; cv=none;
        d=google.com; s=arc-20160816;
        b=F4hL/Ul55+3hmE+0Km9uvh7D35AHOkNWiFEPKf2k7QiDkIjkWJrlovY3wnRZf65MHc
         hFGJMAEnJ/Fy8bR4pGxredS7eElpdjPiy73qbNs7tmD+YvUfVwoOJbRNhJIpJJB4JB/K
         Y2ODyuDchaarSvw9/gGYM3uo8bGwI8rW9Oz6bmpwpRfdcdxEmte/oT+JY173leIXmkht
         Cvj1+gDVvOwdMm0imk5tW24t9nzB62NuQynaPErx5+/7N7uXFES5yIx353wMqVVSsuB+
         pdp8xHv5tN7E3rAiB7gZBSLfS0IgstKJNtqZ4pC2wqyawaYsgn3kiVasCizhgUCBhxWZ
         RjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=m4Ga8awczG7MZCGjzDTuqAt4GFkXTsRheoKgmZb2DXg=;
        fh=AqS06bBI2fiG66EUFW2L1h7q+nGqVsFELILF2r+ow1A=;
        b=ditQ3cZOpk06m9sKys8pnnSCkmyMu8gmVss2iFYW8pVEP1WPzQBkRSi7EXepH8OHwU
         /qMtmmGtwI+AB9Sbbg1QN+TBm5HbuA36nyoLL1aPsmap7I11K5gNJSLlluBcOzv5EK0b
         OmSCOs71Xu+out3RZZ8OUAnxipSsLYwiVX7b9jKKWeoW99f38r9m90eJQo8t8n3nVV42
         e3u64YfeGzvFitEIWHiLACGqcgQjovF11zvko/fmhGtk1sBYPZNBmmi4GcS/OTgaA7qA
         JkFv2MXZrpjdiMXTbL8nNqygLts6gsU39T30dPvfvJuKEeu5Z269yUlfhT1bgcB1FHPl
         XjAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25-20020a05620a12d900b0077431227b58si862027qkl.27.2023.10.20.01.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 01:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtkWz-0006m8-T9; Fri, 20 Oct 2023 04:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1qtkWy-0006br-G0
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 04:06:52 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1qtkWj-0001zJ-5p
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 04:06:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2B2C02D3DE;
 Fri, 20 Oct 2023 08:06:30 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG6EX1.mxp5.local (172.16.2.51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 20 Oct
 2023 10:06:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001e6886de3-6b4c-417e-bc6f-1385705d3717,
 C3DE39B25D4A09A1EA5644DCEB8289D547B4AEB9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 88.179.9.154
Date: Fri, 20 Oct 2023 10:06:26 +0200
From: Greg Kurz <groug@kaod.org>
To: Juan Quintela <quintela@redhat.com>
CC: <qemu-devel@nongnu.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>,
 Nicholas Piggin <npiggin@gmail.com>, <qemu-s390x@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>, "Eric
 Farman" <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>, "Harsh Prateek
 Bora" <harshpb@linux.ibm.com>, John Snow <jsnow@redhat.com>,
 <qemu-block@nongnu.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, =?UTF-8?B?TWFyYy1BbmRy?=
 =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>, Stefan Weil
 <sw@weilnetz.de>, <qemu-arm@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Corey Minyard <minyard@acm.org>, Leonardo Bras <leobras@redhat.com>, "Thomas
 Huth" <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Michael
 S. Tsirkin" <mst@redhat.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Halil Pasic
 <pasic@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 07/13] RFC migration: icp/server is a mess
Message-ID: <20231020100626.57debfa4@bahia>
In-Reply-To: <875y313g4b.fsf@secure.mitica>
References: <20231019190831.20363-1-quintela@redhat.com>
 <20231019190831.20363-8-quintela@redhat.com>
 <20231019233958.17abb488@bahia> <875y313g4b.fsf@secure.mitica>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG6EX1.mxp5.local
 (172.16.2.51)
X-Ovh-Tracer-GUID: 6ec39e93-68a1-4c19-9ab7-ca81b40e15a1
X-Ovh-Tracer-Id: 3820459861057902967
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrjeejgdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeekjedtveegkeeileffvdetvddvgedtudduiefghffhgfdvhfegjeetkeehfeeknecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejpdekkedrudejledrledrudehgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhhuihhnthgvlhgrsehrvgguhhgrthdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpmhhsthesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhlvghosghrrghssehrvgguhhgrthdrtghomhdpmhhinhihrghrugesrggtmhdrohhrghdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnoh
 hnghhnuhdrohhrghdpshifseifvghilhhnvghtiidruggvpdhmrghrtggrnhgurhgvrdhluhhrvggruhesrhgvughhrghtrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhmrghrkhdrtggrvhgvqdgrhihlrghnugesihhlrghnuggvrdgtohdruhhkpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjshhnohifsehrvgguhhgrthdrtghomhdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdphhgrrhhshhhpsgeslhhinhhugidrihgsmhdrtghomhdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdhfrghrohhsrghssehsuhhsvgdruggvpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhsrghmuhgvlhdrthhhihgsrghulhhtsegvnhhsqdhlhihonhdrohhrghdptghmihhnhigrrhgusehmvhhishhtrgdrtghomhdpkhhrrgigvghlsehrvgguhhgrthdrtghomhdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpnhhpihhgghhinhesghhmrghilhdrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdhsthgvfhgrnhgssehlihhnuhigrdhvnhgvthdrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhi
 gsehrvgguhhgrthdrtghomhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CqWRg2/uTFtI

On Fri, 20 Oct 2023 09:30:44 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Greg Kurz <groug@kaod.org> wrote:
> > On Thu, 19 Oct 2023 21:08:25 +0200
> > Juan Quintela <quintela@redhat.com> wrote:
> >
> >> Current code does:
> >> - register pre_2_10_vmstate_dummy_icp with "icp/server" and instance
> >>   dependinfg on cpu number
> >> - for newer machines, it register vmstate_icp with "icp/server" name
> >>   and instance 0
> >> - now it unregisters "icp/server" for the 1st instance.
> >> 
> >> This is wrong at many levels:
> >> - we shouldn't have two VMSTATEDescriptions with the same name
> >> - In case this is the only solution that we can came with, it needs to
> >>   be:
> >>   * register pre_2_10_vmstate_dummy_icp
> >>   * unregister pre_2_10_vmstate_dummy_icp
> >>   * register real vmstate_icp
> >> 
> >> As the initialization of this machine is already complex enough, I
> >> need help from PPC maintainers to fix this.
> >> 
> >> Volunteers?
> >> 
> >> CC: Cedric Le Goater <clg@kaod.org>
> >> CC: Daniel Henrique Barboza <danielhb413@gmail.com>
> >> CC: David Gibson <david@gibson.dropbear.id.au>
> >> CC: Greg Kurz <groug@kaod.org>
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  hw/ppc/spapr.c | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index cb840676d3..8531d13492 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -143,7 +143,12 @@ static bool pre_2_10_vmstate_dummy_icp_needed(void *opaque)
> >>  }
> >>  
> >>  static const VMStateDescription pre_2_10_vmstate_dummy_icp = {
> >> -    .name = "icp/server",
> >> +    /*
> >> +     * Hack ahead.  We can't have two devices with the same name and
> >> +     * instance id.  So I rename this to pass make check.
> >> +     * Real help from people who knows the hardware is needed.
> >> +     */
> >> +    .name = "pre-2.10-icp/server",
> >>      .version_id = 1,
> >>      .minimum_version_id = 1,
> >>      .needed = pre_2_10_vmstate_dummy_icp_needed,
> >
> > I guess this fix is acceptable as well and a lot simpler than
> > reverting the hack actually. Outcome is the same : drop
> > compat with pseries-2.9 and older.
> >
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> I fully agree with you here.
> The other options given on this thread is deprecate that machines, but I
> would like to have this series sooner than 2 releases.

Yeah and, especially, the deprecation of all these machine types is
itself a massive chunk of work as it will call to identify and
remove other related workarounds as well. Given that pretty much
everyone working in PPC/PAPR moved away, can the community handle
such a big change ?

>  And what ppc is
> doing here is (and has always been) a hack and an abuse about how
> vmstate registrations is supposed to work.
> 

Sorry again... We should have involved migration experts at the time. :-)

> Thanks, Juan.
> 

Cheers,

-- 
Greg
