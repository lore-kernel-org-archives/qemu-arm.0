Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C35CD98CE
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 14:50:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXgjQ-00018C-6F; Thu, 11 Jun 2026 10:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wXgjO-00015H-F1
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 10:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wXgjM-0000sp-U1
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 10:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781189404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzWiAI6vwGF0FhOWqrIFcAOlxkwI+atKC+Yy2K5mWOk=;
 b=Ew78hb4ibuaiEj/9tXwtEg5dewHuaOgiQ1q3z5OSbEazpF/aQ5i2VSlGlMPKSbXtQlOdN8
 pcxK6y0ChDNC7neZ4oKtpjK13M+hQ6hsW7Ry7tLI4RRXbr4aAL8HJ8db0Zv9ZuQpj5oaZV
 l7eYxebWqS1ON14KJd2JALCnNENKalY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-GHtOKM8gPWuD9F8JfVN9mQ-1; Thu, 11 Jun 2026 10:50:01 -0400
X-MC-Unique: GHtOKM8gPWuD9F8JfVN9mQ-1
X-Mimecast-MFC-AGG-ID: GHtOKM8gPWuD9F8JfVN9mQ_1781189401
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-45ef0af9517so5383844f8f.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 07:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781189400; x=1781794200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DzWiAI6vwGF0FhOWqrIFcAOlxkwI+atKC+Yy2K5mWOk=;
 b=gVjmule0NePcUjbsw+4KcbSlueAi66TTybc1ZZC2Vv2HnCAPC4kcA82RpQsG59ooQh
 3+W4QhJlrRusNPqpzCm1g98iL/Qhot0qnO/UXCUvN8z1GFTofdell2tdn/2GBuNR8c9w
 JiKY9yCvFzVlrgJ4X/JK9zkEBo8Iyf6fBZzX8J4rmYgZfClEYW1247RkqsxQUn3op3iM
 T9foz7kTg8KEjI99iGrI9pzn7NycGm7FeQAstpVGqW9aDgIDy3Hser54dU+SE6lWzWXU
 MzUiYa4W83ek57VwXUBgL+x+Pp2AR5Qj22fNlJjZH5O56sNyT4bwAoezBtckMw/ACtCp
 PAMg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/TkYa3hQbd6zgnBvBaoeboFu0/7pd9UntPl6MvoDYJ93cv503YzZcLrjjpwEPyjPrpyLmhGxiITw==@nongnu.org
X-Gm-Message-State: AOJu0Yw+XZhdsrx7erxDYuhypMxqZvzZ4+q9VmgLS5OqGXSjzC/ESWi7
 afUJTxdFx2SIwxhqW18wcWhNohX8x7GS4qQaFP8jQOdhny9gt7q5ou1YTqEb5nGwRu4Rn6+xlgN
 orX377/huXWWncIhSF0zHCYBWS0rpC9nmsIf5eKSszQASOzWO9MW3HFbGVYY1GLG+PzGUPH2TXu
 MJUI93KPQGvnJPp36xd8ogF+phnI3n
X-Gm-Gg: Acq92OHABE6nKMT0sS+Z5vjI1tqJ6Utl3clxQEY9knehxw3JV9JX1crIEfBRdQxhTLH
 /0NstkUh7kS/WHiMsVoPXEX2H0GuqlcfCggqdH5DBXTXitIv7a44yAbqSY1pkV6J6B4wJJN5C0s
 GBqtnqL9poVdsfo0mBcgDOc08BhPMwTcAyvf6e6I7BpvNaIGERXVieLaDNNSRkINxua6A0HgZnb
 eyw6r2rtG/8CB2USMva+Yzy9IPi7dCrur3uuNAO5C4q/0CKka9FD0FPFzRxSIIH4jvQOEUBfLSj
 kyXOHQj8cAN57yNiow==
X-Received: by 2002:a05:6000:2508:b0:452:6aaf:76cb with SMTP id
 ffacd0b85a97d-460674772admr4746098f8f.1.1781189400405; 
 Thu, 11 Jun 2026 07:50:00 -0700 (PDT)
X-Received: by 2002:a05:6000:2508:b0:452:6aaf:76cb with SMTP id
 ffacd0b85a97d-460674772admr4746055f8f.1.1781189399997; Thu, 11 Jun 2026
 07:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <0a0a1116-a5f3-45f2-b079-f66e6b17f672@redhat.com>
 <c5945f76-ae18-4a8c-ae58-d22be7a7f6bd@oss.qualcomm.com>
In-Reply-To: <c5945f76-ae18-4a8c-ae58-d22be7a7f6bd@oss.qualcomm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 Jun 2026 16:49:47 +0200
X-Gm-Features: AVVi8CeojY-tAKMw1s-WmlI88t-Bn90WvGpOngGGwoGMBsULwsrOZDc8A6bqj8c
Message-ID: <CABgObfYy48HzQmJTJ4r_dswGjmgMkeuy=1OiY_VbEupC1UX6ww@mail.gmail.com>
Subject: Re: [PATCH 00/27] tests/tcg: run tests with meson
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tJ0iZM9KS2Syo7jZ1MfvdpqjoL-YjmOzBV1RBg01ZYw_1781189401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jun 10, 2026 at 7:01=E2=80=AFPM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
> Your idea is to have one project per target, and use meson cross compile
> support for this?

Yes, that was the idea.

> `make check-tcg-aarch64-softmu` is supported out of the box with this
> series, without having to write a single line of Makefile. You can still
> do what you like: see cover letter usage, to run a suite or a single test=
.
> I don't see rewriting the cc_feat part in meson directly as a problem to
> be honest. Not all architectures needs to check specific feat (only
> aarch64, arm, i386, ppc64 and s390x).
>
> Also, calling:
>   supported =3D run_command[cc, check_cflags, flags].returncode() =3D=3D =
0
> vs
>   cc.get_supported_arguments(flags)
> is not really much more complex IMHO, and not a huge reinvention.
>
> Also, the custom target is hidden inside tcg/tests/meson.build and not
> exposed to arch files. Even if we had multiple projects, I would stick
> to not exposing test() and executable() in arch files.

Fair enough.

> I would expect this file to disappear completely, and to rely on make
> check-tcg-arch-* targets at top level instead. Would that work for you?

Yeah, you're right that at this point TCG tests are the last
stragglers in that file. That tilts the balance for me, it does make
sense to do this with custom_target() until Meson grows support for
something like multi-machine projects. Just please add an alias_target
'build-tcg-tests-...' for compatibility with tests/Makefile.include.

Paolo


