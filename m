Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB2C108E1F9
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 11:55:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3By9-0002kL-6c; Thu, 19 Mar 2026 07:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1w3By7-0002jo-V8
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 07:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1w3By6-0002PT-H7
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 07:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773921313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cghQw2wZlYWTnUyhIggiIgbgwEbKW06jE0Cc1GCWpzA=;
 b=g82BgF6jQoTftYyYcYBHnVzegzJ/uIsRsse4XzCGuBBVI6QJcxczJYO1FxCDdEddsZQK5e
 w7lvwsIEfzreqLKTXcUlfewXz5nxfh+R4TkTLNKL48zYrSNgCxcLOo6mTKdqjbLmITmn6/
 vwptpO7ZlH8r4ALIJOl8qgCiXHFgQkM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-yhNzkXyxOOiuNylzPeZOqA-1; Thu,
 19 Mar 2026 07:55:09 -0400
X-MC-Unique: yhNzkXyxOOiuNylzPeZOqA-1
X-Mimecast-MFC-AGG-ID: yhNzkXyxOOiuNylzPeZOqA_1773921307
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AA2471944F05; Thu, 19 Mar 2026 11:55:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.6])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 45D211955F21; Thu, 19 Mar 2026 11:55:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D6E0521E6937; Thu, 19 Mar 2026 12:55:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Nathan Chen <nathanc@nvidia.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Eric Auger
 <eric.auger@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,  Igor Mammedov
 <imammedo@redhat.com>,  Ani Sinha <anisinha@redhat.com>,  Shannon Zhao
 <shannon.zhaosl@gmail.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel
 P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eric Blake
 <eblake@redhat.com>, Shameer Kolothum <skolothumtho@nvidia.com>,  Matt Ochs
 <mochs@nvidia.com>,  Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v4 3/8] hw/arm/smmuv3-accel: Change RIL property to
 OnOffAuto
In-Reply-To: <20260318184907.4060030-4-nathanc@nvidia.com> (Nathan Chen's
 message of "Wed, 18 Mar 2026 11:49:02 -0700")
References: <20260318184907.4060030-1-nathanc@nvidia.com>
 <20260318184907.4060030-4-nathanc@nvidia.com>
Date: Thu, 19 Mar 2026 12:55:04 +0100
Message-ID: <87se9w9gpz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 5IyUu0RxQqoaWp0r7om-_ticPBobvBH03J4Mw2V_-2c_1773921307
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Nathan Chen <nathanc@nvidia.com> writes:

> From: Nathan Chen <nathanc@nvidia.com>
>
> Change accel SMMUv3 RIL property from bool to OnOffAuto. The 'auto'

Incompatible change; okay because property "ril" is new in this release.
Spelling such things out in the commit message helps reviewers.  Not
worth a respin.

> value is not implemented, as this commit is meant to set the property
> to the correct type and avoid breaking JSON/QMP when the auto mode is
> introduced. A future patch will implement resolution of the 'auto'
> value to match the host SMMUv3 RIL support.
>
> Fixes: bd715ff5bda9 ("hw/arm/smmuv3-accel: Add a property to specify RIL support")
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>

Acked-by: Markus Armbruster <armbru@redhat.com>


