Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp997965lfc;
        Wed, 27 May 2020 04:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAUOYaJ8ubZqIb4yj2vQEw+Q5BMVg1zfs7ymxvTaNGzkJ/4RqMkmMRlAzKqVg4FWAdKEro
X-Received: by 2002:a05:620a:22f5:: with SMTP id p21mr3324057qki.241.1590580082442;
        Wed, 27 May 2020 04:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590580082; cv=none;
        d=google.com; s=arc-20160816;
        b=IaliGwafcQQOrF5X3j1IQZyeEXEMXeAsYySFMVBmh7Kz7Kqn3jkWpAC/FXfA2BeHJR
         yA8tkCQdZzosIrP7urW2UyymmNgYkuJ+bQ0fjYdciIYtCErMdauVqAte3udGQtPUd16N
         2MK5A7Hz71HqCgaryq1bQCfzB/wFtB53pscbKrSZOHtZhQepoWqUHoBK0ExIsrG/ImEk
         BCZWoipVG5prxp3s6oWUgSEfglw3YZewGObEVldzdO/rpSIwilA1b3L/XwTPyzOyGvj0
         SrdWx5fDtx3nwN7IHuAaH1NXpZ/jKbV1WIzL/yyFwFOiGOmAbNo4flMmWesz0UX+UBeS
         gxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=vHaFoexjr9OAVa1ZOFucS+I4E6wQdIFIfMEumIDCFRw=;
        b=abirwkIRAkW8eOhItjC8kwD0QUEr4TeoFxvZmdN59aAGe6RvCwlX4HjEX0SZLdi7oB
         1Y5cJbgdYixYRTCHv5+3fKWbLRUsfERZ4E6U3t47huLjQlbjbCI7u/IXZOBkpkIzU3/i
         uevKVbHn7/AO3Vr4kyuR/d3xSZvHdDOQjjdvtKbh5SFEXWXaxqUtkzj1JPcODKy5h+TP
         7CfHirosH8/2K7KAAngzxUFfuFgyGwG2vFTvPxopL+wb1U9kuaogLAlvvRWWXfYsklrh
         Qrco0cdG0wWp5Smo6fx8C0MdBInrg+pTAGZrWmjLNUPcSqBEDKwY2uYQHjS4zll2eImg
         bubQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frWeIoLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k64si1637923qkf.371.2020.05.27.04.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 04:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frWeIoLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jduXR-0003ph-UZ
	for alex.bennee@linaro.org; Wed, 27 May 2020 07:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jduXL-0003ov-8e
 for qemu-arm@nongnu.org; Wed, 27 May 2020 07:47:55 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47573
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jduXJ-0005vV-GZ
 for qemu-arm@nongnu.org; Wed, 27 May 2020 07:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590580071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHaFoexjr9OAVa1ZOFucS+I4E6wQdIFIfMEumIDCFRw=;
 b=frWeIoLzy7gvZNDk7KnvrGocEUCZKw1B2IjFypQVRqcZNpj+qJNYtddVFktEuQa5xAbK2w
 8sGHVR1Ot4cYOjDA8DZCEIT5DkjHgBuMAT/uE5APTomYki5LaEzqBg+9EP1bsC+K4CnW4W
 csjj6L7BoQ9gVnUxWXKQjzzbBCt5kco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-FDpg5iZGNQmz9qQuUFwW0g-1; Wed, 27 May 2020 07:47:50 -0400
X-MC-Unique: FDpg5iZGNQmz9qQuUFwW0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF855BFCE;
 Wed, 27 May 2020 11:47:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4789691D98;
 Wed, 27 May 2020 11:47:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2AF5113864A; Wed, 27 May 2020 13:47:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2] arm/aspeed: Rework NIC attachment
References: <20200526070802.160897-1-clg@kaod.org>
Date: Wed, 27 May 2020 13:47:46 +0200
In-Reply-To: <20200526070802.160897-1-clg@kaod.org> (=?utf-8?Q?=22C=C3=A9d?=
 =?utf-8?Q?ric?= Le Goater"'s
 message of "Tue, 26 May 2020 09:08:02 +0200")
Message-ID: <871rn5r44d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 00:45:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lghItnKL1Dbr

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> The number of MACs supported by an Aspeed SoC is defined by "macs_num"
> under the SoC model, that is two for the AST2400 and AST2500 and four
> the AST2600. The model initializes the maximum number of supported
> MACs but the number of realized devices is caped by the number of

s/caped/capped/

> network device back-ends defined on the command line. This can leave
> unrealized devices hanging around in the QOM composition tree.
>
> Modify the machine initialization to define which MACs are attached to
> a network device back-end using a bit-field property "macs-mask" and
> let the SoC realize all network devices.
>
> The default setting of "macs-mask" is "use MAC0" only, which works for
> all our AST2400 and AST2500 machines. The AST2600 machines have
> different configurations. The AST2600 EVB machine activates MAC1, MAC2
> and MAC3 and the Tacoma BMC machine activates MAC2.
>
> Inactive MACs will have no peer and QEMU will warn the user with :
>
>     qemu-system-arm: warning: nic ftgmac100.0 has no peer
>     qemu-system-arm: warning: nic ftgmac100.1 has no peer
>     qemu-system-arm: warning: nic ftgmac100.3 has no peer

This confused me, until I realized that QEMU sometimes supresses the
warning.

In vl.c:

    if (!default_net && (!qtest_enabled() || has_defaults)) {
        net_check_clients();
    }

Suppressed when none of -netdev, -nic, -net, -nodefaults is specified,
and also for -accel=3Dqtest -nodefaults.

Say "QEMU may warn" instead?

I looked for other boards with onboard NICs.  As far as I can tell, they
all behave the same.

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Patch looks good, so
Reviewed-by: Markus Armbruster <armbru@redhat.com>

