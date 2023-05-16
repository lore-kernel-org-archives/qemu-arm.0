Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp632360ejq;
        Tue, 16 May 2023 12:32:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DhoRzG5tYh+z/oqL5NMFsGI70vGf64dmxsDAwIxywlHgvTBe7qaGXPmLNeWf8UEws6jWK
X-Received: by 2002:ac8:5785:0:b0:3f4:ec9f:95e4 with SMTP id v5-20020ac85785000000b003f4ec9f95e4mr34535678qta.6.1684265579448;
        Tue, 16 May 2023 12:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684265579; cv=none;
        d=google.com; s=arc-20160816;
        b=qB3q3nswc/tL6q1VmLpaCyT0jo8IHFUdSh1VCqgSJFIoBdNg2mQuLl9Nb9Jp2gCGmI
         EB60bpS8p2hzJHp75FdeVXbziL7eM1ifrc2g1S9nKO/eaylx2zJzdkCvmuaeeKKv15Cb
         7IzD/naNh3ZilQ9zNeV/L8owSs4d5b8TdiMkrnLMZjP3jIEQZVAF6kUunwtZmCC8wluw
         HoPv24XN2Lwu5rIoNf8D/RRokEXNaIqKp5GGIu2fZ1J+KVytnBRKSJ+CJxip6xlh+bXs
         p53ochbmQb7gkcSAiPSwslQWgSW11QmryRAphl8/6G05PAeNQU8JMthfwGlZmyrhL2j0
         zmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=8Qst3DAdo5q7c5FqBTsKayoqHXIJ0q8Ic+PRoQOb8qM=;
        b=kvP6m0idWBe8KlVU9G8eyJaBoo/EBtpyFTiHu0qQJOsZSNQWGf6vbg2URVsjRtTysY
         ImPhnJ4KoF6143a5NKkukaFGnurzr7dVPjEx3FfhHGhWsNVNa5JsBRw8LMM5ACydWW9z
         WTLmCd44YoxfNwdjmq6ZJU9aMnHqoWyBq5mkoXKgRSCOdUlLvA0OqTmKesxnRglKfqpd
         ldJil26duzU3CC6o9qNVsq9jBNXcbARASLHYeEpxboMtFpREUHBDUdJdwJG4xTg7pMHU
         ah0RO5dldKXzLmVOZQPO7dkjeqNgRS+80IDj5mPsiYQNQ80aNNjXaa3vMSo90bfYnoJa
         HQuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=6cKD+UIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14-20020a05622a050e00b003f0a9d4a5absi11235114qtx.727.2023.05.16.12.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 12:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=6cKD+UIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pz0Pg-0003zQ-Uw; Tue, 16 May 2023 15:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pz0PY-0003wf-Rb
 for qemu-arm@nongnu.org; Tue, 16 May 2023 15:32:42 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pz0PX-0000Y8-1b
 for qemu-arm@nongnu.org; Tue, 16 May 2023 15:32:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f42397f41fso1805e9.1
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 12:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684265556; x=1686857556;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8Qst3DAdo5q7c5FqBTsKayoqHXIJ0q8Ic+PRoQOb8qM=;
 b=6cKD+UIlceAifD5MbSTMVKNs+gDZE8/WoeXLnsKoVGADyn4wOMYbRUHeCQa9vjr7mO
 qo6ahGXzgdclJqypkQX3z7v/l0FbFpp1jGpej+6vkZCOXELampip5JLKYhlS93OIwCRP
 MaCbTBKs/SD9j1rcLpf974V2dy2ARMtgOg8dFnbpjZLCP46FI5Gqo4cRBw4wvHMDA87j
 C+h0PJJUxuzp6/CEqrE8wyXqmG8DcM+zyB7i3oxP2ZkTe0UDV6cv2eSv/m4CzHy0Alre
 qaXzjDIrjJrvi3aedYLpmYrbROw5obQ0vZ1MP3cvnNmUQcm+nPe7Mrq53dd+81ZCakNf
 zb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684265556; x=1686857556;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Qst3DAdo5q7c5FqBTsKayoqHXIJ0q8Ic+PRoQOb8qM=;
 b=Py6X1Lwt8AtKbb3f6VG3JQuGFIwkGAsJlOi+omih40lKHeKOJhWKpC+b0ll3bm0QjZ
 gsJ0H0I/DoOzWt+g/7vDtf4rrqFJ0G8biXiG77Zrj5MjXRuN1TXwP4UwAjUrehim+NhC
 lH6NRU9sjJ4ELzF7XPYpFKDvtWXO1EU6fnsPImCeO1PUQC4usoNiSPCNZL3NxSxN5+UH
 LTbWMd/JMck6hipMo1e0icBfguXoA50tfNcPPZUUEeGQIdV7VdGqhpubtlWZ0WmU3OxE
 M+gY6NOrtDuW/RvjRwbcHMl/6gXaxJAPianS2Jglb1uI1fK4a9KKRBreX0PYZ1WV+Tpc
 waZg==
X-Gm-Message-State: AC+VfDyg7FAKfSMCvifqv88XQq1o5k5DCg1Fq07XkRkqTb5x4bWFyK7c
 t48K1UZgKNpk0R0/kBMG0sLqOw==
X-Received: by 2002:a05:600c:1ca7:b0:3f1:73b8:b5fe with SMTP id
 k39-20020a05600c1ca700b003f173b8b5femr25286wms.3.1684265556422; 
 Tue, 16 May 2023 12:32:36 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 f10-20020a7bcd0a000000b003f080b2f9f4sm178036wmj.27.2023.05.16.12.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 12:32:35 -0700 (PDT)
Date: Tue, 16 May 2023 19:32:31 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v3 08/10] hw/arm/smmuv3: Add CMDs related to stage-2
Message-ID: <ZGPaT0F16kltcL9x@google.com>
References: <20230401104953.1325983-1-smostafa@google.com>
 <20230401104953.1325983-9-smostafa@google.com>
 <ee890a2b-946e-1a04-4f00-b7c60b31af76@redhat.com>
 <ZGJQdp5nVVEGlOzt@google.com>
 <3ffa498c-9702-e905-fcd9-9357ad9aee1c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ffa498c-9702-e905-fcd9-9357ad9aee1c@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=smostafa@google.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: azeYnooet5tb

On Tue, May 16, 2023 at 07:04:34PM +0200, Eric Auger wrote:
> >>> +            break;
> >>> +        case SMMU_CMD_TLBI_S12_VMALL:
> >>> +            uint16_t vmid = CMD_VMID(&cmd);
> >> I get
> >> ../hw/arm/smmuv3.c: In function ‘smmuv3_cmdq_consume’:
> >> ../hw/arm/smmuv3.c:1295:13: error: a label can only be part of a
> >> statement and a declaration is not a statement
> >>              uint16_t vmid = CMD_VMID(&cmd);
> >>
> >> you should put the case into a block.
> > Thanks for spotting this, I will fix it.
> > Can you please let me know your config/build commands?
> > as I didn't get errors when compiling it.
> I used a very basic config:
> 
> configure --target-list=aarch64-softmmu --enable-kvm
> --enable-trace-backends=log
Thanks Eric, this builds fine for me, it must be a toolchain thing then.

Thanks,
Mostafa
