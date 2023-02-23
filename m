Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp736319ejc;
        Thu, 23 Feb 2023 05:41:35 -0800 (PST)
X-Google-Smtp-Source: AK7set98ypQpyKMKGfE+Dhjkj+AS+vhvxaImcHho50MwbIkFyhvkLP+di0O4VkMCdKRTBJr1x+zT
X-Received: by 2002:a05:6214:1c4c:b0:56e:a2cb:574e with SMTP id if12-20020a0562141c4c00b0056ea2cb574emr24015366qvb.5.1677159695343;
        Thu, 23 Feb 2023 05:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677159695; cv=none;
        d=google.com; s=arc-20160816;
        b=ERRvQw/ZJBbBwIk+JRXjBdavXuJKhCZC1LROQ6cbFmBILZ3suFzuN8lCtuiZ3fBiS5
         yFb7ceKDshMx4bMty8KfUDmDZWN2RQ253WZKOTTZFloy1DNVYw+r5fNo88twgt75O/LO
         xOogl2hYDEih325X/lzxCVTgBeK4s3416d3uqPym4QjBsQt0CA9ukr66vmCZoEa6X0n3
         gRevmLEjfMWPtwWKh6KLyp3SOj35QZlLgiuvXVfNzLlWhSfiOYNGcofo/d01KW2GJmof
         EEzlCQuEsMsNOAqKo1t71NoQGAXoK2yWNsKQDcaCKhXHMDeX+gqY5lTvrk2lrX4cF1mi
         SvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=qBqpaKMftyIRDWqirchehbr/ojkb01ckHUlr9c2G05A=;
        b=xMU5ga7yFYETXTrgywoq35fW55X+avQIoySEvwnaVli1KRDyCu/xfZxZ+ygAbWrnqP
         hhZ9QfwLybV6HELXp6tv9jKzALjhMLCvcvWyDamPyITPsj0l92Ij7WEVoVIOdX9PzjIu
         fp6rpniOxUWiKwJ6Avw0jLzi/2EiaHtsg04GKY6AxL1xnrpfb6/BPymLuLRRKQi/nlCk
         wZI23zAVzoRRmdnk1475ehYrLsExjMoKYtryDy3UQNb1Zvccy7y/15gMi8azJx7hrlFE
         rpyUTcFdjJkdxNkCiOIfzy/hI63PHlltpsrS4jdKhACLt+qBrxNZetdGIL8keXa20bjV
         o7aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B3Nve2yk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a0cdd0d000000b0056ea45b0146si10016522qvk.370.2023.02.23.05.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 05:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B3Nve2yk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBq0-0002yw-Cm; Thu, 23 Feb 2023 08:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBpz-0002re-0w
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBpx-0008Gb-KB
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBqpaKMftyIRDWqirchehbr/ojkb01ckHUlr9c2G05A=;
 b=B3Nve2yklzqhIdDadhogD4zjoLQqT+mhTg+hkGJCnQT5Z/Jh3sjwfg2jyHcZNrezUSRqCy
 pjVClI5wnWO9CeMbByqOIrrN+ZoNC8/jATvptV94hqFAnrysBkorVxCuuiH7PAh9PvxH7k
 VA3IxjSXtFcy+TdWkaWlJcG/rGz/AKw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-iXVjq8smO3ibWoW1m8sDSg-1; Thu, 23 Feb 2023 08:40:35 -0500
X-MC-Unique: iXVjq8smO3ibWoW1m8sDSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B64485CAB3;
 Thu, 23 Feb 2023 13:40:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 955CDC15BA0;
 Thu, 23 Feb 2023 13:40:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B1A821E6A1F; Thu, 23 Feb 2023 14:40:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,  Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>,  Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,  Song Gao
 <gaosong@loongson.cn>,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 1/4] target/arm: Restrict 'qapi-commands-machine.h'
 to system emulation
References: <20230223124340.95367-1-philmd@linaro.org>
 <20230223124340.95367-2-philmd@linaro.org>
Date: Thu, 23 Feb 2023 14:40:33 +0100
In-Reply-To: <20230223124340.95367-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Feb 2023 13:43:37
 +0100")
Message-ID: <87fsaw4i0e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3975GtU6qo3I

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
>
> Move the QMP functions from helper.c (which is always compiled)
> to arm-qmp-cmds.c (which is only compiled when system-emulation
> is selected).

Might want to cover the rename.  Perhaps:

  Move the QMP functions from helper.c (which is always compiled)
  to monitor.c (which is only compiled when system-emulation
  is selected).  Rename monitor.c to arm-qmp-cmds.c.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

