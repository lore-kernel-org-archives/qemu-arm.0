Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp474197lfg;
        Thu, 13 May 2021 06:03:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDcCzG5JaICHhxFwh0cXg7mlXrPQuHbrFexUmoLl1fKYAgZxU3IhIf+o7FZx8tu6sLL+oZ
X-Received: by 2002:ac2:5b1b:: with SMTP id v27mr28590262lfn.549.1620911039353;
        Thu, 13 May 2021 06:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620911039; cv=none;
        d=google.com; s=arc-20160816;
        b=n9uJBGbU3cT5qcDp4SyIjngJJRvYLjcT9OauTDQnpmtmbpDGB8/OzE+bJe96niKgwt
         w1bjRwyWqrakf6EeN7pCux14LwobSA7f27lqc/RjDF0YECtiYcrNxHevpclvrzb0eR0P
         kyXx3bXpgRl/F+k0VLStUszfLqTPL57gs+5qN1hYts6v0N9yIMudOKhrkEGE3dsEK3DB
         BtjcSazGx5/jPCeIOHHuRiccJNX+RVuMfkklcIy41BViuUn8YTRGvW6P8ABUEt9sm5ar
         gt7fvCFTCm+cipW6+2aIhv+IRhXepeYpUDcr/FjYfUK4vrvNRyTtOyOZHbq25/nM6SKn
         fjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jplbw6F74bu5if+ZTZj8T120Xzd+C2UuwKzdhRRM4Kg=;
        b=ExIlGEuHZ7+jV/SPsI+2FVs0DNi2CO4/m/cnIoxzmH8L1oVI+4JldbbvnRbc+0rcRE
         YHGlkRXjuAizLF161uSht8NynKP3pdIA9ZvqianoqOzAl4cnjDQpSh8H/YmnYxOqsuqO
         o/pbpElkPMuzebtJkBOSBXya/pZbt+xox2AGw+6x3xroTmUSz8rqUFKmh8Qwt7i3nZnd
         zMkvPQg2AVvnoxklK0kNhzFkelwBGxhsjDOzZ9rGBhdWUVsCQB5sow9tbEzKcKfhTreP
         646gbRzNH9n71t8QwOil3WL1YBkhmrIhGrU1JubpznlwoaGvK0BubWpnDs723wIN2ucB
         TtIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p9usuX2S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si3256630ljf.565.2021.05.13.06.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 06:03:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p9usuX2S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhB0P-00026S-61
	for alex.bennee@linaro.org; Thu, 13 May 2021 09:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAyZ-0008Sy-Om
 for qemu-arm@nongnu.org; Thu, 13 May 2021 09:02:04 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAyY-0008KK-3K
 for qemu-arm@nongnu.org; Thu, 13 May 2021 09:02:03 -0400
Received: by mail-ej1-x629.google.com with SMTP id k10so8512401ejj.8
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jplbw6F74bu5if+ZTZj8T120Xzd+C2UuwKzdhRRM4Kg=;
 b=p9usuX2SuFixE6TwaJOsPtQ7AeuYc+AnJfG1bb5xixDmPJW7mGyibEvVboZ5gS3n05
 Q2QpibdWxOwQlt8rOEy7BxXQ6WSMG2R3PaUlYwY1r6MSTH8bmL6/QtRhTrSZA/9/c7QX
 6xESQou3k6Q1ZQC9hhKrTk1lFTrdkLnl6eYHFU3DHr+ENOsdxkPQNEgKiDNTxs7iXAh2
 M3HF9+Wud4D2KtfazdwPpCbNtsgX+A00tg9dfL0rAQ/pmrKyTzsWIr0bwZ0IANvj0z1z
 H1LeS3HwNjN94prg6HlVlLZLyL7y9l2W4HDUUxZYYJPn9kI3QMxj/tSMfBO/VzsZ+6hA
 /fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jplbw6F74bu5if+ZTZj8T120Xzd+C2UuwKzdhRRM4Kg=;
 b=RPyNFWqhSQeMU9FVADziWAVhgFx580yY2Hg93U4GjFWC7Y32oK8vdJbJqSV9Vlhmxr
 UWig8F/l1V4BsULUMz7ev9KfegxBnWfgg11m/Q4Jqho+wLU11AlyIHmfNQ6qBcVZwgTu
 fXDLGRDWy8Vx6i2oCxBoPI1XVBVesO0Kf2OtmE0JRHGkW1loRwVlrdWues+yAN54Ni6H
 92yaw+3/ph8aDQvmlsSW7Jd7PR7DjOi3oGF9dIDyRXLtMgKpXOo+/1cz3SWTlFe1uV3Q
 m5BQjtXiQWEE0Qjcb1ElKPOc3s9VKOs2KEip2oi17Fenb8+QbrAqJl0W+GJwwpgmJEmf
 EnXA==
X-Gm-Message-State: AOAM532hwbxVjyElVWUUDuAzgCOPHD1511H2FpfGx0zzlQjLw10mqZnk
 S9tg2+BL/MLKK2CFB48VuH3v8bpDsAfcoldK1PB0ng==
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr12999110ejb.4.1620910919128; 
 Thu, 13 May 2021 06:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-61-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:01:47 +0100
Message-ID: <CAFEAcA8dgPGQhxtC=x_ntHJP_56h33A2E9SKzWbzgmyff3gF8A@mail.gmail.com>
Subject: Re: [PATCH v6 60/82] target/arm: Implement SVE mixed sign dot product
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: /fcu4oBWnH8N

On Fri, 30 Apr 2021 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  2 ++
>  target/arm/sve.decode      |  4 ++++
>  target/arm/translate-sve.c | 16 ++++++++++++++++
>  target/arm/vec_helper.c    | 18 ++++++++++++++++++
>  4 files changed, 40 insertions(+)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index e4c6458f98..86f938c938 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -612,6 +612,8 @@ DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_usdot_b, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)

This is one of those places where I'd take the long line even if
checkpatch complains,
just to maintain the parallelism with the preceding lines, but wrapping
is fine too.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
