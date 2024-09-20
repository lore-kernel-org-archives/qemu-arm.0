Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp657051njb;
        Fri, 20 Sep 2024 01:10:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHOS1zXIlgyOakr9L2NVS08CL+HwtRqX5rCjbyHn8hlsm/AbV4W82cEKTtEYDXqqcOktYmBKrfgu1yLg==@linaro.org
X-Google-Smtp-Source: AGHT+IEBrMM8RVUhJYnsWQQm6FP1dVRHF3OXKUlApX/W3BEzIga8KkOOiIRyQ7xCV4F9G1RywoCc
X-Received: by 2002:ac8:5a01:0:b0:458:3325:1 with SMTP id d75a77b69052e-45b20555501mr30292131cf.42.1726819844249;
        Fri, 20 Sep 2024 01:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726819844; cv=none;
        d=google.com; s=arc-20240605;
        b=GWN5dLQLOtjVYLw076y0k+7HdhJtLAS0kvzstI60bS6kajBM0QmSaR12D3rsl0moH+
         cSJFminaYtQ0BV/6CL8rPXRqFshNIiY4Ehn7zWQFc01Zct05kluWk9yTMxHRuLHPzvOQ
         sbyUB1Sl/CDTyg4QcK6rgI+gaPnl/+0Aost1LcXfOgC2edQrhutkXagK/l0GkkplvBLq
         R1jqT2rzrQAUTO27UGNMGtex5E/cFDEmTafOkM9OlgWepY76yR9JV3D8Op32dSjom+gD
         BgKodX5VGUtBhdcTkDeIJAv0/oSMJoJGtfFW8M8KjguIKTIm6SGRFWkDBotBkx/QNAhX
         pzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:cc:content-language:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6rjZHJd/Y2qAuD1jwBMX8+IRlC+eOI/FYBNNLqHxnuw=;
        fh=C9bxYZ6DvVvL9Jzc87wCFzd8xJlZCVzSoxr9puM0qGc=;
        b=b+Kw0LcPKoAUVZ4JURUoW8CDEJMZyuqmQZTcbmjiiBGPLYOcBBH9LZljqLKT8kGzjr
         JWnk7JPvlvCa2Gm5cT091vBjb2YWQUZwJFnG+v8xA9MEAMnL1WU2gNjU6N4iBC64UB86
         wIjwaUOMLFGTvbIBjsyMYpjLOLQvnc6CHMuujhRx7oGa/cMAnzPtgM2gYVvONU3tBn3m
         g+cDSpgbmugus2kTkZMMh1yrtbC56qavREalKkWZoj+ag3IYoSdLyH1ipnYXJLUAjqTY
         aUYmNVE6dqpS+oNBJZCYt8xzkDndGxc7jHEmEwCYeguA13WJ0OJIwSEqTyn/6/wDXiVV
         ZjBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RyWsnDXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b178ed2e7si34998411cf.323.2024.09.20.01.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 01:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RyWsnDXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1srYik-0007bl-Bq; Fri, 20 Sep 2024 04:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1srYij-0007Yw-6m
 for qemu-arm@nongnu.org; Fri, 20 Sep 2024 04:10:29 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1srYih-0004fS-Bk
 for qemu-arm@nongnu.org; Fri, 20 Sep 2024 04:10:28 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5365a9574b6so2820922e87.1
 for <qemu-arm@nongnu.org>; Fri, 20 Sep 2024 01:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726819824; x=1727424624; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:cc
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6rjZHJd/Y2qAuD1jwBMX8+IRlC+eOI/FYBNNLqHxnuw=;
 b=RyWsnDXZlKW33r8oJehge4O/3VXhpRar7B2WiiFzkmuGdMCL9u5El6b+pO9aa2PuoU
 9+rtOjFH6J/Zco2BpilEL9NNyMlb42BmsKEO+JqMzEdG9en9/t75PDVPD4mz3CAJY6rt
 iaQnn4+7Q46/2bkqoqBR6dCiD2+KQCG71FECmgo/65XcbTgkFofo7ZxEV/Bgc843Uqe6
 +L6jlL7Fwp6+t0Czmdm4FUbfF3NAk08ZsOUgzT3Ur9O3NO85Jb0gNV1w0deQQgvc6lwp
 S+PvgfOzOZq+Opr8F1wbE+3KpK1ByUKPtxLvIjZrWRmPYx7/uJzYgRuaVARzHgmFQSqX
 kN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726819824; x=1727424624;
 h=content-transfer-encoding:in-reply-to:organization:cc
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6rjZHJd/Y2qAuD1jwBMX8+IRlC+eOI/FYBNNLqHxnuw=;
 b=uJgjhf1EA6NtkB0+H3Xg3BPx/3n7D9n1WYgY/CoWhQhVZsYUqSbhpCw+MzKWmSbfpM
 3L5LYwNnj7JxGhwMgo5YG+BWhdCKP3cSVNQgWnOtVQl9FNMFMELGdlPUP/9CmcTriyEi
 rE3dqIeuj4AQkiw7w/e+foXYyMRUJIPJPj3alKRjLq2SL1wJJ9Szxm0GVSRDkpZLNiVy
 oPfbiEPV56z2DmVj4wA5lp5yX9uxLOUlcXnjJ6uQyjmCjxLQakIrjlzB5ljbPGVH9LPm
 9VSL0eK0Ks9jZjYGjrCJjoiNGXPOyyEKa+rE7tmRXL2q85HomTKoCh94v+PHO9Ijnukj
 afqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLO/2MiGfNuU/NU1Qm4fePR5qAjgp9R3KR/ztydd77iK78pzfUi5pGcZTh4TqukE27CDPx+nE+GA==@nongnu.org
X-Gm-Message-State: AOJu0YzG77J2Q/K9nUGumcxxlA3MZ6Rdc/eq6PWG7jn1tRD2nnYdH6+K
 SWdYzJLWrg2FOXbBDF2DuSgidJpO9brIpOxF36YqGtaEqgDcBPtEl5XhXrNsQHA=
X-Received: by 2002:a05:6512:130e:b0:535:3d15:e70e with SMTP id
 2adb3069b0e04-536ac32e4e4mr1452367e87.37.1726819823701; 
 Fri, 20 Sep 2024 01:10:23 -0700 (PDT)
Received: from [192.168.200.25] (83.11.24.101.ipv4.supernova.orange.pl.
 [83.11.24.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f43d2sm816304766b.87.2024.09.20.01.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Sep 2024 01:10:23 -0700 (PDT)
Message-ID: <10cfbfd3-6f7d-475e-b8b8-3cf8b031e66c@linaro.org>
Date: Fri, 20 Sep 2024 10:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Correct ID_AA64ISAR1_EL1 value for neoverse-v1
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240917161337.3012188-1-peter.maydell@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Cc: Michael Tokarev <mjt@tls.msk.ru>
Organization: Linaro
In-Reply-To: <20240917161337.3012188-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N5CpX9O1MwHS

W dniu 17.09.2024 o 18:13, Peter Maydell pisze:
> The Neoverse-V1 TRM is a bit confused about the layout of the
> ID_AA64ISAR1_EL1 register, and so its table 3-6 has the wrong value
> for this ID register.  Trust instead section 3.2.74's list of which
> fields are set.
> 
> This means that we stop incorrectly reporting FEAT_XS as present, and
> now report the presence of FEAT_BF16.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/cpu64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index b9f34f044d0..01689208286 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -677,7 +677,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>       cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
>       cpu->isar.id_aa64dfr1 = 0x00000000;
>       cpu->isar.id_aa64isar0 = 0x1011111110212120ull; /* with FEAT_RNG */
> -    cpu->isar.id_aa64isar1 = 0x0111000001211032ull;
> +    cpu->isar.id_aa64isar1 = 0x0011100001211032ull;
>       cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
>       cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
>       cpu->isar.id_aa64mmfr2 = 0x0220011102101011ull;

I think that it would nice to have it backported to stable branches. It 
applies to stable-8.1 and above.

In master it is 8676007eff04bb4e454bcdf92fab3f855bcc59b3 commit.
