Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp701396lfb;
        Wed, 13 May 2020 13:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOsQTyDMJ+nPoGkXp9O4jqkVo8sSXXqX+shoSqDMm7yd5EhUYzXS1WjrhVohf9rawiwFh9
X-Received: by 2002:ac8:2635:: with SMTP id u50mr927253qtu.73.1589401010998;
        Wed, 13 May 2020 13:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589401010; cv=none;
        d=google.com; s=arc-20160816;
        b=BNIRp4erUVakzKeZI6A7dWDt/qw30QyuPaGsAZ1ph7PV1Hf2QnS54oDDAqU2TWEL/x
         In1fEEAgvN2W0I5rUtadgjMMa//CD+qDof0DRp4D/PwlPSY0MyBrs+52hjonYDafJac+
         hNgCqiv8IjPPhBFRRCbP9K1CtYpdDtbeIZ02ib1xSDgAxhLIXMEyK3Lux0dIBKja99y6
         b1XF9LiuAg1Vef2lMOTaZ5HggRWnlmv1xRCAixjK2ym+U+D5opAhH9xbXpGyLTULLRPW
         bBylVwsyptkIMXU5MMTlXAwDBhHQZ+MtXZlsnxqlwoxD4wp3d5rrZ/722GD7P700NXV8
         mhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1SEnJQ4CL3sdUqYVFbM44AMy+9Dsjv3cUOHCJEA/e74=;
        b=m48JeqSmyxGoxIaRk8EvXs8wBc2sZ4b5YhXiMBrW81UHPY7aRUOIl0UNMKbGh0uiHQ
         ubqXGm+UfCesB551VnuFntW3XOhOHMvKC4LkOP6BYJqL6H+IzXrrhcT7WjVNjYF/7i1i
         4565yk/gClaAUwavG/0zUIfvl92ao5mQiOf6VuICvStYb9V1RRY4JisM5e1LWFx+K+x+
         PT7vy/C5tgBv+uqMPsW3bCoHzDo12bLHFA6zmGtEU6DHtrrxSo2RBnzmydtqeqOFP59S
         m96BIWt/sClYRusQGfWFyfGLiqE10ctig65+csKMFEyisv8cYAPyr9BM1CZaoA+JHioj
         ozzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WLuo/srn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si448205qtq.203.2020.05.13.13.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 13:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WLuo/srn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYxoA-0000dS-Ep
	for alex.bennee@linaro.org; Wed, 13 May 2020 16:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYxo2-0000aV-TQ
 for qemu-arm@nongnu.org; Wed, 13 May 2020 16:16:42 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYxo1-0002u1-Ls
 for qemu-arm@nongnu.org; Wed, 13 May 2020 16:16:42 -0400
Received: by mail-pg1-x541.google.com with SMTP id 9so245447pgr.3
 for <qemu-arm@nongnu.org>; Wed, 13 May 2020 13:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1SEnJQ4CL3sdUqYVFbM44AMy+9Dsjv3cUOHCJEA/e74=;
 b=WLuo/srnVwWzjf04tGKqxNduIGyhlTmOUf8+XTAff9dXGzPVS8H9k/ebcmjup5NP8s
 BCH2VfA5lXNUNELwW7miWXDHfxoUwxqwXNc4bg5V+S0AnbzdMZhp9+8zFXaxLoirmhf3
 2v6xCwHBbMgR+vXkH1oYXqM/KD3tivee5VB4Z2pJrAARiMkxerJ08CkeIhnyZ3NsvZyI
 EhpawpAlNDE4YTTDCf9CP8TNfAmpy/TIPkPhm9ncPfUn9CAuhCjNKY1b7XLzBlEou2oF
 wGdg19Tcr06YpMlFThrFwvzsQsbBp2Ns5ka8Rj9rC9X7i7xxT/MGYkrZTFAzX+SytwrK
 e3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1SEnJQ4CL3sdUqYVFbM44AMy+9Dsjv3cUOHCJEA/e74=;
 b=kTdUdyj0SV/oFnicSdlBSAn4zF3P7uFkJ2BrwpXHHK1ReFWmodvTb50B4nkHqHMEbv
 j8ZGndsUvFxSzpIJECFB44VSJoEekoxbgbh7SnKBet/F6YgFRmmHoaID/i3N+MWRYyqs
 DBcrRlZPwpmDA4FcCMtkC85EsbwJzTYeFoxP9GCN1TPm7K70UHcdZqWow+ndu/j+PDgw
 FgQK0G/t3y72Yn+nXhdVL5QHQ3kA1A4wUsiCOoFGFG3V/r661ovwoz4+KBRmNBs7qTdr
 d8oZyRobjisONabPbRHgBipjBBpmSLHi3T5DXAI1tsznwCHrxgKT9CjTMJ1lHUlIesGK
 UMYw==
X-Gm-Message-State: AOAM530U27EaQL1Etx93/LgDUXLDcw9Azq3NOhuMjFuU2KxwQle3OhLI
 I+GZawTD8SSIejEnbYIMCHa7/A==
X-Received: by 2002:a63:1a01:: with SMTP id a1mr890454pga.87.1589401000191;
 Wed, 13 May 2020 13:16:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x13sm343918pfq.154.2020.05.13.13.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 13:16:39 -0700 (PDT)
Subject: Re: [PATCH v2 15/17] target/arm: Move 'env' argument of recps_f32 and
 rsqrts_f32 helpers to usual place
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a77e791-70fe-531a-322f-09720317785d@linaro.org>
Date: Wed, 13 May 2020 13:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f2vjG52LyBWP

On 5/12/20 9:39 AM, Peter Maydell wrote:
> The usual location for the env argument in the argument list of a TCG helper
> is immediately after the return-value argument. recps_f32 and rsqrts_f32
> differ in that they put it at the end.
> 
> Move the env argument to its usual place; this will allow us to
> more easily use these helper functions with the gvec APIs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h     | 4 ++--
>  target/arm/translate.c  | 4 ++--
>  target/arm/vfp_helper.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
