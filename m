Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9108C88E5C
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 11:21:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6nh6-0004re-30; Wed, 16 Sep 2026 07:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6nh2-0004qo-Vy
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 07:20:49 -0400
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6nh1-0008Uv-2R
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 07:20:48 -0400
Received: by mail-yx2-x0f.google.com with SMTP id
 00721157ae682-85d43db0c29so6111247b3.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 04:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789557645; cv=none;
 d=google.com; s=arc-20260327;
 b=HVa1j9Vnm+8AoW2CB0KEhdsjMqovx/6BXzk4LmmVwaiii9I6Seg4goqNuEnQHMl37/
 W40SUjPhvz+6sLnvBhj4joTp4INUOHhwdOZPrURcdtkF6lTq8TMRbGzsFEAX2pXgLBov
 Q8jp8+yMV/FQOcNU07XbZeWSbdW3OaisieIfEAjn8g8YouBvThq9sFDrvrLwF4TK8oeu
 h2ZN5XO1mOrXK6fNs6hUEHIcaC5Pnt10BQIHSa0OUupWcx/WJfyN9JaTJk2rufGe/hvd
 vYjo/UwBYTEk6leCHK62pHEzTSDjieP+Kh1UHVtWhbxrJyQ6ZwvOUoHMDF1EvtL9+1TG
 53LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aRgVgjOFsh5/uu7F/9NUKjsFy7qIQcVbVGDCxF6g9zM=;
 fh=B5tBjy+aY8vD4n+0N/6k7nNjVbozhwtvDPDZahGUnIw=;
 b=lQrCh/UUNBabmgcZhQjk5SYUjDj980q2qh5V3l/ODA+PERjoL+YVg8gFqPhuCTMI3x
 hzThSC56r49l6XuWQsUD4hKGwV8KcKXv++9v86E/ndDQIgl7dbuDX2GmMQrSB/akMvOy
 G3EPmNfI+APJ0nxqVnKIpFl2QzFi6Aq+pd/b3H6sGmm32R8lcMsfK3zJaaR7Gt1V5nPe
 FbYA3+wgjnWmcPjYhTiNRrE9HHr4RorsHaxw4CajIBTaF+9hDr2DmXCsMMLbnanv9up7
 KTXRCeL3Ozp3xf930fZH1jL7z0l8L7vrx1WhnnONFLwRR6EJ94OcvtSj3Pc5YZi0zEjt
 I9wQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789557645; x=1790162445; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=aRgVgjOFsh5/uu7F/9NUKjsFy7qIQcVbVGDCxF6g9zM=;
 b=rIMVrHqE17sr6jiSMT//bFsi0FVGFPppOS9nOjpgVO6d8i51MlPZ0tFaNG1mxn5zA/
 hYXigox24i/iyMqnCmC+K1eGanI8q8+FBIgWFyRfPWFt0cHrJKePGeWzRbOWAR+uPuoW
 vAqLAi024I8oRXHdcBQ6q3xmVLTZQ4A5yxbRdpS2sLrEQ8xQNNLwTNM3Fki0yJMnOWZK
 VGGKZZzwBAOM2BpcA+pUmcbJUfYc4svs6unbfCt083F5ISg9cUveVXfgD0su3CW8VphP
 aKms1KPND5+2EneRDiBJcDwvN2/rFjEWj+O6td04szhvPHjq7MSiKkrmRvJUmHktD16x
 HIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789557645; x=1790162445;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=aRgVgjOFsh5/uu7F/9NUKjsFy7qIQcVbVGDCxF6g9zM=;
 b=HL7CXq/O1oTpQtezAExtjGsixgQjsC3FQ1xSQnZ8s0ElGBIiYnmea4gFHwpIubuy2m
 hD9OeBQjQ5wXj7oH0CmyCAlFmbcWrmfHK1n+9l/9TPhHZnm9MeYod76kqyNcshHOm3CB
 Iw4AiFMrJizdE9DY9g0QYWtABgQGdgbBzPb2dn0pdTYANXw97dctHJhoaAL7IXiKnCef
 pbymVNs0VopqYb2Nb2hg+MGLqob+LZALzDdPyNinrKNBQYTx77G8zPZw7ywVLnxpOMPT
 wUE7RyELw9KGK4IUN8pawPmwPTFQa3X2tZwLnjh0vRFYh5W3VfCLvDz1jpYBB3cWhx5p
 d41A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKmYgmsY8QJzaFKe1MG8c7jrrTSWt1ZdZBePTsaouY9/VZAqk9/TamjeUCOmFOgKu8ht+Jm3PibA==@nongnu.org
X-Gm-Message-State: AFuF++maD+k2FsX/ek0Z4RlzCCYsCqFq2lVwxi489skAz6dyEj37cqyK
 hgBjvkJ0gpf96IikVDtDMjUn5A/Vn0nhfn5Zt5Hy35VvgKL08nxC1NZ51//bSc1u3zQyVYly60m
 xOQ3atLE0vFGdZ43mphO5Cwd+wCKLIPFS2jK7mGXlpQ==
X-Gm-Gg: AYBFou2vJQROAtGcQcWhphNl4kOK+bqyVIZFYOGVjiYiGOs9zSO1LSvICSVIZvH7Tox
 Nv6pJJkydAbypZQHoiKXkLmpA/p0hx5rC70CaTM1LjnYSF96iYvsyZ2OQDLJthPGCkNyDNaGzPF
 JSyxvJeOfEcY6jct+Rqh4KsylI3q07Av9gcBNLal/s6fQeY+7Zg0FHIu3YV7AB/23I8xVHyeyH0
 fudxM0NpCtn2EUTysl4A7MRnx0p659xA98tZ/tLjjL+r/MifSbgZf6PCt5gnA81JI4h9XmY1v1H
 /Z5YmQKM/b/BGkYmQkfPtKiQvH7wWVwk/r8WMR0jHK3L6bWqW6mrztjbvavDpUCZAsEhHxbe/lP
 JiNFv74M3GdzNh96DFcRB/n4K6adWXbAvzwUYrXw6rjEIp+hm5w==
X-Received: by 2002:a05:690e:806:20b0:66f:c1bc:4091 with SMTP id
 956f58d0204a3-671632efa5dmr421632d50.84.1789557645604; Wed, 16 Sep 2026
 04:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260916100021.73825-1-mohamed@unpredictable.fr>
 <20260916100021.73825-7-mohamed@unpredictable.fr>
In-Reply-To: <20260916100021.73825-7-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Sep 2026 12:20:33 +0100
X-Gm-Features: AcwNN1WbDPC4zWhoTX8SZTF9QBFaMBagXwI6VYb1ZyKkLYdHhm8DkSczai9lXUQ
Message-ID: <CAFEAcA_T1Ka5M=40LYKXD1nwnEefYbjx5mG=OfWuDqwFkMcdYA@mail.gmail.com>
Subject: Re: [RFC PATCH v8 06/10] hw/vmapple: aes: convert MAX_LEN to a #define
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wed, 16 Sept 2026 at 11:00, Mohamed Mediouni
<mohamed@unpredictable.fr> wrote:
>
> Working around this compiler warning:
>
> ../hw/vmapple/aes.c:257:14: warning: variable length array folded to constant array as an extension [-Wgnu-folding-constant]
>   257 |     char hex[MAX_LEN * 2 + 1] = "";
>       |              ^~~~~~~~~~~~~~~
> 1 warning generated.

I'm surprised this wasn't already caught by our '-Wvla' setting:
we don't want to have variable length arrays at all.

> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  hw/vmapple/aes.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/vmapple/aes.c b/hw/vmapple/aes.c
> index 553e688adb..9d062d5a7f 100644
> --- a/hw/vmapple/aes.c
> +++ b/hw/vmapple/aes.c
> @@ -253,7 +253,7 @@ static bool cmd_iv(AESState *s)
>
>  static void dump_data(const char *desc, const void *p, size_t len)
>  {
> -    static const size_t MAX_LEN = 0x1000;
> +#define MAX_LEN  0x1000
>      char hex[MAX_LEN * 2 + 1] = "";
>
>      if (len > MAX_LEN) {
> @@ -262,6 +262,7 @@ static void dump_data(const char *desc, const void *p, size_t len)
>
>      qemu_hexdump_to_buffer(hex, sizeof(hex), p, len);
>      trace_aes_dump_data(desc, hex);
> +#undef MAX_LEN
>  }

MAX_LEN is an awkwardly generic name. I would define it outside
the function, something like

/* Maximum amount of AES data to dump in trace events */
#define MAX_AES_DUMP_DATA_LEN 0x1000

Then you don't need to #undef it as there's no risk of a clash.

(Really this function ought not to do the binary-to-hex
conversion of all the data unless the trace event is actually
enabled, which docs/devel/tracing.rst says you can do, and
it would maybe be nice to emit at least some truncated data
in the "more than 1K of data" case, but let's stick to fixing
the compile issues for the moment.)

thanks
-- PMM

