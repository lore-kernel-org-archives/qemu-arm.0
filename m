Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBA7CDB46F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 10:23:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbbo2-00025z-G3; Mon, 22 Jun 2026 06:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbbny-00025S-Md
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 06:23:04 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbbnu-0008Ou-V8
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 06:23:00 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-660e9ff0587so2176247d50.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 03:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782123777; cv=none;
 d=google.com; s=arc-20240605;
 b=E0h3m8deSaMUZPGacUao/Va/k/OM31l5egjH2u9hpgW7WquHKs3JVCHUYOpxp7U+pX
 YRb2PoMbZrah5oybRD95fcJoZ9JhCMNFKJkP8qCHZgXLOP7euCZj+aXeBEbDKmX31dLj
 zKZDGSNITJCcBFGX8FTa6pdLnH+3f2M4ocDw792FBO1IXTfI1zh8VAY/mwN0CIhH0lX5
 bQYm/bGr7l9bDHgQv1bACoiKi3Wh5Bv/VE1xjSh/z7HfKKojHVxlPJGMn2RkTada0xiM
 ca2zGTiHY5pOwgajSKsNNv3Pl6bpSaxhBjXaE6g+CkdlOAu2SUo/imEkEMNhKTEpy923
 gEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=k/HUmJlLMvc0aM+WDK4IfrdimbTRflTejHffYN89N5U=;
 fh=fmjscD9+j5RtUqRs5WcpEGki6X4PGNyMAZY1/oT3h7U=;
 b=P5Y1FnJ1DNl1gyYEifyUX9xTEk2vKk4sMZNVlD8EsYUrtbiSuqgvY3uLUXDNnbVVha
 sk/EZBXPeKVsyfZbCoR4GAlDWkHTEsvtiecp6cO6X2iv2xr3csEYGLNohtRCgCEl86G8
 eAtJ0smQXB/t5Rr4IctaBVAjuBfKf83/WDt03tIL7Ibq83A7BWA/E781Q+0r8TzECSWe
 UxWho8WDiU7r0/5mFPTUdvEq2gadhgYjtWYNtBlVYVCY1yuJjVXoDHNDaBshpiMhFh5k
 hdfnKkR2mDa04orNmD7DQFj5GPEe/wXbZwgqbnJikwQ5K+yv+IQiGczOCP15yxj8FO+a
 T3tA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782123777; x=1782728577; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k/HUmJlLMvc0aM+WDK4IfrdimbTRflTejHffYN89N5U=;
 b=Ob0HU2KnArMCDDoQRJ768ArwMSjVahBTkZohQgQMTU9WPpJpm38/f83Sly5IFuc4wT
 3SXVaUEQOZeDSb6eYDDXsQAOBVbMbg9Hnvc88WCLC7Gf4afrd7fGJTmhbIByI9yH5DC/
 NFVvFYynUWegBc36rN6aHI4yCUNW5CwKf79xGs64cw5ou/DJymciOSMvmV3HPJdtxyxD
 J9Imit4mJCsGviVPcLKsjUXSv6NTGVqomK1c7w3hGmQFw8A9fqsJG7X95jfY/bxDx+E8
 4jS9Nuzy1LhLbjTw1gQ33+UteT9anSpvfqsfbZYd2WHlcxkFV/LeE/TyaRiQ5UjmZqb2
 AG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782123777; x=1782728577;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/HUmJlLMvc0aM+WDK4IfrdimbTRflTejHffYN89N5U=;
 b=Vr7U7n01br/AVwsGFk1iplOiNK1RackTSZGEHDtI6teHR8hryUoCko44/7UYtsXNV6
 06tm2DrHkunFLgIrzZTyZ+jZdUhLHyge67egHM0aVvptNaAOo9SJ5rSbXQzzOGsaEG/+
 ewTLO2i7GgzKshW8kXvlh1Bl0KXA1TNTuCadVQXwuUzH9jgAUgipqb32l9i1SO1BuvBl
 OZYD+fKzYmM+shvg7WCauGySqU5E+rE6dMk7A/hByftZUIHaWVG+a+um+lE9/LPcZlSN
 2P5biZlCIobwpyQnBYbL2ZfDZU1eaUjtDAJwmPP/+plBnvtmhOch7HdQo7bpdDiI0L11
 roNA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoYBFIEtwgylKltUZD4SQjLKStZVhWiHaMlbEWH2CbcDWx7bFfkJaF1of5nEl/44G/SEIcUWFzEsQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGCBtU3qQIfDfcDJynRsUjSsBBKhfHLD9nEW9k9H8ZG0VfKfci
 p8zdgRPUzNV4xsYTjYXI3nymJ/nllEiYHMNpJil/hnxnsqaz8pYXLth2k6kFv51D74MAQEIkpkJ
 EJZsOSoRUIGj7p6rpgPA0BlImzBtRPBsRECwH2AQFkA==
X-Gm-Gg: AfdE7claBWai43C1AkGKnzrwnhzFuMqMAPmeCEZsN+YDNnhgqMD3Gl2dS1ubnafD0k2
 A54u0oa+iI4QuGUtRIV0V421eO2FSspwRalHExNBEyBtBo2W3G3p4yq1trG0J98TWHV4N8NkYUC
 ykTtU5BC88PG97784DjcT93bHIGFuVguNfkCWJDesbNNQBOuGknWOheLuDdzey8TO9EMXoC+jKx
 xAI2tmuvli/gc8ZElFUf+YgalRjYSTFbDoodS/JHL2dC9D4TcOiHBxxALtj9wn0wXYTMvC3phZT
 mzzp6NgIWotfDHmiibqTWdQYJzZfHU132vwGA+YwkGAd9bpf4W3fz95EP3ton5ED1b0=
X-Received: by 2002:a05:690e:3cd:b0:660:ffe0:2dfe with SMTP id
 956f58d0204a3-662fc9fcfbbmr9475639d50.37.1782123776661; Mon, 22 Jun 2026
 03:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
 <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
 <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
 <CAMvPwGpzAcDxeqSvQmOjzkQn6T91CAmTO31bNs0wmSMqQKG=Qg@mail.gmail.com>
 <CAMvPwGrnh9-UMv5919bLXLF8oLcyTa=coTdqh+1ALNvCKLmOJQ@mail.gmail.com>
In-Reply-To: <CAMvPwGrnh9-UMv5919bLXLF8oLcyTa=coTdqh+1ALNvCKLmOJQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jun 2026 11:22:45 +0100
X-Gm-Features: AVVi8CeuH3mh7XJlmeOdZH_8nSVPI7iYi8piPpYAqU995iKkIwQkqo8n5iqgam8
Message-ID: <CAFEAcA-Te1aK8J-FPdpudm-3tQW9+kDdYgAa69tYXj2_TyLgVQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Titus Rwantare <titusr@google.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 9 Jun 2026 at 17:00, Titus Rwantare <titusr@google.com> wrote:
>
> oops, the patch series that fixes this needs to be upstreamed.

I see we have a patch that's been submitted:
https://patchew.org/QEMU/20260614222131.5795-1-imaginos32@gmail.com/
that fixes what the #3388 test case is actually running into
(guest writes a 32 byte string to a device register, and so
we lose the NUL terminator and strlen() returns a too-large
value when the guest reads the string value back).

But looking at the code it does also feel to me that there
might be a bug in what the issue report description claimed
it was testing, where the guest triggers multiple
pmbus_send_string() calls without reading back the data,
and the data piles up in the buffer and causes the assertion.

Is the patch series you want to upstream a fix to the "no NUL
terminator" problem, or to the "multiple send_string calls
fill the buffer" problem?

thanks
-- PMM

