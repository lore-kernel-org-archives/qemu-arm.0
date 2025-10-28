Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBF5CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:17:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhh7-0005Ky-2o; Tue, 28 Oct 2025 07:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhh5-0005Kj-Oq
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:16:52 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhgv-0002Fw-NZ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:16:50 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-783fa3aa122so72708097b3.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761650197; x=1762254997; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qq19yoNokeRIKV6QsVUrrWcYPH3C20bsjt6gVhyqZd4=;
 b=of3VAYevfrcQ+pD9Fl/zrjZX1q432Yb8DnMxJbaIvUR8XBjZIiUAlopjIyOMFcq9vO
 zuIe5S+mKtGXXexVz8T+XC79QDap8N8mWqe74euygUW/3g5g6o7Yh+O4aEmzOlbgVrg0
 RnON/ZJpfEPtEYJ+//AlANp6h56aOoWqvAzegDBmjnVXPc47irAM2oqM5MOQt40BSmUu
 3E+0DSJCyZ8X4b50iW9C0w377HNmouICxgv7SstHDNhuyMFSercbqNx3ykLrzS8hHMly
 NiJRW6kB0HsvrO1j7OTSuh/D5KG2pfFCpZieESBD7bZNDv0wVMjxTYPvrynKR6Ee4WPP
 kbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761650197; x=1762254997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qq19yoNokeRIKV6QsVUrrWcYPH3C20bsjt6gVhyqZd4=;
 b=P3B6svIM+MLVO5IXf+0tQFJMmWpIdL8wAJJdZUrSaawoRQUXhw/tDFJQE4xDytisyD
 BsyS8911ilfAGx9evUki1X711E8EXYjvwrZSb9c5tvpPYWJG41VlMUU5Dng4qUuYB1Q0
 dWEhQhNFxtPMysONMOwvwQa9mhGJ8TrS/uGft8NaiBFhFlYn/ZgZakuzNcKtLRZ3c58Z
 kpmMnezDd5TKRF41oc7JmjuVMfANJ15v7eKDVG9dakSoh+yEjl+G7zS5tckduqbfAvBy
 o76XgHLy9IBLIjPBACEXqRV7yk1j6QGKndrQ6zUZHYsoiM2EGOLYgT3kR3Gs8++wMCh1
 8nrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzrXMgQxfeBxyeQrfegmKVQHD0dz4kxQKO3OkzD1wo++hx7SLhA3Q5nMXKPEeYUhCfGJr5bvoAcg==@nongnu.org
X-Gm-Message-State: AOJu0YwwjDy4FA/RkNl5LCCiKzY3EjOpmPBKyRgLo5tqv/a46BKFl0G8
 n78ou294HfUaIAFknuqlmybQAsW94lE7Sfsqi7O4QGz/eMtwJ+qFVJPShMp8O3xe0kagQNlpqAW
 9VAd1ljNMZpBdDQczSVAUbeH8CPEd6dskN+XcoaSBCg==
X-Gm-Gg: ASbGnctl3kMfWm+oRY5yuCr8Z8JD8+qO8d/VS0NMzEfzYLJ89ZsQw9i8GL8X/u8E6CC
 FfsdHphhZJUGpufvGCqs27CDrvZ0RDRJ0Ykiqs49/5e7lqpVu6RGg9umLb7Wofh9AloxqcWX1MK
 4EKQR/8N3SwSs82o8IEAT0u2FJvJ+Dge8XNzH11EZj/ZDrwS8H7gj40zS0I3VA07+dpFQ3r3pR/
 0p1AGP6NcI4I44dAJyUhBHv6IneRbUZ1+zlgzHbDMxJp6FSQoReK3HU8/6mKQ==
X-Google-Smtp-Source: AGHT+IEGi7F3q6pF1+zy6W59GTZtx+d3+8rlBr38Jem1dg6LCa08F1GP3RrekLa6nf+9gdiLLCgBLS4Q3hoxSR9teOY=
X-Received: by 2002:a05:690c:92:b0:780:f3f3:b56c with SMTP id
 00721157ae682-786190062fbmr24081327b3.9.1761650197646; Tue, 28 Oct 2025
 04:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-16-philmd@linaro.org>
In-Reply-To: <20251028054238.14949-16-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 11:16:26 +0000
X-Gm-Features: AWmQ_bk6ZxSNt6FtSF_vfFnFHQfrQUny8bk3kq42fEzvXoDzNsArGBKJh9YxbYE
Message-ID: <CAFEAcA_uxT5CAZ4bdXjgV2hUe6o626Fg4X6hTDufo3ffSsn=sQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/59] target/arm/hvf: Simplify
 hvf_arm_get_host_cpu_features()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Oct 2025 at 05:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Use index in the structure, dereference &host_isar.idregs[] once.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

