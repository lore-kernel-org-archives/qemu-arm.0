Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA3ECA5FAD
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 02:51:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBkPV-00051Z-UV; Tue, 29 Sep 2026 22:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBkPT-000512-TH
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 22:51:07 -0400
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBkPS-00084j-4t
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 22:51:07 -0400
Received: by mail-ed2-x0c.google.com with SMTP id
 4fb4d7f45d1cf-6acaec6a74aso2018331a12.2
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 19:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790736664; cv=none;
 d=google.com; s=arc-20260327;
 b=fv11SpJtXyHcX/Q/cQc7hPcUzUUkHioj0foW9LaB8F2VJ2g6T20ZLCfl+o/zsdggPP
 4KwI/uCEpUSzvOc5Zy5o5rolOYU6L2EY8wnD9DDDBncnRB0t462ri5CYbsR0ntm9ZrJn
 z4oCC9NFuF3ex5B/CcAy1TsrQKOl7+0eYid46TdOo+Rst0HBtR4/+HozuUvfzYrUBj8M
 Uh47kolDwLUhx4oXgnjJ2WbZAf64cwL9N/nVxb68gKcJddcfSKaIAd8jd2e1PQNdEL4t
 sRnm2aKQYINEyCBfmsda4o5lG2/iSqrV5dsvvM+yhM/ezN3i8MxRatZIc5cmLcGyi+tW
 6Ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=EV6mrJxfEd7WOTTvXqOmWWny2bOcZB0m95vhp6g828E=;
 fh=rqZ7v1JrA62nm3PpfIYOWCOihWfI1D1uPcJTB0U+K4Y=;
 b=ijdFyY62+bxSY5jRq2R1XiaK0mlzgPIRydoMqKAZyTOAOqAB5IgGK8BpLUenReD8fm
 PRUY7v25kum3cANBmPpn2WeW5cglyON0UbWwcEeGOOIQkqATYzgTdiwTsHDn3f8DUwRk
 qU6ipF1XaY8OeOkHfemfHqNypyIVT5QEDjf1fGE60LQhNDfOHLUaZMvMuFCAjYSmSPuT
 X0xtl7Jgdk4T4fAW9uim2dF/EZiSrvr5BIBZIRRf6nj9PYjBynNML4djNTyPCcDNTmyQ
 14rxDg1dENqaJxQEG2G7XCXzjCjqTu+fnwu6E2oP6HxKRy1+3HKZ3+eyizLMwmrQnPTt
 tRZQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790736664; x=1791341464; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EV6mrJxfEd7WOTTvXqOmWWny2bOcZB0m95vhp6g828E=;
 b=VMYByi8VCMZ1cYIgG275mu4P0V2YB/XAXXTkRCgQlfQGSCuo55jZOi266deaDFXd2j
 GfLCpEi+nbtktdO0vg2epBd54mKweEflTOU6dPUoftajSUyoeiQcSOWmFHjif+y/2UNn
 alop0CrT9MfGyTaRuTrZK54iyxvwrYAwgurR/50NmnyDXuxa0OCUQj/osw5Eg5b5Fi+o
 6VctPS3yg85GxozvOjz7xXQ+34UnjcpoKmNX21lXtHJFGJOH8aJfVxIHVcnDbKMEwG1J
 HoC9+zViYZAEmUSM/WxlCoZ3iun1N5LLEEnlgXhqURY3f9n9fkrGHKm3YjeGR+6CJvLB
 TxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790736664; x=1791341464;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EV6mrJxfEd7WOTTvXqOmWWny2bOcZB0m95vhp6g828E=;
 b=cObXbHFsgGqAwtfdGj6hm2uCZHCZjBgRGiMG262ejPPxusspzmXuP+WBlG1FhKNkMv
 nU4n+VdVm9mPhwgLG7G98eiKBV7W50BRk6gFWrNRBSb70ZhCgfTeXM0rdlMUlDYjqPuE
 3EsKVJapEkmaTFd+tQXKTLxX0kMMUv/PZZFLnGcjNNRtKfUcOaYxbGKUVAxZpgn4DP4M
 RuUmXx37rH/BYIdOjPKfl5mwuikldF5hGc81gNeok5eG2Gtgq3Y4IqXAV6wFdyHzeVQt
 jF7G1okfprCaStr10tD+xqDwGDk9yMB8W9/luMzm9o14+Z74bnA8ruuLibZgKBF77Qdf
 QHOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCTQpfKoswLUR+UCyMzpLjJSkkS6I6p+S28C2bh+JSUNerxqFp32IEY3r773Var2HrWVWOSD2VEA==@nongnu.org
X-Gm-Message-State: AFq9FYKKgFeWcuAR2t46JAqiT5nTOYhezmM8iAKW+0xcx3Uu9ZCRzif3
 4Y9GBYeBMCJYGbrnCiFrT5jbk1kJtVfs5mH5QWZTPVZSAxgv5DHFcnlGBCkY7n15+LV3g1+xvZ6
 2qaLP6+gISUHQZdP+ZhU+wifcagy3qJA=
X-Gm-Gg: AYBFou3U1NsgQuaUQHyN2HwzEQPQSCbIrozlbIG9sbfk8FqzhdVBz+64cFh257Dqhdd
 +NpWatULso+kQwGZ7XvlaLIgfRjoK52lw4PbVc6oEHUY4F/C5Xs1HKejDfJ1H+CjudRoi62yuNM
 gz3eCQo+5bSXc0FTHNczb1Lz36MaJaXQOq+CbYs/QQYiOrbWG/13dUnvLIlLNfIzUktLfkTGvmc
 EAldJHLWnbq7CtXRX5xZZydDEzdtwtepmFUVZURKf/MUXp8eTZZ5mKbNrE6gVprsaBNdu6wCQpV
 kwusZiAo/iuIUwM6uCnIne6bS3uV6YWy2kPLnVma6rkXjxiour2MynA=
X-Received: by 2002:a05:6402:3785:b0:6ac:9a44:d412 with SMTP id
 4fb4d7f45d1cf-6ad4fd0b503mr556197a12.7.1790736663388; Tue, 29 Sep 2026
 19:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260926081551.29-1-luoyonggang@gmail.com>
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 30 Sep 2026 10:50:49 +0800
X-Gm-Features: AclHuK9fFP4b14helAoNXT3RwjpHnY1xuNl-fP9dsY21rLTwrOXFbzbzU_PGXH8
Message-ID: <CAE2XoE9tVCwQE0Mv-KPin+evQM4qh0mzj=sw-S1au2=uupM9ww@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] machine: uniquify virt QOM names
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Stafford Horne <shorne@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <17746591750@163.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::c;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Can this be queued now?

On Sat, Sep 26, 2026 at 4:15=E2=80=AFPM Yonggang Luo <luoyonggang@gmail.com=
> wrote:
>
> Multiple targets register a virt board as MACHINE_TYPE_NAME("virt").
> Those QOM types collide if more than one board is linked into one
> qemu-system process. This series splits the QOM type from the -M name
> so each virt board can keep a unique type while -M virt, help, and
> migration stay the same.
>
> - Add machine_class_set_name() so boards can set MachineClass::name
>   when it must differ from the QOM type. machine_class_base_init still
>   defaults the name to the QOM type without -machine. Document that
>   MachineClass::name is the -M name, not the QOM type. Sort -M help
>   by that name so order matches the printed names after types are
>   prefixed (arm-virt-11.1-machine vs virt-11.1).
> - Give each colliding virt board a unique QOM type and keep the
>   existing -M name via machine_class_set_name(): riscv-virt, arm-virt,
>   or1k-virt, hexagon-virt, loongarch-virt, m68k-virt, and xtensa-virt.
>   Versioned ARM, LoongArch, and M68K boards keep virt-<ver>. Latest
>   ARM virt still sets mc->alias to virt.
> - query-machines returns MachineInfo typename, the QOM type from
>   object_class_get_name(), for qom-list-properties. The -M name alone
>   is not that type once virt boards are prefixed.
>
> Changes v2 -> v3:
> The versioned-machine example in boards.h now follows hw/arm/virt.c.
> machine_class_set_name() keeps the -M name as virt-<version>, the QOM typ=
e in
> the example is arm-virt, and the latest helper is DEFINE_VIRT_MACHINE_AS_=
LATEST.
>
> Changes v1 -> v2:
> - query-machines returns MachineInfo typename. v1 returned only the
>   -M name, so a client that appended "-machine" looked up the wrong
>   type for a prefixed board such as arm-virt-11.1-machine versus
>   -M virt-11.1.
>
> Yonggang Luo (10):
>   machine: allow -M name to differ from QOM type
>   hw/riscv/virt: use unique QOM name
>   hw/arm/virt: use unique QOM name
>   hw/or1k/virt: use unique QOM name
>   hw/hexagon/virt: use unique QOM name
>   hw/loongarch/virt: use unique QOM name
>   hw/m68k/virt: use unique QOM name
>   hw/xtensa/virt: use unique QOM name
>   qapi: return MachineInfo typename from query-machines
>   machine: match the versioned virt example to arm virt
>
>  hw/arm/virt.c               |  3 +-
>  hw/core/machine-qmp-cmds.c  |  1 +
>  hw/core/machine.c           |  6 ++++
>  hw/hexagon/virt.c           |  1 +
>  hw/loongarch/virt.c         |  3 +-
>  hw/m68k/virt.c              |  7 ++--
>  hw/or1k/virt.c              |  3 +-
>  hw/riscv/virt.c             |  3 +-
>  hw/xtensa/virt.c            |  3 +-
>  include/hw/arm/virt.h       |  2 +-
>  include/hw/core/boards.h    | 26 +++++++++++----
>  include/hw/hexagon/virt.h   |  2 +-
>  include/hw/loongarch/virt.h |  2 +-
>  include/hw/riscv/virt.h     |  2 +-
>  qapi/machine.json           |  6 +++-
>  system/vl.c                 |  8 ++---
>  tests/qtest/qom-test.c      | 65 +++++++++++++++++++++++++++++++++----
>  17 files changed, 113 insertions(+), 30 deletions(-)
>
> --
> 2.52.0.windows.1
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

