Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp737368ejc;
        Thu, 23 Feb 2023 05:42:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8tTRwi8Sm+dzasYF/T0G+gjtwXCs8qAfJBKCSUvGQ0/dPyXTBephlD3nExV9cu85WdZYla
X-Received: by 2002:a05:6214:2486:b0:56b:fa99:7866 with SMTP id gi6-20020a056214248600b0056bfa997866mr19952274qvb.7.1677159767029;
        Thu, 23 Feb 2023 05:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677159767; cv=none;
        d=google.com; s=arc-20160816;
        b=Vqfr6ojMWcm9/NuJTVzKWQIaBCYH+SlEEnRZJOkUfXqt64DKGaVxHsNZlDDZeIQp0n
         081/QU1sbNyqBypoqxY5n8ZVYbK+fNMskd4+Kgcs53vfF+cR2KBbvw8wW2Q/xpgyc+lV
         pdUYgwZdCiFbvprqAT4cgda44YRWneH9IQf+eAH4I9nXo8BU7IjMamG9dNcwo+Q7/768
         pGZpEfDhCTI8e8MQkToXmY9H4T4DklCjx6kuq5ZdOBcjKkKPuwgVPUw07rYNKkfI7tQ5
         vE5grBmlDof9OVOzwGNIcTWRGQeFZd/I6GUQ6wdAt+qYdt6LiZLV+myOVAf0ua8FWoFr
         HKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=wf8QFY8YZvH3aEgrJpsL7n3QfJP7oJzqbEoaf8FGDyY=;
        b=dNOjlIuD8NNZgcExWWXpdnXm4vs3SG8bCr0WP+4CxIMN0ivklmHYldYppiS5dTkOUx
         +QIpHTxbf08OuiGBxgRdxZhFioof8sRUqWZYtJ/7FzioiSL2uE8/UlRtGH2YnED8pVDW
         ae6sRIH9c2Qoe+iRXyefMZl7BLbkr887GrFpNzUNfX5JJ8wvD3QIkJ8ubeZ7foLnV3QQ
         Q1cZdAWDxZOGtGAbT2L+jS9XPFTBeGUBcwEJ4PWhNsOLMq5ynMY/158/I2U/56ej9Lto
         NV9EGk0+G86ZylTFLS7EkNfA7iKovMKutUHxPtD/gKNosa17EPLrTc6I9vZz9uv+a+sO
         zY3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E02FPAQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15-20020a37650f000000b00720263e936dsi4656933qkb.60.2023.02.23.05.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 05:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E02FPAQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVBrf-000864-D7; Thu, 23 Feb 2023 08:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBrb-00085N-Vf
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 08:42:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBra-000079-0p
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 08:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wf8QFY8YZvH3aEgrJpsL7n3QfJP7oJzqbEoaf8FGDyY=;
 b=E02FPAQslt462XLCP8NqsBycAheQoEl/XChxAmPOyUEQbfLAev+XJzXv3y40kQtYUbxOn5
 O998sYOjI37DyXXbvBbJgLTAYtOfJK21CyVeYGSof2jq4V9xS/jDjkmrb99GsEzO5Z8Q3S
 ru0ojitH3ZN2/hBQKN0Z/ZDwskE5ueQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-yHXbFU3pOUi-CxZ819veLg-1; Thu, 23 Feb 2023 08:42:18 -0500
X-MC-Unique: yHXbFU3pOUi-CxZ819veLg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDC501C02D32;
 Thu, 23 Feb 2023 13:42:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8FEF492C14;
 Thu, 23 Feb 2023 13:42:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 99FA621E6A1F; Thu, 23 Feb 2023 14:42:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org,  David Gibson <david@gibson.dropbear.id.au>,  Greg
 Kurz <groug@kaod.org>,  qemu-arm@nongnu.org,  Xiaojuan Yang
 <yangxiaojuan@loongson.cn>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Song Gao <gaosong@loongson.cn>,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 4/4] target/ppc: Restrict 'qapi-commands-machine.h'
 to system emulation
References: <20230223124340.95367-1-philmd@linaro.org>
 <20230223124340.95367-5-philmd@linaro.org>
Date: Thu, 23 Feb 2023 14:42:16 +0100
In-Reply-To: <20230223124340.95367-5-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Feb 2023 13:43:40
 +0100")
Message-ID: <875ybs4hxj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6eS2ha7ZzP1K

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
>
> Move the QMP functions from cpu_init.c (which is always compiled) to
> monitor.c (which is only compiled when system-emulation is selected).
> Note ppc_cpu_class_by_name() is used by both file units, so we expose
> its prototype in "cpu-qom.h".

My comment on PATCH 1 applies.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

