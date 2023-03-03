Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1411111ejc;
        Fri, 3 Mar 2023 10:50:21 -0800 (PST)
X-Google-Smtp-Source: AK7set97//Lw3lgjutofcdq6m9JChE3LIEMn/gOw7XHsAg7B8g/3aX3RPXYjL4J7UPwhVqv88YXh
X-Received: by 2002:ad4:5dea:0:b0:53a:7253:4093 with SMTP id jn10-20020ad45dea000000b0053a72534093mr4607906qvb.14.1677869421050;
        Fri, 03 Mar 2023 10:50:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869421; cv=none;
        d=google.com; s=arc-20160816;
        b=km2Jj8T1oyuObqkchrJ2dF1Imsn1vDviNxsoZ8M/64gfIPTozmcWW1k4huN7VxA3I5
         YC9pWHvvChcP44rQEmbOy84wLe8TP10I+KLEjpRRHkDRuSwPVh/djqFrL2OI6HoEacYC
         dfumKNUMZaRc8oITkOF/QLUQ58NT+G7Kwot/p3ccsn3HOHaZA5whsRMNF87UV1ASQFVR
         EuDqecDePf+Bo+FU5+h/ABBYCnaZhrPKmg+2RKQ3IE6o9AL4v/1N3SzxK4yoEeDCoqPF
         0UfhWxvzXgA2yxo1Kzm3a2ccQANZDoQICAUDUpUV2d1It8+fRtt3+T4cD9+1o+dAr2dH
         zIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JMXMQWpbHwQR/8T8b/ZkNg7ZuKGeta3yefHrf8HK2kY=;
        b=tvjT4VYQ+oIfvMEWQewbo+hxDKg2suT8gcGReRxFVsrjHSBBv93yKTTmGkpsuJljmF
         gPdnlGZWuiNAGoRCKcGHomsyJ0LNMPSQE9adyjf9jK9/ZCicuPFL1gGDece6sgrBpvSq
         2g3a4iUqaSESGegncSluhtlYfEK4Q3YpyVcFfAvaGa5PuV6XyugWHAiguo3QwMIPaKXe
         f7osn5IZNdnT7/z+3cAob0yMpUTeAUiaNbGK/uhFOdoVO+mZUvj81SG5xj+g4o2wAmzJ
         o0qJxUHSsADUN9hX5ctibxl2cbzWNMBskkzAzzzcgNn7jYMh+U/4HIiTcaENGuwKiCIT
         d+vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zi3oonlc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a0cf40a000000b0056eb4f5a6c7si2067863qvl.382.2023.03.03.10.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:50:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zi3oonlc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYATc-0000JG-5N; Fri, 03 Mar 2023 13:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYATQ-0008RO-Pa
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:49:48 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYATO-0001x1-DS
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:49:44 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so3158214pja.5
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JMXMQWpbHwQR/8T8b/ZkNg7ZuKGeta3yefHrf8HK2kY=;
 b=Zi3oonlcqyi/jQysMJN93ra5NWvnw1kL4A/cYavudQir/EFE+nIUQEqB1aCu8KutRJ
 l5+bNEnuqZnAIFPKP4qYflLkTI/0abZriAQyQbHI+YiALOzgcHBvDBP9lD118ZDFE37f
 ZkCyYxtCYlTKCzKG+5C/+ubShoI3AJwG7MFjxTzmR124gbrkQGCDpO/Y57v4KlljgaxW
 ZiZCC53bzShOwJnvov5WVSmYCHpEKk3/yLtuZYIVFpuGUBm8Wp5yh/DdCSpBU6IQwUgN
 /Cl9CRIP6rV9r2AcSNQFuktF7T5ShqlU6QL9lCkXHLBW2G4dmuxNmGjMFGqVfwECrqQw
 OM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMXMQWpbHwQR/8T8b/ZkNg7ZuKGeta3yefHrf8HK2kY=;
 b=zVsd3eZ/+m8PuX/0XkHc4v9HU5hvOvuSt8ir7mOkU87raDPcx9pSjRmQeXLragtA6I
 H2t6CTbPzAzCp84815bEflOiXDHVoqSTqUAMvzjIObGxKtduPeJmArMgcM7+Lz0WxfWS
 py36bF4RkCGcOO5iTHO6LV5Ai0pC7dGcZepJupVB1rT+3xJgzfK1XCu+NkGfCW5pkE14
 E5onQWtBuCrV0dfwkiVpsPRWdyYwxnZU5TvgFCAAIPrlW8L4NySLepYE+GucuJ236U0B
 BaNNA2KURaZEECeHbApuAekwmyRHk98hgvW8tRQpSviafJ/O/LUCslJe22XKqr1rHyYd
 guMQ==
X-Gm-Message-State: AO0yUKUSG1PqyZVQJAkjgtxePwml8yQjcuF6qv6+QksHmCIbaep0Ok6/
 UfbvYYmolIRmKia0yy3DteBmAJ7CbfIHRmS7yBZoyg==
X-Received: by 2002:a17:90b:241:b0:237:ea76:41ed with SMTP id
 fz1-20020a17090b024100b00237ea7641edmr1009984pjb.0.1677869380983; Fri, 03 Mar
 2023 10:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-49-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:49:29 +0000
Message-ID: <CAFEAcA9dfv-HXvO8u8xNd06AkFOXosjPuzmuGiQyzTWQmE5B2g@mail.gmail.com>
Subject: Re: [PATCH v2 48/76] target/nios2: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: ERyfaStFQF28

On Mon, 27 Feb 2023 at 05:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
