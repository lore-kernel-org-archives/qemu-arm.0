Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp281806wrp;
        Tue, 3 Sep 2019 03:53:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZQO8n6MUbvuw0zyDqsv07dzDe07gWwsLG8klXA9hqeWAt7RJkiLduaRP78hNL+k657Rt9
X-Received: by 2002:ac8:36b0:: with SMTP id a45mr33278906qtc.105.1567508035002;
        Tue, 03 Sep 2019 03:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567508034; cv=none;
        d=google.com; s=arc-20160816;
        b=mb/iVISaA1Rwwlzwzj0zvL+/9obB8X/Va2Nidoo3+R/n5Rv9lliTNXTKHnvQwqqkks
         n2FLk9O2XUNW9WAO0I8DkATJL+dGjAb3ysbS+DyDyBWdQP8nLKiDdV60apev90O9UEK9
         m0vZgicr5TwiT5IeBMkbFXqZkMhUexl4VGld1C5ujtrt04Sli1OP1e70oMbK1tJrsrxm
         J66ossD2k1PyNZG3uWrvXETdud5KOvdJZ0/tT6HDGddeC9fJwv3IcpSs6sDzntXkaDFR
         YT6Xqw/lm9fhegDM4c7YTDwD4qw46uGf7WutVZxA3KW6QYAm5rNi4VcwVIyp1L6xPuk1
         tQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kQkkXusMshIf1V0FOllRy7ZCPcfh/TZbTKGIHoNaEr8=;
        b=g1yqwd/IjrO6tUx3TLwU+GUh0kMBvEd4gkYLIoZdvdr9qJSBHzgH2aslzXvs2Zz8Pl
         MTA3VimO/dVW72kN4f2oxhuD1bP7S3SiQ64qacWjjQfeZoghrXCvfLmAF/YURBJW7lKV
         yQT3YaN3lLH9EjXnpM7dALRg5N2sOXb0X8MgdRJePMbC6LCPRhAgzqoluhCDj7sD1GcO
         6HN/TGGnEZc/5765mBqdEYU2ySBvFMlWADaxly6bEMww+uJVGrJih0cD2Fy5B4t5mI9t
         L3NwpL7so4QH6iRQMfdut47/6QzUwJi0ooAOwetmBAfHGGr6ceuxOdqq3NbORKaRhLba
         ONLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Udze8tA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si11957355qve.122.2019.09.03.03.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 03:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Udze8tA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i56Re-0004Ah-9V
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 06:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i56RB-0004AU-K4
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:53:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i56RA-0007t4-Lq
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:53:25 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39074)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i56RA-0007rA-E9
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:53:24 -0400
Received: by mail-oi1-x243.google.com with SMTP id w144so5412235oia.6
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQkkXusMshIf1V0FOllRy7ZCPcfh/TZbTKGIHoNaEr8=;
 b=Udze8tA+7KlCxwIElf0jBkNngRal1P9HWoSfep2oqL+nZq6QtrSvmAVjBi7MCkZObx
 LeUt71pZWwe40bPQ7EUrUJFUdo7gmqGEGCKjVtBVmvB8oFHDqoCSzZZtoKpkJJwVG5ge
 Yt8dEZuLrPgcvbB2+llHzlBnSNTOrAIlybyKF2c7dkdIdnStC+b4vrvlXJhiDSNwcJdL
 T6NqDmZay9oUY1OHY+JODm5YupZTIf7EspvxPRk3AgKxgcRkS/aP7SizdATnVYSEo/P0
 GVqV2YmcCymonFsBt+pxGuHjJVyb39JyKc/D6e0eBCI15ZPPUJ8LZZ4/X6NyCM/KeiV1
 tvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQkkXusMshIf1V0FOllRy7ZCPcfh/TZbTKGIHoNaEr8=;
 b=P0JdPPHfNDAQSCUuaogGuf1yi1Q4AL0O5wsSEx9eBIayZqgNZzaCDC/vESYjY/UhZa
 RY8OS45f17JRuRbOpcPytK7baGyXALABnj/oCPRVWgoOIqB40T7xq5zBbdWbVW672t7l
 7R3fUw4ZrgXqWIHtAGFfan1X5pB03SJ+RcTr1SNORE/QjofSwGkceX8wLqhcYWF1kb8P
 4Jo8jHBZpfkUAAGTxYdzwdNcPrqrsAQSO9MsMGNNCSdX19TtmY9SD+ymkTuhUcNNAP++
 xef9CW8uw4dJEh+bQIZE5ApLblC1U8wOEa7V6SxbtfK/azScp2+ZV+BkK+SUQk7Hb2Ow
 5+sA==
X-Gm-Message-State: APjAAAXcnKHkPusu3xJTZRFJE1jp/DE8MubBxq6JSrwwg0PxDgE9p9/k
 7bimNZOap2LN6v9Lycnt15WHRg69VuK01PpHj6VHLw==
X-Received: by 2002:aca:50d8:: with SMTP id e207mr10049743oib.48.1567508003417; 
 Tue, 03 Sep 2019 03:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190828190456.30315-1-richard.henderson@linaro.org>
 <20190828190456.30315-23-richard.henderson@linaro.org>
In-Reply-To: <20190828190456.30315-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 11:53:12 +0100
Message-ID: <CAFEAcA-jpR6+zD1EMTL9W92w8Cuf+jfwcxYcJX2S2xQyacd=ww@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v3 22/69] target/arm: Diagnose UNPREDICTABLE
 ldrex/strex cases
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
X-TUID: 8bB8VwJIjUfn

On Wed, 28 Aug 2019 at 20:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
