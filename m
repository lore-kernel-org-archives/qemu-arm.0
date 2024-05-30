Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp252932ejk;
        Thu, 30 May 2024 07:12:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVngpA0DVSKHe2zAhCn8zJ8OQJIcV39/lEx/v1yxyJucKeJE/dYjSwPGvcGYBuTr2l8GaZnvslDItex2K3dYswXJhqpgeMi
X-Google-Smtp-Source: AGHT+IHKuG4SH5vurRmV2w5i4HdpIsVCONSEdDmarUFTHkPGOkjPWKHJLtdfchzgM8aPFJvbcTOC
X-Received: by 2002:ac8:5a93:0:b0:43d:f58a:16d2 with SMTP id d75a77b69052e-43fe930bd0fmr27719771cf.50.1717078349873;
        Thu, 30 May 2024 07:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717078349; cv=none;
        d=google.com; s=arc-20160816;
        b=RTAza1hlkPSWy1f/cxpcd+MbQdUJlTPKB/zMGdODmIrnR0iFCkLpC0pvV/x0zmjBeV
         6Kt5ZPo7nE16HgfxnD7s5y2qnueXP4W7gIuUL5+5p4OHXKMhDHm5C5rQVMxmoMGGO1lh
         EWAOPWz4IIBR7ZrSL0CvOWEJK8IGoSZSv0n/80dhfMjCykwjsvqv16uT5LCve8LMBDoj
         SGJ3WMcxftRA9b6oMxeUvurl5MPwUPSnDKg6MKyGPdvgBEhyUnylub7n9WwOmnHy/TsU
         vF+pLN4xbPOxgQEYS0livh6wjfy2PZdD9lhZAVs+P3ImAvjKbb6DklGXo4Rxt78o2LBB
         PADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NBF/ZzD2mBBt5E4hV3YGQ8ZwzIuykJuZ8dgGkE0ISxw=;
        fh=01MweJnZ9UL5jFYgv/LmYr7UTkizsk0N2VYLS5WU11w=;
        b=xJSZFOhcHI6PxpBGKAElhXm6hITRMyhAs0+cuVukStiS2b8bakYAdBt8TLxiZ05yHj
         tXNket81IVjE6Tl09ZWWFfQ28VtV3zgZfAhu+c/Jn+HeU88OwwewFEAcj0KD6VGDENbe
         Dbf1MgkPXiY1JLMt9xdIA91XYhbhdgKnPNpcdPT9z/PjmwzHv05Ut5dCMtu89n8637+8
         6vKMQmiympyRNv7mWpK7L2Qw0CGbFDEfUR9M/70GqVXlcecHQhu8gvyrscFF14z/qsW6
         TWQeLfXPYgqhysiAaVMby1E1cZAXwfbWAyE0HN+UfXTiDjVNJoLTYli/OOZCuSDaAJun
         xZdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThXaFcGo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18a6c7esi143869941cf.279.2024.05.30.07.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 07:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThXaFcGo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCgW0-0000zu-Rz; Thu, 30 May 2024 10:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgVy-0000yq-Md
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:12:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgVx-0001u8-69
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:12:22 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35dc36b107fso930008f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717078338; x=1717683138; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NBF/ZzD2mBBt5E4hV3YGQ8ZwzIuykJuZ8dgGkE0ISxw=;
 b=ThXaFcGo/dVJYE04DpaX4dj3+xTnhef4R8LrawF/ea3JQFf9GR2Fs2L+XWj0EdJ4wB
 sh1P6ExV4hd+fwQEKNyxcitHZrydZklAII1dFgnovL2RVKQAbki8miPhT3ffh3tbiv3t
 sAh3hrCyK/lsYCS8jj7P19KLGNgfYUjAA6HvSOM1nt36ixH3thTLw0Dxy4ECCuncoFKv
 oauDyJLKzsBfwT97cxbHF9pbM/fCDuPJcES5+7BwrDer7+4KvSzRKSxRj9PYa7BtGey+
 JF0D0V82NZ6X3JcnkAOquycZMp+T99a8xQB6gGr53Z+8s23pjP8gICLKAA4nCaRVwEhi
 wvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078338; x=1717683138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NBF/ZzD2mBBt5E4hV3YGQ8ZwzIuykJuZ8dgGkE0ISxw=;
 b=nRk1x5MTKOo55KU0/qtvqTA3l2hziCIo0jnI+U+CIA2buZJuzuePF1IueZRUwLUvac
 rHymcWazvGVLeJ/Do/KdX+opk/X+TA6hY8syM4vGudPbF0+Fiq0U/7kgla0xbw4faAK4
 HbdLRsUpVdvcXkCv1sGYoIuo2Z92tWnvJGcql+/C4NYhuy6LDvVjC9eLv9cmr+AME3bp
 fzScDSPxF/UsDnsa5msdcw3xq6EML1K0GWv4jnHquM6JX9ox5P0YxaLrmUGZVOjNt5L/
 ZnqDPtb03+UWtzoC3R9ErGwO2l+/OrYviU2LYyGmo91N7JcXFsHhrceIcCAvQnJsRIhr
 7GiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW75zfdpuVdUHszXiuVMwonEzuhfjalVZdnGosqlx4rvAra/Ez6MwckFliRCxdbdlFqYUTtHqJ+3lrPub2AhPvUFfW4
X-Gm-Message-State: AOJu0Ywtz/Ud1vvHvMv4ScwC4c+tMQqj8vW+kp7/XPJL6/833EMizubm
 9OQEOMAcvJf1zpUexJpZoXy9TyUzhPCeA6XjUXN0EA8ZlZqRkAzlo7g8Ydys+uGAu3xSUnkTARK
 7gFK2SCluriTAft2xNaqDZaLxl1N4LocLeUSRUg==
X-Received: by 2002:a5d:5109:0:b0:355:3b3:f1a3 with SMTP id
 ffacd0b85a97d-35dc0087de8mr1562001f8f.7.1717078338119; Thu, 30 May 2024
 07:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240528203044.612851-1-richard.henderson@linaro.org>
 <20240528203044.612851-11-richard.henderson@linaro.org>
In-Reply-To: <20240528203044.612851-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 15:12:07 +0100
Message-ID: <CAFEAcA8PMys3q3Cyq7Jay8-o1AO_kmCsqP=WLx+hXG_EhKhLeQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/33] target/arm: Convert SRSHL and URSHL (register)
 to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GcYWXNj4kA/v

On Tue, 28 May 2024 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
