Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C1810AB830
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:17:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w67zx-0004BY-Cl; Fri, 27 Mar 2026 10:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67zj-00041o-Vq
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:17:11 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w67zi-00071Q-3I
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:17:03 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64eb84d1e37so1852761d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621020; cv=none;
 d=google.com; s=arc-20240605;
 b=Ss0IPtH4j+2GknSECaartLErfX3Xs3x6QMA8ZfiIM3iSLea1JDVTYt+OIASqL0xquU
 aAa7Z43cBi2pFbRIgWOvkZmKlTJ+HK3s7TrfcrtUEBtTBfk/6ffYDeWVOmZdmFzzvIoE
 hOtiCbYInJaHhA0RwUhl6MMuKJl5ulJ+FkZWhXN+bJKZ5PuFf9uzK6AViRvtdiTFs/qd
 zc9sc7iRJ0fB6ToU4ArILP3PD0+l12pXQNmCaWSzB2miQytvynZm/pb7XpSj67ktXono
 LER47C/EtHDX4pSW4Jj0uLI17ygTP4JiCg7PteRiSFNADYlxg2VMpPfu8q0BiDYPAjIg
 L05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 fh=WW3wOPHf9Ybhdn5MqXm5clS447ygSAC9Hpkl9bzfdOQ=;
 b=gCti5J7xZ73ryj4/EEFxaQ+Vh1sBkEpYna5CE2g8RjobmR3pTlAd12SksxRy+fclLe
 3+5GvSMaQpurw8HlwvAWQTUEJ/wlUoRvoaaYlGzGui9xRrRVFiP05g+E8zyMI0xF8fwU
 ayMc+Ak0NAKizrv2cDM+b/jHrcC5HrfRlIKA6n3XTcwAd2D9StIvo036+26fpMmPdkpu
 npSZ3VaoRYXiJJhZ8vUv0XmSw3SMkHXMdWBFvKZtFjKaw+HShHtsvF6DnTGM+yyC1NHW
 EjKKN8NcbA5I+QBGM7v9y3GaqIzMTBP/AKxJGPgTC677j9ISZ8f+fNynQJ9Qi3bB24LP
 nGfw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774621020; x=1775225820; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 b=QWxbEsIKfgQWdXsfp4PfkcB44g/WYBIJMkaePaGl5nCbn8iDhpjAomKxB/aayHSIzQ
 Nnz1+8Xp8+0rkct59q0VOeR1mybTrZTNCOSgtnmSIVbVSW8H8fz3kndFo1zbgDH2R7No
 SxJ1e0JST2mCf0hhs2Vb8hVxiexqtMo47LX9FNm4r1rC7FZo8DA0n5nFQv64iDQdIHl6
 xCsX5zYUdsmc7adwgr2qgONJRWByOCYIO5J8l0X2/y4XMCVhKAEksgcovga7ksNDQEUE
 ROpoAD70m9WIqB/2RDYN0Jsz4Jy0a1R6EvN1TMMJasLCRhJlJ0jg9VB+mIFNgcpKNScY
 M92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774621020; x=1775225820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHqKNwchX9pcFRNbqu4Pgrl3e/KIoiPTpQ/JU0j/py4=;
 b=tUVdMFQCU7doZg0bbt3vnGWgXGQ9bd8ZxQhjrXn2/RfdJe0r4CW43ZCg6tqo87Ww36
 6UOe/lhyzg5rgfkbCSNGk3tJrkcaWyl5VLhH6auqDhf6mzgyJ8DxlNH+bEEdLIaIx8aL
 sqh5cuZiDRQjB/0u0B36Wy33uwaFyQgfCRXK82YNNGnOftXglpjRlUQGjDbMgi6iVRCc
 0YtElGmlZ/MqoPG9O/eZ6qvGuPe+SEH7FNzrItNmzy9MnO4cAXXqU0g8AtkWT4TCzMOj
 1H3E7UePNzYFqxKyKT0bsRvcIY+EJ5IMrbgihNIewEkIW1wzE41XXWO8OXTelJD7kuJM
 HP7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdHZ8RnA50acf8jvMKyq7dH1jpQkhlUIQ4VVlKUfpMoCKMbLUNyRICt3znvSafRWJv1TMGrVBf8Q==@nongnu.org
X-Gm-Message-State: AOJu0YyZmI90HiZcqotO7O0kB7kmssT9mEH6IkePr9xpJG98/kEYPnYi
 V7YZhjEE4kZXyQijX++15PEUIeYn0hkjXQ0c0PlF2bifMzhOTlty8ge9QzgOPqO95jfycTxxgPb
 XEEORY7SMeGJ1cPDWisQspSKIHe2rR6r4oZfOLs4eaA==
X-Gm-Gg: ATEYQzzj6/w3UwNfGUkODy9QL9wArQ1mQVW/Tzy+F4m6CotD3njbB8Jjw65u3yynPnb
 IFNKS6oG2qMd/nyT1ybrdzXPUAFZl4Lz1cAz08iHHNz+bPE9mQ60/w+uWhvN+UIGb1oojYxAUlW
 qUKOlI16aqb29pKdQh86PSRUG04nrul1QYhqBNpInnmBzvqBXpCYJr2zscpDTV/QI1cDJWQu+Ow
 X/+pwPOydQataLmTLYDQGrUIhT5eX+neroGmyDxMgLNJ+8CSQb0JfU9eSR/Z8fg9PoCY21/d048
 ACpILaffuC1ZBnFoQuAylEGvyOBP3MCgCzFNTm5vWGmvt7p+bD/CH+R5+034dB4IhP4=
X-Received: by 2002:a53:d044:0:10b0:64f:eef6:d0d8 with SMTP id
 956f58d0204a3-64ff73cb7fbmr2189544d50.50.1774621020394; Fri, 27 Mar 2026
 07:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-9-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-9-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:16:48 +0000
X-Gm-Features: AQROBzCx_TpmN_iQdg9I4DMWr0nbkXMk-IwFbnaKbQfcHiWDnsRxVjwQg32y-do
Message-ID: <CAFEAcA8PU+TR3zKCWSD5UbD02Z4rK_cEpKSttKFOeXzrau-b8g@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] target/ppc: Use glib2 instead of
 strcasecmp/strncasecmp
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Fri, 27 Mar 2026 at 13:45, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

