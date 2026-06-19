Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5BBCD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 11:08:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waX4u-0003q0-Qp; Fri, 19 Jun 2026 07:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1waX4u-0003pd-1a
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 07:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1waX4s-0007sc-Lc
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 07:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781867281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Ftuz/YeU1BrVwtz+GOmCT6y76opWKn1nUdh59yxKwg=;
 b=hordkYLx4oJ8Sgod22JBsukjt2pEnvH0LLyX05ESoHGTiBisyzc7zQDUWemErPTmbWbsbO
 YJYZZ7ikfv4ho5Tzr6Bx+2ch66g1rdUr0+a62P8UPvsNtOeGes09lp/+deBSF8X8laP6Ll
 0OUd2bB2LTh2NerI/aFN/rQQ7Ixfw1Q=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-3CeElVLlP8aK16CAXJsAPA-1; Fri, 19 Jun 2026 07:06:41 -0400
X-MC-Unique: 3CeElVLlP8aK16CAXJsAPA-1
X-Mimecast-MFC-AGG-ID: 3CeElVLlP8aK16CAXJsAPA_1781867200
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30bc5f826f2so3718122eec.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 04:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781867200; x=1782472000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Ftuz/YeU1BrVwtz+GOmCT6y76opWKn1nUdh59yxKwg=;
 b=q8wSltj5SSz7xhqDfoir7V0jtY6+SSLaoXjBgChWCmYwtXrW/FyS1PDZHugbeqlcTw
 Y1vQ7UhTLBBQOtyqHBLG0ybKlHaoZcvciab8goFyjonT7LtygLGz/rYG7YsouF2OVe8n
 iuubX8Lnqs2RCWhvcXmv8x1h2cO+qMalOkKZFnwepuynhshObbIH2a9GPriESDEh5LdW
 4DdVssOL1mUD3BZavSsPOjrnfHMLevOYoynDrG85zv+4EbYb3HZ33/2Jxu0rDeDRLXNr
 0Cbug2bXGSC4aUasAwelguQ9DQuOeTyo6IAjT6mns92w0cd8B9db3kqKNqR4SOhEZg2U
 Lh1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MZlVe7WpC2+b/zUViurhBKj/02Xf3vNm9NDSAR+kdL9EtavWOAycH0wJtPYN0YibSDMqatBieBg==@nongnu.org
X-Gm-Message-State: AOJu0YzfQhjNZpOL3hZD6aHtPtQkSkR8KNQW6SkKX8UKbFXzPPVL85+f
 T1AXYwsjc3MKhCoLMOUpYqEnMXHVDNGgbgvbm6oGwrblOXgUaOe0c5BVYk/HGu9gmJfdb6IDZhO
 Ctr/mTkxlun2+i/voCYIsjru3/KPueCz4AkFzQ73dmcvX6nyekG644ScNQmn4/N/CBwAjHtSvmQ
 shaVlKpYFpcHqNmJGOJnIKUP6TGxi5
X-Gm-Gg: AfdE7cmCdSvmXNclR4Sw77OcwolzBZu7j2/bnQWTn527T/NLtbmF30NsKIeIiZPWGgR
 Q5EydM1kfKHs/QMAGCoC4ZhbTeBlZLMvDb8RD9RX3w1kgo177786HVBanK6kalVw9uzP0JB2x0R
 YAqTPa7WgxNJ2P4SwtqIRjbqn4y2Jjr3nJYgbPbSjJnF1Kd7UOXitMkCd10a2L97xN
X-Received: by 2002:a05:7300:6c84:b0:304:e587:5063 with SMTP id
 5a478bee46e88-30c0cff485dmr989877eec.12.1781867200315; 
 Fri, 19 Jun 2026 04:06:40 -0700 (PDT)
X-Received: by 2002:a05:7300:6c84:b0:304:e587:5063 with SMTP id
 5a478bee46e88-30c0cff485dmr989854eec.12.1781867199837; Fri, 19 Jun 2026
 04:06:39 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 04:06:37 -0700
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 04:06:37 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20260605083358.1320563-1-khushit.shah@nutanix.com>
 <20260605083358.1320563-24-khushit.shah@nutanix.com>
 <ajURCGaS94gwV_px@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ajURCGaS94gwV_px@redhat.com>
Date: Fri, 19 Jun 2026 04:06:37 -0700
X-Gm-Features: AVVi8CcvxopmE1LAhLJ_P5FoKxGosYvlKzKbEpZomnc1BklIe0Caltb9vqbh-Ec
Message-ID: <CABJz62PatHBE1pvgqw=asZgugOE3L5oMsEgj==Qp4ZnyHWhLkw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 23/29] target/arm/qmp: add query-arm-cpu-props-info
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, Eric Auger <eric.auger@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Jiri Denemark <jdenemar@redhat.com>, 
 Gavin Shan <gshan@redhat.com>, Shameer Kolothum <skolothumtho@nvidia.com>, 
 Sebastian Ott <sebott@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jinqian Yang <yangjinqian1@huawei.com>,
 Shaju Abraham <shaju.abraham@nutanix.com>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yMo4jNDynDTL0bECk1L0sQnwRUupMu1Som7Xt6C-O3U_1781867200
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Jun 19, 2026 at 10:51:04AM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Fri, Jun 05, 2026 at 08:33:52AM +0000, Khushit Shah wrote:
> > Introduce 'query-arm-cpu-props-info' QMP command. This command returns
> > information about ARM CPU model properties, including their name, type,
> > supported values on the given host, and composite parent if any.
>
> Do we have to make this ARM only ?
>
> x86 has named CPU properties too. They are all basically
> booleans so this API offers a superset of functionality
> needed for x86, and thus I'd expect x86 to be folded into
> this new API too.

riscv64 will certainly need something like this too in due time.
So +1 to making it architecture-agnostic.

--=20
Andrea Bolognani / Red Hat / Virtualization


