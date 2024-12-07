Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1545147njb;
        Sat, 7 Dec 2024 07:16:49 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUgx+TyRaIkpfiIuNivxSHVxyc+Pi0ckGVOlN/dj0e6fc5scnQagPxYFJmu7KHWJVltBjY+Ikeeo6+dAw==@linaro.org
X-Google-Smtp-Source: AGHT+IHiTGO1U0rfiqwFcuGWObhb+ImG2Q/yme6v2RTDH+BMpU2GiS2TFu1VWl7kRREkUUG277fg
X-Received: by 2002:a05:6a20:748b:b0:1db:f823:109f with SMTP id adf61e73a8af0-1e1871411a4mr10044761637.31.1733584609290;
        Sat, 07 Dec 2024 07:16:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733584609; cv=pass;
        d=google.com; s=arc-20240605;
        b=Z53gh9tPtM2yenqPoAZelUtkU/ROKlg7cCwBlheCty91RcsVO+981pk+umJMmrDuoq
         MBCEN3A7Yf2MEJngzqBlXyENQ3qxDaE/F6DtQCVp7S42Hjse5IKeYChlElFvMPaPdtnT
         us6ZHIxrYtsNIr9J290HlW4ukwnbCdP+faNlLHeISQOirzRf7TA/fAENS/lIyTh6qce0
         a3fmYRqsxPQNI1Qj9Kpb/SYmoWHw0wKU5bc9av6GozB9RYGgERGqiLBH0+Oh8zTetTAs
         CwB+6bk8Et5zdb1uAVG6ODSRshea4T5+n8ajlQ5XWxADBsa1duBwt9dDjeTRMhFYWCFZ
         woqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=buWahY26YGerNzLHfmySJVio+/sH3JcpVBTbZ+QbVEk=;
        fh=uxHioqEUqBL3oUDNx5RhEUKm8ptwP2YP8izOgeOmChA=;
        b=E7ZH+UzfDD/+FiLL2wTEfRtJD14h3GCdESU5ootWEUjr6rDnu0hTglr/MDszZbqHZp
         OHIcFUhQRBqCYT2CT2gK9RKzEgAYSu8+9ldp6ii5rMFkohkt80v12uYTiZpkAFIvWUVi
         bTHYaYXf3wHaTv+EpTLbnxSPf79NU8RcELtV+KnVJvLdDKMBYFqRWeHSn4EPnEJcLcTx
         k1MrU/MFSMxDylnTL5IbWuI8wZ9fv5yKHBiY8YG+jjE8fav0F29Sbc3qxQgTnEZb876r
         MwoplnpqC2mN3xBcOJQ2fr3ggLFxg6LeW9++h2df/IwOaCJQxeZAVZ5T69fHHohMYtRi
         KiWg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELaWexY8;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-436043-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-436043-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-436043-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fd3e2ad1absi1252509a12.692.2024.12.07.07.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 07:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-436043-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELaWexY8;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-436043-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-436043-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC39281462
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 15:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA911CA81;
	Sat,  7 Dec 2024 15:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELaWexY8"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA422C6C5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733584606; cv=none; b=LXfm8YDHkk8xUtePReXC3r/ZQ2W1y9AY2RuiCg1QDfcPv5uWd2+hUgO5FUVCmcYo7BxoDnZDRNu5wdcAic8TTNgtsMvWziS282/rTwqdQVYRiY6889MEzWrVAzYBcB30E2bkoAmdN3eQMDjQ4b8vvdoo8f8ITskOsWFvu+mPwAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733584606; c=relaxed/simple;
	bh=x/KMFEIVqax4T/aG/WHn7WGXnsRDVrcyjhCbfHSeBIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IeTzgIb3TEy4NXZfX0Mxf9MSKDELYS+O0cj8z++X4KTM8HXv9imHnBM+if9EH864VxyCbYwrmHA5XVik+ufyLKQT1gruI70+NgJs8S47niJIVDGJr8H+GpmV6zYPfIPKMqDP5EMCGE0EVShGLy378ZM6p/it7pxpq8r6amQpX8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ELaWexY8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733584602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=buWahY26YGerNzLHfmySJVio+/sH3JcpVBTbZ+QbVEk=;
	b=ELaWexY84OBo85+luZcmNmQxRslQ7UPTLd6QvkRNDyOgzOnyGhJPEOvsdZToyi3pXc7wbC
	MtT3qLLpFGJnhtb4O+/+XvSjuQ5tcmttJoS7lgVbCfubXujkd+DWQ9TO48P0N/QsTm/0dL
	nZR3h9TB7/OuGnA8QSvzSV6RHHyMdSI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-396-ra82krBVOB2rHcR1JLV2jA-1; Sat,
 07 Dec 2024 10:16:39 -0500
X-MC-Unique: ra82krBVOB2rHcR1JLV2jA-1
X-Mimecast-MFC-AGG-ID: ra82krBVOB2rHcR1JLV2jA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8843919560AA;
	Sat,  7 Dec 2024 15:16:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.102])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F31C31955F3E;
	Sat,  7 Dec 2024 15:16:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A692321E66D2; Sat,  7 Dec 2024 16:16:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Shiju Jose <shiju.jose@huawei.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Ani Sinha
 <anisinha@redhat.com>,  Cleber Rosa <crosa@redhat.com>,  Dongjiu Geng
 <gengdongjiu1@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,  Eric
 Blake <eblake@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,  John
 Snow <jsnow@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Michael Roth <michael.roth@amd.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Shannon
 Zhao <shannon.zhaosl@gmail.com>,  Yanan Wang <wangyanan55@huawei.com>,
  Zhao Liu <zhao1.liu@intel.com>,  kvm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org
Subject: Re: [PATCH 00/31] Prepare GHES driver to support error injection
In-Reply-To: <20241207093922.1efa02ec@foz.lan> (Mauro Carvalho Chehab's
	message of "Sat, 7 Dec 2024 09:39:22 +0100")
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
	<87frn03tun.fsf@pond.sub.org> <87wmgc2f48.fsf@pond.sub.org>
	<20241207093922.1efa02ec@foz.lan>
Date: Sat, 07 Dec 2024 16:16:31 +0100
Message-ID: <87o71no75c.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: 5vj3vKH7QtyC

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

[...]

>> However, it doesn't apply for me.  What's your base?
>
> That's weird. Despite my mistake, the series is based on v9.2.0-rc3 
> (which was identical to master last time I rebased).

Either something conflicting got committed meanwhile, or I screwed up
somehow.

> Should it be based against some other branch?

No, master is fine.

