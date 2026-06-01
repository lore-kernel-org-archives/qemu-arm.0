Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FB7CD6E55
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Jun 2026 15:27:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wU4XS-0005gf-Hh; Mon, 01 Jun 2026 11:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1wU4XR-0005g1-Du
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 11:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1wU4XP-00087a-Ot
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 11:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780327605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O87D5ERaoU0+ZFcsqFKghVT6EDswroEUznsw6fI/N08=;
 b=Yu2q2XZDJkHXQgmRDzieffDXbtP3ypeIKgIY/g+xkZoGahWMDr54Tp2p2lkizjUlzrNbIm
 JZl2mjiXlDClxcdlzvO0EdZK116CqrmeClQIp+7tBYJLkU8/zHk3DniKYoWqRERchN1pGo
 y0L8n64ACiwUFto8KJspyszXiDRaDUM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-exT3auJOPr2QP28PkuHE0g-1; Mon,
 01 Jun 2026 11:26:42 -0400
X-MC-Unique: exT3auJOPr2QP28PkuHE0g-1
X-Mimecast-MFC-AGG-ID: exT3auJOPr2QP28PkuHE0g_1780327600
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2273E1956089; Mon,  1 Jun 2026 15:26:39 +0000 (UTC)
Received: from localhost (unknown [10.44.33.203])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5B2B930001A2; Mon,  1 Jun 2026 15:26:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, Kyle Evans <kevans@freebsd.org>, Peter Maydell
 <peter.maydell@linaro.org>, Brian Cain <brian.cain@oss.qualcomm.com>, John
 Snow <jsnow@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Brad Smith <brad@comstyle.com>, Warner Losh
 <imp@bsdimp.com>, qemu-arm@nongnu.org, Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>
Subject: Re: [PATCH 0/3] testing/next: hot fixes (Makefile, gitlab, docker)
In-Reply-To: <20260601143129.144786-1-alex.bennee@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20260601143129.144786-1-alex.bennee@linaro.org>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Mon, 01 Jun 2026 17:26:34 +0200
Message-ID: <87a4tenuxh.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: weO_fv4dhS9Wd5kOx_VLxMIY0pi9C2Ra8JBRq0C9zcc_1780327600
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Jun 01 2026, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> The last testing/next which enabled MacOS broke check-functional-FOO
> (which isn't directly called in GitLab CI). Revert the offending
> commit and replace with a more hacky workaround in the gitlab
> invocation itself.
>
> Also include a fix to select the right docker fallback for building
> mips things.
>
> Please review.
>
> Alex.
>
> Alex Benn=C3=A9e (3):
>   Revert "Makefile: include tests/Makefile.include before ninja
>     calculation"
>   gitlab: work around the inability to build targets for MacOS
>   configure: use debian-all-test-cross for mipsel tcg tests
>
>  configure              | 2 +-
>  Makefile               | 4 ++--
>  .gitlab-ci.d/macos.yml | 3 +++
>  3 files changed, 6 insertions(+), 3 deletions(-)
>

Tested-by: Cornelia Huck <cohuck@redhat.com> # running tests on an s390x
                                               host at least

What is the expectation wrt the MacOS builds? I'm not getting any
runners (probably to the feature not being available for normal
accounts), but no other problems seem to show up.


