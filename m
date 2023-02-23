Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp743044ejc;
        Thu, 23 Feb 2023 05:49:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+35yC+a/NBYCZsu0vZpBu/vF4HdHk2ehWzdodLv6mWXKS/h4Hpwf6LhstvNUwpFn0Lyh9a
X-Received: by 2002:a05:6214:c22:b0:56e:a06f:d1d2 with SMTP id a2-20020a0562140c2200b0056ea06fd1d2mr21161889qvd.30.1677160177304;
        Thu, 23 Feb 2023 05:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677160177; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4bzPY+xLP0gTYeaolMW1N33RSBYHZJCS0HAHeHiI0sbzqBCJjYGsaszieQJajPpdf
         IA+xEeDzvwmOy9dALuU1vyHRZhfXPIxlShpsLh3PhGwbsJUVbF97zB34AUGIFr3rL0DF
         nbH2+vwvjRyh8ofObMS7JC5JjaYabzu6LW2ipzZeXeXrJk2/kmBg33AnBksaNyH1bNEd
         Vt6aoKag5WLHg/J7zniNZIZYj9OOT++37SkuxJzg0K0yGfUvyUlduTAdlWyJiRF6kPqC
         GRoGYKXNa8B2D95FdKptVkPXw+0/NwwgD4/NHJheRmJOAbR/aVscfzop2U/aqhiVXP9X
         DJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=RiCVBuS//4Buc56xfpkG1kf7HgIdIOY+ZPGt22R6RW4=;
        b=WI1liX9/MazSion5oqzyga6JUBwR3wVHbEStsJJ273GEZt20O3ZCwilKosgbvLBg6A
         Eacx+rCl6/kUN+NuFIwSh55tkMp5jAvf9xB3/TFFWI7N77RwM3EB2SNT3d9S8IDXy6nD
         g/mT56s4DyOOTMGRheVkdq2sq7YAn6A+w1ZY/274TCfN+88dXGXa/IctFp1XMOWF+sUn
         WJvIWi3926kw8EadQziIN67x89K1Wz/wnkhsMFnM3y0iSb/uLviL26aDYbG2wWsKNYB0
         jb4KPbfhgyI5fWAsE9mCfEz3XeO9unl1AHiy80fOs+GMs/exYTWmvGKCcfO0nsVXIJoH
         sEXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gv+bRiLc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020a05620a404f00b0071ab9598fd0si4770592qko.330.2023.02.23.05.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 05:49:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gv+bRiLc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVByV-0002Qe-7A; Thu, 23 Feb 2023 08:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVByS-0002Pw-FT
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:49:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVByQ-0001m5-Sn
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677160166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiCVBuS//4Buc56xfpkG1kf7HgIdIOY+ZPGt22R6RW4=;
 b=gv+bRiLceFD+wgiFT/Dq/yl8+THOTREe0mcIhVjqUkuseqCm8COFn0cSYR4pObi7MHCoB+
 R7tjWW6prnMVmxXMHKy5vInd06xyfcOxxEgaGOE+njHBk4vH313mUua+BpilB+tG5icmUU
 U8z5aB0SvXU4XkjBxB9PKO/d5WY1w5s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-eXK77pqXN62O7fiYWC1GzA-1; Thu, 23 Feb 2023 08:49:22 -0500
X-MC-Unique: eXK77pqXN62O7fiYWC1GzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58DCD1C05AEF;
 Thu, 23 Feb 2023 13:49:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 350A42026D38;
 Thu, 23 Feb 2023 13:49:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19D8D21E6A1F; Thu, 23 Feb 2023 14:49:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,  Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>,  Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,  Song Gao
 <gaosong@loongson.cn>
Subject: Re: [PATCH v3 0/4] target: Restrict 'qapi-commands-machine.h' to
 system emulation
References: <20230223124340.95367-1-philmd@linaro.org>
Date: Thu, 23 Feb 2023 14:49:20 +0100
In-Reply-To: <20230223124340.95367-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Feb 2023 13:43:36
 +0100")
Message-ID: <87sfew331b.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NKEOAFjKDspy

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> All series reviewed, can patches be picked by corresponding
> maintainers, or should I include them in on of my PRs?

I'm sitting on a lonely patch for the monitor subsystem.  Want me to
throw in your series, so my PR is a less complete waste of CI minutes?

[...]

