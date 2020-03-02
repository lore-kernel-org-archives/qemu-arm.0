Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2605374lfg;
        Mon, 2 Mar 2020 08:07:02 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvid/sBVDI1eYKsJHpebFfqTANFHM56KhtTLmXDuMGzYz/PWryVzH/17CGTXkia41u8gWDD
X-Received: by 2002:ac8:6f2c:: with SMTP id i12mr400313qtv.145.1583165222641;
        Mon, 02 Mar 2020 08:07:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583165222; cv=none;
        d=google.com; s=arc-20160816;
        b=nWMrI3qEd1nFOh5e+3Mhk0MsVbqcRpWekLMFOf3HxyqRh8TFoHz6uTLbadxwH/RhLF
         l5eDeNIgKSnHy5t2+p7/wSJdzYUoZJNoZjnGYDa+nRM0D6DxsqBEcp6VIV9IGlqVIzOV
         Xrs6a82U6dkYu4lyhlEasboBL9F7G2nMYa7AF/FWv5FgD+u4pzYwLCkPBreNFRAMs0uH
         kmQkEuNWKC2OkBA7uiUrNNe8427CnyQu7AUcbUdlHGCsdbwuu3bAQPAUJfzJpuQb5bkz
         sU5eG/kH+V6sqT6kUseS0h5Aqe8LaVn6C5EDSHOaOKO1Lz/OkfsD4q6A5RzFHJspvu9+
         E72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uwBp1BC/e+YqE2Z+qU+tY2wILWfkCO4jHo1fvAz565Y=;
        b=bg4DNEVZcKcD7Gk1/n4+jw/tSQ25sSSEMGXthMUh1f8linUnp/sCXEnlEUJ0doYOnU
         29RWCDxKAtlhltqu0titN2O9xw6MeKFCJjx5hM2+hsKmoXN5YIH02yMrasTo4m4EquX/
         2LfW9rfebM/LGWm1qWxSLVeCPfp98L6jFNcffRmumQgNzqkeR+/kEIEptwntW77JbnxK
         3mrLw95JS2GBjJYp3wk9K9OfYbrWycYjk6XFvLQjpnBvTueu2NOzER/1MXfvu/BkS5p0
         3VLLykoFt32yNinoil+0JWdaKZij/nYAnqiS5Y6DuK/iXj3M+Vb+2anWoXfBRf+mbWUr
         G6hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i/+R/S4p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p54si5967151qtk.198.2020.03.02.08.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 08:07:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i/+R/S4p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8naw-00007k-28
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 11:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46999)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8nan-00007C-GP
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 11:06:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8nam-0005iv-Gq
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 11:06:53 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8nam-0005hu-B9
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 11:06:52 -0500
Received: by mail-oi1-x244.google.com with SMTP id b18so10828611oie.2
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 08:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uwBp1BC/e+YqE2Z+qU+tY2wILWfkCO4jHo1fvAz565Y=;
 b=i/+R/S4peD+idb/yJGVYpIRlYpyi7QJr+GPvHv7MtOMVOqfAnm26teIG72jTncw2Ay
 16Q/wjLKLyC8aURPZD8a8mQguxOvqpI0+5094lUOOZsNKHcQNEvGW+Tv9vszkfbKhdXU
 hnATSknI12xRtFNY++OwftMMOyhFYns1y0O0f5w5EadTe5DOspl+qV4yhc/yPZ+NXCdo
 ZQvdGCpii7fQciKuxjtRzYSNlcuQ+KxJ+Gf3xcMNQqg9joORH5Yam51xaFus+SMo/1a4
 wRZcCsEVMm/CNz9NGwxhwWfFWsd8/bFMyjRNX3WfA20Wvf539DDjhs+unxr7GBOKX4eB
 AhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uwBp1BC/e+YqE2Z+qU+tY2wILWfkCO4jHo1fvAz565Y=;
 b=AkpRWVeh9k2u/u3iY94PocFgtKAblTaxDYBOYqMDNWurHzkHP3G3syPFnTwHr1U9VL
 /NRO8IAgpAYsRY9gp3vgqDQ3K6QWwuXSFwB8jWenhRUqKM/7XLJDhFWf6Wa0j+ZiMbnJ
 D+yy0XvIxNWzjkw+fCWPYK7g6sonEn0L3mfmQjOfmS57gMIlye0sySZFKT296glsUgJw
 LzCGVArAVBk48ajXFDzt20qgQiN8p29cmmBPIQ8mEToRr7e4LobXTspSEk+czId2Qz+g
 zm8TjXSXyjjkWXDEkm5PHXkiuR7QT/u5+rzJh3AAxwaXYQNvsgZszoJ5xnd+m+U6TK3y
 RLgw==
X-Gm-Message-State: ANhLgQ3jJVEXH9qpu7odhtlHpylUXEHXTOMKtP4um9emImAdDBobsXDI
 bBGKdCbzmZpGJTnGBleYb+NJFHcBF/38AWn3ETOQ0A==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr121936oif.163.1583165211392; 
 Mon, 02 Mar 2020 08:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
In-Reply-To: <20200227220149.6845-1-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 16:06:39 +0000
Message-ID: <CAFEAcA8uEd_RqNi6iQDxZmGaAGpYoy=bgXFJVj-ow0Ci_Vz+DQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] hw/arm/cubieboard: correct CPU type and add
 machine argument checks
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y6p+DBPAWDmU

On Thu, 27 Feb 2020 at 22:01, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> These patches change the Cubieboard machine definition to use the
> correct CPU type, which is ARM Cortex-A8 instead of ARM Cortex-A9.
>
> Additionally, add some sanity checks for the machine input
> arguments in the initialization function.
>
> Niek Linnenbank (4):
>   hw/arm/cubieboard: use ARM Cortex-A8 as the default CPU in machine
>     definition
>   hw/arm/cubieboard: restrict allowed CPU type to ARM Cortex-A8
>   hw/arm/cubieboard: restrict allowed RAM size to 512MiB and 1GiB
>   hw/arm/cubieboard: report error when using unsupported -bios argument


Applied to target-arm.next, thanks. (I tweaked a couple of commit
messages as mentioned in replies to those patches.)

-- PMM
