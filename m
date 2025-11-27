Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE1DD11183
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Nov 2025 08:15:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOX9L-0006Sh-Qx; Thu, 27 Nov 2025 03:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1vOX9E-0006RB-L4
 for qemu-arm@nongnu.org; Thu, 27 Nov 2025 03:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1vOX9D-0006NR-5r
 for qemu-arm@nongnu.org; Thu, 27 Nov 2025 03:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764231278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=la5j1am4DhgKAfJUqq7ic9NEmCDb2TkpNGKbThvmjjg=;
 b=f68fqcRI8cYRsnoN0Xk+pCqNtcNZl/K5AGr++xSCmmqo9i7dAV9jT6H+zmeir7lsE4qX/O
 djr1Ex6WpAfQ+7NOF67d+Ctm2AnOAzGKl4eOL7SZU2erFZB/cl/TFpGOcW94lytuDmNmhW
 1wrMP4uMw3AjSSeKzPWdhB4xj+qywa8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-mP5RHACFP0mFmMe1mVzoMg-1; Thu,
 27 Nov 2025 03:14:35 -0500
X-MC-Unique: mP5RHACFP0mFmMe1mVzoMg-1
X-Mimecast-MFC-AGG-ID: mP5RHACFP0mFmMe1mVzoMg_1764231274
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AC73C180034D; Thu, 27 Nov 2025 08:14:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.7])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2E47418002AC; Thu, 27 Nov 2025 08:14:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 805F221E6A27; Thu, 27 Nov 2025 09:14:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com,  mst@redhat.com,  imammedo@redhat.com,
 anisinha@redhat.com,  gengdongjiu1@gmail.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  shan.gavin@gmail.com
Subject: Re: [PATCH 5/5] acpi/ghes: Use error_fatal in
 acpi_ghes_memory_errors()
In-Reply-To: <20251127004435.2098335-6-gshan@redhat.com> (Gavin Shan's message
 of "Thu, 27 Nov 2025 10:44:35 +1000")
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251127004435.2098335-6-gshan@redhat.com>
Date: Thu, 27 Nov 2025 09:14:30 +0100
Message-ID: <87o6on7uzd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Gavin Shan <gshan@redhat.com> writes:

> Use error_fatal in acpi_ghes_memory_errors() so that the caller needn't
> explicitly call exit(). The return value of acpi_ghes_memory_errors()
> and ghes_record_cper_errors() is changed to 'bool' indicating an error
> has been raised, to be compatible with what's documented in error.h.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

I figure I would've split this for easier review, say 1. return bool,
2. convert acpi_ghes_memory_errors to Error.  Since you already got
review, it's probably not worthwhile now.  Next time :)


