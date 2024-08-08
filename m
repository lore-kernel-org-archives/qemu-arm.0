Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp504842njc;
        Thu, 8 Aug 2024 06:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU3dMi9+VXKARokvcfjVzRqx7tClrMX9Z2ZfW7BSXvcN1QMxgwwuXiNoWvNlt7BB49CHpxk2ptDc2ko4rpo4eeroj0k5qqw
X-Google-Smtp-Source: AGHT+IGC92The/0pBwwM6sM29AOLNRkbaRgjQJBLJn7bX58mWOOVERgk6v6CixRzsBV2eWmrwyQP
X-Received: by 2002:a05:6a21:601:b0:1c4:985a:acc4 with SMTP id adf61e73a8af0-1c6fcf72ebdmr1759908637.46.1723123401354;
        Thu, 08 Aug 2024 06:23:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723123401; cv=pass;
        d=google.com; s=arc-20160816;
        b=oc12HeFZPNn3JXNeVfslo5Lv3Xpr1LFuiih4DaqLmDVfdHuZAp6/2AFMG4x91D5bWj
         VG4EWcqRGW5UvZYRRjiUS2stmKK2bw1sMgIdrvd+NythpjwZ7m+P5FxUpb45Z1Su/SDg
         +Y5np6E2yvuH2F9kd4AZqFXmvsieHpjSTb1vcD0t+hnC7EfbGhtE4WLXw3Sf8ez52Lck
         teWjEojU+EFdGtT6rX8TJSiYBEoBMbpMAPewLEqLKG1ygR+wisSaFNSvjZF6Vx79WguJ
         1z5cB0oFFuIALRXzD1r9L84yrNWEbFzbCaNYKevZIDCCLbt5zinTWN3H3xv2mMmCDS7y
         Mxsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=PgOyHGQ4CrwHKV+wYDltQrPczjgYpAzB626tRdkvhBI=;
        fh=OUqmBig6VzsEN5C8sADN5kVx3iZh5BlPpVA4ByD8Vn0=;
        b=GfcfOh+az/x4098OUKMqLKeNGRo13vGPdoEcoqK4kSg45UXRVX53scDJui8Qb2H2DF
         iCa9m4La024ShduoIxLhfgOBqMYHBDv/Dnd9fI1MLtMOg+Hnt/NPSZoWUVn+7Njey5t9
         GqTjA8onA4LtgHn6H0+1bb6ew27yyPmqsOnAl0Kb8D3nINMjROQCjC6GXhu0rfpAk9Wk
         oFrmoOKqh66fy7RZKtCiF7O+vR0ZjrbM3jDQRvDfVeQfHundzlle9oWU6jmZan9DAWQu
         TTHaEXaiNSx534ldWzzqw3hh4QrKb8s2thiyHkzXi063kbod3W5gVhuufA30wXiYLUUj
         RQfA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RL8y9pW0;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-279524-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-279524-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-279524-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7c109f9b474si3528068a12.584.2024.08.08.06.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 06:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-279524-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RL8y9pW0;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-279524-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-279524-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F72EB22586
	for <alex.bennee@linaro.org>; Thu,  8 Aug 2024 13:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3297118C341;
	Thu,  8 Aug 2024 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RL8y9pW0"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837184A33
	for <linux-kernel@vger.kernel.org>; Thu,  8 Aug 2024 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723123395; cv=none; b=CuG1ORd7paALJD8HB/YfWLh7xdCYgldwlfOuQ6NXNs7yFGD2FIy/Ag/PNSmDPe7QfuJibYMQb0Ab/8NREkmnBFW75npBbMHPnHVRzQil0qq5JGRTjXfXaKf8yvhBdNSsRNN1/NHegoOKkxFTSyzx1B+QIXtbaSCtUC6E+lJfnEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723123395; c=relaxed/simple;
	bh=Ga/j1peT2iZzkdrMHAG94s/1f8x1frt+OvK0hcQXDkU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y6SAGDcjywpqJBGsRyyFgTVK2jm/sn5lLCPWwCi2ZLRGoQAi5KzzXf4AdU7s4tPZTMhb8MXUAFwabLqUvAGhgMe66fi53HvzMhuon6G54lGtnaj04HYpOiu0g1CJ+X2j8DSkHpLnSDVR/f9vyOzUdG7JvX0VFef5XnXbsGWAYeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RL8y9pW0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723123392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PgOyHGQ4CrwHKV+wYDltQrPczjgYpAzB626tRdkvhBI=;
	b=RL8y9pW0PDO0b2CLaGrVY0UHEhAJQlU221iREXxN5QpO0+kuqsyTnCsZlBK3n34i7O80lh
	CXhiig8WveKQZxwVIsXuXY4GXSKbdjwXrFZv47kyLI4PUXlU1Re6mMPanydvh8pHp1+RCW
	rqdZml6dm63xTK7s4WCsaCdVvIAni/k=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-8-pePM0XxiO06RCsVLH9Hw2A-1; Thu,
 08 Aug 2024 09:23:09 -0400
X-MC-Unique: pePM0XxiO06RCsVLH9Hw2A-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D7484194510F;
	Thu,  8 Aug 2024 13:23:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 370FB300018D;
	Thu,  8 Aug 2024 13:23:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D4FDD21E6682; Thu,  8 Aug 2024 15:23:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,  Shiju Jose
 <shiju.jose@huawei.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Ani
 Sinha <anisinha@redhat.com>,  Dongjiu Geng <gengdongjiu1@gmail.com>,  Eric
 Blake <eblake@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  linux-kernel@vger.kernel.org,
  qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v6 04/10] qapi/ghes-cper: add an interface to do generic
 CPER error injection
In-Reply-To: <87799362699e4349ce4a44f3d25698d5764735c6.1723119423.git.mchehab+huawei@kernel.org>
	(Mauro Carvalho Chehab's message of "Thu, 8 Aug 2024 14:26:30 +0200")
References: <cover.1723119423.git.mchehab+huawei@kernel.org>
	<87799362699e4349ce4a44f3d25698d5764735c6.1723119423.git.mchehab+huawei@kernel.org>
Date: Thu, 08 Aug 2024 15:23:04 +0200
Message-ID: <87a5hnup1j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: z1U+fuKflXUF

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Creates a QMP command to be used for generic ACPI APEI hardware error
> injection (HEST) via GHESv2.
>
> The actual GHES code will be added at the followup patch.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

My review of v5 still applies.  Messages crossed, I suppose.

