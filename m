Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D4CCCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:16:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDLC6-0001rl-EN; Mon, 27 Oct 2025 07:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDLBd-0000bF-1a
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:14:55 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDLBR-00089V-Cl
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:14:52 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-63cf0df1abbso4982729d50.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563668; x=1762168468; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pskZw5DLpP/xDMQMjw31wbkLr9mwhPCBWcUw9JjqcWk=;
 b=sOxCcdL9XTSd1RA6F2/mf2kEgwEaV/Kas8hM2inPNFCyLQgt2kltikoOKV530BQgDM
 o5G5VlEPWmgtgtw68V7qE3POtd4vPOoVb5CoyXQ6XpGE1ejrsc+xWp1MhLNbrCkJWfms
 R3r2ezQaIgnvgxnke1PlZD7Hco5uMZEPWw+y75ALqwl+zJX2ZBKUH/aCzqytsy1sTcN0
 +LAXg43bqhwO3UByGpeTg35CuAyG/dj6nuSm8s9B9/QeM5APZvTb5+58UG3SaqC0qssL
 UIf5zmD9g3rMioBnsrD8baHdyYjD6pv0KemA63qYsLZO1D3koxWEOcm/sIUQibFx64c5
 TeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563668; x=1762168468;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pskZw5DLpP/xDMQMjw31wbkLr9mwhPCBWcUw9JjqcWk=;
 b=fYBdh/Ct4LNeUThhqxA+zTEVFxlFlwGn9WYydr0m0QjOoxnw39/2bZdWdQw2rQgKq2
 eunZLc0ghEHRWM8CvMsluBcvydcOmvl67j+Gezc+0WH7N704RuMSdT7WuREF/bXtrA7n
 ZWAM81aC8bszaf4ERWc7Ah+ZBTaaV1i5c86P1QW5Kxa8xHW0jbC1p0viCd/0zvCzJ0YC
 aLw2qqmHM3N+K3TPTBwb6FVox+CtvvKL7XpTdBrqu1pfTs2UFh2rcP/gH6mmK/mw7lEr
 N8JQxeOcfxmtALp8kYP+ABRH2mZaOl9cUCJ6MtfZE5QLLlQU7k87p1ofWTIhDDsPuc4w
 A5Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt+TtsqWZwPRToQI0DCeJOINTp4VC0F8W3ARsPctYVDM9yS2kipoKnBxDlcOUaDIvrlDN66COixQ==@nongnu.org
X-Gm-Message-State: AOJu0YxSMvQuCF+S+KG8mvavxVgutcfuk4Izh7sn6xzZcv/5Jbrp/sZi
 jptaExjXKeOMpL7vRwSMwpzir6eb2I1uA0drSGzvFOCn3I6FiToFoxMSOSpmIbgsA0ijGtu8c5O
 dw+mPWm9aRV+eAiQOBgI9C/RPDHGnEgnbv29yQuzTG8AIWux4ryS7
X-Gm-Gg: ASbGncuhPMbQX/rI/KPZRLnYig3H9XLqaEE1IIXkURtfsvky3rmQhL57czPnlko2dcC
 /pDIpDOqkuVSnw8rCJbcCdDfY6mkHGLGAOGFQC22c+lJfVuWHIXwrDHel/VAsuObnYO+xqkg6Hf
 iIcqLYY4W+RbguwXUyEd6yLJsGuCcJ1qqK/LO8vSGBx7mS7/hmDumNfvZ8h4oUp69xt/EpajXHk
 0tGh6xb8Z50PzSUNjTYZOhnJJ2nTCafGBJ/m2tJVqSm6ZeKnEIl/N6qiGCcHw==
X-Google-Smtp-Source: AGHT+IGWME6nkNKfaH+Bbk6rsG35FBrEEilNG8kWH1HP6RTwHfHFiNDFyG05H20xRMwXzcHLFqSud9l4o941jY3upDM=
X-Received: by 2002:a05:690e:419b:b0:63e:1c4c:302b with SMTP id
 956f58d0204a3-63f378c4e53mr12969017d50.47.1761563667703; Mon, 27 Oct 2025
 04:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251021145313.4584-1-philmd@linaro.org>
In-Reply-To: <20251021145313.4584-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Oct 2025 11:14:15 +0000
X-Gm-Features: AWmQ_bkH_jL3DWOvxchR7RvXqEKF12Utam3dMdEF2ldn_SnlYqpl2of3h2vWnqk
Message-ID: <CAFEAcA9D+zHH_+UQDPc-GqSH-b8NC9VvoXXJwhOxT8Mtry08Mg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/gpio/pl061: Declare pullups/pulldowns as 8-bit types
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
Content-Type: multipart/alternative; boundary="000000000000a9b7210642220007"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--000000000000a9b7210642220007
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Oct 2025 at 15:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g>
wrote:
>
> uint8_t is good enough to hold a property "between 0 and 0xff".
>
> Define pullups/pulldowns properties using DEFINE_PROP_UINT8()
> macro, remove unnecessary range checks in pl061_realize().
> Update the two caller sites.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> v2: qdev_prop_set_uint32 -> qdev_prop_set_uint8 in callers (Peter)



Applied to target-arm.next, thanks.

-- PMM

--000000000000a9b7210642220007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, 21 Oct 2025 at 15:53, Philippe Mathieu-Dau=
d=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; =
wrote:<br>&gt;<br>&gt; uint8_t is good enough to hold a property &quot;betw=
een 0 and 0xff&quot;.<br>&gt;<br>&gt; Define pullups/pulldowns properties u=
sing DEFINE_PROP_UINT8()<br>&gt; macro, remove unnecessary range checks in =
pl061_realize().<br>&gt; Update the two caller sites.<br>&gt;<br>&gt; Signe=
d-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.o=
rg">philmd@linaro.org</a>&gt;<br>&gt; ---<br><div>&gt; v2: qdev_prop_set_ui=
nt32 -&gt; qdev_prop_set_uint8 in callers (Peter)</div><div><br></div><div>=
<br>
<br>
Applied to target-arm.next, thanks.<br>
<br>
-- PMM<br>
<br></div></div>

--000000000000a9b7210642220007--

