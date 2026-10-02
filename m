Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E57CA5FE2
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 17:23:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCgyb-0001Ju-FV; Fri, 02 Oct 2026 13:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgwu-0008JE-MN
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:21:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgwt-0003RD-7h
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790961690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoXXZDLvNvgKaFqa8YpP9dQLUt2vapGLok6gxunIT68=;
 b=bvokH9h8LnIBTobqnKOWu+Lanw9N+3S3fqpwxbS+h0YBcESSnT4ca9BIND0lHHwWX/q1De
 2XqOjLFNMYLuDBXb0vCb30TsHH0tuC6/SEAcziyLKmGZzc+s3RLgum9AiW09rwd8nhbNY5
 x9q+dqTXXJlu1Y7taUYUt/LNcia/oLA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-3tjG17T4MX2N__8DFzBoiQ-1; Fri,
 02 Oct 2026 13:21:29 -0400
X-MC-Unique: 3tjG17T4MX2N__8DFzBoiQ-1
X-Mimecast-MFC-AGG-ID: 3tjG17T4MX2N__8DFzBoiQ_1790961688
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ED7A919560B9; Fri,  2 Oct 2026 17:21:27 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2D3031956086; Fri,  2 Oct 2026 17:21:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 05/28] hw: mark all vhost devices a secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-6-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-6-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166113.3025252.10241920330836566113.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=309;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=36U2hwFalyBi2NiZOYsSioy4ZmS63nVhD5J9V8lUoug=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gB7tWh3txU4HBTMWIxNhGppWUHsWS45EzUN
 tUvdmqOz4CJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5SRKD/99P4YvNE9rpA4OcfaRex2f2wHKtECYpahgvxE9Pbxa/ag+IBOa63cJTnft2kdhu9JR51T
 nSTYsFlPBUK3dP3jU6UNr3T4bWIZaqXwzRqhGBxDxN4QqIBQzOgw6RauS7F6FaWBpezk/5nsIF5
 yKsrBd4zavLJVVJKf4MoFn+EvfWZS0wvTD1Y81s9azDWrbi/jB+Vy82ofVLSMXa6/Jmktsi7qyO
 GHUlYnJVq9PFr1iGD9MDfL+q6YwBNYtdbUkcRACeaoP7+y0ZcuTsP3Ye+FX5twjpoDPCBobzSDV
 8QK8xdsZA0n8D+8a4jcOu/mf5g7dHc15xpYKT6ncXiAGYVvveEsAjbTkV9K99iVYFqp7qOdUwvA
 1qen7dnFn2pTgmrXwHvMp4/LACNoQAGVeYRmjD1+rgDj8aHypR9GGkswCXrifEEFhJKcEovtQfU
 VdXd+9a3SCaeGmTHESrCBPeO4JEEXCaTrxENMS94ksUxf+6D4iBhHECK2eVWRD4wJv/U3NmlKtY
 0O3rO970BxTef4C+m6tAMEziyPiAeoE2BgMxJyeBHseZKjNYUcuJEhwqvco2/X0G9iBfpfjjHcP
 +CjLkIlsulVIQ5Yg09LPPSPMHaltomlpYAv+jIrI3w/iPmze51jcDHX/phR4MdnFv6biAUi2iPT
 PT1/NZ/4TddhPew==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: lRXKG4giK3QOGs8qqIugELLhGLGOU2NFLzsAgIYYnSI_1790961688
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.336,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
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

On Fri, 11 Sep 2026 15:36:04 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are all intended for use in a virtualization scenario and must
> provide a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


