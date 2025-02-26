Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp740676njg;
        Tue, 25 Feb 2025 23:48:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW98P88FSh4forCjxZz+nCDS+F6ay2t+uy6KD7vWcTqSYXq1LqA2wfLVg0OsKSWHaKcwPd4ezq6/GkW/w==@linaro.org
X-Google-Smtp-Source: AGHT+IEILFxMYS4NrOpjH6UIGFwzg3388eU9NCe9QqC+q9S7zOGSGWKkeeDk393Uto121scj3lNh
X-Received: by 2002:a05:6214:413:b0:6e6:6936:6b06 with SMTP id 6a1803df08f44-6e87ab3163cmr99589796d6.16.1740556097523;
        Tue, 25 Feb 2025 23:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740556097; cv=none;
        d=google.com; s=arc-20240605;
        b=PbAmMPRzLr845Ftc5rB0jxFaWt7JSV/nnime7umiiGKoIIBRr9C5yNG14vAFakIU2t
         mnDO3AI3fkLOckKDmFPI+NbZbC23JQLPnNUhyC1MNe055MidgBk1SNkqBrbvUFlGERYq
         7ZgbSwGscQFeMPr00SAmjoT5VKeNboIUdYNWijijPKvFUlOw+o0j5YQgHD8tN58HUi+z
         HOu0jtOF1OdiJthkPbJugePORxA3cI/PJtFdzueiBb6/HL5cr6h8qQ8QZnPeC42rbdHy
         FfJrS1howgOyCHfNYdKB2o1GDGfRrk2SsXBtdBLbidiqvQk9WHbA6z7PnZ0W3s83Y7Ol
         Bi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=nbBOJoc/hYi/TbtRJ3CkGAC1erM0h3qUj9etGg1ef44=;
        fh=nlPdI7O67F+1qVcQ1UEYjMxg9VOWR9dmvTjbm7tVlsw=;
        b=LWSSwYf1uLB32gXt/QuCy1adL00Ss9/0U0HXduzrUlSKPY1IiIdnmgxeBs87KQw5MV
         C/jbQhPTXxMDDxZ6TUKuA3r+M8qxZxlOtrwqsmX3DJufdWU1E8SrQnMVU7W0auQozkfK
         N6w7wBjjz23rKkM9FfGjYZKBlXLlbI2SufXkEpel00Q6hIfCZ6TueMBVylyWITTRiCO/
         6TrldB/StZaU5Yo7rlG+BMZEoXtRfur7uBTVKWrsDI7LupAbCGdnApGLn7x5VLOnkE+X
         MhlmUMMJLzQX+ssN0NtGfEPfV65Nyp1Zd6NymadATYFUEWnDUXmu2qPevE/9yIjbnDpv
         1hSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=apA3XC6e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b01a68esi32098286d6.3.2025.02.25.23.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 23:48:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=apA3XC6e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnC9N-0003yo-0a; Wed, 26 Feb 2025 02:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tnC9L-0003yH-Go
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 02:48:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tnC9J-0005nN-Sh
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 02:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740556088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nbBOJoc/hYi/TbtRJ3CkGAC1erM0h3qUj9etGg1ef44=;
 b=apA3XC6epNDFdqBfYt4GGsWgDGh0Dypy1NuZdbeVcKE5HQDjBfvTxp0DaVq+9htIzf1uLX
 uNl0pTPZwWXfc7xUesnsZu+dh9ggFoGHmXKTnATihNZzVkd1eAiDWOAoSySkaKyI5rCsif
 y4VWJyn6dFTHBRvpsEE+LNs6yigMooo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-gWxH8c8IMASaB1eQhnE19w-1; Wed,
 26 Feb 2025 02:48:04 -0500
X-MC-Unique: gWxH8c8IMASaB1eQhnE19w-1
X-Mimecast-MFC-AGG-ID: gWxH8c8IMASaB1eQhnE19w_1740556083
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D4FBE1800877; Wed, 26 Feb 2025 07:48:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4BD45300018D; Wed, 26 Feb 2025 07:48:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE1E91800091; Wed, 26 Feb 2025 08:47:57 +0100 (CET)
Date: Wed, 26 Feb 2025 08:47:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
 Ard Biesheuvel <ardb@kernel.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com, 
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 14/24] hw/uefi: add var-service-json.c + qapi for NV
 vars.
Message-ID: <wyrnw2ur2xp7e6yr7f7hdbn3zbvolnvjojjrlaoax7hb2psxzo@xw7arzdtroer>
References: <20250225163031.1409078-1-kraxel@redhat.com>
 <20250225163031.1409078-15-kraxel@redhat.com>
 <87zfi95khl.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfi95khl.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HgxNPmABXvVD

  Hi,

> > +# @data: variable value, encoded as hex string.
> 
> I understand this is a blob.  We commonly use base64 for that.  Why not
> here?

It's an existing format already supported by other tools.  Guess I
should add that to the preamble.

> > +# @digest: variable certificate digest.  Used to verify the signature
> > +#     of updates for authenticated variables.
> 
> How to create and verify these digests will be obvious enough to users
> of this interface?

Well, no.  It's a somewhat complicated story ...

UEFI has two kinds of authenticated variables.  First, the secure boot
variables (PK, KEK, db, dbx).  These have hard-coded rules, the rule
most relevant in practice is that signed update requests for the 'db'
and 'dbx' variables are checked against the 'KEK' certificate database.

For other authenticated variables UEFI essentially remembers the
certificate when the variable is created, and any update / delete
requests need a signature from the same certificate (simplified a
bit to keep it short, the actual rules are more complicated, details
are in the UEFI spec).

This digest handles the "remembers the certificate" part.

In practice the second kind of authenticated variables is rarely used.
I have yet to see a piece of software actually using that in practice
(other than the test case I have written).


Also note that this is *not* part of the QMP interface.  The driver uses
this to store the efi variable store in json format on disk (see
var-service-json.c in this patch).

Adding support for reading/writing uefi variables is something we might
add to the monitor in the future.   Should that happen it is not clear
whenever such an interface would actually use the raw 'UefiVariable'
struct or if higher-level interfaces would be more useful.  For example
a command to query whenever the guest has secure boot turned on.

take care,
  Gerd

