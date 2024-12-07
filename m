Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1329263njb;
        Fri, 6 Dec 2024 22:15:39 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUBnFocKoSyH33zhwBha2JWUQentNpha2WG3G4kNKLqZTmZKIycrzG/yTU82rSBRVinbfvkFVI3sSFfag==@linaro.org
X-Google-Smtp-Source: AGHT+IHvHy2jts8rUTI08IwVPmAF1/ZQiKr3kqEtFOXRuW0j1t7QYP3XjY79fh/Xv4St/tcwqhuM
X-Received: by 2002:a05:6402:e81:b0:5d0:cca6:233a with SMTP id 4fb4d7f45d1cf-5d3be6b506bmr6311594a12.10.1733552138992;
        Fri, 06 Dec 2024 22:15:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733552138; cv=pass;
        d=google.com; s=arc-20240605;
        b=Ap86fnTUpGQoljPX7tefFrv8z3WBmwMfgtqDDZpO7VV2jKMWZf1VX+lhOY2Zg7QQjv
         3DzFYGPNF0K2VbYuQTtn7MsPLGO54U+7WYg+yLBkd/NUYW6K/irMsozijUhOgpseJKKG
         TkJv+YQ4u+JWPQgbvkxkKUgIFcF9NNW0w8AtbuWvHAiQ6i5lZQUkEQSyeyfpmqIXZ2am
         AVJMzitiwJnZskkLDWZ55r40QQjaQmO7dCLRITJm4Bm2xf+oNmjaTTftC46JzIfF7V/9
         R85WoM2BDlQMqhC0uMwwOOmW4Eyip0X4S1w4WhYYyf1ZoTJHv8/xxxS2J85lGDaSCr0g
         sNzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=tILUWkOynGcxZLRqxYuvAMRZoJ7id6suG2iETpQQw8E=;
        fh=uxHioqEUqBL3oUDNx5RhEUKm8ptwP2YP8izOgeOmChA=;
        b=O9ds6wfwYRnthiZ6vqt2uGKMHqbMIw5E9oXxxmW94T8Lr7l3+Qs5oiLV4WnMHXNIIM
         rUoUH1Ir4miJp5FiArl0uIzzGS4pEcvjguOKc9EqCfZ3082dOkZO7XTCUHF0SjrJCfNb
         U5ESOoxjWgfieHtqrLBh9NaQnNvWrxBC0Z5EHP4Cf4Q3SXDFrIlbBl0HnSu5jlS27Qwj
         GdJ5W5s4iwPdINHjivxwJpuZDzuOWdDi9wN5imPwrQP1ECWV8/X08JFvulyUb9cCAYX8
         Ois/a2lZpOWqKF/rT3lEGvHRUJTP6gCOFnvWED1HwMS+eS/OVKv3OR0j1Q2vPL9nt6mj
         1b0w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VEOflQP+;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-33242-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-33242-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-33242-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d14b6068bbsi3575627a12.72.2024.12.06.22.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 22:15:38 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-33242-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VEOflQP+;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-33242-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-33242-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF704188502D
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 06:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE495FB8D;
	Sat,  7 Dec 2024 06:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VEOflQP+"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F00A4A1C
	for <kvm@vger.kernel.org>; Sat,  7 Dec 2024 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733552133; cv=none; b=Jrmz7diH5J0BYihIjG9k5v8dy9AoOsCvkdoTjILDiMnNcUNw1coq5tndLL/dehq2TsZUhZ1FlPGiFLTFow8s8+XeapgVgyaTdu1Z7PfAOT/DxEnNJYIJxlE/SqRK2rmBWUeIVM/WdkjayG5KZ0367BuLon4SCu0gu8qFKoclqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733552133; c=relaxed/simple;
	bh=kpg5Ua3RXtqERrM7V2/4bxuOAhBlDv6YWF+SmuSfkeE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NB5t3Glsbim5ysLxGlZitEq5IiecIbvkpkk0e+ai/fP2HkGvH350CtR8VdKmqhY4t0cgi7UNLlGbIbN1etSRcMCr75LAt3l/D/jvXh0gJA9CyTvh0WUK3uubpzmYf2MmEiUrW1yGcWZSRK44PYDEL6RprTMnM9yDfbxiogXPTtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VEOflQP+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733552130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tILUWkOynGcxZLRqxYuvAMRZoJ7id6suG2iETpQQw8E=;
	b=VEOflQP+PaNqL7s+UVD0t0Xt3pYjBweKbo6ptym2VV43+tBW9lXaLufk74WDABq0dvvdVy
	R0JGbMua0rrhP0PHv3m+Z1fnsbQFP004S1jwkGiA19f4sq7odw0hD89puyMp8R/FnM4h5x
	KoUxQPM0lR8WorZBLIVAbmHzmYFVm7E=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-fJJCT3cEO-egzGMfrZ5JHg-1; Sat,
 07 Dec 2024 01:15:26 -0500
X-MC-Unique: fJJCT3cEO-egzGMfrZ5JHg-1
X-Mimecast-MFC-AGG-ID: fJJCT3cEO-egzGMfrZ5JHg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42D6919560B6;
	Sat,  7 Dec 2024 06:15:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.102])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4647A1956095;
	Sat,  7 Dec 2024 06:15:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EABEA21E66D2; Sat,  7 Dec 2024 07:15:19 +0100 (CET)
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
In-Reply-To: <87frn03tun.fsf@pond.sub.org> (Markus Armbruster's message of
	"Sat, 07 Dec 2024 07:11:44 +0100")
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
	<87frn03tun.fsf@pond.sub.org>
Date: Sat, 07 Dec 2024 07:15:19 +0100
Message-ID: <87wmgc2f48.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: vE33RqZK8ubt

Markus Armbruster <armbru@redhat.com> writes:

> This is v10, right?

Scratch that, the cover letter explains: "As agreed duing v10 review,
I'll be splitting the big patch series into separate pull requests,
starting with the cleanup series.  This is the first patch set,
containing only such preparation patches."

However, it doesn't apply for me.  What's your base?

