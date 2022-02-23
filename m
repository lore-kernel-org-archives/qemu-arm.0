Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp142881lfq;
        Wed, 23 Feb 2022 05:48:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCTMGVNjyJJj4bB7UYJbqrMDhex0OMjaMea6PHt48oyFBxmeuC83uequg1iXDEBRPJHUSn
X-Received: by 2002:a05:6214:1d05:b0:42c:a98e:6201 with SMTP id e5-20020a0562141d0500b0042ca98e6201mr23566313qvd.122.1645624079930;
        Wed, 23 Feb 2022 05:47:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645624079; cv=none;
        d=google.com; s=arc-20160816;
        b=eTtUNZziw25tFfO3TB9D9sYdNF0tPx+NJqiVFuDAb7xhgmj8UIjVIZJOChslLwT7Ig
         5O7s2j4bOnAlcRybkFXxR8ymZbwxP6VLrvUhfy6KdM7bTpyF0rwdnToi8UFkPkzzCsaX
         AU7DqDDcnYH5M45lD4NFwLscfEm73tWPPsbLXJeKtrhUn4KaEZC4fF62o3RyxgGyNKxN
         RiH+1yQjUkqYzRbUGLFbM8agzTg0KyuNvWVYWK+hy2YOyVJYWRT1QaXP3vsbE2N3AIBa
         ZoykWLbjh2M+Dn3QwwV5QmqiVPftopQ4Gx04uWMKvVb2hbPW0Ch9HXYUdgMF2JDMYvjl
         JJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=1sZjjNlzyIA0uhF6s/E69xpHH5DuUmhJQ9TZWBeirNo=;
        b=HS2f82KRze30fQLgcBRjKwcAt7sJvb30sEKQAWpJ8FKQJ/Wo8/NMRD3eSFm4lBldpV
         310linP6v0B4zTYMaE/0c74AkCGLBMV5rn+RTRWrXINSoPrmvPiCg44TwTRzxM88UQdD
         BsHhmAuuGHaO6SDx//YxHpOVSe82sIX9pNrFWXSLn8kv7lgkOC5rfg/6D91Rg8BymTTk
         TNRnzNBXaV5qh4iQJRFkQrLqJNt3+kUoMBpXbtUWWPUIQuXlikaftZoQ6Dy/Y+UvL8BW
         LwyIhbGbM2Tmo2ZDRKuUdyVJ8xjnkZ+2qZUuHKLxWArnhIU+qitx1yHUR4qZzeV/Sob0
         mTjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UjlOOxQf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si1588028qvd.345.2022.02.23.05.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Feb 2022 05:47:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UjlOOxQf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMrzr-0002HS-BH
	for alex.bennee@linaro.org; Wed, 23 Feb 2022 08:47:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMrzF-0002Fl-R0
 for qemu-arm@nongnu.org; Wed, 23 Feb 2022 08:47:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMrz9-0004op-SS
 for qemu-arm@nongnu.org; Wed, 23 Feb 2022 08:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645624027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1sZjjNlzyIA0uhF6s/E69xpHH5DuUmhJQ9TZWBeirNo=;
 b=UjlOOxQfKKO90OvpqRucgF0rWBuotKvZsZybx1EM+gfrreZn81hhvpBt/eUko7Wkvg8PQi
 wEBJCrUmLpZGGqH+vaRoIk/9ZYtpZlPDwYSSR4ZZZFyj3yqWlK6opDDtCK3fRLJIyCZ2/H
 TGWSMsbKrVOcp43Gngud1lHzCIk/d1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-HBKp6C0nPhCrTtoQZO9z-Q-1; Wed, 23 Feb 2022 08:47:06 -0500
X-MC-Unique: HBKp6C0nPhCrTtoQZO9z-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1ED3824FA7;
 Wed, 23 Feb 2022 13:47:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFAE838C5;
 Wed, 23 Feb 2022 13:46:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B1C2521E6A00; Wed, 23 Feb 2022 14:46:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org>
Date: Wed, 23 Feb 2022 14:46:51 +0100
In-Reply-To: <87a6ejnm80.fsf@pond.sub.org> (Markus Armbruster's message of
 "Tue, 22 Feb 2022 13:02:07 +0100")
Message-ID: <87o82xpues.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S.
 Tsirkin" <mst@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ApZLCtCxlP73

Markus Armbruster <armbru@redhat.com> writes:

> Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
> the RTC supports the event).  What if there's more than one RTC?
> Which one changed?  New @qom-path identifies it.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> RFC because it's compile-tested only.  Worthwhile?  Let me know what you
> think.

Passes manual testing with mc146818rtc.

