Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18787606A31E
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Nov 2026 20:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=guk1Kuu2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWJbk-0004xa-EN; Wed, 25 Nov 2026 15:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWJbj-0004wS-1b
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 15:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWJbh-0007OJ-9U
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 15:28:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795638523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/u1HPvpYaXUfrMG1QI92Km4RL67LsmGRRjh2a17tnuQ=;
 b=guk1Kuu29duU1bgGSDJbH121d2wOOz1D2LxXlpRtasFLiLUvVZ/5UVOo3FspRB0sHVmAkx
 6Rhy/ItsgCHDgZUEASKcaWhnUGGtB76cSLm7kYgezOSk2TKRiWYlWtiz2J8VxxBZ+bUgn+
 ioeLxMt/rR8HyBA4nWHpTTIH8DuL/yc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-g0VG6hpWOIiRAXngFmk20w-1; Wed, 25 Nov 2026 20:28:41 +0000
X-MC-Unique: g0VG6hpWOIiRAXngFmk20w-1
X-Mimecast-MFC-AGG-ID: g0VG6hpWOIiRAXngFmk20w_1795638521
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso703175285a.2
 for <qemu-arm@nongnu.org>; Wed, 25 Nov 2026 12:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795638521; x=1796243321;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/u1HPvpYaXUfrMG1QI92Km4RL67LsmGRRjh2a17tnuQ=;
 b=D1ldxKCXh+mgkHzCGj+q4yi0Z+bOUVQKKRbZTQaMG/RxWcPkZ12s3DXVpWjPPG+L7b
 vAX+kqpKw+qAKCwkp0ju6+di7vF1+Ry/Lpp+Ltjtf9KA9cR4Lpv+anQ8Ut/320JdmEFD
 P+JA2C7QkvxeJ2Vu0mc5hy+pH8IrIE7d0rngHCYFIwcbzfc6gSOSrs573JfpiKwghnxR
 fnE0edq+GD4CoI2mL07md5onZp0Pss0WaYExAMKi1/lybhUOR21Vx0n4VtnDQbPom1vp
 4lmRyEWJGqeMWuG0mj0wEdHyPYzvum0Oa4a+aMVDnXgb3Tp1yhlc2JsxK6Nvu12A10bb
 g43Q==
X-Forwarded-Encrypted: i=1;
 AL+hErG6myIT6kiO9MBoEAKy01hF1B8Iqtceu+aMzPBEgLxCUlnMiLVlp7MThbPNvYferCGjWfH7K5oOpA==@nongnu.org
X-Gm-Message-State: APuU4Z9lA+mlZJQB60zICVM3P0EJjkyyFtVhWc5tfiiUvQSePedpOXfk
 3jOFejRPdsMRFO1PiRtevns/+DoZG9Jym+RDWIDcd0bWoT/CToyL6uyaIUVEEGKOXEoCCncYi0+
 2Ky2Tx/oVb0l/fDzC9jwtgHqApGapV4Z9tBvoRbrGHFlbolccRCnlMQ==
X-Gm-Gg: AZFdTZeZZ8zR+wOzMqnsEr1BJGY0kNJxNhmj37VoJCNH+gnp/KgwORodcW4kgsJuucf
 N4MB6xPI+OmG1WuvxbLLj2AVP4DSptS5Z8p3M8psWwk6s0lrUJ+3aimMpGIRRcJDxBfvmWgIZUI
 XiMQ1M5ShlqHskBWKRQFqHaGyrG5KxpKcSRASaVI2T1oywkHyp75dkmNKWkSeGv6Xs6gfPob0ho
 xSeLmN+P2ybGLkAyB+lv2P5JnqyE9S+46V3n2X6txAIsVwerTRortEzh89aPF4e0gcqbWQ1viCY
 1R1S6K0HsOOoU8gzZmDhTGK3Li263hXmTtFxNOFL8SfkvZrsbjccLSQimKNyNFrLlkAkUHk1bgC
 0xfof0lHW9noXW9qqXCi19FAU0VTiVSjPr8MHolrCIgj9
X-Received: by 2002:a05:620a:538e:10b0:94a:8bf:19bb with SMTP id
 af79cd13be357-94a08bf1c54mr340991085a.33.1795638521025; 
 Wed, 25 Nov 2026 12:28:41 -0800 (PST)
X-Received: by 2002:a05:620a:538e:10b0:94a:8bf:19bb with SMTP id
 af79cd13be357-94a08bf1c54mr340988685a.33.1795638520452; 
 Wed, 25 Nov 2026 12:28:40 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb3ba04bsm1423731085a.24.2026.11.25.12.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 12:28:39 -0800 (PST)
Date: Wed, 25 Nov 2026 15:28:38 -0500
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-12.0 2/6] hw/gpio/zaurus: Move VMSTATE_VALIDATE()
 check into post_load_errp()
Message-ID: <awdE9g3mio3cXNct@zhexu-thinkpadt14gen5.rmtcaon.csb>
References: <20261120124923.1656220-1-peterx@redhat.com>
 <20261120124923.1656220-3-peterx@redhat.com>
 <CAFEAcA8i1-QX-x+fvcfEMknia1owTAukRxNQ1Rb0H6KnwCKt2w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8i1-QX-x+fvcfEMknia1owTAukRxNQ1Rb0H6KnwCKt2w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H5gB8ejVdH77sbiwBk8-6IOYI-0LBOvnWpi7zklPU20_1795638521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 12:21:37PM +0000, Peter Maydell wrote:
> > -static int scoop_post_load(void *opaque, int version_id)
> > +static bool vmstate_scoop_validate(ScoopInfo *s)
> > +{
> > +    return !(s->prev_level & 0xffff0000) &&
> > +        !(s->gpio_level & 0xffff0000) &&
> > +        !(s->gpio_dir & 0xffff0000);
> > +}
> > +
> > +static bool scoop_post_load(void *opaque, int version_id, Error **errp)
> >  {
> >      ScoopInfo *s = (ScoopInfo *) opaque;
> >      int i;
> >      uint32_t level;
> >
> > +    if (!vmstate_scoop_validate(s)) {
> > +        error_setg(errp, "irq levels are not 16-bits");
> > +        return false;
> > +    }
> 
> I would put the condition inline rather than into a function
> (especially since the function name is not very informative).
> Otherwise this looks good to me.

Will do.

-- 
Peter Xu


