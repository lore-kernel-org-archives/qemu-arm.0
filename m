Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E93CD6E73
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 14:48:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJYct-0006Z7-Ho; Thu, 13 Nov 2025 09:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1vJYcr-0006X8-Jz
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 09:48:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1vJYcq-000153-83
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 09:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763045316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czhEH/surRP10Id/dnS0llkV+8wr1UPkP3BnkivuW7A=;
 b=ZLlbORoSJAPxUkiQOOZUerOUUtuIliWAX6R2nBtX+NW75AUCAiu3E/11O2hJj15RuwYVXi
 Gk1lb0ZrqBZeE4UBXyXLZH7mihenJa22X4hES9VDnHLrId/2boIBbyWItfsxCaEVnJ1Ol/
 S1rJH0hl32yRU62nPwnKXsZiCFyEREU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-507-DoWDg2dxMw6XYXbiBxvl4A-1; Thu,
 13 Nov 2025 09:48:33 -0500
X-MC-Unique: DoWDg2dxMw6XYXbiBxvl4A-1
X-Mimecast-MFC-AGG-ID: DoWDg2dxMw6XYXbiBxvl4A_1763045310
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 017CC1956096; Thu, 13 Nov 2025 14:48:30 +0000 (UTC)
Received: from localhost (unknown [10.45.226.78])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 15830300018D; Thu, 13 Nov 2025 14:48:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com,
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [RESEND PATCH 1/7] target/arm/machine: Improve traces on
 register mismatch during migration
In-Reply-To: <791e0383-c4c7-49bf-863c-d45428f3e48d@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20251016140039.250111-1-eric.auger@redhat.com>
 <20251016140039.250111-2-eric.auger@redhat.com>
 <877bwtvaj7.fsf@redhat.com>
 <791e0383-c4c7-49bf-863c-d45428f3e48d@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 13 Nov 2025 15:48:24 +0100
Message-ID: <874iqyrnt3.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Nov 13 2025, Eric Auger <eric.auger@redhat.com> wrote:

>>> +    #define MAX_CPREG_VMSTATE_ANOMALIES 10
>>> +    uint64_t cpreg_vmstate_missing_indexes[MAX_CPREG_VMSTATE_ANOMALIES=
];
>>> +    int32_t cpreg_vmstate_missing_indexes_array_len;
>>> +    uint64_t cpreg_vmstate_unexpected_indexes[MAX_CPREG_VMSTATE_ANOMAL=
IES];
>>> +    int32_t cpreg_vmstate_unexpected_indexes_array_len;
>> "indices"?
>
> Originally we had
> =C2=A0=C2=A0 uint64_t *cpreg_vmstate_indexes;
> so I reused the same terminology
>
> As a non native english speaker I don't know if the usage is wrong. I
> thought some references on the net though

Not a native English speaker, either; wiktionary says both are valid, so
probably a matter of taste.


