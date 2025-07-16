Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65210C83F1B
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Jul 2025 18:15:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uc6ed-0004ik-Uc; Wed, 16 Jul 2025 14:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uc6d6-0003uy-1V
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 14:13:27 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uc6d3-0007vw-9j
 for qemu-arm@nongnu.org; Wed, 16 Jul 2025 14:13:19 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-5373b62bdb4so1310297e0c.1
 for <qemu-arm@nongnu.org>; Wed, 16 Jul 2025 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752689596; x=1753294396; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cjFqfHyGl+l2DeX2nCvra4CnmLYud68pFPe96jjv6Y8=;
 b=t3oPuBSoA3CAFEfDdvNqEwQTuTh7txy4KmPa3wpjFgk35z3zzXnrc9SpNb3c33GpV4
 VScW66Y7zivih1admv27mXOebmE4iTF8OBKaA+2iRGRFGaD0ryGILn8o94FHuasG4QuR
 lMWPffFLUqAOBLIuR29IIUnAWqVBNxYOYTR0YuMCviaPoAuetQfW8rmLry+6Fvtb8lhq
 TR89S3tPtUNW7rFUOBjW/6JudkyUXKUUrjyc8iRYA4I1WGhE66mgjBBRFuMptprnclT2
 o22Gu6w9dq5lNIEBxUt5lXPpE9iZmBqY32Pot9XaEFBnFGtd0Xv+I3UGO5Jz8noYItHk
 nnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752689596; x=1753294396;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cjFqfHyGl+l2DeX2nCvra4CnmLYud68pFPe96jjv6Y8=;
 b=DKMrksYPAZTGfc/2y7m+IXyayv+XChNRfMmuFWzK3risu2sSAD+tdOcjzJVdCRo+R9
 prTD08wzzAZw0/fTCYZFXOC7utLI/Afi7G8l8dEqgPRMMpo1ZnbwRaSch0qtj+uuCMNS
 X55/zNresPXKE41pyv/0dCtKzrTZVwDgv4rULB2nfriZOZ3yUDG2OkC3NXVbHHIYfOMi
 SmYNlEiY/GGg37RwJoJd0qyXy32TWBLUlUIseVg4c44JxUdWP2hHjgedjPmKNd1ESVad
 uTKmUjPqR8i24whnB+dYf/gBR5/+l8Ct937kf44knALmGy6iWrygqN6xVCKFSUIo3cLE
 l5Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvg9g3tN1LFFZNa0OgX+NH1XTVhjWRclGIaXkM6aEEkJtvimNCbi/0yusKLjNuycxTmzXfxSnX/Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz74TfU8rLRH+S6FM2lpUZv+XUMmES9bv7qFyqWxNPYVFIc21fh
 NMm+fgu3HNNGzwrdvr5sbIQqkZdgroqnsNK2DNVLG/JuRLMAuFjU7oLRHiDFK8rsaQ3kC8EMN7l
 2axHfhwob5quxj13/gax2eLCjr18bUhKUCswDXU0M2Q==
X-Gm-Gg: ASbGncv9Aw1mixPyo+rF1W71Oxr8T2LgZBRXART4l8+arHMyxHdFRR0Um1ko9fVgh2G
 bsCVpbyv3eDeNoiRGJhlXu0B8gq0EP/oyNIHH/HU65QQCiCHe1HV9hNKNSV7AW4sE7jtDo/xp3N
 po0JjxZr+7gNHnk/uBvUbj75lktJKgw6rp+WBTGkNUHlQ3ZGTaAYOqHHklKj/yYmmtXgskWL2Df
 fg7A00=
X-Google-Smtp-Source: AGHT+IG888u3KDeZ/hn+COj8WVG4qKdOz7Mv0i6RscFCABSPiwRFCOB/AGuGvpxxNk5WURHndZBsuOVS/O870eUXD9E=
X-Received: by 2002:a05:6122:2896:b0:520:4806:a422 with SMTP id
 71dfb90a1353d-5374dde2768mr335456e0c.3.1752689595611; Wed, 16 Jul 2025
 11:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250715212335.2215509-1-pierrick.bouvier@linaro.org>
 <52c5ed4a-0225-4360-b1c8-e3866041c4b3@linaro.org>
 <1de7b0a3-846b-4e7b-b4a7-1b753f61ad0f@linaro.org>
In-Reply-To: <1de7b0a3-846b-4e7b-b4a7-1b753f61ad0f@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Wed, 16 Jul 2025 12:13:04 -0600
X-Gm-Features: Ac12FXxyn71ofdPfjAAV5ECKeXYPmgj6FFRSBA8wjgd-HhYwIAZBnq5cBWHe1EU
Message-ID: <CAFXwXrn3oUHeo=h2OZshZj3C24bf=tY6Mdz+rDX4YO0MAk70xQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] aarch64: update test images with new trusted firmware
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, jean-philippe@linaro.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Gustavo Bueno Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bf923f063a0fd863"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2c.google.com
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

--000000000000bf923f063a0fd863
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 July 2025, 10:50 Pierrick Bouvier, <pierrick.bouvier@linaro.org>
wrote:

> Do you plan to merge FEAT_MEC for 10.1, or prefer to wait for 10.2?
>

We have missed the soft freeze window. It must wait for 10.2 now.


r~

>

--000000000000bf923f063a0fd863
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">On Wed, 16 July 2025, 10:50 Pierrick Bo=
uvier, &lt;<a href=3D"mailto:pierrick.bouvier@linaro.org">pierrick.bouvier@=
linaro.org</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_contai=
ner" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
Do you plan to merge FEAT_MEC for 10.1, or prefer to wait for 10.2?<br></bl=
ockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">We have missed=
 the soft freeze window. It must wait for 10.2 now.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">r~</div><div class=
=3D"gmail_quote gmail_quote_container" dir=3D"auto"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"></blockquote></div></div>

--000000000000bf923f063a0fd863--

