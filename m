Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F54D39417
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 11:25:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8GAR-0007J2-I6; Thu, 02 Apr 2026 07:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w8GAO-0007Ik-U8
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 07:24:52 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w8GAM-0005O2-AL
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 07:24:52 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6501418152cso721865d50.0
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 04:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775129089; cv=none;
 d=google.com; s=arc-20240605;
 b=lzPvY11AyKRFboicO1IzBhedoF+njBQcBxF2cOlzIMIfwI9aKeByy0leUlnHfirni5
 QIWGw8JwGHaSfSFAxEJDYMEYL8L3jiah9upjOf0wMMAzO5Du5gmxMbLza3++NqvbVifK
 3zmFe+zCYzEorajeMIVZ9EYZ++fYFKylMs+mbco9ou1ZjBaIG4laI1pHAaqvvq+yILnf
 DKzHr814yKqxe6jGQX1hqt6SHN2pcz+sO/3cRz6wxlJI79YEzRuAAlzWpkjsweucJpE1
 1clPWLvnJ5OIP2GQyhwpNXrie9L5hHNe/wG/b1NaMSS+BHkKtwSQAOPKBcyXUezOUdHc
 HdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FqJuxJG4GGYq1FTnE2I1pcY2sBiUEWlfwVpKsK58ymE=;
 fh=wP6qdrkdiGV/gxKfBpruoIUdno1e0sTvns+ZmUE6B74=;
 b=Y63rb34bPWOET5/v0Wpk2wbUvieLLTOaUy3GxWYFMEiX2enQsN6QxHaZ55wSAZ4XXI
 m43l/Itz02I3nUzbiQWZxNSY7lxNAtP89OBUoo6DDlg7+PffOsDBbfh6CdIYhQWJngh2
 jsuP46wsekem7KJPuheA1KI+yOfZKnnEQ0z6HlDK0ShYxet+o0gQYrkHfPwL2fIw0MWJ
 eOmZ3wRTN0PyJLg2+oeZpKyGuf2/u0oLsKsFt9LfJdyHnE+aRjubIu9jU9ZKTbxVmcz/
 goJW9mLjt2lPYGhfmqnEqtwcJr5Th1akvBiFPPiD3FI2GzJkI8ZJC72qD4WK5QA2s2Bv
 KGzg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775129089; x=1775733889; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FqJuxJG4GGYq1FTnE2I1pcY2sBiUEWlfwVpKsK58ymE=;
 b=bRwFZ8Ad0Mqy6PmXdDdoLlkQioihmcwHABkfixlMIm+RAT8UawMhW5zHiaQ4q+uO1l
 Wg62HVtpoSmJiMjHy1wSYYXA/0OxTm9e83RAsMCjA2hPg5lJUS38ViHGg21C/VNS1lWa
 SnDCW1vSZQARilkDnJDsbYTt+5QVbborEYk3KjHEPr384z1d+rfgFFcp3Up5vpmcZqFI
 KA2gjRHLHzQZ4tWpiO/hXS4UQDBHJiiVCGHCGZV9AYdGTVNcWHMdCXsaugUe0Za/ob6s
 g4FEhu6B2GuoxDGc92/5uh9XhS2GePzN3nxG/c8skR0uTRWzFnxZG+B8qvUxADwtH75Y
 2+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775129089; x=1775733889;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqJuxJG4GGYq1FTnE2I1pcY2sBiUEWlfwVpKsK58ymE=;
 b=pJxDxTWzAlGGdOwfQ0ntIVl62GEZULCuYxYue/57VwKTwyNm/twZ6mdUMY070/Z6GE
 b/qhHHgYBb63HEtOerCqILBjXbc929Pbu9WRQRZb8+4mUd67Mh9DN6j3VUVFw5FWh2pg
 ZkB2xsM8iGv1gqsFXFk23F5ZEz4tt42k5c/zA5xI8KO5AgzdgeOCLXPig1+f+CCr9L4R
 z/6JeeqAx28whfhw8Nxfc8LpSSxNTZPh06TXVTTjbTwR3mfW0O/ZLaKNtnO82RAmjLTi
 yPGmPqrb4q9VstvH15c6GLHdCpE5dZh+AQ+gJsvd4sbYuyMrw8Ch/yUBsvVrKe2t69Ye
 +HUQ==
X-Gm-Message-State: AOJu0YwxHAWeKh7fxA42ME9GGrUQF31JBMx4zOZ9ODEldWATbEkG6jWB
 iH4saRUSGHVol5Y3rj0gEQEY4Xj/ya2oh0bLyj0wv5JgkB6JRHLx69WJdbMW2E++guHcUucH27a
 Zz6+V0PM9T+bCboxgSLYbGJk5gkFzNFdILTnyMEr8IpiTwxvUSzp1AMM=
X-Gm-Gg: AeBDieu4v9ztbACFDMnNMt6zCJiPFjGcs6lteJqr4tqdu0eXat70kdG/cFrlv+h4WaS
 C3RZ5MzraKpcwLo51c5RzubFrKinMW4R9mpik6osv+QB2EjqWHk6j3+d/Fc3so0miBeAAQ07HGq
 o4vzduCWj4SvpgYfrpzZky+Bg4617CcSZ/O4EUEsn2+shGC5P+ifhQ2JFclw1fFshfMcfhAJBJQ
 jzy561lQFZsez5qs8v6tV/HeR3ZhanT/yFgaZ3wajmi8p11Rg0JLhl38MG7CATvNcsrggQRZLap
 u4NxQo57IQYUm3zjPcj7XuV/357zydQ5AMeflNBA9uCQ3msGrMTkP5pZKe8eslMYPrE=
X-Received: by 2002:a05:690e:1c1c:b0:650:3656:a6e7 with SMTP id
 956f58d0204a3-6503656ae5amr4760068d50.31.1775129089046; Thu, 02 Apr 2026
 04:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260402071718.130490-1-zhaoguohan@kylinos.cn>
In-Reply-To: <20260402071718.130490-1-zhaoguohan@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Apr 2026 12:24:37 +0100
X-Gm-Features: AQROBzBDHbEElTLiTFr4KhUBYpKgeF67HZ-7n3mbqRXDPjwa1LWTiMr8gKE1hhM
Message-ID: <CAFEAcA_QQ_Hx0_Q5P7-Hne6sJvQoss-RLh9=OzmPZ3m-LqcGYw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/omap_sx1: map CS3 at the correct base
To: zhaoguohan@kylinos.cn
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Thu, 2 Apr 2026 at 08:17, <zhaoguohan@kylinos.cn> wrote:
>
> From: GuoHan Zhao <zhaoguohan@kylinos.cn>
>
> omap_sx1 wires the "sx1.cs3" region to OMAP_CS2_BASE instead of
> OMAP_CS3_BASE.
>
> That places both CS2 and CS3 at the same address and leaves the real
> CS3 window unmapped. Point the CS3 region at OMAP_CS3_BASE so the
> static chip-select layout matches the OMAP address definitions.
>
> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>

Hi; please can you send patches to qemu-devel@nongnu.org
(and cc qemu-arm): not all developers read the qemu-arm list,
and the automated patch tooling doesn't handle it.

PS: this is obviously a bug, but why are you looking at the
OMAP code? It's pretty ancient...

thanks
-- PMM

