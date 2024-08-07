Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp27521njc;
        Tue, 6 Aug 2024 22:13:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXycLQbJVS5vJQ3GP1/eB5sk4NqcwGWcUX2AacmEOt9vN9bQY0sCLzzh9sRZ7ynPxhq/x9VW5rAubSAlUmzlyTesvTe9iTf
X-Google-Smtp-Source: AGHT+IEoZf3CUb/iDSj4Rskzu+VhMTfMUVC0ivhueJ8pDwC5v7dJkWZp8gIwUnEUYzQyxBxaoCNS
X-Received: by 2002:a05:6214:5505:b0:6b2:b4d2:984d with SMTP id 6a1803df08f44-6bb9836e234mr211059396d6.15.1723007588619;
        Tue, 06 Aug 2024 22:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723007588; cv=none;
        d=google.com; s=arc-20160816;
        b=WG1/mvUESvnkzDC6n1TXRpl3kZNlhz9thG/F3cQb56IznztiNIzVtgycH5W+tm74R9
         nDgZk/RXcSqSE3f+QNzmnUxyVri9wTlwRYyY2WcieV8KYjGCW4GFG9tSwhFmJi+zJhY8
         AESWfQ9O4WVvzI1nTVS9nLnKcLdhrCoixvPz5O2BuWmzDyNTlx3Y9zaVuN5mMLoscEzP
         sPDPoEf6OeHdd05VvFC65sBEXBND3LF+eSUAxcEZVl/EpChtLAEurlkOhf3GozMCM8Bz
         +I8JtaOL6puZuJ/BeJismRdbUxlHLusKiulJf1/cntbus7THtdeywk/lMWaEFrcAwniQ
         AZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=nHi6Z8qHdWWZa4x1RapBqelewvshZ/hVrZ44qd9hjwA=;
        fh=U57P0pt2cofzXA62nysASYKyy/Z4NZvRf6QjqRRvzfA=;
        b=nXJAdy0W33rtVZJzM6OcYeR3255ViGPVe2Y1YiwRDxH5N7v8V/brkT3vkMDK8zibVP
         k/JwkjGNvTwqU5GzwF5MtaHivXylBsfvYVv+R70uv1rA9vXV45rYywOdHSNIcv/XPbjz
         rk1jN8mebmLhENT9lDqadYH0qjnKxhx/l+aKPk/WHx+IINrq+2smiQ0KWhah19oxyEuC
         Fti/sW/sSmWsxwcEx1v2K3aT//bez7Nu4VVPnw+qIZp1+D5aplsUP/9drceY0UglYvHn
         tLX6Xq37nXwF/ZgWEJRJ0qvidXd4GzbZqZBZ+ZsnBFcua9gUyrfr1sW7DP9Co1Hs0ItE
         I9tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZzEMi/4X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb929ea8si9799906d6.528.2024.08.06.22.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2024 22:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZzEMi/4X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbYyb-0000Hn-Dt; Wed, 07 Aug 2024 01:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sbYyW-0000GW-KK
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 01:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sbYyT-00060b-Ha
 for qemu-arm@nongnu.org; Wed, 07 Aug 2024 01:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723007555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHi6Z8qHdWWZa4x1RapBqelewvshZ/hVrZ44qd9hjwA=;
 b=ZzEMi/4XHY4LrW+4BR64NVh841z4xs987NMyYSw4SO6ngpw9kzKH6r/rb3fKH1XLYUcAhl
 3JMYWNq27cXS+CV4cUvE4prPd0+8jKIacBpITeL0VwE+a2CSYpLLbiPAu5k1eg8z/b4Gd6
 g2O1wYjDiFMnXsoF9ZZqqTAO+/OlHI0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-e9dhINX6M5qZR8lxwOdZWg-1; Wed,
 07 Aug 2024 01:12:31 -0400
X-MC-Unique: e9dhINX6M5qZR8lxwOdZWg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8F1DF1955D44; Wed,  7 Aug 2024 05:12:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B2101300018D; Wed,  7 Aug 2024 05:12:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DB3621E668F; Wed,  7 Aug 2024 07:12:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Thomas
 Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
In-Reply-To: <20240806141940.22095-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 6 Aug 2024 16:19:39
 +0200")
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org>
Date: Wed, 07 Aug 2024 07:12:26 +0200
Message-ID: <877ccs29xh.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KYe1uYaBcBxe

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> qmp_query_gic_capabilities() is not specific to the ARM
> architecture but to the GIC device which is modelled in
> hw/intc/, so move the code there for clarity. No logical
> change intended.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/intc/arm_gic_qmp.c     | 59 +++++++++++++++++++++++++++++++++++++++
>  target/arm/arm-qmp-cmds.c | 52 +---------------------------------
>  hw/intc/meson.build       |  1 +
>  3 files changed, 61 insertions(+), 51 deletions(-)
>  create mode 100644 hw/intc/arm_gic_qmp.c

[...]

> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index afd1aa51ee..45d3503d49 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -39,6 +39,7 @@ if config_all_devices.has_key('CONFIG_APIC') or \
>  endif
>=20=20
>  specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_comm=
on.c'))
> +specific_ss.add(when: 'CONFIG_ARM', if_true: files('arm_gic_qmp.c'))
>  specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_=
common.c'))
>  specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_=
cpuif.c'))
>  specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.=
c'))

You move qmp_query_gic_capabilities() from target/arm/arm-qmp-cmds.c (in
arm_system_ss) to hw/intc/arm_gic_qmp.c (in specific_ss when
CONFIG_ARM).

Both _ss are target-dependent.  In my testing, both get only compiled
for target arm and aarch64.  Obvious for arm-qmp-cmds.c in
arm_system_ss.  Less so for arm_gic_qmp.c in specific_ss; I guess the
CONFIG_ARM does the trick there.  Correct?

