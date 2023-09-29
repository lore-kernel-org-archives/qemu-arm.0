Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3013640ejc;
        Thu, 28 Sep 2023 22:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwWtpGHrDzMoquYFoGbTBK7D4nWNFQffngUKjIF/L8AAd+j7+rEPchiHF5YngR7EHzI8j1
X-Received: by 2002:a05:620a:1a0c:b0:765:a9d7:2ca2 with SMTP id bk12-20020a05620a1a0c00b00765a9d72ca2mr3704498qkb.48.1695964429486;
        Thu, 28 Sep 2023 22:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695964429; cv=none;
        d=google.com; s=arc-20160816;
        b=VR68KUX5Lizfu93g7Z8vydsmYgRuYR5/afT5VWP0DX3nRn35I6D789FveDznSpA5IX
         7ft5QoBc8DtQsHXygfwacVGi0WGdUXRBJUErcbUbukjjrBP15LKv4HmYMItdxFrZx8Tk
         Pd8PSKNFHopOeWfOEFresIjLzr1zUBs79MXFRR4VvYXbI01b7dU0ekuDMiWchrdCqMgf
         B6tBv/n4+mlRVHr5KcU3ufAdiB5L2TBdRafGvhocvX5n2tBwJOGq6VjC1FsFnp1RWNuy
         eMYQK4p6VRMIKEnwqiWhk2cdnhA9hwXKFQq+KsqXSQIwGwmfTGssCeIFAmWSaPlvja1m
         Zeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=9mIXLUZ+R66RXPRG5wG2Cl+YJkylWQei/osMt/w8VY8=;
        fh=XOcsgqAO8FrYO3hPJm4HugBFn4zBt9xdLbPKOU5gUU4=;
        b=v0qNA2jbTO+kgqTD2V7E8sww0vWqr+qalq7ENI4hH4ErE51gXAxB5VzbDa7nw7wypR
         Egqz7DjvZeM/J+dSfkUQX9G3lIngtRh2zoBzEExV7qIOfDUDOHi7vOZRMG/8TyzZgaYX
         YI0AwO8gBHy+IU2/UM3J1Y5/i0/NLrKzzL2ZeRJq+LWt72ocoAcylJJNTQrHadOMgiv8
         Rri9/FWl2Hr32YgofD/PpsIaLeb4NcBYUpGbU9HQAuxqGtlLitTcSOp9bXoL5rcRfTPv
         uqLxwDy/lVoX0F0RbF4pY4RBZwsNXE8kL4k4Ru8zbFdKLAjUZ8yLGmq3wfHX1b9TtDCC
         SqTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P4a1yYl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a05620a254c00b007705b83d48dsi9880203qko.683.2023.09.28.22.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 22:13:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P4a1yYl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qm5oj-0002Fi-IS; Fri, 29 Sep 2023 01:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm5oi-0002F3-9O
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 01:13:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm5og-0005Wl-CP
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 01:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695964409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mIXLUZ+R66RXPRG5wG2Cl+YJkylWQei/osMt/w8VY8=;
 b=P4a1yYl48dTkbLr6t412mv5jXVx3wzhZ2JefcpN1qPQrSXtqJEk397d9O9ZyQRO/9sb4va
 SuBfEFstQJu6URoUndmh8MdXAFdwFXtjMXc3OgyE1WXTj7USjIsQUJpTzK10khpkKKTcgK
 yti9N4o/yNPwATSuik24CgmSToqzSzA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-mqaMXaE7MrugOeOJSVNA_Q-1; Fri, 29 Sep 2023 01:13:25 -0400
X-MC-Unique: mqaMXaE7MrugOeOJSVNA_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D4C7101A550;
 Fri, 29 Sep 2023 05:13:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F5940C6E76;
 Fri, 29 Sep 2023 05:13:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D8BD21E6904; Fri, 29 Sep 2023 07:13:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 00/22] (few more) Steps towards enabling -Wshadow
References: <20230904161235.84651-1-philmd@linaro.org>
Date: Fri, 29 Sep 2023 07:13:24 +0200
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 4 Sep 2023 18:12:12
 +0200")
Message-ID: <87fs2xlfyj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 3uBntUAf46Jf

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Since v1:
> - Addressed review comments
> - Added R-b tags
> - More patches
>
> For rational see Markus cover on
> https://lore.kernel.org/qemu-devel/20230831132546.3525721-1-armbru@redhat=
.com/
>
> This series contains few more, my take.
>
> Based-on: <20230831132546.3525721-1-armbru@redhat.com>

Queued except for:

PATCH 11: I asked for John Snow's opinion on a matter of taste.
PATCH 18: Review comment from Peter Maydell is pending.

Thanks!

