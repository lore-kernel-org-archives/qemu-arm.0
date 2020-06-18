Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1307959lfm;
        Wed, 17 Jun 2020 22:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPvBuBEHA0tdoZ8y5mMrnTLwd86C02peWOeAOLHWQRcxWsX4ucSN/0eZUt2Xv0cz0AH/P5
X-Received: by 2002:a25:7a06:: with SMTP id v6mr4069691ybc.152.1592459249724;
        Wed, 17 Jun 2020 22:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592459249; cv=none;
        d=google.com; s=arc-20160816;
        b=ltaQRu+0X6FJfhvPNdt3udGbPQdxXGBXEqxfjggTysPSuavhOMlpL81KaM87P9k8/t
         wO4BCCievwLqhEVMO5FHUJWtygZ5ZYUfHMG6ZSarkIiKgQsTlc2QS2zVmKM940PzPkUE
         VVsQ0ceDWs5apXEaWZ8uoll+c6QcstzIpxGRJy1acvXZlBblcFwc/bPJOCJnwUNl9eWs
         hTvIBC8z8o8PkwLw6/nx4fslEjsVguFps1ZEi+u1t7PzS76dZbCKqoJE5MA5xtiZUilG
         U+jnN+q2KDsetAC+8Mo0zATY1rMngmkGzkHzxoMBcKIZaO2Uz2q0ZaHmZ+raFM2XR4ut
         PTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=1FoU1l4Qo3AC9bNd9nsNf4OhBSrd+yH62hpW0g5jXv0=;
        b=hIfUsQNKLEpBYimetdlp3J4LMzpglQ71SDvtsl8swRRRnCyzowFrbPv+xxyMSgHVCf
         oBF+NPplj8B5h2ugbdScBVYH1yPid7gFX7+WJ7megWtHuq78lQKK82e98LN4Xc5/LGjj
         TLoiMfELO9JfEEw8FxCuoaYzJdDPRbFAbqZkcGqAe7YhRUh/nXGxmFaIakc48z6T6oxS
         pj7hetKtay1YdN4bQEMIPhmVwb6HV8grBwwLZjtPC61IfMxy3C3TUQq4y/+pXKvmmHbl
         2S1XHnBD+cWYpm8lZ9cun5UiQASjlz4OM+CXjo3mkc3TnJ7GaIvlrPMoQXoCaCbvLbGe
         fTTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f155ldSI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si1569641ybk.72.2020.06.17.22.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f155ldSI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlnOb-0001UN-5k
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jlnOO-0001St-Vv
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 01:47:16 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49752
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jlnON-0007Gg-Kb
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 01:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592459234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FoU1l4Qo3AC9bNd9nsNf4OhBSrd+yH62hpW0g5jXv0=;
 b=f155ldSI3N2MJe9gV4eP52AI690L1DGS+aHS2Tv3dOwoNApA6KPN4Esh70j8FR6+jruHZX
 QjROqfkVcjLXNO2XPlngaosdM/ZWMocUczMgsXUWcA63D2Px8QWH6bXtvBwIHqqdvy5Zfi
 vT1SAeiQNqda5FgbTfY9hU4dqwUZCF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-CJaL21qiP96p0hqS71OQiw-1; Thu, 18 Jun 2020 01:47:11 -0400
X-MC-Unique: CJaL21qiP96p0hqS71OQiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BBD418A0762;
 Thu, 18 Jun 2020 05:47:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2948C79319;
 Thu, 18 Jun 2020 05:47:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A1F981132BD7; Thu, 18 Jun 2020 07:47:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/7] qemu-common: Briefly document qemu_timedate_diff()
 unit
References: <20200616075121.12837-1-f4bug@amsat.org>
 <20200616075121.12837-2-f4bug@amsat.org>
Date: Thu, 18 Jun 2020 07:47:01 +0200
In-Reply-To: <20200616075121.12837-2-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 16 Jun 2020 09:51:15
 +0200")
Message-ID: <87d05xsz6y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 00:57:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <minyard@acm.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2jpiMWmf5GKW

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> It is not obvious that the qemu_timedate_diff() and
> qemu_ref_timedate() functions return seconds. Briefly
> document it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/qemu-common.h | 1 +
>  softmmu/vl.c          | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index d0142f29ac..e97644710c 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -27,6 +27,7 @@ int qemu_main(int argc, char **argv, char **envp);
>  #endif
> =20
>  void qemu_get_timedate(struct tm *tm, int offset);
> +/* Returns difference with RTC reference time (in seconds) */
>  int qemu_timedate_diff(struct tm *tm);

Not this patch's problem: use of int here smells; is it wide enough?

> =20
>  void *qemu_oom_check(void *ptr);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index f669c06ede..215459c7b5 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -737,7 +737,7 @@ void qemu_system_vmstop_request(RunState state)
>  }
> =20
>  /***********************************************************/
> -/* RTC reference time/date access */
> +/* RTC reference time/date access (in seconds) */
>  static time_t qemu_ref_timedate(QEMUClockType clock)
>  {
>      time_t value =3D qemu_clock_get_ms(clock) / 1000;

time_t is seconds on all systems we support.  Using it for something
other than seconds would be wrong.  The comment feels redundant to me.
But if it helps someone else...

