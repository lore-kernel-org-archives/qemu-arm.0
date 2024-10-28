Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1572883njf;
        Mon, 28 Oct 2024 09:01:06 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXXADhVw3DZqkJsit0chuT6NdH8iH4DAMPPM17Da52SU//mCRNa4hDiiGzpzXfsjFb2ly0uPA9mCQ+s6w==@linaro.org
X-Google-Smtp-Source: AGHT+IHzXIVNCdU4ggIhLLZnEx1IjuB48QiHmHiNS1g66BbZU1CnBFSUFN0GzkagE2uv1US8XVru
X-Received: by 2002:a05:6214:5407:b0:6cb:7e7a:ae87 with SMTP id 6a1803df08f44-6d18581771fmr150839936d6.33.1730131265917;
        Mon, 28 Oct 2024 09:01:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1730131265; cv=pass;
        d=google.com; s=arc-20240605;
        b=jlp7iJSx+MNpZJYy+AZdtl48B2hzYMGwMMERzXeg86zA61o8BJx3ruik8umRal7LqD
         jStm0nznz78RX1pHfPi+EVONoukrVo0TWUxEQpBL60qY+G7fGRdGCsUnVB1j7AgBSxPb
         MD3Kvabm127WAa5QqF0Axteno1+QRVJ7lnLAZYqmNN0AalUI3gak6lBUSDJrKf0W4Fg7
         fspOdE182Eyr75bsFgXVZypHb6DeUEOFhxp3v33pg1KeW3st/37sB+jxGOCY66Q445Tc
         8Wzcer0qfTpAwpr/2zJ4tAICvevgUldPSg4ulgTun9xUjGLviggd4d7bWK3FbD42/GG2
         oSDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=P9xxfVBBFS3vGf2amIpYTb6y6yA1Jac+htCBbXKyA58=;
        fh=ilEMv6/yY9WvStvLMAzrXhwdU5K3op49f3IZdXpv0Bc=;
        b=W+k66qRXrt+pW87pAsg90SYpFlyq2kxWhAut1lWg7p/yDk/HcVKcqQpDzkSIE8Uvcz
         E5yiOhjZYfx8pKDjfZJQ04Ogdg5wmlL9Bs96/iYXIcNrMoZjHv6U5XTG7w+jjg3wgixx
         2NZnj9RkLa3gyjZnvbvKIK8X28HCRhuv6jqWzKLFnYMfkbf7IQ+H2VDP/KgKcFae/Iy/
         WA85yzWgLI8IUTqigPgkJpNZI+ka5GDPNGo13m47BXDOcalx4QqHEAgT/thlBvI/8zo6
         PmRiXd1jv+4ZQOtVzM+xeJy+nskqyErtO9H/eyiyV0HA/WzGNSKtc464lyjmzASWHGmq
         J50Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fM+xSrXM;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvmarm+bounces-16972-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvmarm+bounces-16972-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm+bounces-16972-alex.bennee=linaro.org@lists.linux.dev>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d17986ea80si87937576d6.66.2024.10.28.09.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm+bounces-16972-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fM+xSrXM;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvmarm+bounces-16972-alex.bennee=linaro.org@lists.linux.dev designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvmarm+bounces-16972-alex.bennee=linaro.org@lists.linux.dev";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 958E71C21E38
	for <alex.bennee@linaro.org>; Mon, 28 Oct 2024 16:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D829B1D79A6;
	Mon, 28 Oct 2024 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fM+xSrXM"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C15188917
	for <kvmarm@lists.linux.dev>; Mon, 28 Oct 2024 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131262; cv=none; b=RiT/rWFqh+aebSfzVrhki71kqQ79KHCpDVSoeIeADsFeDvuAVdv+mdFxZ5lo7vmq5blGEk/d65XsUOgeKhJG78KFvODw4HNb+EbyMnQGvF9FdcV0AfAUIyFgHDaHlTPUwtVIvt77CfMlzjshEcgkGUxeDsb5Q5s22sClQCP2KT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131262; c=relaxed/simple;
	bh=rKMt39/IMn9ntx86rLiJJxC2lha3ViI6YIHGMus7n4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=slt9oXOjEDKanEj866v735akKGMJjC4MghKFB2pvQuAkD3za7xcLYFKHCIXwfzZscgtwXPpP64udzlGlCg9K7akpt3lxfxfTPWYVtQWoGmffuTepFzCWH6gw1juNTwao0aX00z7dOmV2otV4wGt+zgonOQiv2FDhrmmXdNj2xus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fM+xSrXM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730131258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9xxfVBBFS3vGf2amIpYTb6y6yA1Jac+htCBbXKyA58=;
	b=fM+xSrXMwBnMcongAh9DYFPeFLJa8eP0o18grrBad/VoemTwkN0XoDQMHvwH5yJy1R7Amr
	TtSBgZzRWi8EpTrCRSg8gp8oTZxmDC7VaGXilVjSWeQdvKgmLE2DtakmkU73Fe26cl99Va
	HlSE5LnQG8qkD/ZQdm6vi5NWfdyDPkI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-UW8mt4UnNCKclBnsbgKa7A-1; Mon,
 28 Oct 2024 12:00:55 -0400
X-MC-Unique: UW8mt4UnNCKclBnsbgKa7A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 62DD3195608C;
	Mon, 28 Oct 2024 16:00:52 +0000 (UTC)
Received: from localhost (unknown [10.22.88.106])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E70AC19560AA;
	Mon, 28 Oct 2024 16:00:49 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eric Auger
 <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
In-Reply-To: <Zxub7ol4p8P_sWF8@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 28 Oct 2024 17:00:46 +0100
Message-ID: <871q00p68h.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: kvmarm@lists.linux.dev
List-Id: <kvmarm.lists.linux.dev>
List-Subscribe: <mailto:kvmarm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kvmarm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 5v9vfb+h/iWL

On Fri, Oct 25 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
>> Hi Daniel,
>>=20
>> On 10/25/24 15:06, Daniel P. Berrang=C3=A9 wrote:
>> > On Fri, Oct 25, 2024 at 12:17:37PM +0200, Eric Auger wrote:
>> >> At the moment, the custom model does not support legacy options
>> >> of the host cpu model. We need to understand what we do with those
>> >> latter (SVE, ...). This means that related KVM ioctl are
>> >> not called yet.
>> > It will be pretty painful to have to use different feature
>> > terminology for different CPU models. Everything in libvirt
>> > assuming feature terminology varies per-arch, not per-CPU
>> > model.
>> Actually as far as I understand those regids/fields would fit all kind
>> of aarch64 Cortex-A CPUs. So they wouldn't vary per-CPU (I mean their
>> terminology. Their availability will).
>
> What I mean is can we define  named models for various different
> vendor's Cortex-A silicon and just use that without needing to
> toggle features, except in rare cases.

I'm not sure whether creating named models for various cpus would
actually scale; what we probably could do is come up with some Armv8.6,
Armv8.7, ... models and have additional models for some well-known cpus.
That would also give us some basic sanity checks for feature
combinations, if we do not want to support completely custom
frankencpus.

