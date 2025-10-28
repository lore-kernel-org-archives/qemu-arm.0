Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B1CCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:27:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhqO-0001nz-E4; Tue, 28 Oct 2025 07:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhqL-0001nR-Le
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:26:25 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhqF-0003eK-A6
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:26:25 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-63d8788b18dso6312859d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761650777; x=1762255577; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnCM6rPz+I1GLdkc1/OkQBmMRtxTTVlF+8mD8BVn3J8=;
 b=n+j+Xn/YL1qcFvXR3+gDbJIw3epi284wgCf7h4iF2haQ2FJV8gkmRwpE1IAWYL9zHF
 hy4SPQN68CZBCAhZy8gscxniI8fNr/Q3eZk8TT8J4Qiy0EJfmKwbd2brQ93NmoYN0syD
 gEbjSUbjwFdgfCGIkywux6ZrK0ALlXzjavNXq0G4l+RCzOHfl6baBPlAWQl02Ssj34+X
 qUWIiivPa2dzUw3x/BQf/Os4ZfYWfmJM4CIA64elKHaVHMvuArw4Sz9Un4vR3mGaQDis
 h5RgEJ5aLlCH/07ibN4X5yAgtJFjG7cQd3mp/iBlBkBOSbnwnQHnGxvPoqBqL5n9kDMO
 vnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761650777; x=1762255577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnCM6rPz+I1GLdkc1/OkQBmMRtxTTVlF+8mD8BVn3J8=;
 b=hmE0jBXO9SX464aT9sC8ouFWt3wkR9um+9H3MS3x+xi669BeuZ1/gTf5bTQUeFpqEB
 nNfU/0c6aC88ZUZCCNtmZt2X9MWU/JR3Oxc49vc+Qlu0Efleqn+/hNamgj0TIQtEvEm9
 +uVdszxT+43s5GOXP7eJMYKhHf3v8uQUGZE0h161uqT9243HiZjtxpKd9m50A/xocGLK
 tbpndjb/K0HgQ3jUy5OlUAbJyuArlKcvNyBupoYfk9p6pKfcNrHOzSc12bTGOfTOWlrC
 kDi5uZX1phawC3Is2Qxn/T8rh8MZ+g8FaQsswpPqpf/t2sLPEoWKfB04Ld95sqL+/i2Q
 +MlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhGltrhHLUqHJaOprO5hPaBSMjIfWonmeJyU3aKbyGuRkPnbLvV6SlPcYyQljieEb5LSvTHCDOqg==@nongnu.org
X-Gm-Message-State: AOJu0YxIM/je8TR3dEQj6tC4jQ+//0lkAhdnOTSbZsbkaZC2XE9D6qCA
 mzvYhg0SGAR7yuxEgNwOZ8N+nw2xPAH9v5oLN5ubRsjawxDSUOW/lNMPOu+50rbiuRAfCguo0B7
 vX91cuKbgDb5/8Ywn26hjH5wJMP9aKfE4HFoZWoQ3rg2q6N1iWfyX
X-Gm-Gg: ASbGncvnPpbpgJz1vy6ZNpXB8ZK/hrgv4AGT+Dz9+megJQ9xVYoHAXb3L/BEDskHoBG
 KeQ5sZwAq1LMsqd7aaWt7IgXsKaONqt7bpl7z9QK2jsp4gAP/LNCkM7EBz294b79wWjDZjVBrSJ
 t3GxvJUzgJ93RhC97S9WluHaotFsq4ZT1mQgoy4n7ttOZrJvcWxd/YfDDJKcKavr7JuoGrM5gk7
 11sk20OgHkGJFZtMlCgUY/BHpDJnrk+mKpyLuKazBHH5gh84OjxmlqNVgz0eA==
X-Google-Smtp-Source: AGHT+IEV42GaySz+vLv0JFNB8qKc2/1O3/0k/h0Y4aSCJT8bo0spHQqpnU6FmWGIHGZU6C+XTx+eexwwrJOyJEylBQE=
X-Received: by 2002:a05:690e:1a90:b0:63c:f5a7:406 with SMTP id
 956f58d0204a3-63f6baac49dmr2189355d50.58.1761650775844; Tue, 28 Oct 2025
 04:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-33-philmd@linaro.org>
In-Reply-To: <20251028054238.14949-33-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 11:26:04 +0000
X-Gm-Features: AWmQ_bnq7wnKH2NtnhTn4CBAtG6oyr0yQxwyP0Ir6C9JL72FsqyrThxOAiIj1P0
Message-ID: <CAFEAcA9pQSS+pB2Hy7Noi-SS+f_4LgGy9xsy+QyL+WQkkQXxcQ@mail.gmail.com>
Subject: Re: [PATCH v3 32/59] accel/hvf: Enforce host alignment in
 hv_vm_protect()
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Tue, 28 Oct 2025 at 06:05, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> hv_vm_protect() arguments must be aligned to host page.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  accel/hvf/hvf-all.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> index e13abddbd9c..2efecdc9f40 100644
> --- a/accel/hvf/hvf-all.c
> +++ b/accel/hvf/hvf-all.c
> @@ -11,6 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/error-report.h"
>  #include "accel/accel-ops.h"
> +#include "exec/cpu-common.h"
>  #include "system/address-spaces.h"
>  #include "system/memory.h"
>  #include "system/hvf.h"
> @@ -67,6 +68,8 @@ static void do_hv_vm_protect(hwaddr start, size_t size,
>                           flags & HV_MEMORY_READ  ? 'R' : '-',
>                           flags & HV_MEMORY_WRITE ? 'W' : '-',
>                           flags & HV_MEMORY_EXEC  ? 'X' : '-');
> +    g_assert(!((uintptr_t)start & ~qemu_real_host_page_mask()));
> +    g_assert(!(size & ~qemu_real_host_page_mask()));

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

