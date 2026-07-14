Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF837C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 08:38:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjYeg-0004gu-Eu; Tue, 14 Jul 2026 04:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wjYee-0004gX-Er
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 04:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wjYec-0001M9-N6
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 04:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784018294;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ne+B6Gy/OP98g/53VTcx8OIF3eNL02QkX0kEyO/08SM=;
 b=KAfuxkvpKE4uiNUA4DIreRDR/qIBqCXceWZ/64hEp48WjJ6KGoc+Ho+JrKs1/d/oRdTogK
 woYP2JqLDHoWObjjYYFAsPjUBLKmdJAnJNsJWTsjMVeb8UW9+1d3UUhsuMA/ZvV+tjVqpF
 UdYCUecC3HnPWQStlpo5XOEPTkSIxj4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-412-aeWxQyIbN8GmYsHNTf1uig-1; Tue,
 14 Jul 2026 04:38:10 -0400
X-MC-Unique: aeWxQyIbN8GmYsHNTf1uig-1
X-Mimecast-MFC-AGG-ID: aeWxQyIbN8GmYsHNTf1uig_1784018288
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F186119560AB; Tue, 14 Jul 2026 08:38:06 +0000 (UTC)
Received: from redhat.com (unknown [10.44.33.163])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A77DC1956087; Tue, 14 Jul 2026 08:38:01 +0000 (UTC)
Date: Tue, 14 Jul 2026 09:37:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v1 08/15] crypto/cipher: Add setaad/gettag for AEAD modes
Message-ID: <alX1Zq8v8pI_hwCq@redhat.com>
References: <20260714072900.3023742-1-jamin_lin@aspeedtech.com>
 <20260714072900.3023742-9-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
In-Reply-To: <20260714072900.3023742-9-jamin_lin@aspeedtech.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: RouG30KvdyuDKCxnLkjWlgs4VWdsMijevufUVwmTdUI_1784018288
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=170.10.133.124;
 envelope-from=berrange@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Jul 14, 2026 at 07:29:13AM +0000, Jamin Lin wrote:
> AEAD modes such as GCM authenticate optional associated data (AAD) and
> produce an authentication tag, which the block-cipher encrypt/decrypt
> interface cannot express. Add qcrypto_cipher_setaad() and
> qcrypto_cipher_gettag() plus the matching backend driver hooks. The
> generic front-end reports an error when the selected mode's driver does
> not implement them, so calling them on a non-AEAD mode fails cleanly.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  crypto/cipherpriv.h     |  8 ++++++++
>  include/crypto/cipher.h | 36 ++++++++++++++++++++++++++++++++++++
>  crypto/cipher.c         | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 75 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


