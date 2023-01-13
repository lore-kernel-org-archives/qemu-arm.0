Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp406015ejc;
        Fri, 13 Jan 2023 05:57:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt6wodyUEpYdJfFm+Qhvl4+sahqWBCX5/UvwlM4e+g0VCK6oF83SsXlBXPkbbglPJvj6HIa
X-Received: by 2002:a0c:90c5:0:b0:521:2df4:f467 with SMTP id p63-20020a0c90c5000000b005212df4f467mr153089336qvp.38.1673618252782;
        Fri, 13 Jan 2023 05:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618252; cv=none;
        d=google.com; s=arc-20160816;
        b=WgLPZ8/Rww0oLBV/2tvun7+nnkIak9YYz/zEMDnclg5jJ7z6TyQcPPLwKSSfHrkurl
         AuziwcI7IPf9xmDVoaHFDtVbvbopc7GW0SvxrIzpqHICue9WBRrRkJaALKQhwE3png0k
         3rajcMWHikvDD9Vdc8TX2993lF10ReZGE0tGNRE6ODPJiHot03f3F+74kFQ3yfN0qmJ6
         aFWAXITVDetyhiVoEWqGajT/1F04hUvFpud4Bvrjr6ZJtIG3R7vX7+uj4Vim9pFtXCCK
         SGV3K384QoJZ87Zx4IK+PVDL5eaXZ2QSy+D1Z5hLpYDcw6dOxcoiaJndThgs20x93ml1
         kK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=/NrQg7ILU0BG89aNNTPa3gdKfsMXOW9egUeImyvizTs=;
        b=031amz5MTwu3OJAqgsVZDME4rMx/X0J9Gi9nTcE35NUdd/hgDf3z9sbiZ+J9rarVsB
         UvByndkyg/k2AQ6lqioQc2dRgDPHCwKfzF4GdTo9htaKcqOhhNG4FafihPRjVUtX2ydD
         TLKCE7ogleSF3UQdJvzxnF887dkEb/ZJFlIZ9ZmcjOBgd/PVHZSlk5bZEl1qxvjxr0Zk
         u2z8WAMOdadeLPR8FnD8uaPZrQdtgksYYAEBsxL59VDfYhjU6J8IBmztn6MbOGZ50TjQ
         kEoQ5uMtJc406F4rnfRoFJqAPR9HNF1+tXxCNV+Mip2xUhsSSTYnyBgJqy8ygD8dgqFV
         OzZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DHgYrqkW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw6-20020a056214238600b004bba80844a7si11680466qvb.270.2023.01.13.05.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 05:57:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DHgYrqkW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGKYZ-0002Fs-W2; Fri, 13 Jan 2023 08:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pGKYW-0002CV-TQ
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 08:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pGKYV-0000Qf-Dx
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 08:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673618232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NrQg7ILU0BG89aNNTPa3gdKfsMXOW9egUeImyvizTs=;
 b=DHgYrqkWrbtsM3Ks0vQNiOJF/A3F173wSRkA/fOybxYMcHn4UiyvjB/8IGV4hfdosXZjFO
 TCCzCWbjH7Q3G3fmdcKNJliPVAYkVN4j21Vti+y86TC/to5DIvbog/zLk7dWQ/1kPMmpFR
 H+b9n9NEiim4thVUbWn4dUm4TZ9eri0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-gKau6a-HMiKg7Amf9oP69Q-1; Fri, 13 Jan 2023 08:57:07 -0500
X-MC-Unique: gKau6a-HMiKg7Amf9oP69Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B6B43C0219C;
 Fri, 13 Jan 2023 13:57:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E92114171B7;
 Fri, 13 Jan 2023 13:57:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A40721E675B; Fri, 13 Jan 2023 14:57:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>,  Peter Maydell <peter.maydell@linaro.org>,  Greg Kurz
 <groug@kaod.org>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Huacai Chen <chenhuacai@kernel.org>,  Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>,  qemu-arm@nongnu.org,  David Gibson
 <david@gibson.dropbear.id.au>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Markus Armbruster <armbru@redhat.com>,  Song Gao <gaosong@loongson.cn>
Subject: Re: [PATCH RESEND v2 0/5] target: Restrict
 'qapi-commands-machine.h' to system emulation
References: <20221220111122.8966-1-philmd@linaro.org>
Date: Fri, 13 Jan 2023 14:57:04 +0100
In-Reply-To: <20221220111122.8966-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 20 Dec 2022 12:11:17
 +0100")
Message-ID: <87y1q61qrz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-TUID: iVtGniZPb2mR

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> [resend fixing my last name typography...]
>
> All series reviewed, can patches be picked by corresponding
> maintainers?
>
> The "qapi-commands-machine.h" header is not generated in user-only
> emulation. This series removes its use in user-emu code by moving
> the QMP code depending on this header into a separate sysemu unit.
>
> Since v1:
> - renamed cpu-monitor.c -> monitor.c on loongarch

Quick drive-by remark: we usually name C files containing just QMP
commands SUBSYSTEM-qmp-cmds.c, and files containing just HMP commands
SUBSYSTEM-hmp-cmds.c.  On the other hand, the existing monitor-related
files seem to be named target/TARGET/monitor.c.

Keeping QMP and HMP two separate is desirable, but not required.
monitor.c is a fine name for a file containing both.

Use your judgement.

