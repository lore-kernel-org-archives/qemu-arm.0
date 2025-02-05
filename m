Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp732452njb;
        Wed, 5 Feb 2025 00:12:40 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXhiaBy5Uecm5qNo3ZS8yCuVhLxA+O15sFtuUqPt8hOnFKY6mkyyOhY8qDcT9czlebt+wFw5QUdaJuVwA==@linaro.org
X-Google-Smtp-Source: AGHT+IH2wdhSxV7yCq28UA+3UVMp3zmhGNXJX/UuEogsrOuuq4EnDflBsggzKl5cKTZu/OOeCVGN
X-Received: by 2002:a17:90b:2fcf:b0:2ea:9ccb:d1f4 with SMTP id 98e67ed59e1d1-2f9e06a1197mr3799760a91.0.1738743159854;
        Wed, 05 Feb 2025 00:12:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738743159; cv=pass;
        d=google.com; s=arc-20240605;
        b=ShO3CWIacCUPgL+UYmWXMokZxb+kd+adYWNlq54hbcq9g0o8mAmBJVapEE4lkNJKG3
         r+smYECRhcB1xzAd24by2MdlJXbf04R4T9p+AxG6O+Oa+s6UHcoNlhS1pru9MJA1GCmG
         uInqbJLsrw2M2t0bn+BY9WK00f6TmpJVEZMCUKdjrocnXtA2l8J9kSxJkjOMGDAmQ2zz
         m7ejTiiEL7j7MXrOKzhbPFt/kzh1ShG0L07dC7FAinvelffL6rXwMZw8Twl6A2dpJfuf
         1ZjnH3RIU3R2D+uCc/5lLZEvqqGUzacU7tkgUlH53DovyHf7jH8Rnp1kKSlmuj2KEFiM
         l4jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=j23kVFpNyX6LvtTa3q9Kf2XajowD2bCgqlu5fOsbDLs=;
        fh=EE1HQtE6RBfEBX/KWUC8EV/gt3HWtKojFHi46CsNt/w=;
        b=JVZMjp4qIrtTC0OC+MRSYGi6Ao9l5/ra+JO/KGxOmXl0j2COiZVd+hBr1mXRjtQjR+
         Qov857AkY1VasBn5ZmA2Wxf+WcrXK9kMNzpmN7zG+wGOt0W0f9KJlEU/HKFuV8M80a6G
         uVyveeKyDo08mCQ+S4abr6Aa35qEz3awlIeH/3uRAZ5w+LQpaPRz1cN69CORjuzq+dHo
         zmGrmYhgwlllGZZUC1p2TASda8TDug/s9H2SvxNcYewQgSz2rerCHT84qTFdclBJxdUe
         u7cN9wGP/xSFppG4Od+439S5cvnTd7Rp74kOELz8QPgAatRWXnOJSmw4+PdsUih1hOVd
         ZQIg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/6Qoon5";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-499519-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-499519-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-499519-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2f9e1e6587dsi1277705a91.163.2025.02.05.00.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 00:12:39 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-499519-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/6Qoon5";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-499519-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-499519-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 048563A59E9
	for <alex.bennee@linaro.org>; Wed,  5 Feb 2025 08:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5652288C8;
	Wed,  5 Feb 2025 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z/6Qoon5"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6725A649
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743155; cv=none; b=R87ciH/cfNwBvhZFzukYHP7Zs7P53a9fBM/V/dUL4WK8x1f6RD1Kp3ZXrthP/nPGsMKqhbNkHePtsC8GKheqlTjMIXgnc59KZQUOX1CJrWt629cGkTKHbFZP5I1VkcqRS1IumbVBjldr6S+zfKwy+t7Z2dYLN62j6mJTv9tiLnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743155; c=relaxed/simple;
	bh=i0HOt1T9gCqbg0zmyoV1pUWdOs+5cPvJ097wqTVV9ok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ljZZyWKDYMGwSouNdRETDC5J0Txla7Gu44MbmEgik1P7ojujddSKpwQI2YhPlycIDl0coB+TpWJmd+hod6RnuzxArAwxHKhZShfpYWBsfIMeU7S7cJeWgp2zwl5bJsVRO1lsae9T/fbVXWqWUB+iCBBhTsko83KVtoxmiEcqK2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z/6Qoon5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738743151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j23kVFpNyX6LvtTa3q9Kf2XajowD2bCgqlu5fOsbDLs=;
	b=Z/6Qoon5oc4NNbkAmjkpnbuXGZDGyiHOp5dw6kWeUZEDvxlDpCp1Jsr8lrGjntWaMR5XpT
	l+/oYDu9Wxh4azzv77TlT7GJSntsq14MvKIVMisYq8t14bQXR2BRCn6BRcwQoVt0KV3yGy
	ILg0BJn6ejdsRG3IXqdhpyhkbIfBHS0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-b0RYZxQbOsmoxKv2oz3z5w-1; Wed,
 05 Feb 2025 03:12:30 -0500
X-MC-Unique: b0RYZxQbOsmoxKv2oz3z5w-1
X-Mimecast-MFC-AGG-ID: b0RYZxQbOsmoxKv2oz3z5w
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72C031800874;
	Wed,  5 Feb 2025 08:12:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.40])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6727D1800365;
	Wed,  5 Feb 2025 08:12:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1E96021E6A28; Wed, 05 Feb 2025 09:12:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,  "Michael S . Tsirkin"
 <mst@redhat.com>,  Jonathan Cameron <Jonathan.Cameron@huawei.com>,  Shiju
 Jose <shiju.jose@huawei.com>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org,  Ani Sinha <anisinha@redhat.com>,  Dongjiu Geng
 <gengdongjiu1@gmail.com>,  Eric Blake <eblake@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Shannon Zhao
 <shannon.zhaosl@gmail.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/14] qapi/acpi-hest: add an interface to do generic
 CPER error injection
In-Reply-To: <b9f2f49363817ad0440fc355fb4f88648fe5c0ac.1738345063.git.mchehab+huawei@kernel.org>
	(Mauro Carvalho Chehab's message of "Fri, 31 Jan 2025 18:42:54 +0100")
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<b9f2f49363817ad0440fc355fb4f88648fe5c0ac.1738345063.git.mchehab+huawei@kernel.org>
Date: Wed, 05 Feb 2025 09:12:25 +0100
Message-ID: <87frks6c9i.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: AlcYuOCwNBfo

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Creates a QMP command to be used for generic ACPI APEI hardware error
> injection (HEST) via GHESv2, and add support for it for ARM guests.
>
> Error injection uses ACPI_HEST_SRC_ID_QMP source ID to be platform
> independent. This is mapped at arch virt bindings, depending on the
> types supported by QEMU and by the BIOS. So, on ARM, this is supported
> via ACPI_GHES_NOTIFY_GPIO notification type.
>
> This patch is co-authored:
>     - original ghes logic to inject a simple ARM record by Shiju Jose;
>     - generic logic to handle block addresses by Jonathan Cameron;
>     - generic GHESv2 error inject by Mauro Carvalho Chehab;
>
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
> Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Markus Armbruster <armbru@redhat.com>

