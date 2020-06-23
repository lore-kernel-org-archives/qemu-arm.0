Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3911101lfm;
        Tue, 23 Jun 2020 01:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7D2nAJSUWS04rxtz3Lwho6gFE8bHAWcKS22yH/WBdnaQw754wqu/w07eP4QcvxmVOKoUi
X-Received: by 2002:a25:8403:: with SMTP id u3mr34146252ybk.276.1592901802594;
        Tue, 23 Jun 2020 01:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592901802; cv=none;
        d=google.com; s=arc-20160816;
        b=JydmLAbn0G5Dfz+MNTeYkO8xh+eXomTcw1Drl3roQQbAbghTSYs1/wKQCCUG3rMzbB
         3C+2mILBFKpB/Ra+O1REccSMuptv4iSoKceKeO1yOvFMw4s/VVxoo1MM/v9rlVGPhzHj
         qQofkb2g/c5kSa1HjdkiX1hN0noFKdv6PJ9bBcqRqFiR+RUMS2hbfLnAhTIY9Ufohm+l
         vLR79USEUT/xCu/EpCPpaetu1Pd5uM/dt1ZHd0pWJK2H9alZrT68ukMQ7ZoWfDQDFOZu
         jq6TCP/I8hBtkcYNDjwjik/QR5kziwoUGNU4t9ujmBp8j9q1ENgSlrFbxdqqmPO5DiAs
         vQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=GiYxue/hTD9hiqfrdIwcau36savsF5wzRFxPiMpLGKg=;
        b=x6YvBCtkoNkQum/KQol+BR8wSICIOCD+8YIkKrr9RTOzHTrbEJ8fzMr/noGa9iEV8d
         BqBnGuQyHooDapMwhlQhUC8Zp6yhKzO5ZPbVuXVI/VvoXmX6vv/5GCFd3aT8nX6Uf4kq
         USanXL2m5f7V3UoiuWy3z3U6PZ//jamYGapWiusfmxkxfgfzrxWay6bwvH4s4T952XKG
         p+DPpRC5LkFoD0qdcK2NdHNynCx+QeMhCnmJbcPvcIyuyR5UvvuyzF4Q+CxSTw3M6cmZ
         EqupG+wgVFKAIXDTdx5NktDhD4JKGStheh+g1dy4sCQvWOoyTdBVGp0Xp/p336S3BGSS
         r8BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IGNKIgdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si15763567ybb.79.2020.06.23.01.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 01:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IGNKIgdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jneWY-0003SH-1F
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 04:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jneWR-0003S3-3E
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 04:43:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23294
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jneWP-0003rF-8U
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 04:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592901792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GiYxue/hTD9hiqfrdIwcau36savsF5wzRFxPiMpLGKg=;
 b=IGNKIgdRGwJH9XX5veBfceiVUr4DqCNeDPG8Zf2xZWVuPENHv1jMtpnu+ULF12MoSKsNpL
 lNFau6XgLK0Zr/o5sic69j9lSOP9NaLoUM3KJ8jiMfyW0MiwFHaBis2jEpbXLcfb4+8xS0
 Y9RMVaya/GZK0DHmjGJCyOyI+Uu6dbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-t_GXV9FeNwimdPE_mys7BQ-1; Tue, 23 Jun 2020 04:43:08 -0400
X-MC-Unique: t_GXV9FeNwimdPE_mys7BQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D0D01005512;
 Tue, 23 Jun 2020 08:43:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C21A60F80;
 Tue, 23 Jun 2020 08:43:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A4B5E113846D; Tue, 23 Jun 2020 10:43:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 7/9] hw/arm/aspeed: Describe each PCA9552 device
References: <20200622183428.12255-1-f4bug@amsat.org>
 <20200622183428.12255-8-f4bug@amsat.org>
Date: Tue, 23 Jun 2020 10:43:04 +0200
In-Reply-To: <20200622183428.12255-8-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 22 Jun 2020 20:34:26
 +0200")
Message-ID: <87ftamkw9z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:54:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9d?= =?utf-8?Q?ric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2S3oD50x9Ok8

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We have 2 distinct PCA9552 devices. Set their description
> to distinguish them when looking at the trace events.
>
> Description name taken from:
> https://github.com/open-power/witherspoon-xml/blob/master/witherspoon.xml
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

