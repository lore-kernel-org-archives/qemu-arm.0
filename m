Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp330923ejc;
        Thu, 5 Oct 2023 06:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvfnVWm772oxGaGnJxcLrPPyJg5hJZvGLYmxHlFtx9wjahAyJ8+h+C9nkkaRGmLfO+YkfR
X-Received: by 2002:a05:622a:1051:b0:417:fd7e:2154 with SMTP id f17-20020a05622a105100b00417fd7e2154mr6617106qte.9.1696514282738;
        Thu, 05 Oct 2023 06:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696514282; cv=none;
        d=google.com; s=arc-20160816;
        b=t+58PcF4HY2nIa65yW8/2oDv9QKg45Vb6dWukITO/ISkiNSDbOSlA22Z7UZTfYcjjV
         q5mmzsuWG5U9V/+gkK+5aGJRC99ygQI0VbAzk7PMhRVraRkZVcWEo5iL3JeAp2rl6u80
         I6rkEukF0NQ5LrRv5qjammwkHizID9yGTt5hvhl+RC9tg4jwQwXjnJD3Mp1G037NlM9q
         CULlVVJsrASY95e8wYz1AjR61Ifm8fqcruDlrz4QJdK38IXLNXwTUo0KGjKWrbFMU3sE
         Kua1WlxQHjfvTWnuXPQ6tbhKG0FBW9fjxBqn2oaSFeOK8AEPQSRL1MuqES4m/9JTWGy5
         58Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=+2trs+pn0FzpHh4ldTZyvhDpCwsferHAU6wyqY8t2GA=;
        fh=5Kfxp9KCuv6esXGjd8SHcUiFltvew8Kj6RrZ+ryYP08=;
        b=cGJy0VfuGsr8LOswshsobW6tycoHjCp8+mpu7/X5+C7GGVuUh/iSrQ8ADpsporHlqf
         7rFobENGs3MbDq/NCjGqvbZVbMrSEbj9IjDKLDvY1DEgb8nVgWiXmBEh9SpOwjgBtEKA
         dg/l2p5qMXwIwaAUG2l0K00gW+vPsfJ0CohB0fQ1045AmaGamoCNMqqPNkGs7UdG+weN
         Uxw11e4JxwJd0/9kf7pDRmh5rBt2qG1x25Xa8X2GpD3JVI1ta8hF96eR5emfNrRkM0Zy
         6LSGWQYTlmbumDGJ7oajAI2qYjd08yKairg0HJshRk7TniEOopHp2THUENufJy+n4JG4
         WnMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BxGTXYhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05620a410600b00775787784bfsi939617qko.67.2023.10.05.06.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Oct 2023 06:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BxGTXYhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoOrT-0002av-6S; Thu, 05 Oct 2023 09:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qoOrR-0002Xu-Gy
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 09:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qoOrF-00029J-N6
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 09:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696514261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+2trs+pn0FzpHh4ldTZyvhDpCwsferHAU6wyqY8t2GA=;
 b=BxGTXYhm28V2W8KvV0QOTH5Cnt0CnDogFDs77yvhhD0YphihmNv5VqbKF9EH4YPN3cd5OB
 SeOtvo9B/2Yq+4t1CEdG++whE+SfBHMsB2yBDO568ZzesYhRiZChVh7je86QG9FoRPlLiP
 pbELiNCEp3+0KzyONHMz/QUuA6G+15k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-gwV2SMSVNkORLlANfl6Wjw-1; Thu, 05 Oct 2023 09:57:36 -0400
X-MC-Unique: gwV2SMSVNkORLlANfl6Wjw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF6CB2810D50;
 Thu,  5 Oct 2023 13:57:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6FDD493113;
 Thu,  5 Oct 2023 13:57:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BF17A21E6904; Thu,  5 Oct 2023 15:57:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: Add some unowned files to the SBSA-REF
 section
References: <20230929141918.397096-1-thuth@redhat.com>
Date: Thu, 05 Oct 2023 15:57:34 +0200
In-Reply-To: <20230929141918.397096-1-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 29 Sep 2023 16:19:18 +0200")
Message-ID: <87r0m9xjch.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4DKSpPiSgUck

Nominating for qemu-trivial.

Thomas Huth <thuth@redhat.com> writes:

> These files belong to the sbsa-ref machine and thus should
> be listed here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 874234cb7b..fc415d3cea 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -954,6 +954,9 @@ R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/sbsa-ref.c
> +F: hw/misc/sbsa_ec.c
> +F: hw/watchdog/sbsa_gwdt.c
> +F: include/hw/watchdog/sbsa_gwdt.h
>  F: docs/system/arm/sbsa.rst
>  F: tests/avocado/machine_aarch64_sbsaref.py

