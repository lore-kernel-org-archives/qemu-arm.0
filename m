Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2440765njk;
        Mon, 27 Jan 2025 05:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUsAdyvJAQkIQfVD083RaeMFRG97CDY+hglp9RtWsJIVHFzUqF5qQwrSyGsrqmSHmH/XZGxuHWwous2BQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEWR8ynXNykPe9liuTCMBdqGwK/e6zXtK4nGIyslwskCy9ip2A60yMTritVjX/Zoxvm0yTd
X-Received: by 2002:a05:620a:2804:b0:7b7:106a:19a0 with SMTP id af79cd13be357-7be6321c827mr5112923785a.24.1737984970802;
        Mon, 27 Jan 2025 05:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737984970; cv=none;
        d=google.com; s=arc-20240605;
        b=FJXOWlbx5HOUkNxCXlDXkQU51OlqQAcTGcByz+L2jWHeWHWSPU2XQHWfc86sQvh90G
         1HnskDi6aH8XHNFQwiIGi0StLJIcuT/T90NZgtd4DmWWoNY0vnQmsTc27HUoyhLpYG91
         gK5tuEuihIfuVB+cfxd7pH/xcnrA+PKEivxKL902Rb2gBBsiiV+oVaItC9YhXGG1IS2s
         3uzRw8Tn1P2t+z6bAxvOKrzyvvkzf0y+FCt9QNpINMDJUqckLgQ2wTdO0con9hvoON/u
         btoL237iJtjXPMKoxFO9g1+K3GxLx9hIoEv+19Myj4z2EZZ2x552m53SiNJ6tOCqZP/G
         L6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=IBwY1xIZnwwgQfA31WCMAUp48GguOAT29byigtR44uo=;
        fh=eySKZTsJaWXAD0EevXujHzYJSxiqJmy7yUq3vicrWBE=;
        b=IGmmcvf9h43Df7IaCjaH3p8a2MVCiVimv6AyNhQnHV5/NQAspf0zepCxf6aE8N44wt
         DY+mW04iuuG4VX/NTqdd93GwSbLUGKZi2/kAAbVtf2yFjTXgHF631yubkwlELV+0LNgF
         puuyzaKW+KXvl3/LdxyV57DGq0qmx9hXJT55rP7JHm0zS6/DjsLu0eINb4qCjj2Hcqny
         F/0G4g4JlPS5NmU7G2RiLRpKlB8Gx69PAElk5mOjOo/2AHSS1a5FZqOiBtZH2FZc7gKI
         CfJpFTPLZxOCYvrxISqe+kyhEP4+6ApP4Gn7ET/FcwmMP+5cZaPAmE1vAzOh1k39Zi1q
         R6Qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S1gIcT92;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af12434si975836585a.538.2025.01.27.05.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S1gIcT92;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPHb-0001DX-DN; Mon, 27 Jan 2025 08:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1tcPHL-0001At-Fd
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1tcPHI-0005Cf-ME
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737984944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IBwY1xIZnwwgQfA31WCMAUp48GguOAT29byigtR44uo=;
 b=S1gIcT924mpquJpYKVFU3+YIWNHlcNWs1HfRdUIE7poFsPascTH3WPMay2kq2VExKDJURf
 cU3eTjV0kN/r+XokK0htdvT6+XBQjzOAyisXJEdSosX92tiIypkRsiVKCzdR5LE977KXiA
 /mCXUlYU2ffTTqatwh51ma+ltLVco0E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-YeavklvRO9aaaY3lqLJP5w-1; Mon,
 27 Jan 2025 08:35:42 -0500
X-MC-Unique: YeavklvRO9aaaY3lqLJP5w-1
X-Mimecast-MFC-AGG-ID: YeavklvRO9aaaY3lqLJP5w
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C8A8180035F; Mon, 27 Jan 2025 13:35:41 +0000 (UTC)
Received: from gezellig (unknown [10.39.195.105])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4C24318008C0; Mon, 27 Jan 2025 13:35:39 +0000 (UTC)
Date: Mon, 27 Jan 2025 14:35:35 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, sebott@redhat.com
Subject: Re: [PATCH 2/2] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
Message-ID: <Z5eLpzisRtAstcxw@gezellig>
References: <20250117191106.322363-1-kchamart@redhat.com>
 <20250117191106.322363-3-kchamart@redhat.com>
 <87sepgtp3e.wl-maz@kernel.org> <Z44R-cUz9CWMp5Gi@gezellig>
 <CAFEAcA9arxn3FLRYS4ObD=iRkX-idgCosZkoqknqTkQwYn0uTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9arxn3FLRYS4ObD=iRkX-idgCosZkoqknqTkQwYn0uTA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: J2yLbfNzTIhb

On Mon, Jan 27, 2025 at 01:06:44PM +0000, Peter Maydell wrote:
> On Mon, 20 Jan 2025 at 09:06, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> >
> > On Sat, Jan 18, 2025 at 10:04:37AM +0000, Marc Zyngier wrote:
> > > On Fri, 17 Jan 2025 19:11:06 +0000,
> > > Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > > > +PAuth (Pointer Authentication) is a security feature in software that
> > > > +was introduced in Armv8.3-A and Armv9.0-A.  It aims to protect against
> > >
> > > nit: given that ARMv9.0 is congruent to ARMv8.5 and therefore has all
> > > the ARMv8.5 features, mentioning ARMv8.3 should be enough (but I don't
> > > feel strongly about this). I feel much strongly about the use of
> > > capital letters, but I live in a distant past... ;-)
> >
> > Sure, I can keep it to just v8.3.
> >
> > On capitalization, I don't feel strongly about it, I just followed this
> > commit[1], which explained that the rebranding changed "ARM" to "Arm":
> >
> >     6fe6d6c9a95 (docs: Be consistent about capitalization of 'Arm',
> >     2020-03-09)
> >
> > That's why I went with it.  I see you know this by your "distant past"
> > remark :)  To match the above, I'll keep the capitalization to "Arm".
> 
> We should probably do another fix-capitalization pass on docs/,
> because a bunch more "ARM" uses have crept in since 6fe6d6c9a95.

I can tack it to v2 of this.  I see about 22 occurrences in docs/:

    $> git grep "ARM " | wc -l
    22

> (6fe6d6c9a95's commit message says that architecture names like
> "ARMv8" retain all-caps, but I think that was my personal taste
> creeping in -- at any rate the current Arm ARM uses "Armv8",
> "Armv9", etc. It was right that "ARM926" etc should stay all-caps,
> though.)

Okay, so, architecture names should stick to "Armv8", etc.  (I too
would have preferred "ARMv8", but whatever the branding says.)

For all-caps: I assume you mean these should remain as-is: ARM926EJ-S,
ARM1176JZS, ARM1176, etc.

-- 
/kashyap

