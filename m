Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4973527wrs;
        Tue, 27 Aug 2019 02:12:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRa+weoJ2BH2A/aZlENyNOZsPWZAui30RzCuyQDsuq2i5K6p+JkrEpLCH9skMQLNbbLjLi
X-Received: by 2002:aed:3363:: with SMTP id u90mr21668169qtd.7.1566897126771;
        Tue, 27 Aug 2019 02:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566897126; cv=none;
        d=google.com; s=arc-20160816;
        b=jSvbcn68e7la8tMASE/fVcFFS7nCFtUUxBkXHknPn8z9ZE4JQk156pa3CsnVbZv2fY
         VObWL41CXXZvcE/hfmNYQYeIUt7nA/BHYDJJTVyME/rrEE+/ymWl47fn2odDzIO82jP5
         WiYVymhGYFni1l97oPzvLu0PRkjhbOVpCYixeDnSRS7q8Mb1p1+cSr1PyL2S2U9vVxyE
         MuIOxciEDBdalG/bJhk+sBhoO9EO99GSXq681dcnZGe6+9aHhL0s5LVUvZ9n5fzJUhw1
         Gc7hZ7aLMrRW58IBa3xH3CONCThQZxDI+linPdYzFfw81pgk94+BQhLk+nfpVQXmi2mw
         x+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FWadVCtGkitd3Dv/zW+HCQhKM7Ny22eEEI812wgABgo=;
        b=cJnC6IPf8cJzMP5YTcnunDL/xHKvi1BoS0nYHoXoo37+DQMhFpj65Km9xlfivWvc75
         c/ozQGrMa6RBFtNfZ8HkgkVXth1IuTyV+7959yF8E0TcceUdo2QSznqBlrTvThM1y+bX
         +0czBGTitHrersFnnq+MQkoWmH0ZwWP/BoIQXoqivEOnuzeaIZPmK3tYp8fFyHUKu+VG
         9K+gHowCS4H/f4RePlemC1+k4cJPQCrpdDMjyAa/7mgG9pTnVWZfemtaJJJNp9DC8LJM
         0b5WYlxROuEN913tktkYODesoyY7W9bnCcD0Ccc0unEqQxt2tFCnIO1A0vgKj0m/ONYR
         /4dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NLrBtMj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g57si9555207qtg.347.2019.08.27.02.12.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 02:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NLrBtMj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2XWI-0006Sv-7W
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 05:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XW8-0006SX-Dp
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:11:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XW7-0006GL-DS
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:11:56 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38576)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2XW7-0006G5-5x
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:11:55 -0400
Received: by mail-oi1-x244.google.com with SMTP id q8so14099917oij.5
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWadVCtGkitd3Dv/zW+HCQhKM7Ny22eEEI812wgABgo=;
 b=NLrBtMj7ScFsKXVMibluCXulc8tviURpoE3ltGyFXB/nc5I51BTLMYyvQ7BCTqBONU
 ZLqn5NdQUye44pJoE0+1eTtcfQo9bsBywXmxDQnMlDMmbKHYNjWWOErjWbM1dA3rw+Gf
 w5ejrFLrWy/ahDx6CGkzbv8AFKfnf68zb9+KQ6fPSfSfMeb09Gmt6TIUc0o1F2pifQxU
 AgTlYirfNeL44Ugh75WRPm9udIgFf5p/mKA9Au+XazgxIDNtuJJAegbwWbFHMv+137Wi
 +ebcf3UvaGWW3ZyRJVuKL6sI1L8acq4pP4bdRspf5GSX3sXOTrdjzYagX5zJZPyRidhO
 lrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWadVCtGkitd3Dv/zW+HCQhKM7Ny22eEEI812wgABgo=;
 b=bGz/8xDqX+WUGV5fvB0vYHnxS9qa1dxVwUmK0s23zCFVK51mHctb0mYScTq2xnpUVD
 DCL4E423Z2JI8KscWG/VugOmwZNI6JXtrXJFWDiASaQtIHFQb8A+jxUfq7TSw1vDi55W
 x8W7YQanGT8Pk1MdXE9vZ6nVGKsAd+O6Cy0snnHU6g/6HmPvFY8q/Ohu/o9UFScR/13f
 ebh9OedR3Xku941x1HG08lC8+e3jlfrMPFQSeVCkPKZE+R+M7gGQjtZ6xzzxpPQ/+Q6w
 +qTxxMQtSzT5BO2B5IZVFzQ3CDJdpl8OjXpJDaLZmh9p9dXO4lDyFCLbWGPLzjCRf2Nz
 WTYw==
X-Gm-Message-State: APjAAAXkcS1M8FiiLasIhxi7aL3YSdjP3euIFps/wX51j8/zEpsmiUpQ
 vXtS2or81ivhzatc+1Gw0i/iv4/y+UKLSI7wulxr8w==
X-Received: by 2002:aca:4814:: with SMTP id v20mr15524723oia.98.1566897114266; 
 Tue, 27 Aug 2019 02:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-65-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:11:43 +0100
Message-ID: <CAFEAcA_NZzeberjKjdqgbpiqcJhjWXJiC2KWjNAHnWoV07pFnw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 64/68] target/arm: Convert T16,
 load (literal)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0jTlfj0CdQqM

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
